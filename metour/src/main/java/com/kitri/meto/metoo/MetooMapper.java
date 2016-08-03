package com.kitri.meto.metoo;

public interface MetooMapper {
	void insert(Metoo me);
	void updateMetooYN(int mem_num, int share_num);
	Metoo selectByMetoo(Metoo me);
}
