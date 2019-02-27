public class Future_Backup_Batch {
    @future(callout = true)
    public static void invokeBatch(){
       try{ 
        List<Remote_Site_Settings__c> Tbsetting=[SELECT id,name,Security_Token__c,Password__c,Username__c,Notification__c,Time__c,User_Email__c,Key__c from  Remote_Site_Settings__c limit 1];
         boolean sendEmail = false;
         String result;
    
             Blob key;
         
         if(Tbsetting.size()>0 && Tbsetting[0].Username__c != null && TbSetting[0].Password__c != null){
             if(Tbsetting[0].Security_Token__c != null){
                if(!Test.isRunningTest()){
                    key = Blob.valueOf(Tbsetting[0].Key__c);
                    result = Crypto.decryptwithmanagediv('AES128',key,EncodingUtil.base64decode(TbSetting[0].Password__c)).tostring();
                }
                Login.responseClass responseDetails = Login.login1(Tbsetting[0].Username__c, result+Tbsetting[0].Security_Token__c);
                if(responseDetails.response == true){
                    Dashboard_Backup_Controller dbc = new Dashboard_Backup_Controller();
      
        dbc.getDashboard(responseDetails.responsemessage);
                    
                    sendEmail = true; 
                }
                
             }else{
                 if(!Test.isRunningTest()){
                    key = Blob.valueOf(Tbsetting[0].Key__c); 
                    result = Crypto.decryptwithmanagediv('AES128',key,EncodingUtil.base64decode(TbSetting[0].Password__c)).tostring();
                }
                 Login.responseClass responseDetails = Login.login1(Tbsetting[0].Username__c, result);
               if(responseDetails.response == true){
                    Dashboard_Backup_Controller dbc = new Dashboard_Backup_Controller();
      
        dbc.getDashboard(responseDetails.responsemessage);
                    sendEmail = true;
                }
             }
            
            if(!sendEmail){
                //Write Code to send email
                String htmlBody = '';
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
               mail.toAddresses = new String[] {userInfo.getUserEmail()+''};
                      mail.ccAddresses = new String[] {'mahesh@analyticscc.com'};
              //mail.toAddresses = new String[] {Tbsetting[0].User_Email__c };
        mail.setTreatTargetObjectAsRecipient(false);
        mail.setSubject('DashBoard Backup Failed Notification');
        string Dvalue=string.valueof(System.Today());
        Dvalue.remove('00:00:00');
        htmlBody ='Hi '+',<br/><br/>'+'DashBoard Backup is failed on '+Dvalue+'. Please check your settings. <br/><br/><br/>Thanks,<br/>Touch Analytics Team';
        mail.setHTMLBody(htmlBody);
        Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {mail};
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        system.debug('@@@@@@@@@@@@@@@@ mail'+results);
            }
         
         }
       }catch(Exception e){
           
           System.debug('****************** '+e);
       }
     
    } 
     
    @future(callout = true)
    public static void invokeBatchDB(){
        
        List<Remote_Site_Settings__c> Tbsetting=[SELECT id,name,Security_Token__c,Password__c,Username__c,Notification__c,Time__c,User_Email__c,Key__c from  Remote_Site_Settings__c limit 1];
         boolean sendEmail = false;
         String sessionId = '';
         String result;
         Blob key;
         if(Tbsetting.size()>0 && Tbsetting[0].Username__c != null && TbSetting[0].Password__c != null){
             if(Tbsetting[0].Security_Token__c != null){
                 if(!Test.isRunningTest()){
                    key = Blob.valueOf(Tbsetting[0].Key__c); 
                    result = Crypto.decryptwithmanagediv('AES128',key,EncodingUtil.base64decode(TbSetting[0].Password__c)).tostring();
                }
                Login.responseClass responseDetails = Login.login1(Tbsetting[0].Username__c, result+Tbsetting[0].Security_Token__c);
                if(responseDetails.response == true){
                   sessionId = responseDetails.responsemessage;
                    sendEmail = true;
                }
                
             }else{
                 if(!Test.isRunningTest()){
                    key = Blob.valueOf(Tbsetting[0].Key__c); 
                    result = Crypto.decryptwithmanagediv('AES128',key,EncodingUtil.base64decode(TbSetting[0].Password__c)).tostring();
                }
                 Login.responseClass responseDetails = Login.login1(Tbsetting[0].Username__c, result);
               if(responseDetails.response == true){
                    sessionId = responseDetails.responsemessage;
                    sendEmail = true;
                }
             }
         }
         
         if(!sendEmail){
                //Write Code to send email
                String htmlBody = '';
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
             mail.toAddresses = new String[] {userInfo.getUserEmail()+''};
                      mail.ccAddresses = new String[] {'mahesh@analyticscc.com'};
                     
            if(Tbsetting.size()>0){
              mail.toAddresses = new String[] {Tbsetting[0].User_Email__c };
            }
            if(Test.isRunningTest()){
                 mail.toAddresses = new String[] {'Test@gmail.com'};
            }
        mail.setTreatTargetObjectAsRecipient(false);
        mail.setSubject('DashBoard Backup Failed Notification');
        string Dvalue=string.valueof(System.Today());
        Dvalue.remove('00:00:00');
        htmlBody ='Hi '+',<br/><br/>'+'DashBoard Backup is failed on '+Dvalue+'. Please check your settings. <br/><br/><br/>Thanks,<br/>Touch Analytics Team';
        mail.setHTMLBody(htmlBody);
        Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {mail};
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        system.debug('@@@@@@@@@@@@@@@@ mail'+results);
            }
            
         if(sessionId != null && sessionId != ''){    
            List<DashBoard_Backup__c> backupList = [SELECT Id FROM DashBoard_Backup__c Where CreatedDate = Today order by CreatedDate desc Limit 1]; 
            if(backupList.size()>0){
                List<DashBoards__c> dbList = [SELECT Id FROM DashBoards__c 
                                                            Where Dashboard_Backup__c =: backupList[0].id ];
                List<String> dbIds = new List<String>();
                if(dbList.size()>0){
                    for(DashBoards__c d : dbList){
                        dbIds.add(d.id);
                    }
                    Dashboard_Backup_BatchClass dbb = new Dashboard_Backup_BatchClass();
                    dbb.Dashboard_Backup_BatchClassMain(dbIds, sessionId);
                   
                }
            }
        }
    }
}