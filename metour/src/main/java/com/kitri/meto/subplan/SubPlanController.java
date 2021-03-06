package com.kitri.meto.subplan;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

import com.kitri.meto.member.Member;
import com.kitri.meto.member.MemberDaoService;
import com.kitri.meto.point.Point;
import com.kitri.meto.point.PointService;
import com.kitri.meto.schedule.Schedule;
import com.kitri.meto.schedule.scheduleService;

@Controller
public class SubPlanController {
	@Resource(name="SubPlanService")
	private SubPlanService subPlanService;

	public void setSubPlanService(SubPlanService subPlanService) {
		this.subPlanService = subPlanService;
	}
	@Resource(name="MemberService")
	private MemberDaoService memberService;

	public void setMemberService(MemberDaoService memberService) {
		this.memberService = memberService;
	}
	
	@Resource(name="scheduleSerivce")
	private scheduleService scheduleService;
	
	public void setScheduleService(scheduleService scheduleService){
		this.scheduleService = scheduleService;
	}
	
	@Resource(name="PointService")
	private PointService pointService;
	
	public void setPointService(PointService pointService){
		this.pointService = pointService;
	}
	
	
	
	@RequestMapping(value = "/subplan/add.do")
	public ModelAndView subPlanAdd(HttpServletRequest request, @RequestParam(value="main_num")int main_num){
		ModelAndView mav = new ModelAndView("subplan/subPlanAdd");
		ArrayList<SubPlan> sub = subPlanService.getSubPlans(main_num);
		ArrayList<Integer> flag = getFlag(sub);
		mav.addObject("subplan",sub);
		mav.addObject("main_num",main_num);
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
				for(int j = 0 ; j <= size ; j++){
					index.add(end_i++);
				}
			}else{
				size = end_i - start_i;
				for(int j = 0 ; j <= size ; j++){
					index.add(start_i++);
				}
			}
		}
		
		//以묐났�젣嫄�
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
	public ModelAndView subPlanList(HttpServletRequest request, @RequestParam(value="main_num")int main_num){
		ModelAndView mav = new ModelAndView("subplan/subPlanList");
		ArrayList<SubPlan> sub = subPlanService.getSubPlans(main_num);
		
		ArrayList<String> time = getTime();
		
		ArrayList<SubPlanList> title = getTitlebyTime(sub);
		
		for(int i = 0; i < title.size(); i++){
			title.get(i).setTime(time.get(i));
		}
		
		mav.addObject("splist", title);
		mav.addObject("main_num", main_num);
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
			SubPlanList sp = new SubPlanList(0,"","","","", 0);
			title.add(sp);
		}
		
		for(int j = 0; j < start_now.length; j++){
			System.out.println(start_now[j].substring(2, 4) +  start_now[j].substring(5, 7) +  start_now[j].substring(0, 2));
			int start_i = getIndex(start_now[j].substring(2, 4), start_now[j].substring(5, 7), start_now[j].substring(0, 2));
			int end_i = getIndex(end_now[j].substring(2, 4), end_now[j].substring(5, 7), end_now[j].substring(0, 2));
			
			/*SubPlanList sp = new SubPlanList();
			sp.setSub_num(sub.get(j).getSub_num());
			sp.setTitle(sub.get(j).getSub_title());
			sp.setPlace(sub.get(j).getPlace());
			sp.setMission(sub.get(j).getMission());
			sp.setMission_yn(sub.get(j).getMission_yn());
			*/
			
			//title.set(start_i+1, sp);
			//title.set(start_i+1, sp);
			for(int i = start_i; i < end_i; i++){
				System.out.println(i + ":" + start_i);
				SubPlanList sp = new SubPlanList();
				sp.setSub_num(sub.get(j).getSub_num());
				sp.setTitle(sub.get(j).getSub_title());
				sp.setPlace(sub.get(j).getPlace());
				sp.setMission(sub.get(j).getMission());
				sp.setMission_yn(sub.get(j).getMission_yn());
				int row = 0;
				for(int k = start_i; k < end_i; k++){
					row++;
				}
				
				sp.setRow(row);
				title.set(i, sp);
			}
		}
		return title;
		
	}
	@RequestMapping(value = "/subplan/listview.do")
	public ModelAndView subPlanList_detail(HttpServletRequest request, @RequestParam(value="sub_num")int subNum){
		SubPlan subplan = subPlanService.getSubPlan(subNum);
		System.out.println("야 좌표 " + subplan.getLlh_x());
		ModelAndView mav = new ModelAndView("subplan/subPlanDetail");
		mav.addObject("subplan", subplan); 
		mav.addObject("photo",subplan.getPhoto());
		ArrayList<SubPlan> sub = subPlanService.getSubPlans(subplan.getMain_num());
		ArrayList<Integer> flag = getFlag(sub);
		
		//�쁽�옱�떆媛꾩� �쓣�슦湲�
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
		int main_num = Integer.parseInt(request.getParameter("main_num").toString());
		
		return "redirect:/subplan/list.do?main_num="+main_num;
	}
	
	@RequestMapping(value = "/subplan/edit.do")
	public String subPlanEdit(HttpServletRequest request, SubPlan sp){
		String fileName = sp.getImgfile().getOriginalFilename();
		if(!fileName.equals("")){
		ServletContext sc = request.getSession().getServletContext();
		String root = sc.getRealPath("/");
		root+="img\\"+fileName;
		File f = new File(root);
		try {
			sp.getImgfile().transferTo(f);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sp.setPhoto("http://"+request.getLocalAddr()+":"+request.getLocalPort()+request.getContextPath()+"/img/"+fileName);
		sp.setSub_num(sp.getSub_num());
		subPlanService.updatePhoto(sp);
		}else{
			sp.setPhoto("");
		}
		System.out.println("야이 저먕러ㅗㅜ먀ㅐㄴ훌" + sp.getLlh_x());
		
		subPlanService.editSubPlan(sp);
		return "redirect:/subplan/list.do?main_num="+sp.getMain_num();
	}
	
	@RequestMapping(value = "/subplan/del.do")
	public String subPlanDel(HttpServletRequest request, @RequestParam(value="subnum")int subNum,
			@RequestParam(value="mainnum")int mainNum){
		subPlanService.delSubPlan(subNum);
		
		return "redirect:/subplan/list.do?main_num="+mainNum;
	}
	
	@RequestMapping(value="/subplan/place.do")
	public String form1(){
		return "map/place";
	}
	
	@RequestMapping(value="/subplan/recom.do")
	public ModelAndView idCheck(@RequestParam(value="lag")String lag, @RequestParam(value="lat")String lat){
		
		ModelAndView mav = new ModelAndView("map/infomation");
		ArrayList<DataVO> pubList = new ArrayList<DataVO>();
		//XML 占쏙옙占쏙옙占싶몌옙 호占쏙옙占쏙옙 URL
		/*String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?"+
				 "ServiceKey=%2BzkCsJG8T4Mc408ug306EphfPVrmOHMSC9eY52USE%2BzMmV4OZ4%2Fzpzlqh220vkBb9fJAE1am%2B0LtDr%2FAzs2UIA%3D%3D"+
				 "&mapX=126.87421982981459&mapY=37.50923390021668&radius=1000&pageNo=1&numOfRows=10&listYN=Y&arrange=A&MobileOS=ETC&MobileApp=AppTesting";*/
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?"+
			"ServiceKey=%2BzkCsJG8T4Mc408ug306EphfPVrmOHMSC9eY52USE%2BzMmV4OZ4%2Fzpzlqh220vkBb9fJAE1am%2B0LtDr%2FAzs2UIA%3D%3D"+
			"&mapX="+lag+"&mapY="+lat+"&radius=1000&pageNo=1&numOfRows=30&listYN=Y&arrange=A&MobileOS=ETC&MobileApp=AppTesting";
		//System.out.println(url);
		//URL占쏙옙 占식띰옙占쏙옙庫占� 'size' 占쌓몌옙占쏙옙 占쏙옙占쏙옙占싹댐옙占쏙옙 체크
		//String size = request.getParameter("size");
		
		//size 占식띰옙占쏙옙叩占� null占쏙옙 占싣니곤옙, 0占쏙옙 占싣닐곤옙荑∽옙占� URL占쏙옙 占쌩곤옙, size占쌓몌옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쌉시뱄옙占쏙옙 占쏙옙占쏙옙占쏙옙 占실뱄옙占쏙옙.
		/*if(size != null && !"0".equals(size)){
			url += "?size=" + size;
		}*/
		
		//占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占싹듸옙 XML占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙트 占싱몌옙 占썼열 
		String[] fieldNames ={"title","addr1", "addr2", "areacode", "contentid", "contenttypeid", "dist", "mapx", "mapy"};
		
		//占쏙옙 占쌉시뱄옙占싹놂옙占쏙옙 占쌔댐옙占싹댐옙 XML 占쏙옙躍� 占쏙옙占쏙옙 占쏙옙占쏙옙트
		
		
		try {
			//XML占식쏙옙 占쌔븝옙
			DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
			DocumentBuilder b = f.newDocumentBuilder();
			//占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 URL占쏙옙 占쏙옙占쏙옙 XMl 占식쏙옙 占쏙옙占쏙옙
			Document doc = b.parse(url);
			doc.getDocumentElement().normalize();
			
			//占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 XML占쏙옙占쏙옙占싶몌옙 publication(占쏙옙占썅문占쏙옙 1占쏙옙 占쌔댐옙)占승그뤄옙 占쏙옙占쏙옙 占쏙옙占쏙옙(占식띰옙占쏙옙庫占� 占쏙옙청占쏙옙 size占쌓몌옙占쏙옙 占쏙옙占쏙옙큼)
			NodeList items = doc.getElementsByTagName("item");
			
			//for 占쏙옙占쏙옙占쏙옙占쏙옙
			for (int i = 0; i < items.getLength(); i++) {
				//i占쏙옙째 publication 占승그몌옙 占쏙옙占쏙옙占싶쇽옙
				Node n = items.item(i);
				//占쏙옙占신몌옙占쏙옙占� 체크占쏙옙, 占쏙옙占� 타占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙트占쏙옙 占싣닐곤옙荑∽옙占� 占쏙옙占쏙옙
				if (n.getNodeType() != Node.ELEMENT_NODE)
					continue;
				
				Element e = (Element) n;
				DataVO pub = new DataVO();
				//for 占쏙옙占쏙옙 占쏙옙占쏙옙
				int j=0;
				for(String name : fieldNames){
					//"id", "title", "userName", "recommendId", "recommendName", "recommendDate", "url"占쏙옙 占쌔댐옙占싹댐옙 占쏙옙占쏙옙 XML 占쏙옙恙∽옙占� 占쏙옙占쏙옙占쏙옙
					NodeList titleList = e.getElementsByTagName(name);
					Element titleElem = (Element) titleList.item(0);
		
					Node titleNode = titleElem.getChildNodes().item(0);
					System.out.println(j++);
					// 占쏙옙占쏙옙占쏙옙 XML 占쏙옙占쏙옙 占십울옙 占쏙옙占쏙옙占쏙옙트 占싱몌옙 - 占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
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
				//占쏙옙占쏙옙占싶곤옙 占쏙옙占쏙옙 占쏙옙載� 占쏙옙占쏙옙 占쏙옙占쏙옙트占쏙옙 占쌍곤옙 화占썽에 占싼몌옙 占쌔븝옙.
				if(!pub.getContenttypeid().equals("38") && !pub.getContenttypeid().equals("39")){
					System.out.print(pub.getContenttypeid());
					pubList.add(pub);
				}
			}
			} catch (Exception e) {
				//e.printStackTrace();
		}
		if (!url.equals("")) {
			mav.addObject("pubList", pubList);
		}
		return mav;
	}
	
	@RequestMapping(value = "/subplan/addphoto.do")
	public String addphoto(HttpServletRequest request,@RequestParam(value="sub_num")int subNum){
		request.setAttribute("sub_num", subNum);
		System.out.println("addphoto 컨트롤러 탐");
		SubPlan sp = new SubPlan();
		sp = subPlanService.getSubPlan(subNum);
		request.setAttribute("photo", sp.getPhoto());
		return "subplan/addPhoto";
	}
	
	
		@RequestMapping(value = "/subplan/addphoto_ok.do")
	public String addphoto_ok(HttpServletRequest request,SubPlan subplan,@RequestParam(value="sub_num")int subNum){
		String fileName = subplan.getImgfile().getOriginalFilename();
		ServletContext sc = request.getSession().getServletContext();
		String root = sc.getRealPath("/");
		root+="img\\"+fileName;
		File f = new File(root);
		try {
			System.out.println(subplan.getImgfile());
			subplan.getImgfile().transferTo(f);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		subplan.setPhoto("http://"+request.getLocalAddr()+":"+request.getLocalPort()+request.getContextPath()+"/img/"+fileName);
		subplan.setSub_num(subNum);
		subPlanService.updatePhoto(subplan);
		
		SubPlan sp = subPlanService.getSubPlan(subNum);
		System.out.println("안녕 서브넘버야?"+sp.getMission_yn());
	
		if(sp.getMission_yn().equals("0")){
			sp.setMission_yn("1");
		}else if(sp.getMission_yn().equals("2")){
			sp.setMission_yn("3");
		}
		subPlanService.editSubPlanByYN(sp);
		
		
		SubPlan sub = subPlanService.getSubPlan(subNum);
		
		return "redirect:/subplan/list.do?main_num="+sub.getMain_num();
	}

	////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/subplan/combination.do")
	public ModelAndView combination(HttpServletRequest req, @RequestParam(value="main_num")String main_num) {
		// 세션 id, mem_num 받아오기
		ModelAndView mav = new ModelAndView("/shareplan/share_combination");
		HttpSession session = req.getSession();
		String id = session.getAttribute("id").toString();
		Member m = memberService.getMember(id);
		
		String[] num = main_num.split("/");
		int[] main_nums = new int[num.length];
		
		//mainPlan point_num 가져오기
		ArrayList<Schedule> ss;
		int[] point_num = new int[main_nums.length];
		for(int i = 0; i<num.length; i++){
			main_nums[i] = Integer.parseInt(num[i]);
			Schedule s = scheduleService.getByTitle(main_nums[i]);
			point_num[i] = s.getPoint_num();
			System.out.println("point_num:" + point_num[i]);
		}
		
		/*ArrayList<ArrayList<SubPlan>> sublist = new ArrayList<ArrayList<SubPlan>>();
		// sublist에누적
		for(int i=0;i<num.length;i++){
			main_nums[i] = Integer.parseInt(num[i]);
			ArrayList<SubPlan> list = new ArrayList<SubPlan>();
			list = subPlanService.getSubPlans(main_nums[i]);
			sublist.add(list);
		}*/
		for(int i=0;i<num.length;i++){
			System.out.println(num[i]);
		}
		String place="";
		ArrayList<SubPlans> sublist = new ArrayList<SubPlans>();
		System.out.println("사이즈 = "+sublist.size());
		
		for(int i=0;i<num.length;i++){
			main_nums[i] = Integer.parseInt(num[i]);
			SubPlans list = new SubPlans();
			list.setList(subPlanService.getSubPlans(main_nums[i]));
			Schedule sche = scheduleService.getByTitle(main_nums[i]);
			list.setMain_title(sche.getMain_title());
			list.setDate(sche.getMain_date());
			list.setMain_num(sche.getMain_num());
			sublist.add(list);
			ArrayList<SubPlan> s;
			s = subPlanService.getSubPlans(main_nums[i]);
			if(s.size()!=0){
				for(int j=0;j<s.size();j++){
					place += s.get(j).getPlace()+"/";
				}
				if(i==num.length-1){
					place = place.substring(0,place.length()-1);
				}
			}
		}
		System.out.println(place);
		
		//점수 더하기
		//subPlan 리스트
		ArrayList<SubPlan> slist = new ArrayList<SubPlan>();
		for(int i = 0; i<num.length ; i++){
			slist = subPlanService.getSubPlanByMain(main_nums[i]);
		}
		
		int tmp = 0;
		for(int i = 0; i< slist.size(); i++){
			String yn = slist.get(i).getMission_yn();
			if(yn.equals("0")){
				//실패, 0
				tmp += 0;
			} else if (yn.equals("1")){
				//사진, 20
				tmp += 20;
			} else if (yn.equals("2")){
				//위치, 10
				tmp += 10;
			} else if (yn.equals("3")){
				//둘다, 30
				tmp += 30;
			}
		}
		System.out.println("점수"+tmp);
	
		ArrayList<SubPlan> splist = new ArrayList<SubPlan>();
		ArrayList<SubPlan> sp = new ArrayList<SubPlan>();
		for(int i=0;i<num.length;i++){
			sp = subPlanService.getSubPlans(main_nums[i]);
			for(int j=0;j<sp.size();j++){
				SubPlan s = null;
				s = sp.get(j);
				splist.add(s);
			}
		}
		String photo = "";
		for(int i=0;i<splist.size();i++){
			if(splist.get(i).getPhoto()!=null){
				photo = splist.get(i).getPhoto();
				break;
			}
		}
		//ArrayList<SubPlan> sublist = new ArrayList<SubPlan>();
		//sublist = subPlanService.getSubPlans(main_num);
		if(!photo.equals("")){
			mav.addObject("photo",photo);
		}
		mav.addObject("location",place);
		mav.addObject("main_num",main_nums[0]);
		mav.addObject("item",sublist);
		mav.addObject("point", tmp);
		System.out.println("마지막까지실행되었다.");
		return mav;
	}
	
	
	/////////////////////////////////////////////////////////////////////////////
}
