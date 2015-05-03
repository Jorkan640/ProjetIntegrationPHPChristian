<?php

	class Resolution{
		
		private $_student_enrollment;
		private $_id_query;
		private $_answer;
		
		public function __construct($student_enrollment, $id_query, $answer){
			$this->_student_enrollment = $student_enrollment;
			$this->_id_query = $id_query;
			$this->_answer = $answer;
		}
		
		public function getStudentEnrollment(){
			return $this->_student_enrollment;
		}
		
		public function getIdQuery(){
			return $this->_id_query;
		}
		
		public function getAnswer(){
			return $this->_answer;
		}
		
	}

?>