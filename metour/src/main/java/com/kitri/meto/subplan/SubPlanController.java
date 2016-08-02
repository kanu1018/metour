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
		
		//시간중복
		ArrayList<SubPlan> sub = subPlanService.getSubPlans(1);
		
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
				size = start_i - end_i + 1;
				for(int j = 0 ; j < size ; j++){
					index.add(end_i++);
				}
			}else{
				size = end_i - start_i + 1;
				for(int j = 0 ; j < size ; j++){
					index.add(start_i++);
				}
			}
		}
		
		//중복제거
		HashSet hs = new HashSet(index);
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
	
	@RequestMapping(value = "/subplan/list.do")
	public ModelAndView subPlanList(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("subplan/subPlanList");
		mav.addObject("list", subPlanService.getSubPlans(1)); 
		return mav;
	}
	
	@RequestMapping(value = "/subplan/listview.do")
	public ModelAndView subPlanList_detail(HttpServletRequest request, @RequestParam(value="sub_num")int subNum){
		SubPlan subplan = subPlanService.getSubPlan(subNum);
		
		ModelAndView mav = new ModelAndView("subplan/subPlanDetail");
		mav.addObject("subplan", subplan); 
		
		
		//시간중복
		ArrayList<SubPlan> sub = subPlanService.getSubPlans(1);
		
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
				size = start_i - end_i + 1;
				for(int j = 0 ; j < size ; j++){
					index.add(end_i++);
				}
			}else{
				size = end_i - start_i + 1;
				for(int j = 0 ; j < size ; j++){
					index.add(start_i++);
				}
			}
		}
		
		//중복제거
		HashSet hs = new HashSet(index);
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
		
		//현재시간은 띄우기
		SubPlan time = subPlanService.getSupPlanTime(subNum);
		String start_now = time.getStart_time();
		String end_now = time.getEnd_time();
		
		
		int start_i = getIndex(start_now.substring(2, 4), start_now.substring(3, 5), start_now.substring(0, 2));
		int end_i = getIndex(end_now.substring(2, 4), end_now.substring(5, 7), end_now.substring(0, 2));
		
		
		for(int i = start_i; i <= end_i; i++){
			flag.set(i, 1);
		}
		
		for(int i = 0; i < flag.size(); i++){
			System.out.println(i + ":" + flag.get(i));
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
