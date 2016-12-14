<%-- 
    Document   : loginPage
    Created on : 2016-12-14, 19:53:32
    Author     : Piotr
--%>

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
                <script src="js/logowanie.js"></script>
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
                                                <div id="log_panel">
                                                    <form name="logowanie">
                                                        <label for ="log_username">Nazwa użytkownika:</label>
                                                        <input type="text" id="log_username" name="username" required autofocus>
                                                        <label for="log_password">Hasło:</label>
                                                        <input type="password" id="log_password" name="password" required>
                                                        <div id="log_lower">
                                                            <input type="checkbox"><label class="log_check" for="checkbox">Zapamiętaj mnie!</label>
                                                            <input class="button" type="button" value="Zaloguj" onClick="check();">
                                                            <a href="#">Nie masz konta? Zarejestruj się...</a>
                                                        </div>
                                                    </form>
                                                    
                                                </div>
				</section>
			</div>
		</div>
	<!-- /Main -->


            <%@include file="footer.jsp" %>
	</body>
</html>