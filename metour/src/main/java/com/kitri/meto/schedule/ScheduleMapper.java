package com.kitri.meto.schedule;

import java.util.ArrayList;
import java.util.List;

import com.kitri.meto.JoinDTO.JoinDTO;

public interface ScheduleMapper {
	void insert(Schedule s);
	void delete(int main_num);
	Schedule select(Schedule schedule);
	List<Schedule> selectAll(int main_writer);
	void update(Schedule s);
	int selectByPointNum();
	int selectByMainNum();
	Schedule selectByTitle(int main_num);
	void insertPoint(JoinDTO j);
	void insertPointNum(int point);
	
	ArrayList<Schedule> selectByDate(int main_writer);
	String selectByMainNumFromSchedule(Schedule s);
}
