<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%-- 
    Document   : reportBasicAPI
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
                                   'page': 'enable',
                                   'pageSize': 10,
                                   'showRowNumber': 'true',
                                   'sortColumn': 4,
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
                                                        
                                                        <p><a href="#">Drukuj raport</a> lub pobierz w postaci <a href="#">PDF</a> lub <a href="#">CSV</a>.</p>
                                                    
						</section>
					</div>

				</div>
			</div>
		</div>
	<!-- /Main -->

	<%@include file="footer.jsp" %>                
        
	</body>
</html>