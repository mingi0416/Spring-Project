package com.sp.dto;

public class UploadDTO {
	private int attno;
	private int bno;
	private String filename;
	
	public UploadDTO() {
	}

	public UploadDTO(int attno, int bno, String filename) {
		super();
		this.attno = attno;
		this.bno = bno;
		this.filename = filename;
	}
	

	@Override
	public String toString() {
		return "UploadDTO [attno=" + attno + ", bno=" + bno + ", filename=" + filename + "]";
	}

	public int getAttno() {
		return attno;
	}

	public void setAttno(int attno) {
		this.attno = attno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	
}
	