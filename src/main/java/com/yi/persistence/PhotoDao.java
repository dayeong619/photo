package com.yi.persistence;

import java.util.List;

import com.yi.domain.PhotoalbumVO;

public interface PhotoDao {
	public void addAttach(String filename) throws Exception;
	public List<PhotoalbumVO> getAttach() throws Exception;

	
	
}
