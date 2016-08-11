package com.kitri.meto.andCont;

import java.util.ArrayList;

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
import com.kitri.meto.rep.Rep;
import com.kitri.meto.rep.RepService;

@Controller
public class AndRepController {
	@Resource(name="RepService")
	private RepService repService;
	
	public void setSharePlanService(RepService repService){
		this.repService = repService;
	}
	
	@Resource(name="MemberService")
	private MemberDaoService memberService;

	public void setMemberService(MemberDaoService memberService) {
		this.memberService = memberService;
	}
	
	@RequestMapping(value = "/and/rep/add.do")
	public String shareAdd(@RequestParam(value="rep_writer") int mem_num, @RequestParam(value="rep_content") String rep_content, @RequestParam(value="share_num") int share_num){
		System.out.println("댓글 등록");
		
		Rep r = new Rep();
		r.setRep_writer(mem_num);
		r.setShare_num(share_num);
		r.setRep_content(rep_content);
		
		repService.addRep(r);
				
		return "";
	}
	
	@RequestMapping(value = "/and/rep/edit.do")
	public String subPlanEdit(@RequestParam(value="rep_content") String rep_content,
			@RequestParam(value="rep_num") int rep_num, @RequestParam(value="share_num") int share_num){
		System.out.println("댓글 수정");
		
		//update
		Rep r = new Rep();
		r.setRep_num(rep_num);
		r.setRep_content(rep_content);
		r.setShare_num(share_num);
		
		repService.editeRep(r);
		
		return "";
	}
	
	@RequestMapping(value = "/and/rep/del.do")
	public String repDel(HttpServletRequest request, 
			@RequestParam(value="rep_num") int rep_num, @RequestParam(value="share_num") int share_num){
		repService.delRep(rep_num);
		return "";
	}
	
	@RequestMapping(value="/and/rep/list.do")
	public ModelAndView repList(@RequestParam(value="share_num") int share_num){
		ModelAndView mav = new ModelAndView("android/andRep");
		
		System.out.println("rep/list 접속");
		System.out.println(share_num);
		
		//전체댓글 
		//ArrayList<Rep> list = repService.getRepByShareNum(share_num);
		ArrayList<JoinDTO> list = repService.getJoinRepByShareNum(share_num);
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value="/and/rep/main.do")
	public ModelAndView repMain(@RequestParam(value="share_num") int share_num){
		ModelAndView mav = new ModelAndView("android/andRep");
		
		System.out.println("rep 10개");
		System.out.println(share_num);
		
		//10개 댓글 
		ArrayList<Rep> list = repService.getRepByShareNumCnt(share_num);
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value = "/and/rep/cnt.do")
	public int repCnt(@RequestParam(value="share_num") int share_num){
		int cnt = repService.getRepCnt(share_num);
		System.out.println(cnt);
		return cnt;
	}
	
	
}
