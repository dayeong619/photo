package com.yi.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.PhotoalbumVO;
import com.yi.domain.PhotomemberVO;

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

	@Override
	public void insertMember(PhotomemberVO vo) throws Exception {
		sqlSession.insert(namespace+".insertMember", vo);
	}

	@Override
	public PhotomemberVO login(String userid, String userpw) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("userpw", userpw);
		return sqlSession.selectOne(namespace+".login", map);
	}

	@Override
	public int idcheck(String userid) throws Exception {
		return sqlSession.selectOne(namespace+".idcheck",userid);
	}

	@Override
	public void delete(int no) throws Exception {
		sqlSession.delete(namespace+".insertMember", no);
	}


}
