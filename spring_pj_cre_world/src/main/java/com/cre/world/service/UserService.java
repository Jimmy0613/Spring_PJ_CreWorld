package com.cre.world.service;

import com.cre.world.user.UserVo;

public interface UserService {
	public UserVo kakao_login(UserVo user);

	public UserVo getUserByEmail(String email);
	
	public void addUser(UserVo user);
}
