package com.cre.world;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cre.world.service.UserService;
import com.cre.world.user.KakaoAPI;
import com.cre.world.user.UserVo;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/user/*")
@Log4j
public class UserController {

	private UserService service;
	private KakaoAPI kakao;

	@GetMapping({ "/login" })
	public void user_login() {
	}

	@GetMapping("/join")
	public void join() {
	}

	@PostMapping("/join.do")
	public String join_do(HttpServletRequest request, UserVo input) {
		// 패스워드를 암호화하여 db에 넣음
		input.setUser_pw(PwEncoder.passwordEncode(input.getUser_pw()));
		service.addUser(input);
		log.info("가입 성공");
		SessionUtils.setObject(request, "LOGIN_USER", input);
		return "redirect:/user/login";
	}

	@PostMapping("/kakaoJoin.do")
	public String kakaoJoin_do(HttpServletRequest request, UserVo input) {
		service.addUser(input);
		log.info("카카오 가입 성공");
		SessionUtils.setObject(request, "LOGIN_USER", input);
		return "redirect:/";
	}
	@GetMapping("/login.do")
	public String loginNormal(HttpServletRequest request, UserVo input) {
		UserVo savedUser = service.getUserById(input.getUser_id());
		SessionUtils.setObject(request, "LOGIN_USER", savedUser);
		log.info("로그인 성공: " + savedUser.getUser_id());
		return "redirect:/";
	}

	@GetMapping("/kakaoLogin")
	public String login(HttpServletRequest request, @RequestParam("code") String code) {
		String access_Token = kakao.getAccessToken(code);
		System.out.println("controller access_token : " + access_Token);
		SessionUtils.setObject(request, "access_Token", access_Token);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		log.info("========kakao_id : " + (String) userInfo.get("kakao_id"));
		log.info("========nickname : " + (String) userInfo.get("nickname"));
		log.info("========prof_img : " + (String) userInfo.get("profile_image"));
		log.info("========thumb_img : " + (String) userInfo.get("thumbnail_image"));
		UserVo user = new UserVo();
		user.setUser_id((String) userInfo.get("id"));
		user.setUser_name((String) userInfo.get("nickname"));
		//카카오 유저의 경우 access_Token을 암호화해서 비밀번호로 db에 삽입하여 id만으로 로그인이 되는 것을 방지
		user.setUser_pw(PwEncoder.passwordEncode(access_Token));
		user.setProf_img((String) userInfo.get("profile_image"));
		user.setLogin_type("kakao");
		UserVo savedUser = service.getUserById(user.getUser_id());
		if (savedUser != null) {
			SessionUtils.setObject(request, "LOGIN_USER", savedUser);
			return "redirect:/";
		} else {
			SessionUtils.setObject(request, "KAKAO_LOGIN", user);
			return "redirect:/user/kakaoJoin";
		}
	}

	@GetMapping("/kakaoJoin")
	public void kakaoJoin() {
	}

	@GetMapping("/kakaoLogout")
	public String kakaoLogout(HttpServletRequest request) {
		kakao.kakaoLogout((String) SessionUtils.getObject(request, "access_Token"));
		SessionUtils.removeObject(request, "access_Token");
		SessionUtils.removeObject(request, "LOGIN_USER");
		return "redirect:/";
	}

	@GetMapping("/logout")
	public String user_logout(HttpServletRequest request) {
		SessionUtils.removeObject(request, "LOGIN_USER");
		return "redirect:/";
	}
}
