package com.kitri.meto.shareplan;

import java.util.ArrayList;

import com.kitri.meto.JoinDTO.JoinDTO;

public interface SharePlanMapper {
	void insert(SharePlan s);
	void metooPlus(int share_num);
	void metooMinus(int share_num);
	SharePlan select(int share_num);
	ArrayList<SharePlan> selectAll();
	ArrayList<SharePlan> selectByTitle(String tmp);
	ArrayList<JoinDTO> selectByGender(String gender);
	ArrayList<SharePlan> selectByWriter(int writer);
}
