package com.kitri.meto.schedule;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.kitri.meto.JoinDTO.JoinDTO;

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
	public Schedule getSchedule(Schedule schedule) {
		ScheduleMapper scheduleMapper = sqlSession.getMapper(ScheduleMapper.class);
		return scheduleMapper.select(schedule);
	}

	@Override
	public List<Schedule> getSchedules(int main_writer) {
		ScheduleMapper scheduleMapper = sqlSession.getMapper(ScheduleMapper.class);
		List<Schedule> list = scheduleMapper.selectAll(main_writer);
		return list;
	}

	@Override
	public int getByPointNum() {
		ScheduleMapper scheduleMapper = sqlSession.getMapper(ScheduleMapper.class);
		return scheduleMapper.selectByPointNum();
	}

	@Override
	public int getByMainNum() {
		ScheduleMapper scheduleMapper = sqlSession.getMapper(ScheduleMapper.class);
		return scheduleMapper.selectByMainNum();
	}

	@Override
	public Schedule getByTitle(int main_num) {
		ScheduleMapper scheduleMapper = sqlSession.getMapper(ScheduleMapper.class);
		return scheduleMapper.selectByTitle(main_num);
	}

	@Override
	public void addPoint(JoinDTO j) {
		ScheduleMapper scheduleMapper = sqlSession.getMapper(ScheduleMapper.class);
		scheduleMapper.insertPoint(j);
	}

	@Override
	public void addPointNum(int point) {
		ScheduleMapper scheduleMapper = sqlSession.getMapper(ScheduleMapper.class);
		scheduleMapper.insertPointNum(point);
	}
	
	

}
