package com.yi.domain;

public class PhotomemberVO {
	private String userid;
	private String username;
	private String userpw;
	private String email;
	private String tel;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	@Override
	public String toString() {
		return "PhotoMemberVO [userid=" + userid + ", username=" + username + ", userpw=" + userpw + ", email=" + email
				+ ", tel=" + tel + "]";
	}
	
}
