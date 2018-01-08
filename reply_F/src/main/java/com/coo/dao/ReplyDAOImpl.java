package com.coo.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coo.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	
	@Inject
	private SqlSession session;

	private static String namespace = "com.coo.mapper.ReplyMapper";
	
	@Override
	public List<ReplyVO> list(Integer bno) throws Exception {
		return session.selectList(namespace+".list", bno);
	}

	@Override
	public void create(ReplyVO vo) throws Exception {

		session.insert(namespace+".create",vo);
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		session.update(namespace+".update",vo);
	}

	@Override
	public void delete(Integer rno) throws Exception {
		session.delete(namespace+".delete",rno);
	}

	@Override
	public int replycnt(Integer bno) throws Exception {
		return session.selectOne(namespace+".replycnt",bno);
	}

	@Override
	public int getBno(Integer rno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".getBno",rno);
	}

	@Override
	public String nickname(Integer rno) throws Exception {
		// TODO Auto-generated method stub
		 return session.selectOne(namespace+".nickname",rno);
	}




}
