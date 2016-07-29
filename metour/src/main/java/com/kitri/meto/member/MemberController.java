package com.kitri.meto.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class MemberController {
	
	@Resource(name="MemberService")
	private MemberDaoService memberService;

	public void setMemberService(MemberDaoService memberService) {
		this.memberService = memberService;
	}
	
	@RequestMapping(value="/")
	public String loginForm(){
		return "member/loginForm";
	}
	
	@RequestMapping("/member/joinForm.do")
	public String joinForm(){
		return "member/joinForm";
	}
	
	@RequestMapping(value="/member/join.do")
	public String join(Member m){
		memberService.addMember(m);
		return "member/loginForm";
	}
	
	@RequestMapping(value="/member/idCheck.do")
	public ModelAndView idCheck(@RequestParam(value="id")String id){

		Member m = memberService.getMember(id);
		boolean flag = false;
		if(m==null){
			flag= true;
		}
		ModelAndView mav = new ModelAndView("member/check");
		mav.addObject("flag",flag);
		return mav;
	}
	
	@RequestMapping(value="/member/login.do")
	public String login(Member m, HttpServletRequest req){
		HttpSession session = null;
		boolean flag = memberService.login(m);
		if(flag==true){
			session = req.getSession();
			session.setAttribute("id", m.getId());
			return "member/main";
		}
		return "member/loginForm";
	}
	
	@RequestMapping(value="/member/editForm.do")
	public String modify(HttpServletRequest req){

		Member m = memberService.getMember(req.getSession().getAttribute("id").toString());
		if(m==null){
			return "member/loginForm";
		}
		req.setAttribute("join", m);
		return "member/editForm";
	}
	
	@RequestMapping(value="/member/edit.do")
	public String edit(Member m){
		memberService.editMember(m);
		return "member/main";
	}
	
	@RequestMapping(value="/member/logout.do")
	public String logout(HttpServletRequest req){
		req.getSession().invalidate();
		return "member/loginForm";
	}
	
	@RequestMapping(value="/member/out.do")
	public String out(HttpServletRequest req){
		memberService.delMember(req.getSession().getAttribute("id").toString());
		req.getSession().invalidate();
		return "member/loginForm";
	}
	
	@RequestMapping(value="/member/admin.do")
	public String adminForm(){
		return "admin/admin";
	}
	
	@RequestMapping(value="/member/deletecar.do")
	public String deletecar(@RequestParam (value="car_num")int car_num){

//		ModelAndView mav = new ModelAndView("admin/carList");

		return "admin/admin";
	}
}
