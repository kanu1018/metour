package com.kitri.meto.admin;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.meto.member.Member;

@Controller
public class AdminController {

	@Resource(name="AdminService")
	private AdminService adminSerivce;

	public void setAdminSerivce(AdminService adminSerivce) {
		this.adminSerivce = adminSerivce;
	}
	
	@RequestMapping("/admin/adminForm.do")
	public String admin(){
		return "admin/adminmain";
	}
	
	@RequestMapping(value="/admin/memberList.do")
	public ModelAndView memberList(){
		ModelAndView mav = new ModelAndView("admin/memberList");
		List<Member> list = adminSerivce.getMemberAll();
		mav.addObject("list", list);
		return mav;	
	}
	
	@RequestMapping(value="/admin/singoList.do")
	public ModelAndView singoList(){
		ModelAndView mav = new ModelAndView("admin/singoList");
		List<Singo> list = adminSerivce.getSingoAll();
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value="/admin/out.do")
	public String out(@RequestParam (value="id")String id){
		adminSerivce.delMember(id);
		return "redirect:/admin/memberList.do";
	}
	
	@RequestMapping(value="/admin/singoCom.do")
	public String singoCom(@RequestParam (value="singo_num")int singo_num){
		adminSerivce.delSingo(singo_num);
		return "redirect:/admin/singoList.do";
	}
}