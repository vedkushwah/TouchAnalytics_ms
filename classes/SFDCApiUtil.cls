public class SFDCApiUtil {
    
    private static final String NS_SOAP = 'http://schemas.xmlsoap.org/soap/envelope/';
    private static final String NS_SF = 'urn:partner.soap.sforce.com';
    
    private static final String soapNS = 'http://schemas.xmlsoap.org/soap/envelope/';
    private static final String xsi = 'http://www.w3.org/2001/XMLSchema-instance';
    private static final String urn = 'urn:enterprise.soap.sforce.com';
    private static final  String urn1 = 'urn:sobject.enterprise.soap.sforce.com';
    
    public static connectResponseClass connectToSFDC(){
        try{
            String passWord = '$AGsfdg90va3';
            String userName = 'integration@analyticscc.com';
            String endpointURL = 'https://login.salesforce.com/services/Soap/u/29.0';
            String securityToken = '';
            HttpRequest connectReq = new HttpRequest();
            connectReq.setMethod('POST');
            connectReq.setTimeout(60000);
            connectReq.setEndpoint(endpointURL);
            connectReq.setHeader('Content-Type', 'text/xml;charset=UTF-8'); 
            connectReq.setHeader('SOAPAction', '""');
            
            String requestBody = '<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">' +
                                    '<Header/>' +
                                    '<Body>' +
                                        '<login xmlns="urn:partner.soap.sforce.com">' +
                                            '<username>' + userName + '</username>' +
                                            '<password>' + passWord + '</password>' +
                                        '</login>' +
                                    '</Body>' +
                                '</Envelope>';  
            connectReq.setBody(requestBody);
            system.debug('requestBody&&&'+requestBody);
            Http connectHttp = new Http();
            HttpResponse connectResponse = new HttpResponse();
            system.debug('connectResponse*******'+connectResponse);
            connectResponse = connectHttp.send(connectReq);
            system.debug('connectResponse==='+connectResponse);
            if(connectResponse.getStatusCode() != 200){
                Dom.Document responseDocument = connectResponse.getBodyDocument();  
                Dom.Xmlnode rootElm = responseDocument.getRootElement(); 
                Dom.Xmlnode bodyElm = rootElm.getChildElement('Body', NS_SOAP); 
                Dom.Xmlnode faultElm = bodyElm.getChildElement('Fault', NS_SOAP); 
                Dom.Xmlnode faultStringElm = faultElm.getChildElement('faultstring', null); 
                connectResponseClass response = new connectResponseClass();
                response.response = false;
                response.responsemessage = faultStringElm.getText();
                return response;
            }
            else{
                Dom.Document responseDocument = connectResponse.getBodyDocument();
                Dom.Xmlnode rootElm = responseDocument.getRootElement();
                Dom.Xmlnode bodyElm = rootElm.getChildElement('Body', NS_SOAP);
                Dom.Xmlnode loginResponseElm = bodyElm.getChildElement('loginResponse', NS_SF);
                Dom.Xmlnode resultElm = loginResponseElm.getChildElement('result', NS_SF);
                Dom.Xmlnode sessionId = resultElm.getChildElement('sessionId', NS_SF);
                Dom.Xmlnode serverUrlElm = resultElm.getChildElement('serverUrl', NS_SF);
                connectResponseClass response = new connectResponseClass();
                response.response = true;
                response.sessionId = string.valueOf(sessionId.getText());
                response.responseServerUrl = string.valueOf(serverUrlElm.getText());
                system.debug('response------'+response);
                return response;
            }
        }
        catch(Exception exp){
            connectResponseClass response = new connectResponseClass();
            response.response = false;
            response.responsemessage = exp.getmessage();
            return response;
        }
    }
    
    public static createResponseClass createDetails(String sessionId, String serverURL, string objectName, map<String, String> recordInfo){
        try{
            URL endPointURL = new URL(serverURL);
            HttpRequest createDetailsRequest = new HttpRequest();
            HttpResponse createDetailsReponse = new HttpResponse();
            createDetailsRequest.setMethod('POST');   
            createDetailsRequest.setTimeout(60000);
            createDetailsRequest.setEndpoint('https://' + endPointURL.gethost() + '/services/Soap/u/10.0');
            createDetailsRequest.setHeader('Content-Type', 'text/xml;charset=UTF-8');
            createDetailsRequest.setHeader('SOAPAction', 'create');
            createDetailsRequest.setBody(generateCreateXML(sessionId, objectName, recordInfo));
            Http createDetailsHttp =  new Http();
            createDetailsReponse = createDetailsHttp.send(createDetailsRequest);
            if(createDetailsReponse.getStatusCode() == 200){
                dom.Document resDoc = createDetailsReponse.getBodyDocument();
                dom.XmlNode root = resDoc .getRootElement();
                DOM.XmlNode bodyNode = root.getChildElement('Body', 'http://schemas.xmlsoap.org/soap/envelope/');
                DOM.XmlNode createResponse = bodyNode.getChildElement('createResponse','urn:enterprise.soap.sforce.com');
                DOM.XmlNode[] result = createResponse.getChildElements();
                for(DOM.XmlNode resultRec : result){
                    DOM.XmlNode created = resultRec.getChildElement('created', 'urn:enterprise.soap.sforce.com');
                    DOM.XmlNode idvalue = resultRec.getChildElement('id', 'urn:enterprise.soap.sforce.com'); 
                    DOM.XmlNode success = resultRec.getChildElement('success', 'urn:enterprise.soap.sforce.com'); 
                    DOM.XmlNode errors = resultRec.getChildElement('errors', 'urn:enterprise.soap.sforce.com');
                    
                    if(idvalue.getText() != null || idvalue.getText() != ''){
                        createResponseClass createResponseRec = new createResponseClass();
                        createResponseRec.response = true;
                        createResponseRec.recordId = idvalue.getText();
                        return createResponseRec;
                    }
                    else{
                        createResponseClass createResponseRec = new createResponseClass();
                        createResponseRec.response = false;
                        createResponseRec.responsemessage = errors.getText();
                        return createResponseRec;
                    }
                }
                createResponseClass createResponseRec = new createResponseClass();
                createResponseRec.response = false;
                createResponseRec.responsemessage = 'Please Contact Admin';
                return createResponseRec;
            }
            else{
                createResponseClass createResponse = new createResponseClass();
                createResponse.response = false;
                createResponse.responsemessage = createDetailsReponse.getBody();  
                return createResponse;
            }
        }
        catch(Exception exp){
            createResponseClass createResponse = new createResponseClass();
            createResponse.response = false;
            createResponse.responsemessage = exp.getmessage();
            return createResponse;
        }
    }
    
    public static couponResponseClass getCouponInformation(String sessionId, String serverURL, String query){
        try{
            URL endPointURL = new URL(serverURL);
            HttpRequest couponInfoRequest = new HttpRequest();
            HttpResponse couponInfoResponse = new HttpResponse();
            couponInfoRequest.setMethod('POST');   
            couponInfoRequest.setTimeout(60000);
            couponInfoRequest.setEndpoint('https://' + endPointURL.gethost() + '/services/Soap/u/10.0');
            couponInfoRequest.setHeader('Content-Type', 'text/xml;charset=UTF-8');
            couponInfoRequest.setHeader('SOAPAction', 'query');
            couponInfoRequest.setBody(geneareQueryXML(sessionId, query));
            Http couponHttp = new Http();
            couponInfoResponse = couponHttp.send(couponInfoRequest);
            
            if(couponInfoResponse.getStatusCode() == 200){
                dom.Document resDoc = couponInfoResponse.getBodyDocument();
                dom.XmlNode root = resDoc .getRootElement();
                DOM.XmlNode bodyNode = root.getChildElement('Body', 'http://schemas.xmlsoap.org/soap/envelope/');
                DOM.XmlNode queryResponse = bodyNode.getChildElement('queryResponse','urn:enterprise.soap.sforce.com');
                DOM.XmlNode result = queryResponse.getChildElement('result','urn:enterprise.soap.sforce.com');
                DOM.XmlNode[] resultChild = result.getChildElements();
                for(DOM.XmlNode childRec : resultChild){ 
                    if(childRec.getName() == 'records'){
                        DOM.XmlNode[] Record = childRec.getChildElements();
                        integer discount = 0;
                        string couponId = '';
                        for(DOM.XmlNode recordFields : Record){
                            if(recordFields.getName().toLowerCase() == 'id'){
                                couponId = recordFields.getText();
                            }
                            if(recordFields.getName().toLowerCase() == 'Discount__c'){
                                discount = Integer.valueOf(recordFields.getText());
                            }
                        }
                        couponResponseClass couponRes = new couponResponseClass();
                        couponRes.couponId = couponId;
                        couponRes.response = true;
                        couponRes.discount = discount;
                        return couponRes;
                    }
                }
                couponResponseClass couponRes = new couponResponseClass();
                couponRes.response = false;
                couponRes.responsemessage = 'Coupon Not Found';
                return couponRes;
            }
            else{
                couponResponseClass couponRes = new couponResponseClass();
                couponRes.responsemessage = couponInfoResponse.getBody();
                couponRes.response = false;
                return couponRes;
            }
        }
        catch(Exception exp){
            couponResponseClass couponRes = new couponResponseClass();
            couponRes.responsemessage = exp.getmessage();
            couponRes.response = false;
            return couponRes;
        }
    }
    
    public static buildResponseClass getBuildCostformation(String sessionId, String serverURL, String query){
        try{
            URL endPointURL = new URL(serverURL);
            HttpRequest buildInfoRequest = new HttpRequest();
            HttpResponse buildInfoResponse = new HttpResponse();
            buildInfoRequest.setMethod('POST');   
            buildInfoRequest.setTimeout(60000);
            buildInfoRequest.setEndpoint('https://' + endPointURL.gethost() + '/services/Soap/u/10.0');
            buildInfoRequest.setHeader('Content-Type', 'text/xml;charset=UTF-8');
            buildInfoRequest.setHeader('SOAPAction', 'query');
            buildInfoRequest.setBody(geneareQueryXML(sessionId, query));
            Http couponHttp = new Http();
            buildInfoResponse = couponHttp.send(buildInfoRequest);
            
            if(buildInfoResponse.getStatusCode() == 200){
                dom.Document resDoc = buildInfoResponse.getBodyDocument();
                dom.XmlNode root = resDoc .getRootElement();
                DOM.XmlNode bodyNode = root.getChildElement('Body', 'http://schemas.xmlsoap.org/soap/envelope/');
                DOM.XmlNode queryResponse = bodyNode.getChildElement('queryResponse','urn:enterprise.soap.sforce.com');
                DOM.XmlNode result = queryResponse.getChildElement('result','urn:enterprise.soap.sforce.com');
                DOM.XmlNode[] resultChild = result.getChildElements();
                for(DOM.XmlNode childRec : resultChild){ 
                    if(childRec.getName() == 'records'){
                        DOM.XmlNode[] Record = childRec.getChildElements();
                         string listPrice = '';
                         string pricebookId = '';
                        for(DOM.XmlNode recordFields : Record){
                            if(recordFields.getName().toLowerCase() == 'UnitPrice'){
                                listPrice = recordFields.getText();
                            }
                            if(recordFields.getName().toLowerCase() == 'Id'){
                                pricebookId = recordFields.getText();
                            }                            

                        }
                        buildResponseClass couponRes = new buildResponseClass();
                        couponRes.response = true;
                        couponRes.listPrice = listPrice;
                        couponRes.pricebookId = pricebookId;
                        return couponRes;
                    }
                }
                buildResponseClass couponRes = new buildResponseClass();
                couponRes.response = false;
                couponRes.responsemessage = 'Coupon Not Found';
                return couponRes;
            }
            else{
                buildResponseClass couponRes = new buildResponseClass();
                couponRes.responsemessage = buildInfoResponse.getBody();
                couponRes.response = false;
                return couponRes;
            }
        }
        catch(Exception exp){
            buildResponseClass couponRes = new buildResponseClass();
            couponRes.responsemessage = exp.getmessage();
            couponRes.response = false;
            return couponRes;
        }
    }    
    
    public static verifyResponseClass verifyDetails(String sessionId, String serverURL, String query){
        try{
            URL endPointURL = new URL(serverURL);
            HttpRequest verifyRequest = new HttpRequest();
            HttpResponse verifyDetailsResponse = new HttpResponse();
            verifyRequest.setMethod('POST');   
            verifyRequest.setTimeout(60000);
            verifyRequest.setEndpoint('https://' + endPointURL.gethost() + '/services/Soap/u/10.0');
            verifyRequest.setHeader('Content-Type', 'text/xml;charset=UTF-8');
            verifyRequest.setHeader('SOAPAction', 'query');
            verifyRequest.setBody(geneareQueryXML(sessionId, query));
            Http verifyHttp = new Http();
            verifyDetailsResponse = verifyHttp.send(verifyRequest);
            if(verifyDetailsResponse.getStatusCode() == 200){
                boolean hasRecords = false;
                dom.Document resDoc = verifyDetailsResponse.getBodyDocument();
                dom.XmlNode root = resDoc .getRootElement();
                DOM.XmlNode bodyNode = root.getChildElement('Body', 'http://schemas.xmlsoap.org/soap/envelope/');
                DOM.XmlNode queryResponse = bodyNode.getChildElement('queryResponse','urn:enterprise.soap.sforce.com');
                DOM.XmlNode result = queryResponse.getChildElement('result','urn:enterprise.soap.sforce.com');
                DOM.XmlNode[] resultChild = result.getChildElements();
                for(DOM.XmlNode childRec : resultChild){ 
                    if(childRec.getName() == 'records'){
                        DOM.XmlNode[] Record = childRec.getChildElements();
                        
                        string recordId = '';
                        integer creditAmount = 0;
                        integer debitAmount = 0;
                        
                        for(DOM.XmlNode recordFields : Record){
                            if(recordFields.getName().toLowerCase() == 'id'){
                                hasRecords = true;
                                recordId = recordFields.getText();
                            }
                            if(recordFields.getName().toLowerCase() == 'Credit_Amount__c'){
                                if(recordFields.getText() != null && recordFields.getText() != ''){
                                    creditAmount = Integer.valueOf(recordFields.getText());
                                }
                                else{
                                    creditAmount = 0;  
                                }
                            }
                            if(recordFields.getName().toLowerCase() == 'Debit_Amount__c'){
                                if(recordFields.getText() != null && recordFields.getText() != ''){
                                    debitAmount = Integer.valueOf(recordFields.getText());
                                }
                                else{
                                    debitAmount = 0;  
                                }
                            }
                        }
                        system.debug(recordId + ' *********** '+ hasRecords);
                        if(hasRecords){
                            verifyResponseClass verifyResponse = new verifyResponseClass();
                            verifyResponse.response = true;
                            verifyResponse.hasDetails = true;
                            verifyResponse.recordId = recordId;
                            
                            if(query.toLowerCase().contains(' contact ')){
                                if(creditAmount != null){
                                    verifyResponse.creditAmount = creditAmount;
                                }
                                else{
                                    verifyResponse.creditAmount = 0;
                                }
                                if(debitAmount != null){
                                    verifyResponse.debitAmount = debitAmount;
                                }
                                else{
                                   verifyResponse.debitAmount = 0; 
                                }
                            }
                            return verifyResponse;
                        }
                    }
                }
                if(!hasRecords){
                    verifyResponseClass verifyResponse = new verifyResponseClass();
                    verifyResponse.response = true;
                    verifyResponse.hasDetails = false;
                    verifyResponse.responsemessage = verifyDetailsResponse.getBody();
                    return verifyResponse;
                }
                else{
                    verifyResponseClass verifyResponse = new verifyResponseClass();
                    verifyResponse.response = true;
                    verifyResponse.hasDetails = false;
                    verifyResponse.responsemessage = verifyDetailsResponse.getBody();
                    return verifyResponse;
                }
            }
            else{
                verifyResponseClass verifyResponse = new verifyResponseClass();
                verifyResponse.response = false;
                verifyResponse.responsemessage = verifyDetailsResponse.getBody();
                return verifyResponse;
            }
        }
        catch(Exception exp){
            verifyResponseClass verifyResponse = new verifyResponseClass();
            verifyResponse.response = false;
            verifyResponse.responsemessage = exp.getmessage();
            return verifyResponse;
        }
    }
    
    public static string geneareQueryXML(String str_sessionId, String str_query){
        DOM.Document doc = new DOM.Document();
        Dom.XmlNode envelope = doc.createRootElement('Envelope', soapNS, 'soapenv');
        envelope.setNamespace('urn', urn);
        Dom.Xmlnode Header = envelope.addChildElement('soapenv:Header', null, null);
        Dom.Xmlnode SessionHeader = Header.addChildElement('urn:SessionHeader', null, null);
        Dom.Xmlnode sessionId = SessionHeader.addChildElement('urn:sessionId', null, null);
        sessionId.addTextNode(str_sessionId);
        Dom.XmlNode bodyRoot = doc.getRootElement();
        Dom.Xmlnode body = bodyRoot.addChildElement('soapenv:Body', null, null);
        Dom.Xmlnode query = body.addChildElement('urn:query', null, null);
        Dom.Xmlnode queryStringNode = query.addChildElement('urn:queryString', null, null);
        queryStringNode.addTextNode(str_query);
        return doc.toXmlString();
    }
    
    public static string generateCreateXML(String str_sessionId, String str_ObjectName, Map<String, String> recordInfo){
        DOM.Document doc = new DOM.Document();
        Dom.XmlNode envelope= doc.createRootElement('Envelope', soapNS, 'soapenv');
        envelope.setNamespace('urn', urn);
        envelope.setNamespace('urn1', urn1);
        envelope.setNamespace('xsi', xsi);
            
        Dom.Xmlnode Header = envelope.addChildElement('soapenv:Header', null, null);
        Dom.Xmlnode SessionHeader = Header.addChildElement('urn:SessionHeader', null, null);
        Dom.Xmlnode sessionId = SessionHeader.addChildElement('urn:sessionId', null, null);
        sessionId.addTextNode(string.valueOf(str_sessionId));
        //Body create 
        Dom.XmlNode bodyRoot = doc.getRootElement();
        Dom.Xmlnode body = bodyRoot.addChildElement('soapenv:Body',null,null);
    
        Dom.Xmlnode create = body.addChildElement('urn:create',null,null);
        Dom.Xmlnode sObjectsCreate = create.addChildElement('urn:sObjects ',null,null);
        sObjectsCreate.setAttribute('xsi:type', 'urn1:'+str_ObjectName);
        for(String objectField : recordInfo.keySet()){
            Dom.Xmlnode xmlfield = sObjectsCreate.addChildElement(objectField.trim() ,null,null);
            xmlfield.addTextNode(string.valueOf(recordInfo.get(objectField.trim())));
        }
        return doc.toXmlString(); 
    }
    
    
    
    public static createResponseClass createOpportunity(String sessionId, String serverURL, string objectName, map<String, String> recordInfo){
        try{
            URL endPointURL = new URL(serverURL);
            HttpRequest createDetailsRequest = new HttpRequest();
            HttpResponse createDetailsReponse = new HttpResponse();
            createDetailsRequest.setMethod('POST');   
            createDetailsRequest.setTimeout(60000);
            createDetailsRequest.setEndpoint('https://' + endPointURL.gethost() + '/services/Soap/u/10.0');
            createDetailsRequest.setHeader('Content-Type', 'text/xml;charset=UTF-8');
            createDetailsRequest.setHeader('SOAPAction', 'create');
            createDetailsRequest.setBody(generateCreateXML(sessionId, objectName, recordInfo));
            Http createDetailsHttp =  new Http();
            createDetailsReponse = createDetailsHttp.send(createDetailsRequest);
            if(createDetailsReponse.getStatusCode() == 200){
                dom.Document resDoc = createDetailsReponse.getBodyDocument();
                dom.XmlNode root = resDoc .getRootElement();
                DOM.XmlNode bodyNode = root.getChildElement('Body', 'http://schemas.xmlsoap.org/soap/envelope/');
                DOM.XmlNode createResponse = bodyNode.getChildElement('createResponse','urn:enterprise.soap.sforce.com');
                DOM.XmlNode[] result = createResponse.getChildElements();
                for(DOM.XmlNode resultRec : result){
                    DOM.XmlNode created = resultRec.getChildElement('created', 'urn:enterprise.soap.sforce.com');
                    DOM.XmlNode idvalue = resultRec.getChildElement('id', 'urn:enterprise.soap.sforce.com'); 
                    DOM.XmlNode success = resultRec.getChildElement('success', 'urn:enterprise.soap.sforce.com'); 
                    DOM.XmlNode errors = resultRec.getChildElement('errors', 'urn:enterprise.soap.sforce.com');
                    if(idvalue != null){
                        createResponseClass createResponseRec = new createResponseClass();
                        createResponseRec.response = true;
                        createResponseRec.recordId = idvalue.getText();
                        return createResponseRec;
                    }
                    else{
                        createResponseClass createResponseRec = new createResponseClass();
                        createResponseRec.response = false;
                        createResponseRec.responsemessage = errors.getText();
                        return createResponseRec;
                    }
                }
                createResponseClass createResponseRec = new createResponseClass();
                createResponseRec.response = false;
                createResponseRec.responsemessage = 'Please Contact Admin';
                return createResponseRec;
            }
            else{
                createResponseClass createResponse = new createResponseClass();
                createResponse.response = false;
                createResponse.responsemessage = createDetailsReponse.getBody();  
                return createResponse;
            }            
        }
        catch(Exception exp){
            createResponseClass createResponse = new createResponseClass();
            createResponse.response = false;
            createResponse.responsemessage = exp.getmessage();
            return createResponse;
        }
     return null;   
    }
    
    
    public static createResponseClass createOpportunityLineItem(String sessionId, String serverURL, string objectName, map<String, String> recordInfo){
        try{
            URL endPointURL = new URL(serverURL);
            HttpRequest createDetailsRequest = new HttpRequest();
            HttpResponse createDetailsReponse = new HttpResponse();
            createDetailsRequest.setMethod('POST');   
            createDetailsRequest.setTimeout(60000);
            createDetailsRequest.setEndpoint('https://' + endPointURL.gethost() + '/services/Soap/u/10.0');
            createDetailsRequest.setHeader('Content-Type', 'text/xml;charset=UTF-8');
            createDetailsRequest.setHeader('SOAPAction', 'create');
            createDetailsRequest.setBody(generateCreateXML(sessionId, objectName, recordInfo));
            Http createDetailsHttp =  new Http();
            createDetailsReponse = createDetailsHttp.send(createDetailsRequest); 
            if(createDetailsReponse.getStatusCode() == 200){
                dom.Document resDoc = createDetailsReponse.getBodyDocument();
                dom.XmlNode root = resDoc .getRootElement();
                DOM.XmlNode bodyNode = root.getChildElement('Body', 'http://schemas.xmlsoap.org/soap/envelope/');
                DOM.XmlNode createResponse = bodyNode.getChildElement('createResponse','urn:enterprise.soap.sforce.com');
                DOM.XmlNode[] result = createResponse.getChildElements();
                for(DOM.XmlNode resultRec : result){
                    DOM.XmlNode created = resultRec.getChildElement('created', 'urn:enterprise.soap.sforce.com');
                    DOM.XmlNode idvalue = resultRec.getChildElement('id', 'urn:enterprise.soap.sforce.com'); 
                    DOM.XmlNode success = resultRec.getChildElement('success', 'urn:enterprise.soap.sforce.com'); 
                    DOM.XmlNode errors = resultRec.getChildElement('errors', 'urn:enterprise.soap.sforce.com');
                    //system.debug('--------------'+idvalue.getText());
                    //system.debug('--------------'+errors.getText());
                    if(idvalue != null){
                        createResponseClass createResponseRec = new createResponseClass();
                        createResponseRec.response = true;
                        createResponseRec.recordId = idvalue.getText();
                        return createResponseRec;
                    }
                    else{
                        createResponseClass createResponseRec = new createResponseClass();
                        createResponseRec.response = false;
                        createResponseRec.responsemessage = errors.getText();
                        return createResponseRec;
                    }
                }
                createResponseClass createResponseRec = new createResponseClass();
                createResponseRec.response = false;
                createResponseRec.responsemessage = 'Please Contact Admin';
                return createResponseRec;
            }
            else{
                createResponseClass createResponse = new createResponseClass();
                createResponse.response = false;
                createResponse.responsemessage = createDetailsReponse.getBody();  
                return createResponse;
            }            
        }
        catch(Exception exp){
            createResponseClass createResponse = new createResponseClass();
            createResponse.response = false;
            createResponse.responsemessage = exp.getmessage();
            return createResponse;
        }
     return null;   
    }  
    
    
    public class createResponseClass{
        public boolean response {get;set;}
        public String responsemessage {get;set;}
        public String recordId {get;set;}
        public boolean hasDetails {get;set;}
    }
    
    public class connectResponseClass{
        public boolean response {get;set;}
        public String responsemessage {get;set;}
        public string responseServerUrl {get;set;}
        public string sessionId {get;set;}
    } 
    
    public class verifyResponseClass{
        public boolean response {get;set;}
        public String responsemessage {get;set;}
        public String recordId {get;set;}
        public boolean hasDetails {get;set;}
        public integer creditAmount {get;set;}
        public integer debitAmount {get;set;}
    }
    
    public class couponResponseClass{
        public boolean response {get;set;}
        public String responsemessage {get;set;}
        public String couponId {get;set;}
        public integer discount {get;set;}
    }
    public class buildResponseClass{
        public boolean response {get;set;}
        public String responsemessage {get;set;}
        public String listPrice {get;set;}
        public String pricebookId {get;set;}
    }
    
}