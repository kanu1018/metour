package com.kitri.meto.subplan;

public class SubPlanList {
	private String time;
	private int sub_num;
	private String title;
	private String place;
	private String mission;
	private String mission_yn;
	private int row;
	
	public SubPlanList() {
		super();
	}
	public SubPlanList(int sub_num, String title, String place, String mission, String mission_yn, int row) {
		super();
		this.sub_num = sub_num;
		this.title = title;
		this.place = place;
		this.mission = mission;
		this.mission_yn = mission_yn;
		this.row = row;
	}
	
	public int getSub_num() {
		return sub_num;
	}
	public void setSub_num(int sub_num) {
		this.sub_num = sub_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getMission() {
		return mission;
	}
	public void setMission(String mission) {
		this.mission = mission;
	}
	public String getMission_yn() {
		return mission_yn;
	}
	public void setMission_yn(String mission_yn) {
		this.mission_yn = mission_yn;
	}
	public int getRow() {
		return row;
	}
	public void setRow(int row) {
		this.row = row;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	

}
