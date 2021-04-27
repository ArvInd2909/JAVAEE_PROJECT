package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dao.LoginDAO;
import com.dao.RegDAO;
import com.sun.org.apache.bcel.internal.generic.NEW;
import com.vo.LoginVO;
import com.vo.ProductVO;
import com.vo.RegVO;

@Controller
public class MainController
	{
		@Autowired RegDAO regdao;
		@Autowired LoginDAO logindao;
	
		@RequestMapping(value={"/","index.html"},method=RequestMethod.GET)
		public ModelAndView loadIndex() 
			{
				return new ModelAndView("Admin/login");
			}
	
	
		@RequestMapping(value = "login.html",method=RequestMethod.GET)
		public String loadLogin() 
			{
				return "Admin/login";
			}
		@RequestMapping(value="admin.html",method=RequestMethod.GET)
		public ModelAndView admin() 
		{
			return new ModelAndView("Admin/Home","data", new ProductVO() );
		}
		
		@RequestMapping(value = "user.html",method=RequestMethod.GET)
		public String user(HttpSession session,@ModelAttribute LoginVO loginVO,@ModelAttribute RegVO regVO)
			{
				Authentication auth = SecurityContextHolder.getContext().getAuthentication();	
				
				User user=(User)auth.getPrincipal();
				
				String userName=user.getUsername();
				
				session.setAttribute("user",userName);
				
				System.out.println("userName:"+userName);
				
				loginVO.setUsername(userName);
				
				List ls=this.logindao.getLoginId(loginVO);
				LoginVO lvo=(LoginVO)ls.get(0);
				
				int loginId =lvo.getLoginid();
				List us=this.regdao.getUser(loginId);
				RegVO rvo=(RegVO)us.get(0);
				String name=rvo.getFirstname();
				session.setAttribute("FName",name);
				System.out.println("loginId:"+loginId);
				System.out.println("FName: "+name);
				session.setAttribute("loginId",loginId);
				
				return "User/home";
			}
	
		@RequestMapping(value = "403page.html",method=RequestMethod.GET)
		public String AccessDenied()
			{
				return "Admin/403page";
			}
		
		@RequestMapping(value="logout.html",method=RequestMethod.GET)
		public String logout(HttpSession session)
			{
				return "Admin/login";
			}
		@RequestMapping(value="about.html",method=RequestMethod.GET)
		public String About()
			{
				return "User/US";
			}
		@RequestMapping(value="forgotpass.html",method=RequestMethod.GET)
		public String fogot()
			{
				return "Admin/forgorPassword";
			}
}
