<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="uft-8">
	<title>Shopping Cart</title>
</head>
<body>
	
	<h1>Products</h1>

	<?php

		// Connect to the databse
		$dbc = new mysqli( 'localhost', 'root', '', 'shopping_cart' );

		// Get all products from the database. If select all the data form the database, could use "SELECT *"
		$sql = "SELECT id, name, description, price, stock FROM products";

		// Run the query
		$result = $dbc->query( $sql );

		// Lopp over the reslut
		while( $row = $result->fetch_assoc() ){
			// Present the data
			echo '<ul>';
			echo '<li>ID: '.$row['id'].'</li>';
			echo '<li>Name: '.$row['name'].'</li>';
			echo '<li>Description: '.$row['description'].'</li>';
			echo '<li>Price: '.$row['price'].'</li>';
			echo '<li>Stock: '.$row['stock'].'</li>';
			echo '</ul>'; 
		}
	?>

</body>
</html>