package com.kitri.meto.admin;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.kitri.meto.member.Member;

@Component("AdminService")
public class AdminServiceImpl implements AdminService {
	
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void delMember(String id) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		adminMapper.delMember(id);
	}

	@Override
	public List<Member> getMemberAll() {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		return adminMapper.selectAll();
	}

	@Override
	public List<Singo> getSingoAll() {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		return adminMapper.singoselectAll();
	}

	@Override
	public void delSingo(int singo_num) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		adminMapper.delSingo(singo_num);
	}

	@Override
	public List<Member> getOutMemberAll() {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		return adminMapper.outMemberAll();
	}

	@Override
	public void inMember(String id) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		adminMapper.inMember(id);
	}
}