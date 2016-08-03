package com.kitri.meto.shareplan;

import java.util.ArrayList;

public interface SharePlanMapper {
	void insert(SharePlan s);
	void metooPlus(int share_num);
	void metooMinus(int share_num);
	SharePlan select(int share_num);
	ArrayList<SharePlan> selectAll();
}
