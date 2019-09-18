package com.yi.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yi.domain.LoginDto;
import com.yi.domain.PhotoalbumVO;
import com.yi.domain.PhotomemberVO;
import com.yi.service.PhotoService;
import com.yi.util.UploadFileUtils;


@Controller
public class photoController {
	
	private static final Logger logger = LoggerFactory.getLogger(photoController.class);
	
	@Autowired
	PhotoService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="photoinsert", method=RequestMethod.GET)
	public void photoinsertGET() {
		logger.info("****photoinsertGET");
	}
	
	@RequestMapping(value="photoinsert", method=RequestMethod.POST)
	public String photoinsertPOST(List<MultipartFile> filename) throws Exception {
		logger.info("****photoinsertPOST");
		
		PhotoalbumVO vo = new PhotoalbumVO();
		logger.info("****vo"+vo);
		
		ArrayList<String> list = new ArrayList<>(); 
		for(MultipartFile file : filename) {
			logger.info("file name :" + file.getOriginalFilename());
			logger.info("file size :" + file.getSize());	
			String savedName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			vo.setFilename(savedName);
			service.addAttach(vo);
			list.add(savedName);
		}
		return "redirect:/photolist";
		
	}
	
	@RequestMapping(value="/displayFile", method=RequestMethod.GET)
	public @ResponseBody ResponseEntity<byte[]> displayFile(String filename){
		logger.info("-------------- displayFile, filename="+filename);
		
		String formatName = filename.substring(filename.lastIndexOf(".")+1);//확장자만 뽑아냄
		MediaType mType = null;
		ResponseEntity<byte[]> entity = null;
		
		if(formatName.equalsIgnoreCase("jpg")) {
			mType = MediaType.IMAGE_JPEG;
		}else if(formatName.equalsIgnoreCase("gif")) {
			mType = MediaType.IMAGE_GIF;
		}else if(formatName.equalsIgnoreCase("png")) {
			mType = MediaType.IMAGE_PNG;
		}
		InputStream in = null;
		try {
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath+"/"+filename);
			headers.setContentType(mType);
			
			entity = new ResponseEntity<byte[]>(
												IOUtils.toByteArray(in),
												headers,
												HttpStatus.CREATED
												);		
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);			
		}finally {
			if(in != null) {
				try {
					in.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return entity;
	}
	
	
	@RequestMapping(value="photolist", method=RequestMethod.GET)
	public void photolistGET(Model model) throws Exception {
		logger.info("****photolistGET");
		
		List<PhotoalbumVO> list = service.getAttach();
		
		model.addAttribute("list", list);
	
	}
	
	
	@ResponseBody
	@RequestMapping(value="deleteFile", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String filename) throws Exception{
		logger.info("---->deleteFile, filename은 "+filename);
		ResponseEntity<String> entity = null;
		
		try {
			
			//큰 이미지 삭제
			String originFile = filename.substring(0,12)+filename.substring(14);
			File file2 = new File(uploadPath+"/"+originFile);
			if(file2.exists()) { //큰 이미지 파일이 존재하면
				file2.delete(); //파일 삭제
			}
			
			//작은 이미지 삭제
			File file = new File(uploadPath+"/"+filename);
			if(file.exists()) { //작은 이미지 파일이 존재하면
				file.delete(); //파일 삭제
			}
			
			entity = new ResponseEntity<>("success", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="join", method=RequestMethod.GET)
	public void joinGET() {
		logger.info("****joinGET");
	}
	
	@RequestMapping(value="idcheck")
	@ResponseBody
	public int idcheck(@RequestBody String userid) throws Exception {
        
       return service.idcheck(userid);
    }
	
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String joinPOST(PhotomemberVO vo) throws Exception {
		logger.info("****joinPOST");
		
		service.insertMember(vo);
		
		return "redirect:/login";
	}
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public void loginGET() {
		logger.info("****loginGET");
	}
	
	@RequestMapping(value="loginPost", method=RequestMethod.POST)
	public void loginPOST(PhotomemberVO vo, Model model) throws Exception {
		logger.info("****loginPOST, vo는"+vo);
		PhotomemberVO dbmember = service.login(vo.getUserid(), vo.getUserpw());
		
		if(dbmember == null) {
			logger.info("loginPOST -> login fail!!!!!!!!!!!!!!!");
			return ;
		}
		
		logger.info("1");
		LoginDto dto = new LoginDto();
		dto.setUserid(dbmember.getUserid());
		dto.setUsername(dbmember.getUsername());
		model.addAttribute("loginDto", dto);
		logger.info("2");
	}
	
	
	
	
	
}













