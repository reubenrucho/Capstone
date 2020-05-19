package com.jimbe.app.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import com.jimbe.app.model.Address;

@Entity
@Table(name="Users")
public class Users {

	public Users() {		
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;	
	private String firstName;
	private String lastName;
	private String profession;
	private String description;
	private String email;
	private String password;
	private String website;
	private String skills;
	@Transient
	private String password2;
	private String role;
	private String image;
	private String token;
	
	@OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
	private Address address;
	
	@OneToMany (mappedBy = "postedBy", cascade = CascadeType.ALL)
	private List <ArtCollection> artCollection;


	public List<ArtCollection> getArtCollection() {
		return artCollection;
	}

	public void setArtCollection(List<ArtCollection> artCollection) {
		this.artCollection = artCollection;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public Address getAddress() {
		return address;	
		}

	public void setAddress(Address address) {
		this.address = address;
		}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getSkills() {
		return skills;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Users [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", profession=" + profession
				+ ", description=" + description + ", email=" + email + ", password=" + password + ", website="
				+ website + ", skills=" + skills + ", password2=" + password2 + ", role=" + role + ", image=" + image
				+ ", token=" + token + ", artCollection=" +  "]";
	}
	
}
