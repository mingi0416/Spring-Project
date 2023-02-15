package com.sp.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dao.ISPDao;
import com.sp.dao.PollDAO;
import com.sp.dao.UploadDAO;
import com.sp.dto.PollDTO;
import com.sp.dto.UploadDTO;

@Service
public class PollServiceImpl implements PollService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<UploadDTO> getFiles(int bno) throws Exception {

		UploadDAO dao = sqlSession.getMapper(UploadDAO.class);
		List<UploadDTO> files = dao.getFiles(bno);
		return files;
	}

	@Override
	public void addPoll(PollDTO poll) throws Exception {
		PollDAO dao = sqlSession.getMapper(PollDAO.class);
		dao.addPoll(poll);
	}

	@Override
	public void deleteFile(String filename) throws Exception {
		UploadDAO dao = sqlSession.getMapper(UploadDAO.class);
		dao.deleteFile(filename);

	}

	@Override
	public void deleteFileAll(int bno) throws Exception {
		UploadDAO dao = sqlSession.getMapper(UploadDAO.class);
		dao.deleteFileAll(bno);
	}

}
