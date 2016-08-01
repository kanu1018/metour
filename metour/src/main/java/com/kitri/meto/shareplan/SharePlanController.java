package com.kitri.meto.shareplan;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}


