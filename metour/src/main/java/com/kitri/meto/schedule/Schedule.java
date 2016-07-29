package com.kitri.meto.schedule;

public class Schedule {
	private int main_num;
	private String main_title;
	private String main_writer;
	private String main_date;
	private int point_num;
	
	public Schedule() {}
	public Schedule(int main_num, String main_title, String main_writer, String main_date, int point_num) {
		super();
		this.main_num = main_num;
		this.main_title = main_title;
		this.main_writer = main_writer;
		this.main_date = main_date;
		this.point_num = point_num;
	}
	
	public int getMain_num() {
		return main_num;
	}
	public void setMain_num(int main_num) {
		this.main_num = main_num;
	}
	public String getMain_title() {
		return main_title;
	}
	public void setMain_title(String main_title) {
		this.main_title = main_title;
	}
	public String getMain_writer() {
		return main_writer;
	}
	public void setMain_writer(String main_writer) {
		this.main_writer = main_writer;
	}
	public String getMain_date() {
		return main_date;
	}
	public void setMain_date(String main_date) {
		this.main_date = main_date;
	}
	public int getPoint_num() {
		return point_num;
	}
	public void setPoint_num(int point_num) {
		this.point_num = point_num;
	}
	
	
}
