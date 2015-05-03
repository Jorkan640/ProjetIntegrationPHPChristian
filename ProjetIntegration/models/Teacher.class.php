<?php

	class Teacher{
		
		private $_login;
		private $_name;
		private $_first_name;
		private $_password;
		
		public function __construct($login, $name, $first_name, $password){
			$this->_login = $login;
			$this->_name = $name;
			$this->_first_name = $first_name;
			$this->_password = $password;
		}
		
		public function getLogin(){
			return $this->_login;
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