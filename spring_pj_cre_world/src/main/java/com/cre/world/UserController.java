package com.cre.world;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cre.world.user.UserService;
import com.cre.world.user.UserVo;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/user/*")
@Log4j
@SessionAttributes("LOGIN_USER")
public class UserController {

	private UserService service;

	@GetMapping({"/login","/kakaoLogin"})
	public void user_login() {
	}

	@GetMapping("/join")
	public void user_join() {
	}

	@PostMapping("/kakaoLogin")
	public String loginWithKakao(UserVo input, Model model) {
		log.info("카카오 로그인 인증 정보:" + input.getEmail());
		log.info("카카오 로그인 인증 정보:" + input.getProf_img());
		log.info("카카오 로그인 인증 정보:" + input.getNickname());
		input.setLogin_type("kakao");
		UserVo savedUser = service.getUserByEmail(input);

		// 저장된 회원 정보가 없으면 전달받은 회원 정보를 세션에 저장, 있으면 기존 정보 저장.
		if (savedUser != null) {
			model.addAttribute("LOGIN_USER", savedUser);
		} else {
			model.addAttribute("LOGIN_USER", input);
		}
		return "redirect:/";
	}
}
