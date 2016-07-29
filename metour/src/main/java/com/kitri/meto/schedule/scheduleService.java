package com.kitri.meto.schedule;

public interface scheduleService {
	void addSchedule(Schedule s);
	void delSchedule(int main_num);
	void editSchedule(Schedule s);
	Schedule getSchedule(int main_num);
}
