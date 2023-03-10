package com.sp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sp.dto.ReplyDTO;
import com.sp.dto.BoardDTO;
import com.sp.vo.PageMaker;

public interface ReplyDAO {
	  public List<ReplyDTO> reply_list(int bno) throws Exception;

	  public void insert_reply(ReplyDTO vo) throws Exception;
	  
	  public void insert_reply_re(ReplyDTO vo) throws Exception;
	  public void insert_reply_rere(ReplyDTO vo) throws Exception;

	  public void update_reply(ReplyDTO vo) throws Exception;
	  
	  public void update_reply_re(ReplyDTO vo) throws Exception;

	  public void delete_reply(int rno) throws Exception;
	  
	  public void deleteBno(int bno) throws Exception;

	  public List<ReplyDTO> listPage(
	      @Param("bno") int bno, @Param("pm") PageMaker pm) throws Exception;

	  public int count_reply(int bno) throws Exception;
	 

}
