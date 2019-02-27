public with sharing class Dashboard_Backup_Service {
    public Static HttpResponse retriveDashboard(String sId){
        
        String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v41.0';
        String endpoint;         
        endpoint = sfdcInstance + '/wave/Dashboards?pageSize=200';
        HTTPRequest req = new HTTPRequest();
        req.setEndpoint(endpoint);   
        req.setMethod('GET');
        System.debug('************** Mahesh '+sId);
        req.setHeader('Authorization', 'OAuth ' + sId);
        req.setHeader('content-type', 'application/json');  
        req.setTimeout(60000);
        HTTP paramReq = new HTTP();
        HTTPResponse res = new HTTPResponse();
        if(!Test.isRunningTest()){
        res = paramReq.send(req);
        }
        System.debug('@@@@@@@@@'+res.getBody());
        
        return res;
   }
   
   public Static HttpResponse retriveDashboardFile(String URLName, String sessionId){  
        
        String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm();
        String endpoint;         
        endpoint = sfdcInstance + URLName; 
        HTTPRequest req = new HTTPRequest();
        req.setEndpoint(endpoint);   
        req.setMethod('GET');
        req.setHeader('Authorization', 'OAuth ' + sessionId);
        req.setHeader('content-type', 'application/json');   
        req.setTimeout(60000);
        HTTP paramReq = new HTTP();
        HTTPResponse res = new HTTPResponse();
        if(!Test.isRunningTest()){
         res = paramReq.send(req);
        }
        System.debug('@@@@@@@@@'+res.getBody());
        
        return res;
   } 
}