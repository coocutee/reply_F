package com.coo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coo.domain.BoardVO;
import com.coo.domain.Criteria;
import com.coo.domain.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {
	 
	@Inject
		private SqlSession session;

		private static String namespace = "com.coo.mapper.BoardMapper";
	
	@Override
	public void create(BoardVO vo) throws Exception {
		session.insert(namespace+".create",vo);

	}

	@Override
	public BoardVO read(Integer bno) throws Exception {
		
		return session.selectOne(namespace+".read",bno);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		session.update(namespace+".update",vo);

	}

	@Override
	public void delete(Integer bno) throws Exception {
		session.delete(namespace+".delete",bno);

	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return session.selectList(namespace+".listAll");
	}

	@Override
	public List<BoardVO> listPage(Integer page) throws Exception {

		//페이지가 0과 같거나 크면 1.
//		if( page <= 0 ){
//			page = 1;
//		}
//		
//		page = (page - 1)*10;
		
		return session.selectList(namespace+".listPage", page);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		
		return session.selectList(namespace+".listPage",cri);
	}

	@Override
	public int countPaing(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".countPaging",cri);
	}

	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listSearch",cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".listSearchCount",cri);
	}

	@Override
	public void viewCnt(int bno) throws Exception {
		// TODO Auto-generated method stub
		session.selectOne(namespace+".viewCnt",bno);
	}

	@Override
	public void updateReplyCnt(int bno, int amount) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("bno",bno);
		paramMap.put("amount",amount);
		
		session.update(namespace+".updateReplyCnt",paramMap);
	}

	@Override
	public void addLikeCnt(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.selectOne(namespace+".addLikeCnt",vo);
	}

	@Override
	public void updateLike(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".updateLike",vo);
	}

	@Override
	public Integer likeHistory(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".likeHistory",vo);
	}

	@Override
	public Integer readLikeCnt(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".readLikeCnt",bno);
	}

}
