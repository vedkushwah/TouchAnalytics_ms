public with sharing class SnapshotKPI_DashboardService {
    
    public static HttpResponse m_createSingleDashboard(list<Dataset__c> DatasetReclist,String DashboardName,String DashboardTtitle,String DashboardDesc,String FolderId, string datevalue, String SalesName){   
		String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v40.0';		
		String endpoint;		
        endpoint = sfdcInstance + '/wave/dashboards';  
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);     
        req.setMethod('POST');
        req.setHeader('content-type', 'application/json');
        req.setHeader('Authorization','Bearer ' + UserInfo.getSessionId()); 
         if(!Test.isRunningTest())     
          req.setBody(SnapshotKPI_JsonString.jsonMethod(DatasetReclist,DashboardName,DashboardTtitle,DashboardDesc,FolderId,datevalue,SalesName));
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