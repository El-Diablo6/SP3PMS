package com.test;


import org.junit.Test;

import com.controller.BookService;
import com.controller.RegistrationLogin;
import com.model.Booking;
import com.model.User;

import static org.junit.Assert.*;
public class JUnitTesting {
	RegistrationLogin r=new RegistrationLogin();
	BookService service= new BookService();
	Booking b = null;
	
//	@Test
//	public void Userregistraion() {
//		User user =r.registraion("rick7845", "Rick", "Whitefiedl, Bangalore","rick@gmail.com" , "9865986554", "Abcd@123");
//	
//		assertNotNull(user);
//	}
	
	
//	@Test
//	public void UserExists() {
//		User user = r.login("rick7845", "Abcd@123");
//		assertNotNull(user);
//	}

//	@Test
//	public void bookParcel() {
//		b = new Booking("Richard", "Chikpete, Tumkur", "568956", "9565785645", "256",
//				"Books", "Standard", "Waterproof", "12/02/2024 12:30",
//				"11/03/2024 16:45", "560", "Rick", "Whitefield, Bangalore", "9946541223");
//		String bid = service.book(b, "rick7845");
//		assertNotNull(bid);
//	}
	
//	@Test
//	public void parcelExists() {
//		b = service.bookById("BKG039830824");
//		assertNotNull(b);
//	}
	
//	@Test
//	public void bookingHistory() {
//		ArrayList<Booking> book = service.bookingHistory("rick7445");
//		assertEquals(false,book.isEmpty());
//	}
	
//	@Test
//	public void updateDeliveryStatus() {
//		boolean flag = service.delivaryStatusUpdate("BKG039830825", "Delivered");
//		assertTrue(flag);
//	}
	
//	@Test
//	public void updateTime() {
//		boolean flag = service.pickUpandDropUpdate("14/05/2024 14:15", "16/08/2024 20:10", "BKG039830834");
//		assertTrue(flag);
//	}
	
}