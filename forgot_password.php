<?php
session_start();
require_once 'db_connect.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'C:\Users\akila\Desktop\Php\Database\vendors\PHPMailer\src\Exception.php';
require 'C:\Users\akila\Desktop\Php\Database\vendors\PHPMailer\src\PHPMailer.php';
require 'C:\Users\akila\Desktop\Php\Database\vendors\PHPMailer\src\SMTP.php';

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $email = $_POST['email'];
    $check_email_query = "SELECT * FROM users WHERE username = '$email'";
    $result = mysqli_query($conn, $check_email_query);

    if (mysqli_num_rows($result) > 0) {
        // Email exists, proceed with sending the reset link
        $token = md5(uniqid(rand(), true));
        $reset_link = "http://localhost/reset_password.php?token=$token";

        // Save the token in the database for verification later
        $update_query = "UPDATE users SET reset_token = '$token' WHERE username = '$email'";
        mysqli_query($conn, $update_query);

        // Create a new PHPMailer instance
        $mail = new PHPMailer(true);

        try {
            // Server settings
            $mail->isSMTP();
            $mail->Host = 'smtp.gmail.com';
            $mail->SMTPAuth = true;
            $mail->Username = 'akilanj1999@gmail.com'; // Your Gmail email address
            $mail->Password = 'owcsaytyouwzhsjy'; // Your Gmail password
            $mail->SMTPSecure = 'tls';
            $mail->Port = 587;

            $mail->setFrom('akilanj1999@gmail.com'); // Update sender's email address
            $mail->addAddress($email); // Add recipient

            // Email content
            $mail->isHTML(true);
            $mail->Subject = 'Password Reset';
            $mail->Body = "Click the link to reset your password: $reset_link";

            // Send email
            $mail->send();
            echo "<script>alert('Password reset link sent to your email.');</script>";
        } catch (Exception $e) {
            echo "<script>alert('Failed to send password reset email.');</script>";
        }
    } else {
        echo "<script>alert('Email not found in the database.');</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>Taylor's School Management System Forgot Password</title>
		<link rel="stylesheet" href="vendors/iconfonts/mdi/css/materialdesignicons.min.css">
		<link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
		<link rel="stylesheet" href="vendors/css/vendor.bundle.addons.css">
		<link rel="stylesheet" href="css/style.css">
		<link rel="shortcut icon" href="images/favicon.png" />
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
	</head>
<body>
    
<div class="container-scroller">
			<div class="container-fluid page-body-wrapper full-page-wrapper auth-page">
				<div class="content-wrapper d-flex align-items-center auth theme-one" style="background-color: #424964; background-image: url('https://www.transparenttextures.com/patterns/diagmonds.png');">
					<div class="row w-100">
						<div class="col-lg-4 mx-auto">
							<img src="images/logo-2.png" style="display: block; margin-left: auto; margin-right: auto; margin-bottom: 20px" width="300">
							<div class="auto-form-wrapper">
    <h1>Forgot Password</h1>
    <form action="" method="post">
        <label for="email">Email:</label>
        <input type="email" name="email" id="email" required>
        <button type="submit" class="btn btn-dark submit-btn btn-block">submit</button>
    </form>
    <a href="login.php"class="text-black text-small">Back to Login</a>
	</form>
							</div>
							<br/>
							<p class="footer-text text-center">Copyright © 2024 <span style="color: #AA3339; font-weight: bold">Taylor's International School.</span> All rights reserved.. All rights reserved.</p>
						</div>
</body>
</html>
