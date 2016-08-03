package com.kitri.meto.shareplan;

import java.util.ArrayList;

public interface SharePlanService {
	void addSharePlan(SharePlan s);
	void metooPlue(int share_num);
	void metooMinus(int share_num);
	SharePlan getSharePlan(int share_num);
	ArrayList<SharePlan> getSharePlanAll();
}
