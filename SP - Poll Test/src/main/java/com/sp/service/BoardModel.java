package com.sp.service;

import java.util.List;

import com.sp.dto.BoardDTO;
import com.sp.vo.PageMaker;

public interface BoardModel {
	public void write(BoardDTO board) throws Exception;

	public void create_re(BoardDTO board) throws Exception;

	public BoardDTO read(int bno) throws Exception;

	public int select_depth(int bno) throws Exception;

	public void modify(BoardDTO board) throws Exception;

	public void remove(int bno) throws Exception;

	public void update_vct(int bno) throws Exception;

	public List<BoardDTO> listSearchCriteria(PageMaker pm) throws Exception;

	public int listSearchCount(PageMaker pm) throws Exception;

	public String select_authority(String id) throws Exception;

	public BoardDTO select_report(int bno) throws Exception;

	public void update_report(int bno) throws Exception;

	public void delete_reportcnt(int bno) throws Exception;
}
