<section class="pageBody">
	<h1>Exporter un niveau</h1>
	<p>Sur cette page vous pourrez exporter les exercices d'un niveau sur un fichier de format .csv . Les exercices seront contenus sous le format suivant:<p>
	<p class="exForm">Numero de l'exercice; theme; enoncé; query correct; nombre de tuples à obtenir</p>
	<p>Veuillez completer les cases ci-dessous afin de réaliser l'exportation du niveau</p>
	<hr>
	<form enctype="multipart/form-data" action="index.php?action=export" method="post" class="forms">
		<ul>
			<li>Selectionnez le niveau dans lequel vous voulez exporter des exercices:
			<input type="text" id="level_number" name="lvlExport"></li>
			
			<!-- <li>Selectionnez l'adresse dans laquelle vous voulez exporter le fichier:
			<input type="file" name="savePath" nwsaveas ></li> -->
			
		</ul>
		<div id="sendB"><input type="submit" value="Exporter le niveau"></div>
	</form>
	<hr>
	<em><?php echo $message ?></em>

</section>