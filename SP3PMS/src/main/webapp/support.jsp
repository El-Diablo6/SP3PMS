<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parcel Management - Customer Support</title>
    
      <link rel="stylesheet" href="./CSS/support.css">
   
</head>

<body>
  <jsp:include page="header.jsp"></jsp:include>

    <main>
        <section class="support-page">
            <h2>Customer Support</h2>
            <div class="contact-details">
                <div class="detail-item">
                    <span class="detail-label">Contact Number:</span>
                    <span class="detail-value">9878987894</span>
                </div>
                <div class="detail-item">
                    <span class="detail-label">Email ID:</span>
                    <span class="detail-value">support@parcelmanagement.com</span>
                </div>
                <div class="detail-item">
                    <span class="detail-label">Address:</span>
                    <span class="detail-value">Gopalan Street, 12/2/12 Bangalore</span>
                </div>
            </div>
        </section>
    </main>
 <jsp:include page="footer.jsp"></jsp:include>

   
    <script src="./JavaScript Files/support.js"></script>

</body>

</html>