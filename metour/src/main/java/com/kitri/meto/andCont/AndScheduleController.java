package com.kitri.meto.andCont;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.meto.member.MemberDaoService;
import com.kitri.meto.schedule.CalendarDayFlag;
import com.kitri.meto.schedule.Schedule;
import com.kitri.meto.schedule.scheduleService;
import com.kitri.meto.subplan.SubPlan;
import com.kitri.meto.subplan.SubPlanService;

@Controller
public class AndScheduleController {
	
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
	
	@Resource(name="MemberService")
	private MemberDaoService memberService;

	public void setMemberService(MemberDaoService memberService) {
		this.memberService = memberService;
	}

	Calendar now = Calendar.getInstance();
	Calendar cal = Calendar.getInstance();
	int year = 0;
	int month = 0;
	int day =0;
	int now_y = 0;
	int now_m = 0;
	int now_d = 0;
	int dow=0;
	int flag=0;

	
	
	@RequestMapping(value="/and/schedule/getList.do")
	public ModelAndView getListSchedule(@RequestParam ("main_writer") int main_writer){	
		ModelAndView mav = new ModelAndView("schedule/getScheduleList");
		List<Schedule> schedules = scheduleService.getSchedules(main_writer);
		mav.addObject("schedules",schedules);		
		return mav;
	}
	@RequestMapping(value="/and/schedule/getMainSchedule.do")
	public ModelAndView getSchedule(@RequestParam ("main_num") int main_num){	
		ModelAndView mav = new ModelAndView("schedule/getMainSchedule");
		Schedule schedule = scheduleService.getByTitle(main_num);
		mav.addObject("schedule",schedule);		
		return mav;
	}
	
	@RequestMapping(value="/and/schedule/deleteMainSchedule.do")
	public void delSchedule(@RequestParam ("main_num") int main_num){	
		scheduleService.delSchedule(main_num);
	}
	
	@RequestMapping(value="/and/schedule/insertMainSchedule.do")
	public void delSchedule(@RequestParam ("main_writer") int main_writer, @RequestParam(value="year") int year, @RequestParam(value="month") int month, @RequestParam(value="day") int day,@RequestParam(value="main_title") String main_title){	
		Schedule schedule = new Schedule();
		schedule.setMain_title(main_title);
		schedule.setMain_writer(main_writer);
		String date=year+"/"+month+"/"+day;
		schedule.setMain_date(date);
		System.out.println(date);
		schedule.setPoint_num((scheduleService.getByPointNum()+1));
		
		scheduleService.addSchedule(schedule);
	}
				
	
}
