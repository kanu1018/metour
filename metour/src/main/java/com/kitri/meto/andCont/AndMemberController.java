package com.kitri.meto.andCont;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.meto.JoinDTO.JoinDTO;
import com.kitri.meto.member.Member;
import com.kitri.meto.member.MemberDaoService;
import com.kitri.meto.schedule.Schedule;
import com.kitri.meto.schedule.scheduleService;
import com.kitri.meto.subplan.SubPlan;
import com.kitri.meto.subplan.SubPlanService;
import com.kitri.meto.thread.PhotoEvent;

@Controller
public class AndMemberController {
	
	@Resource(name="MemberService")
	private MemberDaoService memberService;

	public void setMemberService(MemberDaoService memberService) {
		this.memberService = memberService;
	}
	
	@Resource(name="scheduleSerivce")
	private scheduleService scheduleService;
	
	public void setScheduleService(scheduleService scheduleService){
		this.scheduleService = scheduleService;
	}
	
	@Resource(name="SubPlanService")
	private SubPlanService subPlanService;

	public void setSubPlanService(SubPlanService subPlanService) {
		this.subPlanService = subPlanService;
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
			System.out.println("세션만드는 문장 실행");
			session = req.getSession();
			System.out.println(session);
			session.setAttribute("id", m.getId());
			session.setAttribute("type", m.getMem_status());
			
			List<JoinDTO> list = new ArrayList<JoinDTO>();
			list = memberService.getArticleByRoot();
			session.setAttribute("LIST", list);
			mav.addObject("number",m.getMem_num());
			//return "member/main";	
		}
		System.out.println(m.getMem_num());
		return mav;
	}
	
	@RequestMapping(value="/and/member/editForm.do")
	public String modify(HttpServletRequest req){
		  
		System.out.println("세션존재여부확인="+req.getSession().getAttribute("id").toString());
		Member m = memberService.getMember(req.getSession().getAttribute("id").toString());
		/*if(m==null){
			return "member/loginForm";
		}*/
		req.setAttribute("m", m);
		return "android/andMember";
	}
	
	@RequestMapping(value="/and/member/edit.do")
	public String edit(Member m){
		System.out.println(m.getId());
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
	   public ModelAndView select(@RequestParam(value="type") int type, @RequestParam(value="searchText")String text){
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
	
	@RequestMapping(value="/and/member/select.do")
	public ModelAndView memberSel(@RequestParam(value="id") String id){
		ModelAndView mav = new ModelAndView("android/andMember");
		System.out.println("member/select");
		System.out.println(id);
		
		Member m = memberService.getMember(id);
		mav.addObject("m", m);
		
		return mav;
	}
	
	@RequestMapping(value="/and/member/photo_alert.do")
	public String photo_alert(HttpServletRequest req){
		//String id = req.getSession().getAttribute("id").toString();
		String id = "1";
		System.out.println("id="+id);
		String date= "2016/08/12";
		Member m = memberService.getMember(id);
		Schedule s = new Schedule();
		s.setMain_writer(m.getMem_num());
		s.setMain_date(date);
		ArrayList<SubPlan> splist = subPlanService.getSubPlanByMain(42);
		String reg_id = "APA91bFNBzL7T426Rm0rTTLc5Ct8mFfqirYe6Vy6PDJAn16a---Rma_OKH7fjuk5T2HMP-Hn-m4HJ5unzwM5wZDzGZPyy8VteUgTIJnXEGaIqpu86bpXqY7U9DOXmdpg8QkkAW9d7dzp";
		if(splist.size()!=0){
			PhotoEvent pe = new PhotoEvent(splist,reg_id);
			pe.start();
		}
		return null;
	}
}
