package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.PhotoalbumVO;
import com.yi.persistence.PhotoDao;

@Service
public class PhotoServiceImple implements PhotoService { //dao에 있는 함수 호출하쟈

	@Autowired
	PhotoDao dao;

	@Override
	public void addAttach(PhotoalbumVO vo) throws Exception {
		for(String filename : vo.getFilename()) {
			dao.addAttach(filename);
		}
		
	}

	@Override
	public List<PhotoalbumVO> getAttach() throws Exception {
		return dao.getAttach();
	}

	
}
