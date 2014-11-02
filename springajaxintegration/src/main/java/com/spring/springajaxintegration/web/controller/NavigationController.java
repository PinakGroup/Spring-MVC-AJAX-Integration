package com.spring.springajaxintegration.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.springajaxintegration.business.service.StateService;
import com.spring.springajaxintegration.persistence.model.StateEntity;

@Controller
@RequestMapping("/")
public class NavigationController {
	
	@Autowired
	private StateService stateService;

	@RequestMapping(value = "/example1", method = RequestMethod.GET)
	public ModelAndView getExample1() {
		ModelAndView modelAndView = new ModelAndView("Example1");
		List<StateEntity> stateList = new ArrayList<StateEntity>();
		stateList = stateService.getAllStates();
		modelAndView.addObject("stateList", stateList);
		return modelAndView;
	}
	
	@RequestMapping(value = "/example2", method = RequestMethod.GET)
	public ModelAndView getExample2() {
		ModelAndView modelAndView = new ModelAndView("Example2");
		return modelAndView;
	}
}
