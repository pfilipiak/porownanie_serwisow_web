<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Linear by TEMPLATED
    templated.co @templatedco
    Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
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
                
                <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
                <script type="text/javascript">
                    
                  // Load the Visualization API and the corechart package.
                  google.charts.load('current', {'packages':['corechart', 'table']});

                  // Set a callback to run when the Google Visualization API is loaded.
                  //google.charts.setOnLoadCallback(drawChartPos);
                  //google.charts.setOnLoadCallback(drawChartVol);
                  google.charts.setOnLoadCallback(drawTableBasicStats);
                  google.charts.setOnLoadCallback(drawTableCompetitors);
                  google.charts.setOnLoadCallback(drawTableKWs);
                  
                  // Callback that creates and populates a data table,
                  // instantiates the pie chart, passes in the data and
                  // draws it.
                  function drawChartPos() {

                    // Create the data table.
                    var data = new google.visualization.DataTable();
                    data.addColumn('string', 'Topping');
                    data.addColumn('number', 'Slices');
                    data.addRows([ ${posStats} ]);

                    // Set chart options
                    var options = {'title':'Rozkład pozycji z 1000 fraz',
                                   'width':400,
                                   'height':280};

                    // Instantiate and draw our chart, passing in some options.
                    var chart = new google.visualization.PieChart(document.getElementById('chart_pos_div'));
                    chart.draw(data, options);
                  }

                   function drawChartVol() {

                    // Create the data table.
                    var data = new google.visualization.DataTable();
                    data.addColumn('string', 'Topping');
                    data.addColumn('number', 'Slices');
                    data.addRows([ ${volStats} ]);

                    // Set chart options        
                    var options = {'title':'Rozkład wolumenu wyszukań z 1000 fraz',
                                   'width':400,
                                   'height':280};

                    // Instantiate and draw our chart, passing in some options.
                    var chart = new google.visualization.PieChart(document.getElementById('chart_vol_div'));
                    chart.draw(data, options);
                  }
                  //
                  function drawTableBasicStats() {
                    var data = new google.visualization.DataTable();
                    //kolumny
                    ${tableStatsHeader}
                     data.addRows([ ${tableStatsContent} ]);

                    var options = {'title':'Statysyki serwisu',
                                   'page': 'disable',
                                   'showRowNumber': 'true',
                                   'width': '100%',
                                   'height': '50%'};
                    //https://developers.google.com/chart/interactive/docs/gallery/table#configuration-options
                    var table = new google.visualization.Table(document.getElementById('table_div_stats'));
                    table.draw(data, options);
                  }
                  
                   function drawTableCompetitors() {
                    var data = new google.visualization.DataTable();
                    //kolumny
                    ${tableCompetitorsHeader}
                     data.addRows([ ${tableCompetitorsContent} ]);

                    var options = {'title':'Raport konkurencji',
                                   'page': 'disable',
                                   'pageSize': 10,
                                   'showRowNumber': 'true',
                                   'sortColumn': 1,
                                   'sortAscending': false,
                                   'width': '100%',
                                   'height': '50%'};
                    //https://developers.google.com/chart/interactive/docs/gallery/table#configuration-options
                    var table = new google.visualization.Table(document.getElementById('table_div_competitors'));
                    table.draw(data, options);
                  }
                  
                  //
                   function drawTableKWs() {
                    var data = new google.visualization.DataTable();
                    //kolumny
                    ${tableKWsHeader}
                     data.addRows([ ${tableKWsContent} ]);

                    var options = {'title':'Raport konkurencji',
                                   'page': 'disable',
                                   'pageSize': 10,
                                   'showRowNumber': 'true',
                                   'sortColumn': 1,
                                   'sortAscending': false,
                                   'width': '100%',
                                   'height': '50%'};
                    //https://developers.google.com/chart/interactive/docs/gallery/table#configuration-options
                    var table = new google.visualization.Table(document.getElementById('table_div_KWs'));
                    table.draw(data, options);
                  }
                  
                  //
                </script>
                
	</head>
	<body>

	<!-- Header -->
		<div id="header">
			<div id="nav-wrapper"> 
				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li><a href="index.html">Strona główna</a></li>
                                                <li class='active'><a href="./Reports?r=1&website=redcoon.pl&date=201610"">Analiza serwisu</a></li>
                                                <li><a href="#">Subskrypcja</a></li>    
                                                <li><a href="#">Trendy</a></li>
                                                <li><a href="loginPage.html">Logowanie</a></li>
                                                <li>
                                                    <form action="Reports?r=1" method="get">
                                                        <input type="text" name="website" placeholder="Analizuj domenę...">
                                                    </form>
                                                </li>
					</ul>
				</nav>
			</div>
			<div class="container"> 
				
				<!-- Logo -->
				<div id="logo">
					<h1><a href="index.html">Porównywarka serwisów</a></h1>
					<span class="tag">JEDYNE TAKIE NARZĘDZIE SEO NA RYNKU</span>
				</div>
			</div>
		</div>
	<!-- Header --> 

	<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row">

					<!-- Sidebar -->
					<div id="sidebar" class="2u">
						<section>
							<header>
								<h2>Etiam malesuada</h2>
							</header>
							<div class="row">
								<section class="10u">
									<ul class="default">
										<li><a href="#">Donec facilisis tempor</a></li>
										<li><a href="#">Nulla convallis cursus</a></li>
										<li><a href="#">Integer congue euismod</a></li>
										<li><a href="#">Venenatis vulputate</a></li>
										<li><a href="#">Morbi ligula volutpat</a></li>
									</ul>
								</section>
															</div>
						</section>
						<section>
							<header>
								<h2>Mauris vulputate</h2>
							</header>
							<ul class="style">
								<li>
									<p class="posted">May 21, 2014  |  (10 )  Comments</p>
									<p><a href="#">Nullam non wisi a sem eleifend. Donec mattis libero eget urna. Pellentesque viverra enim.</a></p>
								</li>
								<li>
									<p class="posted">May 18, 2014  |  (10 )  Comments</p>
									<p><a href="#">Nullam non wisi a sem eleifend. Donec mattis libero eget urna. Pellentesque viverra enim.</a></p>
								</li>
							</ul>
						</section>
					</div>
					
					<!-- Content -->
					<div id="content" class="10u skel-cell-important">
						<section>
							<header>
                                                            <h2>Statystyki <b>${website}</b></h2>
							</header>
                                                    
                                                    <!-- skrypt reportStat -->
                                                        <!--Div that will hold the pie chart-->
 
                                                        <!--
                                                        <table>
                                                            <tr>
                                                                <td> <div id="chart_pos_div"></div></td>
                                                                <td> <div id="chart_vol_div"></div></td>
                                                            </tr>
                                                        </table>
                                                        -->
                                                        Statystyki serwisu
                                                        <div id="table_div_stats"></div>
                                                        <br><br>
                                                        Konkurencja serwisu
                                                        <div id="table_div_competitors"></div>
                                                                        <br><br>
                                                        Top 10 fraz
                                                        <div id="table_div_KWs"></div>
                                                    
                                                    
						</section>
					</div>

				</div>
			</div>
		</div>
	<!-- /Main -->

	<!-- Tweet -->
		<div id="tweet">
			<div class="container">
				<section>
					<blockquote>&ldquo;Bo być w Internecie, to być albo nie być.&rdquo;</blockquote>
				</section>
			</div>
		</div>
	<!-- /Tweet -->

	<!-- Footer -->
		<div id="footer">
			<div class="container">
				<section>
					<header>
						<h2>Bądźmy w kontakcie</h2>
						<span class="byline">Jeśli masz pytania, skontaktuj się z nami lub odwiedź nas na portalach społecznościowych.</span>
					</header>
					<ul class="contact">
						<li><a href="#" class="fa fa-twitter"><span>Twitter</span></a></li>
						<li class="active"><a href="#" class="fa fa-facebook"><span>Facebook</span></a></li>
						<li><a href="#" class="fa fa-dribbble"><span>Pinterest</span></a></li>
						<li><a href="#" class="fa fa-tumblr"><span>Google+</span></a></li>
					</ul>
				</section>
			</div>
		</div>
	<!-- /Footer -->

	<!-- Copyright -->
		<div id="copyright">
			<div class="container">
				Design: <a href="#">AO&PF&PP</a>
			</div>
		</div>


	</body>
</html>