package com.kitri.meto.metoo;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("MetooService")
public class MetooImple implements MetooService {
	@Resource(name="sqlSession")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void addMetoo(Metoo me) {
		MetooMapper metooMapper = sqlSession.getMapper(MetooMapper.class);
		metooMapper.insert(me);
	}
	
	@Override
	public Metoo getMetoo(Metoo me) {
		MetooMapper metooMapper = sqlSession.getMapper(MetooMapper.class);
		Metoo metoo = metooMapper.selectByMetoo(me);
		return metoo;
	}

	@Override
	public int getMetooCnt(Metoo me) {
		MetooMapper metooMapper = sqlSession.getMapper(MetooMapper.class);
		int cnt = metooMapper.selectCnt(me);
		return cnt;
	}

	@Override
	public void editMetooY(Metoo me) {
		MetooMapper metooMapper = sqlSession.getMapper(MetooMapper.class);
		metooMapper.updateMetooY(me);
	}

	@Override
	public void editMetooN(Metoo me) {
		MetooMapper metooMapper = sqlSession.getMapper(MetooMapper.class);
		metooMapper.updateMetooN(me);
	}
}
