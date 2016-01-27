<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="uft-8">
	<title>Shopping Cart</title>
</head>
<body>

<?php
	
	// Show the contents of the cart
    echo '<pre>'; 
	print_r( $_SESSION['cart'] );
	echo '</pre>';
?>
