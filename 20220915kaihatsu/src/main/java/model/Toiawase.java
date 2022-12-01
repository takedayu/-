


package model;

import java.io.Serializable;

public class Toiawase  implements Serializable{
	private String name;
	private String mail_address;
	private String tel;
	private String inquiry_details;
	
	public Toiawase(String name,String mail_address,String tel,String inquiry_details) {}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMail_address() {
		return mail_address;
	}

	public void setMail_address(String mail_address) {
		this.mail_address = mail_address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getInquiry_details() {
		return inquiry_details;
	}

	public void setInquiry_details(String inquiry_details) {
		this.inquiry_details = inquiry_details;
	}
}

	