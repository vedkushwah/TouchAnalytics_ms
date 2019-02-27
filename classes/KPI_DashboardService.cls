public with sharing class KPI_DashboardService {
      public static HttpResponse m_createDashboard(String DashboardName,list<String> FolderId,String SalesNames){
		String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v39.0';
		String endpoint;
        endpoint = sfdcInstance + '/wave/dashboards';  
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);   
        req.setMethod('POST');
        req.setHeader('content-type', 'application/json');
        req.setHeader('Authorization','Bearer ' + UserInfo.getSessionId()); 
          if(!Test.isRunningTest())
        req.setBody(Json_Overview_String.jsonMethod(DashboardName,FolderId,SalesNames));
        HttpResponse res;
        if(!Test.isRunningTest()){
        res = http.send(req); 
       System.debug('*********** Response is '+res.getStatus() + res.getBody() );  
       return res; 
                
            }
            else{
                return null;
            }
    }  
    
    public static HttpResponse Build_createDashboard(String DashboardName,list<String> FolderId,String SalesNames,String SessionId){
		String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v39.0';
		String endpoint;
        endpoint = sfdcInstance + '/wave/dashboards';  
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);   
        req.setMethod('POST');
        req.setHeader('content-type', 'application/json');
        req.setHeader('Authorization','Bearer ' + SessionId); 
        req.setTimeout(120000);
          if(!Test.isRunningTest())
        req.setBody(Json_Overview_String.jsonMethod(DashboardName,FolderId,SalesNames));
        HttpResponse res;
        if(!Test.isRunningTest()){
        res = http.send(req); 
       System.debug('*********** Response is '+res.getStatus() + res.getBody() );  
       return res; 
                
            }
            else{
                return null;
            }
    }  
    
    
    
     public static HttpResponse m_createDashboards(list<Dataset__c> DatasetReclist,String DashboardName,String FolderId,String datevalue,String datevalueact,String SalesNames){
		String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v41.0'; 
		
		String endpoint;
		
        endpoint = sfdcInstance + '/wave/dashboards';  
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);   
        req.setMethod('POST');
        req.setHeader('content-type', 'application/json');
        req.setHeader('Authorization','Bearer ' + UserInfo.getSessionId()); 
          if(!Test.isRunningTest())
        req.setBody(ActualTarget_Json_String.jsonMethod(DatasetReclist,DashboardName,FolderId,datevalue,datevalueact,SalesNames));
        HttpResponse res;
        if(!Test.isRunningTest()){
        res = http.send(req); 
      // System.debug('*********** Response is '+res.getStatus() + res.getBody() );  
       return res; 
                
            }
            else{
                return null;
            }
    }  
    
    
     public static HttpResponse Dim_createDashboards(String DashboardName,String sessionId){
		String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v41.0'; 
		
		String endpoint;
		
        endpoint = sfdcInstance + '/wave/query';  
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);   
        req.setMethod('POST');
        req.setHeader('content-type', 'application/json');
        req.setHeader('Authorization','Bearer ' + sessionId); 
        req.setTimeout(120000);
          if(!Test.isRunningTest())
        req.setBody(DashboardName);
        HttpResponse res;
        if(!Test.isRunningTest()){
        res = http.send(req); 
       //System.debug('*********** Response is '+res.getStatus() + res.getBody() );  
       return res; 
                
            }
            else{
                return null;
            }
    }
    
    
     public static HttpResponse Dim_createDashboardss(String DashboardName,String sessionId){
		String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v41.0'; 
		
		String endpoint;
		
        endpoint = sfdcInstance + '/wave/query';  
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);   
        req.setMethod('POST');
        req.setHeader('content-type', 'application/json');
        req.setHeader('Authorization','Bearer ' + sessionId); 
        
        req.setTimeout(120000);
          if(!Test.isRunningTest())
        req.setBody(DashboardName);
        HttpResponse res;
        if(!Test.isRunningTest()){
        res = http.send(req); 
       //System.debug('*********** Response is '+res.getStatus() + res.getBody() );  
       return res; 
                
            }
            else{
                return null;
            }
    }  
    
    public static HttpResponse Meas_createDashboardss(String DashboardName,String sessionId){
		String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v41.0'; 
		
		String endpoint;
		
        endpoint = sfdcInstance + '/wave/query';  
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);   
        req.setMethod('POST');
        req.setHeader('content-type', 'application/json');
        req.setHeader('Authorization','Bearer ' + sessionId); 
        req.setTimeout(120000);
          if(!Test.isRunningTest())
        req.setBody(DashboardName);
        HttpResponse res;
        if(!Test.isRunningTest()){
        res = http.send(req); 
       //System.debug('*********** Response is '+res.getStatus() + res.getBody() );  
       return res; 
                
            }
            else{
                return null;
            }
    }  
}