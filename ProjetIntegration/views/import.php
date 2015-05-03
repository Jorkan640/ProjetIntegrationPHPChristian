<section class="pageBody">
	<h1>Importer un niveau</h1>
	<p><em>A savoir: Chaque exercice du csv doit se trouver sous le format suivant:</em></p>
	<p class="exForm">Numero de l'exercice; theme; enoncé; query correct; nombre de tuples à obtenir</p>
	<p><em>Tout autre format ne sera pas accepté</em></p>
	<hr>
	<form enctype="multipart/form-data" action="index.php?action=import" method="post" class="forms">
		<ul>
			<li>Selectionnez le niveau dans lequel vous voulez importer des exercices:
			<input type="text" id="level_number" name="lvlNumber"></li>
			<li>Introduisez le nom que vous souhaitez donner à votre niveau (<em>facultatif</em>):
			<input type="text" name="lvlName"></li>
			<li>Selectionnez le fichier .csv à importer:
			<input type="file" name="csvEx"></li>
		</ul>
		<div id="sendB"><input type="submit" value="Importer le niveau"></div>
	</form>
	<hr>
	<p><em><?php echo $message ?></em></p>
</section>