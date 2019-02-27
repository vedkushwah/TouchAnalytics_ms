public with sharing class KPI_DashboardSuccessFilter {
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
                req.setBody(NewSalesJsonString.SalesString(DashboardId,FolderId,Allval,'Success',SessiondId));
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