package com.kitri.meto.mainsub;

import java.util.ArrayList;

import com.kitri.meto.JoinDTO.JoinDTO;

public interface MainSubPlanService {
	ArrayList<JoinDTO> getMainSubPlanByMainNum(int main_num);
}
