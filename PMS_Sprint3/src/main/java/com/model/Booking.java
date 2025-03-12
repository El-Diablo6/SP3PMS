package com.model;

/**
 * The Booking class represents a booking for a parcel delivery service.
 * It contains information about the recipient, the parcel, and the service.
 */
public class Booking {

	private String recipientName;
	private String recipienAddress;
	private String recipientPin;
	private String recipientMobile;
	private String parcelWeight;
	private String parcelContentsDescription;
	private String parcelDeliveryType;
	private String parcelPackingPreference;
	private String parcelPickupTime;
	private String parcelDropoffTime;
	private String parcelStatus;
	private String serviceCost;
	private String paymentTime;
	private String bookingID;
	private String name;
	private String address;
	private String userId;

	/**
	 * Constructor for creating a Booking object.
	 *
	 * @param recipienAddress The address of the recipient.
	 * @param parcelStatus    The current status of the parcel.
	 * @param serviceCost     The cost of the delivery service.
	 * @param paymentTime     The time when the payment was made.
	 * @param bookingID       The unique identifier for the booking.
	 * @param userId          The user ID associated with the booking.
	 * @param recipientName   The name of the recipient.
	 */
	public Booking(String recipienAddress, String parcelStatus, String serviceCost, String paymentTime,
			String bookingID, String userId, String recipientName) {
		super();
		this.recipienAddress = recipienAddress; // Set the recipient's address.
		this.parcelStatus = parcelStatus; // Set the parcel's current status.
		this.serviceCost = serviceCost; // Set the service cost.
		this.paymentTime = paymentTime; // Set the payment time.
		this.bookingID = bookingID; // Set the booking ID.
		this.userId = userId; // Set the user ID.
		this.recipientName = recipientName; // Set the recipient's name.
	}

	
	private String mobile;
	
	private String role;

	/**
	 * Constructor for creating a Booking object.
	 *
	 * @param recipientName           The name of the recipient.
	 * @param recipienAddress         The address of the recipient.
	 * @param recipientPin            The PIN code of the recipient's address.
	 * @param recipientMobile         The mobile number of the recipient.
	 * @param parcelWeight            The weight of the parcel.
	 * @param parcelContentsDescription The description of the parcel's contents.
	 * @param parcelDeliveryType      The type of delivery for the parcel.
	 * @param parcelPackingPreference The packing preference for the parcel.
	 * @param parcelPickupTime        The preferred pickup time for the parcel.
	 * @param parcelDropoffTime       The preferred drop-off time for the parcel.
	 * @param serviceCost             The cost of the delivery service.
	 * @param name                    The name associated with the booking.
	 * @param address                 The address associated with the booking.
	 * @param mobile                  The mobile number associated with the booking.
	 */
	public Booking(String recipientName, String recipienAddress, String recipientPin, String recipientMobile,
			String parcelWeight, String parcelContentsDescription, String parcelDeliveryType,
			String parcelPackingPreference, String parcelPickupTime, String parcelDropoffTime, String serviceCost,
			String name, String address, String mobile) {
		super();
		this.recipientName = recipientName;
		this.recipienAddress = recipienAddress;
		this.recipientPin = recipientPin;
		this.recipientMobile = recipientMobile;
		this.parcelWeight = parcelWeight;
		this.parcelContentsDescription = parcelContentsDescription;
		this.parcelDeliveryType = parcelDeliveryType;
		this.parcelPackingPreference = parcelPackingPreference;
		this.parcelPickupTime = parcelPickupTime;
		this.parcelDropoffTime = parcelDropoffTime;
		this.serviceCost = serviceCost;
		this.name = name;
		this.address = address;
		this.mobile = mobile;
	}

	/**
	 * Constructor for creating a Booking object.
	 *
	 * @param recipientName           The name of the recipient.
	 * @param recipienAddress         The address of the recipient.
	 * @param recipientPin            The PIN code of the recipient's address.
	 * @param recipientMobile         The mobile number of the recipient.
	 * @param parcelWeight            The weight of the parcel.
	 * @param parcelContentsDescription The description of the parcel's contents.
	 * @param parcelDeliveryType      The type of delivery for the parcel.
	 * @param parcelPackingPreference The packing preference for the parcel.
	 * @param parcelPickupTime        The preferred pickup time for the parcel.
	 * @param parcelDropoffTime       The preferred drop-off time for the parcel.
	 * @param parcelStatus            The current status of the parcel.
	 * @param serviceCost             The cost of the delivery service.
	 * @param paymentTime             The time when the payment was made.
	 * @param bookingID               The unique identifier for the booking.
	 * @param name                    The name associated with the booking.
	 * @param address                 The address associated with the booking.
	 * @param userId                  The user ID associated with the booking.
	 * @param mobile                  The mobile number associated with the booking.
	 * @param role                    The role associated with the booking.
	 */

