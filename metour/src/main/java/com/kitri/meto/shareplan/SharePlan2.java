package com.kitri.meto.shareplan;

public class SharePlan2 {
	private int share_num;
	private int writer;
	private String location;
	private String content;
	private int metoo;
	private int point_num;
	private String share_title;
	private int main_plan_num;
	private String id;
	private String share_photo;
	
	
	public SharePlan2() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SharePlan2(int share_num, int writer, String location, String content, int metoo, int point_num,
			String share_title, int main_plan_num, String id, String share_photo) {
		super();
		this.share_num = share_num;
		this.writer = writer;
		this.location = location;
		this.content = content;
		this.metoo = metoo;
		this.point_num = point_num;
		this.share_title = share_title;
		this.main_plan_num = main_plan_num;
		this.id = id;
		this.share_photo = share_photo;
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
	public int getMetoo() {
		return metoo;
	}
	public void setMetoo(int metoo) {
		this.metoo = metoo;
	}
	public int getPoint_num() {
		return point_num;
	}
	public void setPoint_num(int point_num) {
		this.point_num = point_num;
	}
	public String getShare_title() {
		return share_title;
	}
	public void setShare_title(String share_title) {
		this.share_title = share_title;
	}
	public int getMain_plan_num() {
		return main_plan_num;
	}
	public void setMain_plan_num(int main_plan_num) {
		this.main_plan_num = main_plan_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPhoto() {
		return share_photo;
	}
	public void setPhoto(String share_photo) {
		this.share_photo = share_photo;
	}
	
	
	
}
