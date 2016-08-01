package com.kitri.meto.mainplan;

import java.util.ArrayList;

import com.kitri.meto.JoinDTO.JoinDTO;

public interface MainPlanMapper {
	void insert(JoinDTO jd);
	void update(JoinDTO jd);
	void delete(int main_num);
	
	JoinDTO select(int main_num);
	ArrayList<JoinDTO> selectAll(int main_num);
}
