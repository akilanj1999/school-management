<?php
session_start();
require_once 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    if (isset($_SESSION['reset_token'])) {
        $token = $_SESSION['reset_token'];
        $new_password = $_POST['new_password'];

        // Hash the new password
        $hashed_password = password_hash($new_password, PASSWORD_DEFAULT);

        // Update the password in the database
        $update_query = "UPDATE users SET password = '$hashed_password', reset_token = NULL WHERE reset_token = '$token'";
        mysqli_query($conn, $update_query);
        
        // Redirect to login page
        header("Location: login.php");
        exit();
    } else {
        echo "Invalid request.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>Taylor's School Management System Forgot Reset Password</title>
		<link rel="stylesheet" href="vendors/iconfonts/mdi/css/materialdesignicons.min.css">
		<link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
		<link rel="stylesheet" href="vendors/css/vendor.bundle.addons.css">
		<link rel="stylesheet" href="css/style.css">
		<link rel="shortcut icon" href="images/favicon.png" />
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
	</head>
<body>
<body>
<div class="container-scroller">
			<div class="container-fluid page-body-wrapper full-page-wrapper auth-page">
				<div class="content-wrapper d-flex align-items-center auth theme-one" style="background-color: #424964; background-image: url('https://www.transparenttextures.com/patterns/diagmonds.png');">
					<div class="row w-100">
						<div class="col-lg-4 mx-auto">
							<img src="images/logo-2.png" style="display: block; margin-left: auto; margin-right: auto; margin-bottom: 20px" width="300">
							<div class="auto-form-wrapper">
                            <h1>Reset Password</h1>
                        <form action="" method="post">
                            <label for="new_password">New Password:</label>
                            <!-- Password input field -->
                            <div class="password-input">
                                <input type="password" name="new_password" id="new_password" required>
                                <!-- Show Password toggle button -->
                                <span class="password-toggle" onclick="togglePassword()">Show Password</span>
                            </div>
                            <button type="submit" class="btn btn-dark submit-btn btn-block">Submit</button>
                        </form>
                        
    <!-- JavaScript for password toggle -->
    <script>
        function togglePassword() {
            var passwordField = document.getElementById("new_password");
            var passwordToggle = document.querySelector(".password-toggle");

            // Toggle the type attribute of the password field
            if (passwordField.type === "password") {
                passwordField.type = "text";
                passwordToggle.textContent = "Hide Password";
            } else {
                passwordField.type = "password";
                passwordToggle.textContent = "Show Password";
            }
        }
    </script>
    </div>
							<br/>
							<p class="footer-text text-center">Copyright © 2024 <span style="color: #AA3339; font-weight: bold">Taylor's International School.</span> All rights reserved.. All rights reserved.</p>
						</div>
</body>
</html>
