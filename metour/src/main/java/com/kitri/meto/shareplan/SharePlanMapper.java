package com.kitri.meto.shareplan;

import java.util.ArrayList;

public interface SharePlanMapper {
	void insert(SharePlan s);
	void updateMetoo(int share_num, int metoo);
	SharePlan select(int share_num);
	ArrayList<SharePlan> selectAll();
}
