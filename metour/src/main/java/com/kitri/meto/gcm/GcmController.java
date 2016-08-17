package com.kitri.meto.gcm;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.meto.reg.Reg;
import com.kitri.meto.reg.RegService;
import com.kitri.meto.schedule.Schedule;
import com.kitri.meto.subplan.SubPlan;
import com.kitri.meto.subplan.SubPlanService;
import com.kitri.meto.thread.PhotoEvent;

@Controller
public class GcmController {
	
	@Resource(name="RegService")
	private RegService regService;
	
	public void setRegService(RegService regService){
		this.regService = regService;
	}
	@Resource(name="SubPlanService")
	private SubPlanService subPlanService;

	public void setSubPlanService(SubPlanService subPlanService) {
		this.subPlanService = subPlanService;
	}
	@RequestMapping("/gcm/gcmForm.do")
	public ModelAndView gcm(HttpServletRequest request, @RequestParam(value="KEY")String key, @RequestParam(value="REG")String reg){
		ModelAndView mav = new ModelAndView("test/sendgcmreg");
		System.out.println(key);
		System.out.println(reg);
		mav.addObject("KEY",key);
		mav.addObject("REG",reg);
		return mav;
	}
	
	@RequestMapping("/gcm/gcmsend11.do")
	public String gcmsend(HttpServletRequest request, @RequestParam(value="KEY")String key, @RequestParam(value="REG")String reg, @RequestParam(value="TODAY")String today){
		System.out.println(key);
		System.out.println(today);
		String keys[] = key.split(":");
		Reg r = new Reg(Integer.parseInt(keys[1]),reg);
		if(regService.getReg(Integer.parseInt(keys[1])).getReg_id() != null){
			regService.addReg(r);
		} else{
			regService.editReg(r);
		}
		Schedule s = new Schedule();
		s.setMain_writer(Integer.parseInt(keys[1]));
		s.setMain_date(today);
		
		ArrayList<SubPlan> splist = subPlanService.getSubPlanByMain(Integer.parseInt(keys[1]));
		String reg_id = reg;
		if(splist.size()!=0){
			PhotoEvent pe = new PhotoEvent(splist,reg_id);
			pe.start();
		}
		return null;
	}
	////////////////////////////////////////////////////////////////////
	
	////////////////////////////////////////////////////////////////////
	
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
