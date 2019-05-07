package com.oracle.web.bean;

public class Monster2 extends Monster {

 
	private School school;
 

	public Monster2() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Monster2(School school) {
		super();
		this.school = school;
	}


	public School getSchool() {
		return school;
	}


	public void setSchool(School school) {
		this.school = school;
	}


	@Override
	public String toString() {
		return "Monster2 [school=" + school + "]";
	}

	 
	
}
