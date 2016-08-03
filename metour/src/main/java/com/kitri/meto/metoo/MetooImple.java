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
	public void editMetooYN(int mem_num, int share_num) {
		MetooMapper metooMapper = sqlSession.getMapper(MetooMapper.class);
		metooMapper.updateMetooYN(mem_num, share_num);
	}

	@Override
	public Metoo getMetoo(Metoo me) {
		MetooMapper metooMapper = sqlSession.getMapper(MetooMapper.class);
		Metoo metoo = metooMapper.selectByMetoo(me);
		return metoo;
	}
}
