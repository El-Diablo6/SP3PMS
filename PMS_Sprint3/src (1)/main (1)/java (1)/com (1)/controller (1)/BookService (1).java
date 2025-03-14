package com.controller;

import com.dao.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

import org.apache.derby.iapi.types.StringDataValue;

import com.model.Booking;
import com.model.User;

/**
 * The BookService class provides methods for managing bookings,
 * checking user details, generating invoices, tracking parcel status,
 * updating delivery details, and viewing booking history.
 * It interacts with the DbOperations class for database operations.
 */
public class BookService {

	Scanner sc = new Scanner(System.in);

	ArrayList<Booking> bookings = new ArrayList<Booking>();

	DbOperations db = new DbOperations();
	private Random random = new Random();

	/**
	 * Books a parcel using the provided booking details and user ID.
	 *
	 * @param b      The booking object containing parcel details.
	 * @param userid The ID of the user making the booking.
	 * @return The booking ID if the booking is successful, or "null" if the
	 *         booking fails.
	 */
	public String book(Booking b, String userid) {

		String bid = "null";

		LocalDateTime paymentTime = LocalDateTime.now();
		String s = paymentTime.toString();
		s = s.substring(0, 16);
		s = s.replace("T", "  ");

		int ranint = random.nextInt(100000001);
		String bookingID = "BKG" + String.format("%09d", ranint);

		b.setUserId(userid);
		b.setPaymentTime(s);
		b.setBookingID(bookingID);
		b.setParcelStatus("Booked");

		boolean n = false;
		try {
			n = db.book(b);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (n) {
			System.out.println("Booking ID is: " + bookingID);
			System.out.println("Booking Sucessful");
			bid = b.getBookingID();

		} else {
			System.out.println("Booking not Sucessful");
		}
		return bid;

	}

	/**
	 * Checks if a user with the given ID exists in the database.
	 *
	 * @param id The ID of the user to check.
	 * @return true if a user with the ID exists, false otherwise.
	 * @throws ClassNotFoundException if the database driver class is not found.
	 * @throws SQLException           if a database access error occurs.**/
	public boolean checkuser(String id) {

		try {
			return db.checkuser(id);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;

	}

	/**
	 * Checks if a user with the given email and phone number exists in the
	 * database.
	 *
	 * @param email The email of the user to check.
	 * @param phn   The phone number of the user to check.
	 * @return true if a user with the email and phone number exists,
	 *         false otherwise.
	 * @throws ClassNotFoundException if the database driver class is not found.**/
	public boolean checkEmailPhn(String email, String phn) {

		try {
			return db.checkEmailPhn(email, phn);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;

	}

	/**
	 * Generates an invoice for a booking with the given ID.
	 *
	 * @param id The ID of the booking for which to generate the invoice.
	 * @return The {@link Booking} object containing the booking details, or
	 *         {@code null} if no booking is found.
	 * @throws ClassNotFoundException if the database driver class is not found.
	 * @throws SQLException           if a database access error occurs.**/
	public Booking generateInvoice(String id) {

		Booking b = null;
		try {
			b = db.getBookingById(id);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;

	}

	/**
	 * Retrieves the tracking status of a parcel using the booking ID.
	 *
	 * @param bookingId The ID of the booking to track.
	 * @return The {@link Booking} object containing the parcel's tracking
	 *         status, or {@code null} if no booking is found.
	 * @throws ClassNotFoundException if the database driver class is not found.
	 * @throws SQLException           if a database access error occurs.**/
	public Booking trackingStatus(String bookingId) {

		Booking b = null;

		try {
			b = db.getBookingById(bookingId);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return b;

	}

	/**
	 * Retrieves a booking using the booking ID.
	 *
	 * @param bookingId the id of the booking.
	 * @return The {@link Booking} object containing the booking,
	 *         or {@code null} if no booking is found.
	 * @throws ClassNotFoundException if the database driver class is not found.
	 * @throws SQLException           if a database access error occurs.**/
	public Booking bookById(String bookingId) {

		Booking b = null;

		try {
			b = db.getBookingById(bookingId);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return b;

	}

	/**
	 * Retrieves the tracking status of a parcel using the booking ID and the user ID.
	 *
	 * @param bookingId The ID of the booking to track.
	 * @param uid       The id of the user
	 * @return The {@link Booking} object containing the parcel's tracking
	 *         status, or {@code null} if no booking is found.
	 * @throws ClassNotFoundException if the database driver class is not found.
	 * @throws SQLException           if a database access error occurs.**/
	public Booking trackingStatus(String bookingId, String uid) {

		Booking b = null;

		try {
			b = db.getBookingById(bookingId, uid);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return b;

	}

	/**
	 * Updates the pickup and drop-off time for a booking.
	 *
	 * @param newPickupTime  The new pickup time.
	 * @param newDropoffTime The new drop-off time.
	 * @param bookingId      The ID of the booking to update.
	 * @return {@code true} if the update is successful, {@code false} otherwise.
	 * @throws ClassNotFoundException if the database driver class is not found.
	 * @throws SQLException           if a database access error occurs.**/
	

	public boolean pickUpandDropUpdate(String newPickupTime, String newDropoffTime, String bookingId) {

		boolean flag = false;

		try {
			flag = db.updateTime(newPickupTime, newDropoffTime, bookingId);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}

	/**
	 * Updates the delivery status of a parcel.
	 *
	 * @param id    The ID of the booking to update.
	 * @param value The new delivery status value.
	 * @return true if the update is successful, false otherwise.
	 * @throws ClassNotFoundException if the database driver class is not found.
	 * @throws SQLException           if a database access error occurs.**/
	 

	public boolean delivaryStatusUpdate(String id, String value) {

		boolean falg = false;

		try {
			falg = db.updateStatus(id, value);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return falg;

	}

	/**
	 * Retrieves the booking history for a user.
	 *
	 * @param userId The ID of the user for whom to retrieve the booking history.
	 * @return An  ArrayList of  Booking objects representing the
	 *         user's booking history, or null if no history is found.
	 * @throws ClassNotFoundException if the database driver class is not found.
	 * @throws SQLException           if a database access error occurs.
	 */
	public ArrayList<Booking> bookingHistory(String userId) {

		// i am here

		System.out.println("========== Booking History ==========");
		ArrayList<Booking> bookings = null;
		try {
			bookings = db.getBookingHistory(userId);

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bookings;

	}

}
