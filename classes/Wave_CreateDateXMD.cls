public with sharing class Wave_CreateDateXMD {
    public static String CreateDateXMD(String dataSetId){
        String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v39.0';
        
        String endpoint = sfdcInstance + '/wave/datasets/'+dataSetId;  
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);   
        req.setMethod('GET');
        req.setHeader('content-type', 'application/json');
        req.setHeader('Authorization','Bearer ' + UserInfo.getSessionId());      
       // req.setBody(Json_Overview_String.jsonMethod(DashboardName,FolderId));
        HttpResponse res;
        Wave_CreateDateXMD xmd = new Wave_CreateDateXMD();
        if(!Test.isRunningTest()){
            res = http.send(req);
            System.debug(' *********** Body '+ res.getBody());
            xmd = Wave_CreateDateXMD.parse(res.getBody());
        }
        
        
        
        
        System.debug(' *********** Rds  '+ xmd.currentVersionUrl );
        
        String reqBody = '{"dates": [  {    "alias": "Date",    "compact": false,    "fields": {      "day": "Date_Day",      "epochDay": "Date_day_epoch",      "epochSecond": "Date_sec_epoch",      "fullField": "Date",      "hour": "Date_Hour",      "minute": "Date_Minute",      "month": "Date_Month",      "quarter": "Date_Quarter",      "second": "Date_Second",      "week": "Date_Week",      "year": "Date_Year"    },    "firstDayOfWeek": -1,    "fiscalMonthOffset": 0,    "fullyQualifiedName": "Date",    "isYearEndFiscalYear": true,    "label": "Date",    "showInExplorer": false  }],"derivedDimensions": [],"derivedMeasures": [],"dimensions": [ ], "measures": [  ],"organizations": [],"showDetailsDefaultFields": []}';
        
        HttpRequest req2 = new HttpRequest();
        endpoint = URL.getSalesforceBaseUrl().toExternalForm() + xmd.currentVersionUrl + '/xmds/user';
        req2.setEndpoint(endpoint);   
        req2.setMethod('PUT');
        req2.setHeader('content-type', 'application/json');
        req2.setHeader('Authorization','Bearer ' + UserInfo.getSessionId());      
        req2.setBody(reqBody);
        if(!Test.isRunningTest()){
            res = http.send(req2);
            System.debug(endpoint + ' *********** Final '+ res.getBody() );
        }
        
        
        if(!Test.isRunningTest()){
            return res.getBody();
        }else{
            return '';
        }
    }
    
    
    
    public cls_createdBy createdBy;
    public String createdDate;  //2017-03-20T13:55:15.000Z
    public String currentVersionId; //0Fc360000010nneCAA
    public String currentVersionUrl;    ///services/data/v39.0/wave/datasets/0Fb360000008VSjCAM/versions/0Fc360000010nneCAA
    public cls_folder folder;
    public String id;   //0Fb360000008VSjCAM
    public String label;    //Opportunity Dummy Dataset 15
    public String lastAccessedDate; //2017-03-23T11:50:14.000Z
    public cls_lastModifiedBy lastModifiedBy;
    public String lastModifiedDate; //2017-03-20T13:55:31.000Z
    public String name; //Opportunity_Dummy_Dataset_15
    public String namespace;    //analyticscc
    public cls_permissions permissions;
    public String type; //dataset
    public String url;  ///services/data/v39.0/wave/datasets/0Fb360000008VSjCAM
    public String versionsUrl;  ///services/data/v39.0/wave/datasets/0Fb360000008VSjCAM/versions
    class cls_createdBy {
        public String id;   //00536000002nLlRAAU
        public String name; //Guest Uesr
        public String profilePhotoUrl;  //https://analyticscloudconsulting-dev-ed--c.na30.content.force.com/profilephoto/005/T
    }
    class cls_folder {
        public String id;   //00l36000000aa6TAAQ
        public String label;    //Touch Analytics
        public String name; //Touch_Analytics
        public String namespace;    //analyticscc
        public String url;  ///services/data/v39.0/wave/folders/00l36000000aa6TAAQ
    }
    class cls_lastModifiedBy {
        public String id;   //00536000002nHMoAAM
        public String name; //Integration User
        public String profilePhotoUrl;  //https://analyticscloudconsulting-dev-ed--c.na30.content.force.com/profilephoto/005/T
    }
    class cls_permissions {
        public boolean manage;
        public boolean modify;
        public boolean view;
    }
    public static Wave_CreateDateXMD parse(String json){
        return (Wave_CreateDateXMD) System.JSON.deserialize(json, Wave_CreateDateXMD.class);
    }
}