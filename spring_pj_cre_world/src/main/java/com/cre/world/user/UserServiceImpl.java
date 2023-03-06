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
	public UserVo kakao_login(UserVo user) {
		UserVo savedUser = mapper.getUserByEmail(user.getEmail());
		if (savedUser == null) {
			user.setLogin_type("kakao");
			mapper.addUser(user);
		}
		return savedUser;
	}

	@Override
	public UserVo getUserByEmail(String email) {
		return mapper.getUserByEmail(email);
	}
	
	@Override
	public void addUser(UserVo user) {
		mapper.addUser(user);
	}
	
}
