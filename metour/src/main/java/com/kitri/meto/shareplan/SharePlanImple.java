package com.kitri.meto.shareplan;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("SharePlanService")
public class SharePlanImple implements SharePlanService {
	@Resource(name="sqlSession")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void addSharePlan(SharePlan s) {
		SharePlanMapper shareMapper = sqlSession.getMapper(SharePlanMapper.class);
		shareMapper.insert(s);		
	}

	@Override
	public SharePlan getSharePlan(int share_num) {
		SharePlanMapper shareMapper = sqlSession.getMapper(SharePlanMapper.class);
		return shareMapper.select(share_num);
	}

	@Override
	public ArrayList<SharePlan> getSharePlanAll() {
		SharePlanMapper shareMapper = sqlSession.getMapper(SharePlanMapper.class);
		ArrayList<SharePlan> list = shareMapper.selectAll();
		return list;
	}
	
	
}
