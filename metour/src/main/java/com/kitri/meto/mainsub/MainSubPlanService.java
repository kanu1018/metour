package com.kitri.meto.mainsub;

import java.util.ArrayList;

import com.kitri.meto.JoinDTO.JoinDTO;

public interface MainSubPlanService {
	JoinDTO getMainPlan(int main_num);
	ArrayList<JoinDTO> getMainSubPlanByMainNum(int main_num);
}
