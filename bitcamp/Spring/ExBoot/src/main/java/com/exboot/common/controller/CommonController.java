package com.exboot.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {
	
	@RequestMapping(value = "/helloworld")
	public String hw() {
		return "helloworld";
	}

}
