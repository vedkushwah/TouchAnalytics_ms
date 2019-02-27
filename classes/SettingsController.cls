public with sharing class SettingsController {
    public boolean chbxvalue{get;set;} 
    public String listVal{get;set;}
    public String timezoneVal{get;set;}
    public User currentUser{get;set;}
    public Boolean backups{get;set;}
    public List<SelectOption> selectVal{get;set;}
    public List<SelectOption> options{get;set;}
    public List<SelectOption> selectDashBoard{get;set;}
    public String selectApp{get;set;}
    public String dashBoardName{get;set;} 
    public List<DashBoard_Backup__c> dashList{get;set;}
    public List<SelectOption> getFloderList{get;set;}
    public Boolean rowTrue{get;set;}
    public String user{get;set;}
    public String password{get;set;}
    public String securitytoken{get;set;}
    public Decimal numberOfBackups{get;set;}
    public boolean displayUserDetails{get;set;}
    public boolean userDetails{get;set;}
    public boolean dashBoardSuccessMessage{get;set;}
    public Boolean remoteSiteSettings{get;set;} 
    public Blob Key{get;set;}
    public String result { get; set; }
    public Integer scheduleHour{get;set;}
    public Datetime now{get;set;}
    public DateTime local{get;set;}
    public DateTime localizeTime{get;set;}
    public decimal differenceHours{get;set;}
    public Datetime scheduleTime{get;set;}
    public datetime actualscheduleTime{get;set;}
    public Boolean iserror{get;set;}
    public Boolean usererror{get;set;}
    public Boolean passworderror{get;set;}
    public Boolean backuperror{get;set;}
    public Boolean dashboardBackup{get;set;}
    public Boolean dashboardBackupError{get;set;}
    public Boolean successMessage{get;set;}
    public Boolean errorMessage{get;set;}
    public string NewdashboardName {get;set;}
    public String dashboardJSONString{get;set;}
    public String finalResponse{get;set;}
    public Boolean dashboardCreated{get;set;}
    public Boolean dashboardNotCreated{get;set;}
    public String dashboardURL{get;set;}
    public String Folders{get;set;}
    
    public List<Remote_Site_Settings__c> getvalues()
    {
      values=new List<Remote_Site_Settings__c>();
      values=[SELECT id,name,Remote_Settings__c, Notification__c, Time__c, User_Email__c, No_of_backups__c from  Remote_Site_Settings__c limit 1];
      return values;  
    }
    
    public void scheduleBackUp(){ 
    	backups = true;
        if(!Test.isRunningTest()){ 
        integer selectedTime = integer.valueOf(listVal);
        now = system.now();
        Integer offset = UserInfo.getTimezone().getOffset(now);
        local = now.addSeconds((offset/1000));

        Timezone tz = Timezone.getTimeZone(timezoneVal);
        Integer NewYorkOffSet = tz.getOffset(now);
        localizeTime = now.addSeconds((NewYorkOffSet/1000));
        
        differenceHours = ((local.getTime())/1000/60/60) - ((localizeTime.getTime())/1000/60/60);
        scheduleTime = datetime.newInstance(system.today().year(), system.today().month(), system.today().day(), selectedTime, 00, 00).addSeconds((offset/1000));
        
        actualscheduleTime = scheduleTime.addHours(Integer.valueOf(differenceHours));
        
        scheduleHour = actualscheduleTime.hourGmt();
        }
        system.debug('Response String'); 
        List<Remote_Site_Settings__c> customSettingDetails = [Select Id, 
                                                                                    Password__c, 
                                                                                    Security_Token__c,
                                                                                    Session_Id__c,
                                                                                    Username__c,
                                                                                    Remote_Settings__c,
                                                                                    No_of_backups__c,
                                                                                    Schedule_Job__c
                                                                                    from Remote_Site_Settings__c limit 1];
       
              
        
        
        if(customSettingDetails.size()>0){    
            if(customSettingDetails[0].Remote_Settings__c == true){
                
            string passwordstring = '';
            if(customSettingDetails[0].Password__c != null){
                if(!Test.isRunningTest()){
                    result = Crypto.decryptwithmanagediv('AES128',key,EncodingUtil.base64decode(customSettingDetails[0].Password__c)).tostring();
                }
                passwordstring = result;
            }
            if(customSettingDetails[0].Security_Token__c != null){
                passwordstring = passwordstring + customSettingDetails[0].Security_Token__c;
            }
            Login.responseClass responseDetails = Login.login1(customSettingDetails[0].Username__c, passwordstring);
            
            
            for(Remote_Site_Settings__c cus : customSettingDetails){
                if(Schema.sObjectType.Remote_Site_Settings__c.fields.No_of_backups__c.isUpdateable()){
            	    cus.No_of_backups__c = numberOfBackups;
            	    
            	   
                }     
            }
            update customSettingDetails;
            system.debug('custom '+customSettingDetails);
           
            if(responseDetails != null){
                
                if(responseDetails.response == true){
                     
                    displayUserDetails = false;
                    rowTrue = true;
                    createSetting(string.valueOf(scheduleHour));
                    
                    DashBoard_Backup_ScheduleClass.start(string.valueOf(scheduleHour)); 
                    Insert_Attachment_ScheduleClass.start(string.valueOf(scheduleHour));
                    Remote_Site_Settings__c CS = Remote_Site_Settings__c.getValues('Touch Analytics');
                    
                    if(CS.Schedule_Job__c == false){
                        if(Schema.sObjectType.Remote_Site_Settings__c.fields.Schedule_Job__c.isUpdateable()){
                            NumberOfBackups_ScheduleClass.start();
                            CS.Schedule_Job__c = true;
                            update CS;
                        }
                        
                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.Error,'Schedule Job started successfully'); 
                 	ApexPages.addMessage(myMsg);    
                    }
                    
                     
                       
                    
                    /*else{
                    	backuperror = true;
                    	ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.Error,'Number of Backups to keep is required'); 
                 		ApexPages.addMessage(myMsg);
                    	
                    }*/
                      
                }
                else if(responseDetails.response == false){
                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Please provide user details to Schedule Job'); 
                    ApexPages.addMessage(myMsg);
                    userDetails = true;
                    dashBoardSuccessMessage = false;
                }
            }
        }
        }
        
    }
    
    public void scheduleNumberOfBackups(){ 
    	
    	List<Remote_Site_Settings__c> customSettingsList = [Select Id, 
                                                                                    Password__c, 
                                                                                    Security_Token__c,
                                                                                    Session_Id__c,
                                                                                    Username__c,
                                                                                    Remote_Settings__c,
                                                                                    No_of_backups__c
                                                                                    from Remote_Site_Settings__c limit 1];
      if(customSettingsList.size() > 0) {                                                                           
        	for(Remote_Site_Settings__c cus : customSettingsList){
            	cus.No_of_backups__c = numberOfBackups;
            }
              update customSettingsList;
                                                                                           
      }                                                                              
    }
    
    public String Host {get;set;}
    public string HostUrl {get;set;}
    public string BaseUrl {get;set;}
    public string BaseUrl1 {get;set;}
    public List<Remote_Site_Settings__c> values=new List<Remote_Site_Settings__c>();
    String userName = UserInfo.getUserName();
            User activeUser = [Select Email From User where Username = : userName limit 1];
            String userEmail = activeUser.Email; 

    public SettingsController(){
    	
    	remoteSiteSettings = false;
    	dashBoardSuccessMessage = false;
    	userDetails = false;
    	successMessage = false;
    	errorMessage = false; 
        dashboardCreated = false;
        dashboardNotCreated = false;
        iserror = false;
        usererror = false;
        passworderror = false;
        backuperror = false;
        dashboardBackup = false;
        dashboardBackupError = false;
        getTimeZones();
        folderList();
        dashList = [select Id, Name from DashBoard_Backup__c order by CreatedDate desc limit 900];
        selectDashBoard = new List<SelectOption>();
        //selectDashBoard.add(new SelectOption('','-----None-----'));
        if(dashList.size() > 0){
        dashBoardName = string.valueOf(dashList[0].Id);
        }
        for(DashBoard_Backup__c dash : dashList){
            selectDashBoard.add(new SelectOption(dash.Id,dash.Name)); 
        }
        system.debug('remote******'+remoteSiteSettings);
        
        //key = Blob.valueOf('8cPkWGCoHv9a3D7K');
        
        
        BaseUrl1 = System.URL.getSalesforceBaseUrl().getHost();
        HostUrl = ApexPages.currentPage().getHeaders().get('Host');
 
        values=new List<Remote_Site_Settings__c>();
        values=[SELECT id,name,Notification__c,Time__c, Remote_Settings__c, Username__c,User_Email__c,Key__c,Schedule_Job__c from  Remote_Site_Settings__c limit 1];
         if(values.size()>0){
         remoteSiteSettings = values[0].Remote_Settings__c;
         }
         
         rowTrue = true;
         if(values.size() > 0){
         	key = Blob.valueOf(values[0].Key__c);
         }
        if(remoteSiteSettings == true){
        	getFolderNames();
        }
         
         
         currentUser = [Select Name, Email, TimeZoneSidKey from User where id =: USerInfo.getUserId()];
         List<CronTrigger> ct = [SELECT Id FROM CronTrigger WHERE CronJobDetail.Name = 'Schedule Backup'];
         if(ct.size() > 0){
             rowTrue = true;
         }
         else{
         	
            rowTrue = false; 
         }
         
         List<CronTrigger> ct1 = [SELECT Id FROM CronTrigger WHERE CronJobDetail.Name = 'Schedule No of Backups'];
         
         if(ct1.size() > 0){
             backups = true;
         }
         else{
            backups = false; 
         }
            
            List<Remote_Site_Settings__c> customSettingDetails = [Select Id, 
                                                                                    Password__c, 
                                                                                    Security_Token__c,
                                                                                    Session_Id__c,
                                                                                    Username__c,
                                                                                    Base_URL__c,
                                                                                    No_of_backups__c
                                                                                    from Remote_Site_Settings__c limit 1];
                                                                                 
            if(customSettingDetails.size()>0){
            	 user =  customSettingDetails[0].Username__c; 
            numberOfBackups = customSettingDetails[0].No_of_backups__c;
                BaseUrl = customSettingDetails[0].Base_URL__c;
                if (BaseUrl.startsWith('http:')){
                  BaseUrl = BaseUrl.replaceFirst('http:', 'https:');
                 }
     
                if(customSettingDetails[0].Username__c == '' || customSettingDetails[0].Username__c == null){
                    displayUserDetails = true;
                }                
            }
         
         selectVal = new List<SelectOption>();
         selectVal.add(new SelectOption('0','12:00 AM'));
         selectVal.add(new SelectOption('1','01:00 AM'));
         selectVal.add(new SelectOption('2','02:00 AM'));
         selectVal.add(new SelectOption('3','03:00 AM'));
         selectVal.add(new SelectOption('4','04:00 AM'));
         selectVal.add(new SelectOption('5','05:00 AM'));
         selectVal.add(new SelectOption('6','06:00 AM'));
         selectVal.add(new SelectOption('7','07:00 AM'));
         selectVal.add(new SelectOption('8','08:00 AM'));
         selectVal.add(new SelectOption('9','09:00 AM'));
         selectVal.add(new SelectOption('10','10:00 AM'));
         selectVal.add(new SelectOption('11','11:00 AM'));
         selectVal.add(new SelectOption('12','12:00 PM'));
         selectVal.add(new SelectOption('13','01:00 PM'));
         selectVal.add(new SelectOption('14','02:00 PM'));
         selectVal.add(new SelectOption('15','03:00 PM'));
         selectVal.add(new SelectOption('16','04:00 PM'));
         selectVal.add(new SelectOption('17','05:00 PM'));
         selectVal.add(new SelectOption('18','06:00 PM'));
         selectVal.add(new SelectOption('19','07:00 PM'));
         selectVal.add(new SelectOption('20','09:00 PM'));
         selectVal.add(new SelectOption('21','08:00 PM')); 
         selectVal.add(new SelectOption('22','10:00 PM'));
         selectVal.add(new SelectOption('23','11:00 PM'));
         
        
    } 
    
    public List<SelectOption> getTimeZones(){
        options = new List<SelectOption>();
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Map<String, Schema.SObjectField> referenceObjectFieldMap = schemaMap.get('User').getDescribe().fields.getMap();
        List<Schema.PicklistEntry> pick_list_values = referenceObjectFieldMap.get('TimeZoneSidKey').getDescribe().getPickListValues();
        for (Schema.PicklistEntry a : pick_list_values) {  
            options.add(new selectOption(a.getValue(), a.getLabel())); 
        } 
        
        system.debug('Picklist Values'+options);
        return options;
        
    } 
    
     public string FloderNames(){
        String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v39.0';
        String endpoint;
        endpoint = sfdcInstance + '/wave/folders?hasCurrentOnly=true';       
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);   
        req.setMethod('GET');
        req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
        req.setHeader('content-type', 'application/json');         
        HttpResponse res;
        
      if(!Test.isRunningTest()){
            res = http.send(req);            
            return res.getBody();  
        }
        else{
            String jString =        '{'+
        '  "folders" : [ {'+
        '    "applicationStatus" : "newstatus",'+
        '    "assetSharingUrl" : "https://touchbackup-dev-ed.my.salesforce.com/analytics/wave/application?assetId=00l46000001G5ogAAC&orgId=00D460000018G4L&loginHost=na40.salesforce.com&urlType=sharing",'+
        '    "attachedFiles" : [ ],'+
        '    "canBeSharedExternally" : false,'+
        '    "createdBy" : {'+
        '      "id" : "00546000001OzuTAAS",'+
        '      "name" : "Integration User",'+
        '      "profilePhotoUrl" : "/img/userprofile/default_profile_45_v2.png"'+
        '    },'+
        '    "createdDate" : "2017-04-19T05:29:18.000Z",'+
        '    "featuredAssets" : { },'+
        '    "icon" : {'+
        '      "id" : "00l46000001G5ogAAC",'+
        '      "name" : "16.png",'+
        '      "url" : "/analytics/wave/web/proto/images/app/icons/16.png"'+
        '    },'+
        '    "id" : "00l46000001G5ogAAC",'+
        '    "isPinned" : true,'+
        '    "label" : "Shared App",'+
        '    "lastAccessedDate" : "2017-05-19T13:58:42.000Z",'+
        '    "lastModifiedBy" : {'+
        '      "id" : "00546000001OzuTAAS",'+
        '      "name" : "Integration User",'+
        '      "profilePhotoUrl" : "/img/userprofile/default_profile_45_v2.png"'+
        '    },'+
        '    "lastModifiedDate" : "2017-04-19T05:29:18.000Z",'+
        '    "name" : "SharedApp",'+
        '    "namespace" : "Touch_Backup",'+
        '    "permissions" : {'+
        '      "manage" : true,'+
        '      "modify" : true,'+
        '      "view" : true'+
        '    },'+
        '    "shares" : [ ],'+
        '    "templateOptions" : { },'+
        '    "templateValues" : { },'+
        '    "type" : "folder",'+
        '    "url" : "/services/data/v39.0/wave/folders/00l46000001G5ogAAC"'+
        '  } ],'+
        '  "totalSize" : 1,'+
        '  "url" : "/services/data/v39.0/wave/folders"'+
        '}';
        
                return jString;
            }
            
             
    } 
    public List<DashBoards__c> childDashBoards{get;set;}
    public String folderName{get;set;}
    
    public void getDashBoardData(){
        
        childDashBoards = new List<DashBoards__c>();
        System.debug(selectApp+'Selected DashBoard'+dashBoardName);
        
        

        if(selectApp == 'ALL'){
            childDashBoards = [select Id, Name, Folder_Name__c,DashBoard_Label__c from DashBoards__c where Dashboard_Backup__c = :dashBoardName];
        }
        else{
            childDashBoards = [select Id, Name, Folder_Name__c,DashBoard_Label__c from DashBoards__c where Dashboard_Backup__c = :dashBoardName And Folder_Name__c=:selectApp];    
        }
        folderName = selectApp;
        system.debug('----------childDashBoards'+childDashBoards.size());
        
    }
    
    
    /*public PageReference createDashBoardFromBackup(){
        PageReference pr= new PageReference('/apex/Create_DashBoard_Controller_VF?Id='+childDashBoards[0].Id);
        return pr;
    }*/
    
     public void abort(){
        rowTrue = false;
        DashBoard_Backup_ScheduleClass.abort();
         Insert_Attachment_ScheduleClass.abort();
    } 
    
    public void createSetting(String listval){
        
        String Val;
          if(integer.valueof(listval) <= 11){
              val = listval+':00 AM';
          }
          if(integer.valueof(listval)== 0){
              val = '12:00 AM'; 
          }
          if(integer.valueof(listval) == 12){
              val = '12:00 PM';
          }
          if(integer.valueof(listval) >= 13){
              val = (Integer.valueof(listval)-12) +':00 PM';
          }
           
         if(values.Size()>0)
        {
          List<Remote_Site_Settings__c> insertquery=[SELECT Notification__c,Time__c,User_Email__c,No_of_backups__c  from Remote_Site_Settings__c Where id=:values[0].id LIMIT 1];
          if(insertquery.size()>0){
              insertquery[0].Time__c=Val+' '+currentUser.TimeZoneSidKey;
              insertquery[0].Notification__c=chbxvalue; 
              insertquery[0].User_Email__c =userEmail;
              insertquery[0].No_of_backups__c =numberOfBackups; 
              update insertquery[0];
          }
        }
    }
    
    
      public pageReference getAllDashboards(){
        dashboardBackup = false;
        dashboardBackupError = false;
        DashBoard_Backup__c db = new DashBoard_Backup__c();
        if(Schema.sObjectType.DashBoard_Backup__c.fields.Name.isCreateable() && Schema.sObjectType.DashBoard_Backup__c.fields.Full_Backup__c.isCreateable()){
            db.Name =System.Now()+''; 
            db.Full_Backup__c = true;
        }
        
        String responseBody;
        HttpResponse hRes = Dashboard_Backup_Service.retriveDashboard(UserInfo.getSessionId());
        
        responseBody = hRes.getBody();
        
        if(hRes.getStatus() == 'OK'){
            Dashboard_Backup_Parser dbr = Dashboard_Backup_Parser.parse(responseBody);
            List<DashBoards__c> dsbs = new List<DashBoards__c>();
            if(dbr.DashBoards != null){
                integer i=1;
                for(Dashboard_Backup_Parser.cls_DashBoards dash : dbr.DashBoards){
                    System.debug('$$$$$$$$$$$$$$$$$'+dash.lastModifiedDate+string.valueOf(system.Today()));
                      
                        if(Schema.sObjectType.DashBoards__c.fields.Name.isCreateable() && Schema.sObjectType.DashBoards__c.fields.DashBoard_Id__c.isCreateable()
                          && Schema.sObjectType.DashBoards__c.fields.URL__c.isCreateable() && Schema.sObjectType.DashBoards__c.fields.DashBoard_Label__c.isCreateable() && Schema.sObjectType.DashBoards__c.fields.Folder_Name__c.isCreateable()){
                            if(i < 1000){
                                DashBoards__c ds = new DashBoards__c();
                                ds.DashBoard_Id__c = dash.Id;
                                ds.Name = dash.Name;
                                ds.URL__c = dash.URL;
                                ds.DashBoard_Label__c = dash.Label;
                                ds.Folder_Name__c = dash.folder.Name;
                                dsbs.add(ds);
                                i = i+1;
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
            
      }
      dashBoardSuccessMessage = true;
      userDetails = false;
      if(db.id != null){
        dashboardBackup = true; 
        dashboardBackupError = false;
        dashList = [select Id, Name from DashBoard_Backup__c order by CreatedDate desc limit 900];
        selectDashBoard = new List<SelectOption>();
        if(dashList.size() > 0){
        dashBoardName = string.valueOf(dashList[0].Id);
        }
        for(DashBoard_Backup__c dash : dashList){
            selectDashBoard.add(new SelectOption(dash.Id,dash.Name)); 
        }           
        getDashBoardData();
          // pageReference pf = new pageReference('/'+db.id);
          //return pf;
      }
      else{
        dashboardBackupError = true;
        dashboardBackup = false; 
      }
      return null;
    }
    
    public void verifyError(){
        
        if(user != null && user != ''){
        iserror = false;    
        }
        else{
        usererror = true;   
        iserror = true;     
        }
        
        if(password != null && password != ''){
        iserror = false;    
        }
        else{
        passworderror = true;   
        iserror = true;     
        } 
        
            
    }
    public void verifyUserDetails(){
        verifyError();
        if(!iserror){
        Login.responseClass responseDetails = Login.login1(user, password+securitytoken);
        system.debug('ResponseDetails'+responseDetails);
        if(responseDetails != null){
            if(responseDetails.response == true){
                List<Remote_Site_Settings__c> customSettingDetails = [Select Id, 
                                                                                    Password__c, 
                                                                                    Security_Token__c,
                                                                                    Session_Id__c,
                                                                                    Username__c
                                                                                    from Remote_Site_Settings__c limit 1];
                                                                                   
                 if(!Test.isRunningTest()){                                                                   
                    result = EncodingUtil.base64Encode(Crypto.encryptwithmanagediv('AES128',key,blob.valueof(password))); 
                 }                                                                    
                if(customSettingDetails.size()>0){
                    
                    
                    
                    customSettingDetails[0].Password__c = result;
                    
                    customSettingDetails[0].Username__c = user;
                    customSettingDetails[0].Security_Token__c = securitytoken;
                    customSettingDetails[0].Session_Id__c = responseDetails.responsemessage;
                    customSettingDetails[0].Base_URL__c = System.URL.getSalesforceBaseUrl().toExternalForm();
                    update customSettingDetails[0];
                    
                    displayUserDetails = false;
                }
              ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Credentials Are Correct.'); 
              ApexPages.addMessage(myMsg);
              successMessage = true;
              errorMessage = false;
            }
            else if(responseDetails.response == false){
            	error = responseDetails.responsemessage;
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, responseDetails.responsemessage); 
                ApexPages.addMessage(myMsg);
                errorMessage = true;
                successMessage = false;
            }
        }
        }
        
    } 
    public String error{get;set;}
    public void triggerUserDetailSection(){
        displayUserDetails = true; 
    }
    
    public void remoteSiteSettings(){
        List<Remote_Site_Settings__c> customList = [Select Id, Remote_Settings__c from Remote_Site_Settings__c limit 1];
        customList[0].Remote_Settings__c = true;
        getFolderNames();
        update customList[0];
        remoteSiteSettings = true;
        
    } 
    
    public void getFolderNames(){
    	values=new List<Remote_Site_Settings__c>();
        values=[SELECT id,name,Notification__c,Time__c, Remote_Settings__c, Username__c,User_Email__c from  Remote_Site_Settings__c limit 1];
         remoteSiteSettings = values[0].Remote_Settings__c;
         
    	Backup_fromJSON  Fnames = new Backup_fromJSON();
         
        Folders = FloderNames();
        
        if(Folders != null && Folders != ''){
            Fnames =    Backup_fromJSON.parse(Folders);
        }
        
        
        getFloderList = new List<SelectOption>();
        if(Fnames.folders !=null)
        selectApp = 'ALL';
        getFloderList.add(new SelectOption('ALL','ALL'));
        for( Backup_fromJSON.cls_folders f : Fnames.folders){
            
            getFloderList.add(new SelectOption(f.name,f.name)); 
        
        }
        getDashBoardData();
    	
    }
    
    public List<SelectOption> selectFloder{get;set;}
    public String NewselectApp{get;set;}
    public list<SelectOption> folderList(){
    	Backup_fromJSON  Fnames = new Backup_fromJSON();
         
        Folders = FloderNames();
        
        if(Folders != null && Folders != ''){
            Fnames =    Backup_fromJSON.parse(Folders);
        }
        
        
        selectFloder = new List<SelectOption>();
        
        for( Backup_fromJSON.cls_folders f : Fnames.folders){
            
            selectFloder.add(new SelectOption(f.id,f.name)); 
        
        }
        return selectFloder; 
    }
    
    public void dashboardCal(){
         String dashboardid = System.currentPageReference().getParameters().get('dashboardId');
        List<DashBoards__c> dashList = new List<DashBoards__c>();
        List<Attachment> att = [select Body, Id from Attachment where parentId =: dashboardid ];
        System.debug(att.size()+ '******************** Size');
        if(att.size()>0){
             System.debug(att[0].Body.toString()+ '******************** Size');
            dashboardJSONString = att[0].Body.toString();
        }else{
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'JSON Attachment for the dashboard is not found'); 
            ApexPages.addMessage(myMsg);
        }
        system.debug('------------dashboardJSONString'+dashboardJSONString);
    }
    
    public PageReference redirect(){
        system.debug('Checking dashboard');
        String Names = System.currentPageReference().getParameters().get('Values');
        String Labels = System.currentPageReference().getParameters().get('Valuesone');
        dashboardCreated = false;
        dashboardNotCreated = false;
        String finalJSON = System.currentPageReference().getParameters().get('jsonString');
        system.debug('Checking dashboard &&&&&&& '+finalJSON);
        if(finalJSON != null && NewdashboardName != null && NewdashboardName.trim() != ''){
        finalJSON = finalJSON.replace('&quot;','\\\"');
        finalJSON = finalJSON.replace('&#92;', '\\\\');
        finalJSON = finalJSON.replace('&#39;','');
        finalJSON = finalJSON.replace('&amp;','&');
        finalJSON = finalJSON.replace('{"folder":{','{"folder":{"id":"'+NewselectApp+'","name":"'+NewselectApp+'"'); 
        finalJson = finalJson.replace('"label":"'+Labels+'"','"label":"'+NewdashboardName+'"');
        finalJson = finalJson.replace('"name":"'+Names+'",','');
        finalJson = finalJson.replace('"isFacet":false,','');
        finalJson = finalJson.replace('"isFacet":true,','');
        system.debug('New Folder'+finalJSON);
        finalJSON = '{"label":"'+NewdashboardName+'"'+',"folder":{"id":"'+NewselectApp+'","name":"'+NewselectApp+'"},'+finalJSON.subString(1,finalJSON.length());
            system.debug('New Folder11111 '+finalJSON);
            HttpResponse hRes =new HttpResponse();
            if(!Test.isRunningTest()){
                 hRes= CreateDashboardService.createDashboard(NewdashboardName, finalJSON);  
                 finalResponse = hRes.getBody();
            }
              system.debug('finalResponse@@@@@@@@ '+finalResponse);
              if(hRes.getStatus() == 'Created'){
                 dashboardCreated = true;
                 dashboardNotCreated = false;
                 String URL = System.URL.getSalesforceBaseUrl().toExternalForm()+'/analytics/wave/wave.apexp';
                 String str = '<a href="'+URL+'">Click here to go to Wave Analytics</a>';
                 dashboardURL = URL;
                 /*ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM,NewdashboardName+' DashBoard Created Successfully!!'+str); 
                 ApexPages.addMessage(myMsg);*/
                 return null;
                 
              }
              else{
                 dashboardNotCreated = true;
                 dashboardCreated = false;
               
              /* ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'DashBoard Not Created'+finalJSON); 
                ApexPages.addMessage(myMsg);*/
                  return null;
              } 
        }
      return null;  
    }    
}