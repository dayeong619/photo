package com.yi.photo;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.domain.PhotomemberVO;
import com.yi.persistence.PhotoDao;

@RunWith(SpringJUnit4ClassRunner.class) //junit
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class PhotoDaoTest {
	@Autowired
	PhotoDao dao;
	
	@Test
	public void insertMemberTest() throws Exception {
		PhotomemberVO vo = new PhotomemberVO();
		vo.setUserid("u22222");
		vo.setUsername("2저일");
		vo.setUserpw("u1010");
		vo.setEmail("user01@naver.com");
		vo.setTel("010-0000-0000");
		dao.insertMember(vo);
	} 
	
//	@Test
	
	
	
	
	
	
	
}
