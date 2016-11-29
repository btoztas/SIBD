<html>
 <body>

<?php session_start();

$patient = $_REQUEST['patient_id'];

$host = 'db.ist.utl.pt';
$user = 'ist178719';
$pass = 'qygm3639';
$dsn = "mysql:host=$host;dbname=$user";
$connection = new PDO($dsn, $user, $pass);


$sql = "SELECT * FROM patient where patient.patient_name='$patient'";
$result = $connection->query($sql);

$nrows = $result->rowCount();

if ($nrows == 0)
{	

	echo("<h3>");
	echo("Nao existe paciente");
	echo("</h3>");

	echo "<form action='reg&appoit.php'>";
	echo "<input type='submit' name='submit' value='Register Patient'>";
	echo "</form>";
	
}else{

	$result = $connection->query($sql);
	$nrows = $result->rowCount();
	echo("<p>Number of rows: $nrows</p>");
	$ncols = $result->columnCount();
	echo("<p>Number of columns: $ncols</p>");

	echo("<table border=\"1\">");
	echo("<tr><td>patient_id</td><td>patient_name</td>
	<td>birthday</td><td>address</td></tr>");
	foreach($result as $row)
	{
		echo("<tr><td>");
		echo($row['patient_id']);
		echo("</td><td>");
		echo($row['patient_name']);
		echo("</td><td>");
		echo($row['birthday']);
		echo("</td><td>");
		echo($row['address']);
		echo("</td></tr>");

	}
	$_SESSION['patient_id'] = $row['patient_id'];
	echo("</table>");
	
	echo "<form action='appointment.php'>";
	echo "<input type='submit' name='submit' value='Schedule'>";
	echo "</form>";
}
?>
 </body>
</html>
