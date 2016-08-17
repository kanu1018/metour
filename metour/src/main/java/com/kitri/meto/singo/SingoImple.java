package com.kitri.meto.singo;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("SingoService")
public class SingoImple implements SingoService {
	@Resource(name="sqlSession")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void addSingo(Singo s) {
		SingoMapper singoMapper = sqlSession.getMapper(SingoMapper.class);
		singoMapper.insert(s);
	}

	@Override
	public Singo getSingo(int singo_num) {
		SingoMapper singoMapper = sqlSession.getMapper(SingoMapper.class);
		return singoMapper.select(singo_num);
	}

}
