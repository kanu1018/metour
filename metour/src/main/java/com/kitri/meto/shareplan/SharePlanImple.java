package com.kitri.meto.shareplan;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.kitri.meto.JoinDTO.JoinDTO;

@Component("SharePlanService")
public class SharePlanImple implements SharePlanService {
	@Resource(name="sqlSession")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void addSharePlan(JoinDTO jd) {
		// TODO Auto-generated method stub

	}

	@Override
	public void editSharePlan(JoinDTO jd) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delSharePlan(int share_num) {
		// TODO Auto-generated method stub

	}

	@Override
	public JoinDTO getSharePlan(int share_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<JoinDTO> getSharePlanAll(int share_num) {
		// TODO Auto-generated method stub
		return null;
	}

}
