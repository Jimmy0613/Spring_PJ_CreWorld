package com.cre.world.mapper;

import org.apache.ibatis.annotations.Param;

import com.cre.world.user.UserVo;

public interface UserMapper {
	public UserVo getUser(@Param("user_id") String user_id);
}
