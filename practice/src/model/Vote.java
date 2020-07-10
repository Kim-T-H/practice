package model;

public class Vote {
	private String id;
	private int no;
	private int btype;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBtype() {
		return btype;
	}
	public void setBtype(int btype) {
		this.btype = btype;
	}
	@Override
	public String toString() {
		return "vote [id=" + id + ", no=" + no + ", btype=" + btype + "]";
	}
	
}
