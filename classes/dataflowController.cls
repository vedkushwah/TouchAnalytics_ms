//@isTest 
public class dataflowController {

    
    
    public Organization org{get;set;}
    public User userData{get;set;}
    public string serverURL {get;set;}
    public string accountRecId {get;set;}
    public string contactRecId {get;set;}
    public string opportunityRecId {get;set;}
    public string opportunityLineItemRecId {get;set;}
    public string recordTypeId {get;set;}
    public string priceBookId {get;set;}
    
    
    public string selectedDashboard {get;set;}
    public boolean displayConnectButtons {get;set;}
    
    public integer accountBalance {get;set;}
    public integer BuildCost {get;set;}
    public string CouponCode {get;set;}
    public string CouponCodeId {get;set;}
    public integer CouponValue {get;set;}
    public integer TotalCost {get;set;}
    public integer CreditsRemaining {get;set;}
    
    public boolean isConnect{get;set;}
    public boolean isCheckAccount{get;set;}
    public boolean isCheckContact{get;set;}
    
    public map<String, Integer> buildCostMap = new map<String, Integer>();
   
    
    public void booleanConnections(){
        isConnect = false;
        isCheckAccount = false; 
        isCheckContact = false;
    }



    public string sessionIds;
    public void connectToSFDC(){
        SFDCApiUtil.connectResponseClass connectResponse = SFDCApiUtil.connectToSFDC();
        if(connectResponse.response || TEst.isRunningTest()){
            sessionIds = connectResponse.sessionId;
            serverURL = connectResponse.responseServerUrl;
            //  ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, '' + connectResponse);
            //  ApexPages.addMessage(myMsg);
            booleanConnections();
            isCheckAccount = true;
            verifyAccountDetails();
            String vals = string.valueof(accountbalance);
            
        }
        else{
            // system.debug('connectResponse.responsemessage ********'+connectResponse.responsemessage);
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, '' + connectResponse.responsemessage);
            ApexPages.addMessage(myMsg);
            booleanConnections();
            
        }
        
    }
    
    public void verifyAccountDetails(){
        org = [select Id, Name, Phone, Fax, Street, City, State, Country, PostalCode from Organization where Id = :UserInfo.getOrganizationId()];
        String query = 'select Id,Name from Account where org_Id__c = \''+ userinfo.getOrganizationId() + '\' ';
        SFDCApiUtil.verifyResponseClass verifyAccount = SFDCApiUtil.verifyDetails(sessionIds, serverURL, query);
        if(verifyAccount.response){
            if(verifyAccount.hasDetails){
                accountRecId = verifyAccount.recordId;
                //  ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Account ' + accountRecId);
                //  ApexPages.addMessage(myMsg);
                booleanConnections();
                isCheckContact = true;
                verifyContactDetails();
            }
            else{
                
                query = 'select Id,Name from Account where org_Id__c = \''+ userinfo.getuserId() + '\' ';
                SFDCApiUtil.verifyResponseClass verifyAccounts = SFDCApiUtil.verifyDetails(sessionIds, serverURL, query);
                if(verifyAccounts.response){
                    if(verifyAccounts.hasDetails){
                        accountRecId = verifyAccounts.recordId;
                        //  ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Account ' + accountRecId);
                        //  ApexPages.addMessage(myMsg);
                        booleanConnections();
                        isCheckContact = true;
                        verifyContactDetails();
                    }
                    else{
                        Map<String, String> recordDetails = new Map<String, String>();
                        recordDetails.put('Name', UserInfo.getOrganizationName());
                        recordDetails.put('org_Id__c', UserInfo.getOrganizationId());
                        if(org.Phone != null && org.Phone != ''){
                            recordDetails.put('Phone', org.Phone);
                        }
                        if(org.Fax != null && org.Fax != ''){
                        recordDetails.put('Fax', org.Fax);
                        }
                        if(org.Street != null && org.Street != ''){
                        recordDetails.put('BillingStreet', org.Street);
                        }
                        if(org.City != null && org.City != ''){
                        recordDetails.put('BillingCity', org.City);
                        }
                        if(org.State != null && org.State != ''){
                        recordDetails.put('BillingState', org.State);
                        }
                        if(org.Country != null && org.Country != ''){
                        recordDetails.put('BillingCountry', org.Country);
                        }
                        if(org.PostalCode != null && org.PostalCode != ''){
                        recordDetails.put('BillingPostalCode', org.PostalCode);
                        }
                        SFDCApiUtil.createResponseClass createAccount = SFDCApiUtil.createDetails(sessionIds, serverURL,
                                                                                                    'Account', recordDetails);
                        if(createAccount.response){
                            accountRecId = createAccount.recordId;
                            // ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Account ' + createAccount.recordId);
                            // ApexPages.addMessage(myMsg);
                            booleanConnections();
                            isCheckContact = true;
                            verifyContactDetails();
                        }
                        else{
                               userData = [select Id, Name, Email, Title, Phone, MobilePhone, Fax, Street, City, State, Country, PostalCode from User where Id = :userinfo.getuserId()];
                                Map<String, String> recordDetailsNew = new Map<String, String>();
                                recordDetailsNew.put('Name', userData.Name);
                                recordDetailsNew.put('org_Id__c', userinfo.getuserId());
                                if(userData.Phone != null && userData.Phone != ''){
                                    recordDetailsNew.put('Phone', userData.Phone);
                                }
                                if(userData.Fax != null && userData.Fax != ''){
                                recordDetailsNew.put('Fax', userData.Fax);
                                }
                                if(userData.Street != null && userData.Street != ''){
                                recordDetailsNew.put('BillingStreet', userData.Street);
                                }
                                if(userData.City != null && userData.City != ''){
                                recordDetailsNew.put('BillingCity', userData.City);
                                }
                                if(userData.State != null && userData.State != ''){
                                recordDetailsNew.put('BillingState', userData.State);
                                }
                                if(userData.Country != null && userData.Country != ''){
                                recordDetailsNew.put('BillingCountry', userData.Country);
                                }
                                if(userData.PostalCode != null && userData.PostalCode != ''){
                                recordDetailsNew.put('BillingPostalCode', userData.PostalCode);
                                }
                                system.debug('the map values are' + recordDetailsNew);
                                SFDCApiUtil.createResponseClass createAccounts = SFDCApiUtil.createDetails(sessionIds, serverURL,
                                                                                                                            'Account', recordDetailsNew);
                                    if(createAccounts.response){
                                        accountRecId = createAccounts.recordId;
                                        booleanConnections();
                                        isCheckContact = true;
                                        verifyContactDetails();
                                         system.debug('AccountNews ***' + accountRecId);
                                    }
                                    else{
                                        
                                        system.debug('Accountolds ***' + createAccounts.responsemessage);
                                        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Accountolds ' + createAccounts.responsemessage);
                                        ApexPages.addMessage(myMsg);
                                        booleanConnections();
                                    }
                                     
                                     
                                     String messageBody = '<html><body>Hi Joseph, <br/><br/>'+createAccount.responsemessage + '</body>  </html>';
                                   
                                                    
                                     
                                    Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                                   message.toAddresses = new String[] { 'joseph@analyticscc.com' };
                                  // message.toAddresses = new String[] { 'pratap.uddarraju@diligentforcelabs.com' };
                                  //message.ccAddresses = new String[] { 'mahesh@diligentforcelabs.com' };
                                    message.subject = 'Account Not Created';
                                    message.HtmlBody = messageBody;
                                    Messaging.SingleEmailMessage[] messages = 
                                        new List<Messaging.SingleEmailMessage> {message};
                                             Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
                                    if (results[0].success) {
                                        System.debug('The email was sent successfully.');
                                    } else {
                                        System.debug('The email failed to send: '
                                              + results[0].errors[0].message);
                                    }
                                }
                            }
                    }
                }
        }
        else{
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.Error, 'Account ' + verifyAccount.responsemessage);
            ApexPages.addMessage(myMsg);
            booleanConnections();
           
        }
    }
    
    public void verifyContactDetails(){
        userData = [select Id, Name, Email, Title, Phone, MobilePhone, Fax, Street, City, State, Country, PostalCode from User where Id = :userinfo.getuserId()];
        String query = 'select Id,Credit_Amount__c,Debit_Amount__c from Contact where User_Id__c = \''+ userinfo.getuserId() + '\'';
        SFDCApiUtil.verifyResponseClass verifyContact = SFDCApiUtil.verifyDetails(sessionIds, serverURL, query);
        if(verifyContact.response){
            if(verifyContact.hasDetails){
                displayConnectButtons = false;
                contactRecId = verifyContact.recordId;
                if(verifyContact.creditAmount == null){
                   verifyContact.creditAmount = 0; 
                }
                if(verifyContact.debitAmount == null){
                    verifyContact.debitAmount = 0;
                }
                
                accountBalance = verifyContact.creditAmount - verifyContact.debitAmount;
                 if(accountBalance == Null){
                                accountBalance = 0;
                            }
                // ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'ContactNew ' + contactRecId);
                // ApexPages.addMessage(myMsg);
                booleanConnections();
            }
            else{
                Map<String, String> recordDetails = new Map<String, String>();
                recordDetails.put('FirstName', UserInfo.getFirstName());
                recordDetails.put('LastName', UserInfo.getLastName());
                recordDetails.put('User_Id__c', userinfo.getuserId());
                
                recordDetails.put('AccountId', accountRecId);
                if(userData.Email != null && userData.Email != ''){
                recordDetails.put('Email', userData.Email);
                }
                if(userData.Title != null && userData.Title != ''){
                recordDetails.put('Title', userData.Title);
                }
                if(userData.Phone != null && userData.Phone != ''){
                recordDetails.put('Phone', userData.Phone);
                }
                if(userData.MobilePhone != null && userData.MobilePhone != ''){
                recordDetails.put('MobilePhone', userData.MobilePhone);
                }
                if(userData.Fax != null && userData.Fax != ''){
                recordDetails.put('Fax', userData.Fax);
                }
                if(userData.Street != null && userData.Street != ''){
                recordDetails.put('MailingStreet', userData.Street);
                }
                if(userData.City != null && userData.City != ''){
                recordDetails.put('MailingCity', userData.City);
                }
                if(userData.State != null && userData.State != ''){
                recordDetails.put('MailingState', userData.State);
                }
                if(userData.Country != null && userData.Country != ''){
                recordDetails.put('MailingCountry', userData.Country);
                }
                if(userData.PostalCode != null && userData.PostalCode != ''){
                recordDetails.put('MailingPostalCode', userData.PostalCode);
                }
                system.debug('the map values are' + recordDetails);
                SFDCApiUtil.createResponseClass createContact = SFDCApiUtil.createDetails(sessionIds, serverURL,'Contact', recordDetails);
                if(createContact.response){
                    contactRecId = createContact.recordId;
                      system.debug('ContactOld' + contactRecId);
                    displayConnectButtons = false;
                    // ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'ContactOld ' + createContact.recordId);
                    // ApexPages.addMessage(myMsg);
                    booleanConnections();
                    
                    
                    
                  //  String querys = 'select Id,Credit_Amount__c,Debit_Amount__c from Contact where id = \''+ contactRecId + '\'';
                    SFDCApiUtil.verifyResponseClass reverifyContact = SFDCApiUtil.verifyDetails(sessionIds, serverURL, query);
                    if(reverifyContact.response){
                        if(reverifyContact.hasDetails){
                            contactRecId = reverifyContact.recordId;
                            system.debug('the map values are contactRecId' + contactRecId);
                            accountBalance = reverifyContact.creditAmount - reverifyContact.debitAmount;
                            if(accountBalance == Null){
                                accountBalance = 0;
                            }
                        }
                    }
                }
                else{
                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Contact ' + createContact.responsemessage);
                    ApexPages.addMessage(myMsg);
                    booleanConnections();
                }
            }
        }
        else{
            // ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Contact ' + verifyContact.creditAmount + ' Debit '+verifyContact.debitAmount);
            // ApexPages.addMessage(myMsg);
            booleanConnections();
        }
    }







    
    //  static testmethod void testmanualMapping() {
    //     List<StaticResource> sr = [Select body, name from StaticResource where Name = 'jsonbundle_DFC'];
    //     System.assert(sr.size() > 0);
    // }
    public PageReference openTouchHome(){
        pageReference Pg = new pageReference('/apex/TouchAnalytics_UI') ;
        pg.setRedirect(true);
        return pg;
         
    }
    
    public Object manualMapping {
        get {
            StaticResource sr = [
                select Body
                from StaticResource
                where Name = 'jsonbundle_DFC'
            ];
            return sr.Body.toString();
        }
    }
    
//   static testmethod void testrestricted() {
//         List<StaticResource> sr = [Select body, name from StaticResource where Name = 'restricted_DFC'];
//         System.assert(sr.size() > 0);
//     }
    
    public Object restricted {
        get {
            StaticResource sr = [
                select Body
                from StaticResource
                where Name = 'restricted_DFC'
            ];
            return sr.Body.toString();
        }
    }
}