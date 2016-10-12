package com.ripperfit.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping(value="/", method=GET)
	public String home(HttpSession session) {
		
		/*if(session.getAttribute("email") != null) {
			return "Welcome";
		} else {*/
			return "index";
		/*}*/
	}
	
	@RequestMapping(value="signUp", method=GET)
	public String signUp() {
		return "signUpModal";
	}
	
	@RequestMapping(value="login", method=GET)
	public String login() {
		return "signIn";
	}

	@RequestMapping(value="welcome", method=GET)
	public String welcome(HttpSession session) {

		/*if(session.getAttribute("email") != null) {*/
			return "Welcome";
		/*} else {
			return "signIn";
		}*/
	}

	@RequestMapping(value="success", method=GET)
	public String success() {
		return "success";
	}

	@RequestMapping(value="mailController", method=GET)
	public String mailController() {
		return "mailMessage";
	}
	
	@RequestMapping(value="admin", method=GET)
	public String admin() {
		return "AdminPage";
	}
	
	@RequestMapping(value="request", method=GET)
	public String request() {
		return "viewRequest";
	}
	
	@RequestMapping(value="role", method=GET)
	public String role() {
		return "ViewRole";
	}
	@RequestMapping(value="employee", method=GET)
	public String employee() {
		return "viewEmployee";
	}
}