package com.kitri.meto.reg;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kitri.meto.member.Member;
import com.kitri.meto.member.MemberDaoService;
import com.kitri.meto.metoo.Metoo;
import com.kitri.meto.shareplan.SharePlanService;

@Controller
public class RegController {
	@Resource(name="RegService")
	private RegService regService;
	
	public void setSharePlanService(RegService regService){
		this.regService = regService;
	}
	

	
}
