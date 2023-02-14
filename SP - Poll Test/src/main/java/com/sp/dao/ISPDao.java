package com.sp.dao;

import com.sp.dto.SPDto;

public interface ISPDao {
	public void signUp(SPDto dto) throws Exception;
	public int check_id(SPDto vo) throws Exception;
	public String find_id(SPDto dto) throws Exception;
	public String find_pw(SPDto dto) throws Exception;
	public SPDto select_info(String id) throws Exception;
	public void info_update(SPDto dto) throws Exception;
	public void info_delete(String id) throws Exception;
	public void insert_authority(String id) throws Exception;

}
