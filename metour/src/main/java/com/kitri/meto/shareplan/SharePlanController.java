package com.kitri.meto.shareplan;

import java.util.ArrayList;

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
	
	/////////////
	@RequestMapping(value = "/share/share.do")
	public String share(){
		return "/shareplan/share";
	}
	
	@RequestMapping(value = "/share/add.do")
	public String shareAdd(HttpServletRequest req, SharePlan s, 
			@RequestParam(value="content") String content, @RequestParam(value="point_num") int point_num){
		//mem_num 받아오기
		String id = req.getSession().getAttribute("id").toString();
		Member m = memberService.getMember(id);
		
		s.setWriter(m.getMem_num()); //수정:세션
		s.setContent(content);
		s.setPoint_num(point_num);
		shareService.addSharePlan(s);
		System.out.println("성공");
		return "redirect:/share/list.do";
	}
	
	@RequestMapping(value="/share/list.do")
	public ModelAndView shareList(HttpServletRequest req){//HttpServletRequest req
		//세션 id, mem_num 받아오기
		//String id = req.getSession().getAttribute("id").toString();
		//Member m = memberService.getMember(id);
		//공유글
		ArrayList<SharePlan> list = shareService.getSharePlanAll();
		//현재 id metoo 여부
		//ArrayList<Metoo> myMetoo = metooService.getMetoo(m.getMem_num());
		//ArrayList<Metoo> myMetoo = metooService.getMetoo(1);
		//
		ModelAndView mav = new ModelAndView("shareplan/sharelist");
		mav.addObject("list", list);
		//mav.addObject("my", myMetoo);
		return mav;
	}
	
	@RequestMapping(value="/share/view.do")//세션받기
	public ModelAndView shareView(HttpServletRequest req, @RequestParam(value="share_num") int share_num){
		//세션 id, mem_num 받아오기
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
		me = metooService.getMetoo(me);
		int cnt = metooService.getMetooCnt(me);
		System.out.println(me.getMetoo_yn());
		
		//
		ModelAndView mav = new ModelAndView("shareplan/shareview");
		mav.addObject("s", s);
		mav.addObject("me", me);
		mav.addObject("cnt", cnt);
		return mav;
	}
	
	/*@RequestMapping(value = "/share/metoo.do")
	public String view(HttpServletRequest req, @RequestParam(value="share_num") int share_num, @RequestParam(value="type") int type){//세션받기
		//세션 id, mem_num 받아오기
		//String id = req.getSession().getAttribute("id").toString();
		//Member m = memberService.getMember(id);
		
		//share_plan metoo 수 변경
		if(type == 1){
			metooService.addMetoo(me);
		} else if (type == 2){
			shareService.editMetoo(share_num, metoo);
		} else if (type == 3) {
			
		}
		
		
		// metoo insert
		Metoo me = new Metoo();
		me.setMem_num(2); //세션값
		me.setShare_num(share_num);
		metooService.addMetoo(me);
		
		return "redirect:/share/list.do";
	}*/
	
	@RequestMapping(value = "/resourceTest")
	public String resourceTest(){
		return "/subplan/subPlanPhoto";
	}
	
	/*@RequestMapping("/file_uploader")
	public String file_uploader(HttpServletRequest request, HttpServletResponse response, Editor editor){
		System.out.println("들어와"); 
		String return1=request.getParameter("callback");
		 String return2="?callback_func=" + request.getParameter("callback_func");
		 String return3="";
		 String name = "";
		 try {
			if(editor.getFiledata() != null && editor.getFiledata().getOriginalFilename() != null && !editor.getFiledata().getOriginalFilename().equals("")) {
	             // 기존 상단 코드를 막고 하단코드를 이용
	            name = editor.getFiledata().getOriginalFilename().substring(editor.getFiledata().getOriginalFilename().lastIndexOf(File.separator)+1);
				String filename_ext = name.substring(name.lastIndexOf(".")+1);
				filename_ext = filename_ext.toLowerCase();
			   	String[] allow_file = {"jpg","png","bmp","gif"};
			   	int cnt = 0;
			   	for(int i=0; i<allow_file.length; i++) {
			   		if(filename_ext.equals(allow_file[i])){
			   			cnt++;
			   		}
			   	}
			   	if(cnt == 0) {
			   		return3 = "&errstr="+name;
			   	} else {
			   		//파일 기본경로
		    		String dftFilePath = request.getSession().getServletContext().getRealPath("/");
		    		//파일 기본경로 _ 상세경로
		    		String filePath = dftFilePath + "resources"+ File.separator + "smarteditor" + File.separator +"upload" + File.separator;
		    		File file = new File(filePath);
		    		if(!file.exists()) {
		    			file.mkdirs();
		    		}
		    		String realFileNm = "";
		    		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
					String today= formatter.format(new java.util.Date());
					realFileNm = today+UUID.randomUUID().toString() + name.substring(name.lastIndexOf("."));
					String rlFileNm = filePath + realFileNm;
					///////////////// 서버에 파일쓰기 /////////////////
					editor.getFiledata().transferTo(new File(rlFileNm));
					///////////////// 서버에 파일쓰기 /////////////////
		    		return3 += "&bNewLine=true";
		    		return3 += "&sFileName="+ name;
		    		return3 += "&sFileURL=/resources/smarteditor/upload/"+realFileNm;
			   	}
			}else {
				  return3 += "&errstr=error";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return "redirect:"+return1+return2+return3;
	}*/
	
	
}


