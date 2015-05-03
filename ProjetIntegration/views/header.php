<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="utf-8">
	<meta name="author" content="MENDES ROSA Christian & LESPINOY Nicolas">
	<meta name="description" content="Site destiné à la réalisation des exercices d'IANARCH, en informatique 1ère année de l'institu Paul Lambin">
	<meta name="keywords" content="IANARCH, Paul Lambin, 1ère année, sql, query">
	<title>IANARCH - Site de réalisation d'exercices de query</title>
	<link rel="stylesheet" type="text/css" href="views/css/style.css">
</head>
<body>
	<header>
		<img alt="Entete site d'IANARCH" src="views/images/ianarch.jpg" id="imgHeader">
		<?php if(!empty($_SESSION['account_kind']) && $_SESSION['account_kind'] == 'student'){ ?>
			<nav>
				<ul>
					<li><a href="index.php">Accueil</a></li>
					<?php foreach ($_SESSION['lvls'] as $level ){?>
						<li><a href="index.php?action=level&level=<?php echo $level->getLevelNumber()?>">Niveau <?php echo $level->getLevelNumber()?></a></li>
					<?php } ?>
					<li><a href="index.php?action=logout">Se déconnecter</a></li>
				</ul>
			</nav>
		<?php } ?>
		<?php if(!empty($_SESSION['account_kind']) && $_SESSION['account_kind'] == 'teacher'){ ?>
			<nav>
				<ul>
					<li><a href="index.php">Accueil</a></li>
					<li><a href="index.php?action=list">Liste des étudiants</a></li>
					<li><a href="index.php?action=change">Modifier un énnoncé</a></li>
					<li><a href="index.php?action=import">Importer un niveau</a><li>
					<li><a href="index.php?action=export">Exporter un niveau</a></li>
					<li><a href="index.php?action=logout">Se déconnecter</a></li>
				</ul>
			</nav>
		<?php } ?>
		
	</header>
	

