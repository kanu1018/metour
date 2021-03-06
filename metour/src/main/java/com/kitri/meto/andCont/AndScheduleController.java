package com.kitri.meto.andCont;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.meto.member.MemberDaoService;
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
		System.out.println(main_writer);
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
		int point_num = scheduleService.getByPointNum();
		schedule.setPoint_num(point_num);
		scheduleService.addPointNum(point_num);

		scheduleService.addSchedule(schedule);
	}
				
	@RequestMapping(value="/and/schedule/getDay.do")
	public ModelAndView getDay(@RequestParam (value="id") String id){	
		ModelAndView mav = new ModelAndView("schedule/getScheduleDay");
		System.out.println("getDay.do들어옴 id="+id);
		int mem_num = memberService.getMem_numById(id);
		ArrayList<Schedule> times = scheduleService.getScheduleByDate(mem_num);
		
		mav.addObject("times",times);		
		return mav;
	}
	
	@RequestMapping(value="/and/schedule/getMainNum.do")
	public ModelAndView getMainNum(@RequestParam ("main_writer") int main_writer,@RequestParam ("main_date") String main_date ){	
		ModelAndView mav = new ModelAndView("member/andcheck");
		System.out.println("getMainNum.do탔음:"+main_writer);
		System.out.println("getMainNum.do탔음:"+main_date);
		Schedule s = new Schedule();
		s.setMain_date(main_date);
		s.setMain_writer(main_writer);
		int number = scheduleService.getMainNumByMainWriterAndMainDate(s);
		mav.addObject("number",number);		
		return mav;
	}
	
	
	@RequestMapping(value="/and/schedule/getGPS.do")
	public String getGPS(@RequestParam(value="sub_num") int sub_num){	
		SubPlan sp = subPlanService.getSubPlan(sub_num);
		System.out.println("안녕 서브넘버야?"+sp.getMission_yn());
	
		if(sp.getMission_yn().equals("0")){
			sp.setMission_yn("2");
		}else if(sp.getMission_yn().equals("1")){
			sp.setMission_yn("3");
		}
		
		subPlanService.editSubPlanByYN(sp);
		return "";
	}
}
