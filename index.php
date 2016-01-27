<?php

    // Start the seesion
    session_start();

    // Connect to the databse
	$dbc = new mysqli( 'localhost', 'root', '', 'shopping_cart' );


    // Create a cart if the don't have one already
    if( !isset($_SESSION['cart']) ){
    	$_SESSION['cart'] = [];
    }

    // If clearcart is in the GET array
    if ( isset($_GET['clearcart']) ){
    	// Clear the cart
    	$_SESSION['cart'] = [];

    	// refresh the page
    	header('Location: index.php');
    }

    // Did the user subit a form
     if( isset($_POST['add-to-cart']) ){

     	// Find out the price of the product 
     	$id = $dbc->real_escape_string($_POST['product-id']);

     	// Prepare SQL to find the price of the product
     	$sql = "SELECT price FROM products WHERE id = $id";


		// Run the query
		$result = $dbc->query( $sql );
 		
 		//
		$result = $result->fetch_assoc();
        

     	// Add the item to the cart
    	$_SESSION['cart'][] = [
    		'id'=>$_POST['product-id'],
    		'name'=>$_POST['name'],
    		'description'=>$_POST['description'],
    		'price' => $result['price'],
    	];
    }

	// Include the header
   include 'templates/header.template.php';

?>
	
	<h1>Products</h1>

	<?php

	
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

