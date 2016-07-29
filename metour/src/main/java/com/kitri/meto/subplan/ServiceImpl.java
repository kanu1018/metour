package com.kitri.meto.subplan;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("SubPlanService")
public class ServiceImpl implements SubPlanService{
	@Resource(name="sqlSession")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void addSubPlan(SubPlan sp) {
		SubPlanMapper subPlanMapper = sqlSession.getMapper(SubPlanMapper.class);
		subPlanMapper.insert(sp);
	}

	@Override
	public ArrayList<SubPlan> getSubPlans(int MainPlanNum) {
		SubPlanMapper subPlanMapper = sqlSession.getMapper(SubPlanMapper.class);
		return subPlanMapper.selectAll(MainPlanNum);
	}

	@Override
	public SubPlan getSubPlan(int subNum) {
		SubPlanMapper subPlanMapper = sqlSession.getMapper(SubPlanMapper.class);
		return subPlanMapper.select(subNum);
	}

	@Override
	public void delSubPlan(int subNum) {
		SubPlanMapper subPlanMapper = sqlSession.getMapper(SubPlanMapper.class);
		subPlanMapper.delete(subNum);
	}

	@Override
	public void editSubPlan(SubPlan sp) {
		SubPlanMapper subPlanMapper = sqlSession.getMapper(SubPlanMapper.class);
		subPlanMapper.update(sp);
	}

}
