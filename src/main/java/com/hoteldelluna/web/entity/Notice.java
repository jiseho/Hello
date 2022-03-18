package com.hoteldelluna.web.entity;



public class Notice {
	private String n_no;
	private String n_user;
	private String n_name;
	private String n_subject;
	private String n_content;
	private String n_pwd;
	private String ndate;
	private String nhit;
	private int wgap;
	
	
	
	
	public int getWgap() {
		return wgap;
	}
	public void setWgap(int wgap) {
		this.wgap = wgap;
	}
	
	public String getN_no() {
		return n_no;
	}
	public void setN_no(String n_no) {
		this.n_no = n_no;
	}
	public String getN_user() {
		return n_user;
	}
	public void setN_user(String n_user) {
		this.n_user = n_user;
	}
	public String getN_name() {
		return n_name;
	}
	public void setN_name(String n_name) {
		this.n_name = n_name;
	}
	public String getN_subject() {
		return n_subject;
	}
	public void setN_subject(String n_subject) {
		this.n_subject = n_subject;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_pwd() {
		return n_pwd;
	}
	public void setN_pwd(String n_pwd) {
		this.n_pwd = n_pwd;
	}
	public String getNdate() {
		return ndate;
	}
	public void setNdate(String ndate) {
		this.ndate = ndate;
	}
	public String getNhit() {
		return nhit;
	}
	public void setNhit(String nhit) {
		this.nhit = nhit;
	}
	@Override
	public String toString() {
		return "Notice [n_no=" + n_no + ", n_user=" + n_user + ", n_name=" + n_name + ", n_subject=" + n_subject
				+ ", n_content=" + n_content + ", n_pwd=" + n_pwd + ", ndate=" + ndate + ", nhit=" + nhit + "]";
	}
	
	
}

