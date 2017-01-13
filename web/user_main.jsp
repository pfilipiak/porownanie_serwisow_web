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
                                                            <div class="form-group">
                                                                                <input class="form-control" id="log_username" placeholder="Nazwa użytkownika lub Email" name="username" type="text">
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <br><input class="form-control" id="log_password" placeholder="Hasło" name="password" type="password" value="">
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
