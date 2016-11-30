<html>

  <head>
    <title>BBA Health | Schedule Appointment</title>
  </head>

	<body>
		<?php session_start();

			//Database connection
			$host = 'db.ist.utl.pt';
			$user = 'ist179069';
			$pass = 'qpaq9059';
			$dsn = "mysql:host=$host;dbname=$user";
			try{
				$connection = new PDO($dsn, $user, $pass);
			}catch(PDOException $exception){
				echo("<p>Error: ");
				echo($exception->getMessage());
				echo("</p>");
				exit();
			}

			//Make sure we are scheduling for the right patient
			echo("<center>
						  <h3>Scheduling an appointment for patient number "); echo($_REQUEST['patient_id']);

			//Save patient_id as a session variable
			$_SESSION['patient_id'] = $_REQUEST['patient_id'];

			//Query for doctor names
			$sql = "SELECT doctor_name, doctor_id FROM doctor";
			$result = $connection->query($sql);

			echo("<form action='schedule.php' method='post'>
						  <h3>Appointment Form</h3>
						  <p>Doctor:&nbsp;&nbsp;&nbsp;
						  <select name=\"doctor_id\">
          ");

				//Show available doctors
				foreach($result as $row){
					$doctor_name = $row['doctor_name'];
					$doctor_id = $row['doctor_id'];
          echo("<option value=\"$doctor_id\">$doctor_name</option>");
				}
			?>
			</select>
			</p>
			<p>Date:   &nbsp;&nbsp;&nbsp;<input type="date" name="date"/></p>
			<p>Office: &nbsp;<input type="text" name="office"/></p>
			<p><input type="submit" value="Submit"/></p>
			</form>
		</center>
	</body>
</html>
