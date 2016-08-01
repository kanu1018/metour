package com.kitri.meto.mainsub;

import java.util.ArrayList;

import com.kitri.meto.JoinDTO.JoinDTO;

public interface MainSubPlanMapper {
	ArrayList<JoinDTO> selectByMainNum(int main_num);
}
