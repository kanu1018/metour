<%@page import="com.kitri.meto.gcm.GCMUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kitri.meto.gcm.GCMVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//받아야지
	String title = "zzzz";
    String msg = "sssss";
    //String reg_id = request.getAttribute("reg_id")+"";
    //전달할 PUSH 내용
    //String title = "PUSH 제목 입니다.";
    //String msg = "PUSH 내용입니다 ^^ !!!!";
    
    // GCM 정보 셋팅
    GCMVo gcmVo = new GCMVo();
    gcmVo.setTitle(title);
    gcmVo.setMsg(msg);
    gcmVo.setTypeCode("");
    
    // GCM reg id 셋팅
    List<String> reslist = new ArrayList<String>();
    reslist.add("APA91bE0ehAKYOBh13T2gvhH3GRG5pmbbPlzp1YjhDUEmYkmEYzL4NNg7JclMiUnIWTPqBHZJ5JSmiaVg-VNgT9wcQGtQBSJ_YE7FXD9ugwxUeJWvC6cxNUpSwF8hXfWxkUZA9ucN5W9");
    
    GCMUtil gcmUtil = new GCMUtil(reslist, gcmVo);
    
   for(int i=0; i<gcmUtil.rtnList.size(); i++){
      GCMVo rtnGcmVo = gcmUtil.rtnList.get(i); 
 
      out.println("regId : " + rtnGcmVo.getRegId());
      out.println("성공 여부 : " + rtnGcmVo.getPushSuccessOrFailure());
      out.println("메시지ID : " + rtnGcmVo.getMsgId());
      out.println("에러메시지 : " + rtnGcmVo.getErrorMsg());
   } 
 %>
