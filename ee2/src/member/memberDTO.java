package member;

import java.sql.Date;

public class memberDTO {
	
	private String name;
	private String pw;	
	private String email;
	private String facebook;
	private String twitter;
	private String website;
	private String phone;
	private String fax;
	private Date joinDate;
	
	
	/*생성자*/
	public memberDTO() {	}


	public memberDTO(String name, String pw, String email) {}
	
	
	public memberDTO(String name, String pw, String email, String facebook, String twitter, String website,
			String phone, String fax, Date joinDate) {
		super();
		this.name = name;
		this.pw = pw;
		
		this.email = email;
		this.facebook = facebook;
		this.twitter = twitter;
		this.website = website;
		this.phone = phone;
		this.fax = fax;
		this.joinDate = joinDate;
	}


	
	/*getter, setter메소드*/
	
	
	
	public String getPw() {
		return pw;
	}


	public String getName() {
		return name;
	}


	public String getEmail() {
		return email;
	}


	public String getFacebook() {
		return facebook;
	}


	public String getTwitter() {
		return twitter;
	}


	public String getWebsite() {
		return website;
	}


	public String getPhone() {
		return phone;
	}


	public String getFax() {
		return fax;
	}


	public Date getJoinDate() {
		return joinDate;
	}



	public void setPw(String pw) {
		this.pw = pw;
	}


	public void setName(String name) {
		this.name = name;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}


	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}


	public void setWebsite(String website) {
		this.website = website;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public void setFax(String fax) {
		this.fax = fax;
	}


	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
	
	
	
	
	

}
