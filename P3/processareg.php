
<html>

<body>
<?php

	$patient_name = $_REQUEST['patient_name'];
	$patient_birthday = $_REQUEST['patient_birthday'];
	$patient_address = $_REQUEST['patient_address'];
	$doctor_name = $_REQUEST['doctor_name'];
	$date = $_REQUEST['date'];
	$office = $_REQUEST['office'];

				$day=strftime("%A",strtotime($date));
				if($day== "Saturday" or $day =="Sunday" ){
					echo("Data apontada nao e um dia util");
					$connection = NULL;
					exit();
				}


				$host = 'db.ist.utl.pt';
				$user = 'ist178719';
				$pass = 'qygm3639';
				$dsn = "mysql:host=$host;dbname=$user";
				$connection = new PDO($dsn, $user, $pass);



				$sql = "SELECT max(patient_id) FROM patient";
				$result = $connection->query($sql);


				foreach($result as $row)
				{
					$patient_id = $row['max(patient_id)'] +1;
				}

				//echo $patient_id;


				$sql = "SELECT * FROM doctor where doctor.doctor_name='$doctor_name'";
				$result = $connection->query($sql);


				foreach($result as $row)
				{
					$doctor_id = $row['doctor_id'];
				}
					$connection->beginTransaction();
					$sql = "INSERT INTO patient VALUES ('$patient_id','$patient_name', '$patient_birthday','$patient_address')";
					$nrows = $connection->exec($sql);
					//echo("<p>#$nrows paciente registado</p>");

					$sql = "INSERT INTO appointment VALUES ('$patient_id','$doctor_id', '$date','$office')";
					$nrowz = $connection->exec($sql);
					//echo("<p>#$nrowz consulta marcada</p>");
					echo("<p>Ol&aacute $patient_name, informamos que o seu registo foi corretamente adicionado ao nosso servi&ccedilo</p>");
					echo("<p>A sua consulta foi agendada para a data $date e ir&aacute decorrer no escrit&oacuterio $office</p>");
					//
					$connection->commit(); 

?>

	<form>
		<input type="button" value="RETURN" onclick="window.location.href='http://web.ist.utl.pt/ist178719/form.php'" />
	</form>



</body>
</html>
