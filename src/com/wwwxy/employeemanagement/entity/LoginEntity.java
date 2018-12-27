package com.wwwxy.employeemanagement.entity;

public class LoginEntity {
	//����Ա��Ա������
	private int id;
	//����Ա��Ա���˺�
	private String username;
	//����Ա��Ա������
	private String password;
	//����Ա��������
	private String oldpassword;
	//Ա�����
	private int empid;
	//����Ա��Ա��
	private int admin;	
	//�вι��췽��
	public LoginEntity(int id, String username, String password,
			String oldpassword, int empid, int admin) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.oldpassword = oldpassword;
		this.empid = empid;
		this.admin = admin;
	}
	
	public LoginEntity(int id, String username, String password,
		int empid, int admin) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.empid = empid;
		this.admin = admin;
	}
	
	public LoginEntity(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	public LoginEntity() {
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getOldpassword() {
		return oldpassword;
	}
	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}
	public int getEmpid() {
		return empid;
	}
	public void setEmpid(int empid) {
		this.empid = empid;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}

}
