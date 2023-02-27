package com.sp.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dao.BoardDAO;
import com.sp.dao.ISPDao;
import com.sp.dao.ReportDAO;
import com.sp.dao.UploadDAO;
import com.sp.dto.ReplyDTO;
import com.sp.dto.ReportDto;
import com.sp.dto.UploadDTO;

@Service
public class ReportServiceImpl implements ReportService {
	@Autowired
	private SqlSession sqlSession;
	@Override
	public List<ReportDto> reply_list() throws Exception {
		ReportDAO dao=sqlSession.getMapper(ReportDAO.class);
		return dao.reply_list();
	}

	@Override
	public List<ReportDto> board_list() throws Exception {
		ReportDAO dao=sqlSession.getMapper(ReportDAO.class);
		return dao.board_list();
	}

	@Override
	public void delete_reported(Integer bno, Integer rno) throws Exception {
		ReportDAO dao=sqlSession.getMapper(ReportDAO.class);
		dao.delete_reported(bno, rno);
		
	}

	@Override
	public void insert_report(ReportDto vo) throws Exception {
		ReportDAO dao=sqlSession.getMapper(ReportDAO.class);
		dao.insert_report(vo);
		
	}


}
