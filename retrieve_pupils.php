<?php
include 'db_config.php';

echo '<!DOCTYPE html>
<html>
<head>
    <title>Pupils Data</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Pupils Data</h1>';

$sql = "SELECT Pupils.PupilID, Pupils.Name, Pupils.Address, Pupils.MedicalInfo, Classes.ClassName 
        FROM Pupils
        JOIN Classes ON Pupils.ClassID = Classes.ClassID";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<table><tr><th>PupilID</th><th>Name</th><th>Address</th><th>Medical Info</th><th>Class</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["PupilID"] . "</td><td>" . $row["Name"] . "</td><td>" . $row["Address"] . "</td><td>" . $row["MedicalInfo"] . "</td><td>" . $row["ClassName"] . "</td></tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}

$conn->close();

echo '</div>
</body>
</html>';
?>
