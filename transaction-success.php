<?php

session_start();

// Get the result from the address bar
$result = $_GET['result'];

require 'PxPay_Curl.inc.php';
require '../secret.php';

// Create instance
$pxpay = new PxPay_Curl( 'https://sec.paymentexpress.com/pxpay/pxaccess.aspx', PXPAY_USER, PXPAY_KEY );

// Convert the response into something we can use
$response = $pxpay->getResponse ( $_GET['result'] );

// Was the transation successful?
if( $response->getSuccess() == 1){

	// Update the database order to say paid
	$dbc = new mysqli('localhost','root','','shopping_cart');
    
   // Extract the order ID from the session
    $orderID = $_SESSION['orderID'];
    
    $dbc->query("UPDATE orders SET state = 'approved' WHERE id = $orderID");
    
	// Email the client

	// E-mail the website owner

	// Clear the cart

	$_SESSION['cart'] = [];
}
