<?php
include 'db_config.php';

$sql = "SELECT Pupils.Name as PupilName, Classes.ClassName, Teachers.Name as TeacherName 
        FROM Pupils 
        JOIN Classes ON Pupils.ClassID = Classes.ClassID 
        JOIN Teachers ON Classes.TeacherID = Teachers.TeacherID";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<table><tr><th>Pupil Name</th><th>Class</th><th>Teacher</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["PupilName"] . "</td><td>" . $row["ClassName"] . "</td><td>" . $row["TeacherName"] . "</td></tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}

$conn->close();
?>
