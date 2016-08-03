package com.kitri.meto.subplan;

import java.util.ArrayList;
import java.util.HashSet;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

@Controller
public class SubPlanController {
	@Resource(name="SubPlanService")
	private SubPlanService subPlanService;

	public void setSubPlanService(SubPlanService subPlanService) {
		this.subPlanService = subPlanService;
	}
	
	@RequestMapping(value = "/subplan/add.do")
	public ModelAndView subPlanAdd(){
		ModelAndView mav = new ModelAndView("subplan/subPlanAdd");
		
		ArrayList<SubPlan> sub = subPlanService.getSubPlans(1);
		ArrayList<Integer> flag = getFlag(sub);
		mav.addObject("index", flag);
		return mav;
	}
	
	public int getIndex(String hour, String min, String ampm){
		int index = 0;
		
		if(hour.equals("12")){
			index = 0;
		}else{
			index = Integer.parseInt(hour) * 2;
		}
		
		if(ampm.equals("오후")){
			index += 24;
		}
		
		if(min.equals("30")){
			index++;
		}
		
		return index;
		
	}
	
	public ArrayList<Integer> getFlag(ArrayList<SubPlan> sub){
		ArrayList<String> start = new ArrayList<String>();
		ArrayList<String> end = new ArrayList<String>();
		
		for(int i = 0; i < sub.size(); i++){
			start.add(sub.get(i).getStart_time());
			end.add(sub.get(i).getEnd_time());
		}
		
		ArrayList<Integer> index = new ArrayList<Integer>();
		
		for(int i = 0; i < start.size(); i++){
			int start_i = getIndex(start.get(i).substring(2, 4), start.get(i).substring(5, 7), start.get(i).substring(0, 2));
			int end_i = getIndex(end.get(i).substring(2, 4), end.get(i).substring(5, 7), end.get(i).substring(0, 2));
			
			int size = 0;
			if(start_i > end_i){
				size = start_i - end_i;
				for(int j = 0 ; j < size ; j++){
					index.add(end_i++);
				}
			}else{
				size = end_i - start_i;
				for(int j = 0 ; j < size ; j++){
					index.add(start_i++);
				}
			}
		}
		
		//중복제거
		HashSet<Integer> hs = new HashSet<Integer>(index);
		ArrayList<Integer> newindex = new ArrayList<Integer>(hs);
		
		ArrayList<Integer> flag = new ArrayList<Integer>(); 
		for(int i = 0; i < 48; i++){
			int tmp = 1;
			for(int j = 0; j < newindex.size(); j++){
				if(i == newindex.get(j)){
					tmp = 0;
				}
			}
			
			flag.add(tmp);
			tmp = 1;
		}
		return flag;
	}
	
	@RequestMapping(value = "/subplan/list.do")
	public ModelAndView subPlanList(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("subplan/subPlanList");
		ArrayList<SubPlan> sub = subPlanService.getSubPlans(1);
		
		ArrayList<String> time = getTime();
		mav.addObject("time", time);
		
		ArrayList<SubPlanList> title = getTitlebyTime(sub);
		mav.addObject("splist", title);
		return mav;
	}
	
	public ArrayList<String> getTime(){
		ArrayList<String> time = new ArrayList<String>();
		
		int hour = 0;
		boolean sw = true;
		for(int i = 0; i < 48; i++){
			String tmp = null;
			if(hour <= 9){
				tmp = "0";
			}else{
				tmp = "";
			}
			tmp += hour + ":30";
			
			if(sw){
				sw = false;
				String add = null;
				if(hour <= 9){
					add = "0";
				}else{
					add = "";
				}
				
				add += hour + ":00~" + tmp;
				time.add(add);
			}else{
				sw = true;
				hour++;
				String add = tmp + "~";
				
				if(hour <= 9){
					add += "0";
				}else{
					add += "";
				}
				
				add += hour + ":00";
				
				time.add(add);
			}
		}
		
		return time;
	}
	
