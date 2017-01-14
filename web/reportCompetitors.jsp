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
                <!--
		<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>
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
	<script type="text/javascript">
		google.charts.load('visualization', '1', { packages: ['controls'] });
		google.charts.setOnLoadCallback(drawKWsCountChart);
		google.charts.setOnLoadCallback(drawVolSumChart);

		function drawKWsCountChart() {
		  var data = new google.visualization.DataTable();

		  ${tableCompKWsHeader}
		  
		  data.addRows([
			${tableCompKWsContent}
		  ]);

		  var columnsTable = new google.visualization.DataTable();
		  columnsTable.addColumn('number', 'colCountKWsIndex');
		  columnsTable.addColumn('string', 'colCountKWsLabel');
		  var initState = {
			selectedValues: []

		  };
		  // put the columns into this data table (skip column 0)
		  for (var i = 1; i < data.getNumberOfColumns(); i++) {
			columnsTable.addRow([i, data.getColumnLabel(i)]);
			// you can comment out this next line if you want to have a default selection other than the whole list
			initState.selectedValues.push(data.getColumnLabel(i));
		  }
		  // you can set individual columns to be the default columns (instead of populating via the loop above) like this:
		  // initState.selectedValues.push(data.getColumnLabel(4));

		  var chart = new google.visualization.ChartWrapper({
			chartType: 'Bar',
			containerId: 'chartCountKWs_div',
			dataTable: data,
			options: {
			  'title': 'Rozkład liczby pozycji',
			  width: 900,
			  height: 400,
                          animation:{
                            duration: 1000,
                            easing: 'out',
                          },
                          vAxis: {minValue:0, maxValue:1000}
			}
		  });

		  var columnFilterCountKWs = new google.visualization.ControlWrapper({
			controlType: 'CategoryFilter',
			containerId: 'colFilterCountKWs_div',
			dataTable: columnsTable,
			options: {
			  filterColumnLabel: 'colCountKWsLabel',
			  ui: {
				label: '',
				allowTyping: false,
				allowMultiple: true,
				allowNone: false
				, selectedValuesLayout: ''
			  }
			},
                        
			state: initState
		  });
				
		  function setChartView() {
			var state = columnFilterCountKWs.getState();
			var row;
			var view = {
			  columns: [0]
			};

			for (var i = 0; i < state.selectedValues.length; i++) {
			  row = columnsTable.getFilteredRows([{
				column: 1,
				value: state.selectedValues[i]
			  }])[0];
			  view.columns.push(columnsTable.getValue(row, 0));
			}
			// sort the indices into their original order
			view.columns.sort(function(a, b) {
			  return (a - b);
			});
			
			chart.setView(view);
			chart.draw();
		  }
		  
		  google.visualization.events.addListener(columnFilterCountKWs, 'statechange', setChartView);

		  setChartView();
		  columnFilterCountKWs.draw();
		}
		 

