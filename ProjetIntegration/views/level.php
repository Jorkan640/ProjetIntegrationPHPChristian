<section class="pageBody">
	<h1>Niveau <?php echo $_GET['level']?></h1>
	<article class="exChoice">
		<form action="index.php?action=level&level=<?php echo $_SESSION['lvl'] ?>" method="post">
			Aller à l'exercice :
			<input type="text" name="queryNumber" id="exNumber" placeholder="<?php echo $_SESSION['currentQuery']+1 ?>">/<?php echo $nbQueries ?>
			<input type="submit" value="GO">
		</form>
		<form action="index.php?action=level&level=<?php echo $_SESSION['lvl'] ?>" method="post">
			<input type="submit" value="&lt;" name="previous">
		</form>
		<form action="index.php?action=level&level=<?php echo $_SESSION['lvl'] ?>" method="post">
			<input type="submit" value="&gt;" name="next">
		</form>
	</article>
	<h3>Ennoncé <?php echo $query->getQueryNumber() ?>:</h3>
	<p id="queState"><?php echo $query->getStatement() ?></p>
	Introduisez ci-dessous votre query pour l'exercice:<br>
	<form action="index.php?action=level&level=<?php echo $_SESSION['lvl'] ?>" method="post" id="student_query">
		<textarea name="student_query" id="textQuery"><?php if(isset($last_answer)) echo $last_answer; ?></textarea><br>
		<input type="submit" value="Lancer le query">
	
	</form>
	
	<?php if(is_array($reponse)){ 
		?>
		<h3>Résultat(s) obtenu(s):</h3>
		<table id="queryAnswer">
			<tbody>
			<?php foreach ($reponse as $tuple){?>
				<tr>
					<?php foreach ($tuple as $element){ ?>
						<td><?php echo $element ?></td>
					<?php } ?>
				</tr>
			<?php } ?>
			</tbody>
		</table>
	<?php }else{ ?>
		<?php echo $reponse ?>
	<?php } ?>
</section>