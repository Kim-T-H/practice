package model;

import java.util.Date;

public class Comment {
	private int com_no;
	private String com_content;
	private String com_date;
	private int btype;
	private int no;
	private String id;
	public int getCom_no() {
		return com_no;
	}
	public void setCom_no(int com_no) {
		this.com_no = com_no;
	}
	public String getCom_content() {
		return com_content;
	}
	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}
	public String getCom_date() {
		return com_date;
	}
	public void setCom_date(String com_date) {
		this.com_date = com_date;
	}
	public int getBtype() {
		return btype;
	}
	public void setBtype(int btype) {
		this.btype = btype;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Comment [com_no=" + com_no + ", com_content=" + com_content + ", com_date=" + com_date + ", btype="
				+ btype + ", no=" + no + ", id=" + id + "]";
	}
	
}