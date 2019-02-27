public class builKPIjoeytest {
    
    // public string sessionId {get;set;}
    // public string serverURL {get;set;}
    // public string accountRecId {get;set;}
    // public string contactRecId {get;set;}
    // public string opportunityRecId {get;set;}
    // public string opportunityLineItemRecId {get;set;}
    // public string recordTypeId {get;set;}
    // public string priceBookId {get;set;}
    
    
    // public string selectedDashboard {get;set;}
    // public boolean displayConnectButtons {get;set;}
    
    // public integer accountBalance {get;set;}
    // public integer BuildCost {get;set;}
    // public string CouponCode {get;set;}
    // public string CouponCodeId {get;set;}
    // public integer CouponValue {get;set;}
    // public integer TotalCost {get;set;}
    // public integer CreditsRemaining {get;set;}
    
    // public boolean isConnect{get;set;}
    // public boolean isCheckAccount{get;set;}
    // public boolean isCheckContact{get;set;}
    
    // public map<String, Integer> buildCostMap = new map<String, Integer>();
    
    // public builKPIjoeytest(){
    //     buildCostMap.put('01t41000004IXmbAAG', 0); //Insights (Single Auto)
    //     buildCostMap.put('01t41000004IXkHAAW', 5000); //Insights (Single)
    //     buildCostMap.put('01t41000004IXkgAAG', 1000); //Insights Configuration
    //     buildCostMap.put('01t41000004IXmgAAG', 40000); //Command (Multi Auto)
    //     buildCostMap.put('01t41000004IXmWAAW', 10000); //Command Configuration
    //     buildCostMap.put('01t41000004IXkMAAW', 5000); //Compare (Snapshot)
    //     buildCostMap.put('01t41000004IXklAAG', 1000); //Compare Configuration
    //     buildCostMap.put('01t41000004IXkRAAW', 7000); //Contrast (A vs. T)
    //     buildCostMap.put('01t41000004IXliAAG', 1400); //Contrast Configuration
    //     displayConnectButtons = true;
    //     isConnect = true;
    //     isCheckAccount = false;
    //     isCheckContact = false;
    // }
    
    
    // public void booleanConnections(){
    //     isConnect = false;
    //     isCheckAccount = false; 
    //     isCheckContact = false;
    // }
    // public void buildSelected(){
        
    //     try{
    //         if(selectedDashboard != 'Select'){
    //             if(buildCostMap.get(selectedDashboard) != null){
    //                 getBulidCost();
    //             }
    //             if(CouponValue != null){
    //                 TotalCost = BuildCost - CouponValue;
    //             }
    //             else{
    //                 TotalCost = BuildCost;
    //             }
    //             CreditsRemaining = accountBalance - TotalCost;
    //         }
    //         else{
    //             BuildCost = null;
    //             CouponValue = null;
    //             TotalCost = null;
    //             CreditsRemaining = null;
    //         }
    //     }
    //     catch(Exception exp){
    //         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, '' + exp.getmessage());
    //         ApexPages.addMessage(myMsg);
    //     }
    // }
    
    // public void getCouponInformation(){
    //     try{
    //         if(CouponCode != null && CouponCode != '' && selectedDashboard != null && selectedDashboard != ''){
    //             String query = 'select Id,Discount__c from Coupon__c where Name = \''+ CouponCode + '\' and Product__c = \''+ selectedDashboard + '\' and Active__c = true';
    //             SFDCApiUtil.couponResponseClass verifyCoupon = SFDCApiUtil.getCouponInformation(sessionId, serverURL, query);
    //             if(verifyCoupon.response){
    //                 CouponCodeId = verifyCoupon.couponId;
    //                 if(verifyCoupon.discount != null){
    //                     CouponValue = (BuildCost * verifyCoupon.discount) / 100;
    //                     TotalCost = BuildCost - CouponValue;
    //                     CreditsRemaining = accountBalance - TotalCost;
    //                 }
    //             }
    //             else{
    //                 CouponCodeId = '';
    //                 TotalCost = BuildCost;
    //                 CreditsRemaining = accountBalance - TotalCost;
    //                 ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, '' + verifyCoupon.responsemessage);
    //                 ApexPages.addMessage(myMsg);
    //             }
                
    //         }
    //     }
    //     catch(Exception exp){
    //         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, '' + exp.getmessage());
    //         ApexPages.addMessage(myMsg);
    //     }
    // }
    
    // public void getBulidCost(){
    //     try{
    //         if(selectedDashboard != null && selectedDashboard != ''){
    //             String query = 'select Id,UnitPrice from PricebookEntry where  Product2Id = \''+ selectedDashboard + '\' and IsActive = true limit 1';
    //             SFDCApiUtil.buildResponseClass verifyBuild = SFDCApiUtil.getBuildCostformation(sessionId, serverURL, query);
    //             if(verifyBuild.response){
    //                 if(verifyBuild.listPrice != null){
    //                     BuildCost = integer.valueOf(verifyBuild.listPrice);
    //                 }
    //                 if(verifyBuild.priceBookId != null){
    //                     priceBookId = verifyBuild.pricebookId;
    //                 }                    
    //                 ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Pricebook Id ' + verifyBuild.pricebookId);
    //                 ApexPages.addMessage(myMsg);

    //             }
    //             else{

    //                 ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'PriceBook Error' + verifyBuild.responsemessage);
    //                 ApexPages.addMessage(myMsg);
    //             }
    //         }
    //     }
    //     catch(Exception exp){
    //         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, '' + exp.getmessage());
    //         ApexPages.addMessage(myMsg);
    //     }
    // }    
    
    // public void connectToSFDC(){
    //     SFDCApiUtil.connectResponseClass connectResponse = SFDCApiUtil.connectToSFDC();
    //     if(connectResponse.response){
    //         sessionId = connectResponse.sessionId;
    //         serverURL = connectResponse.responseServerUrl;
    //         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, '' + connectResponse);
    //         ApexPages.addMessage(myMsg);
    //         booleanConnections();
    //         isCheckAccount = true;
    //     }
    //     else{
    //         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, '' + connectResponse.responsemessage);
    //         ApexPages.addMessage(myMsg);
    //         booleanConnections();
    //     }
    // }
    
    // public void verifyAccountDetails(){
    //     String query = 'select Id,Name from Account where org_Id__c = \''+ userinfo.getOrganizationId() + '\'';
    //     SFDCApiUtil.verifyResponseClass verifyAccount = SFDCApiUtil.verifyDetails(sessionId, serverURL, query);
    //     if(verifyAccount.response){
    //         if(verifyAccount.hasDetails){
    //             accountRecId = verifyAccount.recordId;
    //             ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Account ' + accountRecId);
    //             ApexPages.addMessage(myMsg);
    //             booleanConnections();
    //             isCheckContact = true;
    //         }
    //         else{
    //             Map<String, String> recordDetails = new Map<String, String>();
    //             recordDetails.put('Name', UserInfo.getOrganizationName());
    //             recordDetails.put('org_Id__c', UserInfo.getOrganizationId());
    //             SFDCApiUtil.createResponseClass createAccount = SFDCApiUtil.createDetails(sessionId, serverURL,
    //                                                                                         'Account', recordDetails);
    //             if(createAccount.response){
    //                 accountRecId = createAccount.recordId;
    //                 ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Account ' + createAccount.recordId);
    //                 ApexPages.addMessage(myMsg);
    //                 booleanConnections();
    //                 isCheckContact = true;
    //             }
    //             else{
    //                 ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Account ' + createAccount.responsemessage);
    //                 ApexPages.addMessage(myMsg);
    //                 booleanConnections();
    //             }
    //         }
    //     }
    //     else{
    //         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Account ' + verifyAccount.responsemessage);
    //         ApexPages.addMessage(myMsg);
    //         booleanConnections();
    //     }
    // }
    
    // public void verifyContactDetails(){
    //     String query = 'select Id,Credit_Amount__c,Debit_Amount__c from Contact where User_Id__c = \''+ userinfo.getuserId() + '\'';
    //     SFDCApiUtil.verifyResponseClass verifyContact = SFDCApiUtil.verifyDetails(sessionId, serverURL, query);
    //     if(verifyContact.response){
    //         if(verifyContact.hasDetails){
    //             displayConnectButtons = false;
    //             contactRecId = verifyContact.recordId;
    //             accountBalance = verifyContact.creditAmount - verifyContact.debitAmount;
    //             ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Contact ' + contactRecId);
    //             ApexPages.addMessage(myMsg);
    //             booleanConnections();
    //         }
    //         else{
    //             Map<String, String> recordDetails = new Map<String, String>();
    //             recordDetails.put('FirstName', UserInfo.getFirstName());
    //             recordDetails.put('LastName', UserInfo.getLastName());
    //             recordDetails.put('User_Id__c', userinfo.getuserId());
    //             recordDetails.put('AccountId', accountRecId);
    //             system.debug('the map values are' + recordDetails);
    //             SFDCApiUtil.createResponseClass createContact = SFDCApiUtil.createDetails(sessionId, serverURL,'Contact', recordDetails);
    //             if(createContact.response){
    //                 contactRecId = createContact.recordId;
    //                 displayConnectButtons = false;
    //                 ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Contact ' + createContact.recordId);
    //                 ApexPages.addMessage(myMsg);
    //                 booleanConnections();
                    
    //                 SFDCApiUtil.verifyResponseClass reverifyContact = SFDCApiUtil.verifyDetails(sessionId, serverURL, query);
    //                 if(reverifyContact.response){
    //                     if(reverifyContact.hasDetails){
    //                         contactRecId = verifyContact.recordId;
    //                         accountBalance = reverifyContact.creditAmount - reverifyContact.debitAmount;
    //                     }
    //                 }
    //             }
    //             else{
    //                 ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Contact ' + createContact.responsemessage);
    //                 ApexPages.addMessage(myMsg);
    //                 booleanConnections();
    //             }
    //         }
    //     }
    //     else{
    //         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Contact ' + verifyContact.responsemessage);
    //         ApexPages.addMessage(myMsg);
    //         booleanConnections();
    //     }
    // }
    
    // public string OpportunityStage{get;set;}
    // public void saveAndCancelDashboard(){
    //     String recordTypeName = 'ISV App Debit';
    //     String query = 'select id from recordType where name = \''+ recordTypeName + '\'';
    //     SFDCApiUtil.verifyResponseClass verifyRecordType = SFDCApiUtil.verifyDetails(sessionId, serverURL, query);
    //     if(verifyRecordType.response){
    //         if(verifyRecordType.hasDetails){
    //             recordTypeId = verifyRecordType.recordId;
    //             ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'recordType ' + recordTypeId);
    //             ApexPages.addMessage(myMsg);
    //             OpportunityStage = 'Save & Cancel';
    //             saveOpportunity();
    //         }

    //     }
    //     else{
    //         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'RecordType ' + verifyRecordType.responsemessage);
    //         ApexPages.addMessage(myMsg);
    //     }
    // }    
    
    // public void purchaseAndBuildDashboard(){
    //     String recordTypeName = 'ISV App Debit';
    //     String query = 'select id from recordType where name = \''+ recordTypeName + '\'';
    //     SFDCApiUtil.verifyResponseClass verifyRecordType = SFDCApiUtil.verifyDetails(sessionId, serverURL, query);
    //     if(verifyRecordType.response){
    //         if(verifyRecordType.hasDetails){
    //             recordTypeId = verifyRecordType.recordId;
    //             ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'recordType ' + recordTypeId);
    //             ApexPages.addMessage(myMsg);
    //             OpportunityStage = 'Purchase & Build';
    //             saveOpportunity();
    //         }

    //     }
    //     else{
    //         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'RecordType ' + verifyRecordType.responsemessage);
    //         ApexPages.addMessage(myMsg);
    //     }
    // }    
    
    // public void saveOpportunity(){
    //     Map<String, String> recordDetails = new Map<String, String>();
    //     recordDetails.put('Name', UserInfo.getOrganizationName());
    //     recordDetails.put('AccountId', accountRecId);
    //     recordDetails.put('Primary_Contact__c', contactRecId);
    //     recordDetails.put('StageName', OpportunityStage);
    //     recordDetails.put('recordTypeId', recordTypeId);
    //     recordDetails.put('CloseDate', string.valueOf(date.today()));
    //     SFDCApiUtil.createResponseClass createOpportunity = SFDCApiUtil.createOpportunity(sessionId, serverURL,'Opportunity', recordDetails);
    //     if(createOpportunity.response){
    //         opportunityRecId = createOpportunity.recordId;
    //         saveOpportunityLineItem();
    //         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Opportunity  Record Id' + createOpportunity.recordId);
    //         ApexPages.addMessage(myMsg);
    //     }
    //     else{
    //         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Opportunity ' + createOpportunity.responsemessage);
    //         ApexPages.addMessage(myMsg);
    //     }
    // }
    // public void saveOpportunityLineItem(){
    //     Map<String, String> recordDetails = new Map<String, String>();
    //     recordDetails.put('OpportunityId', opportunityRecId);
    //     recordDetails.put('Quantity', '1');
    //     recordDetails.put('PriceBookEntryId',priceBookId);
    //     //recordDetails.put('Product2Id',selectedDashboard);
    //     recordDetails.put('Unitprice',string.valueOf(BuildCost));
    //     if(CouponCodeId != '' && CouponCodeId != null){
    //         recordDetails.put('Coupon__c',CouponCodeId);
    //     }
  
    //     SFDCApiUtil.createResponseClass createOpportunityLineItem = SFDCApiUtil.createOpportunityLineItem(sessionId, serverURL,'OpportunityLineItem', recordDetails);
    //     if(createOpportunityLineItem.response){
    //         opportunityLineItemRecId = createOpportunityLineItem.recordId;
    //         displayConnectButtons = false;
    //         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'OpportunityLineItem Record Id' + createOpportunityLineItem.recordId);
    //         ApexPages.addMessage(myMsg);
    //     }
    //     else{
    //         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, ' OpportunityLineItem  ' + createOpportunityLineItem.responsemessage);
    //         ApexPages.addMessage(myMsg);
    //     }
    // }    
}