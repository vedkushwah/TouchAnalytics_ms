public with sharing class KPI_DashboardMarketingService {
    public static HttpResponse m_createDashboard(String DashboardId,list<String> FolderId,String Allval,String Allvals,String SessiondId){
		String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v41.0';
		String endpoint;
			if(SessiondId == '' || SessiondId == null){
		    SessiondId = UserInfo.getSessionId();
		}
        endpoint = sfdcInstance + '/wave/dashboards';  
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);   
        req.setMethod('POST');
        req.setHeader('content-type', 'application/json');
        req.setHeader('Authorization','Bearer ' + SessiondId); 
        if(!Test.isRunningTest()){
            if(Allvals == 'New Default Sales Insight'){
                req.setBody(NewSalesJsonString.SalesString(DashboardId,FolderId,Allval,'Market',SessiondId));
            }
            else{
                req.setBody(Json_Sales_String.SalesString(DashboardId,FolderId,Allval,'Market')); 
            }
        }  
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
    
    
     public static HttpResponse DUp_createDashboard(String DashboardId,list<String> FolderId,String Allval,String Allvals,String SessiondId,String Posts1,String Market){
		String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v41.0';
		String endpoint;
			if(SessiondId == '' || SessiondId == null){
		    SessiondId = UserInfo.getSessionId();
		}
        endpoint = sfdcInstance + '/wave/dashboards/'+ Posts1+'?_HttpMethod=PATCH';  
        Http http = new Http();
        HttpRequest req = new HttpRequest();
          
       
        req.setHeader('X-HTTP-Method-Override','PATCH');
        req.setHeader('content-type', 'application/json');
        req.setHeader('Authorization','Bearer ' + SessiondId); 
         req.setMethod('POST');
         req.setEndpoint(endpoint); 
        if(!Test.isRunningTest()){
            if(Allvals == 'New Default Sales Insight'){
                req.setBody(NewSalesJsonString.SalesString(DashboardId,FolderId,Allval,Market,SessiondId));
            }
        }  
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
}