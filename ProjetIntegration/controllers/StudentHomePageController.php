<?php

	class StudentHomePageController{
		
		public function __construct(){
			
		}
		
		public function run(){
			if(empty($_SESSION['authentified']) || !$_SESSION['authentified']){
				header('Location: index.php');
				die;
			}
			
			#Call of student_homepage.php
			require_once VIEWS_PATH.'student_homepage.php';
		}
		
	}

?>