package com.kitri.meto.schedule;

public class CalendarDayFlag {
	private int index;
	
	private int week_num;
	private int day;
	private int flag;
	
	public CalendarDayFlag() {}
	public CalendarDayFlag(int index, int week_num, int day, int flag) {
		super();
		this.index = index;
		this.week_num = week_num;
		this.day = day;
		this.flag = flag;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public int getWeek_num() {
		return week_num;
	}
	public void setWeek_num(int week_num) {
		this.week_num = week_num;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	
	
}
