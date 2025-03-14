package com.view;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.BookService;
import com.model.Booking;
import com.model.User;

/**
 * Servlet implementation class trackingservlet. Handles tracking, searching,
 * and retrieving booking history.
 */
@WebServlet("/trackingservlet")
public class trackingservlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public trackingservlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		HttpSession sess = request.getSession();
		BookService bookservice = new BookService();

		String action = request.getParameter("action");
		RequestDispatcher rd = null;

		/**
		 * Handles booking history retrieval.
		 * 
		 * - Fetches the user's booking history. - If no bookings are found, displays an
		 * error message. - Otherwise, forwards the request to the history page.
		 */
		if (action.equalsIgnoreCase("history")) {
			User u = (User) sess.getAttribute("user");
			String id = null;
			
			if (u.getRole().equalsIgnoreCase("customer")) {
				id = u.getUserId();
			} else {
				id = request.getParameter("UserId");
			}

			ArrayList<Booking> bookings = bookservice.bookingHistory(id);
		

			System.out.println("i am in histry grt");
			System.out.println(bookings.size());

			if (bookings.size() == 0) {
				request.setAttribute("error", "failure");
			   
				rd = request.getRequestDispatcher("historydata.jsp");
			} else {
				
				Collections.reverse(bookings);
				request.setAttribute("bookings", bookings);
				rd = request.getRequestDispatcher("historydata.jsp");

			}

			rd.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

		HttpSession sess = request.getSession();
		BookService bookservice = new BookService();

		String action = request.getParameter("action");
		RequestDispatcher rd = null;

		/**
		 * Handles searching for a specific parcel by booking ID.
		 * 
		 * - If the booking is found, forwards to the invoice page. - Otherwise, sets an
		 * error message and redirects to the invoice page.
		 */
		if (action.equalsIgnoreCase("searchparcel")) {

			String bookingId = request.getParameter("bookingId");

			Booking b = null;

			b = bookservice.trackingStatus(bookingId);

			if (b != null) {
				System.out.println(" book found ");
				request.setAttribute("booked", b);
				rd = request.getRequestDispatcher("invoice.jsp");
			} else {
				System.out.println(" book not found ");
				request.setAttribute("error", "book not found");
				rd = request.getRequestDispatcher("invoice.jsp");
			}

		}

		/**
		 * Handles parcel tracking.
		 * 
		 * - Fetches tracking status of a parcel for a customer or admin. - If found,
		 * forwards to the tracking page. - Otherwise, sets an error message and
		 * redirects to the tracking page.
		 */
		if (action.equalsIgnoreCase("tracking")) {

			String bookingId = request.getParameter("bookingId");

			HttpSession sess1 = request.getSession();
			User u = (User) sess1.getAttribute("user");
			Booking b = null;

			if (u.getRole().equalsIgnoreCase("customer")) {
				b = bookservice.trackingStatus(bookingId, u.getUserId());
			} else {
				b = bookservice.trackingStatus(bookingId);
			}

			if (b != null) {
				System.out.println(" book found for tracking");
				request.setAttribute("booked", b);
				rd = request.getRequestDispatcher("trackeddata.jsp");
			} else {
				System.out.println(" book not found tracking");
				request.setAttribute("error", "book not found");
				sess.setAttribute("booked", null);
				rd = request.getRequestDispatcher("custtracking.jsp");
			}

		}

		/**
		 * Handles invoice generation for a booking.
		 * 
		 * - Fetches booking details for an invoice. - If found, stores the booking in
		 * session and forwards to the invoice page. - Otherwise, removes the session
		 * attribute and sets an error message.
		 */
		if (action.equalsIgnoreCase("invoice")) {

			String bookingId = request.getParameter("bookingId");

			HttpSession sess1 = request.getSession();
			User u = (User) sess1.getAttribute("user");
			Booking b = null;

			if (u.getRole().equalsIgnoreCase("customer")) {
				b = bookservice.trackingStatus(bookingId, u.getUserId());
			} else {
				b = bookservice.trackingStatus(bookingId);
			}

			if (b != null) {
				System.out.println(" book found for invoice ");
				HttpSession session = request.getSession();
				session.setAttribute("booked", b);
				rd = request.getRequestDispatcher("invoice.jsp");
			} else {
				System.out.println(" book not found  for invoice");
				sess.removeAttribute("booked");
				request.setAttribute("error", "failure");
				rd = request.getRequestDispatcher("invoice1.jsp");
			}

		}

		
		rd.forward(request, response);

	}

}
