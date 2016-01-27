<?php
	// Include the header
   include 'templates/header.template.php';

?>
	
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
			
			// Include the product template
			include 'templates/product.template.php';
		}

		include 'templates/footer.template.php'
	?>

