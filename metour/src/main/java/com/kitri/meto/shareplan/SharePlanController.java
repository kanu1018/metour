package com.kitri.meto.shareplan;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.meto.JoinDTO.JoinDTO;
import com.kitri.meto.admin.AdminService;
import com.kitri.meto.member.Member;
import com.kitri.meto.member.MemberDaoService;
import com.kitri.meto.metoo.Metoo;
import com.kitri.meto.metoo.MetooService;
import com.kitri.meto.rep.Rep;
import com.kitri.meto.rep.RepService;

@Controller
public class SharePlanController {
	@Resource(name="SharePlanService")
	private SharePlanService shareService;
	
	public void setSharePlanService(SharePlanService shareService){
		this.shareService = shareService;
	}
	
	@Resource(name="MetooService")
	private MetooService metooService;
	
	public void setSharePlanService(MetooService metooService){
		this.metooService = metooService;
	}
	
	@Resource(name="MemberService")
	private MemberDaoService memberService;

	public void setMemberService(MemberDaoService memberService) {
		this.memberService = memberService;
	}
	
	@Resource(name="AdminService")
	private AdminService adminSerivce;

	public void setAdminSerivce(AdminService adminSerivce) {
		this.adminSerivce = adminSerivce;
	}
	
	@Resource(name="RepService")
	private RepService repService;
	
	public void setSharePlanService(RepService repService){
		this.repService = repService;
	}
	/////////////
	@RequestMapping(value = "/share/share.do")
	public String share(){
		return "/shareplan/share";
	}
	
	@RequestMapping(value = "/share/add.do")
	public String shareAdd(HttpServletRequest req, SharePlan s, 
			@RequestParam(value="content") String content, @RequestParam(value="point_num") int point_num,
			@RequestParam(value="share_title") String share_title){
		//세션 id, mem_num 받아오기
		HttpSession session = req.getSession();
		String id = session.getAttribute("id").toString();
		Member m = memberService.getMember(id);
		int mem_num = m.getMem_num();
		
		s.setWriter(mem_num);
		s.setContent(content);
		s.setPoint_num(point_num);
		s.setShare_title(share_title);
		shareService.addSharePlan(s);
		System.out.println("성공");
		return "redirect:/share/list.do";
	}
	
	@RequestMapping(value="/share/list.do")
	public ModelAndView shareList(){
		//공유글
		ArrayList<SharePlan> list = shareService.getSharePlanAll();
		ModelAndView mav = new ModelAndView("shareplan/sharelist");
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value="/share/view.do")
	public ModelAndView shareView(HttpServletRequest req, @RequestParam(value="share_num") int share_num){
		/*//세션 id, mem_num 받아오기
		HttpSession session = req.getSession();
		String id = session.getAttribute("id").toString();
		Member m = memberService.getMember(id);
		int mem_num = m.getMem_num();
		System.out.println(mem_num);
		//공유글 받기
		SharePlan s = shareService.getSharePlan(share_num);
		//metoo_yn 받기
		Metoo me = new Metoo();
		me.setMem_num(m.getMem_num());
		me.setShare_num(share_num);
		//전체 댓글 목록
		ArrayList<Rep> list = repService.getRepByShareNum(share_num);
		//내 댓글 목록
		ArrayList<Rep> myRep = repService.getRep(share_num, mem_num);
		
		// metoo table 컬럼 존재 확인
		int cnt = metooService.getMetooCnt(me); 
		System.out.println(cnt);
		
		if(cnt == 0){ 
			// 컬럼 없을 시 metoo add
			metooService.addMetoo(me);
		} else {
			// 컬럼 있을 시 본인 yn 확인
			me = metooService.getMetoo(me);
			System.out.println(me.getMetoo_yn());
		}*/
		//
		ModelAndView mav = new ModelAndView("shareplan/shareview");
		
		//세션 받기
		HttpSession session = req.getSession();
		
		//공유글 받기
		SharePlan s = shareService.getSharePlan(share_num);
		
		//전체 댓글 목록
		ArrayList<Rep> list = repService.getRepByShareNum(share_num);
		
		if(session != null){
			//로그인 했을 경우
			//세션 id, mem_num 받아오기
			String id = session.getAttribute("id").toString();
			Member m = memberService.getMember(id);
			int mem_num = m.getMem_num();
			System.out.println(mem_num);
			
			//내 댓글 목록
			Rep r = new Rep();
			r.setRep_writer(mem_num);
			r.setShare_num(share_num);
			ArrayList<Rep> myRep = repService.getRep(r);
			
			//metoo_yn 받기
			Metoo me = new Metoo();
			me.setMem_num(m.getMem_num());
			me.setShare_num(share_num);
			
			// metoo table 컬럼 존재 확인
			int cnt = metooService.getMetooCnt(me); 
			System.out.println(cnt);
			
			if(cnt == 0){ 
				// 컬럼 없을 시 metoo add
				metooService.addMetoo(me);
			} else {
				// 컬럼 있을 시 본인 yn 확인
				me = metooService.getMetoo(me);
				System.out.println(me.getMetoo_yn());
			}
			mav.addObject("me", me); // 좋아요
			mav.addObject("r", myRep); // 내 댓글
		} 
		for(int i = 0; i<list.size(); i++){
			System.out.println("list:" + list.get(i).getRep_content());
		}
		//
		//ModelAndView mav = new ModelAndView("shareplan/shareview");
		mav.addObject("s", s); // 공유글
		//mav.addObject("me", me); // 좋아요
		mav.addObject("list", list); // 전체 댓글
		//mav.addObject("r", r); // 내 댓글
		return mav;
	}
	
