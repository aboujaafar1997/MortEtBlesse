<%@ page language="java" contentType="text/html;  charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" type="text/css"
	href="../MortsAndBlesses/Pages/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="../MortsAndBlesses/Pages/css/btn.css" />
<link rel="stylesheet" type="text/css"
	href="../MortsAndBlesses/Pages/mycss.css" />

    <style>
    .lds-ellipsis {
  display: inline-block;
  position: relative;
  width: 80px;
  height: 80px;
}
.lds-ellipsis div {
  position: absolute;
  top: 33px;
  width: 13px;
  height: 13px;
  border-radius: 50%;
  background: yellow;
  animation-timing-function: cubic-bezier(0, 1, 1, 0);
}
.lds-ellipsis div:nth-child(1) {
  left: 8px;
  animation: lds-ellipsis1 0.6s infinite;
}
.lds-ellipsis div:nth-child(2) {
  left: 8px;
  animation: lds-ellipsis2 0.6s infinite;
}
.lds-ellipsis div:nth-child(3) {
  left: 32px;
  animation: lds-ellipsis2 0.6s infinite;
}
.lds-ellipsis div:nth-child(4) {
  left: 56px;
  animation: lds-ellipsis3 0.6s infinite;
}
@keyframes lds-ellipsis1 {
  0% {
    transform: scale(0);
  }
  100% {
    transform: scale(1);
  }
}
@keyframes lds-ellipsis3 {
  0% {
    transform: scale(1);
  }
  100% {
    transform: scale(0);
  }
}
@keyframes lds-ellipsis2 {
  0% {
    transform: translate(0, 0);
  }
  100% {
    transform: translate(24px, 0);
  }
}


    </style>
    <title>Document</title>
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

            </ul>
            <form class="form-inline my-2 my-lg-0">
                <audio id="track">
                    <!-- <source src="http://basichow.com/asserts/interlude.mp3" type="audio/mpeg" /> -->
                    <source src="../MortsAndBlesses/Pages/audios/win.mp3" preload="metadata" type="audio/mpeg">
                </audio>

                <div id="player-container">
                    <div id="play-pause" class="play">Play</div>
                </div>
            </form>
            <div class="custom-control custom-switch" style="margin-left: 10px;">
                <input type="checkbox" class="custom-control-input" id="customSwitch1"> <label
                    class="custom-control-label" for="customSwitch1">Dark mode</label>
            </div>
        </div>
    </nav>
    <!-- fin navbar -->
    <!--contenue -->
    <br />
    <br />
    <div class="container ">
    	<c:if test="${ jouer.id_u1 != 0 && jouer.id_u2 == 0 && jouer.nombre_u1 == 0 && jouer.nombre_u2 == 0 }">
    		<script type="text/javascript">
				var url = (location.host+location.pathname).replace("Game_generate_room", "websocketredirection/${jouer.room}/${jouer.id_u1}");

				var webSocket = new WebSocket("ws://"+url);
		
				webSocket.onerror = function(event) {
					onError(event);
				};
		
				webSocket.onopen = function(event) {
					onOpen(event);
				};
		
				webSocket.onmessage = function(event) {
					onMessage(event);
				};
		
				function onMessage(event) {
					if(event.data=="Go to choose number"){
						location.href=(location.protocol+"//"+location.host+location.pathname).replace("Game_generate_room", "Game_choose_nombre");
					}
				}
		
				function onOpen(event) {
					
				}
		
				function onError(event) {
					location.href=(location.protocol+"//"+location.host+location.pathname).replace("Game_generate_room", "Profile");
				}

				function send() {
					
				}
			</script>
    	</c:if>
    	
    	
    	<c:if test="${ jouer.id_u1 != 0 && jouer.id_u2 != 0  && jouer.nombre_u1 == 0 && jouer.nombre_u2 == 0 }">
    		<script type="text/javascript">
				
				var url = (location.host+location.pathname).replace("Game_join_room", "websocketredirection/${jouer.room}/${jouer.id_u2}");

				var webSocket = new WebSocket("ws://"+url);
		
				webSocket.onerror = function(event) {
					onError(event);
				};
		
				webSocket.onopen = function(event) {
					onOpen(event);
				};
		
				webSocket.onmessage = function(event) {
					onMessage(event);
				};
		
				function onMessage(event) {
					
				}
		
				function onOpen(event) {
					webSocket.send("Go to choose number");
					location.href=(location.protocol+"//"+location.host+location.pathname).replace("Game_join_room", "Game_choose_nombre");
				}
		
				function onError(event) {
					location.href=(location.protocol+"//"+location.host+location.pathname).replace("Game_join_room", "Profile");
				}

				function send() {
					
				}
			</script>
    	</c:if>
    	
    	<c:choose>
    		<c:when test="${ jouer.id_u1 != 0 && jouer.id_u2 != 0  && jouer.nombre_u1 != 0 && jouer.nombre_u2 != 0 }">
    			<script type="text/javascript">
					var url = (location.host+location.pathname).replace("Game_choose_nombre", "websocketredirection/${jouer.room}/${user.id_u}");
	
					var webSocket = new WebSocket("ws://"+url);
			
					webSocket.onerror = function(event) {
						onError(event);
					};
			
					webSocket.onopen = function(event) {
						onOpen(event);
					};
			
					webSocket.onmessage = function(event) {
						onMessage(event);
					};
			
					function onMessage(event) {
						
					}
			
					function onOpen(event) {
						webSocket.send("Go to play");
						location.href=(location.protocol+"//"+location.host+location.pathname).replace("Game_choose_nombre", "Game_play");
					}
			
					function onError(event) {
						location.href=(location.protocol+"//"+location.host+location.pathname).replace("Game_choose_nombre", "Profile");
					}
	
					function send() {
						
					}
				</script>
    		</c:when>
    		<c:when test="${ jouer.id_u1 != 0 && jouer.id_u2 != 0  && (jouer.nombre_u1 != 0 || jouer.nombre_u2 != 0) }">
    			<script type="text/javascript">
					var url = (location.host+location.pathname).replace("Game_choose_nombre", "websocketredirection/${jouer.room}/${user.id_u}");
	
					var webSocket = new WebSocket("ws://"+url);
			
					webSocket.onerror = function(event) {
						onError(event);
					};
			
					webSocket.onopen = function(event) {
						onOpen(event);
					};
			
					webSocket.onmessage = function(event) {
						onMessage(event);
					};
			
					function onMessage(event) {
						if(event.data=="Go to play"){
							location.href=(location.protocol+"//"+location.host+location.pathname).replace("Game_choose_nombre", "Game_play");
						}
					}
			
					function onOpen(event) {
						
					}
			
					function onError(event) {
						location.href=(location.protocol+"//"+location.host+location.pathname).replace("Game_choose_nombre", "Profile");
					}
	
					function send() {
						
					}
				</script>
    		</c:when>
    	</c:choose>
    	
   
        <table style="width: 100%;">
        	<tr>
        		<td><h2 class="">Room ID : <strong>${jouer.room}</strong></h2></td>
        		<td align="left">
        			<form method="GET" action="Profile">
        				<button type="submit" class="btn btn-danger"  style="">Sortie</button>
        			</form>
        		</td>
        	</tr>
        </table>
        <div class="container d-flex justify-content-center"></div>
		<br><br><br>
		
		<br>
        <br>


    </div>
    <div>
    	<c:if test="${ jouer.id_u1 != 0 && jouer.id_u2 == 0 && jouer.nombre_u1 == 0 && jouer.nombre_u2 == 0 }">
    		<h3 style="text-align: center;">Attendez le deuxième joueur ...</h3>
    	</c:if>
    	<c:if test="${ (jouer.id_u1 != 0 && jouer.id_u2 != 0) && (jouer.nombre_u1 == 0 || jouer.nombre_u2 == 0)}">
    		<h3 style="text-align: center;">Attendez le deuxième joueur pour choisir son numéro ...</h3>
    	</c:if>
    	<center><div class="lds-ellipsis"><div></div><div></div><div></div><div></div></div></center>
    </div>
    <!-- Fin de page -->
    <!-- script -->
    <script src="../MortsAndBlesses/Pages/js/jquery.js"></script>
    <script src="../MortsAndBlesses/Pages/js/bootstrap.js"></script>
    <!-- btn jcript -->
    <script src="../MortsAndBlesses/Pages/js/btnMusic.js"></script>
    <script src="../MortsAndBlesses/Pages/js/othmanejs.js">
    </script>
   
</body>

</html>