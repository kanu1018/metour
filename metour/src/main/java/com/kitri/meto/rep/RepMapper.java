package com.kitri.meto.rep;

import java.util.ArrayList;

public interface RepMapper {
	void insert(Rep r);
	void update(Rep r);
	void delete(int rep_num);
	ArrayList<Rep> select(Rep r);
	ArrayList<Rep> selectByShareNum(int share_num);
}
