package com.kitri.meto.point;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("PointService")
public class PointImple implements PointService {
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void edit(Point p) {
		PointMapper pointMapper = sqlSession.getMapper(PointMapper.class);
		pointMapper.update(p);
	}

	@Override
	public void delete(int point_num) {
		PointMapper pointMapper = sqlSession.getMapper(PointMapper.class);
		pointMapper.delete(point_num);
	}

	@Override
	public Point getPoint(int point_num) {
		PointMapper pointMapper = sqlSession.getMapper(PointMapper.class);
		return pointMapper.select(point_num);
	}

	@Override
	public ArrayList<Point> getPointAll() {
		PointMapper pointMapper = sqlSession.getMapper(PointMapper.class);
		ArrayList<Point> list = pointMapper.selectAll();
		return list;
	}

}
