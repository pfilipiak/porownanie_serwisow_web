<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
    @author ppolanowski
-->
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
	<body class="homepage">

	<!-- Header -->
        <%@include file="header.jsp" %>
        
        
	<!-- Featured -->
		<div id="featured">
			<div class="container">
				<header>
					<h2>Porównaj swój serwis z konkurencją, poznaj przyszłość </h2>
                                        <h3>bądź najlepszy, dzięki Porównywarce Serwisów.</h3>
				</header>
				<p>Wpisz adres serwisu i sprawdź nasze możliwości</p>
                                <form action="Reports" method="get">
                                    <input type="hidden" name="r" value="basic">
                                    <input class="find_form" type="text" name="website" placeholder=" Analizuj domenę..." value="">
                                    <input class="button" type="submit" value="Wyślij">
                                </form>

				<hr />
				<div class="row">
					<section class="4u">
						<span class="pennant"><span class="fa fa-briefcase"></span></span>
						<h3>Rozbudowane raporty</h3>
						<p>Zapoznaj się z raportami dotyczącymi Twojej witryny, zamawiaj subskrypcję, analizuj trendy. Zmieniaj się z nami.</p>
						<a href="#" class="button button-style1">Czytaj więcej</a>
					</section>
					<section class="4u">
						<span class="pennant"><span class="fa fa-lock"></span></span>
						<h3>Bezpieczeństwo</h3>
						<p>Szczegółowe dane, analiza konkurencji oraz trendy na przyszłość dostępne tylko dla zalogowanych użytkowników.</p>
						<a href="#" class="button button-style1">Czytaj więcej</a>
					</section>
					<section class="4u">
						<span class="pennant"><span class="fa fa-globe"></span></span>
						<h3>Ogólnoświatowy zasięg</h3>
						<p>Analizuj konkurencję krajową i zagraniczną, buduj międzynarodową strategię w oparciu o zebrane przez nas informacje.</p>
						<a href="#" class="button button-style1">Czytaj więcej</a>
					</section>

				</div>
			</div>
		</div>

	<!-- Main -->
		<div id="main">
			<div id="content" class="container">

				<div class="row">
					<section class="6u">
						<a href="./Reports?r=1&website=redcoon.pl&date=201610" class="image full"><img src="images/pic01.jpg" alt=""></a>
						<header>
							<h2>Redcoon X 2016</h2>
						</header>
						<p>In posuere eleifend odio. Quisque semper augue mattis wisi. Maecenas ligula. Pellentesque viverra vulputate enim. Aliquam erat volutpat. Donec leo, vivamus fermentum nibh in augue praesent a lacus at urna congue rutrum.</p>
					</section>				
					<section class="6u">
						<a href="./Reports?r=1&website=pwr.wroc.pl&date=201610" class="image full"><img src="images/pic02.jpg" alt=""></a>
						<header>
							<h2>Demo raportu</h2>
						</header>
						<p>In posuere eleifend odio. Quisque semper augue mattis wisi. Maecenas ligula. Pellentesque viverra vulputate enim. Aliquam erat volutpat. Donec leo, vivamus fermentum nibh in augue praesent a lacus at urna congue rutrum.</p>
					</section>				
				</div>

				<div class="row">
					<section class="6u">
						<a href="#" class="image full"><img src="images/pic03.jpg" alt=""></a>
						<header>
							<h2>Mauris vulputate dolor</h2>
						</header>
						<p>In posuere eleifend odio. Quisque semper augue mattis wisi. Maecenas ligula. Pellentesque viverra vulputate enim. Aliquam erat volutpat. Donec leo, vivamus fermentum nibh in augue praesent a lacus at urna congue rutrum.</p>
					</section>				
					<section class="6u">
						<a href="#" class="image full"><img src="images/pic04.jpg" alt=""></a>
						<header>
							<h2>Mauris vulputate dolor</h2>
						</header>
						<p>In posuere eleifend odio. Quisque semper augue mattis wisi. Maecenas ligula. Pellentesque viverra vulputate enim. Aliquam erat volutpat. Donec leo, vivamus fermentum nibh in augue praesent a lacus at urna congue rutrum.</p>
					</section>				
				</div>
			
			</div>
		</div>
        
        <%@include file="footer.jsp" %>
               
	</body>
</html>