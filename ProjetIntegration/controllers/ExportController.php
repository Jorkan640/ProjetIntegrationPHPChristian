<?php

	class ExportController{
		
		public function __construct(){
			
		}
		
		public function run(){
			$message="";
			if(!empty($_POST['lvlExport'])){
				$level_existance = Db::getInstance()->select_level($_POST['lvlExport']);
				if($level_existance != null){
					$queries = Db::getInstance()->select_queries($_POST['lvlExport']);
					$horodatage = str_replace(".", "", microtime(true));
					$csvfile = $horodatage.'niveau'.$_POST['lvlExport'].'.csv';
					$this->export_level($queries, $csvfile);
					$message = 'Le niveau a bien été exporté.';
				}else{
					$message = 'Le niveau que vous voulez exporter n\'existe pas';
				}
			}
			
			
			#Call of the page export.php
			require_once VIEWS_PATH.'export.php';
		}
		
		public function export_level($queries_array,$csvfile) {
			$fp = fopen($csvfile,'w');
			$head_line="num;theme;enonce;query;nb\n";
			fwrite($fp, $head_line);
			foreach ($queries_array as $query) {
				$line = $query->getQueryNumber() . ';' . $query->getTopic() . ';' . $query->getStatement(). ';' . $query->getQuery(). ';' . 
						 $query->getNbLinesResult() ."\n";
				fwrite($fp,$line);
			}
			fclose($fp);
		}
		
	}

?>