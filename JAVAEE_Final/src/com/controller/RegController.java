package com.controller;

import java.util.List;
import java.io.IOException;
import java.util.*;

import javax.security.auth.callback.TextInputCallback;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dao.LoginDAO;
import com.dao.ProductDAO;
import com.vo.LoginVO;
import com.vo.ProductVO;
import com.dao.RegDAO;
import com.sun.org.apache.xpath.internal.functions.Function;
import com.vo.RegVO;

@Controller
public class RegController
	{

		@Autowired RegDAO regDao;
		@Autowired LoginDAO loginDao;
		@Autowired ProductDAO productDao;
	
		@RequestMapping(value ="loadreg.html",method=RequestMethod.GET)
		public ModelAndView loadreg() 
			{
				return new ModelAndView("User/Register","data",new RegVO());
			}
		@RequestMapping(value="Register.html",method=RequestMethod.POST)
		public ModelAndView doRegister(@ModelAttribute RegVO regVo,LoginVO loginVo,HttpSession session,@RequestParam("r_password")String confirm_pass) 
			{	
				String password=regVo.getLoginVo().getPassword();
//				System.out.println("heellloo");
//				System.out.println(confirm_pass);
				if(password.equals(confirm_pass))
				{	
					loginVo.setUsername(regVo.getLoginVo().getUsername());
					loginVo.setPassword(regVo.getLoginVo().getPassword());
					loginVo.setRole("ROLE_USER");
					loginVo.setEnable("1");
					this.loginDao.insert(loginVo);
					regVo.setLoginVo(loginVo);
				    this.regDao.insert(regVo);
				    return new ModelAndView("redirect:login.html");

				}
				else
				{
					String pass=("Confirm Password does not Match With Password!!!");
					System.out.println(pass);
					session.setAttribute("Cnf_pass", pass);
					return new ModelAndView("redirect:loadreg.html");
				}
			}
}
