<%-- 
    Document   : reportLoged
    Created on : 2016-12-14, 20:37:56
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
        
	<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row">

					<!-- Sidebar -->
					<%@include file="sidebar.jsp" %>					
					<!-- Content -->
                                        <%@include file="nav_pod.jsp" %>					
					
        				<section>
                                                    <br>
							<header>
                                                            <h2>Statystyki <b>${website}</b></h2>
							</header>
                                              
                                                       
						</section>
					</div>

				</div>
			</div>
		</div>
	<!-- /Main -->

	<%@include file="footer.jsp" %>                
        
	</body>
</html>