package com.sp.dto;

import java.time.LocalDateTime;


import org.springframework.format.annotation.DateTimeFormat;

public class PollDTO {
	private int bno;
	private int pno;
	   @DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
	   private LocalDateTime endtime;
	private String pollTitle;
	private String item;
	private int vote_cnt;
	
	public PollDTO() {
	}
	
	public PollDTO(LocalDateTime endtime, String pollTitle, String item) {
		super();
		this.endtime = endtime;
		this.pollTitle = pollTitle;
		this.item = item;
	}


	public PollDTO(int bno, int pno, LocalDateTime endtime, String pollTitle, String item, int vote_cnt) {
		super();
		this.bno = bno;
		this.pno = pno;
		this.endtime = endtime;
		this.pollTitle = pollTitle;
		this.item = item;
		this.vote_cnt = vote_cnt;
	}



	@Override
	public String toString() {
		return "PollDTO [bno=" + bno + ", pno=" + pno + ", endtime=" + endtime + ", pollTitle=" + pollTitle + ", item=" + item
				+ ", vote_cnt=" + vote_cnt + "]";
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public LocalDateTime getEndtime() {
		return endtime;
	}

	public void setEndtime(LocalDateTime endtime) {
		this.endtime = endtime;
	}

	public String getPollTitle() {
		return pollTitle;
	}

	public void setPollTitle(String pollTitle) {
		this.pollTitle = pollTitle;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public int getVote_cnt() {
		return vote_cnt;
	}

	public void setVote_cnt(int vote_cnt) {
		this.vote_cnt = vote_cnt;
	}

	
	
}