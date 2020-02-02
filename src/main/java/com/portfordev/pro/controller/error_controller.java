package com.portfordev.pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/error")
public class error_controller {
	@GetMapping
	public String defaultError() {
		return "error/default_error";
	}

	@GetMapping("/404_error")
	public String noResource() {
		return "error/404_error";
	}

	@GetMapping("/500_error")
	public String serverError() {
		return "error/500_error";
	}
}
