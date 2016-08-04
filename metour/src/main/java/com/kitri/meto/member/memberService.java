package com.kitri.meto.member;

public interface memberService {
	void addMember(Member m);
	void delMember(String id);
	void editMember(Member m);
	Member getMember(String id);
	boolean login(Member m);
	
}