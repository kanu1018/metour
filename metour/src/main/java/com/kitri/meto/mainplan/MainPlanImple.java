package com.kitri.meto.mainplan;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.kitri.meto.JoinDTO.JoinDTO;

@Component("MainPlanService")
public class MainPlanImple implements MainPlanService {
	@Resource(name="sqlSession")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void addMainPlan(JoinDTO jd) {
		// TODO Auto-generated method stub

	}

	@Override
	public void editMainPlan(JoinDTO jd) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delMainPlan(int main_num) {
		// TODO Auto-generated method stub

	}

	@Override
	public JoinDTO getMainPlan(int main_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<JoinDTO> getMainplanAll(int main_num) {
		// TODO Auto-generated method stub
		return null;
	}

}
