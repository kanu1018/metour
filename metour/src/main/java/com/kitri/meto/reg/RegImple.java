package com.kitri.meto.reg;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("RegService")
public class RegImple implements RegService {
	@Resource(name="sqlSession")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	@Override
	public void addReg(Reg r) {
		// TODO Auto-generated method stub
		RegMapper regMapper = sqlSession.getMapper(RegMapper.class);
		regMapper.insert(r);
	}

	@Override
	public void editReg(Reg r) {
		// TODO Auto-generated method stub
		RegMapper regMapper = sqlSession.getMapper(RegMapper.class);
		regMapper.update(r);
		
	}

	@Override
	public Reg getReg(int mem_num) {
		// TODO Auto-generated method stub
		RegMapper regMapper = sqlSession.getMapper(RegMapper.class);
		return regMapper.select(mem_num);
	}
	
	
	
}
