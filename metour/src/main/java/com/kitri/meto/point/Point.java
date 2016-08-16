package com.kitri.meto.point;

public class Point {
	private int point_num;
	private int point;
	
	public Point(){}
	public Point(int point_num, int point) {
		super();
		this.point_num = point_num;
		this.point = point;
	}
	
	public int getPoint_num() {
		return point_num;
	}
	public void setPoint_num(int point_num) {
		this.point_num = point_num;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
}
