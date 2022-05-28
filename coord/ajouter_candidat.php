<?php


include('../settings/dbconfig.php');
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST" ){
	$nom_poste=$_GET['nom_poste'];
	$professeur=$_SESSION['coordFiliere']['id_prof'];
	$poste=$_POST['poste'];
	$date_fin=$_POST['date_fin'];
	$date_debut=$_POST['date_debut'];
	$election=$_POST['id_election'];
	if(isset($poste) )	
	{

		$sql ="SELECT * FROM candidats c
		INNER join professeur p on p.id_prof=c.professeur
		INNER JOIN poste ps on ps.id_poste=c.poste
		WHERE c.professeur ='$professeur'
		and c.poste='$poste'";
		$statement = $db->prepare($sql);
		$statement->execute();
		$candi = $statement->fetchAll(PDO::FETCH_OBJ);
		if(!$candi){



			$sql ="SELECT REPLACE((concat_ws('',condition_specialite,condition_type_prof,condition_grade)),' ','') as cond,p.*,f.*,d.* from poste p
			left join filiere f on f.id_filiere=p.id_filiere
			left join departement d on d.id_dprtm=p.id_departement
			where id_poste=$poste ";
			$statement = $db->prepare($sql);
			$statement->execute();
			$nom = $statement->fetchAll(PDO::FETCH_OBJ);
			foreach ($nom as $row) {

				$poste_condition_specialite=$row->condition_specialite ;
				$poste_condition_grade=$row->condition_grade;
				$poste_condition_annciennete=$row->condition_anciennete;
				$poste_condition_type_prof=$row->condition_type_prof;

				$specialite_prof = $_SESSION['coordFiliere']['specialite'];
				$grade_prof  = $_SESSION['coordFiliere']['grade'];
				$annciennete_prof = $_SESSION['coordFiliere']['anciennete'];
				$type_prof = $_SESSION['coordFiliere']['type_prof'];
//concatiner les informations
				$profes=$specialite_prof.$type_prof.'-'.$grade_prof.'-';
				$conSG=$specialite_prof.$grade_prof.'-';

//retirer les espaces 
				$esp=str_replace(' ','',$profes);

				$condition_pos=$row->cond;
				$compara = strpos($esp,$condition_pos);
				$com = strpos($condition_pos,$esp);



	//$specialite = strpos($poste_condition_specialite, $specialite_prof);
//$type = strpos($poste_condition_type_prof,$type_prof);
//$grade = strpos($poste_condition_grade, $grade_prof);


				if (empty($poste_condition_specialite) and empty($poste_condition_grade) and empty($poste_condition_type_prof) and $poste_condition_annciennete=0) 
				{



					$sql = "INSERT INTO candidats(id_candidat,poste,professeur) VALUES (NULL,'$poste','$professeur')";
					$statement = $db->prepare($sql);
					$statement->execute();


					$_SESSION['success']="Votre candidature est bien effectuer ,Vous etes maintenant candidature dans le poste <strong style=color:green;>$row->nom_poste &nbsp;$row->intitule_filiere&nbsp;$row->nom_dprtm   </strong>";

				}
				/*****************cas 1 *****************************/
				else if (empty($poste_condition_grade)) {
		 	# code...
					$es1=str_replace(' ','',$type_prof);
					$es2=str_replace(' ','',$poste_condition_type_prof);

					$stral1=strpos($es2,$es1);

					$stral3=strpos($poste_condition_specialite,$specialite_prof);
					if 
						(($stral1 !== false ) and ($stral3 !== false))

					{



						$sql = "INSERT INTO candidats(id_candidat,poste,professeur) VALUES (NULL,'$poste','$professeur')";
						$statement = $db->prepare($sql);
						$statement->execute();


						$_SESSION['success']="Votre candidature est bien effectuer ,Vous etes maintenant candidature dans le poste <strong style=color:green;>$row->nom_poste &nbsp;$row->intitule_filiere&nbsp;$row->nom_dprtm <br> 
						$compara<br>


						$esp<br>
						$condition_pos<br>
						</strong>";

					}
					else  {

						$_SESSION['error'] ="désolé vous n'avez pas le droit pour être un candidat dans le poste
						<strong style=color:red;> $row->nom_poste  de &nbsp; $row->intitule_filiere&nbsp;$row->nom_dprtm  !!!</strong><br>vous ne sataisfaie pas les conditions suivants :<br>
						<strong>anciennete : plus de $poste_condition_annciennete ans <br> grade :$poste_condition_grade <br> 
						specialite : $poste_condition_specialite <br>$poste_condition_type_prof  <br>
						$profes<br>
						$row->nom_dprtm


						<br></strong>";  

					}
				}

				/****************************************cas 2**********************************/
				else if (empty($poste_condition_type_prof)) {
		 	# code...
					$strpotyep1=strpos($conSG,$condition_pos);
					$strpotyep2=strpos($condition_pos,$conSG);

					if 
						(($strpotyep1 !== false ) or ($strpotyep2 !== false))

					{



						$sql = "INSERT INTO candidats(id_candidat,poste,professeur) VALUES (NULL,'$poste','$professeur')";
						$statement = $db->prepare($sql);
						$statement->execute();


						$_SESSION['success']="Votre candidature est bien effectuer ,Vous etes maintenant candidature dans le poste <strong style=color:green;>$row->nom_poste &nbsp;$row->intitule_filiere&nbsp;$row->nom_dprtm   
						$condition_pos<br>
						$compara
						$esp<br>
						$conSG<br></strong>";

					}
					else  {

						$_SESSION['error'] ="désolé vous n'avez pas le droit pour être un candidat dans le poste
						<strong style=color:red;> $row->nom_poste  de &nbsp; $row->intitule_filiere&nbsp;$row->nom_dprtm  !!!</strong><br>vous ne sataisfaie pas les conditions suivants :<br>
						<strong>anciennete : plus de $poste_condition_annciennete ans <br> grade :$poste_condition_grade <br> 
						specialite : $poste_condition_specialite <br>$poste_condition_type_prof  <br>


						$condition_pos<br>
						$compara
						$esp<br>
						$conSG<br>

						$condition_pos<br>
						$row->cond


						<br></strong>";  

					}
				}



				/****************************************cas 3**********************************/
				else if (empty($poste_condition_type_prof) and empty($poste_condition_grade)) {
		 	# code...


					if 
						(($compara !== false ) or ($com !== false))

					{



						$sql = "INSERT INTO candidats(id_candidat,poste,professeur) VALUES (NULL,'$poste','$professeur')";
						$statement = $db->prepare($sql);
						$statement->execute();


						$_SESSION['success']="Votre candidature est bien effectuer ,Vous etes maintenant candidature dans le poste <strong style=color:green;>$row->nom_poste &nbsp;$row->intitule_filiere&nbsp;$row->nom_dprtm   </strong>";

					}
					else  {

						$_SESSION['error'] ="désolé vous n'avez pas le droit pour être un candidat dans le poste
						<strong style=color:red;> $row->nom_poste  de &nbsp; $row->intitule_filiere&nbsp;$row->nom_dprtm  !!!</strong><br>vous ne sataisfaie pas les conditions suivants :<br>
						<strong>anciennete : plus de $poste_condition_annciennete ans <br> grade :$poste_condition_grade <br> 
						specialite : $poste_condition_specialite <br>
						type:professeur $poste_condition_type_prof  <br>
						$profes<br>


						$compara<br>


						$esp<br>
						$condition_pos<br>


						<br></strong>";  

					}
				}








				/****************************************cas 4**********************************/
				else if (empty($poste_condition_specialite)) {
		 	# code...
					$ess1=str_replace(' ','',$type_prof);
					$ess2=str_replace(' ','',$poste_condition_type_prof);

					$strl1=strpos($ess2,$ess1);

					$strl2=strpos($poste_condition_grade,$grade_prof);
					if 
						(($strl1 !== false ) and ($strl2 !== false))



					{



						$sql = "INSERT INTO candidats(id_candidat,poste,professeur) VALUES (NULL,'$poste','$professeur')";
						$statement = $db->prepare($sql);
						$statement->execute();


						$_SESSION['success']="Votre candidature est bien effectuer ,Vous etes maintenant candidature dans le poste <strong style=color:green;>$row->nom_poste &nbsp;$row->intitule_filiere&nbsp;$row->nom_dprtm   </strong>";

					}
					else  {

						$_SESSION['error'] ="désolé vous n'avez pas le droit pour être un candidat dans le poste
						<strong style=color:red;> $row->nom_poste  de &nbsp; $row->intitule_filiere&nbsp;$row->nom_dprtm  !!!</strong><br>vous ne sataisfaie pas les conditions suivants :<br>
						<strong>anciennete : plus de $poste_condition_annciennete ans <br> grade :$poste_condition_grade <br> 
						specialite : $poste_condition_specialite <br>$poste_condition_type_prof  <br>
						$profes<br>
						$row->nom_dprtm
						$row->intitule_filiere<br>
						$condition_pos<br>
						$compara
						$esp

						<br></strong>";  

					}
				}




				/****************************************cas 5**********************************/
				else if (empty($poste_condition_specialite) and empty($poste_condition_grade)) {
		 	# code...
					$ess11=str_replace(' ','',$type_prof);
					$ess21=str_replace(' ','',$poste_condition_type_prof);

					$str=strpos($ess21,$ess11);


					if 
						($str !== false )




					{



						$sql = "INSERT INTO candidats(id_candidat,poste,professeur) VALUES (NULL,'$poste','$professeur')";
						$statement = $db->prepare($sql);
						$statement->execute();


						$_SESSION['success']="Votre candidature est bien effectuer ,Vous etes maintenant candidature dans le poste <strong style=color:green;>$row->nom_poste &nbsp;$row->intitule_filiere&nbsp;$row->nom_dprtm   </strong>";

					}
					else  {

						$_SESSION['error'] ="désolé vous n'avez pas le droit pour être un candidat dans le poste
						<strong style=color:red;> $row->nom_poste  de &nbsp; $row->intitule_filiere&nbsp;$row->nom_dprtm  !!!</strong><br>vous ne sataisfaie pas les conditions suivants :<br>
						<strong>anciennete : plus de $poste_condition_annciennete ans <br> grade :$poste_condition_grade <br> 
						specialite : $poste_condition_specialite <br>$poste_condition_type_prof  <br>
						$profes<br>
						$row->nom_dprtm
						$row->intitule_filiere<br>
						$condition_pos<br>

						$esp

						<br></strong>";  

					}
				}





				/****************************************cas 6**********************************/
				else if (empty($poste_condition_type_prof) && empty($condition_specialite)) {
		 	# code...


					if 
						(($compara !== false ) or  ($com !== false))

					{



						$sql = "INSERT INTO candidats(id_candidat,poste,professeur) VALUES (NULL,'$poste','$professeur')";
						$statement = $db->prepare($sql);
						$statement->execute();


						$_SESSION['success']="Votre candidature est bien effectuer ,Vous etes maintenant candidature dans le poste <strong style=color:green;>$row->nom_poste &nbsp;$row->intitule_filiere&nbsp;$row->nom_dprtm   </strong>";

					}
					else  {

						$_SESSION['error'] ="désolé vous n'avez pas le droit pour être un candidat dans le poste
						<strong style=color:red;> $row->nom_poste  de &nbsp; $row->intitule_filiere&nbsp;$row->nom_dprtm  !!!</strong><br>vous ne sataisfaie pas les conditions suivants :<br>
						<strong>anciennete : plus de $poste_condition_annciennete ans <br> grade :$poste_condition_grade <br> 
						specialite : $poste_condition_specialite <br>$poste_condition_type_prof  <br>
						$profes<br>
						$row->nom_dprtm
						$row->intitule_filiere<br>
						$condition_pos<br>
						$compara

						<br></strong>";  

					}
				}




				/****************************************cas 2**********************************/
				else if (!empty($poste_condition_specialite) 
					and !empty($poste_condition_grade) and !empty($poste_condition_type_prof) and $poste_condition_annciennete !=0)  {
		 	# code...
					$esp1=str_replace(' ','',$type_prof);
				$esp2=str_replace(' ','',$poste_condition_type_prof);

				$strall1=strpos($esp2,$esp1);
				$strall2=strpos($poste_condition_grade,$grade_prof);
				$strall3=strpos($poste_condition_specialite,$specialite_prof);

				if 
					(($strall1 !== false ) and ($strall2 !== false) and ($strall3 !== false))
				{



					$sql = "INSERT INTO candidats(id_candidat,poste,professeur) VALUES (NULL,'$poste','$professeur')";
					$statement = $db->prepare($sql);
					$statement->execute();


					$_SESSION['success']="Votre candidature est bien effectuer ,Vous etes maintenant candidature dans le poste <strong style=color:green;>$row->nom_poste &nbsp;$row->intitule_filiere&nbsp;$row->nom_dprtm   </strong>";

				}
				else  {

					$_SESSION['error'] ="désolé vous n'avez pas le droit pour être un candidat dans le poste
					<strong style=color:red;> $row->nom_poste  de &nbsp; $row->intitule_filiere&nbsp;$row->nom_dprtm  !!!</strong><br>vous ne sataisfaie pas les conditions suivants :<br>
					<strong>anciennete : plus de $poste_condition_annciennete ans <br> grade :$poste_condition_grade <br> 
					specialite : $poste_condition_specialite <br>$poste_condition_type_prof  <br>
					$profes<br>
					$row->nom_dprtm
					$row->intitule_filiere<br>
					$condition_pos<br>
					$esp<br>
					$esp1<br>
					$esp2

					<br></strong>";  

				}
			}




			/*************************fin les condtion*******************************/
		}}

		else{


			$_SESSION['error'] ="<strong style=color:red>Vous Avez déja fait une candidature pour ce poste  !!</strong>" ;}


		}

	}else{
		$_SESSION['error'] ="cliquer sur candidature !!"; } 



		header("location:form_candidature.php?id_election=$election&date_fin_insc=$date_fin&date_debut_insc=$date_debut ");

		?>