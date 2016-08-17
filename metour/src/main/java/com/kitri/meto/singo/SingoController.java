package com.kitri.meto.singo;

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
import com.kitri.meto.metoo.Metoo;
import com.kitri.meto.metoo.MetooService;
import com.kitri.meto.point.Point;
import com.kitri.meto.point.PointService;
import com.kitri.meto.rep.Rep;
import com.kitri.meto.rep.RepService;
import com.kitri.meto.shareplan.SharePlanService;

@Controller
public class SingoController {
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
	
	@Resource(name="MetooService")
	private MetooService metooService;	
	public void setSharePlanService(MetooService metooService){
		this.metooService = metooService;
	}
	
	@Resource(name="PointService")
	private PointService pointService;	
	public void setPointService(PointService pointService){
		this.pointService = pointService;
	}
	
	@Resource(name="SharePlanService")
	private SharePlanService shareService;	
	public void setSharePlanService(SharePlanService shareService){
		this.shareService = shareService;
	}
	
	
	
	@Resource(name="RepService")
	private RepService repService;	
	public void setSharePlanService(RepService repService){
		this.repService = repService;
	}
	
	@RequestMapping("/singo/popup.do")
	public ModelAndView popUp(@RequestParam(value="num") int num, @RequestParam(value="type")String type, @RequestParam(value="share_num") int share_num){
		ModelAndView mav = new ModelAndView("/singo/singoinsert");
		mav.addObject("num", num);
		mav.addObject("type", type);
		mav.addObject("share_num",share_num);
		return mav;
	}
	
	@RequestMapping(value = "/singo/add.do")
	public ModelAndView singoAdd(HttpServletRequest req, @RequestParam(value="singo_kind") String singo_kind,
			 @RequestParam(value="share_num") int share_num, @RequestParam(value="singo_content") String singo_content,
			 @RequestParam(value="gul_num") int gul_num){
		//세션 id, mem_num 받아오기
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		String id = session.getAttribute("id").toString();
		Member m = memberService.getMember(id);
		int mem_num = m.getMem_num();
		Singo singo = new Singo();
		singo.setSingo_kind(singo_kind);
		singo.setSingo_mem(mem_num);
		singo.setContent_num(share_num);
		singo.setSingo_content(singo_content);
		singoService.addSingo(singo);
		

		//공유글 받기
		//SharePlan s = shareService.getSharePlan(share_num);
		JoinDTO s = shareService.getJoinSharePlan(gul_num);
		
		//전체 댓글 목록
		//ArrayList<Rep> list = repService.getRepByShareNum(share_num);
		ArrayList<JoinDTO> list = repService.getJoinRepByShareNum(gul_num);
		
		//point
		Point p = pointService.getPoint(s.getPoint_num());
		int point = p.getPoint();
		
		//글 댓글 수 
		int repCnt = repService.getRepCnt(gul_num);
		System.out.println("repCnt: "+repCnt);
		
		if(session.getAttribute("id") != null){
			
			//내 댓글 목록
			Rep r = new Rep();
			r.setRep_writer(mem_num);
			r.setShare_num(gul_num);
			ArrayList<Rep> myRep = repService.getRep(r);
			
			//metoo_yn 받기
			Metoo me = new Metoo();
			me.setMem_num(m.getMem_num());
			me.setShare_num(gul_num);
			
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
			
			for(int i = 0; i<list.size(); i++){
				System.out.println("list:" + list.get(i).getRep_content());
			}
			
			mav.addObject("s", s); // 공유글
			mav.addObject("list", list); // 전체 댓글
			mav.addObject("rCnt", repCnt); //댓글 수
			mav.addObject("point", point); //점수
			mav.addObject("mem_num", mem_num);
			mav.addObject("type", m.getMem_status());
			mav.setViewName("shareplan/shareview");
		} else {
			for (int i = 0; i < list.size(); i++) {
				System.out.println("list:" + list.get(i).getRep_content());
			}
			
			mav.addObject("s", s); // 공유글
			mav.addObject("rCnt", repCnt); //댓글 수
			mav.addObject("list", list); // 전체 댓글
			mav.addObject("point", point); //점수
			mav.setViewName("shareplan/shareview2");
		}
		return mav;
	}
	