////////////////////////////////
		function drawVolSumChart() {
		  var data = new google.visualization.DataTable();

		  ${tableCompVolHeader}
		  
		  data.addRows([
                    ${tableCompVolContent}
		  ]);

		  var columnsTable = new google.visualization.DataTable();
		  columnsTable.addColumn('number', 'colSumVolIndex');
		  columnsTable.addColumn('string', 'colSumVolLabel');
		  var initState = {
			selectedValues: []

		  };
		  // put the columns into this data table (skip column 0)
		  for (var i = 1; i < data.getNumberOfColumns(); i++) {
			columnsTable.addRow([i, data.getColumnLabel(i)]);
			// you can comment out this next line if you want to have a default selection other than the whole list
			initState.selectedValues.push(data.getColumnLabel(i));
		  }
		  // you can set individual columns to be the default columns (instead of populating via the loop above) like this:
		  // initState.selectedValues.push(data.getColumnLabel(4));

		  var chart = new google.visualization.ChartWrapper({
			chartType: 'AreaChart',
			containerId: 'chartVolSum_div',
			dataTable: data,
			options: {
			  'title': '',
			  width: 900,
			  height: 400,
                          animation:{
                            duration: 1000,
                            easing: 'out',
                          },
                          vAxis: {minValue:0, maxValue:1000},
                          'legend': 'right'
			}
		  });

		  var columnFilterSumVol = new google.visualization.ControlWrapper({
			controlType: 'CategoryFilter',
			containerId: 'colFilterSumVol_div',
			dataTable: columnsTable,
			options: {
			  filterColumnLabel: 'colSumVolLabel',
			  ui: {
				label: '',
				allowTyping: false,
				allowMultiple: true,
				allowNone: false, 
                                selectedValuesLayout: ''
			  }
			},
			state: initState
		  });
				
		  function setChartView() {
			var state = columnFilterSumVol.getState();
			var row;
			var view = {
			  columns: [0]
			};

			for (var i = 0; i < state.selectedValues.length; i++) {
			  row = columnsTable.getFilteredRows([{
				column: 1,
				value: state.selectedValues[i]
			  }])[0];
			  view.columns.push(columnsTable.getValue(row, 0));
			}
			// sort the indices into their original order
			view.columns.sort(function(a, b) {
			  return (a - b);
			});
			
			chart.setView(view);
			chart.draw();
		  }
		  
		  google.visualization.events.addListener(columnFilterSumVol, 'statechange', setChartView);

		  setChartView();
		  columnFilterSumVol.draw();
		}
		  		 


	</script>
	</head>
	<body>

	<!-- Header -->
        <%@include file="header.jsp" %>           
        <% 
            int p=0;
            if (request.getParameter("pos") != null && request.getParameter("pos").length()>0){
                p = Integer.parseInt(request.getParameter("pos"));
            }
            
            int v=0;
            if (request.getParameter("vol") != null && request.getParameter("vol").length()>0){
                v = Integer.parseInt(request.getParameter("vol"));
            }
        %>
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
                                            <h2>Porównanie konkurencji <b>${website}</b></h2>
                                            
					</header>
                                                    
                                        <table>
                                            <tr><td>
                                                <div id="konkur_poz">
                                                        <form action="./Reports?r=competitor&website=${website}" method="get">
                                                            <input type="hidden" name="r" value="competitor"/>  
                                                            <input type="hidden" name="website" value="${website}"/>  
                                                            <ul class="donate-now">                                                                   
                                                                        <li>
                                                                            <input type="radio" id="pozKonkur_wszystko" value="0" name="pos" 
                                                                                   <%
                                                                                      if (p<1) {
                                                                                            out.print("checked");
                                                                                        }
                                                                                        else {out.print("");}
                                                                                    %>
                                                                                   />
                                                                                <label for="pozKonkur_wszystko">Wszystkie pozycje</label>
                                                                        </li>
                                                                        <li>
                                                                                <input type="radio" id="pozKonkur_top1" value="1" name="pos" 
                                                                                   <%
                                                                                        if (p==1) {
                                                                                            out.print("checked");
                                                                                        }
                                                                                        else {out.print("");}
                                                                                    %>
                                                                                   />
                                                                                <label for="pozKonkur_top1">Pozycja 1</label>
                                                                        </li>
                                                                        <li>
                                                                                <input type="radio" id="pozKonkur_top2-3" value="3" name="pos" 
                                                                                       <%
                                                                                       if (p>1 && p<4 ) {
                                                                                            out.print("checked");
                                                                                        }
                                                                                        else {out.print("");}
                                                                                    %>
                                                                                   />
                                                                                <label for="pozKonkur_top2-3">Pozycje 2-3</label>
                                                                        </li>
                                                                        <li>
                                                                                <input type="radio" id="pozKonkur_top4-10" value="10" name="pos" 
                                                                                       <%
                                                                                      
                                                                                        if (p>3 && p<11) {
                                                                                            out.print("checked");
                                                                                        }
                                                                                        else {out.print("");}
                                                                                    %>
                                                                                   />
                                                                                <label for="pozKonkur_top4-10">Pozycja 4-10</label>
                                                                        </li>
                                                                        <li>
                                                                                <input type="radio" id="pozKonkur_10+" value="100" name="pos" 
                                                                                       <%
                                                                                     
                                                                                        if (p>10) {
                                                                                            out.print("checked");
                                                                                        }
                                                                                        else {out.print("");}
                                                                                    %>
                                                                                   />
                                                                                <label for="pozKonkur_10+">Pozycja 10+</label>
                                                                        </li>
                                                                        <li>
                                                                            <input class="button" id="poz_button" type="submit" value="Zmień" />
                                                                        </li>
                                                                        </ul>
                                                                                   <!--
                                                        </form>
                                                </div>
                                                </td>
                                            </tr>


                                        <tr><td>
                                                <div id="konkur_wol">
                                                        <form class="wolumenKonkur" action=""> 
                                                                                           -->
                                                          <input type="radio" name="vol" value="0" 
                                                                 <%
                                                                    if (v<1) {
                                                                        out.print("checked");
                                                                    }
                                                                    else {out.print("");}
                                                                %>
                                                               /> Dowolny wolumen
                                                          <input type="radio" name="vol" value="5000"
                                                                 <%
                                                                    if (v>0 && v<5001) {
                                                                        out.print("checked");
                                                                    }
                                                                    else {out.print("");}
                                                                %>
                                                               />Wolumen do 5 tys.
                                                          <input type="radio" name="vol" value="5001"
                                                                 <%
                                                                    if (v>5000) {
                                                                        out.print("checked");
                                                                    }
                                                                    else {out.print("");}
                                                                %>
                                                               />Wolumen od 5 tys.
                                                      </form>

                                        </td>
                                        </tr>    
                                        <tr>
                                            <td>
                                                <br>
                                            </td>                                                
                                        </tr>
                                            
                                        <tr><td>
                                            <header>
                                                <h3>Rozkład liczby słów kluczowych</h3>
                                            </header>
                                            <div id="colFilterCountKWs_div"></div>
                                            <br>
                                        </td>
                                        </tr>
                                        <tr><td>
                                                <div id="chartCountKWs_div"></div>
                                                <br>
                                        </td>
                                        </tr>
                                        <tr><td>
                                                <p><a href=#>Drukuj raport</a> lub pobierz w postaci <a href="#">PDF</a> lub <a href="#">CSV</a>.</p>
                                                <br>
                                        </td>
                                        </tr>
                                        
                                        <tr><td>
                                                <header>
                                                    <h3>Rozkład sumy wyszukiwań słów kluczowych</h3>
                                                </header>
                                            </td>
                                        </tr>
                                        
                                    <tr>
                                        <td>
                                                <div id="colFilterSumVol_div"></div>
                                                <br>
                                        </td>
                                        </tr>
                                        <tr><td>
                                                <div id="chartVolSum_div"></div>
                                        </td>
                                        </tr>
                                        </table>
                                                        
                                                          
                                        <p><a href=#>Drukuj raport</a> lub pobierz w postaci <a href="#">PDF</a> lub <a href="#">CSV</a>.</p>
                                                    
				</section>
				</div>

				</div>
			</div>
                
		<!-- /Main -->
	<%@include file="footer.jsp" %>                
        
	</body>
</html>