package com.coo.dao;

import java.util.List;

import com.coo.domain.ReplyVO;

public interface ReplyDAO {
	
	public List<ReplyVO> list(Integer bno)throws Exception;
	public void create(ReplyVO vo)throws Exception;
	public void update(ReplyVO vo)throws Exception;
	public void delete(Integer rno)throws Exception;
	public int replycnt(Integer bno)throws Exception;
	
	public int getBno(Integer rno)throws Exception;
}
