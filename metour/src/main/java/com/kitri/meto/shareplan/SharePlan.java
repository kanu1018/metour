package com.kitri.meto.shareplan;

public class SharePlan {
	private int share_num;
	private int writer;
	private String location;
	private String content;
	private String metoo;
	private int point_num;
	
	public SharePlan(){}
	public SharePlan(int share_num, int writer, String location, String content, String metoo, int point_num) {
		super();
		this.share_num = share_num;
		this.writer = writer;
		this.location = location;
		this.content = content;
		this.metoo = metoo;
		this.point_num = point_num;
	}
	public int getShare_num() {
		return share_num;
	}
	public void setShare_num(int share_num) {
		this.share_num = share_num;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMetoo() {
		return metoo;
	}
	public void setMetoo(String metoo) {
		this.metoo = metoo;
	}
	public int getPoint_num() {
		return point_num;
	}
	public void setPoint_num(int point_num) {
		this.point_num = point_num;
	}
}
