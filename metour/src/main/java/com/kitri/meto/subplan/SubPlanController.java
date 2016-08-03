package com.kitri.meto.subplan;

import java.util.ArrayList;
import java.util.HashSet;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
}
