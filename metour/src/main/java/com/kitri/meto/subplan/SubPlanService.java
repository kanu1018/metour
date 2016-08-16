package com.kitri.meto.subplan;

import java.util.ArrayList;

public interface SubPlanService {
	void addSubPlan(SubPlan sp);
	ArrayList<SubPlan> getSubPlans(int mainPlanNum);
	SubPlan getSubPlan(int subNum);
	void delSubPlan(int subNum);
	void editSubPlan(SubPlan sp);
	SubPlan getSupPlanTime(int subNum);
	void updatePhoto(SubPlan subplan);
	ArrayList<SubPlan> getSubPlanByMain(int main_num);
}
