package com.hoteldelluna.web.entity;

public class Login {
	
	private int no;
	private String id;
	private String pwd;
	private String name;
	private String birth;
	private String gender;
	private String email;
	private String phone;
	private String date;
	
	public Login() {}
	


	
	public Login(int no, String id, String pwd, String name, String birth, String gender, String email, String phone,
			String date) {
		super();
		this.no = no;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.date = date;
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



	public String getPwd() {
		return pwd;
	}



	public void setPwd(String pwd) {
		this.pwd = pwd;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getBirth() {
		return birth;
	}



	public void setBirth(String birth) {
		this.birth = birth;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getDate() {
		return date;
	}



	public void setDate(String date) {
		this.date = date;
	}




	@Override
	public String toString() {
		return "Login [no=" + no + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", birth=" + birth + ", gender="
				+ gender + ", email=" + email + ", phone=" + phone + ", date=" + date + "]";
	}









	
	
	
}
