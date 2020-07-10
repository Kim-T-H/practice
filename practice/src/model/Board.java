package model;
import java.util.Date;
public class Board {
	private int no;
	private String id;
	private String subject;
	private String content;
	private String file1;
	private Date date;
	private int see;
	private int btype;
	
	
	
 // getter, setter, toString
	
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}

	public int getSee() {
		return see;
	}
	public void setSee(int see) {
		this.see = see;
	}
	public int getBtype() {
		return btype;
	}
	public void setBtype(int btype) {
		this.btype = btype;
	}

	@Override
	public String toString() {
		return "Board [no=" + no + ", id=" + id + ", subject=" + subject + ", content=" + content + ", file1=" + file1
				+ ", date=" + date + ", see=" + see + ", btype=" + btype + "]";
	}
	
	
	
	
}
