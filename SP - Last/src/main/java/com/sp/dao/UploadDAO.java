package com.sp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sp.dto.ReplyDTO;
import com.sp.dto.UploadDTO;
import com.sp.dto.BoardDTO;
import com.sp.vo.PageMaker;

public interface UploadDAO {
	  public List<UploadDTO> getFiles(int bno) throws Exception;

	  public void addFile(String filename) throws Exception;

	  public void deleteFile(int filename) throws Exception;
	  
	  public void deleteFileAll(int bno) throws Exception;

	  public void modifyadd(UploadDTO dto) throws Exception;

}
