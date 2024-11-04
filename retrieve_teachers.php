<?php
include 'db_config.php';

$sql = "SELECT * FROM Teachers";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<table><tr><th>Name</th><th>Address</th><th>Phone</th><th>Annual Salary</th><th>Background Check</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["Name"] . "</td><td>" . $row["Address"] . "</td><td>" . $row["Phone"] . "</td><td>" . $row["AnnualSalary"] . "</td><td>" . ($row["BackgroundCheck"] ? 'Yes' : 'No') . "</td></tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}

$conn->close();
?>
