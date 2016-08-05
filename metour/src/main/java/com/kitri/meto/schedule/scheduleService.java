package com.kitri.meto.schedule;

import java.util.List;

import com.kitri.meto.JoinDTO.JoinDTO;

public interface scheduleService {
	void addSchedule(Schedule s);
	void delSchedule(int main_num);
	void editSchedule(Schedule s);
	Schedule getSchedule(Schedule schdeule);
	List<Schedule> getSchedules(int main_writer);
	int getByPointNum();
	int getByMainNum();
	Schedule getByTitle(int main_num);
	void addPoint(JoinDTO j);
}
