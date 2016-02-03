<?php

session_start();

require 'PxPay_Curl.inc.php';
require '../secret.php';

// Creat an instance
$pxpay = new PxPay_Curl( 'https://sec.paymentexpress.com/pxpay/pxaccess.aspx', PXPAY_USER, PXPAY_KEY );

// Convert the response into something we can use
$response = $pxpay->getResponse( $_GET['result'] );

// Was the transaction unsuccessful?
if ( $response->getSuccess() == 0 ) {

	$dbc = new mysqli('localhost', 'root', '', 'shopping_cart');

	// prepare the update SQL
	$orderID = $_SESSION['orderID'];
	$sql = "UPDATE orders SET state = ";

	// Switch based on the response text
	switch( $response->getResponseText() ) {
			case 'CARD EXPIRED':
				$sql .= " 'expired' ";
			break;
	
			case 'DECLINED':
				$sql .= " 'declined' ";
			break;
	
			// Timed out
			case 'DECLINED (U9)':
				$sql .= " 'timeout' ";
			break;
	}
	$sql .= " WHERE id = $orderID";
	$dbc->query( $sql );
	
	// Update the database order to say failed
	echo '<pre>';
	print_r($response);
	// Email the client
	
}