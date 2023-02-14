package com.sp.dto;

import java.util.Date;

public class ReplyDTO {
	private int rno;
	private int bno;
	private String replyer;
	private String replytext;
	private Date regdate;
	private int grpno;
	private int grpord;
	private int depth;
	
	public ReplyDTO() {
	}
	
	public ReplyDTO(int rno, int bno, String replyer, String replytext, Date regdate, int grpno, int grpord,
			int depth) {
		super();
		this.rno = rno;
		this.bno = bno;
		this.replyer = replyer;
		this.replytext = replytext;
		this.regdate = regdate;
		this.grpno = grpno;
		this.grpord = grpord;
		this.depth = depth;
	}

	@Override
	public String toString() {
		return "ReplyDTO [rno=" + rno + ", bno=" + bno + ", replyer=" + replyer + ", replytext=" + replytext
				+ ", regdate=" + regdate + ", grpno=" + grpno + ", grpord=" + grpord + ", depth=" + depth + "]";
	}


	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getReplyer() {
		return replyer;
	}

	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}

	public String getReplytext() {
		return replytext;
	}

	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getGrpno() {
		return grpno;
	}

	public void setGrpno(int grpno) {
		this.grpno = grpno;
	}

	public int getGrpord() {
		return grpord;
	}

	public void setGrpord(int grpord) {
		this.grpord = grpord;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

}
	