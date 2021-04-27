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
public class ProductDAO
	{
		@Autowired
		SessionFactory sessionFactory;
		
		public void insert(ProductVO productVo)
			{
			
				try
					{
						 Session session=sessionFactory.openSession();
						 Transaction transaction=session.beginTransaction();
						 session.save(productVo);
						 transaction.commit();
						 session.close();
					}
				catch(Exception ex)
					{
						ex.printStackTrace();
					} 
			}
		public List getProduct(ProductVO productVO) {
			List ls=new ArrayList<>();
			try {
				Session session=sessionFactory.openSession();
				
				Query q=session.createQuery("from ProductVO");
				
				ls=q.list();
				
				session.close();
			}
			catch (Exception ex) {
				ex.printStackTrace();
			}
			return ls;
		}
		public List getProductbyID(ProductVO productVO) {
			List ls=new ArrayList<>();
			try {
				Session session=sessionFactory.openSession();
				
				Query q=session.createQuery("from ProductVO where productId='"+productVO.getProductId()+"'");
				
				ls=q.list();
				
				session.close();
			}
			catch (Exception ex) {
				ex.printStackTrace();
			}
			return ls;
		}
		public List getTypeproduct(ProductVO productVO) {
			List ls=new ArrayList<>();
			try {
				Session session=sessionFactory.openSession();
				
				Query q=session.createQuery("from ProductVO where product_type='"+productVO.getProduct_type()+"'");
				
				ls=q.list();
				
				session.close();
			}
			catch (Exception ex) {
				ex.printStackTrace();
			}
			return ls;
		}
		public void Delete(ProductVO productVO)
		{
			try
				{
					
					Session session=sessionFactory.openSession();
					 Transaction transaction=session.beginTransaction();
					 session.delete(productVO);
					 transaction.commit();					
					session.close();
				}
			catch(Exception ex)
				{
					ex.printStackTrace();
				}
		}
		public void Update(ProductVO productVO)
		{
			try
				{
					
					Session session=sessionFactory.openSession();
					 Transaction transaction=session.beginTransaction();
					 session.saveOrUpdate(productVO);
					 transaction.commit();					
					session.close();
				}
			catch(Exception ex)
				{
					ex.printStackTrace();
				}
		}
	}
		

