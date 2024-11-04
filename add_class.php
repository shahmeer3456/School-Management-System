<?php
include 'db_config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $className = $_POST['className'];
    $capacity = $_POST['capacity'];
    $teacherID = $_POST['teacherID'];

    $stmt = $conn->prepare("INSERT INTO Classes (ClassName, Capacity, TeacherID) VALUES (?, ?, ?)");
    $stmt->bind_param("sii", $className, $capacity, $teacherID);

    if ($stmt->execute()) {
        echo '<script>alert("New Class created successfully");</script>';
    } else {
        echo '<script>alert("Error: ' . $stmt->error . '");</script>';
    }

    $stmt->close();
    $conn->close();
}
?>
