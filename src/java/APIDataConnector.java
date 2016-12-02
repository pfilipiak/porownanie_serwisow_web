
import java.io.UnsupportedEncodingException;
import porownanie_serwisow.api.APIData;
import porownanie_serwisow.api.SemrushAPIConnector;
import java.nio.charset.Charset;

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

    public APIDataConnector(String website) {
        
        String apiKey = "2fc1906300ddc89289961a1c3642a273";
        Boolean isdone;
        Long credits;
        
        SemrushAPIConnector sem = new SemrushAPIConnector(apiKey);  
        credits = sem.TestAPIKey();
        System.out.println("credits:" + credits);
        Boolean testMode = true;
         // private Boolean testMode = true; w SemRushAPIConnector + urle do danych temp
         
        if (testMode){ 
            APIData onlyTest = new APIData();           
            sem.getWebsitePhrasesReport(onlyTest, website, "pl", "live", 10); //top 5 fraz    
            String tempContent = onlyTest.printAPIWebsitePhrases(5);
            try {
              byte[] byteText = tempContent.getBytes(Charset.forName("UTF-8"));
              tempContent = new String(byteText , "UTF-8");
            } catch (UnsupportedEncodingException e){
            System.err.println("Błąd kodowania: " + e);
            }
            this.reportContent = tempContent.replaceAll("\r\n", "<br>");
            this.IsLive = onlyTest.getIsLive();
            this.reportDate = onlyTest.getDate();
            this.reportSize = onlyTest.getResultsWebsitePhrases().size();

        }
            
        
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
