package com.kitri.meto.rep;

import java.util.ArrayList;

import com.kitri.meto.JoinDTO.JoinDTO;

public interface RepService {
	void addRep(Rep r);
	void editeRep(Rep r);
	void delRep(int rep_num);
	ArrayList<Rep> getRep(Rep r);
	ArrayList<Rep> getRepByShareNum(int share_num);
	ArrayList<JoinDTO> getJoinRepByShareNum(int share_num);
	
	int getRepCnt(int share_num);
	ArrayList<Rep> getRepByShareNumCnt(int share_num);
}
