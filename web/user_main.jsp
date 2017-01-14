<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="include.jsp"/>
<!DOCTYPE HTML>
 
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
        
	<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row">

					<!-- Sidebar -->
					<%@include file="sidebar.jsp" %>					

						<section>
                                                    <shiro:authenticated>
                                                        <header>
                                                            <h2>Strona użytkownika <b><shiro:user><c:out value="${account.givenName}"/></shiro:user></b>!</h2>
                                                        </header>
                                                            <a href="<c:url value="/logout"/>">Wyloguj się</a>
                                                            <div class="user_panel">
                                                                <ul>                                                                   
                                                                    <li>
                                                                        <label for="username">Nazwa użytkownika:</label><br>
                                                                        <input class="form-control" id="user_username" value="<shiro:user><c:out value="${account.username}"/></shiro:user>" name="username" type="text" readonly>
                                                                    </li>
                                                                    <li>
                                                                        <br><label for="givenName">Imię użytkownika:</label><br>
                                                                        <input class="form-control" id="user_name" value="<shiro:user><c:out value="${account.givenName}"/></shiro:user>" name="givenName" type="text" readonly>
                                                                    </li>
                                                                    <li>
                                                                        <br><label for="surName">Nazwisko użytkownika:</label><br>
                                                                        <input class="form-control" id="user_lastname" value="<shiro:user><c:out value="${account.surname}"/></shiro:user>" name="surName" type="text" readonly>
                                                                    </li>
                                                                    <li>
                                                                        <br><label for="email">Email użytkownika:</label><br>
                                                                        <input class="form-control" id="user_email" value="<shiro:user><c:out value="${account.email}"/></shiro:user>" name="lastName" type="text" readonly>
                                                                    </li>
                                                                </ul>
                                                                    <br>
                                                                    
                                                                <header>
                                                                    <h3>Chcesz zmienić hasło?</h2>
                                                                </header>
                                                                
                                                                <div class="user_panel">
                                                                <ul>                                                                   
                                                                    <li>
                                                                        <br><label for="password_alt">Stare hasło:</label><br>
                                                                        <input class="form-control" id="user_password_alt" placeholder="Stare hasło" name="password_alt" type="password" value="">
                                                                    </li>
                                                                    <li>
                                                                        <br><label for="password_new">Nowe hasło:</label><br>
                                                                        <input class="form-control" id="user_password_new" placeholder="Nowe hasło" name="password_new" type="password" value="">
                                                                    </li>
                                                                    <li>
                                                                        <br><label for="password_renew">Wpisz ponoewnie nowe hasło:</label><br>
                                                                        <input class="form-control" id="user_password_renew" placeholder="Powótrz nowe hasło" name="password_renew" type="password" value="">
                                                                    </li>
                                                                    <li>
                                                                        <br><br><input class="button" id="user_button" type="submit" value="Zmień">
                                                                    </li>
                                                                </ul>
                                                                                </div>
                                                    
                                                    
                                                    
                                                </shiro:authenticated>
                                                <shiro:notAuthenticated>
                                                    <header>
                                                        <h2> Strona użytkownika</h2>
                                                    </header>
                                                        <br>
                                                        <h4>Nie jesteś zalogowany. Strona tylko dla zalogowanych użytkowników.</h4>
                                                        <a href="./loginPage.jsp">Zaloguj się</a>
                                                </shiro:notAuthenticated>
                                                    	
                                                    
                                                    
						</section>
					

				</div>
			</div>
		</div>
	<!-- /Main -->

	<%@include file="footer.jsp" %>                
        
	</body>
</html>
