<html>

  <head>
    <title>BBA Health | Schedule and Appoint</title>
  </head>

  <body>
    <center>
    	<form action="processareg.php">
      	<h3>Reagister and Appoint Patient</h3>
      	<p>Patient name: <input type="text" name="patient_name"/></p>
      	<p>Patient birthday [mm/dd/YYYY]: <input type="date" name="patient_birthday"/></p>
      	<p>Patient address: <input type="text" name="patient_address"/></p>
      	<p>Doctor:
      		<select name="doctor_id">

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

              //Select all doctors
              $sql = "SELECT doctor_name, doctor_id FROM doctor";
        			$result = $connection->query($sql);

              //Show available doctors
      				foreach($result as $row){
      					$doctor_name = $row['doctor_name'];
      					$doctor_id = $row['doctor_id'];
                echo("<option value=\"$doctor_id\">$doctor_name</option>");
      				}
            ?>

      		</select>
      	</p>
      	<p>Date [mm/dd/YYYY]: <input type="date" name="date"/></p>
      	<p>Office: <input type="text" name="office"/></p>
      	<p><input type="submit" value="Submit"/></p>
    	</form>
    </center>
	</body>
</html>
