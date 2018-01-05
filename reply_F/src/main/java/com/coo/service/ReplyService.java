package com.coo.service;

import java.util.List;

import com.coo.domain.ReplyVO;

public interface ReplyService {
	
	public List<ReplyVO> repList(Integer bno)throws Exception;
	public void repRegister(ReplyVO vo)throws Exception;
	public void repModify(ReplyVO vo)throws Exception;
	public void repRemove(Integer rno)throws Exception;
	public int replycnt(Integer bno)throws Exception;
	

}
