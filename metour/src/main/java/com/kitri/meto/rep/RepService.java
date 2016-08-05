package com.kitri.meto.rep;

import java.util.ArrayList;

public interface RepService {
	void addRep(Rep r);
	void editeRep(Rep r);
	void delRep(int rep_num);
	ArrayList<Rep> getRep(Rep r);
	ArrayList<Rep> getRepByShareNum(int share_num);
}
