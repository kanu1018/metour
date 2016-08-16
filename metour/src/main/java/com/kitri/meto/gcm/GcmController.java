package com.kitri.meto.gcm;

import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GcmController {
	
	@RequestMapping("/gcm/gcmForm.do")
	public ModelAndView gcm(HttpServletRequest request, @RequestParam(value="KEY")String key, @RequestParam(value="REG")String reg){
		ModelAndView mav = new ModelAndView("test/sendgcmreg");
		System.out.println(key);
		System.out.println(reg);
		mav.addObject("KEY",key);
		mav.addObject("REG",reg);
		return mav;
	}
	
	@RequestMapping("/gcm/gcmsend.do")
	public String gcmsend(){
		return "test/sendgcm";
	}
	
	@RequestMapping("/gcm/gcmsend1.do")
	public String gcmsend1(){
		String title = "보내자";
	    String msg = "받았니";
	    String reg_id = "APA91bFNBzL7T426Rm0rTTLc5Ct8mFfqirYe6Vy6PDJAn16a---Rma_OKH7fjuk5T2HMP-Hn-m4HJ5unzwM5wZDzGZPyy8VteUgTIJnXEGaIqpu86bpXqY7U9DOXmdpg8QkkAW9d7dzp";
	    //PrintStream out = null;
	 // GCM 정보 셋팅
	    GCMVo gcmVo = new GCMVo();
	    try {
			gcmVo.setTitle(title);
			gcmVo.setMsg(msg);
			gcmVo.setTypeCode("");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    List<String> reslist = new ArrayList<String>();
	    reslist.add(reg_id);
	    
	    GCMUtil gcmUtil = new GCMUtil(reslist, gcmVo);
	    
	    /*for(int i=0; i<gcmUtil.rtnList.size(); i++){
	        GCMVo rtnGcmVo = gcmUtil.rtnList.get(i); 
			out.println("regId : " + rtnGcmVo.getRegId());
	        out.println("성공 여부 : " + rtnGcmVo.getPushSuccessOrFailure());
	        out.println("메시지ID : " + rtnGcmVo.getMsgId());
	        out.println("에러메시지 : " + rtnGcmVo.getErrorMsg());
	     } */
		return null;
	}
}
