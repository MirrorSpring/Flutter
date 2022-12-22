package com.springlec.base.service;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.springlec.base.dao.ADao;
import com.springlec.base.model.ADto;

@Service
public class ADaoServiceImpl implements ADaoService {
	
	@Autowired
	ADao dao;

	@Override
	public void viewlist(Model model) throws Exception {
		// TODO Auto-generated method stub
		List<ADto> dtos=dao.listDao();
	    JSONObject jsonList = new JSONObject();
	    JSONArray itemList = new JSONArray();
	    
	    for (int i=0;i<dtos.size();i++) {
            JSONObject tempJson = new JSONObject();
            tempJson.put("id", dtos.get(i).getId());
            tempJson.put("name", dtos.get(i).getName());
            tempJson.put("address", dtos.get(i).getAddress());
            itemList.add(tempJson);
	    }
	    
	    jsonList.put("results",itemList);
	    model.addAttribute("ITEM",jsonList.toJSONString());
	}

}
