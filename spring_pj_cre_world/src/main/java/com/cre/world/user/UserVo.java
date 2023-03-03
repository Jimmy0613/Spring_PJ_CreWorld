package com.cre.world.user;

import lombok.Data;

@Data
public class UserVo {
	private String nickname;
	private String pw;
	private String email;
	private String prof_img;
	private String login_type;
}
