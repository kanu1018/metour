package com.kitri.meto.subplan;

import java.util.ArrayList;

public interface SubPlanService {
	void addSubPlan(SubPlan sp);
	ArrayList<SubPlan> getSubPlans(int MainPlanNum);
	SubPlan getSubPlan(int subNum);
	void delSubPlan(int subNum);
	void editSubPlan(SubPlan sp);
}
