package com.kitri.meto.member;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.kitri.meto.JoinDTO.JoinDTO;

@Component("MemberService")
public class MemberDaoService implements memberService {

	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void addMember(Member m) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.insert(m);
	}

	@Override
	public void delMember(String id) {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.delete(id);
	}

	@Override
	public void editMember(Member m) {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.update(m);
	}

	@Override
	public Member getMember(String id) {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		return memberMapper.select(id);
	}

	@Override
	public boolean login(Member m) {
		// TODO Auto-generated method stub
		Member result = getMember(m.getId());
		if(!result.getMem_status().equals("n")){
			if(result!=null && m.getPwd().equals(result.getPwd())){
				return true; 
			} else {
				return false;
			}
		}else{
			return false;
		}
	}

	public List<JoinDTO> getArticleByRoot() {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		return memberMapper.articleListAll();
	}

	public List<JoinDTO> getArticleByTitle(String text) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		return memberMapper.getArticleByTitle(text);
	}

	public Object getArticleByWriter(String text) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		return memberMapper.getArticleByWriter(text);
	}

	public Object getArticleByNum(int num) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		return memberMapper.getArticleByNum(num);
	}
}