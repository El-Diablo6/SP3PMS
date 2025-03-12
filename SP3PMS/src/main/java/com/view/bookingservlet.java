package com.view;

import java.io.IOException;

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

import java.io.IOException;

/**
 * The {@code bookingservlet} class is a servlet that handles booking-related
 * operations, such as creating a new booking, generating an invoice, and
 * processing payment.
 * <p>
 * This servlet maps to the URL "/bookingservlet" and supports both GET and POST
 * requests.
 */
@WebServlet("/bookingservlet")
public class bookingservlet extends HttpServlet {
    RequestDispatcher rd = null;
    private static final long serialVersionUID = 1L;

    /**
     * The BookService instance used to handle booking operations.
     */
    BookService bookservice = new BookService();

    /**
     * Default constructor for the {@code bookingservlet} class.
     */
    public bookingservlet() {
        super();
    }

    /**
     * Handles GET requests to the servlet.
     *
     * @param request  the {@link HttpServletRequest} object that contains the
     *                 request the client has made of the servlet
     * @param response the {@link HttpServletResponse} object that contains the
     *                 response the servlet sends to the client
     * @throws ServletException if the request for the GET could not be handled
     * @throws IOException      if an input or output error is detected when the
     *                          servlet handles the GET request
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * Handles POST requests to the servlet. This method handles various actions
     * related to booking operations, including creating new bookings,
     * processing admin bookings, handling payments, cancelling bookings, and
     * generating invoices.
     *
     * @param request  the {@link HttpServletRequest} object that contains the
     *                 request the client has made of the servlet
     * @param response the {@link HttpServletResponse} object that contains the
     *                 response the servlet sends to the client
     * @throws ServletException if the request for the POST could not be handled
     * @throws IOException      if an input or output error is detected when the
     *                          servlet handles the POST request
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);

        HttpSession sess = request.getSession();

        String action = request.getParameter("action");
        /**
         * Handles the "booking" action.
         * This action creates a new booking based on the parameters provided in the request.
         * It retrieves booking details from the request, creates a Booking object, and
         * then uses the BookService to book the parcel.
         * If successful, it generates an invoice and forwards the request to the payment page.
         * Otherwise, it sets an error attribute and forwards the request back to the booking page.
         */
        
        
        
        if (action.equalsIgnoreCase("booking")) {
            String name = request.getParameter("senderName");
            String address = request.getParameter("senderAddress");
            String mobile = request.getParameter("senderContact");
            String recipientName = request.getParameter("receiverName");
            String recipienAddress = request.getParameter("receiverAddress");
            String recipientPin = request.getParameter("receiverPincode");
            String recipientMobile = request.getParameter("receiverContact");
            String parcelWeight = request.getParameter("parcelWeight");
            String parcelContentsDescription = request.getParameter("parcelContents");
            String parcelPackingPreference = request.getParameter("preference");
            String parcelDeliveryType = request.getParameter("deliverySpeed");
            String parcelPickupTime = request.getParameter("pickupTime");
            String parcelDropoffTime = request.getParameter("dropTime");
            String serviceCost = request.getParameter("parcelCost");

            parcelPickupTime = parcelPickupTime.substring(0, 16);
            parcelDropoffTime = parcelDropoffTime.substring(0, 16);
            parcelPickupTime = parcelPickupTime.replace('T', ' ');
            parcelDropoffTime = parcelDropoffTime.replace('T', ' ');

            User u = (User) sess.getAttribute("user");

            String userid = u.getUserId();

            System.out.println(userid);

            Booking b = new Booking(recipientName, recipienAddress, recipientPin, recipientMobile, parcelWeight,
                    parcelContentsDescription, parcelDeliveryType, parcelPackingPreference, parcelPickupTime,
                    parcelDropoffTime, serviceCost, name, address, mobile);
            
            sess.setAttribute("bookdetails", b);
            sess.setAttribute("userid", userid);
            rd = request.getRequestDispatcher("paymentpage.jsp");
            rd.forward(request, response);

//            String bid = bookservice.book(b, userid);
//
//            if (bid != null) {
//                Booking booking = bookservice.generateInvoice(bid);
//
//                System.out.println(bid);
//                System.out.println("parcel booked ");
//                if (booking == null)
//                    System.out.println("fail");
//                else {
//                    System.out.println("pass");
//                }
//
//                sess.setAttribute("booked", booking);
//                rd = request.getRequestDispatcher("paymentpage.jsp");
//            } else {
//                System.out.println("not booked");
//                request.setAttribute("error", "failed");
//                rd = request.getRequestDispatcher("booking(modified).jsp");
//            }
//
//            rd.forward(request, response);

        }

