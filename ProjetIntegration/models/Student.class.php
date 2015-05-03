<?php

	class Student{
		
		private $_enrollment;
		private $_name;
		private $_first_name;
		private $_password;
		
		public function __construct($enrollment, $name, $first_name, $password){
			$this->_enrollment = $enrollment;
			$this->_name = $name;
			$this->_first_name = $first_name;
			$this->_password = $password;
		}
		
		public function getEnrollment(){
			return $this->_enrollment;
		}
		
		public function getName(){
			return $this->_name;
		}
		
		public function getFirstName(){
			return $this->_first_name;
		}
		
		public function getPassword(){
			return $this->_password;
		}
		
	}

?>