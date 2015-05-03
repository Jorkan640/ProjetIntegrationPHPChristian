<?php
	class Query{
	
		private $_id;
		private $_topic;
		private $_statement;
		private $_query;
		private $_nb_lines_result;
		private $_query_number;
		private $_id_level;
		private $_teacher_login;
		private $_last_modif_date;
		
		public function __construct($id, $topic, $statement, $query, $nb_lines_result, $query_number, $id_level, $teacher_login, $last_modif_date){
			$this->_id = $id;
			$this->_topic = $topic;
			$this->_statement = $statement;
			$this->_query = $query;
			$this->_nb_lines_result = $nb_lines_result;
			$this->_query_number = $query_number;
			$this->_id_level = $id_level;
			$this->_teacher_login = $teacher_login;
			$this->_last_modif_date = $last_modif_date;
		}
		
		public function getId(){
			return $this->_id;
		}
		
		public function getTopic(){
			return $this->_topic;
		}
		
		public function getStatement(){
			return $this->_statement;
		}
		
		public function getQuery(){
			return $this->_query;
		}
		
		public function getNbLinesResult(){
			return $this->_nb_lines_result;
		}
		
		public function getQueryNumber(){
			return $this->_query_number;
		}
		
		public function getIdLevel(){
			return $this->_id_level;
		}
		
		public function getTeacherLogin(){
			return $this->_teacher_login;
		}
		
		public function getLastModifDate(){
			return $this->_last_modif_date;
		}
		
	}
?>