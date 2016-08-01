package com.kitri.meto.shareplan;

import java.util.ArrayList;

import com.kitri.meto.JoinDTO.JoinDTO;

public interface SharePlanService {
	void addSharePlan(JoinDTO jd);
	void editSharePlan(JoinDTO jd);
	void delSharePlan(int share_num);
	
	JoinDTO getSharePlan(int share_num);
	ArrayList<JoinDTO> getSharePlanAll(int share_num);
}
