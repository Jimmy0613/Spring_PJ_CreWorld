package com.cre.world;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cre.world.user.UserService;
import com.cre.world.user.UserVo;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class HomeController {
	
	private UserService userService;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		UserVo manager = userService.getUser("manager");
		model.addAttribute("manager", manager);
		return "home";
	}
	
}
