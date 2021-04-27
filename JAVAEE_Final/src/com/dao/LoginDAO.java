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
public class LoginDAO
	{
		@Autowired
		SessionFactory sessionFactory;
		
		public void insert(LoginVO loginVo)
			{
				try
					{
						 Session session=sessionFactory.openSession();
						 Transaction transaction=session.beginTransaction();
						 session.save(loginVo);
						 transaction.commit();
						 session.close();
					}
				catch(Exception ex)
					{
						ex.printStackTrace();
					} 
			}
		public List getLoginId(LoginVO loginvo)
		{
			List ls=new ArrayList();
				try
				{
					Session session=sessionFactory.openSession();
					
					Query q=session.createQuery("from LoginVO where username='"+loginvo.getUsername()+"'");
					
					ls=q.list();
					
					session.close();
					
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
				}
				return ls;
		}
		public List forgetpass(LoginVO loginVo) {
			// TODO Auto-generated method stub
			List ls = new ArrayList();
			try{
			Session s = sessionFactory.openSession();
			Transaction tr = s.beginTransaction();
			Query q = s.createQuery("from LoginVO where username= '"+loginVo.getUsername()+"'");
			ls = q.list();
			s.close();
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
				
			}
			return ls;
		}


		public void updatePassword(LoginVO loginVo) {
			// TODO Auto-generated method stub
			try{
				
				Session session = sessionFactory.openSession();
				Transaction tr= session.beginTransaction();
				Query q = session.createQuery("update LoginVO set password='"+loginVo.getPassword()+"' where username= '"+loginVo.getUsername()+"'");
				q.executeUpdate();
				tr.commit();
				}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}


}

