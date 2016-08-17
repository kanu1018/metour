package com.kitri.meto.reg;

public class Reg {
	private int mem_num;
	private String reg_id;
	
	
	public Reg() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Reg(int mem_num, String reg_id) {
		super();
		this.mem_num = mem_num;
		this.reg_id = reg_id;
	}


	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	
	
}
