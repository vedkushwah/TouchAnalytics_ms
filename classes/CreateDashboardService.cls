public with sharing class CreateDashboardService {
  
  
  public static HttpResponse createDashboard(String dashboardName, String finalJson){
      String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v41.0';
      String endpoint;
      endpoint = sfdcInstance + '/wave/dashboards';  
      Http http = new Http();
      HttpRequest req = new HttpRequest();
      req.setEndpoint(endpoint);   
      req.setMethod('POST');
        req.setHeader('content-type', 'application/json');
        req.setHeader('Authorization','Bearer ' + UserInfo.getSessionId()); 
        if(!Test.isRunningTest()){
        req.setBody(finalJson); 
        }
        
        HttpResponse res;
        if(!Test.isRunningTest())
        res = http.send(req); 
       //System.debug('*********** Response is '+res.getStatus() + res.getBody() );  
       return res; 
    }
    
    
}