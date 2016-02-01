<h2>Please fill out this form</h2>

<form action="process-order.php" method="post">
	
	<div>
		<lable for="full-name">Full Name: </lable>
		<input type="text" id="full-name" name="full-name" placeholder="Bruce Wayne">
	</div>

	<select id="cities" name="cities">
       <option value="">Please select a city...</option>
     	<?php

     		// Connect to database
 				$dbc = new mysqli('localhost', 'root','','cities_and_suburbs');

 			// Get all the cities
 				$sql = "SELECT cityID, cityName FROM cities";

 			// Run the query and capture the results
 			   $result = $dbc->query($sql);	

 			// Loop over the result and create an option element for each. fectch_assoc will grab the first record of the database
 			    while( $city = $result->fetch_assoc() ) {
            echo '<option value="'.$city['cityID'].'">'.$city['cityName'].'</option>';
        }
 		?>
     </select>

     <select id="suburbs" name="suburbs"></select>

     <div>
     	<label for="address">Address:</label>
     	<textarea name="address" id="address" cols="30" rows="10" placeholder="5 Hamilton Streset"></textarea>
     </div>

     <div>
     	<label for="phone">Phone Number:</label>
     	<input type="tel" name="phone" id="phone">
     </div>

     <div>
     	<label for="email">E-mail: </label>
     	<input type="email" name="email" id="email">
     </div>

     <input type="submit" name="place-order" value="Place Order">
</form>

<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="js/cities-and-suburbs.js"></script>