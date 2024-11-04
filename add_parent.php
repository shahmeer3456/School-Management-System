<?php
include 'db_config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['name'];
    $address = $_POST['address'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];

    $stmt = $conn->prepare("INSERT INTO ParentsGuardians (Name, Address, Email, Phone) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("ssss", $name, $address, $email, $phone);

    if ($stmt->execute()) {
        echo '<script>alert("New parent/guardian added successfully");</script>';
    } else {
        echo '<script>alert("Error: ' . $stmt->error . '");</script>';
    }

    $stmt->close();
    $conn->close();
}
?>
