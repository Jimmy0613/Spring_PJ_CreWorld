package com.cre.world;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cre.world.user.UserServiceImpl;
import com.cre.world.user.UserVo;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@RestController
@RequestMapping("/user/*")
public class UserRestController {

	private UserServiceImpl service;

	@GetMapping("/email_confirm")
	public boolean email_confirm(@RequestParam("email") String email) {
		UserVo savedUser = service.getUserByEmail(email);
		// user db에 이메일이 존재하는지 여부를 확인해 존재하면 true, 아니면 false를 리턴
		if (savedUser != null) {
			return true;
		} else {
			return false;
		}
	}

	@GetMapping("/pw_confirm")
	public boolean pw_confirm(@RequestParam("email") String email, @RequestParam("pw") String pw) {
		UserVo savedUser = service.getUserByEmail(email);
		boolean match = false;
		match = PwEncoder.passwordMatches(pw, savedUser.getPw());
		if (match) {
			return true;
		} else {
			return false;
		}
	}
}
