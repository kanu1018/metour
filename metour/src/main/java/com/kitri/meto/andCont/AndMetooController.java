package com.kitri.meto.andCont;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kitri.meto.member.Member;
import com.kitri.meto.member.MemberDaoService;
import com.kitri.meto.metoo.Metoo;
import com.kitri.meto.metoo.MetooService;
import com.kitri.meto.shareplan.SharePlanService;

@Controller
public class AndMetooController {
	@Resource(name="MetooService")
	private MetooService metooService;
	
	public void setSharePlanService(MetooService metooService){
		this.metooService = metooService;
	}
	
	@Resource(name="SharePlanService")
	private SharePlanService shareService;
	
	public void setSharePlanService(SharePlanService shareService){
		this.shareService = shareService;
	}
	
	@Resource(name="MemberService")
	private MemberDaoService memberService;

	public void setMemberService(MemberDaoService memberService) {
		this.memberService = memberService;
	}
	
	@RequestMapping(value = "/metoo/metoo.do")
	public String view(HttpServletRequest req, @RequestParam(value="share_num") int share_num, @RequestParam(value="type") int type){//세션받기
		System.out.println("metoo");
		//세션 id, mem_num 받아오기
		HttpSession session = req.getSession();
		String id = session.getAttribute("id").toString();
		Member m = memberService.getMember(id);
		System.out.println(m.getMem_num());
		
		Metoo me = new Metoo();
		me.setShare_num(share_num);
		me.setMem_num(m.getMem_num()); //세션받기

		if (type == 1){ // metoo_yn 'y' , metoo++
			metooService.editMetooY(me); // 세션받기
			shareService.metooPlue(share_num);
			System.out.println("metoo++");
		} else if (type == 2) { // metoo_yn 'n', metoo--
			metooService.editMetooN(me); // 세션받기
			shareService.metooMinus(share_num);
			System.out.println("metoo--");
		}
		
		return "redirect:/share/view.do?share_num="+share_num;
	}
}
