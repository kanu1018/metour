package com.kitri.meto.andCont;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.meto.admin.AdminService;
import com.kitri.meto.admin.Singo;
import com.kitri.meto.member.Member;

@Controller
public class AndAdminController {

	@Resource(name="AdminService")
	private AdminService adminSerivce;

	public void setAdminSerivce(AdminService adminSerivce) {
		this.adminSerivce = adminSerivce;
	}
	
	@RequestMapping("/and/admin/adminForm.do")
	public String admin(){
		return "admin/adminmain";
	}
	
	@RequestMapping(value="/and/admin/memberList.do")
	public ModelAndView memberList(){
		ModelAndView mav = new ModelAndView("admin/memberList");
		List<Member> list = adminSerivce.getMemberAll();
		mav.addObject("list", list);
		mav.addObject("a", "n");
		
		return mav;	
	}
	
	@RequestMapping(value="/and/admin/singoList.do")
	public ModelAndView singoList(){
		ModelAndView mav = new ModelAndView("admin/singoList");
		List<Singo> list = adminSerivce.getSingoAll();
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value="/and/admin/out.do")
	public String out(@RequestParam (value="id")String id){
		adminSerivce.delMember(id);
		return "redirect:/admin/memberList.do";
	}
	
	@RequestMapping(value="/and/admin/in.do")
	public String in(@RequestParam (value="id")String id){
		adminSerivce.inMember(id);
		return "redirect:/admin/memberList.do";
	}
	
	@RequestMapping(value="/and/admin/singoCom.do")
	public String singoCom(@RequestParam (value="singo_num")int singo_num){
		adminSerivce.delSingo(singo_num);
		return "redirect:/admin/singoList.do";
	}
	
		@RequestMapping(value="/and/admin/outMemberList.do")
	public ModelAndView outMemberList(){
		ModelAndView mav = new ModelAndView("admin/memberList");
		List<Member> list = adminSerivce.getOutMemberAll();
		mav.addObject("list", list);
		mav.addObject("a", "y");
		return mav;
	}
	
	
}