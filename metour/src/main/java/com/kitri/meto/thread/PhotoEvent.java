package com.kitri.meto.thread;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.kitri.meto.JoinDTO.JoinDTO;
import com.kitri.meto.gcm.GCMUtil;
import com.kitri.meto.gcm.GCMVo;
import com.kitri.meto.subplan.SubPlan;

public class PhotoEvent extends Thread{
	
	private ArrayList<SubPlan> subplan;
	private String reg_id;
	private String title;
	private String msg;
	public PhotoEvent(ArrayList<SubPlan> s,String reg_id){
		this.subplan = s;
		this.reg_id = reg_id;
		
		for(int i=0;i<subplan.size();i++){
			System.out.println("시간:"+subplan.get(i).getStart_time());
		}
	}
	public void run(){
		for(int i=0;i<subplan.size();i++){
			GCMVo gcmVo = new GCMVo();
			title = subplan.get(i).getSub_title();
			msg = "사진이벤트!!";
			try {
				gcmVo.setTitle(title);
				gcmVo.setMsg(msg);
				gcmVo.setTypeCode("");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    List<String> reslist = new ArrayList<String>();
		    reslist.add(reg_id);
			while(true){
				try {
					long time = System.currentTimeMillis(); 
					SimpleDateFormat dayTime = new SimpleDateFormat("HH");
					String str = dayTime.format(new Date(time));
					System.out.println(str);
					System.out.println(subplan.get(i).getStart_time());
					if(Integer.parseInt(str) > Integer.parseInt(subplan.get(i).getStart_time())){
						break;
					}
					if(str.equals(subplan.get(i).getStart_time())){
						System.out.println("실행되었다.");
						GCMUtil gcmUtil = new GCMUtil(reslist, gcmVo);
						break;
					} else{
						System.out.println("시간이 같지않다.");
					}
					Thread.sleep(60000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
}
