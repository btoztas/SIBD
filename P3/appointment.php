<html>
	<head><style>
	</style></head>
	<body>
	<html>
	<body>



	<form action="schedule.php"> 
	<h3>Appointment Form</h3>
		<?php session_start();
		
	
	
				//echo ($_SESSION['patient_id']);
		?>
	<p>Doctor:
		<select name="doctor_name">
			<?php
					$host = 'db.ist.utl.pt';
					$user = 'ist178719';
					$pass = 'qygm3639';
					$dsn = "mysql:host=$host;dbname=$user";
				$connection = new PDO($dsn, $user, $pass);
				$sql = "SELECT doctor_name FROM doctor";
				$result = $connection->query($sql);
				
				foreach($result as $row)
					{
						$doctor_name = $row['doctor_name'];
						echo("<option value=\"$doctor_name\">$doctor_name</option>");
					}
			?>
		</select>
	</p>
	
	<p>Date:   &nbsp;&nbsp;&nbsp;<input type="date" name="date"/></p>
	<p>Office: &nbsp;<input type="text" name="office"/></p>
	
	<p><input type="submit" value="Submit"/></p>
	</form>





	</body>
</html>	




	
