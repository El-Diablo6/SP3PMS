package com.model;



/**
 * Represents a user in the system.
 * Contains user information such as name, email, mobile, address, user ID, password, and role.
 */
public class User {

	
	private String name;
	private String email;
	private String mobile;
	private String address;
	private String userId;
	private String password;
	private String role;

	/**
	 * Constructs a User object with the specified details.
	 *
	 * @param userId   The unique identifier for the user.
	 * @param name     The full name of the user.
	 * @param address  The address of the user.
	 * @param email    The email address of the user.
	 * @param mobile   The mobile phone number of the user.
	 * @param password The password for the user's account.
	 * @param role     The role of the user in the system.
	 */
	public User(String userId, String name, String address, String email, String mobile, String password, String role) {
		super();
		this.name = name;
		this.email = email;
		this.mobile = mobile;
		this.address = address;
		this.userId = userId;

		this.password = password;
		this.role = role;
	}

	/**
	 * Constructs an empty User object.
	 */
	public User() {
		
	}

	public String getName() {
		return name;
	}
	
	/**
	 * Sets the name of the user.
	 *
	 * @param name The full name of the user.
	 */
	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}
	
	/**
	 * Sets the email address of the user.
	 *
	 * @param email The email address of the user.
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}
	
	/**
	 * Sets the mobile phone number of the user.
	 *
	 * @param mobile The mobile phone number of the user.
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}
	
	/**
	 * Sets the address of the user.
	 *
	 * @param address The address of the user.
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	public String getUserId() {
		return userId;
	}
	
	/**
	 * Sets the UserId for the user.
	 *
	 * @param userId The unique identifier for the user.
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}
	
	/**
	 * Sets the password for the user's account.
	 *
	 * @param password The password for the user's account.
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}
	
	/**
	 * Sets the role of the user in the system.
	 *
	 * @param role The role of the user in the system.
	 */
	public void setRole(String role) {
		this.role = role;
	}

}
