package com.kitri.meto.andCont;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kitri.meto.member.Member;
import com.kitri.meto.member.MemberDaoService;
import com.kitri.meto.singo.Singo;
import com.kitri.meto.singo.SingoService;

@Controller
public class AndSingoController {
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
	
	
	@RequestMapping("/and/singo/popup.do")
	public String popUp(){
		return "/singo/singoinsert";
	}
	
	@RequestMapping(value = "/and/singo/add.do")
	public String singoAdd(@RequestParam(value="mem_num") int mem_num, @RequestParam(value="singo_kind") String singo_kind,
			 @RequestParam(value="share_num") int share_num, @RequestParam(value="singo_content") String singo_content){
		System.out.println("신고");
		System.out.println(share_num);
		System.out.println(singo_kind);
		
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
