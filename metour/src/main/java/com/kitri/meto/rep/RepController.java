package com.kitri.meto.rep;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kitri.meto.member.Member;
import com.kitri.meto.member.MemberDaoService;

@Controller
public class RepController {
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
	
	@RequestMapping(value = "/rep/add.do")
	public String repAdd(HttpServletRequest req,  @RequestParam(value="rep_content") String rep_content, @RequestParam(value="share_num") int share_num){
		//세션 id, mem_num 받아오기
		HttpSession session = req.getSession();
		String id = session.getAttribute("id").toString();
		Member m = memberService.getMember(id);
		int mem_num = m.getMem_num();
		
		//add
		Rep r = new Rep();
		r.setRep_writer(mem_num);
		r.setShare_num(share_num);
		r.setRep_content(rep_content);
		
		repService.addRep(r);
				
		return "redirect:/share/view.do?share_num="+share_num;
	}
	
	@RequestMapping(value = "/rep/edit.do")
	public String repEdit(HttpServletRequest req, @RequestParam(value="rep_content") String rep_content,
			@RequestParam(value="rep_num") int rep_num, @RequestParam(value="share_num") int share_num){
		//세션 id, mem_num 받아오기
		HttpSession session = req.getSession();
		String id = session.getAttribute("id").toString();
		Member m = memberService.getMember(id);
		int mem_num = m.getMem_num();
		
		//update
		Rep r = new Rep();
		r.setRep_num(rep_num);
		r.setRep_content(rep_content);
		r.setShare_num(share_num);
		r.setRep_writer(mem_num);
		
		repService.editeRep(r);
		return "redirect:/share/view.do?share_num="+share_num;
	}
	
	@RequestMapping(value = "/rep/del.do")
	public String repDel(HttpServletRequest request, 
			@RequestParam(value="rep_num") int rep_num, @RequestParam(value="share_num") int share_num){
		repService.delRep(rep_num);
		return "redirect:/share/view.do?share_num="+share_num;
	}
	
	
}
