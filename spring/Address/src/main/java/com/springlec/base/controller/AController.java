package com.springlec.base.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springlec.base.service.ADaoService;

@Controller
public class AController {

	@Autowired
	ADaoService service;
	
	@RequestMapping("/ListDao")
	public String ListDao(Model model) throws Exception{
		service.viewlist(model);
		return "listdao";
	}
}
