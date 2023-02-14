package com.sp.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sp.dto.ReplyDTO;
import com.sp.dto.UploadDTO;
import com.sp.vo.PageMaker;

public interface UploadService {
	  public List<UploadDTO> getFiles(int bno) throws Exception;

	  public void addFile(String filename) throws Exception;

	  public void deleteFile(String filename) throws Exception;
	  
	  public void deleteFileAll(int bno) throws Exception;
}
