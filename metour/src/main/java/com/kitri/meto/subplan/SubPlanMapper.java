package com.kitri.meto.subplan;

import java.util.ArrayList;

public interface SubPlanMapper {
	void insert(SubPlan sp);
	ArrayList<SubPlan> selectAll(int MainPlanNum);
	SubPlan select(int subNum);
	void delete(int subNum);
	void update(SubPlan sp);
}
