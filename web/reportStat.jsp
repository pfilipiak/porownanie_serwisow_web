<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%-- 
    Document   : reportStat
    Created on : 2016-12-14, 19:33:13
    Author     : Piotr
--%>
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
                  google.charts.setOnLoadCallback(drawChartPos);
                  google.charts.setOnLoadCallback(drawChartVol);
                  google.charts.setOnLoadCallback(drawTable);
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
                  function drawTable() {
                    var data = new google.visualization.DataTable();
                    //kolumny
                    ${tableHeader}
                     data.addRows([ ${tableContent} ]);

                    var options = {'title':'Raport pozycji',
                                   'page': 'enable',
                                   'pageSize': 10,
                                   'showRowNumber': 'true',
                                   'sortColumn': 4,
                                   'sortAscending': false,
                                   'width': '100%',
                                   'height': '50%'};
                    //https://developers.google.com/chart/interactive/docs/gallery/table#configuration-options
                    var table = new google.visualization.Table(document.getElementById('table_div'));
                    table.draw(data, options);
                  }
                </script>
                
	</head>
	<body>

	<!-- Header -->
        <%@include file="header.jsp" %>        

	<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row">

					<!-- Sidebar -->
					<div id="sidebar" class="2u">
						<section>
							<header>
								<h2>Ustawienia</h2>
							</header>
							<div class="row">
								<section class="10u">
									<ul class="default">
										<li><a href="#">Konto użytkownika</a></li>
										<li><a href="#">Klucz dostępu</a></li>
										<li><a href="#">Analizowane domeny</a></li>
										<li><a href="#">Analiza konkurencji</a></li>
										<li><a href="#">Ustaw monitoring i alerty</a></li>
									</ul>
								</section>
															</div>
						</section>
						<section>
							<header>
								<h2>Dane z monitoringu</h2>
							</header>
							<ul class="style">
								<li>
									<p class="posted">Grudzień 12, 2016  |  Allegro.pl</p>
									<p><a href="#">Serwis Allegro.pl odnotował znaczny wzrost ruchu organicznego. Kliknij, aby przejść do raportu.</a></p>
								</li>
								<li>
									<p class="posted">Grudzień 9, 2016  |  MediaExpert.pl</p>
									<p><a href="#">Serwis MediaExpert.pl odnotował znaczny wzrost ruchu organicznego. Kliknij, aby przejść do raportu.</a></p>
								</li>
							</ul>
						</section>
					</div>
					
					<!-- Content -->
					<div id="content" class="10u skel-cell-important">
						<section>
							<header>
								<h2>Przykładowa analiza serwisu</h2>
								<span class="byline">demo</span>
							</header>
							
                                                    
                                                    <!-- skrypt reportStat -->
                                                        <!--Div that will hold the pie chart-->
                                                        <p>Serwis: ${website}<br>
                                                           Data: <b>${date}</b>, czy dane live: <b>${isLive}</b><br>
                                                           Liczba encji ${reportSize}
                                                        </p>
                                                        <table>
                                                            <tr>
                                                                <td> <div id="chart_pos_div"></div></td>
                                                                <td> <div id="chart_vol_div"></div></td>
                                                            </tr>
                                                        </table>
                                                        Lista 1000 fraz:
                                                        <div id="table_div"></div>

                                                    
                                                    
						</section>
					</div>

				</div>
			</div>
		</div>
	<!-- /Main -->

        <%@include file="footer.jsp" %>

	</body>
</html>