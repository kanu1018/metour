package com.kitri.meto.schedule;

import java.util.List;

public interface ScheduleMapper {
	void insert(Schedule s);
	void delete(int main_num);
	Schedule select(Schedule schedule);
	List<Schedule> selectAll(int main_writer);
	void update(Schedule s);
}
