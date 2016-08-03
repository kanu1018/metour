package com.kitri.meto.mainsub;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.meto.JoinDTO.JoinDTO;

@Controller
public class MainSubPlanController {
	@Resource(name="MainSubPlanService")
	private MainSubPlanService msService;
	
	public void setMainSubPlanService(MainSubPlanService msService){
		this.msService = msService;
	}
	
	@RequestMapping(value="/ms/select.do")//사진불러오기
	public ModelAndView msList(@RequestParam(value="main_num") int main_num){
		ModelAndView mav = new ModelAndView("shareplan/share");
		JoinDTO j = msService.getMainPlan(main_num);
		ArrayList<JoinDTO> subList = msService.getMainSubPlanByMainNum(main_num);
		mav.addObject("j", j);
		mav.addObject("s", subList);
		return mav;
	}
}
