<%-- 
    Document   : loginPage
    Created on : 2016-12-14, 19:53:32
    Author     : Piotr
--%>

<jsp:include page="include.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>Porównywarka serwisów</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="najlepsze narzędzie dla specjalistów SEO na rynku" />
		<meta name="keywords" content="" />
		<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>
                <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-panels.min.js"></script>
		<script src="js/init.js"></script>
                <noscript>
			<link rel="stylesheet" href="css/skel-noscript.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-desktop.css" />
		</noscript>
                
                
	</head>
	<body>

	<!-- Header -->
	<%@include file="header.jsp" %>
        
	<!-- /Header --> 

	<!-- Main -->
		<div id="main">
			<div id="content" class="container">
				<section>
					<header>
						<h2>Logowanie</h2>
                                                <br>
                                                <!--
                                                <div id="log_panel">
                                                    <form name="logowanie" action="" method="POST" accept-charset="UTF-8" role="form">
                                                        <label for ="log_username">Nazwa użytkownika:</label>
                                                        <input type="text" id="log_username" placeholder="Nazwa użytkownika lub Email" name="username" type="text" required autofocus>
                                                        <label for="log_password">Hasło:</label>
                                                        <input type="password" id="log_password" placeholder="Hasło" name="password" type="password" value="" required>
                                                        <div id="log_lower">
                                                            <input type="checkbox"><label class="log_check" name="rememberMe" type="checkbox" value="true">Zapamiętaj mnie!</label>
                                                            <br>
                                                            <input class="button" type="button" value="Zaloguj">
                                                            <br><a href="#">Nie masz konta? Zarejestruj się...</a>
                                                        </div>
                                                    </form>
                                                    
                                                </div>
                                                -->
                                                <section class="2u"></section>
                                                
                                                <!-- nowy formularz -->
                                                <section class="6u">
                                                    <div class="log_panel">
                                                        <form name="loginform" action="" method="POST" accept-charset="UTF-8" role="form">
                                                            <fieldset>
                                                                <div class="form-group">
                                                                    <input class="form-control" id="log_username" placeholder="Nazwa użytkownika lub Email" name="username" type="text">
                                                                </div>
                                                                <div class="form-group">
                                                                    <br><input class="form-control" id="log_password" placeholder="Hasło" name="password" type="password" value="">
                                                                </div>
                                                                <div class="checkbox" id="log_lower">
                                                                    <label>
                                                                        <input name="rememberMe" type="checkbox" value="true"> Pamiętaj mnie<br>
                                                                    </label>
                                                                </div>
                                                                <input class="button" id="log_button" type="submit" value="Zaloguj">
                                                                <br><a href="#">Nie masz konta? Zarejestruj się...</a>
                                                            </fieldset>
                                                        </form>
                                                    </div>
                                                </div>
                                                </section>
                                                <!-- koniec formularza -->
				</section>
			</div>
		</div>
	<!-- /Main -->
            <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
            <script src="https://code.jquery.com/jquery.js"></script>
            <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>
            <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
            <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
            <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
            <![endif]-->

        <%@include file="footer.jsp" %>
            
	</body>
</html>