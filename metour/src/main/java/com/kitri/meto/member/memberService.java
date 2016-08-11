package com.kitri.meto.member;

public interface memberService {
	void addMember(Member m);
	void delMember(String id);
	void editMember(Member m);
	Member getMember(String id);
	boolean login(Member m);
	int getMem_numById(String id);
	String getIdByMemnum(int mem_num);
}