<?php

//Connect to database
$dbc = new mysqli('localhost', 'root', '', 'cities_and_suburbs');


// Capture and save the chosen city ID
// $cityID =  $_GET['city'];

//Filter the data
//Capture and save the chosen city ID
$cityID = $dbc->real_escape_string( $_GET['cityID'] );

//Prepare SQL
$sql = "SELECT suburbID, suburbName FROM suburbs WHERE cityID = $cityID";

//Run the query and capture the result
$result = $dbc->query( $sql );

//Extract the result
// $suburbs = $result->fetch_all(MYSQLI_ASSOC);
$suburbs = json_encode($result->fetch_all(MYSQLI_ASSOC));

//Convert the data into JSON
// $suburbs = json_encode($suburbs);

header('Content-Type:application/json');

echo $suburbs;