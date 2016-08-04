package com.kitri.meto.rep;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("RepService")
public class RepImple implements RepService {
	@Resource(name="sqlSession")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void addRep(Rep r) {
		RepMapper repMapper = sqlSession.getMapper(RepMapper.class);
		repMapper.insert(r);
	}

	@Override
	public void editeRep(Rep r) {
		RepMapper repMapper = sqlSession.getMapper(RepMapper.class);
		repMapper.update(r);
	}

	@Override
	public void delRep(int rep_num) {
		RepMapper repMapper = sqlSession.getMapper(RepMapper.class);
		repMapper.delete(rep_num);
	}

	@Override
	public ArrayList<Rep> getRep(Rep r) {
		RepMapper repMapper = sqlSession.getMapper(RepMapper.class);
		ArrayList<Rep> list = repMapper.select(r);
		return list;
	}

	@Override
	public ArrayList<Rep> getRepByShareNum(int share_num) {
		RepMapper repMapper = sqlSession.getMapper(RepMapper.class);
		ArrayList<Rep> list = repMapper.selectByShareNum(share_num);
		return list;
	}

}
