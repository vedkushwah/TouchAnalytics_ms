public with sharing class Dashboard_Backup_BatchClass{
    List<DashBoards__c> dashList = new List<DashBoards__c>();
    String sessId = '';
    public void Dashboard_Backup_BatchClassMain(List<String> dashboardId,  String SessionId){
        dashList = [select Name, Dashboard_Id__c, URL__c, DashBoard_Label__c from DashBoards__c where Id in :dashboardId LIMIT 90];
        List<attachment> attList = new List<attachment>();
        for(DashBoards__c d : dashList){
             HttpResponse hRes = Dashboard_Backup_Service.retriveDashboardFile(d.URL__c, SessionId);
             
            String responseBody = hRes.getBody();
            
            System.debug('************responseBody' + responseBody);
            if(hRes.getStatus() == 'OK'){
                if(Schema.sObjectType.Attachment.fields.Name.isCreateable() && Schema.sObjectType.Attachment.fields.Body.isCreateable()
                   && Schema.sObjectType.Attachment.fields.ParentId.isCreateable()){
                    Attachment att = new Attachment();
                    att.Name = String.valueOf(d.Name + '.txt');
                    att.Body = Blob.valueOf(responseBody);
                    att.ParentId = d.Id;
                    attList.add(att);
                    System.debug('@@@@@@@@@@@@@'+att);  
                 }    
            }
        }
        insert attList;
        sendEmail();
    }
    
    
    public void sendEmail(){
        String htmlBody = '';
        User userList = [select Id, Name, Email from User where Id = :UserInfo.getUserId()];
        
        List<Remote_Site_Settings__c> Tbsetting=[SELECT id,name,Notification__c,Time__c,User_Email__c from  Remote_Site_Settings__c limit 1];
        if(Tbsetting.size()>0 && Tbsetting[0].Notification__c == true && Tbsetting[0].User_Email__c != null && Tbsetting[0].User_Email__c != '')
        {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        //mail.toAddresses = new String[] {'pavan.uddarraju@diligentforcelabs.com'};
        mail.toAddresses = new String[] {Tbsetting[0].User_Email__c };
        mail.setTreatTargetObjectAsRecipient(false);
        mail.setSubject('DashBoard Backup Notification');
        string Dvalue=string.valueof(System.Today());
        Dvalue.remove('00:00:00');
        htmlBody ='Hi '+userList.Name+',<br/><br/>'+'DashBoard Backup is successfully completed on '+Dvalue+'<br/><br/><br/>Thanks,<br/>Touch Analytics Team';
        mail.setHTMLBody(htmlBody);
        Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {mail};
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        system.debug('@@@@@@@@@@@@@@@@ mail'+results);
        }
    }

}