<?php
class Db{

	private $_db;

	private static $instance = null;

	private function __construct(){

		#Creation of a connection to the project database
		try{
			$this->_db = new PDO('mysql:host=localhost', 'root','');
			$this->_db->exec("set names utf8");
				
			#Definition of attribute "default error mode"
			$this->_db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				
			#Definition of attribute "default fetch mode"
			$this->_db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);
				
		}catch (PDOException $e){
			die('Erreur de connexion à la base de données'.$e->getMessage());
		}
	}

	#Pattern Sigleton for the database connexion
	public static function getInstance(){
		if(is_null(self::$instance)){
			self::$instance = new Db();
		}
		return self::$instance;
	}
	
	#Definition of method for selecting teachers
	public function select_teachers(){
		$query = 'SELECT login, name, first_name, password FROM bdprojet.teachers';
		$result = $this->_db->query($query);
		$teachers=array();
		
		if($result->rowCount()!=0){
			while($row=$result->fetch()){
				$teachers[]= new Teacher($row->login, $row->name, $row->first_name, $row->password);
			}
		}
		return $teachers;
	}
	
	#Definition of method for selecting one teacher with his login given as argument
	public function select_teacher($login){
		$query = 'SELECT name, first_name, password FROM bdprojet.teachers WHERE login="'.$login.'"';
		$result = $this->_db->query($query);
		$teacher= null;
	
		if($result->rowCount() == 1){
			$row=$result->fetch();
			$teacher = new Teacher($login, $row->name, $row->first_name, $row->password);
		}
		
		return $teacher;
	}
	
	#Definition of method for selecting students
	public function select_students(){
		$query = 'SELECT enrollment, name, first_name, password FROM bdprojet.students';
		$result = $this->_db->query($query);
		$students=array();
	
		if($result->rowCount()!=0){
			while($row=$result->fetch()){
				$students[]= new Student($row->enrollment, $row->name, $row->first_name, $row->password);
			}
		}
		return $students;
	}
	
	#Definition of method for selecting one student with his enrollment given as argument
	public function select_student($enrollment){
		$query = 'SELECT name, first_name, password FROM bdprojet.students WHERE enrollment="'.$enrollment.'"';
		$result = $this->_db->query($query);
		$student= null;
		
		if($result->rowCount() == 1){
			$row=$result->fetch();
			$student = new Student($enrollment, $row->name, $row->first_name, $row->password);
		}
		return $student;
	}
	
	#Definition of method for inserting teachers in database
	public function insert_teacher($login, $name, $first_name, $password){
		$query = 'INSERT INTO bdprojet.teachers (login, name, first_name, password) VALUES('.$this->_db->quote($login).','
				.$this->_db->quote($name).','.$this->_db->quote($first_name).','.$this->_db->quote($password).')';
		$this->_db->prepare($query)->execute();
	}
	
	#Definition of method for inserting students in database
	public function insert_student($enrollment, $name, $first_name, $password){
		$query = 'INSERT INTO bdprojet.students (enrollment, name, first_name, password) VALUES('.$this->_db->quote($enrollment).','
				.$this->_db->quote($name).','.$this->_db->quote($first_name).','.$this->_db->quote($password).')';
		$this->_db->prepare($query)->execute();
	}
	
	#Definition of method to change teacher's password
	public function set_teacher_password($login, $password){
		$query = 'UPDATE bdprojet.teachers SET password='.$this->_db->quote($password).'WHERE login="'.$login.'"';
		$this->_db->prepare($query)->execute();
	}
	
	#Definition of method to change student's password
	public function set_student_password($enrollment, $password){
		$query = 'UPDATE bdprojet.students SET password='.$this->_db->quote($password).'WHERE enrollment="'.$enrollment.'"';
		$this->_db->prepare($query)->execute();
	}
	#Definition of method to select all levels in database
	public function select_levels(){
		$query = 'SELECT id_level, name, level_number FROM bdprojet.levels ORDER BY level_number';
		$result = $this->_db->query($query);
		$levels=array();
		
		if($result->rowCount()!=0){
			while($row=$result->fetch()){
				$levels[]= new Level($row->id_level, $row->name, $row->level_number);
			}
		}
		return $levels;
	}
	#Definition of method to select a level
	public function select_level($level_number){
		$query = 'SELECT id_level, name FROM bdprojet.levels WHERE level_number="'.$level_number.'"';
		$result = $this->_db->query($query);
		$level= null;
		
		if($result->rowCount() == 1){
			$row=$result->fetch();
			$level = new Level($row->id_level, $row->name, $level_number);
		}
		return $level;
	}
	
	#Definition of method to insert a level in database
	public function insert_level($level_number, $name){
		$query = 'INSERT INTO bdprojet.levels (name,level_number) VALUES('.$this->_db->quote($name).','
				.$this->_db->quote($level_number).')';
		$this->_db->prepare($query)->execute();
	}
	
	#Definition of method to insert queries from an array of queries' objects given in parameter
	public function insert_queries($queries){
		foreach ($queries as $q){
			$query = 'INSERT INTO bdprojet.queries (topic, statement, query, nb_lines_result, query_number, id_level, teacher_login, last_modif_date)
					 VALUES('.$this->_db->quote($q->getTopic()).','.$this->_db->quote($q->getStatement()).','.$this->_db->quote($q->getQuery()).','
					.$q->getNbLinesResult().','.$q->getQueryNumber().','.$q->getIdLevel().','
					.$this->_db->quote($q->getTeacherLogin()).','.$this->_db->quote($q->getLastModifDate()).')';
			$this->_db->prepare($query)->execute();
		}
	}
	
	#Definition of method to select queries in wich level's number matches the one in parameter
	public function select_queries($level_number){
		$level = Db::getInstance()->select_level($level_number)->getIdLevel();
		$query = 'SELECT id_query, topic, statement, query, nb_lines_result, query_number, teacher_login, last_modif_date 
				  FROM bdprojet.queries WHERE id_level ="'.$level.'" ORDER BY query_number';
		$result = $this->_db->query($query);
		$queries=array();
		if($result->rowCount()!=0){
			while($row=$result->fetch()){
				$queries[]= new Query($row->id_query, $row->topic, $row->statement, $row->query, $row->nb_lines_result, $row->query_number, 
						  			  $level, $row->teacher_login, $row->last_modif_date);
			}
		}
		return $queries;
	}
	
	#Definition of method to achieve the student's query
	public function select_student_query($query){
		try{
			$result = $this->_db->query($query);
		}catch (PDOException $e){
			throw new PDOException($e->getMessage());
		}
		$queryAnswer=array(array());		
		$index = 0;
		if($result->rowCount()!=0){
			while($row=$result->fetch()){
				foreach($row as $element){
					$queryAnswer[$index][]= $element;
				}
				$index++;
			}
		}
		return $queryAnswer;
	}
	
	#Definition of method to insert a resolution in database
	public function insert_resolution($resolution){
		$query = 'INSERT INTO bdprojet.resolutions (student_enrollment, id_query, answer) VALUES('.$this->_db->quote($resolution->getStudentEnrollment()).','
				.$resolution->getIdQuery().','.$this->_db->quote($resolution->getAnswer()).')';
		$this->_db->prepare($query)->execute();		
	}
	
	#Definition of method to select a resolution
	public function select_resolution($student_enrollment, $id_query){
		$query = 'SELECT DISTINCT answer FROM bdprojet.resolutions WHERE student_enrollment="'.$student_enrollment.'" AND id_query="'.$id_query.'"';
		$result = $this->_db->query($query);
		$resolution = null;
	
		if($result->rowCount() == 1){
			$row=$result->fetch();
			$resolution = new Resolution($student_enrollment, $id_query, $row->answer);
		}
		return $resolution;
	}
	
	public function update_resolution_answer($resolution){
		$query = 'UPDATE bdprojet.resolutions SET answer='.$this->_db->quote($resolution->getAnswer()).' WHERE student_enrollment="'.$resolution->getStudentEnrollment().
		'" AND id_query="'.$resolution->getIdQuery().'"';
		$this->_db->prepare($query)->execute();
	}
}
?>