	public Booking(String recipientName, String recipienAddress, String recipientPin, String recipientMobile,
			String parcelWeight, String parcelContentsDescription, String parcelDeliveryType,
			String parcelPackingPreference, String parcelPickupTime, String parcelDropoffTime, String parcelStatus,
			String serviceCost, String paymentTime, String bookingID, String name, String address, String userId,
			String mobile, String role) {
		super();
		this.recipientName = recipientName;
		this.recipienAddress = recipienAddress;
		this.recipientPin = recipientPin;
		this.recipientMobile = recipientMobile;
		this.parcelWeight = parcelWeight;
		this.parcelContentsDescription = parcelContentsDescription;
		this.parcelDeliveryType = parcelDeliveryType;
		this.parcelPackingPreference = parcelPackingPreference;
		this.parcelPickupTime = parcelPickupTime;
		this.parcelDropoffTime = parcelDropoffTime;
		this.parcelStatus = parcelStatus;
		this.serviceCost = serviceCost;
		this.paymentTime = paymentTime;
		this.bookingID = bookingID;
		this.name = name;
		this.address = address;
		this.userId = userId;
		this.mobile = mobile;
		this.role = role;
	}

	/**
	 * Gets the name of the recipient.
	 *
	 * @return The name of the recipient.
	 */
	public String getRecipientName() {
		return recipientName;
	}

