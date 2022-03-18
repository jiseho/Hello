package com.hoteldelluna.web.entity;

public class FAQTO {

	private String q_no;
	private int q_grp;
	private int g_grps;
	private int q_grpl;
	private String q_name;
	private String q_subject;
	private String q_content;
	private String q_pwd;
	private String q_date;
	private String q_hit;
	private String q_mail;
	private int wgap;
	private String q_sgrpl;
	
	public int getQ_grpl() {
		return q_grpl;
	}
	public void setQ_grpl(int q_grpl) {
		this.q_grpl = q_grpl;
	}
	public String getQ_no() {
		return q_no;
	}
	public void setQ_no(String q_no) {
		this.q_no = q_no;
	}
	public String getQ_sgrpl() {
		return q_sgrpl;
	}
	public void setQ_sgrpl(String q_sgrpl) {
		this.q_sgrpl = q_sgrpl;
	}
	public int getWgap() {
		return wgap;
	}
	public void setWgap(int wgap) {
		this.wgap = wgap;
	}
	public String getQ_wip() {
		return q_wip;
	}
	public void setQ_wip(String q_wip) {
		this.q_wip = q_wip;
	}
	private String q_wip;
	
	public String getQ_mail() {
		return q_mail;
	}
	public void setQ_mail(String q_mail) {
		this.q_mail = q_mail;
	}
	
	public int getQ_grp() {
		return q_grp;
	}
	public void setQ_grp(int q_grp) {
		this.q_grp = q_grp;
	}
	public int getG_grps() {
		return g_grps;
	}
	public void setG_grps(int g_grps) {
		this.g_grps = g_grps;
	}
	
	public String getQ_name() {
		return q_name;
	}
	public void setQ_name(String q_name) {
		this.q_name = q_name;
	}
	public String getQ_subject() {
		return q_subject;
	}
	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_pwd() {
		return q_pwd;
	}
	public void setQ_pwd(String q_pwd) {
		this.q_pwd = q_pwd;
	}
	public String getQ_date() {
		return q_date;
	}
	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}
	public String getQ_hit() {
		return q_hit;
	}
	public void setQ_hit(String q_hit) {
		this.q_hit = q_hit;
	}
	
}
