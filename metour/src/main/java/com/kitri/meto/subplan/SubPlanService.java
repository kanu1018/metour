package com.kitri.meto.subplan;

import java.util.ArrayList;

import com.kitri.meto.schedule.Schedule;

public interface SubPlanService {
	void addSubPlan(SubPlan sp);
	ArrayList<SubPlan> getSubPlans(int mainPlanNum);
	SubPlan getSubPlan(int subNum);
	void delSubPlan(int subNum);
	void editSubPlan(SubPlan sp);
	SubPlan getSupPlanTime(int subNum);
	void updatePhoto(SubPlan subplan);
	ArrayList<SubPlan> getSubPlanByMain(int main_num);
	ArrayList<SubPlan> getSubPlanBySchedule(Schedule s);
}
