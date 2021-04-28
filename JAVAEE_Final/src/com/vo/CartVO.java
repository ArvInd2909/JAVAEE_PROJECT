package com.vo;

import java.util.Base64;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import com.sun.tools.javac.util.Convert;


@Entity
@Table(name="Cart")
public class CartVO
	{
		@Id
		@GeneratedValue(strategy=GenerationType.AUTO)
		private int cartId;	
	
		public int getCartId() {
			return cartId;
		}

		public void setCartId(int cartId) {
			this.cartId = cartId;
		}
		@Column(name="productId")
		private int productId;

		@Column(name="product_name")
		private String product_name;
		
		public int getProductId() {
			return productId;
		}

		public void setProductId(int productId) {
			this.productId = productId;
		}

		public String getProduct_name() {
			return product_name;
		}

		public void setProduct_name(String product_name) {
			this.product_name = product_name;
		}

		public String getProduct_desc() {
			return product_desc;
		}

		public void setProduct_desc(String product_desc) {
			this.product_desc = product_desc;
		}

		public int getQuantity() {
			return quantity;
		}

		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
		
		public double getPrice() {
			return price;
		}

		public void setPrice(double price) {
			this.price = price;
		}
		private String product_picAsBase64; 

		public String getProduct_picAsBase64() {
			return product_picAsBase64=Base64.getEncoder().encodeToString(this.pr_image);
		}

		public void setProduct_picAsBase64(String product_picAsBase64) {
			this.product_picAsBase64 = Base64.getEncoder().encodeToString(pr_image);
		}

		@Column(name="product_desc")
		private String product_desc;

		@Column(name="quantity")
		private int quantity;
		
		@Column(name="price")
		private double price;
		
		@Column(name="pr_image")
		@Lob
		private byte[] pr_image;

		public byte[] getPr_image() {
			return pr_image;
		}

		public void setPr_image(byte[] pr_image) {
			this.pr_image = pr_image;
		}

	}