	public ArrayList<SubPlanList> getTitlebyTime(ArrayList<SubPlan> sub){
		ArrayList<String> start = new ArrayList<String>();
		ArrayList<String> end = new ArrayList<String>();
		
		for(int i = 0; i < sub.size(); i++){
			start.add(sub.get(i).getStart_time());
			end.add(sub.get(i).getEnd_time());
		}
		
		String start_now[] = new String[sub.size()];
		String end_now[] = new String[sub.size()];
		for(int i = 0; i < sub.size(); i++){
			SubPlan time = subPlanService.getSupPlanTime(sub.get(i).getSub_num());
			start_now[i] = time.getStart_time();
			end_now[i] = time.getEnd_time();
		}
		
		ArrayList<SubPlanList> title = new ArrayList<SubPlanList>();
		for(int i = 0; i < 48; i++){
			SubPlanList sp = new SubPlanList(0,"","","","");
			title.add(sp);
		}
		
		for(int j = 0; j < start_now.length; j++){
			int start_i = getIndex(start_now[j].substring(2, 4), start_now[j].substring(3, 5), start_now[j].substring(0, 2));
			int end_i = getIndex(end_now[j].substring(2, 4), end_now[j].substring(5, 7), end_now[j].substring(0, 2));
			for(int i = start_i; i < end_i; i++){
				SubPlanList sp = new SubPlanList();
				sp.setSub_num(sub.get(j).getSub_num());
				sp.setTitle(sub.get(j).getSub_title());
				sp.setPlace(sub.get(j).getPlace());
				sp.setMission(sub.get(j).getMission());
				sp.setMission_yn(sub.get(j).getMission_yn());
				title.set(i, sp);
			}
		}
		
		return title;
		
	}
	@RequestMapping(value = "/subplan/listview.do")
	public ModelAndView subPlanList_detail(HttpServletRequest request, @RequestParam(value="sub_num")int subNum){
		SubPlan subplan = subPlanService.getSubPlan(subNum);
		
		ModelAndView mav = new ModelAndView("subplan/subPlanDetail");
		mav.addObject("subplan", subplan); 
		ArrayList<SubPlan> sub = subPlanService.getSubPlans(1);
		ArrayList<Integer> flag = getFlag(sub);
		
		//현재시간은 띄우기
		SubPlan time = subPlanService.getSupPlanTime(subNum);
		String start_now = time.getStart_time();
		String end_now = time.getEnd_time();
		
		
		int start_i = getIndex(start_now.substring(2, 4), start_now.substring(3, 5), start_now.substring(0, 2));
		int end_i = getIndex(end_now.substring(2, 4), end_now.substring(5, 7), end_now.substring(0, 2));
		
		
		for(int i = start_i; i <= end_i; i++){
			flag.set(i, 1);
		}
		
		mav.addObject("index", flag);
		return mav;
	}
	
	@RequestMapping(value = "/subplan/addok.do")
	public String addok(HttpServletRequest request, SubPlan sp){
		subPlanService.addSubPlan(sp);
		
		return "redirect:/subplan/list.do";
	}
	
	@RequestMapping(value = "/subplan/edit.do")
	public String subPlanEdit(HttpServletRequest request, SubPlan sp){
		subPlanService.editSubPlan(sp);
		return "redirect:/subplan/list.do";
	}
	
	@RequestMapping(value = "/subplan/del.do")
	public String subPlanDel(HttpServletRequest request, @RequestParam(value="subnum")int subNum){
		subPlanService.delSubPlan(subNum);
		return "redirect:/subplan/list.do";
	}
	
	@RequestMapping(value="/subplan/place.do")
	public String form1(){
		return "map/place";
	}
	
