package com.cre.world.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cre.world.mapper.UserMapper;
import com.cre.world.service.UserServiceInterface;

import lombok.Setter;

@Service
public class UserService implements UserServiceInterface {
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;

	public UserVo getUserByEmail(UserVo user) {
		UserVo savedUser = mapper.getUserByEmail(user.getEmail());
		if(savedUser == null) {
			mapper.addUser(user);
		}
		return savedUser;
	}
}
