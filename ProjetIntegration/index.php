<?php
	#Start of a session
	session_start();
	
	#Definition of global variables
	define('VIEWS_PATH', 'views/');
	define('MODELS_PATH', 'models/');
	define('CONTROLLERS_PATH', 'controllers/');
	
	#Creation of autoload method
	function loadCLass($class){
		require_once (MODELS_PATH.$class.'.class.php');
	}
	
	spl_autoload_register('loadCLass');
	
	$_SESSION['lvls'] = Db::getInstance()->select_levels();
	
	#Call for a fixed header for all the pages
	require_once VIEWS_PATH.'header.php';
	
	#Call of a random page
	$action = (isset($_GET['action']))? htmlentities($_GET['action']): 'defaut';
	

	
	#Choice of a page in function of what the variable action contains
	switch ($action){
		case 'level':
			require_once CONTROLLERS_PATH.'LevelController.php';
			$controller = new LevelController();
			break;
		case 'logout':
			require_once CONTROLLERS_PATH.'LogoutController.php';
			$controller = new LogoutController();
			break;
		case 'teacher':
			require_once CONTROLLERS_PATH.'TeacherHomePageController.php';
			$controller = new TeacherHomePageController();
			break;
		case 'import':
			require_once CONTROLLERS_PATH.'ImportController.php';
			$controller = new ImportController();
			break;
		case 'export':
			require_once CONTROLLERS_PATH.'ExportController.php';
			$controller = new ExportController();
			break;
		case 'student':
			require_once CONTROLLERS_PATH.'StudentHomePageController.php';
			$controller = new StudentHomePageController();
			break;
		default:
			$controller;
			if(!empty($_SESSION['account_kind']) && $_SESSION['account_kind'] == 'teacher'){
				require CONTROLLERS_PATH.'TeacherHomePageController.php';
				$controller = new TeacherHomePageController();
			}elseif(!empty($_SESSION['account_kind']) && $_SESSION['account_kind'] == 'student'){
				require CONTROLLERS_PATH.'StudentHomePageController.php';
				$controller = new StudentHomePageController();
			}else{
				require_once CONTROLLERS_PATH.'LoginController.php';
				$controller = new LoginController();
			}
			break;
	}
	
	#Execute le controlleur choisi:
	$controller->run();
	
	
	#Appel au footer fixe pour toutes les pages
	require_once VIEWS_PATH.'footer.php';

?>