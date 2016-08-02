package com.kitri.meto.mainsub;

import java.util.ArrayList;

import com.kitri.meto.JoinDTO.JoinDTO;

public interface MainSubPlanMapper {
	JoinDTO select(int main_num);
	ArrayList<JoinDTO> selectByMainNum(int main_num);
}
