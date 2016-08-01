package com.kitri.meto.schedule;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("scheduleSerivce")
public class ScheduleDaoService implements scheduleService {
	
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void addSchedule(Schedule s) {
		ScheduleMapper scheduleMapper = sqlSession.getMapper(ScheduleMapper.class);
		scheduleMapper.insert(s);
	}

	@Override
	public void delSchedule(int main_num) {
		ScheduleMapper scheduleMapper = sqlSession.getMapper(ScheduleMapper.class);
		scheduleMapper.delete(main_num);
	}

	@Override
	public void editSchedule(Schedule s) {
		ScheduleMapper scheduleMapper = sqlSession.getMapper(ScheduleMapper.class);
		scheduleMapper.update(s);
	}

	@Override
	public Schedule getSchedule(int main_num) {
		ScheduleMapper scheduleMapper = sqlSession.getMapper(ScheduleMapper.class);
		return scheduleMapper.select(main_num);
	}

}
