package com.kitri.meto.rep;

import java.util.ArrayList;

import com.kitri.meto.JoinDTO.JoinDTO;

public interface RepMapper {
	void insert(Rep r);
	void update(Rep r);
	void delete(int rep_num);
	ArrayList<Rep> select(Rep r);
	ArrayList<Rep> selectByShareNum(int share_num);
	ArrayList<JoinDTO> joinSelectByShareNum(int share_num);
	
	int selectRepCnt(int share_num);
	ArrayList<Rep> selectByShareNumCnt(int share_num);
}
