<html>
<body>
<?php session_start();
	//$patient_id = $_REQUEST['patient_id'];
	$doctor_name = $_REQUEST['doctor_name'];
	$date = $_REQUEST['date'];
	$office = $_REQUEST['office'];
	

	$host = 'db.ist.utl.pt';
	$user = 'ist178719';
	$pass = 'qygm3639';
	$dsn = "mysql:host=$host;dbname=$user";
	$connection = new PDO($dsn, $user, $pass);

				$sql = "SELECT * FROM doctor where doctor.doctor_name='$doctor_name'";
				$result = $connection->query($sql);


				foreach($result as $row)
				{
					$id = $row['doctor_id'];
				}
				#echo $patient_id;
				#echo $id;
				#echo $date;
				#echo $office;
				$day=strftime("%A",strtotime($date));
				#echo $day;
				$patient_id = $_SESSION['patient_id'];
				if($day== "Saturday" or $day =="Sunday" ){
					echo("Data apontada nao e um dia util");
					$connection = NULL;
					exit();

				}else{
				$connection->beginTransaction();	
					$sql = "INSERT INTO appointment VALUES ('$patient_id','$id', '$date','$office')";
					$nrows = $connection->exec($sql);
					
					$sql = "SELECT * FROM patient where patient_id='$patient_id'";
					
					$result = $connection->query($sql);


					foreach($result as $row)
					{
						$name = $row['patient_name'];
					}
					echo("<p>$name, a sua consulta foi agendada com sucesso para a data $date no escrit&oacuterio $office</p>");
				$connection->commit(); 
				}
	#$sql = "SELECT max(patient_id) FROM patient";
	#$last_pid = $connection->query($sql);
	#$patient_id = $last_pid +1;
	
	
?>

	<form>
		<input type="button" value="RETURN" onclick="window.location.href='http://web.ist.utl.pt/ist178719/form.php'" />
	</form>

</body>



</html>
