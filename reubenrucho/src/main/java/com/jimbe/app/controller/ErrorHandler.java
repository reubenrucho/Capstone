package com.jimbe.app.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorHandler implements ErrorController  {
	
	private final Logger log = LoggerFactory.getLogger(ErrorController.class);
	
 
	@RequestMapping("/error")
	public String handleError(HttpServletRequest request) {
	    Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
	     
	    if (status != null) {
	        Integer statusCode = Integer.valueOf(status.toString());
	        String er="Sorry requested page not found <br> The page might have moved permanently";
	        if(statusCode == HttpStatus.NOT_FOUND.value()) {
	        	request.setAttribute("error", er);
	        	request.setAttribute("status", statusCode);	           
	        }
	        
	       if(statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
	        	request.setAttribute("error", "Technical error occured, Our Engineers are working on it");
	        	request.setAttribute("status", statusCode+" Unexpected Error");	       	
	        }
	       
	       if(statusCode == HttpStatus.BAD_REQUEST.value()) {
	        	request.setAttribute("error", "Expired session, please Login ");	
	        	log.info("{} ", status);
	            return "login";
	        }
	        
	    }
	    return "error";
	}
	 
    @Override
    public String getErrorPath() {
        return "/error";
    }
}
