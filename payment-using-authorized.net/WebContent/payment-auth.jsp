<%@ page import="net.authorize.api.contract.v1.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Authorize.Net Payment</title>
</head>
<body>
    <h2>Payment Form</h2>
    <form method="post" action="processPayment.jsp">
        <label for="amount">Amount:</label>
        <input type="text" id="amount" name="amount" required><br>
        <label for="cardNumber">Card Number:</label>
        <input type="text" id="cardNumber" name="cardNumber" required><br>
        <label for="expirationDate">Expiration Date (MMYY):</label>
        <input type="text" id="expirationDate" name="expirationDate" required><br>
        <label for="cvv">CVV:</label>
        <input type="text" id="cvv" name="cvv" required><br>
        <input type="submit" value="Pay">
    </form>
</body>
</html>
