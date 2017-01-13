
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import porownanie_serwisow.api.APIData;
import porownanie_serwisow.api.APIWebsiteCompetitors;
import porownanie_serwisow.api.APIWebsitePhrases;
import porownanie_serwisow.api.APIWebsiteStats;
import porownanie_serwisow.api.SemrushAPIConnector;
import porownanie_serwisow.db.dbConnector;
import java.util.Arrays;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Adrian
 */
public class DataReports {
    
    private Boolean IsLive;
    private String reportDate;
    private String reportContent;
    private Integer reportSize;
    private String apiKey = "";
    private Boolean testMode = false;

    public DataReports(String apiKey, Boolean testMode) {
        this.testMode = testMode;
        this.apiKey = apiKey;
    }
    
    
    public String[] GChartKeywordTableReport(String website, String date, Integer rows){
        
        String table[] = new String[4];
        table[0] = "data.addColumn('string', 'Słowo kluczowe');\r\n" +
                   "data.addColumn('string', 'Adres URL');\r\n" + 
                   "data.addColumn('number', 'Pozycja');\r\n" +
                   "data.addColumn('number', 'Wolumen');\r\n" +
                   "data.addColumn('number', 'Udział ruchu (%)');\r\n";
        
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
        
        Boolean dbData = true; //dorobić sprawdzenie czy dane w DB czy do pobrania z API. Do prezki biore z DB
         
        if (dbData){
            APIData appData = new APIData();           
            
            Map<String[], APIWebsitePhrases> map = appData.getResultsWebsitePhrases();
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
    
    // powazne funkcje:) //
    
      public String[] GChartBasicWebsiteStat(String website, Integer competitors){
        String table[] = new String[6];
        //staty
        table[0] = "data.addColumn('string', 'Domena');\r\n" + 
                   "data.addColumn('string', 'Data');\r\n" + 
                   "data.addColumn('number', 'Słowo kluczowe');\r\n" +
                   "data.addColumn('number', 'Ruch');\r\n";
        //konkur
        table[1] = "data.addColumn('string', 'Konkurent');\r\n" +
                   "data.addColumn('number', 'Stosowność');\r\n" +
                   "data.addColumn('number', 'Wspólne słowa kluczowe');\r\n" +
                   "data.addColumn('number', 'Słowo kluczowe');\r\n" +
                   "data.addColumn('number', 'Ruch');\r\n";
        
        //frazy
        table[2] = "data.addColumn('string', 'Słowo kluczowe');\r\n" +
                   "data.addColumn('string', 'Adres URL');\r\n" + 
                   "data.addColumn('number', 'Pozycja');\r\n" +
                   "data.addColumn('number', 'Wolumen');\r\n" +
                   "data.addColumn('number', 'Udział ruchu (%)');\r\n";
        
        table[3] = ""; //dane do table 0
        table[4] = ""; //dane do table 1
        table[5] = ""; //dane do table 2

 
        APIData appData = new  APIData();
        dbConnector db = new dbConnector();
        Boolean queryRes = false; 
        try {
        //------------Staty------------------------//
        // queryRes = db.... metoda do stat
        if (queryRes == false) {
                SemrushAPIConnector sem = new SemrushAPIConnector(this.apiKey);  
                sem.testMode = this.testMode;      
                queryRes = sem.getWebsiteStatsReport(appData, website, "pl", true); //top 5 fraz 
                System.out.println("skorzystano z API");
            }     
        
         if (queryRes == true) {
            Map<String[], APIWebsiteStats> websiteStat = appData.getResultsWebsiteStats();
            if (websiteStat != null) {
                       for (String[] key : websiteStat.keySet()) {
                           table[3] += "['" + websiteStat.get(key).getWebsite() + "', " + 
                                       "'" + websiteStat.get(key).getDataYYYYMM() + "', " + 
                                       "{v:" + websiteStat.get(key).getKeywords() + "}, " + 
                                       "{v:" + websiteStat.get(key).getTraffic() + "}],\r\n";
                       }
                   table[3] = table[3].trim();
                   table[3] = table[3].substring(0, table[3].length()-1);
                   }
            }
        
        //------------Konkurencja------------------//
        
        // queryRes = db.... metoda do konkurencji
        queryRes = false;
        if (queryRes == false) {
                SemrushAPIConnector sem = new SemrushAPIConnector(this.apiKey);  
                sem.testMode = this.testMode;      
                queryRes = sem.getWebsiteCompetitorsReport(appData,website,"pl", competitors);
                System.out.println("skorzystano z API");
            }    
        
            if (queryRes == true){
                Map<String[], APIWebsiteCompetitors> websiteComp = appData.getResultsWebsiteCompetitors();
                if (websiteComp != null) {
                       for (String[] key : websiteComp.keySet()) {
                          table[4] += "['" + websiteComp.get(key).getCompetitor() + "', " + 
                                      "{v:" + websiteComp.get(key).getRelevance() + "}, " + 
                                      "{v:" + websiteComp.get(key).getCommonKeywords() + "}, " + 
                                      "{v:" + websiteComp.get(key).getKeywords() + "}, " + 
                                      "{v:" + websiteComp.get(key).getTraffic() + "}],\r\n";
                          }
                      }

                table[4] = table[4].trim();
                table[4] = table[4].substring(0, table[4].length()-1);
            }
            
        //------------FRAZY-----------------------//
        queryRes = db.getWebsitePhrasesReport(appData, website, "pl", "live", 100);
            if (queryRes == false) {
                SemrushAPIConnector sem = new SemrushAPIConnector(this.apiKey);  
                sem.testMode = this.testMode;      
                queryRes = sem.getWebsitePhrasesReport(appData, website, "pl", "live", 3); //top 5 fraz 
                System.out.println("skorzystano z API");
                if (queryRes == false) return table;
            }

        Map<String[], APIWebsitePhrases> websiteKWs = appData.getResultsWebsitePhrases();
                       
            if (websiteKWs != null) {
                    for (String[] key : websiteKWs.keySet()) {
                        table[5] += "['" + websiteKWs.get(key).getPhrase() + "', " + 
                                "'" + websiteKWs.get(key).getUrl() + "', " + 
                                "{v:" + websiteKWs.get(key).getPosition() + "}, " + 
                                "{v:" + websiteKWs.get(key).getVolumen()+ "}, " + 
                                "{v:" + websiteKWs.get(key).getTrafficShare() + "}],\r\n";
                   //System.out.println("semdb con:" + websiteKWs.get(key).getPhrase());
                    }
                table[5] = table[5].trim();
                table[5] = table[5].substring(0, table[5].length()-1); 
                System.out.println( table[5] );
            }
         
        } catch (SQLException e) {}
        
        return table;
    }
      //end basic Stats
      
      //Competitors
      public String[] GChartCompetitorsWebsiteStat(String website, String aggrQuery, String whereQuery){
        String table[] = new String[2];
        //staty
        table[0] = ""; //count(KWs) lub sum()
        table[1] = ""; //dane do table 0 
 
        dbConnector db = new dbConnector();
        Boolean queryRes = false; 
        try {
        //------------Staty------------------------//
        // queryRes = db.... metoda do stat
            ArrayList<String> resList = new ArrayList<>();
            String[] myArrayData = new String[13];
            String[] myArrayVol = new String[13];
            //resList.add("spier ");
            queryRes = db.getWebsiteCompetitorsReport(resList, website, aggrQuery, whereQuery);
            
            if (queryRes == true)
            {
                myArrayData = resList.toArray(new String[0]);
                java.util.Arrays.sort(myArrayData);
            }
            
            resList.clear();
            //queryRes = db.getWebsiteCompetitorsReport(resList, website, "sum(search_volume)");
                            
            //print report
            System.out.println("Liczby zwiazane z konkurencja");
            if (queryRes == true && myArrayData.length>1) {
                
             //nagłowki do GChart   
            String headerCompact = myArrayData[myArrayData.length -1];
            String [] headerContent = headerCompact.split(",");
                if (headerContent.length>1) {
                table[0] = "data.addColumn('string', 'Miesiąc');\r\n";
                    for (int k=1; k<headerContent.length;k++)
                        table[0] = table[0] + "data.addColumn('number', '"+headerContent[k]+"');\r\n";
                }
                table[0] = table[0].trim();
             //end naglowki
             
             //dane tabelaryczne (na ostatnim jest header stad length-1
                for (int k=0; k<myArrayData.length-1; k++) 
                {//System.out.println(myArrayData[k]);
                 table[1] = table[1] + "["+myArrayData[k]+"],\r\n" ;
                 //['201605', 45, 60, 89, 100],
                }
                table[1] = table[1].trim();
                table[1] = table[1].substring(0, table[1].length()-1); 
                
                System.out.println( table[0] );
                System.out.println( table[1] );
                        
            }

        } catch (SQLException e) {}
        
        return table;
    }      
      
      //end Competitors

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
