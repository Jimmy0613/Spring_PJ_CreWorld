package com.cre.world.mapper;

import org.apache.ibatis.annotations.Param;

import com.cre.world.user.UserVo;

public interface UserMapper {
	public UserVo getUserByEmail(@Param("email") String email);
	public void addUser(UserVo user);
}
