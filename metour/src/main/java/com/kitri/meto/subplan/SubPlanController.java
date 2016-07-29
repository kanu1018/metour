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
	
	@RequestMapping(value = "/subplan/list.do")
	public ModelAndView subPlanList(HttpServletRequest request, @RequestParam(value="mainPlanNum")int mainPlanNum){
		ModelAndView mav = new ModelAndView("subplan");
		mav.addObject("subplanlist", subPlanService.getSubPlans(MainPlanNum)); 
		return null;
	}
	
}
