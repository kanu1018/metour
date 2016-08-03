package com.kitri.meto.schedule;

import java.util.List;

public interface scheduleService {
	void addSchedule(Schedule s);
	void delSchedule(int main_num);
	void editSchedule(Schedule s);
	Schedule getSchedule(Schedule schdeule);
	List<Schedule> getSchedules(int main_writer);
	
}
