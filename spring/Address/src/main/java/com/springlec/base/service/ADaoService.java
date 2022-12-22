package com.springlec.base.service;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public interface ADaoService {
	
	public void viewlist(Model model) throws Exception;
}
