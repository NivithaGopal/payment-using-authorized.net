<%@ page import="net.authorize.api.controller.*" %>
<%@ page import="net.authorize.api.contract.v1.*" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String apiLoginId = "YOUR_API_LOGIN_ID";
    String transactionKey = "YOUR_TRANSACTION_KEY";

    // Get payment details from form
    String amount = request.getParameter("amount");
    String cardNumber = request.getParameter("cardNumber");
    String expirationDate = request.getParameter("expirationDate");
    String cvv = request.getParameter("cvv");

    // Set up the API request
    TransactionRequest requestTransaction = new TransactionRequest();
    requestTransaction.setTransactionType(TransactionTypeEnum.AUTH_CAPTURE.value());
    
    // Set up the amount
    requestTransaction.setAmount(new BigDecimal(amount));

    // Set up the payment data
    PaymentType paymentType = new PaymentType();
    CardDataType cardData = new CardDataType();
    cardData.setCardNumber(cardNumber);
    cardData.setExpirationDate(expirationDate);
    cardData.setCardCode(cvv);
    
    paymentType.setCreditCard(cardData);
    requestTransaction.setPayment(paymentType);

    // Create controller and send request
    CreateTransactionController controller = new CreateTransactionController(requestTransaction);
    controller.setApiLoginId(apiLoginId);
    controller.setTransactionKey(transactionKey);
    
    try {
        controller.execute();
        CreateTransactionResponse response = controller.getApiResponse();

        if (response != null && response.getMessages().getResultCode() == MessageTypeEnum.OK) {
            out.println("<h2>Transaction Successful!</h2>");
            out.println("<p>Transaction ID: " + response.getTransactionResponse().getTransId() + "</p>");
        } else {
            out.println("<h2>Transaction Failed!</h2>");
            out.println("<p>Error: " + response.getMessages().getMessage(0).getText() + "</p>");
        }
    } catch (Exception e) {
        out.println("<h2>Error processing transaction</h2>");
        out.println("<p>" + e.getMessage() + "</p>");
    }
%>
