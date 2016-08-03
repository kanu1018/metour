package com.kitri.meto.shareplan;

import java.util.ArrayList;

import com.kitri.meto.JoinDTO.JoinDTO;

public interface SharePlanMapper {
	void insert(SharePlan s);
	void updateMetoo(int share_num, int metoo);
	SharePlan select(int share_num);
	ArrayList<SharePlan> selectAll();
	
	ArrayList<SharePlan> selectByTitle(String share_title);
	ArrayList<JoinDTO> selectByGender(String gender);
	ArrayList<SharePlan> selectByWriter(int writer);
	
}
