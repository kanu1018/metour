package com.kitri.meto.reg;

public interface RegMapper {
	void insert(Reg r);
	void update(Reg r);
	Reg select(int mem_num);
}
