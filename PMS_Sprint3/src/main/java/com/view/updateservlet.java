package com.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DbOperations;
import com.model.Booking;

/**
 * Servlet implementation class updateservlet Handles various update actions
 * related to delivery status and pickup scheduling.
 */
@WebServlet("/updateservlet")
public class updateservlet extends HttpServlet {
	RequestDispatcher rd = null;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public updateservlet() {
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

		RequestDispatcher rd1 = null;
		String action = request.getParameter("action");

		/**
		 * Updates delivery status in the database. Redirects to admin homepage upon
		 * success or failure.
		 */
		if (action.equalsIgnoreCase("deliveryupdate1")) {
			System.out.println("delivaryupdate1");
			String bookingId = request.getParameter("bookingID");
			String status = request.getParameter("status");

			DbOperations db = new DbOperations();

			boolean flag = false;
			try {
				flag = db.updateStatus(bookingId, status);

			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if (flag) {
				System.out.print("update success");

				rd1 = request.getRequestDispatcher("adminhomepage.jsp");

			} else {
				System.out.print("not updatde");
				request.setAttribute("error", "failure");
				rd1 = request.getRequestDispatcher("adminhomepage.jsp");
			}
			rd1.forward(request, response);
		}

		/**
		 * Retrieves booking details for delivery update. Redirects to delivery data
		 * page if found, otherwise to delivery update page.
		 */

		if (action.equalsIgnoreCase("deliveryupdate")) {
			System.out.println("delivaryupdate");

			String bookingId = request.getParameter("bookingId");

			DbOperations db = new DbOperations();

			Booking booking = null;
			try {
				booking = db.getBookingById(bookingId);

			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher rd = null;

			if (booking != null) {
				System.out.print("updatde");
				request.setAttribute("booked", booking);
				rd = request.getRequestDispatcher("deliverydata.jsp");

			} else {
				System.out.print("not updatde");
				request.setAttribute("error", "failure");
				rd = request.getRequestDispatcher("deliveryupdate.jsp");

			}
			rd.forward(request, response);
		}

		// ---------------------- pickup ------------------------------------

		/**
		 * Retrieves booking details for pickup time update. Redirects to pickup data
		 * page if found, otherwise to pickup scheduling page.
		 */

		if (action.equalsIgnoreCase("timeupdate")) {

			String bookingId = request.getParameter("bookingId");

			DbOperations db = new DbOperations();

			Booking booking = null;
			try {
				booking = db.getBookingById(bookingId);

			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if (booking != null) {

				request.setAttribute("booked", booking);
				rd = request.getRequestDispatcher("pickupdata.jsp");

			} else {
				request.setAttribute("error", "failure");
				rd = request.getRequestDispatcher("pickupscheduling.jsp");

			}
			rd.forward(request, response);
		}

		/**
		 * Updates pickup and drop-off time in the database. Redirects to admin homepage
		 * upon success or failure.
		 */
		if (action.equalsIgnoreCase("timeupdate1")) {

			String bookingId = request.getParameter("bookingId");
			String pickupTime = request.getParameter("pickupTime");
			String dropoffTime = request.getParameter("dropoffTime");

			DbOperations db = new DbOperations();

			boolean flag = false;
			try {
				flag = db.updateTime(pickupTime, dropoffTime, bookingId);

			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if (flag) {
				System.out.print("updated pickup");

				rd = request.getRequestDispatcher("adminhomepage.jsp");

			} else {
				System.out.print("not updatde pickup");
				request.setAttribute("error", "failure");
				rd = request.getRequestDispatcher("adminhomepage.jsp");
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
	}

}
