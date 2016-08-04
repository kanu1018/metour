package com.kitri.meto.shareplan;

public class AgeSelectDTO {
	int mem_num;
	int age;
	public AgeSelectDTO() {
		super();
	}
	public AgeSelectDTO(int mem_num, int age) {
		super();
		this.mem_num = mem_num;
		this.age = age;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
}
