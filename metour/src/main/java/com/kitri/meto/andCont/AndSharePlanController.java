package com.kitri.meto.andCont;

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
import com.kitri.meto.metoo.MetooService;
import com.kitri.meto.rep.RepService;
import com.kitri.meto.schedule.Schedule;
import com.kitri.meto.schedule.scheduleService;
import com.kitri.meto.shareplan.AgeSelectDTO;
import com.kitri.meto.shareplan.SharePlan;
import com.kitri.meto.shareplan.SharePlan2;
import com.kitri.meto.shareplan.SharePlanService;
import com.kitri.meto.subplan.SubPlan;
import com.kitri.meto.subplan.SubPlanService;

@Controller
public class AndSharePlanController {
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
	
	@RequestMapping(value = "/and/share/share.do")
	public String share(){
		return "/shareplan/share";
	}
	
	@RequestMapping(value = "/and/share/add.do")
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
	
	@RequestMapping(value="/and/share/list.do")
	public ModelAndView shareList(){
		//공유글
		ArrayList<SharePlan2> splist = new ArrayList<SharePlan2>();
		ArrayList<SharePlan> list = shareService.getSharePlanAll();
		ArrayList<String> list1 = new ArrayList<String>();
		for(int i=0;i<list.size();i++){
			String id = new String();
			id= memberService.getIdByMemnum(list.get(i).getWriter());
			list1.add(id);
		}
		ArrayList<String>list2 = new ArrayList<String>();
		
		for(int i=0;i<list.size();i++){
			ArrayList<SubPlan> list3 = null;
			list3 = subPlanService.getSubPlans(list.get(i).getMain_plan_num());
			System.out.println(list3.size()+" "+list.get(i).getMain_plan_num());
			if(list3.size()==0){
				list2.add("");
			}else{
				list2.add(list3.get(0).getPhoto());
			}
		}
		for(int i=0;i<list.size();i++){
			SharePlan2 s = new SharePlan2();
			s.setShare_num(list.get(i).getShare_num());
			s.setWriter(list.get(i).getWriter());
			s.setLocation(list.get(i).getLocation());
			s.setContent(list.get(i).getContent());
			s.setMetoo(list.get(i).getMetoo());
			s.setPoint_num(list.get(i).getPoint_num());
			s.setShare_title(list.get(i).getShare_title());
			s.setMain_plan_num(list.get(i).getMain_plan_num());
			s.setId(list1.get(i));
			s.setSub_num(list2.get(i));
			splist.add(s);
		}
		ModelAndView mav = new ModelAndView("android/andSharePlanList");
		mav.addObject("s", splist);
		//mav.addObject("id",list1);
		//mav.addObject("mp",list2);
		return mav;
	}
	
	@RequestMapping(value="/and/share/webphoto.do")
	public ModelAndView webphoto(@RequestParam(value="sub_num") int sub_num){
		ModelAndView mav = new ModelAndView("android/andPhoto");
		System.out.println("asfdg  "+sub_num);
		if(sub_num == 0){
			return null;
		}
		SubPlan sp = subPlanService.getSubPlan(sub_num);
		mav.addObject("photo",sp.getPhoto());
		return mav;
		
	}
	
	@RequestMapping(value="/and/share/view2.do")
	public ModelAndView shareView2(@RequestParam(value="share_num") int share_num){
		ModelAndView mav = new ModelAndView("android/andSharePlan");	
		System.out.println("view2 접속");
		System.out.println(share_num);
		
		//공유글 내용
		//SharePlan s = shareService.getSharePlan(share_num);
		JoinDTO s = shareService.getJoinSharePlan(share_num);
		
		mav.addObject("s", s);
		
		return mav;
	}
	
	@RequestMapping(value="/and/share/content.do")
	public ModelAndView shareViewContent(@RequestParam(value="share_num") int share_num){
		ModelAndView mav = new ModelAndView("shareplan/shareview3");
		
		System.out.println("content 접속");
		System.out.println(share_num);
		
		//공유글 내용
		SharePlan s = shareService.getSharePlan(share_num);
		
		mav.addObject("s", s);
		
		return mav;
	}
	
	//히송이 수정해욤
	@RequestMapping(value = "/and/share/search.do")
	public ModelAndView search(@RequestParam(value="search") String share_title){
		ArrayList<SharePlan> list = shareService.getSharePlanByTitle(share_title);
		ModelAndView mav = new ModelAndView("shareplan/sharelist");
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value = "/and/share/gender.do")
	public String gender(){
		return "/shareplan/genderselect";
	}
	
	@RequestMapping(value = "/and/share/genderlist.do")
	public ModelAndView genderlist(@RequestParam(value="gender") String gender){
		ArrayList<JoinDTO> list = shareService.getSharePlanByGender(gender);
		ModelAndView mav = new ModelAndView("shareplan/sharelist");
		
		System.out.println(gender);
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value = "/and/share/age.do")
	public String age(){
		return "/shareplan/ageselect";
	}
	
	@RequestMapping(value = "/and/share/agelist.do")
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
				mem_num.add(age.get(i).getMem_num());
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
	
	@RequestMapping(value = "/and/subplan/com.do")
	public String com(HttpServletRequest req, @RequestParam(value="html")String html
			,@RequestParam(value="main_num")int main_num,@RequestParam(value="location")String location){
		//
		int point_num = scheduleService.getByPointNum();
		JoinDTO j = new JoinDTO();
		j.setPoint_num(point_num+1);
		j.setPoint(0);
		scheduleService.addPoint(j);
		//
		System.out.println(html);
		HttpSession session = req.getSession();
		String id = session.getAttribute("id").toString();
		Member m = memberService.getMember(id);
		int mem_num = m.getMem_num();
		SharePlan s = new SharePlan();
		s.setWriter(mem_num);
		s.setContent(html);
		s.setPoint_num(point_num+1);
		s.setLocation(location);
		Schedule schedule = scheduleService.getByTitle(main_num);
		s.setShare_title(schedule.getMain_title());
		shareService.addSharePlan(s);
		System.out.println("성공");
		return "redirect:/share/list.do";
	}
	
	@RequestMapping(value = "/and/share/best.do")
	public ModelAndView bestlist(){
		ArrayList<SharePlan> list = shareService.getSharePlanByBest();
		ModelAndView mav = new ModelAndView("shareplan/sharelist");
	
		mav.addObject("list", list);
		return mav;
	}
	
	
	@RequestMapping(value = "/and/share/place.do")
	public String place(){
		return "/shareplan/placesearch";
	}
	
	@RequestMapping(value = "/and/share/placelist.do")
	public ModelAndView placelist(@RequestParam(value="place") String place){
		String tmp = "%"+place+"%";
		ArrayList<SharePlan> list = shareService.getSharePlanByPlace(tmp);

		ModelAndView mav = new ModelAndView("shareplan/sharelist");
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value = "/and/share/trans.do")
	public String trans(){
		return "/android/andPicture";
	}

	
}


