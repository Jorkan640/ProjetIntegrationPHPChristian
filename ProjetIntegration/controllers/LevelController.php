<?php
class LevelController{

	public function __construct(){
		
	}
	
	public function run(){
		if(empty($_SESSION['authentified']) || !$_SESSION['authentified']){
			header('Location:index.php');
			die;
		}
		
		$reponse="";
		#Storage of the level and creation of an array of queries from this level
		$_SESSION['lvl'] = $_GET['level'];
		$_SESSION['queries'] = Db::getInstance()->select_queries($_SESSION['lvl']);
		$nbQueries = sizeof($_SESSION['queries']);
		
		#Selection of the query to show
		$query = $this->query_select($nbQueries);
		
		#Selection of last good answer, if already done once
		$answer_given = Db::getInstance()->select_resolution($_SESSION['student_login'], $query->getId());
		if($answer_given != null){
			$last_answer = $answer_given->getAnswer();
		}
		
		# Processing of student's query
		if(!empty($_POST['student_query'])){
			#If no answer has been given before
			if($answer_given == null){
				try{
					$reponse= Db::getInstance()->select_student_query($_POST['student_query']);
				}catch (PDOException $e){
					$reponse= $e->getMessage();
				}
				#If the answer is correct, the query given is stored in DB
				if(isset($reponse) && is_array($reponse)){
					$resolution = new Resolution($_SESSION['student_login'], $query->getId(), $_POST['student_query']);
					Db::getInstance()->insert_resolution($resolution);
					$last_answer= $_POST['student_query'];
				}
			#An answer has always been given
			}else{
				try{
					$reponse= Db::getInstance()->select_student_query($_POST['student_query']);
				}catch (PDOException $e){
					$reponse= $e->getMessage();
				}
				#If the answer is correct, the query given is stored in DB
				if(isset($reponse) && is_array($reponse)){
					$resolution = new Resolution($_SESSION['student_login'], $query->getId(), $_POST['student_query']);
					Db::getInstance()->update_resolution_answer($resolution);
					#Refresh of the answer to show
					$answer_given = Db::getInstance()->select_resolution($_SESSION['student_login'], $query->getId());
					$last_answer = $answer_given->getAnswer();
				}
			}
		}
		
		#Call of page level.php
		require_once VIEWS_PATH.'level.php';
	}
	
	public function query_select($nbQueries){
		#No query selected by the student
		if(!isset($_POST['queryNumber']) && !isset($_POST['previous']) && !isset($_POST['next'])){
			if(!isset($_SESSION['currentQuery'])){
				$_SESSION['currentQuery'] = 0;
			}
			return $_SESSION['queries'][$_SESSION['currentQuery']];
		}else{
			#Query selected by a number
			if(isset($_POST['queryNumber'])){
				if($_POST['queryNumber'] > 0 && $_POST['queryNumber'] <= $nbQueries){
					$_SESSION['currentQuery'] = $_POST['queryNumber']-1;
					return $_SESSION['queries'][$_SESSION['currentQuery']];
				}else{
					return $_SESSION['queries'][$_SESSION['currentQuery']];
				}
			}
			#Query selected by previous button
			if(isset($_POST['previous'])){
				if($_SESSION['currentQuery'] > 0 ){
					$_SESSION['currentQuery']--;
					return $_SESSION['queries'][$_SESSION['currentQuery']];
				}else{
					return $_SESSION['queries'][$_SESSION['currentQuery']];
				}
			}
			#Query selected by next button
			if(isset($_POST['next'])){
				if($_SESSION['currentQuery'] < $nbQueries-1){
					$_SESSION['currentQuery']++;
					return $_SESSION['queries'][$_SESSION['currentQuery']];
				}else{
					return $_SESSION['queries'][$_SESSION['currentQuery']];
				}
			}
								
		}
	}
	
}
?>