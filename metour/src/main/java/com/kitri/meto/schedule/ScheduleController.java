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

	
	@RequestMapping(value="/schedule.do")
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
			year = now.get(Calendar.YEAR);
			month = now.get(Calendar.MONTH);
			cal.set(year, month, 1);
		}else{
			month = Integer.parseInt(request.getParameter("month"));
			year = Integer.parseInt(request.getParameter("year"));
			cal.set(year, month, 1);
			if(Integer.parseInt(request.getParameter("action"))==1){
	            cal.add(Calendar.MONTH, 1); //다음달
	            month = cal.get(Calendar.MONTH);
	            year = cal.get(Calendar.YEAR);
			}else{              
	            cal.add(Calendar.MONTH, -1); //이전달
	            month = cal.get(Calendar.MONTH);
	            year = cal.get(Calendar.YEAR);
	        }
		}
		dow = cal.get(Calendar.DAY_OF_WEEK);

		int week_num = 0;
		int cal_num = 1;
        int day = 0;
        int index = 0;
        int flag=0;

        boolean flag_today =false;
        boolean flag_reserved = false;
        
		for(int i=1;i<7;i++){
			for(int j=1; j<8;j++){
				
				if(week_num<dow){
					week_num+=1;
				}else{
					if(isDate(year, month, day)){
						/*for(int k=0;k<schedules.size();k++){
							if(year==schedules.get(k).getYear()&&(month+1)==schedules.get(k).getMonth()&&day==schedules.get(k).getDay()){
								flag_reserved =true;
							}
						}*/
						if(year==now_y&&month==now_m&&day==now_d){
							//오늘
							flag=2;
							flag_today=true;
						}else{
							//날짜가 존재하지만, 오늘은 아님.
							flag=1;
						}
						week_num +=1;
						day +=1;
					}else{
						flag=0;
					}
					
				}
				
				System.out.println(index+"/"+week_num+"/"+day+"/"+flag);
				CalendarDayFlag CDF = new CalendarDayFlag(week_num, day, flag);
				DayFlag.add(index, CDF);
				index +=1;
			}//주의 요일별
		}
		
		
		
		
	
		ModelAndView mav = new ModelAndView("schedule/calendar2");
		mav.addObject("schedules", schedules);
		mav.addObject("Year",year); //make Calendar
		mav.addObject("Month",month); //make Calendar
		mav.addObject("DOW",dow); //make Calendar
		request.setAttribute("schedule2", schedules);
		mav.addObject("now",now);
		mav.addObject("now_Y", now_y); // Today`s
		mav.addObject("now_M", now_m); // Today`s
		mav.addObject("now_D", now_d); // Today`ss
		
		mav.addObject("DayFlag", DayFlag);
		
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
