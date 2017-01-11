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
    private String semrush_api_key = "xx2fc....";
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
            DataReports apdata = new DataReports(semrush_api_key, fake_competitors); //true = fake API z local
   
            String[] table = apdata.GChartCompetitorsWebsiteStat(website, 5);
            String tableStatsHeader = table[0];
            String tableCompetitorsHeader = table[1];
            String tableKWsHeader = table[2];
                        
            String tableStatsContent = table[3];
            String tableCompetitorsContent = table[4]; 
            String tableKWsContent = table[5];
            
           //System.out.println(Arrays.toString(table));
            
            request.setAttribute("website", website + "hahah"); // This will be available as ${message}
            request.setAttribute("tableStatsHeader", tableStatsHeader); //
            request.setAttribute("tableCompetitorsHeader", tableCompetitorsHeader); //
            //request.setAttribute("tableStatsContent", tableStatsContent); //
            //request.setAttribute("tableCompetitorsContent", tableCompetitorsContent); //
            request.setAttribute("tableKWsHeader", tableKWsHeader); //
            //request.setAttribute("tableKWsContent", tableKWsContent); //
            request.getRequestDispatcher("/reportCompetitors.jsp").forward(request, response);
        }
    }
    
    
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
