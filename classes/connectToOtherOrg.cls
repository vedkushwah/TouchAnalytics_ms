public without sharing  class connectToOtherOrg{
    // private static final String NS_SOAP = 'http://schemas.xmlsoap.org/soap/envelope/';
    // private static final String NS_SF = 'urn:partner.soap.sforce.com';
    // public boolean NewRender{get;set;}
    // public boolean NewRenders{get;set;}
    // public void connect(){
    //     //Organization org = [Select id from Organization limit 1];
    //     string passwordGiven = 'Analytics2017';
    //     string usrName = 'joseph@analyticscc.com';
    //     string endpointURL = 'https://login.salesforce.com/services/Soap/u/29.0';
    //     String userName = '';
    //     String passWord = '';
    //     string securityToken = '';
    //     userName = usrName;
    //     if(securityToken != null && securityToken != '') {
    //         passWord = passwordGiven + securityToken;
    //     }
    //     else {
    //         passWord = passwordGiven;
    //     }
    //     responseClass responseRec = new responseClass();
    //     HttpRequest req = new HttpRequest();
    //     HttpResponse res = new HttpResponse();
    //     req.setMethod('POST');   
    //     req.setTimeout(60000);
    //     req.setEndpoint(endpointURL);
    //     req.setHeader('Content-Type', 'text/xml;charset=UTF-8'); 
    //     //req.setHeader('Content-Type', 'application/json'); 
    //     req.setHeader('SOAPAction', '""');
    //     req.setBody('<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/"><Header/><Body><login xmlns="urn:partner.soap.sforce.com"><username>' + userName + '</username><password>' + passWord + '</password></login></Body></Envelope>');        
    //     string RecordSizeval = '';
    //     string RecordSizevals = '';
    //     String AccountIds = '';
    //     if(!Test.isRunningTest()){
    //         res =  new Http().send(req);
    //         if(res.getStatusCode() != 200){
    //             Dom.Document responseDocument = res.getBodyDocument();  
    //             Dom.Xmlnode rootElm = responseDocument.getRootElement(); 
    //             Dom.Xmlnode bodyElm = rootElm.getChildElement('Body', NS_SOAP); 
    //             Dom.Xmlnode faultElm = bodyElm.getChildElement('Fault', NS_SOAP); 
    //             Dom.Xmlnode faultStringElm = faultElm.getChildElement('faultstring', null); 
    //             responseRec.response = false;
    //             responseRec.responsemessage = faultStringElm.getText();
    //         }
    //         else{
    //             Dom.Document responseDocument = res.getBodyDocument();
    //             Dom.Xmlnode rootElm = responseDocument.getRootElement();
    //             Dom.Xmlnode bodyElm = rootElm.getChildElement('Body', NS_SOAP);
    //             Dom.Xmlnode loginResponseElm = bodyElm.getChildElement('loginResponse', NS_SF);
    //             Dom.Xmlnode resultElm = loginResponseElm.getChildElement('result', NS_SF);
    //             Dom.Xmlnode sessionId = resultElm.getChildElement('sessionId', NS_SF);
    //             Dom.Xmlnode serverUrlElm = resultElm.getChildElement('serverUrl', NS_SF);
    //             responseRec.response = true;
    //             responseRec.sessionId = string.valueOf(sessionId.getText());
    //             responseRec.responseServerUrl = string.valueOf(serverUrlElm.getText());
    //             HttpRequest req1 = new HttpRequest();
    //             HttpResponse res1 = new HttpResponse();
    //             req1.setMethod('POST');   
    //             req1.setTimeout(60000);
    //             req1.setEndpoint(responseRec.responseServerUrl);
    //             req1.setHeader('Content-Type', 'text/xml;charset=UTF-8');
    //             req1.setHeader('SOAPAction', 'query');
    //             req1.setBody('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:partner.soap.sforce.com" xmlns:urn1="urn:sobject.urn:partner.soap.sforce.com" xmlns:xsi="http://www.w3.org/2001/XMLSchema"><soapenv:Header><urn:SessionHeader><urn:sessionId>'+responseRec.sessionId+'</urn:sessionId></urn:SessionHeader></soapenv:Header><soapenv:Body><urn:query><urn:queryString>select Id,Name from Account where org_Id__c = \''+ userinfo.getOrganizationId()+'\'</urn:queryString></urn:query></soapenv:Body></soapenv:Envelope>');
    //             res1 =  new Http().send(req1 );
    //             if(res1.getStatusCode() != 200){
    //             }
    //             else{
    //                 Dom.Document responseDocuments = res1.getBodyDocument();
    //                 Dom.Xmlnode rootElms = responseDocuments.getRootElement();
    //                 Dom.Xmlnode bodyElms = rootElms.getChildElement('Body', NS_SOAP);
    //                 Dom.Xmlnode loginResponseElms = bodyElms.getChildElement('queryResponse', NS_SF);
    //                 Dom.Xmlnode resultElms = loginResponseElms.getChildElement('result', NS_SF);
    //                 Dom.Xmlnode recordSize = resultElms.getChildElement('size', NS_SF);
    //                 RecordSizeval = recordSize.getText();
    //                 if(RecordSizeval == '0'){
    //                 }
    //                 else{
    //                     Dom.Xmlnode accntIdsrec = resultElms.getChildElement('records', NS_SF);
    //                     Dom.Xmlnode accntIds = accntIdsrec.getChildElement('sf:id', NS_SF);
    //                     //Accountids = accntIds.getText();
    //                 }
    //             }
    //             HttpRequest req2 = new HttpRequest();
    //             HttpResponse res2 = new HttpResponse();
    //             req2.setMethod('POST');   
    //             req2.setTimeout(60000);
    //             req2.setEndpoint(responseRec.responseServerUrl);
    //             req2.setHeader('Content-Type', 'text/xml;charset=UTF-8');
    //             req2.setHeader('SOAPAction', 'query');
    //             req2.setBody('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:partner.soap.sforce.com" xmlns:urn1="urn:sobject.urn:partner.soap.sforce.com" xmlns:xsi="http://www.w3.org/2001/XMLSchema"><soapenv:Header><urn:SessionHeader><urn:sessionId>'+responseRec.sessionId+'</urn:sessionId></urn:SessionHeader></soapenv:Header><soapenv:Body><urn:query><urn:queryString>select Id, Name from Contact where User_Id__c = \''+ userinfo.getuserId()+'\'</urn:queryString></urn:query></soapenv:Body></soapenv:Envelope>');
    //             res2 =  new Http().send(req2 );
    //             if(res2.getStatusCode() != 200){
    //             }
    //             else{
    //                 Dom.Document responseDocuments = res2.getBodyDocument();
    //                 Dom.Xmlnode rootElms = responseDocuments.getRootElement();
    //                 Dom.Xmlnode bodyElms = rootElms.getChildElement('Body', NS_SOAP);
    //                 Dom.Xmlnode loginResponseElms = bodyElms.getChildElement('queryResponse', NS_SF);
    //                 Dom.Xmlnode resultElms = loginResponseElms.getChildElement('result', NS_SF);
    //                 Dom.Xmlnode recordSize = resultElms.getChildElement('size', NS_SF);
    //                 RecordSizevals = recordSize.getText();
    //             }
    //             if(RecordSizeval == '0'){
    //                 HttpRequest req5 = new HttpRequest();
    //                 HttpResponse res5 = new HttpResponse();
    //                 req5.setMethod('POST');   
    //                 req5.setTimeout(60000);
    //                 req5.setEndpoint(responseRec.responseServerUrl);
    //                 req5.setHeader('Content-Type', 'text/xml;charset=UTF-8');
    //                 req5.setHeader('SOAPAction', 'create');
    //                 req5.setBody('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:partner.soap.sforce.com" xmlns:urn1="urn:sobject.urn:partner.soap.sforce.com" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><soapenv:Header><urn:SessionHeader><urn:sessionId>'+responseRec.sessionId+'</urn:sessionId></urn:SessionHeader></soapenv:Header><soapenv:Body><urn:create><urn:sObjects xsi:type="urn1:Account"><Name>'+userinfo.getOrganizationId()+'</Name><org_id__c>'+userinfo.getOrganizationId()+'</org_id__c></urn:sObjects></urn:create></soapenv:Body></soapenv:Envelope>');
    //                 res5 =  new Http().send(req5);
    //                 if(res5.getStatusCode() != 200){
    //                 }
    //                 else{
    //                     Dom.Document responseDocuments = res5.getBodyDocument();
    //                     Dom.Xmlnode rootElms = responseDocuments.getRootElement();
    //                     Dom.Xmlnode bodyElms = rootElms.getChildElement('Body', NS_SOAP);
    //                     Dom.Xmlnode loginResponseElms = bodyElms.getChildElement('createResponse', NS_SF);
    //                     Dom.Xmlnode resultElms = loginResponseElms.getChildElement('result', NS_SF);
    //                     Dom.Xmlnode recordSize = resultElms.getChildElement('id', NS_SF);
    //                     AccountIds = recordSize.getText();
    //                 }
    //             }
    //             if(RecordSizevals == '0'){
    //                 HttpRequest req4 = new HttpRequest();
    //                 HttpResponse res4 = new HttpResponse();
    //                 req4.setMethod('POST');   
    //                 req4.setTimeout(60000);
    //                 req4.setEndpoint(responseRec.responseServerUrl);
    //                 req4.setHeader('Content-Type', 'text/xml;charset=UTF-8');
    //                 req4.setHeader('SOAPAction', 'create');
    //                 req4.setBody('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:partner.soap.sforce.com" xmlns:urn1="urn:sobject.urn:partner.soap.sforce.com" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><soapenv:Header><urn:SessionHeader><urn:sessionId>'+responseRec.sessionId+'</urn:sessionId></urn:SessionHeader></soapenv:Header><soapenv:Body><urn:create><urn:sObjects xsi:type="urn1:contact"><firstName>'+userinfo.getuserId()+'</firstName><lastName>'+userinfo.getuserId()+'</lastName><user_id__c>'+userinfo.getuserId()+'</user_id__c><AccountId>'+AccountIds+'</AccountId></urn:sObjects></urn:create></soapenv:Body></soapenv:Envelope>');
    //                 res4 =  new Http().send(req4);
    //                 if(res4.getStatusCode() != 200){
    //                 }
    //                 else{
    //                     Dom.Document responseDocuments = res4.getBodyDocument();
    //                     Dom.Xmlnode rootElms = responseDocuments.getRootElement();
    //                     Dom.Xmlnode bodyElms = rootElms.getChildElement('Body', NS_SOAP);
    //                     Dom.Xmlnode loginResponseElms = bodyElms.getChildElement('createResponse', NS_SF);
    //                     Dom.Xmlnode resultElms = loginResponseElms.getChildElement('result', NS_SF);
    //                     Dom.Xmlnode recordSize = resultElms.getChildElement('id', NS_SF);
    //                     //RecordSizevals = recordSize.getText();
    //                 }
    //             }
    //             else{
    //             }
    //         }
    //     }
    //     else{
    //         responseRec.response = true;
    //         responseRec.sessionId = 'sessionId';
    //         responseRec.responseServerUrl = 'https://ap2.salesforce.com';
    //     }
    // }
    // public class responseClass {
    //     public boolean response {get;set;}
    //     public String responsemessage {get;set;}
    //     public string responseServerUrl {get;set;}
    //     public string sessionId {get;set;}
    // } 
}