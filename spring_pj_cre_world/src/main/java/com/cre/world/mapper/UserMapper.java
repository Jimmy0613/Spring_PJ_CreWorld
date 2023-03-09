package com.cre.world.mapper;

import org.apache.ibatis.annotations.Param;

import com.cre.world.user.UserVo;

public interface UserMapper {
	public UserVo getUserById(@Param("user_id") String id);

	public void addUser(UserVo user);
}
