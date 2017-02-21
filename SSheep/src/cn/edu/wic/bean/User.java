package cn.edu.wic.bean;

import org.apache.commons.codec.digest.DigestUtils;

public class User {                              //用户
	private int  id;	                            //编号
	private String username;                //姓名
	private String password;                //密码
	private String date;                        //出生日期
	private String sex;                           //性别
	private String email;                      //email
	private String information;          //个人介绍
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}

}
