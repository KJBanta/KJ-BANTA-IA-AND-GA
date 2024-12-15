<?php
include 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $FirstName = $_POST['FirstName'];
    $LastName = $_POST['LastName'];
    $MI = $_POST['MI'];
    $Add_ress = $_POST['Add_ress'];
    $Contactnum = $_POST['Contactnum'];
    $Gender = $_POST['Gender'];
    $username = $_POST['username'];
    $pass_word = password_hash($_POST['password'], PASSWORD_BCRYPT); // Secure password hashing

    $stmt = $conn->prepare("INSERT INTO customer_info (FirstName, LastName, MI, Add_ress, Contactnum, Gender) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt = $conn->prepare("INSERT INTO users (username, pass_word ) VALUES (?, ?)");
    $stmt->bind_param("ss", $username, $pass_word);

    if ($stmt->execute()) {
        echo "Signup successful!";
    } else {
        echo "Error: " . $stmt->error;
    }
    $stmt->close();
    $conn->close();
}
?>
