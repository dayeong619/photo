package com.yi.persistence;

import java.util.List;

import com.yi.domain.PhotoalbumVO;
import com.yi.domain.PhotomemberVO;

public interface PhotoDao {
	public void addAttach(String filename) throws Exception;
	public List<PhotoalbumVO> getAttach() throws Exception;
	public int idcheck(String userid) throws Exception;
	
	public void insertMember(PhotomemberVO vo) throws Exception;
	public PhotomemberVO login(String userid, String userpw) throws Exception;
}
