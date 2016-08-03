package com.kitri.meto.subplan;

public class DataVO {
	private String addr1;
	private String addr2;
	private String areacode;
	private String contentid;
	private String contenttypeid;
	private String dist;
	private String mapx;
	private String mapy;
	private String title;
	
	public DataVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DataVO(String addr1, String addr2, String areacode, String contentid, String contenttypeid, String dist,
			String mapx, String mapy, String title) {
		super();
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.areacode = areacode;
		this.contentid = contentid;
		this.contenttypeid = contenttypeid;
		this.dist = dist;
		this.mapx = mapx;
		this.mapy = mapy;
		this.title = title;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAreacode() {
		return areacode;
	}
	public void setAreacode(String areacode) {
		this.areacode = areacode;
	}
	public String getContentid() {
		return contentid;
	}
	public void setContentid(String contentid) {
		this.contentid = contentid;
	}
	public String getContenttypeid() {
		return contenttypeid;
	}
	public void setContenttypeid(String contenttypeid) {
		this.contenttypeid = contenttypeid;
	}
	public String getDist() {
		return dist;
	}
	public void setDist(String dist) {
		this.dist = dist;
	}
	public String getMapx() {
		return mapx;
	}
	public void setMapx(String mapx) {
		this.mapx = mapx;
	}
	public String getMapy() {
		return mapy;
	}
	public void setMapy(String mapy) {
		this.mapy = mapy;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
}
