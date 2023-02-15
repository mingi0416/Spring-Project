package com.sp.dto;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

public class SPDto {
   private String id;
   private String pw;
   private String name;
   private String postcode;
   private String address1;
   private String address2;
   @DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
   private LocalDateTime birth;
   private String phone;
   
   
   
   @Override
public String toString() {
	return "SPDto [id=" + id + ", pw=" + pw + ", name=" + name + ", postcode=" + postcode + ", address1=" + address1
			+ ", address2=" + address2 + ", birth=" + birth + ", phone=" + phone + "]";
}




public SPDto() {
      super();
   }




   public String getPostcode() {
	return postcode;
}




public void setPostcode(String postcode) {
	this.postcode = postcode;
}




public String getAddress1() {
	return address1;
}




public void setAddress1(String address1) {
	this.address1 = address1;
}




public String getAddress2() {
	return address2;
}




public void setAddress2(String address2) {
	this.address2 = address2;
}




public SPDto(String id, String pw, String name, String postcode, String address1, String address2, LocalDateTime birth,
		String phone) {
	super();
	this.id = id;
	this.pw = pw;
	this.name = name;
	this.postcode = postcode;
	this.address1 = address1;
	this.address2 = address2;
	this.birth = birth;
	this.phone = phone;
}




public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getPw() {
      return pw;
   }
   public void setPw(String pw) {
      this.pw = pw;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public LocalDateTime getBirth() {
      return birth;
   }
   public void setBirth(LocalDateTime birth) {
      this.birth = birth;
   }
   public String getPhone() {
      return phone;
   }
   public void setPhone(String phone) {
      this.phone = phone;
   }


}