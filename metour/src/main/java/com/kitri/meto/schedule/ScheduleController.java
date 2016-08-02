package com.kitri.meto.schedule;

import java.util.Calendar;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ScheduleController {
	
	@Resource(name="scheduleSerivce")
	private scheduleService scheduleService;
	
	public void setScheduleService(scheduleService scheduleService){
		this.scheduleService = scheduleService;
	}
	
	Calendar now = Calendar.getInstance();
	int year = now.get(Calendar.YEAR);
	int month = now.get(Calendar.MONTH);
	int date = now.get(Calendar.WEEK_OF_MONTH);
	int week = now.get(Calendar.WEEK_OF_YEAR);
	
	
	@RequestMapping(value="/schedule/")
	public String calendar(){
		System.out.println(year+"/"+month+"/"+date+"/"+week);
		return "schedule/calendar";
	}
	

}
