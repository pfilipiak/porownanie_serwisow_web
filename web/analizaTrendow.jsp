<%-- 
    Document   : analizaSerwisu
    Created on : 2016-12-14, 23:52:07
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
						<h2>Analiza Trendów</h2>
                                        </header>
                                    <div class="row">
					<section class="6u">
                                            <a href="#" class="image full"><img src="images/trends_edited.jpg" alt=""></a>
					</section>				
					<section class="6u">
                                             <a href="#" class="image full"><img src="images/trends2_edited.jpg" alt=""></a>
					</section>				
                                    </div>
                                    <div id="featured">
                                        <header>
                                            <h3> Chcesz zapoznać się z przygotowaną przez nas analizą trendów Twojego serwisu na tle konkurencji? </h3>
                                        </header>
                                        
                                            <p>Wpisz adres serwisu do analizy</p>
                                        <form action="Reports" method="get">
                                            <input type="hidden" name="r" value="trends">
                                            <input class="find_form" type="text" name="website" placeholder=" Wpisz domenę do analizy trendów..." value="">
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