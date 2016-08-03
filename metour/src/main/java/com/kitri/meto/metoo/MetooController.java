package com.kitri.meto.metoo;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MetooController {
	@Resource(name="MetooService")
	private MetooService metooService;
	
	public void setSharePlanService(MetooService metooService){
		this.metooService = metooService;
	}
	
	@RequestMapping(value="/metoo/select.do")
	public ModelAndView shareList(){
		ModelAndView mav = new ModelAndView("shareplan/sharelist");
		//ArrayList<SharePlan> list = shareService.getSharePlanAll();
		//mav.addObject("list", list);
		return mav;
	}
}
