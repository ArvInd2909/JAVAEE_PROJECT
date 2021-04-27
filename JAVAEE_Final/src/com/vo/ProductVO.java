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
@Table(name="Product")
public class ProductVO
	{
		@Id
		@GeneratedValue(strategy=GenerationType.AUTO)
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

		public String getProduct_type() {
			return product_type;
		}

		public void setProduct_type(String product_type) {
			this.product_type = product_type;
		}

		public int getQuantity() {
			return quantity;
		}

		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}

		public byte[] getImage() {
			return image;
		}

		public void setImage(byte[] image) {
			this.image = image;
		}
		
		private String product_picAsBase64; 

		public String getProduct_picAsBase64() {
			return product_picAsBase64=Base64.getEncoder().encodeToString(image);
		}

		public void setProduct_picAsBase64(String product_picAsBase64) {
			this.product_picAsBase64 = Base64.getEncoder().encodeToString(this.image);
		}

		public double getPrice() {
			return price;
		}

		public void setPrice(double price) {
			this.price = price;
		}

		@Column(name="product_desc")
		private String product_desc;

		@Column(name="product_type")
		private String product_type;

		@Column(name="quantity")
		private int quantity;
		
		@Column(name="image")
		@Lob
		private byte[] image;
		
		@Column(name="price")
		private double price;

	}