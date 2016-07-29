package com.kitri.meto.member;

import java.util.List;

public interface MemberMapper {
	void insert(Member m);
	void delete(String id);
	Member select(String id);
	List<Member> selectAll();
	void update(Member m);
}
