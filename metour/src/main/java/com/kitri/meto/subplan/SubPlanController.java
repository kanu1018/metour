package com.kitri.meto.subplan;

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
	public String subPlanAdd(){
		return "/subplan/subPlanAdd";
	}
	
	@RequestMapping(value = "/subplan/list.do")
	public ModelAndView subPlanList(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("subplan/subPlanList");
		mav.addObject("list", subPlanService.getSubPlans(1)); 
		return mav;
	}
	
	@RequestMapping(value = "/subplan/listview.do")
	public ModelAndView subPlanList_detail(HttpServletRequest request, @RequestParam(value="sub_num")int subNum){
		ModelAndView mav = new ModelAndView("subplan/subPlanDetail");
		mav.addObject("subplan", subPlanService.getSubPlan(subNum)); 
		return mav;
	}
	
	@RequestMapping(value = "/subplan/addok.do")
	public String addok(HttpServletRequest request, SubPlan sp, @RequestParam(value="start_ampm")String start_ampm, @RequestParam(value="end_ampm")String end_ampm){
		if(start_ampm.equals("am")){
			start_ampm = "오전";
		}else {
			start_ampm = "오후";
		}
		
		if(end_ampm.equals("am")){
			end_ampm = "오전";
		}else {
			end_ampm = "오후";
		}
		
		sp.setStart_time(start_ampm + sp.getStart_time());
		sp.setEnd_time(end_ampm + sp.getEnd_time());
		
		subPlanService.addSubPlan(sp);
		
		return "redirect:/subplan/list.do";
	}
	
}
