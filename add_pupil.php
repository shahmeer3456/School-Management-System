<?php
include 'db_config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['name'];
    $address = $_POST['address'];
    $medicalInfo = $_POST['medicalInfo'];
    $classID = $_POST['classID'];

    $stmt = $conn->prepare("INSERT INTO Pupils (Name, Address, MedicalInfo, ClassID) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("sssi", $name, $address, $medicalInfo, $classID);

    if ($stmt->execute()) {
        echo '<script>alert("New Pupil added successfully");</script>';
    } else {
        echo '<script>alert("Error: ' . $stmt->error . '");</script>';
    }

    $stmt->close();
    $conn->close();
}
?>
