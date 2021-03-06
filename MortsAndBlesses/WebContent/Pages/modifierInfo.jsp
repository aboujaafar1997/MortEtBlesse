<%@ page language="java" contentType="text/html;  charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="../MortsAndBlesses/Pages/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../MortsAndBlesses/Pages/css/btn.css" />
    <link rel="stylesheet" type="text/css" href="../MortsAndBlesses/Pages/mycss.css" />

    <title>${user.prenom} ${user.nom} - Modifier les info</title>
</head>

<body>
    <!-- ici navbar  -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03"
            aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <img src="../MortsAndBlesses/Pages/images/p.png" height="80px">
        <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item active"><a class="nav-link" href="#">Home
                        <span class="sr-only">(current)</span>
                    </a></li>
                <li class="nav-item"><a class="nav-link disabled" href="/signup.html" tabindex="-1"
                        aria-disabled="true">Crée
                        Compte</a></li>

            </ul>
            <form methode="GET" action="Deconnecte" class="form-inline my-2 my-lg-0">
                <button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Déconnecté</button>
            </form>
            <audio id="track">
                <!-- <source src="http://basichow.com/asserts/interlude.mp3" type="audio/mpeg" /> -->
                <source src="../MortsAndBlesses/Pages/audios/win.mp3" preload="metadata" type="audio/mpeg">
            </audio>

            <div id="player-container">
                <div id="play-pause" class="play">Play</div>
            </div>
            <div class="custom-control custom-switch" style="margin-left: 10px;">
                <input type="checkbox" class="custom-control-input" id="customSwitch1"> <label
                    class="custom-control-label" for="customSwitch1">Dark mode</label>
            </div>
        </div>
    </nav>
    <!-- fin navbar -->
    <!--contenue -->
    <div class="container ">
        <h1 class="d-flex justify-content-center">Modifier votre information</h1>
        <div class="container d-flex justify-content-center"
            style="background-color: rgba(51, 170, 51, .1); width:700px; border-radius: 20px; padding: 20px;">
            
            <form method="POST" action="Information">
				<div class="form-row">
					<div class="form-group">
						<label for="exampleInputEmail1">Nom</label> <input value="${user.nom}" type="text" class="form-control "
                        id="exampleInputEmail1" placeholder="Enter nom" name="nom" required>
	
					</div>
					<div style="padding-left: 40px;"></div>
					<div class="form-group">
	                    <label for="exampleInputEmail1">Prenom</label> <input value="${user.prenom}" type="text" class="form-control "
	                        id="exampleInputEmail1" name="prenom" placeholder="Enter email" required>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group">
	                    <label for="exampleInputEmail1">Email</label> <input type="email" value="${user.email}" class="form-control "
	                        id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="email" required>
					</div>
					<div style="padding-left: 40px;"></div>
					<div class="form-group">
						<label for="exampleInputPassword1">Username</label> <input type="text" value="${user.username}"
							class="form-control" name="username" id="exampleInputPassword1" placeholder="Username" required>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input type="password" value="" 
							class="form-control" name="password" id="exampleInputPassword1" placeholder="Password">
					</div>
					<div style="padding-left: 40px;"></div>
					<div class="form-group">
						<label for="exampleInputPassword1">Date De naissance</label> <input type="date" value="${user.date_de_naissance}"
							class="form-control" name="date_de_naissance" id="exampleInputPassword1" placeholder="date_de_naissance" required>
					</div>
				</div>
				<div class="form-row">
					<div style="margin-left: auto; margin-right: auto;">
						<button type="submit" class="btn btn-primary" style="width: 100px;">Modifier</button>
					</div>
				</div>
			</form>

        </div>
    </div>
    </div>
    <!--Fin-->
    <!-- script -->
    <script src="../MortsAndBlesses/Pages/js/jquery.js"></script>
    <script src="../MortsAndBlesses/Pages/js/bootstrap.js"></script>
    <!-- btn jcript -->
    <script src="../MortsAndBlesses/Pages/js/btnMusic.js"></script>
    <script src="../MortsAndBlesses/Pages/js/othmanejs.js">

    </script>
</body>

</html>