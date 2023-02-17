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
	public void addPoll(PollDTO poll) throws Exception {
		PollDAO dao = sqlSession.getMapper(PollDAO.class);
		dao.addPoll(poll);
	}

	@Override
	public List<PollDTO> getPolls(int bno) throws Exception {
		PollDAO dao = sqlSession.getMapper(PollDAO.class);
		return dao.getPolls(bno);
	}

	@Override
	public void deletepoll(int bno) throws Exception {
		PollDAO dao = sqlSession.getMapper(PollDAO.class);
		dao.deletepoll(bno);

	}

	@Override
	public void deletepollAll(int bno) throws Exception {
		PollDAO dao = sqlSession.getMapper(PollDAO.class);
		dao.deletepollAll(bno);
	}

	@Override
	public void update_vote_cnt(PollDTO poll) throws Exception {
		PollDAO dao = sqlSession.getMapper(PollDAO.class);
		dao.update_vote_cnt(poll);

	}

	@Override
	public int sum_vote_cnt(int bno) throws Exception {
		PollDAO dao = sqlSession.getMapper(PollDAO.class);

		return dao.sum_vote_cnt(bno);
	}

	@Override
	public int select_vote_cnt(int bno) throws Exception {
		PollDAO dao = sqlSession.getMapper(PollDAO.class);

		return dao.select_vote_cnt(bno);

	}

	@Override
	public void update_poll(PollDTO poll) throws Exception {
		PollDAO dao = sqlSession.getMapper(PollDAO.class);
		dao.update_poll(poll);
		
	}

}
