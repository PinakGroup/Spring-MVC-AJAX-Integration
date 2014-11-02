package com.spring.springajaxintegration.web.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.springajaxintegration.business.service.CityService;

@RestController
@RequestMapping("/example1")
public class StateRestService {

	@Autowired
	private CityService cityService;
	
	@RequestMapping(value = "getCitiesForSelectedState", method = RequestMethod.POST)
	public @ResponseBody List<String> getCitiesForSelectedState(@RequestParam(value = "state", required = true) String state) {
		List<String> cityList = new ArrayList<String>();
		cityList.add("Select City");
		
		if(state.equals("Assam")) { cityList.addAll(cityService.getCityNamesForSelectedState("Assam"));}
        else if(state.equals("Jammu and Kashmir")) { cityList.addAll(cityService.getCityNamesForSelectedState("Jammu and Kashmir"));}
        else if(state.equals("Maharashtra")) { cityList.addAll(cityService.getCityNamesForSelectedState("Maharashtra"));}
        else if(state.equals("Uttar Pradesh")) { cityList.addAll(cityService.getCityNamesForSelectedState("Uttar Pradesh"));}
        else if(state.equals("Gujrat")) { cityList.addAll(cityService.getCityNamesForSelectedState("Gujrat"));}
        else if(state.equals("Andhra Pradesh")) {cityList.addAll(cityService.getCityNamesForSelectedState("Andhra Pradesh")); }
        else if(state.equals("Karnataka")) { cityList.addAll(cityService.getCityNamesForSelectedState("Karnataka"));}
        else if(state.equals("Kerala")) { cityList.addAll(cityService.getCityNamesForSelectedState("Kerala"));}
        else if(state.equals("West Bengal")) { cityList.addAll(cityService.getCityNamesForSelectedState("West Bengal"));}
        else if(state.equals("Tripura")) { cityList.addAll(cityService.getCityNamesForSelectedState("Tripura"));}
        else if(state.equals("Chhattisgarh")) { cityList.addAll(cityService.getCityNamesForSelectedState("Chhattisgarh"));}
        else if(state.equals("Punjab")) { cityList.addAll(cityService.getCityNamesForSelectedState("Punjab"));}
        else if(state.equals("Mizoram")) { cityList.addAll(cityService.getCityNamesForSelectedState("Mizoram"));}
        else if(state.equals("Rajasthan")) { cityList.addAll(cityService.getCityNamesForSelectedState("Rajasthan"));}
        else if(state.equals("Goa")) { cityList.addAll(cityService.getCityNamesForSelectedState("Goa"));}
        else if(state.equals("Uttarakhand")) { cityList.addAll(cityService.getCityNamesForSelectedState("Uttarakhand"));}
        else if(state.equals("Arunachal Pradesh")) { cityList.addAll(cityService.getCityNamesForSelectedState("Arunachal Pradesh"));}
        else if(state.equals("Bihar")) { cityList.addAll(cityService.getCityNamesForSelectedState("Bihar"));}
        else if(state.equals("Lakshadweep")) { cityList.addAll(cityService.getCityNamesForSelectedState("Lakshadweep"));}
        else if(state.equals("Jharkhand")) { cityList.addAll(cityService.getCityNamesForSelectedState("Jharkhand"));}
        else if(state.equals("Dadra and Nagar Haveli")) { cityList.addAll(cityService.getCityNamesForSelectedState("Dadra and Nagar Haveli"));}
        else if(state.equals("Orissa")) { cityList.addAll(cityService.getCityNamesForSelectedState("Orissa"));}
        else if(state.equals("Tamil Nadu")) { cityList.addAll(cityService.getCityNamesForSelectedState("Tamil Nadu"));}
        else if(state.equals("Himachal Pradesh")) {cityList.addAll(cityService.getCityNamesForSelectedState("Himachal Pradesh"));}
        else if(state.equals("Haryana")) { cityList.addAll(cityService.getCityNamesForSelectedState("Haryana"));}
        else if(state.equals("Madhya Pradesh")) { cityList.addAll(cityService.getCityNamesForSelectedState("Madhya Pradesh"));}
        else if(state.equals("Delhi")) { cityList.addAll(cityService.getCityNamesForSelectedState("Delhi"));}
        else if(state.equals("Daman and Diu")) { cityList.addAll(cityService.getCityNamesForSelectedState("Daman and Diu"));}
        else if(state.equals("Nagaland")) { cityList.addAll(cityService.getCityNamesForSelectedState("Nagaland"));}
        else if(state.equals("Sikkim")) { cityList.addAll(cityService.getCityNamesForSelectedState("Sikkim"));}
        else if(state.equals("Manipur")) { cityList.addAll(cityService.getCityNamesForSelectedState("Manipur"));}
        else if(state.equals("Meghalaya")) { cityList.addAll(cityService.getCityNamesForSelectedState("Meghalaya"));}
        else if(state.equals("Pondicherry")) { cityList.addAll(cityService.getCityNamesForSelectedState("Pondicherry"));}
        else if(state.equals("Andaman and Nicobar Islands")) { cityList.addAll(cityService.getCityNamesForSelectedState("Andaman and Nicobar Islands"));}
        else { }
		
		return cityList;
	}
}
