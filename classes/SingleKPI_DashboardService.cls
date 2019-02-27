public with sharing class SingleKPI_DashboardService {
    public static HttpResponse m_createSingleDashboard(list<Dataset__c> DatasetReclist,String DashboardName,String DashboardTtitle,String DashboardDesc,String FolderId,String SalesName,String SessionId){   
		String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v43.0';		
		String endpoint;
		if(SessionId != null && SessionId != ''){
		   SessionId = SessionId; 
		}
		else{
		    SessionId = UserInfo.getSessionId();
		}
        endpoint = sfdcInstance + '/wave/dashboards';  
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);     
        req.setMethod('POST');
        req.setHeader('content-type', 'application/json');
        req.setHeader('Authorization','Bearer ' + SessionId); 
         if(!Test.isRunningTest())     
          req.setBody(SingleKPI_JsonString_AC.jsonMethod(DatasetReclist,DashboardName,DashboardTtitle,DashboardDesc,FolderId,SalesName));
        HttpResponse res;
        if(!Test.isRunningTest()){
	        res = http.send(req); 
	       	System.debug('Dashboard POST Response is '+ res.getStatus() + res.getBody() );  
	       	return res;                
        }
        else{
            return null;
        }
    }
    
     public static HttpResponse retriveDashboardFile(String URLName, String sessionId){  
        
        String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm();
        String endpoint;         
        endpoint = sfdcInstance + '/services/data/v41.0/wave/dashboards/'+URLName; 
        System.debug('@@@@@@@@@'+endpoint);
        HTTPRequest req = new HTTPRequest();
        req.setEndpoint(endpoint);   
        req.setMethod('GET');
        System.debug('@@@@@@@@@$$$$$$$$$$$$$$$$$$$$$$$44'+sessionId);
        req.setHeader('Authorization', 'OAuth ' + sessionId);
        req.setHeader('content-type', 'application/json');         
        HTTP paramReq = new HTTP();
        HTTPResponse res = new HTTPResponse();
        if(!Test.isRunningTest()){
         res = paramReq.send(req);
        }
        System.debug('@@@@@@@@@'+res.getBody());
        
        return res; 
        
        
        }
}