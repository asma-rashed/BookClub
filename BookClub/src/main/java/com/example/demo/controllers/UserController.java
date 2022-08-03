package com.example.demo.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.models.LoginUser;
import com.example.demo.models.User;
import com.example.demo.services.UserService;

@Controller
public class UserController {
	private final UserService userService;
	public UserController(UserService userService) {
		this.userService = userService;
	}
	@GetMapping("/")
	public String index(Model model) {
		if(!model.containsAttribute("newUser")) {
			model.addAttribute("newUser", new User());			
		}
		if(!model.containsAttribute("loginUser")) {
			model.addAttribute("loginUser", new LoginUser());			
		}
		return "reg.jsp";
	}
	@PostMapping("/register")
	public String register(@Valid@ModelAttribute("newUser") User newUser,
			BindingResult bindingResult,
			RedirectAttributes redirectAttributes,
			HttpSession httpSession) {
		User user = userService.register(newUser, bindingResult);
		if(user == null) {
			redirectAttributes.addFlashAttribute("newUser", newUser);
			redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.newUser",bindingResult);
			return "redirect:/";
		}else {
			httpSession.setAttribute("used_id", user.getId());
			return "redirect:/books";
		}
	}
	@PostMapping("/login")
	public String login(@Valid@ModelAttribute("loginUser") LoginUser loginUser,
			BindingResult bindingResult,
			RedirectAttributes redirectAttributes,
			HttpSession httpSession) {
		if(bindingResult.hasErrors()) {
			redirectAttributes.addFlashAttribute("loginUser", loginUser);
			redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.loginUser", bindingResult);
			return "redirect:/";
		}
		User user = userService.login(loginUser, bindingResult);
		if(user == null) {
			redirectAttributes.addFlashAttribute("loginUser", loginUser);
			redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.loginUser", bindingResult);
			return "redirect:/";
		} else {
			httpSession.setAttribute("user_id", user.getId());
			return "redirect:/books";
		}
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
