package com.sp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sp.dto.ReplyDTO;
import com.sp.dto.ReportDto;
import com.sp.dto.BoardDTO;
import com.sp.vo.PageMaker;

public interface ReportDAO {
	public List<ReportDto> reply_list() throws Exception;

	public List<ReportDto> board_list() throws Exception;
	
	public void delete_reported(@Param("bno") Integer bno, @Param("rno") Integer rno) throws Exception;

	public void insert_report(ReportDto vo) throws Exception;
}
