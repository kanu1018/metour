package com.kitri.meto.shareplan;

import java.util.ArrayList;

public interface SharePlanService {
	void addSharePlan(SharePlan s);
	void editMetoo(int share_num, int metoo);
	SharePlan getSharePlan(int share_num);
	ArrayList<SharePlan> getSharePlanAll();
}
