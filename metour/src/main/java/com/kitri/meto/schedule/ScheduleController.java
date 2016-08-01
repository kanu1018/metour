package com.kitri.meto.schedule;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ScheduleController {
	
	@Resource(name="ScheduleSerivce")
	private ScheduleDaoService scheduleDaoService;
	
	public void setScheduleService(ScheduleDaoService scheduleDaoService){
		this.scheduleDaoService = scheduleDaoService;
	}
	
	@RequestMapping(value="/schedule/")
	public String calendar(){
		return "schedule/calendar";
	}
	

}
