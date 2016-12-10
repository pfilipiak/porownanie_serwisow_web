
import java.io.UnsupportedEncodingException;
import porownanie_serwisow.api.APIData;
import porownanie_serwisow.api.SemrushAPIConnector;
import java.nio.charset.Charset;
import java.util.*;
import porownanie_serwisow.api.APIWebsiteCompetitors;
import porownanie_serwisow.api.APIWebsitePhrases;
import porownanie_serwisow.api.APIWebsiteStats;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Adrian
 */
public class APIDataConnector {
    
    private Boolean IsLive;
    private String reportDate;
    private String reportContent;
    private Integer reportSize;
    private String apiKey = "";
 

    public APIDataConnector(String website, String date, String apiKey) {

        SemrushAPIConnector sem = new SemrushAPIConnector(apiKey);  
        sem.testMode = true;
        Long credits = sem.TestAPIKey();
        if (credits >= 0L) this.apiKey = apiKey;
        
        System.out.println("credits:" + credits);
        Boolean testMode = false;
         // private Boolean testMode = true; w SemRushAPIConnector + urle do danych temp
         
        if (testMode == true){ 
            APIData onlyTest = new APIData();           
            sem.getWebsitePhrasesReport(onlyTest, website, "pl", date, 3); //top 5 fraz    
            String tempContent = onlyTest.printAPIWebsitePhrases(5);
            //System.out.println(tempContent);
            
            try {
              byte[] byteText = tempContent.getBytes(Charset.forName("ISO-8859-2"));
              tempContent = new String(byteText , "UTF-8");
            } catch (UnsupportedEncodingException e){
            System.err.println("Błąd kodowania: " + e);
            }
            //dane testowe
            this.reportContent = tempContent.replaceAll("\r\n", "<br>");
            this.IsLive = onlyTest.getIsLive();
            this.reportDate = onlyTest.getDate();
            this.reportSize = onlyTest.getResultsWebsitePhrases().size();
            //raport fraz
            
        }
            
        
    }
    
    public String[] GChartKeywordTableReport(String website, String date, Integer rows){
        
        String table[] = new String[4];
        table[0] = "data.addColumn('string', 'Keyword');\r\n" +
                   "data.addColumn('string', 'URL');\r\n" + 
                   "data.addColumn('number', 'Pos');\r\n" +
                   "data.addColumn('number', 'Vol');\r\n" +
                   "data.addColumn('number', 'Tr. Share (%)');\r\n";
        
        table[1] = "";
        table[2] = "";
        table[3] = "";
        
        Integer top1 = 0;
        Integer top2 = 0;
        Integer top3 = 0;       
        Integer top10 = 0;
        Integer top10plus = 0;
        Integer volLow = 0;
        Integer volMed = 0;
        Integer volHigh = 0;
        
        SemrushAPIConnector sem = new SemrushAPIConnector(this.apiKey);  
        sem.testMode = true;
        Boolean testMode = true;
         // private Boolean testMode = true; w SemRushAPIConnector + urle do danych temp
         
        if (testMode){
            APIData onlyTest = new APIData();           
            sem.getWebsitePhrasesReport(onlyTest, website, "pl", date, rows); //top 5 fraz
            Map<String[], APIWebsitePhrases> map = onlyTest.getResultsWebsitePhrases();
            Integer cc = 1;  
            if (map != null) {
                for (String[] key : map.keySet()) {
                    //map.get(key)....
                    table[1] += "['" + map.get(key).getPhrase() + "', " + 
                                "'" + map.get(key).getUrl() + "', " + 
                                "{v:" + map.get(key).getPosition() + "}, " + 
                                "{v:" + map.get(key).getVolumen()+ "}, " + 
                                "{v:" + map.get(key).getTrafficShare() + "}],\r\n";
                    
                   switch(map.get(key).getPosition()){
                       case 1: top1++; break;
                       case 2: top2++; break;
                       case 3: top3++; break;
                       default: 
                           if (map.get(key).getPosition()<11){top10++;}
                           else top10plus++;
                   }
                           
                   if (map.get(key).getVolumen() < 500) volLow++;
                   else
                   if (map.get(key).getVolumen() < 5000) volMed++;
                   else volHigh++;
                   
                    if (cc >= rows) break;
                    cc++;    
                }
             }
            
            table[1] = table[1].trim();
            table[1] = table[1].substring(0, table[1].length()-1);
            table[2] = "['Poz 1', "+ top1 +"]," + 
                       "['Poz 2', "+ top2 +"],"+
                       "['Poz 3', "+ top3 +"],"+
                       "['Poz 4-10', "+ top10 +"],"+
                       "['Poz 10+', "+ top10plus +"]";
            
            table[3] = "['Vol < 500', "+ volLow +"]," + 
                       "['Vol 500 - 5k', "+ volMed +"],"+
                       "['Vol 5k+', "+ volHigh +"]"; 
        }
        //System.out.println(table[3]);
        return table;
    }
    
