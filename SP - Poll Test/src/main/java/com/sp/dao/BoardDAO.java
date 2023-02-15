package com.sp.dao;

import java.util.List;

import com.sp.dto.BoardDTO;
import com.sp.vo.PageMaker;

public interface BoardDAO {
	  public void create(BoardDTO vo) throws Exception;
	  public void create_re(BoardDTO vo) throws Exception;
	  public void create_rere(BoardDTO vo) throws Exception;
	  public BoardDTO read(int bno) throws Exception;
	  public BoardDTO select_report(int bno) throws Exception;
	  public int select_depth(int bno) throws Exception;

	  public void update(BoardDTO vo) throws Exception;
	  public void update_report(int bno) throws Exception;
	  public void delete(int bno) throws Exception;
	  public void delete_reportcnt(int bno) throws Exception;
	  public void update_vct(int bno) throws Exception;
	  
	  public void update_re(BoardDTO board) throws Exception;
	//  
	  public List<BoardDTO> listSearch(PageMaker pm)throws Exception;
	//  
	  public int listSearchCount(PageMaker pm)throws Exception;
	  
	  public String select_authority(String id) throws Exception;
	  
	  

}
