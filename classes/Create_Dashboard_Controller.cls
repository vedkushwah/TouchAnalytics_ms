public with sharing class Create_Dashboard_Controller {
    /*public String dashId{get;set;}
    public String dashboardName{get;set;}
    public Boolean dashboardCreated{get;set;}
    
    public String dashboardJSONString{get;set;}
    public String finalResponse{get;set;}
    
    public Create_Dashboard_Controller(){
        system.debug('Response_______');
        dashboardCreated = false; 
        dashId = ApexPages.CurrentPage().getParameters().get('Id');
        List<DashBoards__c> dashList = new List<DashBoards__c>();
        
        List<Attachment> att = [select Body, Id from Attachment where parentId =: dashId ];
        if(att.size()>0){
            dashboardJSONString = att[0].Body.toString();
        }else{
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'JSON Attachment for the dashboard is not found'); 
            ApexPages.addMessage(myMsg);
        }
       
    }
    
    public PageReference redirect(){
         String finalJSON = System.currentPageReference().getParameters().get('jsonString');
         
         system.debug('Response_______');
        if(finalJSON != null && dashboardName != null && dashboardName.trim() != ''){
               
                finalJSON = finalJSON.replace('&quot;','\\\"');
                system.debug('JSON String 1'+finalJSON);
                finalJSON = finalJSON.replace('&#92;', '\\\\'); 
                finalJSON = finalJSON.replace('&#39;','\'');
                finalJSON = finalJSON.replace('&amp;','&');
                system.debug('JSON String'+finalJSON);
               
                finalJSON = '{"label":"'+dashboardName+'",'+finalJSON.subString(1,finalJSON.length());
                System.debug(dashboardName+'********* JSON FROM JS '+finalJSON);
             HttpResponse hRes =new HttpResponse();
              if(!Test.isRunningTest()){
                 hRes= CreateDashboardService.createDashboard(dashboardName, finalJSON);  
                 finalResponse = hRes.getBody();
                 System.debug('************responseBody' + finalResponse);
              }
              if(hRes.getStatus() == 'Created'){
                
                 dashboardCreated = true;
                 String URL = System.URL.getSalesforceBaseUrl().toExternalForm()+'/analytics/wave/wave.apexp';
                 String str = '<a href="'+URL+'">Click here to go to Wave Analytics</a>';
                 ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM,dashboardName+' DashBoard Created Successfully!!'+str); 
                 ApexPages.addMessage(myMsg);
                 system.debug('Final Response'+finalResponse);
                 return null;
             
              } 
              else{
                 dashboardCreated = false;
               
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'DashBoard Not Created'+finalJSON); 
                ApexPages.addMessage(myMsg);
                system.debug('Final Response'+finalResponse);
                return null;
              } 
        }else{
            
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please Enter Dashboard Name'); 
                ApexPages.addMessage(myMsg);
                return null;
        }
      return null;  
    }
    
    public PageReference cancel(){
        String finalJSON = System.currentPageReference().getParameters().get('jsonString');
        PageReference pr = new PageReference('/'+dashId);
        system.debug('Response****'+finalJSON);
        return pr;
    }*/
}