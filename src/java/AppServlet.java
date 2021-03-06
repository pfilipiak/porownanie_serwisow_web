/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 *
 * @author Adrian
 */
public class AppServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private String semrush_api_key = "........";
    private Boolean fake_default_rep = true;
    private Boolean fake_basicStats = true;
    private Boolean fake_competitors = true;
    
            
    protected void processServletRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String website = getValueQS("website",request.getQueryString());
            String date = getValueQS("date",request.getQueryString());
        
            APIDataConnector apdata = new APIDataConnector(website, date, semrush_api_key, fake_default_rep);
            
            out.println("<!DOCTYPE html>");
            out.println("<html lang=\"pl\">");
            out.println("<head>");
            out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8>\"");   
            out.println("<title>Servlet DemoServlet</title>");                     
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DemoServlet at " + request.getContextPath() + "</h1>");
            out.println("<h2>QueryString: " + request.getQueryString()+ "</h2>");           
            out.println("<h3>website: " + website + "</h3>");
            out.println("<h3>data: " + date + "</h3>");
            out.println("<p>Dane o raporcie:<br>");
            out.println("- miesiac raportu: " + apdata.getReportDate() + "<br>");
            out.println("- czy live: " + apdata.getIsLive() + "<br>");
            out.println("- liczba encji: <b>" + apdata.getReportSize() + "</b><br>");
            out.println("- przykładowe dane: <br>" + apdata.getReportContent() + "<br>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    
    protected void processRequestToReport1(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String website = getValueQS("website",request.getQueryString());
            String date = getValueQS("date",request.getQueryString());
            
            APIDataConnector apdata = new APIDataConnector(website, date, semrush_api_key, fake_default_rep);
            String[] table = apdata.GChartKeywordTableReport(website, date, 1000);
            String tableHeader = table[0];
            String tableContent = table[1];    
            String posStats = table[2];    
            String volStats = table[3];    

            request.setAttribute("website", website); // This will be available as ${message}
            request.setAttribute("date", date); // This will be available as ${date}
            request.setAttribute("isLive", apdata.getIsLive()); //
            request.setAttribute("reportSize", apdata.getReportSize()); //
            request.setAttribute("tableHeader", tableHeader); //
            request.setAttribute("tableContent", tableContent); //
            request.setAttribute("posStats", posStats); //
            request.setAttribute("volStats", volStats); //
            request.getRequestDispatcher("/reportDemo.jsp").forward(request, response);
        }
    }
 
    
    protected void processRequestToBasicStats(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String website = getValueQS("website",request.getQueryString());
            DataReports apdata = new DataReports(semrush_api_key, fake_basicStats); //true = fake API z local
   
            String[] table = apdata.GChartBasicWebsiteStat(website, 5);
            String tableStatsHeader = table[0];
            String tableCompetitorsHeader = table[1];
            String tableKWsHeader = table[2];
                        
            String tableStatsContent = table[3];
            String tableCompetitorsContent = table[4]; 
            String tableKWsContent = table[5];
            
           //System.out.println(Arrays.toString(table));
            
            request.setAttribute("website", website); // This will be available as ${message}
            request.setAttribute("tableStatsHeader", tableStatsHeader); //
            request.setAttribute("tableCompetitorsHeader", tableCompetitorsHeader); //
            request.setAttribute("tableStatsContent", tableStatsContent); //
            request.setAttribute("tableCompetitorsContent", tableCompetitorsContent); //
            request.setAttribute("tableKWsHeader", tableKWsHeader); //
            request.setAttribute("tableKWsContent", tableKWsContent); //
            request.getRequestDispatcher("/reportBasicStats.jsp").forward(request, response);
        }
    }
        
    
    
     protected void processRequestToCompetitorStats(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String website = getValueQS("website",request.getQueryString());
            String pos = getValueQS("pos",request.getQueryString());
            String vol = getValueQS("vol",request.getQueryString());
            String signVol = "<=";
            DataReports apdata = new DataReports(semrush_api_key, fake_competitors); //true = fake API z local
            int pozycja = Integer.parseInt(pos);
            int wolumen = Integer.parseInt(vol);
            
            if (pos != "") {
                if (pozycja == 1) {pos = "AND position = 1";}
                if (pozycja > 1 && pozycja < 4) {pos = "AND position >= 2 AND position <=3";}
                if (pozycja > 3 && pozycja < 11) {pos = "AND position >= 4 AND position <=10";}
                if (pozycja > 10) {pos = "AND position >= 10";}
                if (pozycja == 0) {pos = "AND position >= 1";}
                
            } 
            
            if (vol != "") {
                if (wolumen <= 5000) {vol = "AND search_volume <=" + vol;}
                if (wolumen >= 5001) {vol = "AND search_volume >=" + vol;}
                if (wolumen == 0) {vol = "AND search_volume >= 1";}

            }
            
            
            String[] tableCompKWs = apdata.GChartCompetitorsWebsiteStat(website, "count(*)", "where brand_fraze='false' "+ pos + vol);
            String tableCompKWsHeader = tableCompKWs[0];
            String tableCompKWsContent = tableCompKWs[1];
 
            String[] tableCompVol = apdata.GChartCompetitorsWebsiteStat(website, "sum(search_volume)", "where brand_fraze='false' "+ pos +  vol);
            String tableCompVolHeader = tableCompVol[0];
            String tableCompVolContent = tableCompVol[1];
           //System.out.println(Arrays.toString(table));
            
            request.setAttribute("website", website); // This will be available as ${message}
            request.setAttribute("tableCompKWsHeader", tableCompKWsHeader); //
            request.setAttribute("tableCompKWsContent", tableCompKWsContent); //

            request.setAttribute("tableCompVolHeader", tableCompVolHeader); //
            request.setAttribute("tableCompVolContent", tableCompVolContent); //
            
            request.getRequestDispatcher("/reportCompetitors.jsp").forward(request, response);
        }
    }
    
     //trends
     protected void processRequestToTrendsStats(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String website = getValueQS("website",request.getQueryString());
            DataReports apdata = new DataReports(semrush_api_key, fake_competitors); //true = fake API z local
            //
            String sqltable = " ";
            
            switch (website) {
                case "saturn.pl" : sqltable = "bp_produkt_saturn"; break;
                case "mediamarkt.pl" : sqltable = "bp_produkt_media_markt"; break;
                case "mediaexpert.pl" : sqltable = "bp_produkt_media_expert"; break;
                case "euro.com.pl" : sqltable = "bp_produkt_euro"; break;
                case "oleole.pl" : sqltable = "bp_produkt_oleole"; break;
                case "morele.net" : sqltable = "bp_produkt_morele"; break;
                //case "ceneo.pl" : sqltable = "bp_produkt_ceneo"; break;
                default: break;
            }
                    
            String query = "Select '"+website+" - Max ruch, frazy na poz. 1' as name, sum(month_1_max_ctr) as \"m-12\", sum(month_2_max_ctr) as \"m-11\", sum(month_3_max_ctr) as \"m-10\", sum(month_4_max_ctr) as \"m-9\", sum(month_5_max_ctr) as \"m-8\", sum(month_6_max_ctr) as \"m-7\", sum(month_7_max_ctr) as \"m-6\", sum(month_8_max_ctr) as \"m-5\", sum(month_9_max_ctr) as \"m-4\", sum(month_10_max_ctr) as \"m-3\", sum(month_11_max_ctr) as \"m-2\", sum(month_12_max_ctr) as \"m-1\" from " + sqltable +
                    " union " +
                    "Select '"+website+" - Ruch, poz. fraz bez zmian' as name, sum(month_1_current_ctr) as \"m-12\", sum(month_2_current_ctr) as \"m-11\", sum(month_3_current_ctr) as \"m-10\", sum(month_4_current_ctr) as \"m-9\", sum(month_5_current_ctr) as \"m-8\", sum(month_6_current_ctr) as \"m-7\", sum(month_7_current_ctr) as \"m-6\", sum(month_8_current_ctr) as \"m-5\", sum(month_9_current_ctr) as \"m-4\", sum(month_10_current_ctr) as \"m-3\", sum(month_11_current_ctr) as \"m-2\", sum(month_12_current_ctr) as \"m-1\" from " + sqltable +
                    " union " +
                    "Select '"+website+" - Max ruch, 10% TOP fraz na poz. 1' as name, \n" +
                    "sum(x.month_1_max_ctr) as \"m-12\", sum(x.month_2_max_ctr) as \"m-11\", sum(x.month_3_max_ctr) as \"m-10\", sum(x.month_4_max_ctr) as \"m-9\", sum(x.month_5_max_ctr) as \"m-8\", sum(x.month_6_max_ctr) as \"m-7\", sum(x.month_7_max_ctr) as \"m-6\", sum(x.month_8_max_ctr) as \"m-5\", sum(x.month_9_max_ctr) as \"m-4\", sum(x.month_10_max_ctr) as \"m-3\", sum(x.month_11_max_ctr) as \"m-2\", sum(x.month_12_max_ctr) as \"m-1\" from (select * from "+sqltable+" group by id, search_volume order by search_volume desc limit (select count(*)/10::bigint from "+sqltable+")) as x; ";
 
            String[] tableTrendsKWs = apdata.GChartTrendsWebsiteStat(website, query);
            String tableTrendsKWsHeader = tableTrendsKWs[0];
            String tableTrendsKWsContent = tableTrendsKWs[1];
            
            
            //
            query = "Select (select recognize_text from d_bp_produkt where id = 1) as name, \n" +
                "sum(month_1_current_ctr) as \"m-12\", sum(month_2_current_ctr) as \"m-11\", sum(month_3_current_ctr) as \"m-10\", sum(month_4_current_ctr) as \"m-9\", sum(month_5_current_ctr) as \"m-8\", sum(month_6_current_ctr) as \"m-7\", sum(month_7_current_ctr) as \"m-6\", sum(month_8_current_ctr) as \"m-5\", sum(month_9_current_ctr) as \"m-4\", sum(month_10_current_ctr) as \"m-3\", sum(month_11_current_ctr) as \"m-2\", sum(month_12_current_ctr) as \"m-1\" from bp_produkt_saturn\n" +
                "union\n" +
                "Select (select recognize_text from d_bp_produkt where id = 2) as name, \n" +
                "sum(month_1_current_ctr) as \"m-12\", sum(month_2_current_ctr) as \"m-11\", sum(month_3_current_ctr) as \"m-10\", sum(month_4_current_ctr) as \"m-9\", sum(month_5_current_ctr) as \"m-8\", sum(month_6_current_ctr) as \"m-7\", sum(month_7_current_ctr) as \"m-6\", sum(month_8_current_ctr) as \"m-5\", sum(month_9_current_ctr) as \"m-4\", sum(month_10_current_ctr) as \"m-3\", sum(month_11_current_ctr) as \"m-2\", sum(month_12_current_ctr) as \"m-1\" from bp_produkt_euro\n" +
                "union\n" +
                "Select (select recognize_text from d_bp_produkt where id = 3) as name, \n" +
                "sum(month_1_current_ctr) as \"m-12\", sum(month_2_current_ctr) as \"m-11\", sum(month_3_current_ctr) as \"m-10\", sum(month_4_current_ctr) as \"m-9\", sum(month_5_current_ctr) as \"m-8\", sum(month_6_current_ctr) as \"m-7\", sum(month_7_current_ctr) as \"m-6\", sum(month_8_current_ctr) as \"m-5\", sum(month_9_current_ctr) as \"m-4\", sum(month_10_current_ctr) as \"m-3\", sum(month_11_current_ctr) as \"m-2\", sum(month_12_current_ctr) as \"m-1\" from bp_produkt_media_expert\n" +
                "union\n" +
                "Select (select recognize_text from d_bp_produkt where id = 4) as name, \n" +
                "sum(month_1_current_ctr) as \"m-12\", sum(month_2_current_ctr) as \"m-11\", sum(month_3_current_ctr) as \"m-10\", sum(month_4_current_ctr) as \"m-9\", sum(month_5_current_ctr) as \"m-8\", sum(month_6_current_ctr) as \"m-7\", sum(month_7_current_ctr) as \"m-6\", sum(month_8_current_ctr) as \"m-5\", sum(month_9_current_ctr) as \"m-4\", sum(month_10_current_ctr) as \"m-3\", sum(month_11_current_ctr) as \"m-2\", sum(month_12_current_ctr) as \"m-1\" from bp_produkt_media_markt\n" +
                "union\n" +
                "Select (select recognize_text from d_bp_produkt where id = 5) as name, \n" +
                "sum(month_1_current_ctr) as \"m-12\", sum(month_2_current_ctr) as \"m-11\", sum(month_3_current_ctr) as \"m-10\", sum(month_4_current_ctr) as \"m-9\", sum(month_5_current_ctr) as \"m-8\", sum(month_6_current_ctr) as \"m-7\", sum(month_7_current_ctr) as \"m-6\", sum(month_8_current_ctr) as \"m-5\", sum(month_9_current_ctr) as \"m-4\", sum(month_10_current_ctr) as \"m-3\", sum(month_11_current_ctr) as \"m-2\", sum(month_12_current_ctr) as \"m-1\" from bp_produkt_morele\n" +
                "union\n" +
                "Select (select recognize_text from d_bp_produkt where id = 6) as name, \n" +
                "sum(month_1_current_ctr) as \"m-12\", sum(month_2_current_ctr) as \"m-11\", sum(month_3_current_ctr) as \"m-10\", sum(month_4_current_ctr) as \"m-9\", sum(month_5_current_ctr) as \"m-8\", sum(month_6_current_ctr) as \"m-7\", sum(month_7_current_ctr) as \"m-6\", sum(month_8_current_ctr) as \"m-5\", sum(month_9_current_ctr) as \"m-4\", sum(month_10_current_ctr) as \"m-3\", sum(month_11_current_ctr) as \"m-2\", sum(month_12_current_ctr) as \"m-1\" from bp_produkt_oleole;\n" +
                "";
            //
            
            String[] tableCompKWs = apdata.GChartTrendsWebsiteStat(website, query);
            String tableCompKWsHeader = tableCompKWs[0];
            String tableCompKWsContent = tableCompKWs[1];
          //
          
           query = "Select (select recognize_text from d_bp_produkt where id = 1) as name, \n" +
                "sum(month_1_roznica) as \"m-12\", sum(month_2_roznica) as \"m-11\", sum(month_3_roznica) as \"m-10\", sum(month_4_roznica) as \"m-9\", sum(month_5_roznica) as \"m-8\", sum(month_6_roznica) as \"m-7\", sum(month_7_roznica) as \"m-6\", sum(month_8_roznica) as \"m-5\", sum(month_9_roznica) as \"m-4\", sum(month_10_roznica) as \"m-3\", sum(month_11_roznica) as \"m-2\", sum(month_12_roznica) as \"m-1\" from bp_produkt_saturn\n" +
                "union\n" +
                "Select (select recognize_text from d_bp_produkt where id = 2) as name, \n" +
                "sum(month_1_roznica) as \"m-12\", sum(month_2_roznica) as \"m-11\", sum(month_3_roznica) as \"m-10\", sum(month_4_roznica) as \"m-9\", sum(month_5_roznica) as \"m-8\", sum(month_6_roznica) as \"m-7\", sum(month_7_roznica) as \"m-6\", sum(month_8_roznica) as \"m-5\", sum(month_9_roznica) as \"m-4\", sum(month_10_roznica) as \"m-3\", sum(month_11_roznica) as \"m-2\", sum(month_12_roznica) as \"m-1\" from bp_produkt_euro\n" +
                "union\n" +
                "Select (select recognize_text from d_bp_produkt where id = 3) as name, \n" +
                "sum(month_1_roznica) as \"m-12\", sum(month_2_roznica) as \"m-11\", sum(month_3_roznica) as \"m-10\", sum(month_4_roznica) as \"m-9\", sum(month_5_roznica) as \"m-8\", sum(month_6_roznica) as \"m-7\", sum(month_7_roznica) as \"m-6\", sum(month_8_roznica) as \"m-5\", sum(month_9_roznica) as \"m-4\", sum(month_10_roznica) as \"m-3\", sum(month_11_roznica) as \"m-2\", sum(month_12_roznica) as \"m-1\" from bp_produkt_media_expert\n" +
                "union\n" +
                "Select (select recognize_text from d_bp_produkt where id = 4) as name, \n" +
                "sum(month_1_roznica) as \"m-12\", sum(month_2_roznica) as \"m-11\", sum(month_3_roznica) as \"m-10\", sum(month_4_roznica) as \"m-9\", sum(month_5_roznica) as \"m-8\", sum(month_6_roznica) as \"m-7\", sum(month_7_roznica) as \"m-6\", sum(month_8_roznica) as \"m-5\", sum(month_9_roznica) as \"m-4\", sum(month_10_roznica) as \"m-3\", sum(month_11_roznica) as \"m-2\", sum(month_12_roznica) as \"m-1\" from bp_produkt_media_markt\n" +
                "union\n" +
                "Select (select recognize_text from d_bp_produkt where id = 5) as name, \n" +
                "sum(month_1_roznica) as \"m-12\", sum(month_2_roznica) as \"m-11\", sum(month_3_roznica) as \"m-10\", sum(month_4_roznica) as \"m-9\", sum(month_5_roznica) as \"m-8\", sum(month_6_roznica) as \"m-7\", sum(month_7_roznica) as \"m-6\", sum(month_8_roznica) as \"m-5\", sum(month_9_roznica) as \"m-4\", sum(month_10_roznica) as \"m-3\", sum(month_11_roznica) as \"m-2\", sum(month_12_roznica) as \"m-1\" from bp_produkt_morele\n" +
                "union\n" +
                "Select (select recognize_text from d_bp_produkt where id = 6) as name, \n" +
                "sum(month_1_roznica) as \"m-12\", sum(month_2_roznica) as \"m-11\", sum(month_3_roznica) as \"m-10\", sum(month_4_roznica) as \"m-9\", sum(month_5_roznica) as \"m-8\", sum(month_6_roznica) as \"m-7\", sum(month_7_roznica) as \"m-6\", sum(month_8_roznica) as \"m-5\", sum(month_9_roznica) as \"m-4\", sum(month_10_roznica) as \"m-3\", sum(month_11_roznica) as \"m-2\", sum(month_12_roznica) as \"m-1\" from bp_produkt_oleole;\n" +
                "";
            
            
            String[] tableCompVol = apdata.GChartTrendsWebsiteStat(website, query);
            String tableCompVolHeader = tableCompVol[0];
            String tableCompVolContent = tableCompVol[1];
           //System.out.println(Arrays.toString(table));
           //tableEst10VolContent
           
           //
            query = "Select (select recognize_text from d_bp_produkt where id = 1) as name, \n" +
                "sum(x.month_1_max_ctr) as \"m-12\", sum(x.month_2_max_ctr) as \"m-11\", sum(x.month_3_max_ctr) as \"m-10\", sum(x.month_4_max_ctr) as \"m-9\", sum(x.month_5_max_ctr) as \"m-8\", sum(x.month_6_max_ctr) as \"m-7\", sum(x.month_7_max_ctr) as \"m-6\", sum(x.month_8_max_ctr) as \"m-5\", sum(x.month_9_max_ctr) as \"m-4\", sum(x.month_10_max_ctr) as \"m-3\", sum(x.month_11_max_ctr) as \"m-2\", sum(x.month_12_max_ctr) as \"m-1\" from (select * from bp_produkt_saturn group by id, search_volume order by search_volume desc limit (select count(*)/10::bigint from bp_produkt_saturn)) as x\n" +
                "union\n" +
                "Select (select recognize_text from d_bp_produkt where id = 2) as name, \n" +
                "sum(x.month_1_max_ctr) as \"m-12\", sum(x.month_2_max_ctr) as \"m-11\", sum(x.month_3_max_ctr) as \"m-10\", sum(x.month_4_max_ctr) as \"m-9\", sum(x.month_5_max_ctr) as \"m-8\", sum(x.month_6_max_ctr) as \"m-7\", sum(x.month_7_max_ctr) as \"m-6\", sum(x.month_8_max_ctr) as \"m-5\", sum(x.month_9_max_ctr) as \"m-4\", sum(x.month_10_max_ctr) as \"m-3\", sum(x.month_11_max_ctr) as \"m-2\", sum(x.month_12_max_ctr) as \"m-1\" from (select * from bp_produkt_euro group by id, search_volume order by search_volume desc limit (select count(*)/10::bigint from bp_produkt_euro)) as x\n" +
                "union\n" +
                "Select (select recognize_text from d_bp_produkt where id = 3) as name, \n" +
                "sum(x.month_1_max_ctr) as \"m-12\", sum(x.month_2_max_ctr) as \"m-11\", sum(x.month_3_max_ctr) as \"m-10\", sum(x.month_4_max_ctr) as \"m-9\", sum(x.month_5_max_ctr) as \"m-8\", sum(x.month_6_max_ctr) as \"m-7\", sum(x.month_7_max_ctr) as \"m-6\", sum(x.month_8_max_ctr) as \"m-5\", sum(x.month_9_max_ctr) as \"m-4\", sum(x.month_10_max_ctr) as \"m-3\", sum(x.month_11_max_ctr) as \"m-2\", sum(x.month_12_max_ctr) as \"m-1\" from (select * from bp_produkt_media_expert group by id, search_volume order by search_volume desc limit (select count(*)/10::bigint from bp_produkt_media_expert)) as x\n" +
                "union\n" +
                "Select (select recognize_text from d_bp_produkt where id = 4) as name, \n" +
                "sum(x.month_1_max_ctr) as \"m-12\", sum(x.month_2_max_ctr) as \"m-11\", sum(x.month_3_max_ctr) as \"m-10\", sum(x.month_4_max_ctr) as \"m-9\", sum(x.month_5_max_ctr) as \"m-8\", sum(x.month_6_max_ctr) as \"m-7\", sum(x.month_7_max_ctr) as \"m-6\", sum(x.month_8_max_ctr) as \"m-5\", sum(x.month_9_max_ctr) as \"m-4\", sum(x.month_10_max_ctr) as \"m-3\", sum(x.month_11_max_ctr) as \"m-2\", sum(x.month_12_max_ctr) as \"m-1\" from (select * from bp_produkt_media_markt group by id, search_volume order by search_volume desc limit (select count(*)/10::bigint from bp_produkt_media_markt)) as x\n" +
                "union\n" +
                "Select (select recognize_text from d_bp_produkt where id = 5) as name, \n" +
                "sum(x.month_1_max_ctr) as \"m-12\", sum(x.month_2_max_ctr) as \"m-11\", sum(x.month_3_max_ctr) as \"m-10\", sum(x.month_4_max_ctr) as \"m-9\", sum(x.month_5_max_ctr) as \"m-8\", sum(x.month_6_max_ctr) as \"m-7\", sum(x.month_7_max_ctr) as \"m-6\", sum(x.month_8_max_ctr) as \"m-5\", sum(x.month_9_max_ctr) as \"m-4\", sum(x.month_10_max_ctr) as \"m-3\", sum(x.month_11_max_ctr) as \"m-2\", sum(x.month_12_max_ctr) as \"m-1\" from (select * from bp_produkt_morele group by id, search_volume order by search_volume desc limit (select count(*)/10::bigint from bp_produkt_morele)) as x\n" +
                "union\n" +
                "Select (select recognize_text from d_bp_produkt where id = 6) as name, \n" +
                "sum(x.month_1_max_ctr) as \"m-12\", sum(x.month_2_max_ctr) as \"m-11\", sum(x.month_3_max_ctr) as \"m-10\", sum(x.month_4_max_ctr) as \"m-9\", sum(x.month_5_max_ctr) as \"m-8\", sum(x.month_6_max_ctr) as \"m-7\", sum(x.month_7_max_ctr) as \"m-6\", sum(x.month_8_max_ctr) as \"m-5\", sum(x.month_9_max_ctr) as \"m-4\", sum(x.month_10_max_ctr) as \"m-3\", sum(x.month_11_max_ctr) as \"m-2\", sum(x.month_12_max_ctr) as \"m-1\" from (select * from bp_produkt_oleole group by id, search_volume order by search_volume desc limit (select count(*)/10::bigint from bp_produkt_oleole)) as x;\n" +
                "";
            
            String[] tableEst10Vol = apdata.GChartTrendsWebsiteStat(website, query);
            String tableEst10VolHeader = tableEst10Vol[0];
            String tableEst10VolContent = tableEst10Vol[1];           
           
           //
            
            request.setAttribute("website", website); // This will be available as ${message}
            request.setAttribute("tableTrendsKWsHeader", tableTrendsKWsHeader); //
            request.setAttribute("tableTrendsKWsContent", tableTrendsKWsContent); //
            
            request.setAttribute("tableCompKWsHeader", tableCompKWsHeader); //
            request.setAttribute("tableCompKWsContent", tableCompKWsContent); //

            request.setAttribute("tableCompVolHeader", tableCompVolHeader); //
            request.setAttribute("tableCompVolContent", tableCompVolContent); //
            
            request.setAttribute("tableEst10VolHeader", tableEst10VolHeader); //
            request.setAttribute("tableEst10VolContent", tableEst10VolContent); //
            
            
            request.getRequestDispatcher("/reportTrends.jsp").forward(request, response);
        }
    }
     
     //end trends
     
     //organic
      protected void processRequestToOrganicStats(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String website = getValueQS("website",request.getQueryString());
            DataReports apdata = new DataReports(semrush_api_key, fake_competitors); //true = fake API z local
            //
            String sqltable = " ";
            
            switch (website) {
                case "saturn.pl" : sqltable = "bp_produkt_saturn_zestawienie"; break;
                case "mediamarkt.pl" : sqltable = "bp_produkt_media_markt_zestawienie"; break;
                case "mediaexpert.pl" : sqltable = "bp_produkt_media_expert_zestawienie"; break;
                case "euro.com.pl" : sqltable = "bp_produkt_euro_zestawienie"; break;
                case "oleole.pl" : sqltable = "bp_produkt_oleole_zestawienie"; break;
                case "morele.net" : sqltable = "bp_produkt_morele_zestawienie"; break;
                //case "ceneo.pl" : sqltable = "bp_produkt_ceneo"; break;
                default: break;
            }
                    
            String query = "select time, traffic from " + sqltable + " order by time asc ";
            String[] tableTrendsKWs = apdata.GChartOrganicWebsiteStat(website, query);
            String tableTrendsKWsHeader = tableTrendsKWs[0];
            String tableTrendsKWsContent = tableTrendsKWs[1];
            //
            
            query = "select time, keywords from " + sqltable + " order by time asc ";
            String[] tableKWs = apdata.GChartOrganicWebsiteStat(website, query);
            String tableKWsHeader = tableKWs[0];
            String tableKWsContent = tableKWs[1];
            //
            
            request.setAttribute("website", website); // This will be available as ${message}
            request.setAttribute("tableTrendsKWsHeader", tableTrendsKWsHeader); //
            request.setAttribute("tableTrendsKWsContent", tableTrendsKWsContent); //
            
            request.setAttribute("tableCompKWsHeader", tableKWsHeader); //
            request.setAttribute("tableCompKWsContent", tableKWsContent); //

            
            request.getRequestDispatcher("/reportOrganic.jsp").forward(request, response);
        }
    }
     
     //ed organic
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs;
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String qs = request.getQueryString();
        if (qs.contains("r=1")) {
            processRequestToReport1(request, response);
        } else if (qs.contains("r=basic")) {
            processRequestToBasicStats(request, response);
        }  
        else if (qs.contains("r=competitor")) {
            processRequestToCompetitorStats(request, response);
        } 
        else if (qs.contains("r=trends")) {
            processRequestToTrendsStats(request, response);
                        
        } 
        else if (qs.contains("r=organic")) {
            processRequestToOrganicStats(request, response);
                        
        } else {
            processServletRequest(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processServletRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String getValueQS(String searchParam, String queryString){
        String qs = "";
        if (queryString != null && queryString.contains(searchParam)) {
            qs = queryString.substring(queryString.indexOf(searchParam));
            qs = qs.split("&")[0];
            qs = qs.split("=")[1].trim();
        }
    
    return qs;
    }
            
}
