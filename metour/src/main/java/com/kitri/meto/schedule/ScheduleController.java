package com.kitri.meto.schedule;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

@Controller
public class ScheduleController {
	
	@Resource(name="ScheduleSerivce")
	private ScheduleDaoService scheduleDaoService;
	
	public void setScheduleService(ScheduleDaoService scheduleDaoService){
		this.scheduleDaoService = scheduleDaoService;
	}
	
	

}
