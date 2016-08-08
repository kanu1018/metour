package com.kitri.meto.member;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.meto.JoinDTO.JoinDTO;

@Controller
public class MemberController {
	
	@Resource(name="MemberService")
	private MemberDaoService memberService;

	public void setMemberService(MemberDaoService memberService) {
		this.memberService = memberService;
	}
	
	/*@RequestMapping(value="/")
	public ModelAndView main(){
		List<JoinDTO> list = new ArrayList<JoinDTO>();
		ModelAndView mav = new ModelAndView("member/main");
		//ModelAndView mav = new ModelAndView("member/mainhome");
		list = memberService.getArticleByRoot();
		mav.addObject("LIST",list);
		return mav;
	}*/
	
	@RequestMapping("/")
	public String home(){
		return "/mainhome";
	}
	
	@RequestMapping(value="/member/main.do")
	public ModelAndView main(){
		List<JoinDTO> list = new ArrayList<JoinDTO>();
		ModelAndView mav = new ModelAndView("member/main");
		//ModelAndView mav = new ModelAndView("member/mainhome");
		list = memberService.getArticleByRoot();
		mav.addObject("LIST",list);
		return mav;
	}
	
	@RequestMapping("/member/joinForm.do")
	public String joinForm(){
		return "member/joinForm";
	}
	
	@RequestMapping("/member/loginForm.do")
	public String loginForm(){
		return "member/loginForm";
	}
	
	@RequestMapping("/member/pwdchk_ok.do")
	public String pwdchk_ok(HttpServletRequest req,@RequestParam(value="pwd")String pwd,Member m,@RequestParam(value="id")String id){
		HttpSession session = null;
		if(m.getPwd().equals(pwd)){
			session = req.getSession();
			m=memberService.getMember(id);
			req.setAttribute("join", m);
			return "member/editForm";
		}
		return "member/pwdchkForm";
	}
	
	@RequestMapping("/member/pwdchkForm.do")
	public String pwdchkForm(HttpServletRequest req,Member m){
		HttpSession session = null;
		session = req.getSession();
		return "member/pwdchkForm";
	}
	
	@RequestMapping(value="/member/join.do")
	public String join(@RequestParam(value="id1")String id1,@RequestParam(value="id2")String id2,@RequestParam(value="email")String email,Member m){
		if(email.equals("")){
			m.setId(id1+"@"+id2);
		}else{
			m.setId(id1+"@"+email);
		}
		memberService.addMember(m);
		return "member/loginForm";
	}
	
	@RequestMapping(value="/member/idCheck.do")
	public ModelAndView idCheck(@RequestParam(value="id1")String id1,@RequestParam(value="id2")String id2,@RequestParam(value="email")String email){
		String id="";
		if(email.equals("")){
			id=id1+"@"+id2;
		}else{
			id=id1+"@"+email;
		}
		Member m = memberService.getMember(id);
		boolean flag = false;
		if(m==null){
			flag= true;
		}
		ModelAndView mav = new ModelAndView("member/check");
		mav.addObject("flag",flag);
		return mav;
	}
	
	@RequestMapping(value="/member/pwdCheck.do")
	public ModelAndView pwdCheck(@RequestParam(value="pwd")String pwd, @RequestParam(value="pwd_chk")String pwd_chk){
		boolean flag = false;
		if(pwd.equals(pwd_chk)){
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
		m=memberService.getMember(m.getId());
		if(flag==true){
			session = req.getSession();
			session.setAttribute("id", m.getId());
			session.setAttribute("type", m.getMem_status());
			List<JoinDTO> list = new ArrayList<JoinDTO>();
			list = memberService.getArticleByRoot();
			session.setAttribute("LIST", list);
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
	public ModelAndView logout(HttpServletRequest req){
		req.getSession().invalidate();
		List<JoinDTO> list = new ArrayList<JoinDTO>();
		ModelAndView mav = new ModelAndView("member/main");
		list = memberService.getArticleByRoot();
		mav.addObject("LIST",list);
		return mav;
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
	
	@RequestMapping(value="/member/search.do")
	   public ModelAndView select(@RequestParam(value="type")int type,@RequestParam(value="searchText")String text){
	      ModelAndView mav = new ModelAndView("member/main");
	      if(type==1){
	         mav.addObject("LIST",memberService.getArticleByTitle(text));//제목
	      } else if(type==2){
	         mav.addObject("LIST",memberService.getArticleByWriter(text));//작성자
	      } else if(type==3){
	    	 int num = Integer.parseInt(text);
	         mav.addObject("LIST",memberService.getArticleByNum(num));//글번호
	      } else {
	         mav.addObject("LIST",memberService.getArticleByRoot());
	      }
	      return mav;
	   }
}
