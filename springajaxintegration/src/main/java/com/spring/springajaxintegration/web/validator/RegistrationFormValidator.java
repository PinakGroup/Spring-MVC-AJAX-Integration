package com.spring.springajaxintegration.web.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("example3/validate")
public class RegistrationFormValidator {

	private Pattern pattern;
	private Matcher matcher;

	/**
	 * Pattern to validate email address.
	 */
	private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

	/**
	 * Pattern to validate mobile number of 10 digits
	 */
	private static final String MOBILE_NUMBER_PATTERN = "\\d{10}";
	
	/**
	 * Pattern to validate postal code of 6 digits
	 */
	private static final String POSTAL_CODE_PATTERN = "\\d{10}";
	
	@RequestMapping(value = "checkNameForEmpty", method = RequestMethod.POST)
	public @ResponseBody String checkNameForEmpty(
			@RequestParam("name") String name) {
		if(name.trim().isEmpty() || name.equals("")) {
			return "EMPTY";
		} else {
			return "NOT_EMPTY";
		}
	}
	
	@RequestMapping(value = "checkPasswordForEmpty", method = RequestMethod.POST)
	public @ResponseBody String checkPasswordForEmpty(
			@RequestParam("password") String password) {
		if(password.trim().isEmpty() || password.equals("")) {
			return "EMPTY";
		} else {
			return "NOT_EMPTY";
		}
	}
	
	@RequestMapping(value = "checkRepeatPasswordForEmpty", method = RequestMethod.POST)
	public @ResponseBody String checkRepeatPasswordForEmpty(
			@RequestParam("repeatPassword") String repeatPassword) {
		if(repeatPassword.trim().isEmpty() || repeatPassword.equals("")) {
			return "EMPTY";
		} else {
			return "NOT_EMPTY";
		}
	}
	
	@RequestMapping(value = "checkEmailIdForEmpty", method = RequestMethod.POST)
	public @ResponseBody String checkEmailIdForEmpty(
			@RequestParam("emailId") String emailId) {
		if(emailId.trim().isEmpty() || emailId.equals("")) {
			return "EMPTY";
		} else {
			return "NOT_EMPTY";
		}
	}
	
	@RequestMapping(value = "checkMobileNumberForEmpty", method = RequestMethod.POST)
	public @ResponseBody String checkMobileNumberForEmpty(
			@RequestParam("mobileNumber") String mobileNumber) {
		if(mobileNumber.trim().isEmpty() || mobileNumber.equals("")) {
			return "EMPTY";
		} else {
			return "NOT_EMPTY";
		}
	}
	
	@RequestMapping(value = "checkStateForEmpty", method = RequestMethod.POST)
	public @ResponseBody String checkStateForEmpty(
			@RequestParam("state") String state) {
		if(state.trim().isEmpty() || state.equals("Select State")) {
			return "EMPTY";
		} else {
			return "NOT_EMPTY";
		}
	}
	
	@RequestMapping(value = "checkCityForEmpty", method = RequestMethod.POST)
	public @ResponseBody String checkCityForEmpty(
			@RequestParam("city") String city) {
		if(city.trim().isEmpty() || city.equals("Select City")) {
			return "EMPTY";
		} else {
			return "NOT_EMPTY";
		}
	}
	
	@RequestMapping(value = "checkPostalCodeForEmpty", method = RequestMethod.POST)
	public @ResponseBody String checkPostalCodeForEmpty(
			@RequestParam("postalCode") String postalCode) {
		if(postalCode.trim().isEmpty() || postalCode.equals("")) {
			return "EMPTY";
		} else {
			return "NOT_EMPTY";
		}
	}
	
	@RequestMapping(value = "checkCountryForEmpty", method = RequestMethod.POST)
	public @ResponseBody String checkCountryForEmpty(
			@RequestParam("country") String country) {
		if(country.trim().isEmpty() || country.equals("Select Country")) {
			return "EMPTY";
		} else {
			return "NOT_EMPTY";
		}
	}
}