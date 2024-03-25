<?php
session_start();
require_once 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] == "GET" && isset($_GET['token'])) {
    $token = $_GET['token'];
    // Check if the token exists in the database
    $check_token_query = "SELECT * FROM users WHERE reset_token = '$token'";
    $result = mysqli_query($conn, $check_token_query);

    if (mysqli_num_rows($result) > 0) {
        $_SESSION['reset_token'] = $token;
        header("Location: reset_form.php");
        exit();
    } else {
        echo "Invalid token.";
    }
} else {
    echo "Invalid request.";
}
?>
