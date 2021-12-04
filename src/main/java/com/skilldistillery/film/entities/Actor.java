package com.skilldistillery.film.entities;

public class Actor {
	private int id;
	private String firstName;
	private String lastName;
	
	public Actor(int id, String firstName, String lastName) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
	}

	
	/* ------------------------------------------------
	    get/set Actor ID
	------------------------------------------------ */
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	/* ------------------------------------------------
	    get/set First Name
	------------------------------------------------ */
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	
	/* ------------------------------------------------
	    get/set Last Name
	------------------------------------------------ */
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	

	
	/* ------------------------------------------------
	   	Misc
	------------------------------------------------ */
	// hashcode
	// equals
	
	@Override
	public String toString() {
		return String.format("ID: %-7s \nName: %s %s",id,firstName,lastName);
	}
	
}
