package com.kitri.meto.schedule;

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
import com.kitri.meto.subplan.SubPlan;
import com.kitri.meto.subplan.SubPlanService;

@Controller
public class ScheduleController {
	
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

	
	
	@RequestMapping(value="/schedule/schedule.do")
	public ModelAndView calendar(HttpServletRequest request){
		HttpSession session = request.getSession();
		String id = session.getAttribute("id").toString();
		int main_writer = memberService.getMem_numById(id);
		List<Schedule> schedules = scheduleService.getSchedules(main_writer);
		List<CalendarDayFlag> DayFlag = new ArrayList<CalendarDayFlag>(42);
		
		now_y = now.get(Calendar.YEAR);
		now_m = now.get(Calendar.MONTH);
		now_d = now.get(Calendar.DAY_OF_MONTH);
		
		if(request.getParameter("action") == null){
			year = now_y;
			month = now_m;
			cal.set(year, month, 1);
		}else{
			month = Integer.parseInt(request.getParameter("month"));
			year = Integer.parseInt(request.getParameter("year"));
			cal.set(year, month, 1);
			if(Integer.parseInt(request.getParameter("action"))==1){
	            cal.add(Calendar.MONTH, 1);
	            month = cal.get(Calendar.MONTH);
	            year = cal.get(Calendar.YEAR);
			}else{              
	            cal.add(Calendar.MONTH, -1);
	            month = cal.get(Calendar.MONTH);
	            year = cal.get(Calendar.YEAR);
	        }
		}
		dow = cal.get(Calendar.DAY_OF_WEEK);
		flag=0;
		int week_num = 1;
        int day = 1;
        boolean flag_today =false;
        boolean flag_reserved = false;
		
        for(int index=0;index<42;index++){			
				if(week_num<dow){
					week_num+=1;
					CalendarDayFlag CDF = new CalendarDayFlag(index, week_num, day, flag);
					DayFlag.add(index, CDF);
				}else{
					if(isDate(year, month+1, day)){
						for(int k=0;k<schedules.size();k++){
							if(year==schedules.get(k).getYear()&&(month+1)==schedules.get(k).getMonth()&&day==schedules.get(k).getDay()){
								flag_reserved =true;
								break;
							}else{
								flag_reserved=false;
							}
						}
						if(year==now_y&&month==now_m&&day==now_d){
							flag=2;
							flag_today=true;
						}else{
							flag_today =false;
							flag=1;
						}
						
						if(flag_today&&flag_reserved){
							flag=4;
						}else if(flag_reserved&&!flag_today){
							flag=3;
						}
						CalendarDayFlag CDF = new CalendarDayFlag(index,week_num, day, flag);
						DayFlag.add(index, CDF);
						week_num +=1;
						day +=1;
					}else{
						flag=0;
						CalendarDayFlag CDF = new CalendarDayFlag(index,week_num, day, flag);
						DayFlag.add(index, CDF);
					}
					
				}
		}
		
		ModelAndView mav = new ModelAndView("schedule/calendar");
		mav.addObject("schedules", schedules);
		mav.addObject("Year",year); //make Calendar
		mav.addObject("Month",month); //make Calendar
		mav.addObject("DOW",dow); //make Calendar
		mav.addObject("DayFlag", DayFlag);
		return mav;
	}

	
	@RequestMapping("/schedule/datePlan.do")
	public ModelAndView specific(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("schedule/datePlan");
		HttpSession session = request.getSession();
		String id = session.getAttribute("id").toString();
		int main_writer = memberService.getMem_numById(id);
		
		year = Integer.parseInt(request.getParameter("year"));
		month = Integer.parseInt(request.getParameter("month"));
		day = Integer.parseInt(request.getParameter("day"));
		String main_date = year+"/"+month+"/"+day;

		int n_year =year;
		int n_month =month;
		int n_day = day;
		
		int l_year =year;
		int l_month =month;
		int l_day = day;
		
		
		List<Schedule> schedules = scheduleService.getSchedules(main_writer);
		
		for(int i=0; i<schedules.size();i++){
			if(year==schedules.get(i).getYear()&&month==schedules.get(i).getMonth()&&day==schedules.get(i).getDay()){
				Schedule ss = new Schedule();
				ss.setMain_writer(main_writer);
				ss.setMain_date(main_date);
				Schedule schedule= scheduleService.getSchedule(ss);
				
				int main_num = schedule.getMain_num();
				ArrayList<SubPlan> subPlans = subPlanService.getSubPlans(main_num);
				
				mav.addObject("subPlans",subPlans);
				mav.addObject("schedule",schedule);
				break;
			}
		}
		

		if(isDate(year, month, day+1)){
			n_day += 1;
		}else{
			if(isDate(year, month+1,1)){
				n_day=1;
				n_month+=1;
			}else{
				n_month=1;
				n_day=1;
				n_year+=1;
			}					
		}
		
		if(isDate(year, month, day-1)){
			l_day = day-1;
		}else{
			if(month-1 == 0){
				l_year-=1;
				l_month =12;
				l_day=31;
			}else{
				if(isDate(year, month-1,31)){
					l_month -=1;
					l_day=31;
				}else if(isDate(year, month-1,30)){
					l_month -=1;
					l_day=30;
				}else if(isDate(year, month-1,29)){
					l_month -=1;
					l_day=29;
				}else if(isDate(year, month-1,28)){
					l_month -=1;
					l_day=28;
				}
			}
		}	
		

		
		
		
		
		
		mav.addObject("Year",year);
		mav.addObject("Month",month);
		mav.addObject("Day",day);
		mav.addObject("N_Year",n_year);
		mav.addObject("N_Month",n_month);
		mav.addObject("N_Day",n_day);
		mav.addObject("L_Year",l_year);
		mav.addObject("L_Month",l_month);
		mav.addObject("L_Day",l_day);
		
			
		return mav;
	}
	
	@RequestMapping("/schedule/listPlan.do")
	public ModelAndView ShareAndDelete(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("/schedule/listPlan");
		/*HttpSession session = request.getSession();
		session.getId();
		*/
		int main_writer = 100;
		int action = Integer.parseInt(request.getParameter("action").toString());
		List<Schedule> schedules = scheduleService.getSchedules(main_writer);
		
		
		
		mav.addObject("schedules",schedules);
		mav.addObject("action",action);		
		return mav;
	}
	
	@RequestMapping("/schedule/deletePlan.do")
	public String deleteMainPlan(HttpServletRequest request){
		int main_num = Integer.parseInt(request.getParameter("main_num").toString());
		
		scheduleService.delSchedule(main_num);
		/*HttpSession session = request.getSession();
		session.getId();
		*/
		System.out.println(main_num);
		return "redirect:/schedule/schedule.do";
	}
	
	
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
	
	@RequestMapping("/schedule/insertPlan.do")
	public String insertPlan(HttpServletRequest request, @RequestParam(value="title") String main_title, 
			@RequestParam(value="day") String day){
		HttpSession session = request.getSession();
		String id = session.getAttribute("id").toString();
		Schedule s = new Schedule();
		s.setMain_title(main_title);
		s.setMain_writer(memberService.getMem_numById(id));
		s.setMain_date(day);
		s.setPoint_num(scheduleService.getByPointNum()+1);
		
		scheduleService.addSchedule(s);
		return "redirect:/subplan/list.do?main_num="+scheduleService.getByMainNum();
	}
	
	
}
