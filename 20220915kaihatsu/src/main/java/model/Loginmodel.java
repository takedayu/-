package model;

import java.io.Serializable;

public class Loginmodel implements Serializable{
	private String userid;
	private String userpassword;
	public Loginmodel(String userid,String userpassword){

	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpassword() {
		return userpassword;
	}
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
}