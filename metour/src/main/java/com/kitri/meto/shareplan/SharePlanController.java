package com.kitri.meto.shareplan;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SharePlanController {
	@Resource(name="SharePlanService")
	private SharePlanService shareService;
	
	public void setSharePlanService(SharePlanService shareService){
		this.shareService = shareService;
	}
	
	@RequestMapping(value = "/share/share.do")
	public String share(){
		return "/shareplan/share";
	}
	
	@RequestMapping(value = "/share/add.do")
	public String shareAdd(SharePlan s, @RequestParam(value="content") String content){
		s.setWriter(1); //수정:세션
		s.setContent(content);
		s.setPoint_num(1); //수정:jsp
		shareService.addSharePlan(s);
		System.out.println("성공");
		return "redirect:/share/list.do";
	}
	
	@RequestMapping(value="/share/list.do")
	public ModelAndView shareList(){
		ModelAndView mav = new ModelAndView("shareplan/sharelist");
		ArrayList<SharePlan> list = shareService.getSharePlanAll();
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value="/share/view.do")
	public ModelAndView shareView(@RequestParam(value="share_num") int share_num){
		ModelAndView mav = new ModelAndView("shareplan/shareview");
		SharePlan s = shareService.getSharePlan(share_num);
		mav.addObject("s", s);
		return mav;
	}
}


