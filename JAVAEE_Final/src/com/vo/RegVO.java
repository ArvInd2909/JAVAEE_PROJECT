package com.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity

@Table(name="Register")

public class RegVO
	{
		@Id
		@GeneratedValue(strategy=GenerationType.AUTO)
		private int regid;
		
		public int getRegid() {
			return regid;
		}

		public void setRegid(int regid) {
			this.regid = regid;
		}

		public String getFirstname() {
			return firstname;
		}

		public void setFirstname(String firstname) {
			this.firstname = firstname;
		}

		public String getLastname() {
			return lastname;
		}

		public void setLastname(String lastname) {
			this.lastname = lastname;
		}


		public String getContact() {
			return contact;
		}

		public void setContact(String contact) {
			this.contact = contact;
		}


		public LoginVO getLoginVo() {
			return loginVo;
		}

		public void setLoginVo(LoginVO loginVo) {
			this.loginVo = loginVo;
		}

		@Column(name="firstname")
		private String firstname;
		
		@Column(name="lastname")
		private String lastname;
		
		@Column(name="contact")
		private String contact;
		
		@ManyToOne
		@JoinColumn(name="loginId")
		private LoginVO loginVo;
		
	}