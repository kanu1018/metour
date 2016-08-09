package com.kitri.meto.andCont;

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
import com.kitri.meto.member.Member;
import com.kitri.meto.member.MemberDaoService;

@Controller
public class AndMemberController {
	
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
	
	@RequestMapping("/and")
	public String home(){
		return "/mainhome";
	}
	
	@RequestMapping(value="/and/member/main.do")
	public ModelAndView main(){
		List<JoinDTO> list = new ArrayList<JoinDTO>();
		ModelAndView mav = new ModelAndView("member/main");
		//ModelAndView mav = new ModelAndView("member/mainhome");
		list = memberService.getArticleByRoot();
		mav.addObject("LIST",list);
		return mav;
	}
	
	@RequestMapping("/and/member/joinForm.do")
	public String joinForm(){
		return "member/joinForm";
	}
	
	@RequestMapping("/and/member/loginForm.do")
	public String loginForm(){
		return "member/loginForm";
	}
	
	@RequestMapping("/and/member/pwdchk_ok.do")
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
	
	@RequestMapping("/and/member/pwdchkForm.do")
	public String pwdchkForm(HttpServletRequest req,Member m){
		HttpSession session = null;
		session = req.getSession();
		return "member/pwdchkForm";
	}
	
	@RequestMapping(value="/and/member/join.do")
	public String join(Member m){
		/*if(email.equals("")){
			m.setId(id1+"@"+id2);
		}else{
			m.setId(id1+"@"+email);
		}*/
		memberService.addMember(m);
		return "member/loginForm";
	}
	
	@RequestMapping(value="/and/member/idCheck.do")
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
	
	@RequestMapping(value="/and/member/pwdCheck.do")
	public ModelAndView pwdCheck(@RequestParam(value="pwd")String pwd, @RequestParam(value="pwd_chk")String pwd_chk){
		boolean flag = false;
		if(pwd.equals(pwd_chk)){
			flag= true;
		}
		ModelAndView mav = new ModelAndView("member/check");
		mav.addObject("flag",flag);
		return mav;
	}
	
	@RequestMapping(value="/and/member/login.do")
	public ModelAndView login(Member m, HttpServletRequest req){
		ModelAndView mav = new ModelAndView("member/andcheck");
		System.out.println(m.getId());
		System.out.println(m.getPwd());
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
			//return "member/main";
		}
		mav.addObject("flag", flag);
		return mav;
	}
	
	@RequestMapping(value="/and/member/editForm.do")
	public String modify(HttpServletRequest req){
		Member m = memberService.getMember(req.getSession().getAttribute("id").toString());
		if(m==null){
			return "member/loginForm";
		}
		req.setAttribute("join", m);
		return "member/editForm";
	}
	
	@RequestMapping(value="/and/member/edit.do")
	public String edit(Member m){
		memberService.editMember(m);
		return "member/main";
	}
	
	@RequestMapping(value="/and/member/logout.do")
	public ModelAndView logout(HttpServletRequest req){
		req.getSession().invalidate();
		List<JoinDTO> list = new ArrayList<JoinDTO>();
		ModelAndView mav = new ModelAndView("member/main");
		list = memberService.getArticleByRoot();
		mav.addObject("LIST",list);
		return mav;
	}
	
	@RequestMapping(value="/and/member/out.do")
	public String out(HttpServletRequest req){
		memberService.delMember(req.getSession().getAttribute("id").toString());
		req.getSession().invalidate();
		return "member/loginForm";
	}
	
	@RequestMapping(value="/and/member/admin.do")
	public String adminForm(){
		return "admin/admin";
	}
	
	@RequestMapping(value="/and/member/search.do")
	   public ModelAndView select(@RequestParam(value="type")int type,@RequestParam(value="searchText")String text){
	      ModelAndView mav = new ModelAndView("shareplan/sharelist");
	      if(type==1){
	         mav.addObject("list",memberService.getArticleByTitle(text));//제목
	      } else if(type==2){
	         mav.addObject("list",memberService.getArticleByWriter(text));//작성자
	      } else if(type==3){
	    	 int num = Integer.parseInt(text);
	         mav.addObject("list",memberService.getArticleByNum(num));//글번호
	      } else {
	         mav.addObject("list",memberService.getArticleByRoot());
	      }
	      return mav;
	   }
}
