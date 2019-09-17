package com.yi.domain;

import java.util.Date;
import java.util.List;

public class PhotoalbumVO {
	private int no;
	private List<String> filename;
	private Date regdate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public List<String> getFilename() {
		return filename;
	}
	public void setFilename(List<String> filename) {
		this.filename = filename;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "PhotoalbumVO [no=" + no + ", filename=" + filename + ", regdate=" + regdate + "]";
	}
	
}
