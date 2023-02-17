package com.sp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sp.dto.ReplyDTO;
import com.sp.dto.UploadDTO;
import com.sp.dto.BoardDTO;
import com.sp.dto.PollDTO;
import com.sp.vo.PageMaker;

public interface PollDAO {
	  public List<PollDTO> getPolls(int bno) throws Exception;
	  
	  public int sum_vote_cnt(int bno) throws Exception;

	  public int select_vote_cnt(int bno) throws Exception;
	  
	  public void addPoll(PollDTO poll) throws Exception;

	  public void deletepoll(int bno) throws Exception;
	  
	  public void deletepollAll(int bno) throws Exception;
	  
	  public void update_vote_cnt(PollDTO poll) throws Exception;
	  
	  public void update_poll(PollDTO poll) throws Exception;
	  

}
