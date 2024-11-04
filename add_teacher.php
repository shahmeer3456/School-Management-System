<?php
include 'db_config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['name'];
    $address = $_POST['address'];
    $phone = $_POST['phone'];
    $annualSalary = $_POST['annualSalary'];
    $backgroundCheck = isset($_POST['backgroundCheck']) ? 1 : 0;

    $stmt = $conn->prepare("INSERT INTO Teachers (Name, Address, Phone, AnnualSalary, BackgroundCheck) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("sssdi", $name, $address, $phone, $annualSalary, $backgroundCheck);

    if ($stmt->execute()) {
        echo '<script>alert("New Teacher added successfully");</script>';
    } else {
        echo '<script>alert("Error: ' . $stmt->error . '");</script>';
    }

    $stmt->close();
    $conn->close();
}
?>
