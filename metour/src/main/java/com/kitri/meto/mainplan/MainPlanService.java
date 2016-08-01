package com.kitri.meto.mainplan;

import java.util.ArrayList;

import com.kitri.meto.JoinDTO.JoinDTO;

public interface MainPlanService {
	void addMainPlan(JoinDTO jd);
	void editMainPlan(JoinDTO jd);
	void delMainPlan(int main_num);
	
	JoinDTO getMainPlan(int main_num);
	ArrayList<JoinDTO> getMainplanAll(int main_num);
}
