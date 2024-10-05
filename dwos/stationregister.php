<?php
include('dwos.php');

session_start();
$error = []; // Initialize the error array

// Assume the user has already registered and you have their ID in the session
if (isset($_SESSION['user_data'])) {
    $user_name = $_SESSION['user_data']['name'];
    $user_email = $_SESSION['user_data']['email'];
    
    // Fetch the user_id from the users table based on the email (or other unique identifier)
    $select_user = "SELECT user_id FROM users WHERE email = '$user_email'";
    $result = mysqli_query($conn, $select_user);
    
    if (mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
        $owner_id = $user['user_id']; // Get the owner_id for the stations table

        // Insert a new station record
        $station_name = 'Your Station Name'; // You would collect this from a form
        $address = 'Your Station Address'; // Also collect this from a form
        $membership_id = 1; // Assuming a default membership ID (you may want to change this)

        $insert_station = "INSERT INTO stations (station_name, owner_id, address, subscription_status, membership_id)
                           VALUES ('$station_name', '$owner_id', '$address', 'A', '$membership_id')";

        if (mysqli_query($conn, $insert_station)) {
            echo 'Station registered successfully!';
        } else {
            echo 'Error registering station: ' . mysqli_error($conn);
        }
    } else {
        echo 'User not found!';
    }
}

if (isset($_POST['submit'])) {
    $name = mysqli_real_escape_string($conn, $_POST['user_name']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $pass = $_POST['password'];
    $cpass = $_POST['cpassword'];

    // Check if the user already exists
    $select = "SELECT * FROM users WHERE email = '$email'";
    $result = mysqli_query($conn, $select);

    if (mysqli_num_rows($result) > 0) {
        $error[] = 'User already exists!';
    } else {
        if ($pass != $cpass) {
            $error[] = 'Passwords do not match!';
        } else {
            // Store user data in session and redirect to subscription page
            $_SESSION['user_data'] = [
                'name' => $name,
                'email' => $email,
                'password' => $pass,
                'user_type' => 'O'
            ];
            header('Location: subscription.php');
            exit();
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Registration</title>
    <link rel="stylesheet" href="stationregister.css">
</head>
<body>
    <div class="form-container">
        <form action="" method="post">
            <h3>Register</h3>
            <?php
            if (isset($error)) {
                foreach ($error as $error) {
                    echo '<span class="error-msg">' . $error . '</span>';
                }
            }
            ?>
            <input type="text" name="user_name" required placeholder="Name">
            <input type="email" name="email" required placeholder="E-mail Address">
            <input type="password" name="password" required placeholder="Password">
            <input type="password" name="cpassword" required placeholder="Repeat Password">
            <div class="button-container">
                <input type="submit" name="submit" value="Register" class="form-btn">
            </div>
            <p>Already have an account? <a href="login.php">Login here.</a></p>
        </form>
    </div>
</body>
</html>
