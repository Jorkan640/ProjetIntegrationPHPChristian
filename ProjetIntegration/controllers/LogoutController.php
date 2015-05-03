<?php
class LogoutController{

	public function __construct(){
		
	}
	
	public function run(){
		$_SESSION = array();
		$_SESSION['authetifie'] = false;
		$_SESSION['account_kind'] = null;
		$_SESSION['level'] = null;
		header('Location: index.php');
		die();
	}
	
}
?>