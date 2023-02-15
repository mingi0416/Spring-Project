package com.sp.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dao.ISPDao;
import com.sp.dto.SPDto;
@Service
public class SPServiceImpl implements ISPService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void signUp(SPDto dto) throws Exception {
		ISPDao dao = sqlSession.getMapper(ISPDao.class);
		dao.signUp(dto);
	}
	@Override
	public int check_id(String id) throws Exception {
		int cnt = sqlSession.selectOne("check_id", id);
		return cnt;
	}
	@Override
	public String find_id(SPDto dto) throws Exception {
		ISPDao dao = sqlSession.getMapper(ISPDao.class);
		String id = dao.find_id(dto);
		return id;
	}
	@Override
	public String find_pw(SPDto dto) throws Exception {
		ISPDao dao = sqlSession.getMapper(ISPDao.class);
		String pw = dao.find_id(dto);
		return pw;
	}
	@Override
	public SPDto select_info(String id) throws Exception {
		ISPDao dao = sqlSession.getMapper(ISPDao.class);
		SPDto info = dao.select_info(id);
		return info;
	}
	@Override
	public void info_update(SPDto dto) throws Exception {
		ISPDao dao = sqlSession.getMapper(ISPDao.class);
		dao.info_update(dto);
		
	}
	@Override
	public void info_delete(String id) throws Exception {
		ISPDao dao = sqlSession.getMapper(ISPDao.class);
		dao.info_delete(id);		
	}
	@Override
	public void insert_authority(String id) throws Exception {
		ISPDao dao = sqlSession.getMapper(ISPDao.class);
		dao.insert_authority(id);		
		
	}


}