      public String[] GChartBasicWebsiteStat(String website, Integer competitors){
        String table[] = new String[4];
        table[0] = "data.addColumn('string', 'Domain');\r\n" +
                   "data.addColumn('string', 'Data');\r\n" + 
                   "data.addColumn('number', 'Keywords');\r\n" +
                   "data.addColumn('number', 'Traffic');\r\n";
        
        table[1] = "data.addColumn('string', 'Competitor');\r\n" +
                   "data.addColumn('number', 'Relevance');\r\n" +
                   "data.addColumn('number', 'Common Keywords');\r\n" +
                   "data.addColumn('number', 'Keywords');\r\n" +
                   "data.addColumn('number', 'Traffic');\r\n";
        
        table[2] = ""; //dane do table 0
        table[3] = ""; //dane do table 1
              
        SemrushAPIConnector sem = new SemrushAPIConnector(this.apiKey);  
        sem.testMode = false;
        Boolean testMode = false;
         // private Boolean testMode = true; w SemRushAPIConnector + urle do danych temp
         if (testMode == false) {
            APIData apiDirect = new APIData(); 
            sem.getWebsiteStatsReport(apiDirect, website, "pl", true); //top 5 fraz
            Map<String[], APIWebsiteStats> websiteStat = apiDirect.getResultsWebsiteStats();
            //System.out.println("ss:" + apiDirect.printAPIWebsiteStats()); 
            sem.getWebsiteCompetitorsReport(apiDirect, website, "pl", competitors); //top 5 fraz
            Map<String[], APIWebsiteCompetitors> websiteComp = apiDirect.getResultsWebsiteCompetitors();
            //System.out.println("cc:" + apiDirect.printAPIWebsiteCompetitors()); 
            
                if (websiteStat != null) {
                    for (String[] key : websiteStat.keySet()) {
                        table[2] += "['" + websiteStat.get(key).getWebsite() + "', " + 
                                    "'" + websiteStat.get(key).getDataYYYYMM() + "', " + 
                                    "{v:" + websiteStat.get(key).getKeywords() + "}, " + 
                                    "{v:" + websiteStat.get(key).getTraffic() + "}],\r\n";
                    }
                }

                if (websiteComp != null) {
                      for (String[] key : websiteComp.keySet()) {
                          table[3] += "['" + websiteComp.get(key).getCompetitor() + "', " + 
                                      "{v:" + websiteComp.get(key).getRelevance() + "}, " + 
                                      "{v:" + websiteComp.get(key).getCommonKeywords() + "}, " + 
                                      "{v:" + websiteComp.get(key).getKeywords() + "}, " + 
                                      "{v:" + websiteComp.get(key).getTraffic() + "}],\r\n";
                      }
                  }

         }

        
        //System.out.println(table[3]);
        return table;
    }
    

    public Boolean getIsLive() {
        return IsLive;
    }
    
    public String getReportDate() {
        return reportDate;
    }

    public String getReportContent() {
        return reportContent;
    }

    public Integer getReportSize() {
        return reportSize;
    }
  
    
    
    
}
