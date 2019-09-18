package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.PhotoalbumVO;
import com.yi.domain.PhotomemberVO;
import com.yi.persistence.PhotoDao;

@Service
public class PhotoServiceImple implements PhotoService { //dao에 있는 함수 호출하쟈

	@Autowired
	PhotoDao dao;

	@Override
	public void addAttach(PhotoalbumVO vo) throws Exception {
			dao.addAttach(vo.getFilename());
	}

	@Override
	public List<PhotoalbumVO> getAttach() throws Exception {
		return dao.getAttach();
	}

	@Override
	public void insertMember(PhotomemberVO vo) throws Exception {
		dao.insertMember(vo);
	}

	@Override
	public PhotomemberVO login(String userid, String userpw) throws Exception {
		return dao.login(userid, userpw);
	}

	@Override
	public int idcheck(String userid) throws Exception {
		return dao.idcheck(userid);
	}

	@Override
	public void delete(int no) throws Exception {
		dao.delete(no);
	}

	
}
