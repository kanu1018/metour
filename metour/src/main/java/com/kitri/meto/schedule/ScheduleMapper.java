package com.kitri.meto.schedule;

import java.util.List;

public interface ScheduleMapper {
	void insert(Schedule s);
	void delete(int main_num);
	Schedule select(int main_num);
	List<Schedule> selectAll();
	void update(Schedule s);
}
