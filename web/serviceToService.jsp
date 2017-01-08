<%-- 
    Document   : serviceToService
    Created on : 2017-01-04, 18:14:48
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
						<h2>Porównanie serwisu z innym serwisem</h2>
                                        </header>
                                    <div id="featured">
                                        <p>Wpisz adresy serwisów do analizy</p>
                                        <form action="Reports" method="get">
                                            <input type="hidden" name="r" value="basic">
                                            <input class="find_form" type="text" name="website" placeholder="Serwis I" value="">
                                            <input class="find_form" type="text" name="website" placeholder="Serwis II" value="">
                                            <input class="find_form" type="text" name="website" placeholder="Serwis III" value="">
                                            <input class="find_form" type="text" name="website" placeholder="Serwis IV" value="">
                                            <br>
                                            <input class="button" type="submit" value="Wyślij">
                                        </form>

                                    </div>
				</section>
			</div>
		</div>
	<!-- /Main -->


            <%@include file="footer.jsp" %>
	</body>
</html>