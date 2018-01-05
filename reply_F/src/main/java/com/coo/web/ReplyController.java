package com.coo.web;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.coo.domain.ReplyVO;
import com.coo.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);

	@Inject
	private ReplyService service;
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO vo){
		//제이슨포맷을 이용할거라 리퀘스트바디 어노테이션 사용
		
		ResponseEntity<String> entity = null;
		
		try{
			service.repRegister(vo);
			entity = new ResponseEntity<String> ("SUCCESS",HttpStatus.OK);
		}catch(Exception e){
			//새로운 댓글 등록에 실패하면 예외원인 메세지와 함께 배드리퀘스트(400에러)전송
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/all/{bno}", method=RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list (@PathVariable("bno") Integer bno){
		
		ResponseEntity<List<ReplyVO>> entity = null;
		
		try{
			entity = new ResponseEntity<>(service.repList(bno),HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value= "/{rno}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("rno")Integer rno, @RequestBody ReplyVO vo){
			ResponseEntity<String> entity = null;
			
			try{
				vo.setRno(rno);
				service.repModify(vo);
			}catch(Exception e){
				e.printStackTrace();
				entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			}
			return entity;
	}
	
	@RequestMapping(value="/{rno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("rno")Integer rno){
		ResponseEntity<String> entity = null;
		try{
			service.repRemove(rno);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
