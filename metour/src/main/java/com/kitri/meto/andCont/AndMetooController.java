package com.kitri.meto.andCont;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.meto.member.Member;
import com.kitri.meto.member.MemberDaoService;
import com.kitri.meto.metoo.Metoo;
import com.kitri.meto.metoo.MetooService;
import com.kitri.meto.point.Point;
import com.kitri.meto.point.PointService;
import com.kitri.meto.shareplan.SharePlan;
import com.kitri.meto.shareplan.SharePlanService;

@Controller
public class AndMetooController {
	@Resource(name="MetooService")
	private MetooService metooService;
	public void setSharePlanService(MetooService metooService){
		this.metooService = metooService;
	}
	
	@Resource(name="SharePlanService")
	private SharePlanService shareService;
	public void setSharePlanService(SharePlanService shareService){
		this.shareService = shareService;
	}
	
	@Resource(name="MemberService")
	private MemberDaoService memberService;
	public void setMemberService(MemberDaoService memberService) {
		this.memberService = memberService;
	}
	
	@Resource(name="PointService")
	private PointService pointService;
	public void setMemberService(PointService pointService) {
		this.pointService = pointService;
	}
	
	@RequestMapping(value = "/and/metoo/metoo.do")
	public String view(HttpServletRequest req, @RequestParam(value="share_num") int share_num, @RequestParam(value="type") int type){//세션받기
		System.out.println("metoo");
		//세션 id, mem_num 받아오기
		HttpSession session = req.getSession();
		String id = session.getAttribute("id").toString();
		Member m = memberService.getMember(id);
		System.out.println(m.getMem_num());
		
		Metoo me = new Metoo();
		me.setShare_num(share_num);
		me.setMem_num(m.getMem_num()); //세션받기

		if (type == 1){ // metoo_yn 'y' , metoo++
			metooService.editMetooY(me); // 세션받기
			shareService.metooPlue(share_num);
			System.out.println("metoo++");
		} else if (type == 2) { // metoo_yn 'n', metoo--
			metooService.editMetooN(me); // 세션받기
			shareService.metooMinus(share_num);
			System.out.println("metoo--");
		}
		
		return "redirect:/share/view.do?share_num="+share_num;
	}
	
	@RequestMapping(value = "/and/metoo/update.do")
	public String updateYN(@RequestParam(value="mem_num") int mem_num, @RequestParam(value="share_num") int share_num, @RequestParam(value="type") int type){//세션받기
		System.out.println("metoo update");
		
		Metoo me = new Metoo();
		me.setMem_num(mem_num);
		me.setShare_num(share_num);
		
		//point
		SharePlan s = shareService.getSharePlan(share_num);
		int meto = s.getMetoo();
		int point_num = s.getPoint_num();
		Point p = pointService.getPoint(point_num);
		int point = p.getPoint();
		
		p.setPoint_num(point_num);

		if (type == 1){ // metoo_yn 'y' , metoo++
			metooService.editMetooY(me); // 세션받기
			shareService.metooPlue(share_num);
			point++;
			p.setPoint(point);
			pointService.edit(p);
			System.out.println("metoo++");
		} else if (type == 2) { // metoo_yn 'n', metoo--
			/*metooService.editMetooN(me); // 세션받기
			shareService.metooMinus(share_num);
			System.out.println("metoo--");*/
			if(meto != 0){
				metooService.editMetooN(me); // 세션받기
				shareService.metooMinus(share_num);
				if(point != 0){
					point--;
					p.setPoint(point);
					pointService.edit(p);
				}
				System.out.println("metoo--");
			} else if(meto == 0){
				metooService.editMetooN(me);
			}	
		}
		
		return "";
	}
	
	@RequestMapping(value="/and/metoo/yn.do")
	public ModelAndView metooYN(@RequestParam(value="mem_num") int mem_num, @RequestParam(value="share_num") int share_num){
		ModelAndView mav = new ModelAndView("android/andMetoo");
		System.out.println("metoo/yn");
		System.out.println(mem_num);
		
		Metoo me = new Metoo();
		me.setMem_num(mem_num);
		me.setShare_num(share_num);
		
		int cnt = metooService.getMetooCnt(me);
		
		if(cnt == 0){
			metooService.addMetoo(me);
			System.out.println("metoo 생성");
		} else {
			me = metooService.getMetoo(me);
			System.out.println("yn: "+me.getMetoo_yn());
		}

		mav.addObject("me", me);
		
		return mav;
	}
}
