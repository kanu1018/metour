package com.kitri.meto.schedule;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ScheduleController {
	
	@Resource(name="scheduleSerivce")
	private scheduleService scheduleService;
	
	public void setScheduleService(scheduleService scheduleService){
		this.scheduleService = scheduleService;
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
		/*HttpSession session = request.getSession();
		session.getId();
		*/
		int main_writer = 100;
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

	
	@RequestMapping("/schedule/dateplan.do")
	public ModelAndView specific(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("schedule/dateplan");
		/*HttpSession session = request.getSession();
		session.getId();
		*/
		int main_writer = 100;
		
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
		
		
		if(request.getParameter("flag")!=null){
			flag = Integer.parseInt(request.getParameter("flag"));
			mav.addObject("Flag",flag);
			if(flag>=3){
				//reserved
				Schedule ss = new Schedule();
				ss.setMain_writer(main_writer);
				ss.setMain_date(main_date);
				Schedule schedule= scheduleService.getSchedule(ss);
				mav.addObject("schedule",schedule);
				
			}else{
				//today, not reserved day
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
