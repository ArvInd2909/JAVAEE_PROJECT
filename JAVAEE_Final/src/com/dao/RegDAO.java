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
public class RegDAO
	{
		@Autowired
		SessionFactory sessionFactory;
		
		public void insert(RegVO regVo)
			{
				try
					{
						 Session session=sessionFactory.openSession();
						 Transaction transaction=session.beginTransaction();
						 session.save(regVo);
						 transaction.commit();
						 session.close();
					}
				catch(Exception ex)
					{
						ex.printStackTrace();
					} 
			}
		public List getUser(int i)
		{
			List ls=new ArrayList();
				try
				{
					Session session=sessionFactory.openSession();
					
					Query q=session.createQuery("from RegVO where loginId='"+i+"'");
					
					ls=q.list();
					
					session.close();
					
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
				}
				return ls;
		}
}


