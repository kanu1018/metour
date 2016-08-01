package com.kitri.meto.mainsub;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.kitri.meto.JoinDTO.JoinDTO;

@Component("MainSubPlanService")
public class MainSubPlanImple implements MainSubPlanService {
	@Resource(name="sqlSession")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public ArrayList<JoinDTO> getMainSubPlanByMainNum(int main_num) {
		MainSubPlanMapper msMapper = sqlSession.getMapper(MainSubPlanMapper.class);
		return null;
	}
	
	
}
