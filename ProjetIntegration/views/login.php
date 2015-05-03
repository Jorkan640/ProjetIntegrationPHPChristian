	<section id="loginBody">
		<?php echo $message ?>
		<form action="index.php" method="post">
			Login : <input type="text" name="login"><br>
			Mot de passe : <input type="password" name="pwd"><br>
			Type de compte: <input type="radio" name="account_kind" value="student_account"> Élève
							<input type="radio" name="account_kind" value="teacher_account"> Professeur<br>
			<input type="submit" value="Se connecter">
		</form>	
	
	</section>