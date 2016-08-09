package com.kitri.meto.andCont;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.meto.JoinDTO.JoinDTO;
import com.kitri.meto.mainsub.MainSubPlanService;

@Controller
public class AndMainSubPlanController {
	@Resource(name="MainSubPlanService")
	private MainSubPlanService msService;
	
	public void setMainSubPlanService(MainSubPlanService msService){
		this.msService = msService;
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////�뿬湲곗닔�젙�븷嫄곗뼂
	@RequestMapping(value="/and/ms/select.do")//�궗吏꾨텋�윭�삤湲�
	public ModelAndView msList(@RequestParam(value="main_num") int main_num){
		ModelAndView mav = new ModelAndView("shareplan/share");
		JoinDTO j = msService.getMainPlan(main_num);
		ArrayList<JoinDTO> subList = msService.getMainSubPlanByMainNum(main_num);
		mav.addObject("j", j);
		mav.addObject("s", subList);
		return mav;
	}
	
	@RequestMapping("/and/ms/selectPlans.do")
	public String selectPlans(HttpServletRequest request, @RequestParam(value="main_num") String main_num){
		String main_nums[] = main_num.split("/");

		for(int i = 0; i < main_nums.length; i++){
			System.out.println("main_nums"+i+":"+main_nums[i]);
		}
		
		return "redirect:/schedule/schedule.do";
	}
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////
	private boolean isDate(int y, int m, int d) {
		m -= 1;
        Calendar c = Calendar.getInstance();
        c.setLenient(false);   
        try {  
             c.set(y, m, d);
             Date dt = c.getTime();
        } catch(IllegalArgumentException e) {
             return false;
        }
        return true;
	}
}
