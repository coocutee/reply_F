package com.coo.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.coo.dao.UserDAO;
import com.coo.domain.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	UserDAO dao;
	
	@Override
	public void register(UserVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public UserVO view(int uno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modify(UserVO vo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void remove(int uno) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public UserVO login(UserVO vo) throws Exception {
		return dao.LOGIN(vo);
	}

}
