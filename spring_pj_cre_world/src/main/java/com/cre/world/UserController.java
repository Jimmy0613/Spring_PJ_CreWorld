package com.cre.world;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cre.world.service.UserService;
import com.cre.world.user.UserVo;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/user/*")
@Log4j
public class UserController {

	private UserService service;

	@GetMapping({ "/login", "/kakaoLogin" })
	public void user_login() {
	}

	@GetMapping("/join")
	public void join() {
	}

	@PostMapping("/join.do")
	public String join_do(UserVo input) {
		input.setPw(PwEncoder.passwordEncode(input.getPw()));
		service.addUser(input);
		log.info("가입 성공");
		return "redirect:/user/login";
	}

	@GetMapping("/login.do")
	public String loginNormal(HttpServletRequest request, UserVo input) {
		UserVo savedUser = service.getUserByEmail(input.getEmail());
		SessionUtils.setObject(request, "LOGIN_USER", savedUser);
		log.info("로그인 성공: " + savedUser.getEmail());
		return "redirect:/";
	}

	@PostMapping("/kakaoLogin")
	public String loginWithKakao(HttpServletRequest request, UserVo input) {
		log.info("카카오 로그인 인증 정보:" + input.getEmail());
		UserVo savedUser = service.kakao_login(input);

		// 저장된 회원 정보가 없으면 전달받은 회원 정보를 세션에 저장, 있으면 기존 정보 저장.
		if (savedUser != null) {
			SessionUtils.setObject(request, "LOGIN_USER", savedUser);
		} else {
			SessionUtils.setObject(request, "LOGIN_USER", input);
		}
		return "redirect:/";
	}

	@GetMapping("/logout")
	public String user_logout(HttpServletRequest request) {
		SessionUtils.removeObject(request, "LOGIN_USER");
		return "redirect:/";
	}
}