	@RequestMapping(value = "/singo/viewRep.do")
	public ModelAndView singoviewRep(HttpServletRequest req, @RequestParam(value="singo_num") int singo_num){
		//세션 id, mem_num 받아오기
				ModelAndView mav = new ModelAndView();
				HttpSession session = req.getSession();
				String id = session.getAttribute("id").toString();
				Member m = memberService.getMember(id);
				int mem_num = m.getMem_num();
			
				Singo singo = singoService.getSingo(singo_num);
				
				
				int rep_num = singo.getContent_num();
				Rep rep = repService.getRepByRepnum(rep_num);
				
				int gul_num = rep.getShare_num();
				
				
				//공유글 받기
				//SharePlan s = shareService.getSharePlan(share_num);
				JoinDTO s = shareService.getJoinSharePlan(gul_num);
				
				//전체 댓글 목록
				//ArrayList<Rep> list = repService.getRepByShareNum(share_num);
				ArrayList<JoinDTO> list = repService.getJoinRepByShareNum(gul_num);
				
				//point
				Point p = pointService.getPoint(s.getPoint_num());
				int point = p.getPoint();
				
				//글 댓글 수 
				int repCnt = repService.getRepCnt(gul_num);
				System.out.println("repCnt: "+repCnt);
				
				if(session.getAttribute("id") != null){
					
					//내 댓글 목록
					Rep r = new Rep();
					r.setRep_writer(mem_num);
					r.setShare_num(gul_num);
					ArrayList<Rep> myRep = repService.getRep(r);
					
					//metoo_yn 받기
					Metoo me = new Metoo();
					me.setMem_num(m.getMem_num());
					me.setShare_num(gul_num);
					
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
					
					for(int i = 0; i<list.size(); i++){
						System.out.println("list:" + list.get(i).getRep_content());
					}
					
					mav.addObject("s", s); // 공유글
					mav.addObject("list", list); // 전체 댓글
					mav.addObject("rCnt", repCnt); //댓글 수
					mav.addObject("point", point); //점수
					mav.addObject("mem_num", mem_num);
					mav.addObject("type", m.getMem_status());
					mav.setViewName("shareplan/shareview");
				} else {
					for (int i = 0; i < list.size(); i++) {
						System.out.println("list:" + list.get(i).getRep_content());
					}
					
					mav.addObject("s", s); // 공유글
					mav.addObject("rCnt", repCnt); //댓글 수
					mav.addObject("list", list); // 전체 댓글
					mav.addObject("point", point); //점수
					mav.setViewName("shareplan/shareview2");
				}
				return mav;
	}
	
	@RequestMapping(value = "/singo/viewGul.do")
	public ModelAndView singoviewShare(HttpServletRequest req, @RequestParam(value="singo_num") int singo_num){
		//세션 id, mem_num 받아오기
				ModelAndView mav = new ModelAndView();
				HttpSession session = req.getSession();
				String id = session.getAttribute("id").toString();
				Member m = memberService.getMember(id);
				int mem_num = m.getMem_num();

				Singo singo = singoService.getSingo(singo_num);
				int gul_num = singo.getContent_num();

				//공유글 받기
				//SharePlan s = shareService.getSharePlan(share_num);
				JoinDTO s = shareService.getJoinSharePlan(gul_num);
				
				//전체 댓글 목록
				//ArrayList<Rep> list = repService.getRepByShareNum(share_num);
				ArrayList<JoinDTO> list = repService.getJoinRepByShareNum(gul_num);
				
				//point
				Point p = pointService.getPoint(s.getPoint_num());
				int point = p.getPoint();
				
				//글 댓글 수 
				int repCnt = repService.getRepCnt(gul_num);
				System.out.println("repCnt: "+repCnt);
				
				if(session.getAttribute("id") != null){
					
					//내 댓글 목록
					Rep r = new Rep();
					r.setRep_writer(mem_num);
					r.setShare_num(gul_num);
					ArrayList<Rep> myRep = repService.getRep(r);
					
					//metoo_yn 받기
					Metoo me = new Metoo();
					me.setMem_num(m.getMem_num());
					me.setShare_num(gul_num);
					
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
					
					for(int i = 0; i<list.size(); i++){
						System.out.println("list:" + list.get(i).getRep_content());
					}
					
					mav.addObject("s", s); // 공유글
					mav.addObject("list", list); // 전체 댓글
					mav.addObject("rCnt", repCnt); //댓글 수
					mav.addObject("point", point); //점수
					mav.addObject("mem_num", mem_num);
					mav.addObject("type", m.getMem_status());
					mav.setViewName("shareplan/shareview");
				} else {
					for (int i = 0; i < list.size(); i++) {
						System.out.println("list:" + list.get(i).getRep_content());
					}
					
					mav.addObject("s", s); // 공유글
					mav.addObject("rCnt", repCnt); //댓글 수
					mav.addObject("list", list); // 전체 댓글
					mav.addObject("point", point); //점수
					mav.setViewName("shareplan/shareview2");
				}
				return mav;
	}
}
