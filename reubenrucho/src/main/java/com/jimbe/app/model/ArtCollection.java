package com.jimbe.app.model;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="art_collection")
public class ArtCollection {
	
	public  ArtCollection() {
		
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;	
	
	private String art;
	
	private String description;
	private String name;
	private String dimension;
	//private Date post_date;
	//private Date sold_date;
	private double price;
	private String medium;
	
	@OneToOne
	private Users postedBy;

	public Users getPostedBy() {
		return postedBy;
	}

	public void setPostedBy(Users postedBy) {
		this.postedBy = postedBy;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getArt() {
		return art;
	}

	public void setArt(String art) {
		this.art = art;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

//	public Users getPostedBy() {
//		return postedBy;
//	}
//
//	public void setPostedBy(Users postedBy) {
//		this.postedBy = postedBy;
//	}

	public String getDimension() {
		return dimension;
	}

	public void setDimension(String dimension) {
		this.dimension = dimension;
	}
	
//	public Date getPost_date() {
//		return post_date;
//	}
//
//	public void setPost_date(Date post_date) {
//		this.post_date = post_date;
//	}
//
//	public Date getSold_date() {
//		return sold_date;
//	}
//
//	public void setSold_date(Date sold_date) {
//		this.sold_date = sold_date;
//	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getMedium() {
		return medium;
	}

	public void setMedium(String medium) {
		this.medium = medium;
	}

	@Override
	public String toString() {
		return "ArtCollection [id=" + id + ", art=" + art + ", description=" + description + ", name=" + name
				+ ", dimension=" + dimension + ", price="
				+ price + ", medium=" + medium + ", postedBy=" + "]";
	}
	
}
