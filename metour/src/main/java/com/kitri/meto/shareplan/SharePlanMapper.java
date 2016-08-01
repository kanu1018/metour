package com.kitri.meto.shareplan;

import java.util.ArrayList;

import com.kitri.meto.JoinDTO.JoinDTO;

public interface SharePlanMapper {
	void insert(JoinDTO jd);
	void undate(JoinDTO jd);
	void delete(JoinDTO jd);
	
	JoinDTO select(int share_num);
	ArrayList<JoinDTO> selectAll(int share_num);
}
