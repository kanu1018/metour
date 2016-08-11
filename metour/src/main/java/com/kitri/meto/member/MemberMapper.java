package com.kitri.meto.member;

import java.util.List;

import com.kitri.meto.JoinDTO.JoinDTO;

public interface MemberMapper {
	void insert(Member m);
	void delete(String id);
	Member select(String id);
	List<Member> selectAll();
	void update(Member m);
	List<JoinDTO> articleListAll();
	List<JoinDTO> getArticleByTitle(String text);
	List<JoinDTO> getArticleByWriter(String text);
	List<JoinDTO> getArticleByNum(int num);
	int selectById(String id);
	String selectByWriter(int mem_num);
}