	///////
	@RequestMapping(value = "/resourceTest")
	public String resourceTest(){
		return "/subplan/subPlanPhoto";
	}
	
	//히송이 수정해욤
	@RequestMapping(value = "/share/search.do")
	public ModelAndView search(@RequestParam(value="search") String share_title){
		ArrayList<SharePlan> list = shareService.getSharePlanByTitle(share_title);
		ModelAndView mav = new ModelAndView("shareplan/sharelist");
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value = "/share/gender.do")
	public String gender(){
		return "/shareplan/genderselect";
	}
	
	@RequestMapping(value = "/share/genderlist.do")
	public ModelAndView genderlist(@RequestParam(value="gender") String gender){
		ArrayList<JoinDTO> list = shareService.getSharePlanByGender(gender);
		ModelAndView mav = new ModelAndView("shareplan/sharelist");
		
		System.out.println(gender);
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value = "/share/age.do")
	public String age(){
		return "/shareplan/ageselect";
	}
	
	@RequestMapping(value = "/share/agelist.do")
	public ModelAndView genderlist(@RequestParam(value="age") int age){
		ArrayList<Member> member = (ArrayList<Member>)adminSerivce.getMemberAll();
		ArrayList<Integer> mem_num = getAge(member, age);
		
		ArrayList<SharePlan> list = new ArrayList<SharePlan>();
		for(int i = 0; i < mem_num.size(); i++){
			ArrayList<SharePlan> tmp = shareService.getSharePlanByWriter(mem_num.get(i));
			for(int j = 0; j < tmp.size(); j++){
				list.add(tmp.get(j));
			}
		}

		ModelAndView mav = new ModelAndView("shareplan/sharelist");
		
		mav.addObject("list", list);
		return mav;
	}
	
	public ArrayList<Integer> getAge(ArrayList<Member> member, int agegroup){
		ArrayList<String> birth = new ArrayList<String>();
		for(int i = 0; i < member.size(); i++){
			birth.add(member.get(i).getBirth());
		}
		
		ArrayList<AgeSelectDTO> age = new ArrayList<AgeSelectDTO>();
		for(int i = 0; i < member.size(); i++){
			AgeSelectDTO ageDTO = new AgeSelectDTO();
			ageDTO.setMem_num(member.get(i).getMem_num());
			ageDTO.setAge(calAge(member.get(i).getBirth()));
			age.add(ageDTO);
		}
		
		ArrayList<Integer> mem_num = new ArrayList<Integer>();

		for(int i = 0; i < age.size(); i++){
			if(age.get(i).getAge() > agegroup-1 && age.get(i).getAge() <= agegroup + 10){
				mem_num.add(age.get(i).mem_num);
			}
		}
		HashSet<Integer> hs = new HashSet<Integer>(mem_num); 
		ArrayList<Integer> newindex = new ArrayList<Integer>(hs);
		return newindex;
	}
	
	public int calAge(String birth){
		SimpleDateFormat formatter = new SimpleDateFormat ("yyyy", Locale.KOREA);
		Date currentTime = new Date ( );
		String year = formatter.format ( currentTime );
		String birth_year = birth.substring(0,4);
		return Integer.parseInt(year) - Integer.parseInt(birth_year) + 1;
	}
	
}


