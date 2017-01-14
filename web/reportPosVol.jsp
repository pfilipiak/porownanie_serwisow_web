<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%-- 
    Document   : reportPosVol
    Created on : 2016-12-14, 19:33:13
    Author     : Piotr
--%>
<html>
	<head>
		<title>Pozycja i wolumen - Porównywarka serwisów</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="najlepsze narzędzie dla specjalistów SEO na rynku" />
		<meta name="keywords" content="" />
		<!-- <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
                 -->
		<script src="js/skel.min.js"></script>
		<script src="js/skel-panels.min.js"></script>
		<script src="js/init.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel-noscript.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-desktop.css" />
		</noscript>
                
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
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
                                            <h2>Pozycja i wolumen <b>${website}</b></h2>
					</header>
                                        <a href="#" class="image full"><img src="images/posVol.png" alt=""></a>
                                        
                                        <br><p><a href=#>Drukuj raport</a> lub pobierz w postaci <a href="#">PDF</a> lub <a href="#">CSV</a>.</p>
                                                    
				</section>
				</div>

				</div>
			</div>
		<!-- /Main -->

	<%@include file="footer.jsp" %>                
        
	</body>
</html>