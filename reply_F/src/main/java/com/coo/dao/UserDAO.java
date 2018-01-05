package com.coo.dao;

import com.coo.domain.UserVO;

public interface UserDAO {
	
	public void create(UserVO vo)throws Exception;
	public UserVO read(int uno)throws Exception;
	public void update(UserVO vo)throws Exception;
	public void delete(int uno)throws Exception;
	
	public UserVO LOGIN(UserVO vo)throws Exception;
	public UserVO checkID(String id)throws Exception;

}
