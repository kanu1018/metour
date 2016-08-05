package com.kitri.meto.subplan;

import java.util.ArrayList;

public class SubPlans {
	private ArrayList<SubPlan> list;
	private String main_title;
	private String date;
	private int point_num;
	private int main_num;
	public SubPlans() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SubPlans(ArrayList<SubPlan> list, String main_title, String date, int point_num, int main_num) {
		super();
		this.list = list;
		this.main_title = main_title;
		this.date = date;
		this.point_num = point_num;
		this.main_num = main_num;
	}
	public ArrayList<SubPlan> getList() {
		return list;
	}
	public void setList(ArrayList<SubPlan> list) {
		this.list = list;
	}
	public String getMain_title() {
		return main_title;
	}
	public void setMain_title(String main_title) {
		this.main_title = main_title;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getPoint_num() {
		return point_num;
	}
	public void setPoint_num(int point_num) {
		this.point_num = point_num;
	}
	public int getMain_num() {
		return main_num;
	}
	public void setMain_num(int main_num) {
		this.main_num = main_num;
	}
	
	
}
