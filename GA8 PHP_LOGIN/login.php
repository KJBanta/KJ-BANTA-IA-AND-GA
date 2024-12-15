<?php
include 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $pass_word = $_POST['password'];

    $stmt = $conn->prepare("SELECT pass_word FROM users WHERE username = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $stmt->bind_result($hashed_password);
    $stmt->fetch();

    if (password_verify($pass_word, $hashed_password)) {
        header ("location: index.html")
} 
    else {
        header ("location: logsign.html?msg=invalidlogin");
    }
    $stmt->close();
    $conn->close();
}
?>