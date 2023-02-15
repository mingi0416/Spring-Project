package com.sp.dto;

import java.util.Date;

public class BoardDTO {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int viewcnt;
	private int grpno;
	private int grpord;
	private int depth;
	private int report;
	
	public BoardDTO() {

	}
	
	
	public BoardDTO(int bno, String title, String content, String writer, Date regdate, int viewcnt, int grpno,
			int grpord, int depth, int report) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.regdate = regdate;
		this.viewcnt = viewcnt;
		this.grpno = grpno;
		this.grpord = grpord;
		this.depth = depth;
		this.report = report;
	}







	public int getReport() {
		return report;
	}


	public void setReport(int report) {
		this.report = report;
	}


	public int getgrpno() {
		return grpno;
	}
	public void setgrpno(int grpno) {
		this.grpno = grpno;
	}
	public int getgrpord() {
		return grpord;
	}
	public void setgrpord(int grpord) {
		this.grpord = grpord;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	@Override
	public String toString() {
		return "BoardDTO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", regdate=" + regdate + ", viewcnt=" + viewcnt + ", grpno=" + grpno + ", grpord=" + grpord
				+ ", depth=" + depth + ", report=" + report + "]";
	}
	

}
