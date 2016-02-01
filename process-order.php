<?php

session_start();
// echo '<pre>';
// print_r($_POST);

// Calculate in the total order cost
$grandTotal = 0;

foreach ($_SESSION['cart'] as $product) {

	$grandTotal += $product['quantity'] * $product['price'];
}

// Prepre the order in a "pending" state

// Include the Pxpay library
require 'PxPay_Curl.inc.php';