        /**
         * Handles the "adminbooking" action.
         * This action is similar to "booking" but allows an administrator to create a booking on behalf of a user.
         * It retrieves booking details and the user ID from the request, checks if the user exists,
         * and then uses the BookService to book the parcel.
         * If successful, it generates an invoice and forwards the request to the payment page.
         * Otherwise, it sets an error attribute and forwards the request back to the admin booking page.
         */
        if (action.equalsIgnoreCase("adminbooking")) {
            String userid = request.getParameter("userid");
            String address = request.getParameter("senderAddress");
            String mobile = request.getParameter("senderContact");
            String recipientName = request.getParameter("receiverName");
            String recipienAddress = request.getParameter("receiverAddress");
            String recipientPin = request.getParameter("receiverPincode");
            String recipientMobile = request.getParameter("receiverContact");
            String parcelWeight = request.getParameter("parcelWeight");
            String parcelContentsDescription = request.getParameter("parcelContents");
            String parcelPackingPreference = request.getParameter("preference");
            String parcelDeliveryType = request.getParameter("deliverySpeed");
            String parcelPickupTime = request.getParameter("pickupTime");
            String parcelDropoffTime = request.getParameter("dropTime");
            String serviceCost = request.getParameter("parcelCost");

            parcelPickupTime = parcelPickupTime.substring(0, 16);
            parcelDropoffTime = parcelDropoffTime.substring(0, 16);
            parcelPickupTime = parcelPickupTime.replace('T', ' ');
            parcelDropoffTime = parcelDropoffTime.replace('T', ' ');

            User u = (User) sess.getAttribute("user");
            

            System.out.println(userid);

            Booking b = new Booking(recipientName, recipienAddress, recipientPin, recipientMobile, parcelWeight,
                    parcelContentsDescription, parcelDeliveryType, parcelPackingPreference, parcelPickupTime,
                    parcelDropoffTime, serviceCost, userid, address, mobile);
            
            
            boolean flag = bookservice.checkuser(userid);
            
            
            
            
            String bid = null;
            
            if (flag) {

                sess.setAttribute("bookdetails", b);
                sess.setAttribute("userid", userid);
                rd = request.getRequestDispatcher("paymentpage.jsp");
                rd.forward(request, response);
                
            } else {
                request.setAttribute("error", "user not found");
                rd = request.getRequestDispatcher("bookingadmin.jsp");
                rd.forward(request, response);
            }
            
            

            

//            String bid = null;
//            if (flag) {
//            	
//                bid = bookservice.book(b, userid);
//            } else {
//                request.setAttribute("error", "user not found");
//                rd = request.getRequestDispatcher("bookingadmin.jsp");
//            }
//
//            if (bid != null) {
//                Booking booking = bookservice.generateInvoice(bid);
//
//                System.out.println(bid);
//                System.out.println("parcel booked ");
//                if (booking == null)
//                    System.out.println("fail");
//                else {
//                    System.out.println("pass");
//                }
//
//                sess.setAttribute("booked", booking);
//                
//            } else {
//                System.out.println("not booked");
//                request.setAttribute("error", "failed");
//                rd = request.getRequestDispatcher("bookingadmin.jsp");
//            }
//
//            rd.forward(request, response);

        }

        /**
         * Handles the "pay" action.
         * This action forwards the request to the invoice page.
         */
        if (action.equalsIgnoreCase("pay")) {
        	
        	Booking b= (Booking) sess.getAttribute("bookdetails");
        	String userid=(String) sess.getAttribute("userid");
        	sess.removeAttribute("bookdetails");
        	String bid = bookservice.book(b, userid);
        	System.out.println("i am in pay for admin");
             if (bid != null) {
                 Booking booking = bookservice.generateInvoice(bid);

                 System.out.println(bid);
                 System.out.println("parcel booked ");
                 if (booking == null)
                     System.out.println("fail");
                 else {
                     System.out.println("pass");
                 }

                 sess.setAttribute("booked", booking);
                
             } else {
                 System.out.println("not booked");
                 request.setAttribute("error", "failed");
                 rd = request.getRequestDispatcher("booking(modified).jsp");
             }
        	
             
            rd = request.getRequestDispatcher("invoice.jsp");

            rd.forward(request, response);
        }

        

        /**
         * Handles the "generateinvoice" action.
         * This action retrieves a booking ID from the request,
         * generates an invoice for the booking using the BookService,
         * and forwards the request to the invoice page if successful.
         * If the booking is not found, it sets an error attribute and
         * forwards the request to the generate invoice page.
         */
        if (action.equalsIgnoreCase("generateinvoice")) {
            RequestDispatcher rd = null;
            String bookingid = request.getParameter("bookingId");
            Booking booking = bookservice.generateInvoice(bookingid);
            if (booking == null) {
                request.setAttribute("error", "failure");
                rd = request.getRequestDispatcher("generateinvoice.jsp");
                System.out.println("booking not found");
            } else {
                request.setAttribute("booked", booking);
                rd = request.getRequestDispatcher("invoice.jsp");
                System.out.println("booking  found");
            }
            rd.forward(request, response);

        }

    }

}
