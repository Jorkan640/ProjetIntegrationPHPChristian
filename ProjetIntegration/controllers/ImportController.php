<?php

	class ImportController{
		
		public function __construct(){
			
		}
		
		public function run(){
			$message="";
			
			if(empty($_SESSION['authentified']) || !$_SESSION['authentified']){
				header('Location:index.php');
				die;
			}
			
			# No level number introduced
			if(empty($_POST['lvlNumber']) && !empty($_FILES['csvEx']['tmp_name'])){
				$message="Veuillez introduire un numero de niveau";
			}
			
			# No csv file introduced
			if(!empty($_POST['lvlNumber']) && empty($_FILES['csvEx']['tmp_name'])){
				$message="Veuillez introduire un fichier .csv";
			}
			
			#A level number and a csv file have been introduced
			if(!empty($_POST['lvlNumber']) && !empty($_FILES['csvEx']['tmp_name'])){
				$csv_mimetypes = array('text/csv','text/plain','application/csv','text/comma-separated-values','application/excel','application/vnd.ms-excel',
								'application/vnd.msexcel','text/anytext','application/octet-stream','application/txt');
			
				# The file doesn't match to the csv format
				if (!in_array($_FILES['csvEx']['type'], $csv_mimetypes)) {				
					$message="Le fichier que vous avez introduit n'est pas sous le format .csv";
					
				# The file matches to the csv format
				}else{
					#The selected level doesn't exist
					if(Db::getInstance()->select_level($_POST['lvlNumber']) == null){
						# Moving the csv file uploaded to the right emplacement
						$origine = $_FILES['csvEx']['tmp_name'];
						$destination = basename($_FILES['csvEx']['name']);
						move_uploaded_file($origine, 'models/'.$destination);
						
						# Creating the level
						Db::getInstance()->insert_level($_POST['lvlNumber'], $_POST['lvlName']);
						$level = Db::getInstance()->select_level($_POST['lvlNumber'])->getIdLevel();
						
						try{
							$queries = $this->getallQueries('models/'.$destination, $level);
							Db::getInstance()->insert_queries($queries, $_POST['lvlNumber']);
							$message ="L'importation du fichier csv a été réalisée avec succès";
						}catch (PDOException $e){
							$message = $e->getMessage();
						}
					}
					# The selected level exists already
					else{
						$message="Le niveau choisi existe déjà, veuillez en selectionner un autre";
					}
				}
			}
			#Call of the page import.php
			require_once VIEWS_PATH.'import.php';
		}
		
		public function getallQueries($csvfile, $level){
			$queries = array();
			$date = date('j/m/Y');
			if(file_exists($csvfile)){
				$fcontents = file($csvfile);
					
				#Count the number of elements from csv file to use it as maximum index
				$i = count($fcontents)-1;

				try{
					#Loop wich read all queries in csv file
					for($index = 1; $index <= $i; $index++){
						$icontent = $fcontents[$index];
	
						preg_match('/^(.*);(.*);(.*);(.*);(.*)$/', $icontent, $result);
							
						$queries[$index] = new Query(null, $result[2], $result[3], $result[4], $result[5], $result[1], $level, $_SESSION['teacher_login'],
										 $date);
					}
				}catch (PDOException $e){
					throw new PDOException($e->getMessage());
				}
			}
			return $queries;
		}
		
	}

?>