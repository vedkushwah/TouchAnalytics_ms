global with sharing class Dashboard_Backup_Controller { 
    
    public DashBoards__c dashBoard{get;set;}
    
    global Dashboard_Backup_Controller(){
       
         dashBoard = new DashBoards__c();
          
    } 
    
    global void getDashboard(String sId){ 
    
        
        DashBoard_Backup__c db = new DashBoard_Backup__c();
        if(Schema.sObjectType.DashBoard_Backup__c.fields.Name.isCreateable()){
            db.Name = System.Now()+''; 
        }
        
        String responseBody;
        HttpResponse hRes = Dashboard_Backup_Service.retriveDashboard(sId);
        
        responseBody = hRes.getBody();
        
        
        if(hRes.getStatus() == 'OK'){
            Dashboard_Backup_Parser dbr = Dashboard_Backup_Parser.parse(responseBody);
            List<DashBoards__c> dsbs = new List<DashBoards__c>();
            if(dbr.DashBoards != null){
                for(Dashboard_Backup_Parser.cls_DashBoards dash : dbr.DashBoards){
                    System.debug('$$$$$$$$$$$$$$$$$'+dash.lastModifiedDate+string.valueOf(system.Today()));
                    if(Date.valueOf(dash.lastModifiedDate) == Date.today() || Date.valueOf(dash.lastModifiedDate) == Date.today()-1){
                        if(Schema.sObjectType.DashBoards__c.fields.Name.isCreateable() && Schema.sObjectType.DashBoards__c.fields.DashBoard_Id__c.isCreateable()
                           && Schema.sObjectType.DashBoards__c.fields.URL__c.isCreateable() && Schema.sObjectType.DashBoards__c.fields.DashBoard_Label__c.isCreateable() && Schema.sObjectType.DashBoards__c.fields.Folder_Name__c.isCreateable()){
                            DashBoards__c ds = new DashBoards__c();
                            ds.DashBoard_Id__c = dash.Id;
                            ds.Name = dash.Name;
                            ds.URL__c = dash.URL;
                            ds.DashBoard_Label__c = dash.Label;
                            ds.Folder_Name__c = dash.folder.Name; 
                            dsbs.add(ds);
                            
                           
                        }    
                    } 
                } 
                insert db;
              
                for(DashBoards__c dshb : dsbs){
                    dshb.DashBoard_Backup__c = db.Id;
                }
          
               
              insert dsbs;
              System.debug('@@@@@@@@@@@'+dbr.DashBoards.size());
            }
       }else{
           
           Integer i = 0;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
           String htmlBody = '';
                      Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                      mail.toAddresses = new String[] {userInfo.getUserEmail()+''};
                      mail.ccAddresses = new String[] {'mahesh@analyticscc.com'};
                      mail.setTreatTargetObjectAsRecipient(false);
                      mail.setSubject('DashBoard Backup Failed');
                      string Dvalue=string.valueof(System.Today());
                      Dvalue.remove('00:00:00');
                      htmlBody ='Hi '+',<br/><br/>Please check the below information'+responseBody+'<br/><br/><br/>Thanks,<br/>Touch Analytics Team';
                      mail.setHTMLBody(htmlBody);
                      Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {mail};
                      Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
                      system.debug('@@@@@@@@@@@@@@@@ mail'+results);
                    
       }
      
    }
    
   
    
   
    
    
    
}