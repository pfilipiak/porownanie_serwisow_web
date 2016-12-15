<%-- 
    Document   : hello
    Created on : 2016-12-03, 20:03:49
    Author     : Adrian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
      
    <link rel="stylesheet" type="text/css" href="./files/style.css">
    <!--Load the AJAX API-->
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
                       'width': '70%',
                       'height': '50%'};
        //https://developers.google.com/chart/interactive/docs/gallery/table#configuration-options
        var table = new google.visualization.Table(document.getElementById('table_div'));
        table.draw(data, options);
      }
    </script>
    
  </head>

  <body>
    <ul id="menu-bar">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#">Products</a>
        <ul>
            <li><a href="#">Products Sub Menu 1</a></li>
            <li><a href="#">Products Sub Menu 2</a></li>
        </ul>
        </li>
        <li><a href="#">Services</a>
        <ul>
            <li><a href="#">Services Sub Menu 1</a></li>
            <li><a href="#">Services Sub Menu 2</a></li>
        </ul>
        </li>
        <li><a href="#">About</a></li>
        <li><a href="#">Contact Us</a></li>
    </ul>   
    <!--Div that will hold the pie chart-->
	<h2>raport1.jsp</h2>
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

  </body>
</html>