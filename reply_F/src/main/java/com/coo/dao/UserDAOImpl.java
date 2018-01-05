package com.coo.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coo.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Inject
	private SqlSession session;

	private static String namespace = "com.coo.mapper.UserMapper";

	@Override
	public void create(UserVO vo) throws Exception {
		session.insert(namespace+".create",vo);
	}

	@Override
	public UserVO read(int uno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(UserVO vo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int uno) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public UserVO LOGIN(UserVO vo) throws Exception {
		return session.selectOne(namespace + ".login", vo);
	}

	@Override
	public UserVO checkID(String id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".checkID",id);
	}

}
