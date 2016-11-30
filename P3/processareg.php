<html>

  <head>
    <title>BBA Health | Result</title>
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

      //Get all needed input data
			$patient_name = $_REQUEST['patient_name'];
			$patient_birthday = $_REQUEST['patient_birthday'];
			$patient_address = $_REQUEST['patient_address'];
			$doctor_id = $_REQUEST['doctor_id'];
			$date = $_REQUEST['date'];
			$office = $_REQUEST['office'];

      //Test if it is a valid date (not on weekends and not in the past)
      $day=strftime("%A",strtotime($date));
      $today_time = strtotime(date('Y-m-d'));
      $date_time = strtotime($date);
      if($day== "Saturday" or $day =="Sunday" or $date_time<$today_time){
        echo("<center><h3>Something went wrong... You can't schedule on weekends or past dates</h3></center>");
        $connection = NULL;

        //Just some button to home page
        echo('<center>
                <form>
                  <input type="button" value="Home" onclick="window.location.href=\'index.html\'" />
                </form>
              </center>
            ');
        exit();
      }

      //Query to retrieve new patient_id
			$sql = "SELECT max(patient_id) FROM patient";
			$result = $connection->query($sql);
			foreach($result as $row){
				$patient_id = $row['max(patient_id)'] +1;
			}

      //Start new patient and new appointment transaction
      $connection->beginTransaction();

      //Query to incert new patient
      $stmt1 = $connection->prepare("INSERT INTO patient VALUES (:patient_id, :patient_name, :patient_birthday, :patient_address)");
      $stmt1->bindParam(':patient_id', $patient_id);
      $stmt1->bindParam(':patient_name', $patient_name);
      $stmt1->bindParam(':patient_birthday', $patient_birthday);
      $stmt1->bindParam(':patient_address', $patient_address);

      //Query to incert new apppointment
      $stmt2 = $connection->prepare("INSERT INTO appointment VALUES (:patient_id, :doctor_id, :date, :office)");
      $stmt2->bindParam(':patient_id', $patient_id);
      $stmt2->bindParam(':doctor_id', $doctor_id);
      $stmt2->bindParam(':date', $date);
      $stmt2->bindParam(':office', $office);

      if($stmt1->execute() && $stmt2->execute()){

        //Commit transaction
        $connection->commit();

        //Print results
        echo("<center>
                <h3>Created patient $patient_name, with number $patient_id, born on $patient_birthday and address $patient_address.<br>
                New appointment scheduled for patient number $patient_id, with doctor number $doctor_id, on $date at office $office.</h3>
                <form>
                  <input type=\"button\" value=\"Home\" onclick=\"window.location.href='index.html'\"/>
                </form>
              </center>
            ");
        //Gonna start all over again, better destroy session
        session_destroy();
      }else{

        //Rollback transaction
        $connection->rollback();

        //Just some button to home page
        echo('<center>
                <form>
                  <input type="button" value="Home" onclick="window.location.href=\'index.html\'" />
                </form>
              </center>
            ');
      }

    ?>
  </body>
</html>
