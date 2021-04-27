package com.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="login")
public class LoginVO
	{
		@Id
		@GeneratedValue(strategy=GenerationType.AUTO)
		private int loginid;
		
		@Column(name="username")
		private String username;
		
		@Column(name="password")
		private String password;

		@Column(name="role")
		private String role;
		
		@Column(name="enable")
		private String enable;

		public int getLoginid() {
			return loginid;
		}

		public void setLoginid(int loginid) {
			this.loginid = loginid;
		}

		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getRole() {
			return role;
		}

		public void setRole(String role) {
			this.role = role;
		}

		public String getEnable() {
			return enable;
		}

		public void setEnable(String enable) {
			this.enable = enable;
		}
		
		
	}