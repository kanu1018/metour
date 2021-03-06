package com.kitri.meto.subplan;

import java.util.ArrayList;

import com.kitri.meto.schedule.Schedule;

public interface SubPlanMapper {
	void insert(SubPlan sp);
	ArrayList<SubPlan> selectAll(int mainPlanNum);
	SubPlan select(int subNum);
	void delete(int subNum);
	void update(SubPlan sp);
	SubPlan selectSupPlanTime(int subNum);
	void upPhoto(SubPlan subplan);
	ArrayList<SubPlan> selectByMainNum(int main_num);
	ArrayList<SubPlan> selectBySchedule(Schedule s);
	void updateMissionYN(SubPlan sp);
}
