package com.cre.world.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cre.world.mapper.UserMapper;
import com.cre.world.service.UserService;

import lombok.Setter;

@Service
public class UserServiceImpl implements UserService {
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;

	@Override
	public UserVo getUserById(String user_id) {
		return mapper.getUserById(user_id);
	}
	
	@Override
	public void addUser(UserVo user) {
		mapper.addUser(user);
	}
	
}
