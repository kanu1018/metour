package com.kitri.meto.singo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kitri.meto.member.Member;
import com.kitri.meto.member.MemberDaoService;

@Controller
public class SingoController {
	@Resource(name="SingoService")
	private SingoService singoService;
	
	public void setSingoService(SingoService singoService){
		this.singoService = singoService;
	}
	
	@Resource(name="MemberService")
	private MemberDaoService memberService;

	public void setMemberService(MemberDaoService memberService) {
		this.memberService = memberService;
	}
	//@RequestParam(value="type") String type, @RequestParam(value="num") int num
	
	
	@RequestMapping("/singo/popup.do")
	public String popUp(){
		return "/singo/singoinsert";
	}
	
	@RequestMapping(value = "/singo/add.do")
	public String singoAdd(HttpServletRequest req, @RequestParam(value="singo_kind") String singo_kind,
			 @RequestParam(value="share_num") int share_num, @RequestParam(value="singo_content") String singo_content){
		System.out.println(share_num);
		System.out.println(singo_kind);
		//세션 id, mem_num 받아오기
		HttpSession session = req.getSession();
		String id = session.getAttribute("id").toString();
		Member m = memberService.getMember(id);
		int mem_num = m.getMem_num();
		
		Singo s = new Singo();
		s.setSingo_kind(singo_kind);
		s.setSingo_mem(mem_num);
		s.setContent_num(share_num);
		s.setSingo_content(singo_content);
		singoService.addSingo(s);
		
		System.out.println("신고");
		return null;
	}
	
}
