<?php

session_start();

// Include the header template
include 'templates/header.template.php';

// Display contents of the cart
include 'templates/cart-contents.template.php';

include 'templates/checkout-form.template.php';

//footer
include 'templates/footer.template.php';