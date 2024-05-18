<?php
// Establish MySQL connection
$servername = "localhost";
$username = "root";
$password = "";
$database = "simple_login";

$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get login credentials from POST request
$username = $_POST['username'];
$password = $_POST['password'];

$sql = "SELECT * FROM `user`  WHERE `username`='$username' AND `password`='$password'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // User found, send success response
    echo "success";
} else {
    // User not found, send failure response
    echo "failure";
}

$conn->close();
?>