	/**
	 * Sets the name of the recipient.
	 *
	 * @param recipientName The name of the recipient.
	 */
	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}

	/**
	 * Gets the address of the recipient.
	 *
	 * @return The address of the recipient.
	 */
	public String getRecipienAddress() {
		return recipienAddress;
	}

	/**
	 * Sets the address of the recipient.
	 *
	 * @param recipienAddress The address of the recipient.
	 */
	public void setRecipienAddress(String recipienAddress) {
		this.recipienAddress = recipienAddress;
	}

	/**
	 * Gets the PIN code of the recipient's address.
	 *
	 * @return The PIN code of the recipient's address.
	 */
	public String getRecipientPin() {
		return recipientPin;
	}

	/**
	 * Sets the PIN code of the recipient's address.
	 *
	 * @param recipientPin The PIN code of the recipient's address.
	 */
	public void setRecipientPin(String recipientPin) {
		this.recipientPin = recipientPin;
	}

	/**
	 * Gets the mobile number of the recipient.
	 *
	 * @return The mobile number of the recipient.
	 */
	public String getRecipientMobile() {
		return recipientMobile;
	}

	/**
	 * Sets the mobile number of the recipient.
	 *
	 * @param recipientMobile The mobile number of the recipient.
	 */
	public void setRecipientMobile(String recipientMobile) {
		this.recipientMobile = recipientMobile;
	}

	/**
	 * Gets the weight of the parcel.
	 *
	 * @return The weight of the parcel.
	 */
	public String getParcelWeight() {
		return parcelWeight;
	}

	/**
	 * Sets the weight of the parcel.
	 *
	 * @param parcelWeight The weight of the parcel.
	 */
	public void setParcelWeight(String parcelWeight) {
		this.parcelWeight = parcelWeight;
	}

	/**
	 * Gets the description of the contents of the parcel.
	 *
	 * @return The description of the contents of the parcel.
	 */
	public String getParcelContentsDescription() {
		return parcelContentsDescription;
	}

	/**
	 * Sets the description of the contents of the parcel.
	 *
	 * @param parcelContentsDescription The description of the contents of the parcel.
	 */
	public void setParcelContentsDescription(String parcelContentsDescription) {
		this.parcelContentsDescription = parcelContentsDescription;
	}

	/**
	 * Gets the type of delivery for the parcel.
	 *
	 * @return The type of delivery for the parcel.
	 */
	public String getParcelDeliveryType() {
		return parcelDeliveryType;
	}

	/**
	 * Sets the type of delivery for the parcel.
	 *
	 * @param parcelDeliveryType The type of delivery for the parcel.
	 */
	public void setParcelDeliveryType(String parcelDeliveryType) {
		this.parcelDeliveryType = parcelDeliveryType;
	}

	/**
	 * Gets the packing preference for the parcel.
	 *
	 * @return The packing preference for the parcel.
	 */
	public String getParcelPackingPreference() {
		return parcelPackingPreference;
	}

	/**
	 * Sets the packing preference for the parcel.
	 *
	 * @param parcelPackingPreference The packing preference for the parcel.
	 */
	public void setParcelPackingPreference(String parcelPackingPreference) {
		this.parcelPackingPreference = parcelPackingPreference;
	}

	/**
	 * Gets the preferred pickup time for the parcel.
	 *
	 * @return The preferred pickup time for the parcel.
	 */
	public String getParcelPickupTime() {
		return parcelPickupTime;
	}

	/**
	 * Sets the preferred pickup time for the parcel.
	 *
	 * @param parcelPickupTime The preferred pickup time for the parcel.
	 */
	public void setParcelPickupTime(String parcelPickupTime) {
		this.parcelPickupTime = parcelPickupTime;
	}

	/**
	 * Gets the preferred drop-off time for the parcel.
	 *
	 * @return The preferred drop-off time for the parcel.
	 */
	public String getParcelDropoffTime() {
		return parcelDropoffTime;
	}

	/**
	 * Sets the preferred drop-off time for the parcel.
	 *
	 * @param parcelDropoffTime The preferred drop-off time for the parcel.
	 */
	public void setParcelDropoffTime(String parcelDropoffTime) {
		this.parcelDropoffTime = parcelDropoffTime;
	}

	/**
	 * Gets the current status of the parcel.
	 *
	 * @return The current status of the parcel.
	 */
	public String getParcelStatus() {
		return parcelStatus;
	}

	/**
	 * Sets the current status of the parcel.
	 *
	 * @param parcelStatus The current status of the parcel.
	 */
	public void setParcelStatus(String parcelStatus) {
		this.parcelStatus = parcelStatus;
	}

	/**
	 * Gets the cost of the delivery service.
	 *
	 * @return The cost of the delivery service.
	 */
	public String getServiceCost() {
		return serviceCost;
	}

	/**
	 * Sets the cost of the delivery service.
	 *
	 * @param serviceCost The cost of the delivery service.
	 */
	public void setServiceCost(String serviceCost) {
		this.serviceCost = serviceCost;
	}

	/**
	 * Gets the time when the payment was made.
	 *
	 * @return The time when the payment was made.
	 */
	public String getPaymentTime() {
		return paymentTime;
	}

	/**
	 * Sets the time when the payment was made.
	 *
	 * @param paymentTime The time when the payment was made.
	 */
	public void setPaymentTime(String paymentTime) {
		this.paymentTime = paymentTime;
	}

	/**
	 * Gets the unique identifier for the booking.
	 *
	 * @return The unique identifier for the booking.
	 */
	public String getBookingID() {
		return bookingID;
	}

	/**
	 * Sets the unique identifier for the booking.
	 *
	 * @param bookingID The unique identifier for the booking.
	 */
	public void setBookingID(String bookingID) {
		this.bookingID = bookingID;
	}

	/**
	 * Gets the name associated with the booking.
	 *
	 * @return The name associated with the booking.
	 */
	public String getName() {
		return name;
	}

	/**
	 * Sets the name associated with the booking.
	 *
	 * @param name The name associated with the booking.
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * Gets the address associated with the booking.
	 *
	 * @return The address associated with the booking.
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * Sets the address associated with the booking.
	 *
	 * @param address The address associated with the booking.
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * Gets the user ID associated with the booking.
	 *
	 * @return The user ID associated with the booking.
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * Sets the user ID associated with the booking.
	 *
	 * @param userId The user ID associated with the booking.
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}

	/**
	 * Gets the mobile number associated with the booking.
	 *
	 * @return The mobile number associated with the booking.
	 */
	public String getMobile() {
		return mobile;
	}

	/**
	 * Sets the mobile number associated with the booking.
	 *
	 * @param mobile The mobile number associated with the booking.
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	/**
	 * Gets the role associated with the booking.
	 *
	 * @return The role associated with the booking.
	 */
	public String getRole() {
		return role;
	}

	/**
	 * Sets the role associated with the booking.
	 *
	 * @param role The role associated with the booking.
	 */
	public void setRole(String role) {
		this.role = role;
	}

}
