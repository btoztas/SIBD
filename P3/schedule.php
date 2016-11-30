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

      //Get all the needed input data
			$patient_id = $_SESSION['patient_id'];
			$doctor_id = $_REQUEST['doctor_id'];
			$date = $_REQUEST['date'];
			$office = $_REQUEST['office'];

			//Test if it is a valid date (not on weekends and not in the past)
			$day=strftime("%A",strtotime($date));
      $today_time = strtotime(date('Y-m-d'));
      $date_time = strtotime($date);
			if($day== "Saturday" or $day =="Sunday" or $date_time<$today_time){
				echo("<center><h3>Something went wrong... Rembember, you can't schedule on weekends or past dates</h3></center>");
				$connection = NULL;

        //Just some button to home page
        echo('<center>
                <form>
        			    <input type="button" value="Home" onclick="window.location.href=\'index.html\'" />
    		        </form>
              </center>
            ');
				exit();
			}else{

        //Query to incert new apppointment
        $stmt = $connection->prepare("INSERT INTO appointment VALUES (:patient_id, :doctor_id, :date, :office)");
        $stmt->bindParam(':patient_id', $patient_id);
        $stmt->bindParam(':doctor_id', $doctor_id);
        $stmt->bindParam(':date', $date);
        $stmt->bindParam(':office', $office);

        //Test if successful
        if($stmt->execute()){
          echo("<center>
                  <h3>New appointment scheduled for patient number $patient_id, with doctor number $doctor_id, on $date at office $office.</h3>
                  <form>
              			<input type=\"button\" value=\"Home\" onclick=\"window.location.href='index.html'\"/>
              		</form>
                </center>
              ");

          //Gonna start all over again, better destroy session
          session_destroy();
        }else{
          echo("<center><h3>Something went wrong when adding appointment to database...</h3></center>");
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
      }
		?>
	</body>
</html>
