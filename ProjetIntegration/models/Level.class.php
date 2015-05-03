<?php

	class Level{
		
		private $_id_level;
		private $_name;
		private $_level_number;
		
		public function __construct($id_level, $name, $level_number){
			$this->_id_level = $id_level;
			$this->_name = $name;
			$this->_level_number = $level_number;
		}
		
		public function getIdLevel(){
			return $this->_id_level;
		}
		
		public function getName(){
			return $this->_name;
		}
		
		public function getLevelNumber(){
			return $this->_level_number;
		}
		
	}

?>