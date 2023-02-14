package com.sp.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dao.BoardDAO;
import com.sp.dao.ReplyDAO;
import com.sp.dto.BoardDTO;
import com.sp.dto.ReplyDTO;
import com.sp.vo.PageMaker;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert_reply_re(ReplyDTO board) throws Exception {
		System.out.println(sqlSession);
		ReplyDAO dao=sqlSession.getMapper(ReplyDAO.class);
		System.out.println("dto:"+board);
	
		if(board.getGrpord()==0) {
		dao.insert_reply_re(board);
		}else {
		dao.update_reply_re(board);
		dao.insert_reply_rere(board);
		}
	}

@Override
public List<ReplyDTO> reply_list(int bno) throws Exception {
	  ReplyDAO dao=sqlSession.getMapper(ReplyDAO.class);
	    return dao.reply_list(bno);
}

@Override
public void insert_reply(ReplyDTO vo) throws Exception {
	  ReplyDAO dao=sqlSession.getMapper(ReplyDAO.class);
	  dao.insert_reply(vo);
	
}

@Override
public void update_reply(ReplyDTO vo) throws Exception {
	  ReplyDAO dao=sqlSession.getMapper(ReplyDAO.class);
	    dao.update_reply(vo);
	
}

@Override
public void delete_reply(int rno) throws Exception {
	ReplyDAO dao=sqlSession.getMapper(ReplyDAO.class);
    dao.delete_reply(rno);
}

@Override
public void deleteBno(int bno) throws Exception {
	ReplyDAO dao=sqlSession.getMapper(ReplyDAO.class);
    dao.deleteBno(bno);
	
}

@Override
public List<com.sp.dto.ReplyDTO> listPage(Integer bno, com.sp.vo.PageMaker pm) throws Exception {
	  ReplyDAO dao=sqlSession.getMapper(ReplyDAO.class);
	    return dao.listPage(bno, pm);
}

@Override
public int count_reply(int bno) throws Exception {
	  ReplyDAO dao=sqlSession.getMapper(ReplyDAO.class);
  return dao.count_reply(bno);
}
}
