package com.coo.service;

import com.coo.domain.UserVO;

public interface UserService {
	
	public void register(UserVO vo)throws Exception;
	public UserVO view(int uno)throws Exception;
	public void modify(UserVO vo)throws Exception;
	public void remove(int uno)throws Exception;
	
	public UserVO login(UserVO vo)throws Exception;

}
