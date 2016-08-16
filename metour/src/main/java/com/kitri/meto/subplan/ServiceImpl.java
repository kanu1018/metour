package com.kitri.meto.subplan;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.kitri.meto.schedule.Schedule;

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
	public ArrayList<SubPlan> getSubPlans(int mainPlanNum) {
		SubPlanMapper subPlanMapper = sqlSession.getMapper(SubPlanMapper.class);
		return subPlanMapper.selectAll(mainPlanNum);
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

	@Override
	public SubPlan getSupPlanTime(int subNum) {
		SubPlanMapper subPlanMapper = sqlSession.getMapper(SubPlanMapper.class);
		return subPlanMapper.selectSupPlanTime(subNum);
	}

	@Override
	public void updatePhoto(SubPlan subplan) {
		SubPlanMapper subPlanMapper = sqlSession.getMapper(SubPlanMapper.class);
		subPlanMapper.upPhoto(subplan);
	}

	@Override
	public ArrayList<SubPlan> getSubPlanByMainplan(Schedule s) {
		SubPlanMapper subPlanMapper = sqlSession.getMapper(SubPlanMapper.class);
		return subPlanMapper.selectByDate1(s);
	}

	
}
