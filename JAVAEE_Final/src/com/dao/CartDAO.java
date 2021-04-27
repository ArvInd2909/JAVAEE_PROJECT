package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vo.*;


@Repository
public class CartDAO
	{
		@Autowired
		SessionFactory sessionFactory;
		
		public void insert(CartVO cartVo)
			{
			
				try
					{
						 Session session=sessionFactory.openSession();
						 Transaction transaction=session.beginTransaction();
						 session.save(cartVo);
						 transaction.commit();
						 session.close();
					}
				catch(Exception ex)
					{
						ex.printStackTrace();
					} 
			}
		public List getProduct(CartVO cartVO) {
			List ls=new ArrayList<>();
			try {
				Session session=sessionFactory.openSession();
				
				Query q=session.createQuery("from CartVO");
				
				ls=q.list();
				
				session.close();
			}
			catch (Exception ex) {
				ex.printStackTrace();
			}
			return ls;
		}
		public List getProductbyID(CartVO cartVO) {
			List ls=new ArrayList<>();
			try {
				Session session=sessionFactory.openSession();
				
				Query q=session.createQuery("from ProductVO where productID='"+cartVO.getProductId()+"'");
				
				ls=q.list();
				
				session.close();
			}
			catch (Exception ex) {
				ex.printStackTrace();
			}
			return ls;
		}
		public void Delete(CartVO cartVO)
		{
			try
				{
					
					Session session=sessionFactory.openSession();
					 Transaction transaction=session.beginTransaction();
					 session.delete(cartVO);
					 transaction.commit();					
					session.close();
				}
			catch(Exception ex)
				{
					ex.printStackTrace();
				}
		}
	}
		

