package com.coo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coo.dao.BoardDAO;
import com.coo.dao.ReplyDAO;
import com.coo.domain.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO dao;
	
	@Inject
	private BoardDAO boardDAO;
	
	@Override
	public List<ReplyVO> repList(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(bno);
	}

	@Transactional
	@Override
	public void repRegister(ReplyVO vo) throws Exception {
		dao.create(vo);
		boardDAO.updateReplyCnt(vo.getBno(),1);
	}

	@Override
	public void repModify(ReplyVO vo) throws Exception {
		dao.update(vo);
	}

	@Transactional
	@Override
	public void repRemove(Integer rno) throws Exception {
		int bno = dao.getBno(rno);
		dao.delete(rno);
		boardDAO.updateReplyCnt(bno, -1);
	}

	@Override
	public int replycnt(Integer bno) throws Exception {
		return dao.replycnt(bno);
	}

}
