package com.yi.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.PhotoalbumVO;

@Repository
public class PhotoDaoImpl implements PhotoDao {
	private static final String namespace = "com.yi.mapper.photoMapper";
	@Autowired
	SqlSession sqlSession;
	

	@Override
	public void addAttach(String filename) throws Exception {
		sqlSession.insert(namespace+".addAttach", filename);		
	}

	@Override
	public List<PhotoalbumVO> getAttach() throws Exception {
		return sqlSession.selectList(namespace+".getAttach");
	}


}
