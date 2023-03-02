package com.cre.world;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/user/*")
public class UserController {
	
	@GetMapping("/join")
	public void user_join() {

	}
}
