package com.yi.service;

import java.util.List;

import com.yi.domain.PhotoalbumVO;

public interface PhotoService {
	
	public void addAttach(PhotoalbumVO vo) throws Exception;
	public List<PhotoalbumVO> getAttach() throws Exception;
	
	
	
	
}
