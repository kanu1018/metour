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

   @Override
   public void metooPlue(int share_num) {
      SharePlanMapper shareMapper = sqlSession.getMapper(SharePlanMapper.class);
      shareMapper.metooPlus(share_num);   
      }

      @Override
      public void metooMinus(int share_num) {
         SharePlanMapper shareMapper = sqlSession.getMapper(SharePlanMapper.class);
         shareMapper.metooMinus(share_num);   
      }   

   @Override
   public ArrayList<SharePlan> getSharePlanByTitle(String share_title) {
      SharePlanMapper shareMapper = sqlSession.getMapper(SharePlanMapper.class);
      String tmp = "%";
      tmp += share_title + "%";
      ArrayList<SharePlan> list = shareMapper.selectByTitle(tmp);
      return list;
   }

   @Override
   public ArrayList<JoinDTO> getSharePlanByGender(String gender) {
      SharePlanMapper shareMapper = sqlSession.getMapper(SharePlanMapper.class);
      ArrayList<JoinDTO> list = shareMapper.selectByGender(gender);
      return list;
   }

   @Override
   public ArrayList<SharePlan> getSharePlanByWriter(int writer) {
      SharePlanMapper shareMapper = sqlSession.getMapper(SharePlanMapper.class);
      ArrayList<SharePlan> list = shareMapper.selectByWriter(writer);
      return list;
   }

	@Override
	public ArrayList<SharePlan> getSharePlanByBest() {
		SharePlanMapper shareMapper = sqlSession.getMapper(SharePlanMapper.class);
	      ArrayList<SharePlan> list = shareMapper.selectByBest();
	      return list;
	}
   
}