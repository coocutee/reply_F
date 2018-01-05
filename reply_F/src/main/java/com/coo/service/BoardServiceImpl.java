package com.coo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coo.dao.BoardDAO;
import com.coo.domain.BoardVO;
import com.coo.domain.Criteria;
import com.coo.domain.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;
	
	@Override
	public void register(BoardVO vo) throws Exception {

		dao.create(vo);
	}

	@Transactional
	@Override
	public BoardVO view(Integer bno) throws Exception {
	
			dao.viewCnt(bno);
		return dao.read(bno);
		
	}

	@Override
	public void modify(BoardVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void remove(Integer bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int countPaing(Criteria cri) throws Exception {
		return dao.countPaing(cri);
	}

	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public void viewCnt(int bno) throws Exception {
			dao.viewCnt(bno);
	}

}
