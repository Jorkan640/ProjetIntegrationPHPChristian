<?php
	class TeacherHomePageController{
		
		public function __construct(){
			
		}
		
		public function run(){
			if(empty($_SESSION['authentified']) || !$_SESSION['authentified']){
				header('Location: index.php');
				die;
			}
			
			# Call of teacher_hompage.php
			require_once VIEWS_PATH.'teacher_homepage.php';
		}
		
	}
?>