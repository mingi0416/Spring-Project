package com.sp.dto;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

public class ReportDto {
private Integer bno;
private Integer rno;
private String reporter;
private String reason;
public ReportDto(Integer bno, Integer rno, String reporter, String reason) {
	super();
	this.bno = bno;
	this.rno = rno;
	this.reporter = reporter;
	this.reason = reason;
}
public ReportDto() {
	
}
public Integer getBno() {
	return bno;
}
public void setBno(Integer bno) {
	this.bno = bno;
}
public Integer getRno() {
	return rno;
}
public void setRno(Integer rno) {
	this.rno = rno;
}
public String getReporter() {
	return reporter;
}
public void setReporter(String reporter) {
	this.reporter = reporter;
}
public String getReason() {
	return reason;
}
public void setReason(String reason) {
	this.reason = reason;
}
@Override
public String toString() {
	return "ReportDto [bno=" + bno + ", rno=" + rno + ", reporter=" + reporter + ", reason=" + reason + "]";
}

   
  }