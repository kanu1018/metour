package com.kitri.meto.admin;

import java.util.List;

import com.kitri.meto.member.Member;

public interface AdminService {
	public void delMember(String id);
	public List<Member> getMemberAll();
	public List<Singo> getSingoAll();
	public void delSingo(int singo_num);
	public List<Member> getOutMemberAll();
	public void inMember(String id);
}
