package com.controller;

import java.util.List;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.*;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.security.auth.callback.TextInputCallback;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dao.CartDAO;
import com.dao.LoginDAO;
import com.dao.ProductDAO;
import com.vo.CartVO;
import com.vo.LoginVO;
import com.vo.ProductVO;
import com.dao.RegDAO;
import com.mysql.cj.Session;
import com.sun.org.apache.xpath.internal.functions.Function;
import com.vo.RegVO;

@Controller
public class ProductController
	{

		
		@Autowired ProductDAO productDao;
		@Autowired CartDAO cartDao;
	
		@RequestMapping(value="Add.html", method=RequestMethod.POST)
		public ModelAndView addProduct(@ModelAttribute ProductVO productVo,BindingResult result,@RequestParam("image") MultipartFile img) throws IOException
		{	
	
			byte[] photoType=img.getBytes();
			productVo.setImage(photoType);
			this.productDao.insert(productVo);
			return new ModelAndView("redirect:admin.html");
		}
		
		@RequestMapping(value="Inventory.html", method=RequestMethod.GET)
		public ModelAndView inventory(@ModelAttribute ProductVO productVo) {
			List ls=this.productDao.getProduct(productVo);
			ProductVO pv=(ProductVO)ls.get(0);
			byte[] s=pv.getImage();
			System.out.println(s.toString());
			return new ModelAndView("Admin/Inventory","List",ls);
		}
		
		@RequestMapping(value="shop.html", method=RequestMethod.GET)
		public ModelAndView shop(@ModelAttribute ProductVO productVo) {
			List ls=this.productDao.getProduct(productVo);
			return new ModelAndView("User/Shop","List",ls);
		}
		
		@RequestMapping(value="Typeinventory.html", method=RequestMethod.POST)
		public ModelAndView typeinventory(@ModelAttribute ProductVO productVo,@RequestParam("category")String type) {
			if(type.equals("All")) {
				return new ModelAndView("redirect:Inventory.html");
			}
			else {
				productVo.setProduct_type(type);
				List ls=this.productDao.getTypeproduct(productVo);
				return new ModelAndView("Admin/Inventory","List",ls);
			}
		}
		@RequestMapping(value="type.html", method=RequestMethod.GET)
		public ModelAndView catagory(@ModelAttribute ProductVO productVo,@RequestParam("category")String type) {
			System.out.println(type);
			productVo.setProduct_type(type);
			List ls=this.productDao.getTypeproduct(productVo);
			return new ModelAndView("User/Shop","List",ls);
		}
		@RequestMapping(value="deleteproduct.html",method=RequestMethod.GET)
		public ModelAndView datadelete(@ModelAttribute ProductVO productVo,@RequestParam("id") int i,HttpSession session)
		{
			productVo.setProductId(i);
			this.productDao.Delete(productVo);
			session.setAttribute("Delete", "Product Deleted Successfully!!!");
			return new ModelAndView("redirect:/Inventory.html");
		}
		@RequestMapping(value="updateproduct.html",method=RequestMethod.GET)
		public ModelAndView dataupdate(@ModelAttribute ProductVO productVo,HttpSession session,@RequestParam("id") int i)
		{
			System.out.println(i);
			productVo.setProductId(i);
			List ls=this.productDao.getProductbyID(productVo);
			ProductVO pv=(ProductVO)ls.get(0);
			byte[] s=pv.getImage();
			System.out.println(s.toString());
			session.setAttribute("image", s);
			session.setAttribute("product", ls);
			return new ModelAndView("Admin/Update","data",pv);
		}
		@RequestMapping(value="updateProduct.html",method=RequestMethod.POST)
		public ModelAndView updatepost(@ModelAttribute ProductVO productVo,HttpSession session)
		{
//			System.out.println(i);
//			productVo.setProductId(i);
			System.out.println(productVo.getPrice());
			System.out.println(productVo.getProduct_desc());
			System.out.println(productVo.getProduct_type());
			System.out.println(productVo.getProductId());
			System.out.println(productVo.getQuantity());
			byte[] s=(byte [])session.getAttribute("image");
			productVo.setImage(s);
			session.removeAttribute("image");
			productDao.Update(productVo);
			session.setAttribute("Update", "Product Details Updated Successfully!!!");
			return new ModelAndView("redirect:/Inventory.html");
		}
		@RequestMapping(value="addTocart.html",method=RequestMethod.GET)
		public ModelAndView addCart(@ModelAttribute ProductVO productVo,@ModelAttribute CartVO cartVo, HttpSession session,@RequestParam("id") int i)
		{
			cartVo.setProductId(i);
			
			List ls=cartDao.getProductbyID(cartVo);
			if(ls.size()==0) {
			productVo.setProductId(i);
			System.out.println(productVo.getProductId());
			ProductVO pR=(ProductVO) this.productDao.getProductbyID(productVo).get(0);
			cartVo.setProductId(pR.getProductId());
			cartVo.setPrice(pR.getPrice());
			cartVo.setProduct_desc(pR.getProduct_desc());
			cartVo.setProduct_name(pR.getProduct_name());
			cartVo.setQuantity(pR.getQuantity());
			cartVo.setPr_image(pR.getImage());
			this.cartDao.insert(cartVo);
			String s="Product Added in cart Successfully...";
			session.setAttribute("cart", s);
			return new ModelAndView("redirect:/shop.html");
			
			}
			else {
				String s="Product is Already in cart please Checkout...";
				session.setAttribute("cart", s);
				return new ModelAndView("redirect:/shop.html");
			}
		}
		@RequestMapping(value="cart.html", method=RequestMethod.GET)
		public ModelAndView cart(@ModelAttribute CartVO cartVo) {
			List ls=this.cartDao.getProduct(cartVo);
			return new ModelAndView("User/cart","Item",ls);
		}
		@RequestMapping(value="cartdelete.html",method=RequestMethod.GET)
		public ModelAndView cartdelete(@ModelAttribute CartVO cartVo,@RequestParam("id") int i)
		{
			cartVo.setCartId(i);
			this.cartDao.Delete(cartVo);
			return new ModelAndView("redirect:/cart.html");
		}
		@RequestMapping(value="checkout.html", method=RequestMethod.GET)
		public ModelAndView Check(@ModelAttribute CartVO cartVo, HttpSession session) {
			List ls=this.cartDao.getProduct(cartVo);
			for(int i=0;i<ls.size();i++) {
				CartVO cv=(CartVO)ls.get(i);
				cartDao.Delete(cv);
			}
			session.setAttribute("Checkout", "Success");
			return new ModelAndView("User/cart");
		}
}