	@RequestMapping(value="/subplan/recom.do")
	public ModelAndView idCheck(@RequestParam(value="lag")String lag, @RequestParam(value="lat")String lat){
		
		ModelAndView mav = new ModelAndView("map/infomation");
		ArrayList<DataVO> pubList = new ArrayList<DataVO>();
		//XML �����͸� ȣ���� URL
		/*String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?"+
				 "ServiceKey=%2BzkCsJG8T4Mc408ug306EphfPVrmOHMSC9eY52USE%2BzMmV4OZ4%2Fzpzlqh220vkBb9fJAE1am%2B0LtDr%2FAzs2UIA%3D%3D"+
				 "&mapX=126.87421982981459&mapY=37.50923390021668&radius=1000&pageNo=1&numOfRows=10&listYN=Y&arrange=A&MobileOS=ETC&MobileApp=AppTesting";*/
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?"+
			"ServiceKey=%2BzkCsJG8T4Mc408ug306EphfPVrmOHMSC9eY52USE%2BzMmV4OZ4%2Fzpzlqh220vkBb9fJAE1am%2B0LtDr%2FAzs2UIA%3D%3D"+
			"&mapX="+lag+"&mapY="+lat+"&radius=1000&pageNo=1&numOfRows=30&listYN=Y&arrange=A&MobileOS=ETC&MobileApp=AppTesting";
		//System.out.println(url);
		//URL�� �Ķ���ͷ� 'size' �׸��� �����ϴ��� üũ
		//String size = request.getParameter("size");
		
		//size �Ķ���Ͱ� null�� �ƴϰ�, 0�� �ƴҰ�쿡�� URL�� �߰�, size�׸��� ������ �Խù��� ������ �ǹ���.
		/*if(size != null && !"0".equals(size)){
			url += "?size=" + size;
		}*/
		
		//�����������ϵ� XML�������� ������Ʈ �̸� �迭 
		String[] fieldNames ={"title","addr1", "addr2", "areacode", "contentid", "contenttypeid", "dist", "mapx", "mapy"};
		
		//�� �Խù��ϳ��� �ش��ϴ� XML ��带 ���� ����Ʈ
		
		
		try {
			//XML�Ľ� �غ�
			DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
			DocumentBuilder b = f.newDocumentBuilder();
			//������ ������ URL�� ���� XMl �Ľ� ����
			Document doc = b.parse(url);
			doc.getDocumentElement().normalize();
			
			//�������� ������ XML�����͸� publication(���๮�� 1�� �ش�)�±׷� ���� ����(�Ķ���ͷ� ��û�� size�׸��� ����ŭ)
			NodeList items = doc.getElementsByTagName("item");
			
			//for ��������
			for (int i = 0; i < items.getLength(); i++) {
				//i��° publication �±׸� �����ͼ�
				Node n = items.item(i);
				//���Ÿ���� üũ��, ��� Ÿ���� ������Ʈ�� �ƴҰ�쿡�� ����
				if (n.getNodeType() != Node.ELEMENT_NODE)
					continue;
				
				Element e = (Element) n;
				DataVO pub = new DataVO();
				//for ���� ����
				int j=0;
				for(String name : fieldNames){
					//"id", "title", "userName", "recommendId", "recommendName", "recommendDate", "url"�� �ش��ϴ� ���� XML ��忡�� ������
					NodeList titleList = e.getElementsByTagName(name);
					Element titleElem = (Element) titleList.item(0);
		
					Node titleNode = titleElem.getChildNodes().item(0);
					System.out.println(j++);
					// ������ XML ���� �ʿ� ������Ʈ �̸� - �� ������ ����
					//pub.put(name, titleNode.getNodeValue());
					if(name.equals("addr1")){
						pub.setAddr1(titleNode.getNodeValue());
					} else if(name.equals("addr2")){
						pub.setAddr2(titleNode.getNodeValue());
					} else if(name.equals("areacode")){
						pub.setAreacode(titleNode.getNodeValue());
					} else if(name.equals("contentid")){
						pub.setContentid(titleNode.getNodeValue());
					} else if(name.equals("contenttypeid")){
						pub.setContenttypeid(titleNode.getNodeValue());
					} else if(name.equals("dist")){
						pub.setDist(titleNode.getNodeValue());
					} else if(name.equals("mapx")){
						pub.setMapx(titleNode.getNodeValue());
					} else if(name.equals("mapy")){
						pub.setMapy(titleNode.getNodeValue());
					} else if(name.equals("title")){
						pub.setTitle(titleNode.getNodeValue());
					}
				}
				//�����Ͱ� ���� �� ���� ����Ʈ�� �ְ� ȭ�鿡 �Ѹ� �غ�.
				pubList.add(pub);
			}
			} catch (Exception e) {
				//e.printStackTrace();
		}
		if (!url.equals("")) {
			mav.addObject("pubList", pubList);
		}
		return mav;
	}
}
