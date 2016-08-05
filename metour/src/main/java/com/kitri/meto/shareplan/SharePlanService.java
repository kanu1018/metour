package com.kitri.meto.shareplan;

import java.util.ArrayList;

import com.kitri.meto.JoinDTO.JoinDTO;

public interface SharePlanService {
	void addSharePlan(SharePlan s);
	void metooPlue(int share_num);
	void metooMinus(int share_num);
	SharePlan getSharePlan(int share_num);
	ArrayList<SharePlan> getSharePlanAll();
	ArrayList<SharePlan> getSharePlanByTitle(String share_title);
	ArrayList<JoinDTO> getSharePlanByGender(String gender);
	ArrayList<SharePlan> getSharePlanByWriter(int writer);
	ArrayList<SharePlan> getSharePlanByBest();
}
