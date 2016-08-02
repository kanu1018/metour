package com.kitri.meto.shareplan;

import java.util.ArrayList;

public interface SharePlanService {
	void addSharePlan(SharePlan s);
	SharePlan getSharePlan(int share_num);
	ArrayList<SharePlan> getSharePlanAll();
}
