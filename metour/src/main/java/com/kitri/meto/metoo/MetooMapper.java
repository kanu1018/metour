package com.kitri.meto.metoo;

public interface MetooMapper {
	void insert(Metoo me);
	void updateMetooY(Metoo me);
	void updateMetooN(Metoo me);
	Metoo selectByMetoo(Metoo me);
	int selectCnt(Metoo me);
}
