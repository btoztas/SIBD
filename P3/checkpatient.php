<html>

  <head>
    <title>BBA Health | Patient Result</title>
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


      //Query for inserted Patient Name
      $patient_name = $_REQUEST['patient_name'];
      $stmt = $connection->prepare("SELECT * FROM patient WHERE patient_name LIKE CONCAT('%',:patient_name,'%')");
      $stmt->bindParam(':patient_name', $patient_name);
      $stmt->execute();

      //Check if there are results
      $nrows = $stmt->rowCount();

      //If no patients found then register the patient
      if ($nrows == 0){
      	echo("<center>
                <h3>Patient not found</h3>
                <form action='reg&appoit.php' method='post'>
                  <input type='submit' name='submit' value='Register Patient'>
                </form>
              </center>
            ");

      //Else, show patient info
      }else{

      	echo("<center>
                <h2>Total patients found: $nrows</h2>
                <h3>Please select one of the patients</h3>
            ");
        echo "<form action='appointment.php' method='post'>";
      	echo("<table border=\"1\" align=\"center\">");
      	echo("<tr><td>Patient ID</td><td>Patient Name</td>
      	<td>Birthday</td><td>Address</td><td>Select</td></tr>");


        //Select correct patient with radio button
      	foreach($stmt as $row)
      	{
      		echo("<tr><td>");
      		echo($row['patient_id']);
      		echo("</td><td>");
      		echo($row['patient_name']);
      		echo("</td><td>");
      		echo($row['birthday']);
      		echo("</td><td>");
      		echo($row['address']);
          echo("</td><td>");
      		echo("<input type=\"radio\" name=\"patient_id\" value=");echo($row['patient_id']);echo(">");
      		echo("</td></tr>");
      	}

        //Submit selected patient
      	echo("</table>");
      	echo "<br><input type='submit' value='Schedule Appointment'>";
      	echo "</form>
              </center>";
      }

    ?>
  </body>
</html>
