<?php

	class LoginController{
		
		public function __construct(){
			
		}
		
		public function  run(){
			
			$message = "";
			
			#If the teachers database is empty
			if(Db::getInstance()->select_teachers() == null){
				$teachers = $this->getallteachers('models/professeurs.csv');
				for($index = 1; $index < sizeof($teachers); $index++){
					$teacher = $teachers[$index];
					Db::getInstance()->insert_teacher($teacher->getLogin(),$teacher->getName(), $teacher->getFirstName(), 
					$teacher->getPassword());
				}
			}
			
			#If the students database is empty
			if(Db::getInstance()->select_students() == null){
				$students = $this->getallstudents('models/etudiants.csv');
				for($index = 1; $index < sizeof($students); $index++){
					$student = $students[$index];
					Db::getInstance()->insert_student($student->getEnrollment(),$student->getName(), $student->getFirstName(), 
					$student->getPassword());
				}
			}
			
			
			
			if(isset($_SESSION['authentified']) && $_SESSION['authentified'] == true){
				if($_SESSION['account_kind'] == 'teacher'){
					header('Location: index.php?action=teacher');
					die;
				}else{
					header('Location: index.php?action=teacher');
				}
				
			}else{
			
				if(!empty($_POST['login']) && !empty($_POST['pwd']) && isset($_POST['account_kind'])){
					#Connected as a teacher
					if($_POST['account_kind'] == 'teacher_account'){
						$teacher = Db::getInstance()->select_teacher($_POST['login']);
						if($teacher != null){
							# Password is not set yet
							if($teacher->getPassword() == null){
								Db::getInstance()->set_teacher_password($_POST['login'], sha1($_POST['pwd']));
								$_SESSION['authentified'] = true;
								$_SESSION['account_kind'] = 'teacher';
								$_SESSION['teacher_login'] = $_POST['login'];
								header('Location: index.php?action=teacher');
								die;
							}else{
								# Password matches the one in database
								if($teacher->getPassword() == sha1($_POST['pwd'])){
									$_SESSION['authentified'] = true;
									$_SESSION['account_kind'] = 'teacher';
									$_SESSION['teacher_login'] = $_POST['login'];
									header('Location: index.php?action=teacher');
									die;
								}else{
									$message= "Les identifiants introduits sont incorrects";
								}
							}
							$message= "Les identifiants introduits sont incorrects";
						}
					}
					
					# Connected as student
					if($_POST['account_kind'] == 'student_account'){
						$student = Db::getInstance()->select_student($_POST['login']);
						if($student != null){
							#Password is not set yet
							if($student->getPassword() == null){
								Db::getInstance()->set_student_password($_POST['login'], sha1($_POST['pwd']));
								$_SESSION['authentified'] = true;
								$_SESSION['account_kind'] = 'student';
								$_SESSION['student_login'] = $_POST['login'];
								header('Location: index.php?action=student');
								die;
							}else{
								#Password matches the one in database
								if($student->getPassword() == sha1($_POST['pwd'])){
									$_SESSION['authentified'] = true;
									$_SESSION['account_kind'] = 'student';
									$_SESSION['student_login'] = $_POST['login'];
									header('Location: index.php?action=student');
									die;
								}else{
									$message= "Les identifiants introduits sont incorrects";
								}
							}
						}
						$message= "Les identifiants introduits sont incorrects";
					}	
				}else{
					$message = "Veuillez completer tous les champs";
				}
			}
			
			#Call of login.php page
			require_once VIEWS_PATH.'login.php';
		}
		
		public function getallteachers($csvfile){
			$teachers = array();
			if(file_exists($csvfile)){
				$fcontents = file($csvfile);
					
				#Count the number of elements from csv file to use it as maximum index
				$i = count($fcontents)-1;
					
				#Loop wich read all teachers in csv file
				for($index = 0; $index <= $i; $index++){
					$icontent = $fcontents[$index];
		
					preg_match('/^(.*);(.*);(.*)$/', $icontent, $result);
		
					$teachers[$index] = new Teacher($result[1], $result[2], $result[3], null);
				}
			}
			return $teachers;
		}
		
		public function getallstudents($csvfile){
			$students = array();
			if(file_exists($csvfile)){
				$fcontents = file($csvfile);
					
				#Count the number of elements from csv file to use it as maximum index
				$i = count($fcontents)-1;
					
				#Loop wich read all teachers in csv file
				for($index = 0; $index <= $i; $index++){
					$icontent = $fcontents[$index];

					$icontent = str_replace('"', '', $icontent);
					preg_match('/^(.*),(.*),(.*)$/', $icontent, $result);
					#preg_match('/^"(.*)","(.*)","(.*)"$/', $icontent, $result);
					#preg_match('/^\"(.*)\",\"(.*)\",\"(.*)\"$/', $icontent, $result);
					$students[$index] = new Student($result[1], $result[2], $result[3], null);
				}
			}
			return $students;
		}
	}

?>