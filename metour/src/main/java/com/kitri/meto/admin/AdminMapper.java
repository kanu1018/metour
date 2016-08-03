package com.kitri.meto.admin;
import java.util.List;

import com.kitri.meto.member.Member;

public interface AdminMapper {
	void delMember(String id);
	List<Member> selectAll();
	List<Singo> singoselectAll();
	void delSingo(int singo_num);
}