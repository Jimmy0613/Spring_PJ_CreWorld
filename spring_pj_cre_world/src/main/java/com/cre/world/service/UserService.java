package com.cre.world.service;

import com.cre.world.user.UserVo;

public interface UserService {
	public UserVo getUserById(String id);
	
	public void addUser(UserVo user);
}
