package com.kitri.meto.shareplan;

import java.util.ArrayList;

public interface SharePlanMapper {
	void insert(SharePlan s);
	SharePlan select(int share_num);
	ArrayList<SharePlan> selectAll();
}
