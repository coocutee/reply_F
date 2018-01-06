package com.coo.web;

import java.util.List;

import javax.inject.Inject;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.coo.dao.BoardDAO;
import com.coo.dao.ReplyDAO;
import com.coo.domain.BoardVO;
import com.coo.domain.Criteria;
import com.coo.domain.ReplyVO;
import com.coo.domain.SearchCriteria;
import com.coo.domain.UserVO;
import com.coo.service.BoardService;
import com.coo.service.ReplyService;
import com.coo.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class BoardTest {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardTest.class);
	
	@Inject
	BoardService service;
	
	@Inject
	UserService uservice;
	
	@Inject
	BoardDAO dao;
	
	@Inject
	ReplyService rservice;
	
	@Inject
	ReplyDAO rdao;
	
	
	@Test
	public void create()throws Exception{
		BoardVO vo = new BoardVO();
		vo.setContent("들어가버ㅕ렷");
		vo.setUno(7);
		vo.setNickname("cookie");
		vo.setTitle("@@@@");
		
		service.register(vo);
		//dao.create(vo);
	}
	
	@Test
	public void listAll()throws Exception{
		System.out.println(service.listAll());
	}
	
	@Test
	public void read() throws Exception{
		System.out.println(dao.read(149));
		System.out.println(service.view(149));
	}
	
	
	@Test
	public void page()throws Exception{

		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		
		System.out.println("왜");
		
		List<BoardVO> list = dao.listCriteria(cri);
		
		for(BoardVO vo : list){
			logger.info(vo.getTitle());
			
		}
	}
	
	@Test
	public void login()throws Exception{
		UserVO vo = new UserVO();
		vo.setId("cookie");
		vo.setPw("cookie");
		System.out.println(uservice.login(vo));
	}
	
	@Test
	public void testSh()throws Exception{
		
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(1);
		cri.setKeyword("cookie");
		cri.setSearchType("t");
		
		List<BoardVO> list = dao.listSearch(cri);
		for (BoardVO vo : list){
			logger.info(vo.getBno() + ":" + vo.getTitle() );
		}
		
		logger.info("count" + dao.listSearchCount(cri));
	}
	
	@Test
	public void reptest()throws Exception{
		
		List<ReplyVO> list = rservice.repList(224);
		
		for(ReplyVO vo : list){
			logger.info(vo.getReptxt());
			
		}
	}
	
	@Test
	public void reptest1()throws Exception{
		
		ReplyVO vo = new ReplyVO();
		vo.setBno(125);
		vo.setNickname("cookie");
		vo.setReptxt("왜");
		vo.setUno(7);
		
		rservice.repRegister(vo);
		
	}

	@Test
	public void rcnt()throws Exception{
		int a = rservice.replycnt(125);
		System.out.println(a);
	}
	
	@Test
	public void nick()throws Exception{
		
		List<ReplyVO> list = rdao.nickname(224);
		
//		for(ReplyVO vo : list ){
//			logger.info(vo.getNickname());
//		}
		
		System.out.println(rdao.nickname(224));
	}
}
