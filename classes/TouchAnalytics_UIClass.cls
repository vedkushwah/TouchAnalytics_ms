public with sharing class TouchAnalytics_UIClass {
    public List<SelectOption> DatasetValuesList{get;set;}
    public list<SelectOption> DatevalueList{get;set;}
    public list<SelectOption> DatevalueListone{get;set;}
    public list<SelectOption> DatevalueListtwo{get;set;}
    public List<SelectOption> MultiKPIList{get;set;}
    public List<SelectOption> SingleKPIList{get;set;}
    public List<SelectOption> SnapshotKPIList{get;set;}
    public List<SelectOption> SingleMultiLists{get;set;}
    public List<SelectOption> ActualTargetLists{get;set;}
    public List<SelectOption> CreatedUsersLists{get;set;}
    public List<SelectOption> DrillDashboardList{get;set;}
    public String DrillDashboard{get;set;}
    public String CreatedUsers{get;set;}
    public String CreatedUsersAll{get;set;}
    public String SingleMulti{get;set;}
      public String SingleMultis{get;set;}
    public String SelectKPIValue{get;set;}
    public string SelectKPIValue1{get;set;}
    public string SelectKPIValue2{get;set;}
    public string SelectKPIValue3{get;set;}
    public String SelectValue{get;set;}
    public String ThemeName{get;set;}
    public String MultiKPIValue{get;set;}
    public String SingleKPIValue{get;set;} 
    public string SingleKPIValue1{get;set;}
   // public string SingleKPIValue2{get;set;}
   // public string SingleKPIValue3{get;set;}
    public string DateValue{get;set;}
    public string DateValue1{get;set;}
    public string DateValue2{get;set;}
    public list<DB_Template__c> DBTemplatesList{get;set;}
    public string BaseUrl {get;set;}
    public string HostUrl {get;set;}
    public string PostUrl{get;set;}
    public String Host {get;set;}
    public Boolean remoteSiteSettings{get;set;} 
    public Map<String,String> DatasetMaps{get;set;}
    public boolean ConfigurationType{get;set;}
    public boolean MyDatasets{get;set;}  
    public String listVal{get;set;}
    public List<SelectOption> selectVal{get;set;}
    public List<analyticscc__Json_class__c> jsonList{get;set;}
    public list<Templateclass> Templatelist{get;set;}
      public list<Sales_Insight__c> Managelists{get;set;}
      public list<Json_class__c>Multilist{get;set;}
      public Boolean DisplaySuccessMessage{get;set;}
      public Organization org{get;set;}
      public User userData{get;set;}
    public TouchAnalytics_UIClass(){ 
        remoteSiteSettings = false;
        DatasetMaps = new Map<String,String>();
        DatasetValuesList = new list<selectoption>(); 
        DatevalueList =new list<selectoption>();
        DatevalueListone =new list<selectoption>();
        DatevalueListtwo =new list<selectoption>();
        MultiKPIList = new list<selectoption>(); 
        SingleKPIList = new list<selectoption>(); 
        SingleMultiLists = new list<selectoption>(); 
        selectVal = new List<selectOption>();
        SnapshotKPIList = new list<selectoption>(); 
        ActualTargetLists = new list<selectoption>(); 
        CreatedUsersLists = new list<selectoption>();
         DatasetInnerclassList = new list<DatasetInnerclass>();
        NewDatasetInnerclassList = new list<DatasetInnerclass>();
        DisplaySuccessMessage = false;
        SyncThemesBool = false;
        NoAcccountbalance = false;
        CouponValue = 0;
        sessionId = UserInfo.getSessionId();
        isConnect = true;
        system.debug('Connaction @@@@@@@@@@@ '+isConnect);
        //Managelists = [select Id,Name,Dashboard_Type__c from Sales_Insight__c];
        
        DrillDashboardList = new List<SelectOption>();
        DrillDashboardList.add(new selectOption('1', '1'));
        DrillDashboardList.add(new selectOption('2', '2'));
        DrillDashboardList.add(new selectOption('3', '3')); 
        
       
        
        
        
         NewDatasetInnerclassList = DatasetInnerclassList;
        
        DatevalueList.add(new selectOption('None','--None--'));
        DatevalueListone.add(new selectOption('None','--None--'));
        DatevalueListtwo.add(new selectOption('None','--None--'));
        CreatedUsersLists.add(new selectOption('All','--None--'));
        SingleMultiLists.add(new selectOption('All','--None--'));
        SingleMultiLists.add(new selectOption('Single KPI','Insights'));
        SingleMultiLists.add(new selectOption('Multi KPI','Command'));
        SingleMultiLists.add(new selectOption('Snapshot KPI','Compare'));
        SingleMultiLists.add(new selectOption('Actual/Target','Contrast'));
        
         
        selectVal.add(new selectOption('Insights','Insights'));
        selectVal.add(new selectOption('Command','Command'));
        selectVal.add(new selectOption('Compare','Compare'));
        selectVal.add(new selectOption('Contrast','Contrast')); 
        //SingleMultiLists.add(new selectOption('Sales Insights','Sales Insights'));
        SingleMulti = 'All';
        list<DB_Template__c> DBTemplates = [select Id,Name,DB_Name__c,Type__c,Section_Name_1__c,Section_Name_2__c,Section_Name_3__c,CreatedBy.Name,CreatedById,Description__c from DB_Template__c order By createddate desc limit 1000];
        MultiKPIList.add(new selectoption('None','--None--'));
        SingleKPIList.add(new selectoption('None','--None--')); 
        SnapshotKPIList.add(new selectoption('None','--None--')); 
        ActualTargetLists.add(new selectoption('None','--None--'));
        set<String> Stlist = new set<String>();
        for(DB_Template__c DBList : DBTemplates){
            if(!Stlist.contains(DBList.CreatedById)){
                CreatedUsersLists.add(new selectOption(DBList.CreatedById,DBList.CreatedBy.Name)); 
                Stlist.add(DBList.CreatedById);
            }
            if(DBList.Type__c == 'Multi KPI'){
                MultiKPIList.add(new selectoption(DBList.Id,DBList.DB_Name__c));
            }
            if(DBList.Type__c == 'Single KPI'){
                SingleKPIList.add(new selectoption(DBList.Id,DBList.DB_Name__c));
            }
            if(DBList.Type__c == 'Snapshot KPI'){
                SnapshotKPIList.add(new selectoption(DBList.Id,DBList.DB_Name__c));
            }
            if(DBList.Type__c == 'Actual/Target'){
                ActualTargetLists.add(new selectoption(DBList.Id,DBList.DB_Name__c));
            }
        }
        List<Remote_Site_Settings__c> customSettingDetails = [Select Id,
                                                                        Base_URL__c,
                                                                        Remote_Settings__c
                                                                        from Remote_Site_Settings__c limit 1];
        if(customSettingDetails.size() > 0){
            BaseUrl = customSettingDetails[0].Base_URL__c;
            if (BaseUrl != null && BaseUrl.startsWith('http:')){
               BaseUrl = BaseUrl.replaceFirst('http:', 'https:');
            }   
            remoteSiteSettings = customSettingDetails[0].Remote_Settings__c;
        }                
        HostUrl = ApexPages.currentPage().getHeaders().get('Host'); 
        //PostUrl = 'https://analyticscc.my.salesforce.com';
        if(remoteSiteSettings != false){
         DatasetFromJson  payTypes = new DatasetFromJson();   
        if(getDatasets() != null && getDatasets() != ''){ 
            payTypes = DatasetFromJson.parse(getDatasets());
        }         
        DatasetValuesList.add(new selectOption('None','--None--'));
        if(payTypes.datasets !=null){
            for(DatasetFromJson.cls_datasets Rep : payTypes.datasets){              
                DatasetValuesList.add(new selectOption(Rep.Id,Rep.Name));  
                DatasetMaps.put(Rep.Id,Rep.currentVersionId);
                DatasetInnerclassList.add(new DatasetInnerclass(Rep.label,Rep.Folder.Label,Rep.Name,Rep.Id,Rep.currentVersionId,'1',false,false,false,DrillDashboardList));
            } 
        }
        fromJSON  Fnames = new fromJSON(); 
        String Folders = FloderNames(); 
        if(Folders != null && Folders != ''){
            Fnames =    fromJSON.parse(Folders);
        }
        FolderLists = new List<SelectOption>();
        getFloderList = new List<SelectOption>();
        if(Fnames.folders !=null){
            FolderLists.add(new SelectOption('All','All'));
            FolderLists.add(new SelectOption('My Private App','My Private App'));
             getFloderList.add(new SelectOption(userInfo.getuserId(),'My Private App'));
            if(!Test.isRunningTest()){
                for( fromJSON.cls_folders f:Fnames.folders){
                    FolderLists.add(new SelectOption(f.label,f.label));
                     getFloderList.add(new SelectOption(f.id,f.name));
                     FloderList = f.id; 
                }
            }
        }
        
        
        
       
       
      
        //selectVal.add(new SelectOption('Sales Insights','Sales Insights')); 
        
        buildCostMap.put('01t41000004IXmb', 4000); //Insights (Single Auto)
        buildCostMap.put('01t41000004IXkHAAW', 5000); //Insights (Single)
        buildCostMap.put('01t41000004IXkgAAG', 1000); //Insights Configuration
        buildCostMap.put('01t41000004IXmgAAG', 40000); //Command (Multi Auto)
        buildCostMap.put('01t41000004IXmWAAW', 10000); //Command Configuration
        buildCostMap.put('01t41000004IXkMAAW', 5000); //Compare (Snapshot)
        buildCostMap.put('01t41000004IXklAAG', 1000); //Compare Configuration
        buildCostMap.put('01t41000004IXkRAAW', 7000); //Contrast (A vs. T)
        buildCostMap.put('01t41000004IXliAAG', 1400); //Contrast Configuration
        displayConnectButtons = true;
      // isConnect = false;
        isCheckAccount = false;
        isCheckContact = false;
        }
        
    }
    public String FloderList{get;set;}  
    public boolean TemplateFalse{get;set;}
    public Void Templates(){
        TemplateFalse = true;
        DBTemplatesList = new list<DB_Template__c>();
        Templatelist = new list<Templateclass>();
        if(SingleMulti == 'All' && CreatedUsers == 'All'){
            DBTemplatesList =  [select Id,Name,DB_Name__c,Type__c,Section_Name_1__c,Section_Name_2__c,Section_Name_3__c,CreatedDate,CreatedBy.Name,Description__c from DB_Template__c where Name != 'AutoMultiDataset' order By createddate desc limit 1000];
        }
        else if(SingleMulti != 'All' && CreatedUsers == 'All'){
            DBTemplatesList =  [select Id,Name,DB_Name__c,Type__c,Section_Name_1__c,Section_Name_2__c,Section_Name_3__c,CreatedDate,CreatedBy.Name,Description__c from DB_Template__c where Type__c =:SingleMulti and Name != 'AutoMultiDataset' order By createddate desc limit 1000];
            
        }
        else if(SingleMulti == 'All' && CreatedUsers != 'All'){
            DBTemplatesList =  [select Id,Name,DB_Name__c,Type__c,Section_Name_1__c,Section_Name_2__c,Section_Name_3__c,CreatedDate,CreatedBy.Name,Description__c from DB_Template__c where createdbyId =:CreatedUsers and Type__c != 'Multi KPIs' and Name != 'AutoMultiDataset' order By createddate desc limit 1000];
            
        }
        else if(SingleMulti != 'All' && CreatedUsers != 'All'){
            DBTemplatesList =  [select Id,Name,DB_Name__c,Type__c,Section_Name_1__c,Section_Name_2__c,Section_Name_3__c,CreatedDate,CreatedBy.Name,Description__c from DB_Template__c where Type__c =:SingleMulti and createdbyId =:CreatedUsers and Name != 'AutoMultiDataset' order By createddate desc limit 1000];
            
        }
        
        for(DB_Template__c DT :DBTemplatesList){
            String NewType;
            if(DT.Type__c == 'Multi KPI'){
                NewType = 'Command';
            }
            if(DT.Type__c == 'Single KPI'){
                NewType = 'Insights';
            }
            if(DT.Type__c == 'Snapshot KPI'){
                NewType = 'Compare';
            }
            if(DT.Type__c == 'Actual/Target'){
                NewType = 'Contrast';
            }
            
            Templatelist.add(new Templateclass(DT,NewType));
        }
    }
    public void Cancel(){
        TemplateFalse = false;
    }
    
    
    public pageReference Sales(){
        //sinvalueErr1 = false;
        //sinvalueErr = false;
       // if(SelectKPIValue != 'None'){
            //Dashboard_Backup_AC  DBUp = new Dashboard_Backup_AC();
            //DBUp.NewDashboardsSingle(Allval);
            pageReference Pg = new pageReference('/apex/SingleKPI_clone_NEW');
            return Pg;
      //  }
        
      /*  else{
            if(SelectKPIValue == 'None'){
                Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.ERROR, 'Please Select Dataset'));
            } */
            
           // return null;
       // }
        
    }
    //public boolean sinvalue{get;set;}
    //public boolean Mulvalue{get;set;}
    public boolean sinvalueErr{get;set;}
    public boolean MulvalueErr{get;set;}
    public boolean MulvalueErr1{get;set;}
    public boolean sinvalueErr1{get;set;}
    public pageReference MultiSales(){
        MulvalueErr1 = false;
        MulvalueErr = false;
        if(MultiKPIValue == 'None'){
            //Dashboard_Backup_AC  DBUp = new Dashboard_Backup_AC();
            //DBUp.NewDashboardsSingle1(Allval3);
            pageReference Pg = new pageReference('/apex/MultiKPI_NewUI?dbid=None&&theme='+Allval3);
            return Pg;
        }
        else{
            pageReference Pg = new pageReference('/apex/MultiKPI_NewUI?dbid='+MultiKPIValue);
            return Pg;
        }
    }
    
    public String ActualTarget{get;set;}
    public pageReference ActualTargetSales(){
       sinvalueErr1 = false;
        sinvalueErr = false;
        if(SelectKPIValue3 != 'None' && SelectKPIValue2 != 'None' && SelectKPIValue3 != SelectKPIValue2){
            //Dashboard_Backup_AC  DBUp = new Dashboard_Backup_AC();
            //DBUp.NewDashboardsSingle(Allval2);
            pageReference Pg = new pageReference('/apex/ActualTarget_VF?id='+SelectKPIValue2+'&&id1='+SelectKPIValue3+'&&dbid=None&&date='+DateValue1+'&&dateact='+DateValue2+'&&theme='+Allval2);
            return Pg;
        } 
        else if(SelectKPIValue3 == SelectKPIValue2){
            Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.ERROR, 'Please Select Different Datasets'));
            return null;
        }
        
        else{
            Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.ERROR, 'Please Select Both Datasets'));
            return null;
        }
    }
    
  /*  public pageReference CloneSales(){
        MulvalueErr1 = false;
        MulvalueErr = false;
        if(MultiKPIValue != 'None'){
        pageReference Pg = new pageReference('/apex/MultiKPI_NewUI?dbid='+MultiKPIValue);
        return Pg;
        }
        else{
            MulvalueErr1 = true;
            return null;
        }
    }   */
    public static String getDatasets() {
        String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v43.0';
        String endpoint;
        endpoint = sfdcInstance + '/wave/datasets?pageSize=200';         
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint); 
        req.settimeout(60000);
        req.setMethod('GET');
        req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
        req.setHeader('content-type', 'application/json');         
        HttpResponse res;
        
        if(!Test.isRunningTest()){
            res = http.send(req);            
            return res.getBody();  
        }
        else{
                return null;
            } 
    }      
    public void removedb(){
        string Rw = Apexpages.currentpage().getParameters().get('DeleteDB');
        System.debug('Debug for Delete' + Rw);
        DB_Template__c DBTemp = [select id from DB_Template__c where Id=: Rw];
        Delete DBTemp;
        if(SingleMulti == 'All'){
            
            DBTemplatesList =  [select Id,Name,DB_Name__c,Type__c,Section_Name_1__c,Section_Name_2__c,Section_Name_3__c,CreatedDate,CreatedBy.Name,Description__c from DB_Template__c order By createddate desc limit 1000];
        }
        else{
            DBTemplatesList =  [select Id,Name,DB_Name__c,Type__c,Section_Name_1__c,Section_Name_2__c,Section_Name_3__c,CreatedDate,CreatedBy.Name,Description__c from DB_Template__c where Type__c =:SingleMulti order By createddate desc limit 1000];          
        }
         Templatelist = new list<Templateclass>();
         for(DB_Template__c DT :DBTemplatesList){
            String NewType;
            if(DT.id != Rw){
                if(DT.Type__c == 'Multi KPI'){
                    NewType = 'Command';
                }
                if(DT.Type__c == 'Single KPI'){
                    NewType = 'Insights';
                }
                if(DT.Type__c == 'Snapshot KPI'){
                    NewType = 'Compare';
                }
                if(DT.Type__c == 'Actual/Target'){
                    NewType = 'Contrast';
                }
                
                Templatelist.add(new Templateclass(DT,NewType));
            }
        }
    }
    public Boolean NewRemoteSiteSettings{get;set;}
    public pageReference remoteSiteSettings(){
        List<Remote_Site_Settings__c> customList = [Select Id, Remote_Settings__c from Remote_Site_Settings__c limit 1];
        customList[0].Remote_Settings__c = true;
        update customList[0];
        remoteSiteSettings = true; 
        NewRemoteSiteSettings = false;
        //pageReference Pg = new pageReference('/apex/TouchAnalytics_UI') ;
        //pageReference Pg = new pageReference('/apex/New_Dashboard_Builder');
       // pg.setRedirect(true);
        return null;
         
    }
    
    public PageReference openTouchAnalyticsPage(){
        List<Remote_Site_Settings__c> customList = [Select Id, Remote_Settings__c from Remote_Site_Settings__c limit 1];
        customList[0].Remote_Settings__c = true;
        update customList[0];
        remoteSiteSettings = true; 
        NewRemoteSiteSettings = true;
       // pageReference Pg = new pageReference('/apex/TouchAnalytics_UI') ;
        pageReference Pg = new pageReference('/apex/New_Dashboard_Builder');
        pg.setRedirect(true);
        return pg;
         
    }
    
    public PageReference openDataFlowPage(){
        List<Remote_Site_Settings__c> customList = [Select Id, Remote_Settings__c from Remote_Site_Settings__c limit 1];
        customList[0].Remote_Settings__c = true;
        update customList[0];
        remoteSiteSettings = true; 
        NewRemoteSiteSettings = true;
       // pageReference Pg = new pageReference('/apex/TouchAnalytics_UI') ;
        pageReference Pg = new pageReference('/apex/dataflow');
        pg.setRedirect(true);
        return pg;
         
    }
    
    public PageReference openTouchHomePage(){
        List<Remote_Site_Settings__c> customList = [Select Id, Remote_Settings__c from Remote_Site_Settings__c limit 1];
        customList[0].Remote_Settings__c = true;
        update customList[0];
        remoteSiteSettings = true; 
        NewRemoteSiteSettings = true;
        pageReference Pg = new pageReference('/apex/TouchAnalytics_UI') ;
        pg.setRedirect(true);
        return pg;
         
    }
    
    public PageReference openTouchBackupPage(){
        List<Remote_Site_Settings__c> customList = [Select Id, Remote_Settings__c from Remote_Site_Settings__c limit 1];
        customList[0].Remote_Settings__c = true;
        update customList[0];
        remoteSiteSettings = true; 
        NewRemoteSiteSettings = true;
       // pageReference Pg = new pageReference('/apex/TouchAnalytics_UI') ;
        pageReference Pg = new pageReference('/apex/Settings_VF');
        pg.setRedirect(true);
        return pg;
         
    }
        public pageReference Sales1(){
        sinvalueErr1 = false;
        sinvalueErr = false;
        if(SelectKPIValue1 != 'None'){
            //Dashboard_Backup_AC  DBUp = new Dashboard_Backup_AC();
            //DBUp.NewDashboardsSingle(Allval1);    
            pageReference Pg = new pageReference('/apex/Snapshot_UI?id='+SelectKPIValue1+'&&dbid=None&&date='+DateValue+'&&theme='+Allval1);
            return Pg;
        }
        
        else{
            Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.ERROR, 'Please Select Dataset'));  
            return null;
        }
    }
    
    public Static String Dimensions(String Dropvalue,String curr){
            String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v43.0';
            String datasetId = Dropvalue;
            String versionId = curr;
            String endpoint;
            endpoint = sfdcInstance + '/wave/datasets/'+ datasetId +'/versions/' + versionId +'/xmds/main';                 
            Http http = new Http();
            HttpRequest req = new HttpRequest();
            req.setEndpoint(endpoint);
            req.settimeout(60000);
            req.setMethod('GET');
            req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
            req.setHeader('content-type', 'application/json');         
            HttpResponse res;
           if(!Test.isRunningTest()){
            res = http.send(req);            
            return res.getBody();  
         }
         else{
                return null;
            } 
    }
      
      public void datevalues(){
          if(SelectKPIValue1 != 'None'){
          DatevalueList = new list<selectOption>();
           DatasetDimensionFromJson  DimensionTypes = new DatasetDimensionFromJson();
         //  system.debug('^^^^^^^^^^^^^^^^^^^^'+SelectKPIValue1);
                
                string DimensionsReturnValue = Dimensions(SelectKPIValue1,DatasetMaps.get(SelectKPIValue1));
                if(DimensionsReturnValue != null &&DimensionsReturnValue != ''){
                    DimensionTypes = DatasetDimensionFromJson.parse(DimensionsReturnValue);
                }
                  
                    if(DimensionTypes.dates !=null){
                    for(DatasetDimensionFromJson.cls_dates Dim : DimensionTypes.dates){ 
                     if(Dim.showInExplorer == true) {                 
                        DatevalueList.add(new selectOption(Dim.fields.fullField,Dim.fields.fullField));                                                               
                     } 
                    }
                    }
      }
      
      else if(SelectKPIValue1 == 'None'){
          DatevalueList = new list<selectOption>();
          DatevalueList.add(new selectOption('None','--None--'));
          
      }
      }
      
       public void datevaluesone(){
          if(SelectKPIValue3 != 'None'){
          DatevalueListone = new list<selectOption>();
           DatasetDimensionFromJson  DimensionTypes = new DatasetDimensionFromJson();
         //  system.debug('^^^^^^^^^^^^^^^^^^^^'+SelectKPIValue1);
                
                string DimensionsReturnValue = Dimensions(SelectKPIValue3,DatasetMaps.get(SelectKPIValue3));
                if(DimensionsReturnValue != null &&DimensionsReturnValue != ''){
                    DimensionTypes = DatasetDimensionFromJson.parse(DimensionsReturnValue);
                }
                  
                    if(DimensionTypes.dates !=null){
                    for(DatasetDimensionFromJson.cls_dates Dim : DimensionTypes.dates){ 
                     if(Dim.showInExplorer == true) {                 
                        DatevalueListone.add(new selectOption(Dim.fields.fullField,Dim.fields.fullField));                                                               
                     } 
                    }
                    }
      }
      else if(SelectKPIValue3 == 'None' ){
          DatevalueListone = new list<selectOption>();
          DatevalueListone.add(new selectOption('None','--None--'));
          
      }
      
       if(SelectKPIValue2 != 'None' ){
           DatevalueListtwo = new list<selectOption>();
           DatasetDimensionFromJson  DimensionTypes = new DatasetDimensionFromJson();
         //  system.debug('^^^^^^^^^^^^^^^^^^^^'+SelectKPIValue1);
                
                string DimensionsReturnValue = Dimensions(SelectKPIValue2,DatasetMaps.get(SelectKPIValue2));
                if(DimensionsReturnValue != null &&DimensionsReturnValue != ''){
                    DimensionTypes = DatasetDimensionFromJson.parse(DimensionsReturnValue);
                }
                  
                    if(DimensionTypes.dates !=null){
                    for(DatasetDimensionFromJson.cls_dates Dim : DimensionTypes.dates){ 
                     if(Dim.showInExplorer == true) {                 
                        DatevalueListtwo.add(new selectOption(Dim.fields.fullField,Dim.fields.fullField));                                                               
                     } 
                    }
                    }
       /*   DB_Template__c DBTemp = [select id from DB_Template__c where Id=: SingleKPIValue3];
          KPIs__c NewKPI = [select Dataset_Id__c from KPIs__c where DB_Template__c =: DBTemp.Id];
           DatevalueList = new list<selectOption>();
           DatasetDimensionFromJson  DimensionTypes = new DatasetDimensionFromJson();
         //  system.debug('^^^^^^^^^^^^^^^^^^^^'+SelectKPIValue1);
                
                string DimensionsReturnValue = Dimensions(NewKPI.Dataset_Id__c);
                if(DimensionsReturnValue != null &&DimensionsReturnValue != ''){
                    DimensionTypes = DatasetDimensionFromJson.parse(DimensionsReturnValue);
                }
                  
                    if(DimensionTypes.dates !=null){
                    for(DatasetDimensionFromJson.cls_dates Dim : DimensionTypes.dates){ 
                     if(Dim.showInExplorer == true) {                 
                        DatevalueListone.add(new selectOption(Dim.fields.fullField,Dim.fields.fullField));                                                               
                     } 
                    }
                    } */
      }
      else if((SelectKPIValue2 == 'None') ){
          DatevalueListtwo = new list<selectOption>();
          DatevalueListtwo.add(new selectOption('None','--None--'));
          
      }
      }
      
      public class Templateclass{
        public DB_Template__c DBTemplates{get;set;}
        public String configurationType{get;set;}
        public Templateclass(DB_Template__c DBTemplates,String configurationType){
            this.DBTemplates = DBTemplates;
            this.configurationType = configurationType;
        }
        
      }
      
    public string NewStringval(){
        String jsons=    '{'+
       '  "label": "Copy of Single DB Template",'+
    '  "folder": {'+
    '    "id": "00l28000001VoU1AAK"'+
    '  },'+
    '  "state": {'+
    '    "dataSourceLinks": [],'+
    '    "filters": [],'+
    '    "gridLayouts": [{'+
    '      "name": "Desktop",'+
    '      "numColumns": 16,'+
    '      "pages": [{'+
    '        "name": "49aec73a-4cfc-4256-93d7-98d922372c8a",'+
    '        "widgets": [{'+
    '          "colspan": 4,'+
    '          "column": 6,'+
    '          "name": "Dashboard_Title",'+
    '          "row": 0,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "rgba(255, 255, 255, 0)",'+
    '            "borderEdges": []'+
    '          }'+
    '        }, {'+
    '          "colspan": 4,'+
    '          "column": 6,'+
    '          "name": "Dashboard_Description",'+
    '          "row": 1,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "rgba(255, 255, 255, 0)",'+
    '            "borderEdges": []'+
    '          }'+
    '        }, {'+
    '          "colspan": 14,'+
    '          "column": 1,'+
    '          "name": "Description_Container",'+
    '          "row": 0,'+
    '          "rowspan": 2,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "#FFFFFF",'+
    '            "borderColor": "#44A2F5",'+
    '            "borderEdges": ["bottom"],'+
    '            "borderRadius": 4,'+
    '            "borderWidth": 4'+
    '          }'+
    '        }, {'+
    '          "colspan": 2,'+
    '          "column": 1,'+
    '          "name": "Filters_Title",'+
    '          "row": 2,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "#091A3E",'+
    '            "borderEdges": []'+
    '          }'+
    '        }, {'+
    '          "colspan": 2,'+
    '          "column": 1,'+
    '          "name": "Date_Filter_1",'+
    '          "row": 3,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "rgba(230, 236, 242, 0)",'+
    '            "borderColor": "rgba(230, 236, 242, 0)",'+
    '            "borderEdges": [],'+
    '            "borderRadius": 0,'+
    '            "borderWidth": 4'+
    '          }'+
    '        }, {'+
    '          "colspan": 2,'+
    '          "column": 1,'+
    '          "name": "Filter_1",'+
    '          "row": 7,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "rgba(255, 255, 255, 0)",'+
    '            "borderColor": "#E6ECF2",'+
    '            "borderEdges": [],'+
    '            "borderRadius": 0,'+
    '            "borderWidth": 1'+
    '          }'+
    '        }, {'+
    '          "colspan": 2,'+
    '          "column": 1,'+
    '          "name": "Filter_2",'+
    '          "row": 8,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "rgba(230, 236, 242, 0)",'+
    '            "borderColor": "#E6ECF2",'+
    '            "borderEdges": [],'+
    '            "borderRadius": 4,'+
    '            "borderWidth": 4'+
    '          }'+
    '        }, {'+
    '          "colspan": 2,'+
    '          "column": 1,'+
    '          "name": "Filter_3",'+
    '          "row": 9,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "rgba(230, 236, 242, 0)",'+
    '            "borderColor": "#E6ECF2",'+
    '            "borderEdges": [],'+
    '            "borderRadius": 0,'+
    '            "borderWidth": 4'+
    '          }'+
    '        }, {'+
    '          "colspan": 2,'+
    '          "column": 1,'+
    '          "name": "Filter_4",'+
    '          "row": 10,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "rgba(230, 236, 242, 0)",'+
    '            "borderColor": "#E6ECF2",'+
    '            "borderEdges": [],'+
    '            "borderRadius": 0,'+
    '            "borderWidth": 4'+
    '          }'+
    '        }, {'+
    '          "colspan": 2,'+
    '          "column": 1,'+
    '          "name": "Filter_5",'+
    '          "row": 11,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "rgba(230, 236, 242, 0)",'+
    '            "borderColor": "#E6ECF2",'+
    '            "borderEdges": [],'+
    '            "borderRadius": 0,'+
    '            "borderWidth": 4'+
    '          }'+
    '        }, {'+
    '          "colspan": 2,'+
    '          "column": 1,'+
    '          "name": "Filter_6",'+
    '          "row": 12,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "rgba(230, 236, 242, 0)",'+
    '            "borderColor": "#E6ECF2",'+
    '            "borderEdges": [],'+
    '            "borderRadius": 4,'+
    '            "borderWidth": 4'+
    '          }'+
    '        }, {'+
    '          "colspan": 2,'+
    '          "column": 1,'+
    '          "name": "Filter_7",'+
    '          "row": 13,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "rgba(230, 236, 242, 0)",'+
    '            "borderColor": "#E6ECF2",'+
    '            "borderEdges": [],'+
    '            "borderRadius": 0,'+
    '            "borderWidth": 4'+
    '          }'+
    '        }, {'+
    '          "colspan": 2,'+
    '          "column": 1,'+
    '          "name": "Filter_8",'+
    '          "row": 14,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "rgba(230, 236, 242, 0)",'+
    '            "borderColor": "#E6ECF2",'+
    '            "borderEdges": [],'+
    '            "borderRadius": 0,'+
    '            "borderWidth": 4'+
    '          }'+
    '        }, {'+
    '          "colspan": 2,'+
    '          "column": 1,'+
    '          "name": "Filters_Container",'+
    '          "row": 2,'+
    '          "rowspan": 20,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "#F2F6FA",'+
    '            "borderColor": "#FFFFFF",'+
    '            "borderEdges": [],'+
    '            "borderRadius": 8,'+
    '            "borderWidth": 4'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 3,'+
    '          "name": "Overview_Title",'+
    '          "row": 2,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "#335779",'+
    '            "borderColor": "#2EC2BA",'+
    '            "borderEdges": ["bottom"]'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 3,'+
    '          "name": "KPI_1",'+
    '          "row": 3,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "rgba(255, 255, 255, 0)",'+
    '            "borderColor": "#E6ECF2",'+
    '            "borderEdges": [],'+
    '            "borderRadius": 0,'+
    '            "borderWidth": 1'+
    '          }';
    String jsons1=    '       }, {'+
    '          "colspan": 3,'+
    '          "column": 6,'+
    '          "name": "KPI_2",'+
    '          "row": 3,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "rgba(255, 255, 255, 0)",'+
    '            "borderColor": "#E6ECF2",'+
    '            "borderEdges": [],'+
    '            "borderRadius": 0,'+
    '            "borderWidth": 1'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 9,'+
    '          "name": "KPI_3",'+
    '          "row": 3,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "rgba(255, 255, 255, 0)",'+
    '            "borderColor": "#E6ECF2",'+
    '            "borderEdges": [],'+
    '            "borderRadius": 0,'+
    '            "borderWidth": 1'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 12,'+
    '          "name": "KPI_4",'+
    '          "row": 3,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "rgba(255, 255, 255, 0)",'+
    '            "borderColor": "#E6ECF2",'+
    '            "borderEdges": [],'+
    '            "borderRadius": 0,'+
    '            "borderWidth": 1'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 3,'+
    '          "name": "KPI_Title_1",'+
    '          "row": 4,'+
    '          "rowspan": 2,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "rgba(255, 255, 255, 0)",'+
    '            "borderColor": "#E6ECF2",'+
    '            "borderEdges": [],'+
    '            "borderRadius": 0,'+
    '            "borderWidth": 1'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 6,'+
    '          "name": "KPI_Title_2",'+
    '          "row": 4,'+
    '          "rowspan": 2,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "rgba(255, 255, 255, 0)",'+
    '            "borderColor": "#E6ECF2",'+
    '            "borderEdges": [],'+
    '            "borderRadius": 0,'+
    '            "borderWidth": 1'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 9,'+
    '          "name": "KPI_Title_3",'+
    '          "row": 4,'+
    '          "rowspan": 2,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "rgba(255, 255, 255, 0)",'+
    '            "borderColor": "#E6ECF2",'+
    '            "borderEdges": [],'+
    '            "borderRadius": 0,'+
    '            "borderWidth": 1'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 12,'+
    '          "name": "KPI_Title_4",'+
    '          "row": 4,'+
    '          "rowspan": 2,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "rgba(255, 255, 255, 0)",'+
    '            "borderColor": "#E6ECF2",'+
    '            "borderEdges": [],'+
    '            "borderRadius": 0,'+
    '            "borderWidth": 1'+
    '          }'+
    '        }, {'+
    '          "colspan": 12,'+
    '          "column": 3,'+
    '          "name": "Header_Container",'+
    '          "row": 2,'+
    '          "rowspan": 4,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "#335779",'+
    '            "borderColor": "#5C7A99",'+
    '            "borderEdges": ["all"],'+
    '            "borderRadius": 8,'+
    '            "borderWidth": 4'+
    '          }'+
    '        }, {'+
    '          "colspan": 2,'+
    '          "column": 7,'+
    '          "name": "Measure_Text",'+
    '          "row": 6,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "borderEdges": []'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 9,'+
    '          "name": "Measure_List",'+
    '          "row": 6,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "borderEdges": []'+
    '          }'+
    '        }, {'+
    '          "colspan": 1,'+
    '          "column": 12,'+
    '          "name": "Sort_Results",'+
    '          "row": 6,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "borderEdges": []'+
    '          }'+
    '        }, {'+
    '          "colspan": 2,'+
    '          "column": 13,'+
    '          "name": "Sort_Toggle",'+
    '          "row": 6,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "borderEdges": []'+
    '          }'+
    '        }, {'+
    '          "colspan": 12,'+
    '          "column": 3,'+
    '          "name": "Groupings_Container",'+
    '          "row": 6,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "borderColor": "#3D8784",'+
    '            "borderEdges": ["bottom"],'+
    '            "borderRadius": 4,'+
    '            "borderWidth": 4'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 3,'+
    '          "name": "Chart_Title_1",'+
    '          "row": 7,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "#F2F6FA",'+
    '            "borderColor": "#335779",'+
    '            "borderEdges": ["bottom"],'+
    '            "borderRadius": 4,'+
    '            "borderWidth": 4'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 3,'+
    '          "name": "Chart_1",'+
    '          "row": 8,'+
    '          "rowspan": 6,'+
    '          "widgetStyle": {'+
    '            "borderEdges": []'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 6,'+
    '          "name": "Chart_Title_2",'+
    '          "row": 7,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "#F2F6FA",'+
    '            "borderColor": "#335779",'+
    '            "borderEdges": ["bottom"],'+
    '            "borderRadius": 4,'+
    '            "borderWidth": 4'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 6,'+
    '          "name": "Chart_2",'+
    '          "row": 8,'+
    '          "rowspan": 6,'+
    '          "widgetStyle": {'+
    '            "borderEdges": []'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 9,'+
    '          "name": "Chart_Title_3",'+
    '          "row": 7,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "#F2F6FA",'+
    '            "borderColor": "#335779",'+
    '            "borderEdges": ["bottom"],'+
    '            "borderRadius": 4,'+
    '            "borderWidth": 4'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 9,'+
    '          "name": "Chart_3",'+
    '          "row": 8,'+
    '          "rowspan": 6,'+
    '          "widgetStyle": {'+
    '            "borderEdges": []'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 12,'+
    '          "name": "Chart_Title_4",'+
    '          "row": 7,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "#F2F6FA",'+
    '            "borderColor": "#335779",'+
    '            "borderEdges": ["bottom"],'+
    '            "borderRadius": 4,'+
    '            "borderWidth": 4'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 12,'+
    '          "name": "Chart_4",'+
    '          "row": 8,'+
    '          "rowspan": 6,'+
    '          "widgetStyle": {'+
    '            "borderEdges": []'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 3,'+
    '          "name": "Chart_Title_5",'+
    '          "row": 14,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "#F2F6FA",'+
    '            "borderColor": "#335779",'+
    '            "borderEdges": ["bottom"],'+
    '            "borderRadius": 4,'+
    '            "borderWidth": 4'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 3,'+
    '          "name": "Chart_5",'+
    '          "row": 15,'+
    '          "rowspan": 6,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "#FFFFFF",'+
    '            "borderColor": "#E6ECF2",'+
    '            "borderEdges": [],'+
    '            "borderRadius": 0,'+
    '            "borderWidth": 1'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 6,'+
    '          "name": "Chart_Title_6",'+
    '          "row": 14,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "#F2F6FA",'+
    '            "borderColor": "#335779",'+
    '            "borderEdges": ["bottom"],'+
    '            "borderRadius": 4,'+
    '            "borderWidth": 4'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 6,'+
    '          "name": "Chart_6",'+
    '          "row": 15,'+
    '          "rowspan": 6,'+
    '          "widgetStyle": {'+
    '            "borderEdges": []'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 9,'+
    '          "name": "Chart_Title_7",'+
    '          "row": 14,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "#F2F6FA",'+
    '            "borderColor": "#335779",'+
    '            "borderEdges": ["bottom"],'+
    '            "borderRadius": 4,'+
    '            "borderWidth": 4'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 9,'+
    '          "name": "Chart_7",'+
    '          "row": 15,'+
    '          "rowspan": 6,'+
    '          "widgetStyle": {'+
    '            "borderEdges": []'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 12,'+
    '          "name": "Chart_Title_8",'+
    '          "row": 14,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "#F2F6FA",'+
    '            "borderColor": "#335779",'+
    '            "borderEdges": ["bottom"],'+
    '            "borderRadius": 4,'+
    '            "borderWidth": 4'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 12,'+
    '          "name": "Chart_8",'+
    '          "row": 15,'+
    '          "rowspan": 6,'+
    '          "widgetStyle": {'+
    '            "borderEdges": []'+
    '          }'+
    '        }, {'+
    '          "colspan": 7,'+
    '          "column": 1,'+
    '          "name": "Additional_Feature_Title_1",'+
    '          "row": 22,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "#F2F6FA",'+
    '            "borderColor": "#335779",'+
    '            "borderEdges": ["bottom"],'+
    '            "borderRadius": 4,'+
    '            "borderWidth": 4'+
    '          }'+
    '        }, {'+
    '          "colspan": 7,'+
    '          "column": 1,'+
    '          "name": "Additional_Feature_Chart_1",'+
    '          "row": 24,'+
    '          "rowspan": 8,'+
    '          "widgetStyle": {'+
    '            "borderEdges": []'+
    '          }'+
    '        }, {'+
    '          "colspan": 7,'+
    '          "column": 8,'+
    '          "name": "Additional_Feature_Title_2",'+
    '          "row": 22,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "#F2F6FA",'+
    '            "borderColor": "#335779",'+
    '            "borderEdges": ["bottom"],'+
    '            "borderRadius": 4,'+
    '            "borderWidth": 4'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 12,'+
    '          "name": "Additional_Feature_List_2",'+
    '          "row": 23,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "borderEdges": []'+
    '          }'+
    '        }, {'+
    '          "colspan": 7,'+
    '          "column": 8,'+
    '          "name": "Additional_Feature_Chart_2",'+
    '          "row": 24,'+
    '          "rowspan": 8,'+
    '          "widgetStyle": {'+
    '            "borderEdges": []'+
    '          }'+
    '        }, {'+
    '          "colspan": 14,'+
    '          "column": 1,'+
    '          "name": "Raw_Details_Title",'+
    '          "row": 32,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "#F2F6FA",'+
    '            "borderColor": "#634F95",'+
    '            "borderEdges": ["bottom"],'+
    '            "borderRadius": 4,'+
    '            "borderWidth": 4'+
    '          }'+
    '        }, {'+
    '          "colspan": 14,'+
    '          "column": 1,'+
    '          "name": "Raw_Details_Chart",'+
    '          "row": 33,'+
    '          "rowspan": 9,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "#C5D3E0",'+
    '            "borderColor": "#E6ECF2",'+
    '            "borderEdges": [],'+
    '            "borderRadius": 0,'+
    '            "borderWidth": 1'+
    '          }'+
    '        }, {'+
    '          "colspan": 12,'+
    '          "column": 3,'+
    '          "name": "Chart_Container",'+
    '          "row": 7,'+
    '          "rowspan": 15,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "#FFFFFF",'+
    '            "borderColor": "#E6ECF2",'+
    '            "borderEdges": [],'+
    '            "borderRadius": 0,'+
    '            "borderWidth": 1'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 8,'+
    '          "name": "listselector_1",'+
    '          "row": 23,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "borderEdges": []'+
    '          }'+
    '        }, {'+
    '          "colspan": 3,'+
    '          "column": 3,'+
    '          "name": "listselector_2",'+
    '          "row": 23,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "borderEdges": []'+
    '          }'+
    '        }, {'+
    '          "colspan": 2,'+
    '          "column": 1,'+
    '          "name": "dateselector_1",'+
    '          "row": 4,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "rgba(255, 255, 255, 0)",'+
    '            "borderColor": "#E6ECF2",'+
    '            "borderEdges": [],'+
    '            "borderRadius": 0,'+
    '            "borderWidth": 1'+
    '          }'+
    '        }, {'+
    '          "colspan": 2,'+
    '          "column": 1,'+
    '          "name": "dateselector_2",'+
    '          "row": 5,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "rgba(255, 255, 255, 0)",'+
    '            "borderColor": "#E6ECF2",'+
    '            "borderEdges": [],'+
    '            "borderRadius": 0,'+
    '            "borderWidth": 1'+
    '          }'+
    '        }, {'+
    '          "colspan": 2,'+
    '          "column": 1,'+
    '          "name": "Custom_Filter_1",'+
    '          "row": 6,'+
    '          "rowspan": 1,'+
    '          "widgetStyle": {'+
    '            "backgroundColor": "rgba(255, 255, 255, 0)",'+
    '            "borderColor": "#E6ECF2",'+
    '            "borderEdges": [],'+
    '            "borderRadius": 0,'+
    '            "borderWidth": 1'+
    '          }'+
    '        }]'+
    '      }],'+
    '      "rowHeight": "normal",'+
    '      "selectors": ["minWidth(1000)"],'+
    '      "style": {'+
    '        "alignmentX": "left",'+
    '        "alignmentY": "top",'+
    '        "backgroundColor": "#FFFFFF",'+
    '        "cellSpacingX": 4,'+
    '        "cellSpacingY": 4,'+
    '        "documentId": "",'+
    '        "fit": "original"'+
    '      },'+
    '      "version": 1.0'+
    '    } ';
    
    
    String jsons3='],'+
    '    "layouts": [],'+
    '    "steps": {'+
    '      "Static_KPI": {'+
    '        "broadcastFacet": true,'+
    '        "datasets": [],'+
    '        "dimensions": [],'+
    '        "groups": [],'+
    '        "isGlobal": false,'+
    '        "numbers": [],'+
    '        "selectMode": "singlerequired",'+
    '        "strings": [],'+
    '        "type": "staticflex",'+
    '        "useGlobal": true,'+
    '        "values": []'+
    '      },'+
    '      "Static_Order": {'+
    '        "broadcastFacet": false,'+
    '        "datasets": [],'+
    '        "dimensions": [],'+
    '        "groups": [],'+
    '        "isGlobal": false,'+
    '        "numbers": [],'+
    '        "selectMode": "singlerequired",'+
    '        "strings": [],'+
    '        "type": "staticflex",'+
    '        "useGlobal": false,'+
    '        "values": ["{\\\"display\\\":\\\"Asc\\\",\\\"value\\\":\\\"asc\\\"}", "{\\\"display\\\":\\\"Desc\\\",\\\"value\\\":\\\"desc\\\"}"]'+
    '      },'+
    '      "Static_Measures": {'+
    '        "broadcastFacet": true,'+
    '        "datasets": [],'+
    '        "dimensions": [],'+
    '        "groups": [],'+
    '        "isGlobal": false,'+
    '        "numbers": [],'+
    '        "selectMode": "singlerequired",'+
    '        "strings": [],'+
    '        "type": "staticflex",'+
    '        "useGlobal": true,'+
    '        "values": []'+
    '      },'+
    '      "Static_Dimensions": {'+
    '        "broadcastFacet": false,'+
    '        "datasets": [],'+
    '        "dimensions": [],'+
    '        "groups": [],'+
    '        "isGlobal": false,'+
    '        "numbers": [],'+
    '        "selectMode": "singlerequired",'+
    '        "strings": [],'+
    '        "type": "staticflex",'+
    '        "useGlobal": false,'+
    '        "values": ["{\\\"display\\\":\\\"\\\",\\\"value1\\\":\\\"\'ACCOUNT_NAME\'\\\",\\\"alias1\\\":\\\"ACCOUNT_NAME\\\",\\\"label1\\\":\\\"ACCOUNT.NAME\\\",\\\"value2\\\":\\\"\'CREATEDDATE\'\\\",\\\"alias2\\\":\\\"CREATEDDATE\\\",\\\"label2\\\":\\\"CREATEDDATE\\\",\\\"value3\\\":\\\"\'NAME\'\\\",\\\"alias3\\\":\\\"NAME\\\",\\\"label3\\\":\\\"NAME\\\",\\\"value4\\\":\\\"\'OWNER_NAME\'\\\",\\\"alias4\\\":\\\"OWNER_NAME\\\",\\\"label4\\\":\\\"OWNER.NAME\\\",\\\"value5\\\":\\\"\'ACCOUNT_ANALYTICSCC_SLAEXPIRATIONDATE_C\'\\\",\\\"alias5\\\":\\\"ACCOUNT_ANALYTICSCC_SLAEXPIRATIONDATE_C\\\",\\\"label5\\\":\\\"ACCOUNT.SLAEXPIRATIONDATE__C\\\",\\\"value6\\\":\\\"\'ACCOUNT_FAX\'\\\",\\\"alias6\\\":\\\"ACCOUNT_FAX\\\",\\\"label6\\\":\\\"ACCOUNT.FAX\\\",\\\"value7\\\":\\\"\'ACCOUNT_ANALYTICSCC_NUMBEROFLOCATIONS_C\'\\\",\\\"alias7\\\":\\\"ACCOUNT_ANALYTICSCC_NUMBEROFLOCATIONS_C\\\",\\\"label7\\\":\\\"ACCOUNT.NUMBEROFLOCATIONS__C\\\",\\\"value8\\\":\\\"\'ACCOUNT_ACCOUNTNUMBER\'\\\",\\\"alias8\\\":\\\"ACCOUNT_ACCOUNTNUMBER\\\",\\\"label8\\\":\\\"ACCOUNT.ACCOUNTNUMBER\\\",\\\"datevalue1\\\":\\\"\'CLOSEDATE\'\\\",\\\"datealias1\\\":\\\"CLOSEDATE\\\",\\\"datelabel1\\\":\\\"CLOSEDATE\\\",\\\"datevalue2\\\":\\\"\'CREATEDDATE\'\\\",\\\"datealias2\\\":\\\"CREATEDDATE\\\",\\\"datelabel2\\\":\\\"CREATEDDATE\\\",\\\"datevalue3\\\":\\\"\'LASTMODIFIEDDATE\'\\\",\\\"datealias3\\\":\\\"LASTMODIFIEDDATE\\\",\\\"datelabel3\\\":\\\"LASTMODIFIEDDATE\\\"}"]'+
    '      }'+
    '    },'+
    '    "widgetStyle": {'+
    '      "backgroundColor": "#FFFFFF",'+
    '      "borderColor": "#E6ECF2",'+
    '      "borderEdges": [],'+
    '      "borderRadius": 0,'+
    '      "borderWidth": 1'+
    '    },'+
    '    "widgets": {'+
    '      "Additional_Feature_List_2": {'+
    '        "parameters": {'+
    '          "compact": false,'+
    '          "expanded": true,'+
    '          "exploreLink": false,'+
    '          "instant": true,'+
    '          "title": "Choose Grouping"'+
    '        },'+
    '        "type": "listselector"'+
    '      },'+
    '      "Sort_Toggle": {'+
    '        "parameters": {'+
    '          "compact": false,'+
    '          "exploreLink": false,'+
    '          "step": "Static_Order"'+
    '        },'+
    '        "type": "pillbox"'+
    '      },'+
    '      "Additional_Feature_Title_2": {'+
    '        "parameters": {'+
    '          "fontSize": 20,'+
    '          "text": "Timeline by Dynamic Groupings",'+
    '          "textAlignment": "center",'+
    '          "textColor": "#091A3E"'+
    '        },'+
    '        "type": "text"'+
    '      },'+
    '      "Additional_Feature_Title_1": {'+
    '        "parameters": {'+
    '          "fontSize": 20,'+
    '          "text": "Year Over Year Analysis",'+
    '          "textAlignment": "center",'+
    '          "textColor": "#091A3E"'+
    '        },'+
    '        "type": "text"'+
    '      },'+
    '      "Filter_7": {'+
    '        "parameters": {'+
    '          "compact": false,'+
    '          "expanded": true,'+
    '          "exploreLink": false,'+
    '          "instant": true,'+
    '          "measureField": "count",'+
    '          "title": "ACCOUNT.NUMBEROFLOCATIONS__C"'+
    '        },'+
    '        "type": "listselector"'+
    '      },'+
    '      "Filter_8": {'+
    '        "parameters": {'+
    '          "compact": false,'+
    '          "expanded": true,'+
    '          "exploreLink": false,'+
    '          "instant": true,'+
    '          "measureField": "count",'+
    '          "title": "ACCOUNT.ACCOUNTNUMBER"'+
    '        },'+
    '        "type": "listselector"'+
    '      },'+
    '      "Filter_5": {'+
    '        "parameters": {'+
    '          "compact": false,'+
    '          "expanded": true,'+
    '          "exploreLink": false,'+
    '          "instant": true,'+
    '          "measureField": "count",'+
    '          "title": "ACCOUNT.SLAEXPIRATIONDATE__C"'+
    '        },'+
    '        "type": "listselector"'+
    '      },'+
    '      "Filter_6": {'+
    '        "parameters": {'+
    '          "compact": false,'+
    '          "expanded": true,'+
    '          "exploreLink": false,'+
    '          "instant": true,'+
    '          "measureField": "count",'+
    '          "title": "ACCOUNT.FAX"'+
    '        },'+
    '        "type": "listselector"'+
    '      },'+
    '      "Filter_3": {'+
    '        "parameters": {'+
    '          "compact": false,'+
    '          "expanded": true,'+
    '          "exploreLink": false,'+
    '          "instant": true,'+
    '          "measureField": "count",'+
    '          "title": "NAME"'+
    '        },'+
    '        "type": "listselector"'+
    '      },'+
    '      "Filter_4": {'+
    '        "parameters": {'+
    '          "compact": false,'+
    '          "expanded": true,'+
    '          "exploreLink": false,'+
    '          "instant": true,'+
    '          "measureField": "count",'+
    '          "title": "OWNER.NAME"'+
    '        },'+
    '        "type": "listselector"'+
    '      },'+
    '      "Filter_1": {'+
    '        "parameters": {'+
    '          "compact": false,'+
    '          "expanded": true,'+
    '          "exploreLink": false,'+
    '          "instant": true,'+
    '          "measureField": "count",'+
    '          "title": "ACCOUNT.NAME"'+
    '        },'+
    '        "type": "listselector"'+
    '      },'+
    '      "Filter_2": {'+
    '        "parameters": {'+
    '          "compact": false,'+
    '          "expanded": true,'+
    '          "exploreLink": false,'+
    '          "instant": true,'+
    '          "measureField": "count",'+
    '          "title": "CREATEDDATE"'+
    '        },'+
    '        "type": "listselector"'+
    '      },'+
    '      "Description_Container": {'+
    '        "parameters": {'+
    '          "alignmentX": "left",'+
    '          "alignmentY": "top",'+
    '          "documentId": "",'+
    '          "fit": "original"'+
    '        },'+
    '        "type": "container"'+
    '      },'+
    '      "Groupings_Container": {'+
    '        "parameters": {'+
    '          "alignmentX": "left",'+
    '          "alignmentY": "top",'+
    '          "documentId": "",'+
    '          "fit": "original"'+
    '        },'+
    '        "type": "container"'+
    '      },'+
    '      "dateselector_1": {'+
    '        "parameters": {'+
    '          "calendarTypeSwitchingAllowed": false,'+
    '          "defaultAbsoluteMode": true,'+
    '          "defaultFiscalMode": false,'+
    '          "instant": false,'+
    '          "modeSwitchingAllowed": true,'+
    '          "title": "CREATEDDATE"'+
    '        },'+
    '        "type": "dateselector"'+
    '      },'+
    '      "Raw_Details_Chart": {'+
    '        "parameters": {'+
    '          "borderColor": "#e0e5ee",'+
    '          "borderWidth": 1,'+
    '          "cell": {'+
    '            "backgroundColor": "#ffffff",'+
    '            "fontColor": "#16325c",'+
    '            "fontSize": 12'+
    '          },'+
    '          "columns": [],'+
    '          "customBulkActions": [],'+
    '          "exploreLink": true,'+
    '          "header": {'+
    '            "backgroundColor": "#f4f6f9",'+
    '            "fontColor": "#16325c",'+
    '            "fontSize": 12'+
    '          },'+
    '          "innerMajorBorderColor": "#a8b7c7",'+
    '          "innerMinorBorderColor": "#e0e5ee",'+
    '          "maxColumnWidth": 300,'+
    '          "minColumnWidth": 40,'+
    '          "mode": "variable",'+
    '          "numberOfLines": 1,'+
    '          "showRowIndexColumn": true,'+
    '          "totals": true,'+
    '          "verticalPadding": 8'+
    '        },'+
    '        "type": "table"'+
    '      },'+
    '      "Chart_6": {'+
    '        "parameters": {'+
    '          "autoFitMode": "none",'+
    '          "showValues": true,'+
    '          "bins": {'+
    '            "breakpoints": {'+
    '              "high": 100,'+
    '              "low": 0'+
    '            },'+
    '            "bands": {'+
    '              "high": {'+
    '                "color": "#008000",'+
    '                "label": ""'+
    '              },'+
    '              "low": {'+
    '                "color": "#B22222",'+
    '                "label": ""'+
    '              },'+
    '              "medium": {'+
    '                "color": "#ffa500",'+
    '                "label": ""'+
    '              }'+
    '            }'+
    '          },'+
    '          "legend": {'+
    '            "showHeader": true,'+
    '            "show": false,'+
    '            "customSize": "auto",'+
    '            "position": "right-top",'+
    '            "inside": false'+
    '          },'+
    '          "axisMode": "multi",'+
    '          "tooltip": {'+
    '            "showBinLabel": true,'+
    '            "measures": "",'+
    '            "showPercentage": true,'+
    '            "showDimensions": true,'+
    '            "showMeasures": true,'+
    '            "customizeTooltip": false,'+
    '            "dimensions": ""'+
    '          },'+
    '          "visualizationType": "hbar",'+
    '          "exploreLink": true,'+
    '          "title": {'+
    '            "fontSize": 14,'+
    '            "subtitleFontSize": 11,'+
    '            "label": "",'+
    '            "align": "center",'+
    '            "subtitleLabel": ""'+
    '          },'+
    '          "trellis": {'+
    '            "flipLabels": false,'+
    '            "showGridLines": true,'+
    '            "size": [100, 100],'+
    '            "enable": false,'+
    '            "type": "x",'+
    '            "chartsPerLine": 4'+
    '          },'+
    '          "binValues": false,'+
    '          "measureAxis2": {'+
    '            "sqrtScale": false,'+
    '            "showTitle": true,'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "customDomain": {'+
    '              "showDomain": false'+
    '            }'+
    '          },'+
    '          "measureAxis1": {'+
    '            "sqrtScale": false,'+
    '            "showTitle": false,'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "customDomain": {'+
    '              "showDomain": false'+
    '            }'+
    '          },'+
    '          "theme": "wave",'+
    '          "dimensionAxis": {'+
    '            "showTitle": false,'+
    '            "customSize": "auto",'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "icons": {'+
    '              "useIcons": false,'+
    '              "iconProps": {'+
    '                "fit": "cover",'+
    '                "column": "",'+
    '                "type": "round"'+
    '              }'+
    '            }'+
    '          }'+
    '        },'+  
    '        "type": "chart"'+
    '      },'+
    '      "Chart_5": {'+
    '        "parameters": {'+
    '          "autoFitMode": "none",'+
    '          "showValues": true,'+
    '          "bins": {'+
    '            "breakpoints": {'+
    '              "high": 100,'+
    '              "low": 0'+
    '            },'+
    '            "bands": {'+
    '              "high": {'+
    '                "color": "#008000",'+
    '                "label": ""'+
    '              },'+
    '              "low": {'+
    '                "color": "#B22222",'+
    '                "label": ""'+
    '              },'+
    '              "medium": {'+
    '                "color": "#ffa500",'+
    '                "label": ""'+
    '              }'+
    '            }'+
    '          },'+
    '          "legend": {'+
    '            "showHeader": true,'+
    '            "show": false,'+
    '            "customSize": "auto",'+
    '            "position": "right-top",'+
    '            "inside": false'+
    '          },'+
    '          "axisMode": "multi",'+
    '          "tooltip": {'+
    '            "showBinLabel": true,'+
    '            "measures": "",'+
    '            "showPercentage": true,'+
    '            "showDimensions": true,'+
    '            "showMeasures": true,'+
    '            "customizeTooltip": false,'+
    '            "dimensions": ""'+
    '          },'+
    '          "visualizationType": "hbar",'+
    '          "exploreLink": true,'+
    '          "title": {'+
    '            "fontSize": 14,'+
    '            "subtitleFontSize": 11,'+
    '            "label": "",'+
    '            "align": "center",'+
    '            "subtitleLabel": ""'+
    '          },'+
    '          "trellis": {'+
    '            "flipLabels": false,'+
    '            "showGridLines": true,'+
    '            "size": [100, 100],'+
    '            "enable": false,'+
    '            "type": "x",'+
    '            "chartsPerLine": 4'+
    '          },'+
    '          "binValues": false,'+
    '          "measureAxis2": {'+
    '            "sqrtScale": false,'+
    '            "showTitle": true,'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "customDomain": {'+
    '              "showDomain": false'+
    '            }'+
    '          },'+
    '          "measureAxis1": {'+
    '            "sqrtScale": false,'+
    '            "showTitle": false,'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "customDomain": {'+
    '              "showDomain": false'+
    '            }'+
    '          },'+
    '          "theme": "wave",'+
    '          "dimensionAxis": {'+
    '            "showTitle": false,'+
    '            "customSize": "auto",'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "icons": {'+
    '              "useIcons": false,'+
    '              "iconProps": {'+
    '                "fit": "cover",'+
    '                "column": "",'+
    '                "type": "round"'+
    '              }'+
    '            }'+
    '          }'+
    '        },'+
    '        "type": "chart"'+
    '      },'+
    '      "Chart_8": {'+
    '        "parameters": {'+
    '          "autoFitMode": "none",'+
    '          "showValues": true,'+
    '          "bins": {'+
    '            "breakpoints": {'+
    '              "high": 100,'+
    '              "low": 0'+
    '            },'+
    '            "bands": {'+
    '              "high": {'+
    '                "color": "#008000",'+
    '                "label": ""'+
    '              },'+
    '              "low": {'+
    '                "color": "#B22222",'+
    '                "label": ""'+
    '              },'+
    '              "medium": {'+
    '                "color": "#ffa500",'+
    '                "label": ""'+
    '              }'+
    '            }'+
    '          },'+
    '          "legend": {'+
    '            "showHeader": true,'+
    '            "show": false,'+
    '            "customSize": "auto",'+
    '            "position": "right-top",'+
    '            "inside": false'+
    '          },'+
    '          "axisMode": "multi",'+
    '          "tooltip": {'+
    '            "showBinLabel": true,'+
    '            "measures": "",'+
    '            "showPercentage": true,'+
    '            "showDimensions": true,'+
    '            "showMeasures": true,'+
    '            "customizeTooltip": false,'+
    '            "dimensions": ""'+
    '          },'+
    '          "visualizationType": "hbar",'+
    '          "exploreLink": true,'+
    '          "title": {'+
    '            "fontSize": 14,'+
    '            "subtitleFontSize": 11,'+
    '            "label": "",'+
    '            "align": "center",'+
    '            "subtitleLabel": ""'+
    '          },'+
    '          "trellis": {'+
    '            "flipLabels": false,'+
    '            "showGridLines": true,'+
    '            "size": [100, 100],'+
    '            "enable": false,'+
    '            "type": "x",'+
    '            "chartsPerLine": 4'+
    '          },'+
    '          "binValues": false,'+
    '          "measureAxis2": {'+
    '            "sqrtScale": false,'+
    '            "showTitle": true,'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "customDomain": {'+
    '              "showDomain": false'+
    '            }'+
    '          },'+
    '          "measureAxis1": {'+
    '            "sqrtScale": false,'+
    '            "showTitle": false,'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "customDomain": {'+
    '              "showDomain": false'+
    '            }'+
    '          },'+
    '          "theme": "wave",'+
    '          "dimensionAxis": {'+
    '            "showTitle": false,'+
    '            "customSize": "auto",'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "icons": {'+
    '              "useIcons": false,'+
    '              "iconProps": {'+
    '                "fit": "cover",'+
    '                "column": "",'+
    '                "type": "round"'+
    '              }'+
    '            }'+
    '          }'+
    '        },'+
    '        "type": "chart"'+
    '      },'+
    '      "Chart_7": {'+
    '        "parameters": {'+
    '          "autoFitMode": "none",'+
    '          "showValues": true,'+
    '          "bins": {'+
    '            "breakpoints": {'+
    '              "high": 100,'+
    '              "low": 0'+
    '            },'+
    '            "bands": {'+
    '              "high": {'+
    '                "color": "#008000",'+
    '                "label": ""'+
    '              },'+
    '              "low": {'+
    '                "color": "#B22222",'+
    '                "label": ""'+
    '              },'+
    '              "medium": {'+
    '                "color": "#ffa500",'+
    '                "label": ""'+
    '              }'+
    '            }'+
    '          },'+
    '          "legend": {'+
    '            "showHeader": true,'+
    '            "show": false,'+
    '            "customSize": "auto",'+
    '            "position": "right-top",'+
    '            "inside": false'+
    '          },'+
    '          "axisMode": "multi",'+
    '          "tooltip": {'+
    '            "showBinLabel": true,'+
    '            "measures": "",'+
    '            "showPercentage": true,'+
    '            "showDimensions": true,'+
    '            "showMeasures": true,'+
    '            "customizeTooltip": false,'+
    '            "dimensions": ""'+
    '          },'+
    '          "visualizationType": "hbar",'+
    '          "exploreLink": true,'+
    '          "title": {'+
    '            "fontSize": 14,'+
    '            "subtitleFontSize": 11,'+
    '            "label": "",'+
    '            "align": "center",'+
    '            "subtitleLabel": ""'+
    '          },'+
    '          "trellis": {'+
    '            "flipLabels": false,'+
    '            "showGridLines": true,'+
    '            "size": [100, 100],'+
    '            "enable": false,'+
    '            "type": "x",'+
    '            "chartsPerLine": 4'+
    '          },'+
    '          "binValues": false,'+
    '          "measureAxis2": {'+
    '            "sqrtScale": false,'+
    '            "showTitle": true,'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "customDomain": {'+
    '              "showDomain": false'+
    '            }'+
    '          },'+
    '          "measureAxis1": {'+
    '            "sqrtScale": false,'+
    '            "showTitle": false,'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "customDomain": {'+
    '              "showDomain": false'+
    '            }'+
    '          },'+
    '          "theme": "wave",'+
    '          "dimensionAxis": {'+
    '            "showTitle": false,'+
    '            "customSize": "auto",'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "icons": {'+
    '              "useIcons": false,'+
    '              "iconProps": {'+
    '                "fit": "cover",'+
    '                "column": "",'+
    '                "type": "round"'+
    '              }'+
    '            }'+
    '          }'+
    '        },'+
    '        "type": "chart"'+
    '      },';
    
    String jsons4= '      "Chart_2": {'+
    '        "parameters": {'+
    '          "autoFitMode": "none",'+
    '          "showValues": true,'+
    '          "bins": {'+
    '            "breakpoints": {'+
    '              "high": 100,'+
    '              "low": 0'+
    '            },'+
    '            "bands": {'+
    '              "high": {'+
    '                "color": "#008000",'+
    '                "label": ""'+
    '              },'+
    '              "low": {'+
    '                "color": "#B22222",'+
    '                "label": ""'+
    '              },'+
    '              "medium": {'+
    '                "color": "#ffa500",'+
    '                "label": ""'+
    '              }'+
    '            }'+
    '          },'+
    '          "legend": {'+
    '            "showHeader": true,'+
    '            "show": false,'+
    '            "customSize": "auto",'+
    '            "position": "right-top",'+
    '            "inside": false'+
    '          },'+
    '          "axisMode": "multi",'+
    '          "tooltip": {'+
    '            "showBinLabel": true,'+
    '            "measures": "",'+
    '            "showPercentage": true,'+
    '            "showDimensions": true,'+
    '            "showMeasures": true,'+
    '            "customizeTooltip": false,'+
    '            "dimensions": ""'+
    '          },'+
    '          "visualizationType": "hbar",'+
    '          "exploreLink": true,'+
    '          "title": {'+
    '            "fontSize": 14,'+
    '            "subtitleFontSize": 11,'+
    '            "label": "",'+
    '            "align": "center",'+
    '            "subtitleLabel": ""'+
    '          },'+
    '          "trellis": {'+
    '            "flipLabels": false,'+
    '            "showGridLines": true,'+
    '            "size": [100, 100],'+
    '            "enable": false,'+
    '            "type": "x",'+
    '            "chartsPerLine": 4'+
    '          },'+
    '          "binValues": false,'+
    '          "measureAxis2": {'+
    '            "sqrtScale": false,'+
    '            "showTitle": true,'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "customDomain": {'+
    '              "showDomain": false'+
    '            }'+
    '          },'+
    '          "measureAxis1": {'+
    '            "sqrtScale": false,'+
    '            "showTitle": false,'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "customDomain": {'+
    '              "showDomain": false'+
    '            }'+
    '          },'+
    '          "theme": "wave",'+
    '          "dimensionAxis": {'+
    '            "showTitle": false,'+
    '            "customSize": "auto",'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "icons": {'+
    '              "useIcons": false,'+
    '              "iconProps": {'+
    '                "fit": "cover",'+
    '                "column": "",'+
    '                "type": "round"'+
    '              }'+
    '            }'+
    '          }'+
    '        },'+
    '        "type": "chart"'+
    '      },'+
    '      "Chart_1": {'+
    '        "parameters": {'+
    '          "autoFitMode": "none",'+
    '          "showValues": true,'+
    '          "bins": {'+
    '            "breakpoints": {'+
    '              "high": 100,'+
    '              "low": 0'+
    '            },'+
    '            "bands": {'+
    '              "high": {'+
    '                "color": "#008000",'+
    '                "label": ""'+
    '              },'+
    '              "low": {'+
    '                "color": "#B22222",'+
    '                "label": ""'+
    '              },'+
    '              "medium": {'+
    '                "color": "#ffa500",'+
    '                "label": ""'+
    '              }'+
    '            }'+
    '          },'+
    '          "legend": {'+
    '            "showHeader": true,'+
    '            "show": false,'+
    '            "customSize": "auto",'+
    '            "position": "right-top",'+
    '            "inside": false'+
    '          },'+
    '          "axisMode": "multi",'+
    '          "tooltip": {'+
    '            "showBinLabel": true,'+
    '            "measures": "",'+
    '            "showPercentage": true,'+
    '            "showDimensions": true,'+
    '            "showMeasures": true,'+
    '            "customizeTooltip": false,'+
    '            "dimensions": ""'+
    '          },'+
    '          "visualizationType": "hbar",'+
    '          "exploreLink": true,'+
    '          "title": {'+
    '            "fontSize": 14,'+
    '            "subtitleFontSize": 11,'+
    '            "label": "",'+
    '            "align": "center",'+
    '            "subtitleLabel": ""'+
    '          },'+
    '          "trellis": {'+
    '            "flipLabels": false,'+
    '            "showGridLines": true,'+
    '            "size": [100, 100],'+
    '            "enable": false,'+
    '            "type": "x",'+
    '            "chartsPerLine": 4'+
    '          },'+
    '          "binValues": false,'+
    '          "measureAxis2": {'+
    '            "sqrtScale": false,'+
    '            "showTitle": true,'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "customDomain": {'+
    '              "showDomain": false'+
    '            }'+
    '          },'+
    '          "measureAxis1": {'+
    '            "sqrtScale": false,'+
    '            "showTitle": false,'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "customDomain": {'+
    '              "showDomain": false'+
    '            }'+
    '          },'+
    '          "theme": "wave",'+
    '          "dimensionAxis": {'+
    '            "showTitle": false,'+
    '            "customSize": "auto",'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "icons": {'+
    '              "useIcons": false,'+
    '              "iconProps": {'+
    '                "fit": "cover",'+
    '                "column": "",'+
    '                "type": "round"'+
    '              }'+
    '            }'+
    '          }'+
    '        },'+
    '        "type": "chart"'+
    '      },'+
    '      "Chart_4": {'+
    '        "parameters": {'+
    '          "autoFitMode": "none",'+
    '          "showValues": true,'+
    '          "bins": {'+
    '            "breakpoints": {'+
    '              "high": 100,'+
    '              "low": 0'+
    '            },'+
    '            "bands": {'+
    '              "high": {'+
    '                "color": "#008000",'+
    '                "label": ""'+
    '              },'+
    '              "low": {'+
    '                "color": "#B22222",'+
    '                "label": ""'+
    '              },'+
    '              "medium": {'+
    '                "color": "#ffa500",'+
    '                "label": ""'+
    '              }'+
    '            }'+
    '          },'+
    '          "legend": {'+
    '            "showHeader": true,'+
    '            "show": false,'+
    '            "customSize": "auto",'+
    '            "position": "right-top",'+
    '            "inside": false'+
    '          },'+
    '          "axisMode": "multi",'+
    '          "tooltip": {'+
    '            "showBinLabel": true,'+
    '            "measures": "",'+
    '            "showPercentage": true,'+
    '            "showDimensions": true,'+
    '            "showMeasures": true,'+
    '            "customizeTooltip": false,'+
    '            "dimensions": ""'+
    '          },'+
    '          "visualizationType": "hbar",'+
    '          "exploreLink": true,'+
    '          "title": {'+
    '            "fontSize": 14,'+
    '            "subtitleFontSize": 11,'+
    '            "label": "",'+
    '            "align": "center",'+
    '            "subtitleLabel": ""'+
    '          },'+
    '          "trellis": {'+
    '            "flipLabels": false,'+
    '            "showGridLines": true,'+
    '            "size": [100, 100],'+
    '            "enable": false,'+
    '            "type": "x",'+
    '            "chartsPerLine": 4'+
    '          },'+
    '          "binValues": false,'+
    '          "measureAxis2": {'+
    '            "sqrtScale": false,'+
    '            "showTitle": true,'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "customDomain": {'+
    '              "showDomain": false'+
    '            }'+
    '          },'+
    '          "measureAxis1": {'+
    '            "sqrtScale": false,'+
    '            "showTitle": false,'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "customDomain": {'+
    '              "showDomain": false'+
    '            }'+
    '          },'+
    '          "theme": "wave",'+
    '          "dimensionAxis": {'+
    '            "showTitle": false,'+
    '            "customSize": "auto",'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "icons": {'+
    '              "useIcons": false,'+
    '              "iconProps": {'+
    '                "fit": "cover",'+
    '                "column": "",'+
    '                "type": "round"'+
    '              }'+
    '            }'+
    '          }'+
    '        },'+
    '        "type": "chart"'+
    '      },'+
    '      "Chart_3": {'+
    '        "parameters": {'+
    '          "autoFitMode": "none",'+
    '          "showValues": true,'+
    '          "bins": {'+
    '            "breakpoints": {'+
    '              "high": 100,'+
    '              "low": 0'+
    '            },'+
    '            "bands": {'+
    '              "high": {'+
    '                "color": "#008000",'+
    '                "label": ""'+
    '              },'+
    '              "low": {'+
    '                "color": "#B22222",'+
    '                "label": ""'+
    '              },'+
    '              "medium": {'+
    '                "color": "#ffa500",'+
    '                "label": ""'+
    '              }'+
    '            }'+
    '          },'+
    '          "legend": {'+
    '            "showHeader": true,'+
    '            "show": false,'+
    '            "customSize": "auto",'+
    '            "position": "right-top",'+
    '            "inside": false'+
    '          },'+
    '          "axisMode": "multi",'+
    '          "tooltip": {'+
    '            "showBinLabel": true,'+
    '            "measures": "",'+
    '            "showPercentage": true,'+
    '            "showDimensions": true,'+
    '            "showMeasures": true,'+
    '            "customizeTooltip": false,'+
    '            "dimensions": ""'+
    '          },'+
    '          "visualizationType": "hbar",'+
    '          "exploreLink": true,'+
    '          "title": {'+
    '            "fontSize": 14,'+
    '            "subtitleFontSize": 11,'+
    '            "label": "",'+
    '            "align": "center",'+
    '            "subtitleLabel": ""'+
    '          },'+
    '          "trellis": {'+
    '            "flipLabels": false,'+
    '            "showGridLines": true,'+
    '            "size": [100, 100],'+
    '            "enable": false,'+
    '            "type": "x",'+
    '            "chartsPerLine": 4'+
    '          },'+
    '          "binValues": false,'+
    '          "measureAxis2": {'+
    '            "sqrtScale": false,'+
    '            "showTitle": true,'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "customDomain": {'+
    '              "showDomain": false'+
    '            }'+
    '          },'+
    '          "measureAxis1": {'+
    '            "sqrtScale": false,'+
    '            "showTitle": false,'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "customDomain": {'+
    '              "showDomain": false'+
    '            }'+
    '          },'+
    '          "theme": "wave",'+
    '          "dimensionAxis": {'+
    '            "showTitle": false,'+
    '            "customSize": "auto",'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "icons": {'+
    '              "useIcons": false,'+
    '              "iconProps": {'+
    '                "fit": "cover",'+
    '                "column": "",'+
    '                "type": "round"'+
    '              }'+
    '            }'+
    '          }'+
    '        },'+
    '        "type": "chart"'+
    '      },'+
    '      "Dashboard_Description": {'+
    '        "parameters": {'+
    '          "fontSize": 12,'+
    '          "text": "Dashboard Description",'+
    '          "textAlignment": "center",'+
    '          "textColor": "#5C7A99"'+
    '        },'+
    '        "type": "text"'+
    '      },'+
    '      "Chart_Container": {'+
    '        "parameters": {'+
    '          "alignmentX": "center",'+
    '          "alignmentY": "center",'+
    '          "documentId": "",'+
    '          "fit": "original"'+
    '        },'+
    '        "type": "container"'+
    '      },'+
    '      "Header_Container": {'+
    '        "parameters": {'+
    '          "alignmentX": "left",'+
    '          "alignmentY": "top",'+
    '          "documentId": "",'+
    '          "fit": "original"'+
    '        },'+
    '        "type": "container"'+
    '      },'+
    '      "Chart_Title_8": {'+
    '        "parameters": {'+
    '          "fontSize": 20,'+
    '          "text": "Label8",'+
    '          "textAlignment": "center",'+
    '          "textColor": "#091A3E"'+
    '        },'+
    '        "type": "text"'+
    '      },'+
    '      "Filters_Title": {'+
    '        "parameters": {'+
    '          "fontSize": 20,'+
    '          "text": "Filters:",'+
    '          "textAlignment": "left",'+
    '          "textColor": "#FFFFFF"'+
    '        },'+
    '        "type": "text"'+
    '      },'+
    '      "Measure_Text": {'+
    '        "parameters": {'+
    '          "fontSize": 14,'+
    '          "text": "Select Measure",'+
    '          "textAlignment": "right",'+
    '          "textColor": "#091A3E"'+
    '        },'+
    '        "type": "text"'+
    '      },'+
    '      "Chart_Title_1": {'+
    '        "parameters": {'+
    '          "fontSize": 20,'+
    '          "text": "Label1",'+
    '          "textAlignment": "center",'+
    '          "textColor": "#091A3E"'+
    '        },'+
    '        "type": "text"'+
    '      },'+
    '      "Raw_Details_Title": {'+
    '        "parameters": {'+
    '          "fontSize": 24,'+
    '          "text": "Dataset Details",'+
    '          "textAlignment": "center",'+
    '          "textColor": "#091A3E"'+
    '        },'+
    '        "type": "text"'+
    '      },'+
    '      "Chart_Title_3": {'+
    '        "parameters": {'+
    '          "fontSize": 20,'+
    '          "text": "Label3",'+
    '          "textAlignment": "center",'+
    '          "textColor": "#091A3E"'+
    '        },'+
    '        "type": "text"'+
    '      },'+
    '      "dateselector_2": {'+
    '        "parameters": {'+
    '          "calendarTypeSwitchingAllowed": false,'+
    '          "defaultAbsoluteMode": true,'+
    '          "defaultFiscalMode": false,'+
    '          "instant": false,'+
    '          "modeSwitchingAllowed": true,'+
    '          "title": "LASTMODIFIEDDATE"'+
    '        },'+
    '        "type": "dateselector"'+
    '      },'+
    '      "Chart_Title_2": {'+
    '        "parameters": {'+
    '          "fontSize": 20,'+
    '          "text": "Label2",'+
    '          "textAlignment": "center",'+
    '          "textColor": "#091A3E"'+
    '        },'+
    '        "type": "text"'+
    '      },'+
    '      "Chart_Title_5": {'+
    '        "parameters": {'+
    '          "fontSize": 20,'+
    '          "text": "Label5",'+
    '          "textAlignment": "center",'+
    '          "textColor": "#091A3E"'+
    '        },'+
    '        "type": "text"'+
    '      },'+
    '      "Chart_Title_4": {'+
    '        "parameters": {'+
    '          "fontSize": 20,'+
    '          "text": "Label4",'+
    '          "textAlignment": "center",'+
    '          "textColor": "#091A3E"'+
    '        },'+
    '        "type": "text"'+
    '      },'+
    '      "Chart_Title_7": {'+
    '        "parameters": {'+
    '          "fontSize": 20,'+
    '          "text": "Label7",'+
    '          "textAlignment": "center",'+
    '          "textColor": "#091A3E"'+
    '        },'+
    '        "type": "text"'+
    '      },'+
    '      "Chart_Title_6": {'+
    '        "parameters": {'+
    '          "fontSize": 20,'+
    '          "text": "Label6",'+
    '          "textAlignment": "center",'+
    '          "textColor": "#091A3E"'+
    '        },'+
    '        "type": "text"'+
    '      },'+
    '      "Dashboard_Title": {'+
    '        "parameters": {'+
    '          "fontSize": 18,'+
    '          "text": "Dashboard Title",'+
    '          "textAlignment": "center",'+
    '          "textColor": "#091A3E"'+
    '        },'+
    '        "type": "text"'+
    '      },'+
    '      "Date_Filter_1": {'+
    '        "parameters": {'+
    '          "calendarTypeSwitchingAllowed": false,'+
    '          "defaultAbsoluteMode": true,'+
    '          "defaultFiscalMode": false,'+
    '          "instant": false,'+
    '          "modeSwitchingAllowed": true,'+
    '          "title": "CLOSEDATE"'+
    '        },'+
    '        "type": "dateselector"'+
    '      },'+
    '      "KPI_Title_2": {'+
    '        "parameters": {'+
    '          "fontSize": 24,'+
    '          "text": "{{cell(Static_KPI.selection,0, \\\"labelkpi2\\\").asObject()}}",'+
    '          "textAlignment": "center",'+
    '          "textColor": "#77B0AD"'+
    '        },'+
    '        "type": "text"'+
    '      },'+
    '      "KPI_Title_3": {'+
    '        "parameters": {'+
    '          "fontSize": 24,'+
    '          "text": "{{cell(Static_KPI.selection,0, \\\"labelkpi3\\\").asObject()}}",'+
    '          "textAlignment": "center",'+
    '          "textColor": "#77B0AD"'+
    '        },'+
    '        "type": "text"'+
    '      },'+
    '      "listselector_2": {'+
    '        "parameters": {'+
    '          "compact": false,'+
    '          "exploreLink": false,'+
    '          "instant": true,'+
    '          "title": "Choose Date Format"'+
    '        },'+
    '        "type": "listselector"'+
    '      },'+
    '      "KPI_Title_4": {'+
    '        "parameters": {'+
    '          "fontSize": 24,'+
    '          "text": "{{cell(Static_KPI.selection,0, \\\"labelkpi4\\\").asObject()}}",'+
    '          "textAlignment": "center",'+
    '          "textColor": "#77B0AD"'+
    '        },'+
    '        "type": "text"'+
    '      },';
    String jsons5='      "Filters_Container": {'+
    '        "parameters": {'+
    '          "alignmentX": "left",'+
    '          "alignmentY": "top",'+
    '          "documentId": "",'+
    '          "fit": "original"'+
    '        },'+
    '        "type": "container"'+
    '      },'+
    '      "Overview_Title": {'+
    '        "parameters": {'+
    '          "fontSize": 20,'+
    '          "text": "Command Overview",'+
    '          "textAlignment": "left",'+
    '          "textColor": "#FFFFFF"'+
    '        },'+
    '        "type": "text"'+
    '      },'+
    '      "Additional_Feature_Chart_2": {'+
    '        "parameters": {'+
    '          "showPoints": true,'+
    '          "legend": {'+
    '            "showHeader": true,'+
    '            "show": true,'+
    '            "customSize": "auto",'+
    '            "position": "right-top",'+
    '            "inside": false'+
    '          },'+
    '          "axisMode": "multi",'+
    '          "tooltip": {'+
    '            "showBinLabel": true,'+
    '            "measures": "",'+
    '            "showPercentage": true,'+
    '            "showDimensions": true,'+
    '            "showMeasures": true,'+
    '            "customizeTooltip": false,'+
    '            "dimensions": ""'+
    '          },'+
    '          "visualizationType": "time",'+
    '          "missingValue": "connect",'+
    '          "dashLine": {'+
    '            "measures": "",'+
    '            "showDashLine": false'+
    '          },'+
    '          "exploreLink": false,'+
    '          "timeAxis": {'+
    '            "showTitle": true,'+
    '            "showAxis": true,'+
    '            "title": ""'+
    '          },'+
    '          "title": {'+
    '            "fontSize": 14,'+
    '            "subtitleFontSize": 11,'+
    '            "label": "",'+
    '            "align": "center",'+
    '            "subtitleLabel": ""'+
    '          },'+
    '          "trellis": {'+
    '            "flipLabels": false,'+
    '            "showGridLines": true,'+
    '            "size": [100, 100],'+
    '            "enable": false,'+
    '            "type": "x",'+
    '            "chartsPerLine": 4'+
    '          },'+
    '          "fillArea": true,'+
    '          "showZero": true,'+
    '          "measureAxis2": {'+
    '            "sqrtScale": false,'+
    '            "showTitle": true,'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "customDomain": {'+
    '              "showDomain": false'+
    '            }'+
    '          },'+
    '          "measureAxis1": {'+
    '            "sqrtScale": false,'+
    '            "showTitle": false,'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "customDomain": {'+
    '              "showDomain": false'+
    '            }'+
    '          },'+
    '          "theme": "wave",'+
    '          "drawArea": {'+
    '            "measure": "",'+
    '            "showDrawArea": false,'+
    '            "bounding1": "",'+
    '            "bounding2": ""'+
    '          }'+
    '        },'+
    '        "type": "chart"'+
    '      },'+
    '      "Custom_Filter_1": {'+
    '        "parameters": {'+
    '          "compact": false,'+
    '          "exploreLink": false,'+
    '          "instant": true,'+
    '          "title": "Custom Filter"'+
    '        },'+
    '        "type": "listselector"'+
    '      },'+
    '      "KPI_1": {'+
    '        "parameters": {'+
    '          "compact": true,'+
    '          "exploreLink": true,'+
    '          "measureField": "sum_ACCOUNT_CREATEDDATE_day_epoch",'+
    '          "numberColor": "#FFFFFF",'+
    '          "numberSize": 32,'+
    '          "textAlignment": "center",'+
    '          "title": "",'+
    '          "titleColor": "#335779",'+
    '          "titleSize": 16'+
    '        },'+
    '        "type": "number"'+
    '      },'+
    '      "KPI_2": {'+
    '        "parameters": {'+
    '          "compact": true,'+
    '          "exploreLink": true,'+
    '          "measureField": "sum_AMOUNT",'+
    '          "numberColor": "#FFFFFF",'+
    '          "numberSize": 32,'+
    '          "textAlignment": "center",'+
    '          "title": "",'+
    '          "titleColor": "#335779",'+
    '          "titleSize": 16'+
    '        },'+
    '        "type": "number"'+
    '      },'+
    '      "Additional_Feature_Chart_1": {'+
    '        "parameters": {'+
    '          "showPoints": true,'+
    '          "legend": {'+
    '            "showHeader": true,'+
    '            "show": true,'+
    '            "customSize": "auto",'+
    '            "position": "right-top",'+
    '            "inside": false'+
    '          },'+
    '          "axisMode": "multi",'+
    '          "tooltip": {'+
    '            "showBinLabel": true,'+
    '            "measures": "",'+
    '            "showPercentage": true,'+
    '            "showDimensions": true,'+
    '            "showMeasures": true,'+
    '            "customizeTooltip": false,'+
    '            "dimensions": ""'+
    '          },'+
    '          "visualizationType": "time",'+
    '          "missingValue": "connect",'+
    '          "dashLine": {'+
    '            "measures": "",'+
    '            "showDashLine": false'+
    '          },'+
    '          "exploreLink": false,'+
    '          "timeAxis": {'+
    '            "showTitle": true,'+
    '            "showAxis": true,'+
    '            "title": ""'+
    '          },'+
    '          "title": {'+
    '            "fontSize": 14,'+
    '            "subtitleFontSize": 11,'+
    '            "label": "",'+
    '            "align": "center",'+
    '            "subtitleLabel": ""'+
    '          },'+
    '          "trellis": {'+
    '            "flipLabels": false,'+
    '            "showGridLines": true,'+
    '            "size": [100, 100],'+
    '            "enable": false,'+
    '            "type": "x",'+
    '            "chartsPerLine": 4'+
    '          },'+
    '          "fillArea": true,'+
    '          "showZero": true,'+
    '          "measureAxis2": {'+
    '            "sqrtScale": false,'+
    '            "showTitle": true,'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "customDomain": {'+
    '              "showDomain": false'+
    '            }'+
    '          },'+
    '          "measureAxis1": {'+
    '            "sqrtScale": false,'+
    '            "showTitle": false,'+
    '            "showAxis": true,'+
    '            "title": "",'+
    '            "customDomain": {'+
    '              "showDomain": false'+
    '            }'+
    '          },'+
    '          "theme": "wave",'+
    '          "drawArea": {'+
    '            "measure": "",'+
    '            "showDrawArea": false,'+
    '            "bounding1": "",'+
    '            "bounding2": ""'+
    '          }'+
    '        },'+
    '        "type": "chart"'+
    '      },'+
    '      "Sort_Results": {'+
    '        "parameters": {'+
    '          "fontSize": 14,'+
    '          "text": "Sort Results",'+
    '          "textAlignment": "right",'+
    '          "textColor": "#091A3E"'+
    '        },'+
    '        "type": "text"'+
    '      },'+
    '      "listselector_1": {'+
    '        "parameters": {'+
    '          "compact": false,'+
    '          "exploreLink": false,'+
    '          "instant": true,'+
    '          "title": "Choose Date Format"'+
    '        },'+
    '        "type": "listselector"'+
    '      },'+
    '      "KPI_Title_1": {'+
    '        "parameters": {'+
    '          "fontSize": 24,'+
    '          "text": "{{cell(Static_KPI.selection,0, \\\"labelkpi1\\\").asObject()}}",'+
    '          "textAlignment": "center",'+
    '          "textColor": "#77B0AD"'+
    '        },'+
    '        "type": "text"'+
    '      },'+
    '      "Measure_List": {'+
    '        "parameters": {'+
    '          "compact": false,'+
    '          "expanded": true,'+
    '          "exploreLink": false,'+
    '          "instant": true,'+
    '          "step": "Static_Measures",'+
    '          "title": ""'+
    '        },'+
    '        "type": "listselector"'+
    '      },'+
    '      "KPI_3": {'+
    '        "parameters": {'+
    '          "compact": true,'+
    '          "exploreLink": true,'+
    '          "measureField": "sum_CLOSEDATE_day_epoch",'+
    '          "numberColor": "#FFFFFF",'+
    '          "numberSize": 32,'+
    '          "textAlignment": "center",'+
    '          "title": "",'+
    '          "titleColor": "#335779",'+
    '          "titleSize": 16'+
    '        },'+
    '        "type": "number"'+
    '      },'+
    '      "KPI_4": {'+
    '        "parameters": {'+
    '          "compact": true,'+
    '          "exploreLink": true,'+
    '          "measureField": "avg_ACCOUNT_CREATEDDATE_sec_epoch",'+
    '          "numberColor": "#FFFFFF",'+
    '          "numberSize": 32,'+
    '          "textAlignment": "center",'+
    '          "title": "",'+
    '          "titleColor": "#335779",'+
    '          "titleSize": 16'+
    '        },'+
    '        "type": "number"'+
    '      }'+
    '    }'+
    '  }'+
    '}';
        String jsonss = jsons +jsons1+jsons3 +jsons4 +jsons5;
        return jsonss;  
    }
    
    public string NewStringval1(){
                String json=    '{'+
            '   "label": "Copy of Single DB Template",'+
            '   "folder": {'+
            '   "id": "00l28000001VoU1AAK"'+
            '   },'+
            '   "state": {'+
            '   "dataSourceLinks": [],'+
            '   "filters": [],'+
            '   "gridLayouts": [{'+
            '   "name": "Default",'+
            '   "numColumns": 32,'+
            '   "pages": [{'+
            '   "label": "Untitled",'+
            '   "name": "c0194d25-02cd-47ee-9569-aa3b0b159ad5",'+
            '   "widgets": [{'+
            '   "colspan": 32,'+
            '   "column": 0,'+
            '   "name": "text_1",'+
            '   "row": 0,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 32,'+
            '   "column": 0,'+
            '   "name": "container_4",'+
            '   "row": 1,'+
            '   "rowspan": 3,'+
            '   "widgetStyle": {'+
            '   "backgroundColor": "#FFFFFF",'+
            '   "borderColor": "#E6ECF2",'+
            '   "borderEdges": [],'+
            '   "borderRadius": 4,'+
            '   "borderWidth": 4'+
            '   }'+
            '   }, {'+
            '   "colspan": 6,'+
            '   "column": 13,'+
            '   "name": "listselector_1",'+
            '   "row": 4,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 32,'+
            '   "column": 0,'+
            '   "name": "Chart_1_1",'+
            '   "row": 5,'+
            '   "rowspan": 7,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 32,'+
            '   "column": 0,'+
            '   "name": "container_5",'+
            '   "row": 4,'+
            '   "rowspan": 8,'+
            '   "widgetStyle": {'+
            '   "backgroundColor": "#FFFFFF",'+
            '   "borderColor": "#E6ECF2",'+
            '   "borderEdges": [],'+
            '   "borderRadius": 4,'+
            '   "borderWidth": 4'+
            '   }'+
            '   }, {'+
            '   "colspan": 5,'+
            '   "column": 0,'+
            '   "name": "text_2",'+
            '   "row": 13,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "backgroundColor": "rgba(255, 255, 255, 0)",'+
            '   "borderColor": "#E6ECF2",'+
            '   "borderEdges": [],'+
            '   "borderRadius": 0,'+
            '   "borderWidth": 1'+
            '   }'+
            '   }, {'+
            '   "colspan": 5,'+
            '   "column": 0,'+
            '   "name": "text_5",'+
            '   "row": 14,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "backgroundColor": "rgba(255, 255, 255, 0)",'+
            '   "borderColor": "#E6ECF2",'+
            '   "borderEdges": ["top"],'+
            '   "borderRadius": 0,'+
            '   "borderWidth": 1'+
            '   }'+
            '   }, {'+
            '   "colspan": 5,'+
            '   "column": 0,'+
            '   "name": "text_6",'+
            '   "row": 15,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "backgroundColor": "rgba(255, 255, 255, 0)",'+
            '   "borderColor": "#E6ECF2",'+
            '   "borderEdges": ["top"],'+
            '   "borderRadius": 0,'+
            '   "borderWidth": 1'+
            '   }'+
            '   }, {'+
            '   "colspan": 5,'+
            '   "column": 0,'+
            '   "name": "text_7",'+
            '   "row": 16,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "backgroundColor": "rgba(255, 255, 255, 0)",'+
            '   "borderColor": "#E6ECF2",'+
            '   "borderEdges": ["top"],'+
            '   "borderRadius": 0,'+
            '   "borderWidth": 1'+
            '   }'+
            '   }, {'+
            '   "colspan": 5,'+
            '   "column": 0,'+
            '   "name": "text_8",'+
            '   "row": 17,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "backgroundColor": "rgba(255, 255, 255, 0)",'+
            '   "borderColor": "#E6ECF2",'+
            '   "borderEdges": ["top"],'+
            '   "borderRadius": 0,'+
            '   "borderWidth": 1'+
            '   }'+
            '   }, {'+
            '   "colspan": 5,'+
            '   "column": 0,'+
            '   "name": "listselector_17",'+
            '   "row": 19,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 5,'+
            '   "column": 0,'+
            '   "name": "listselector_14",'+
            '   "row": 20,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 5,'+
            '   "column": 0,'+
            '   "name": "container_2",'+
            '   "row": 12,'+
            '   "rowspan": 20,'+
            '   "widgetStyle": {'+
            '   "backgroundColor": "#FFFFFF",'+
            '   "borderColor": "#E6ECF2",'+
            '   "borderEdges": [],'+
            '   "borderRadius": 4,'+
            '   "borderWidth": 4'+
            '   }'+
            '   }, {'+
            '   "colspan": 4,'+
            '   "column": 5,'+
            '   "name": "text_3",'+
            '   "row": 12,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "backgroundColor": "rgba(255, 255, 255, 0)",'+
            '   "borderColor": "#E6ECF2",'+
            '   "borderEdges": [],'+
            '   "borderRadius": 0,'+
            '   "borderWidth": 1'+
            '   }'+
            '   }, {'+
            '   "colspan": 4,'+
            '   "column": 10,'+
            '   "name": "listselector_4",'+
            '   "row": 12,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 9,'+
            '   "column": 5,'+
            '   "name": "number_1",'+
            '   "row": 13,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 9,'+
            '   "column": 5,'+
            '   "name": "number_5",'+
            '   "row": 14,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": ["top"]'+
            '   }'+
            '   }, {'+
            '   "colspan": 9,'+
            '   "column": 5,'+
            '   "name": "number_2",'+
            '   "row": 15,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": ["top"]'+
            '   }'+
            '   }, {'+
            '   "colspan": 9,'+
            '   "column": 5,'+
            '   "name": "number_6",'+
            '   "row": 16,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": ["top"]'+
            '   }'+
            '   }, {'+
            '   "colspan": 9,'+
            '   "column": 5,'+
            '   "name": "number_13",'+
            '   "row": 17,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "backgroundColor": "rgba(255, 255, 255, 0)",'+
            '   "borderColor": "#E6ECF2",'+
            '   "borderEdges": ["top"],'+
            '   "borderRadius": 0,'+
            '   "borderWidth": 1'+
            '   }'+
            '   }, {'+
            '   "colspan": 9,'+
            '   "column": 5,'+
            '   "name": "chart_3",'+
            '   "row": 19,'+
            '   "rowspan": 6,'+
            '   "widgetStyle": {'+
            '   "borderColor": "#2EC2BA",'+
            '   "borderEdges": [],'+
            '   "borderRadius": 4,'+
            '   "borderWidth": 4'+
            '   }'+
            '   }, {'+
            '   "colspan": 9,'+
            '   "column": 5,'+
            '   "name": "container_1",'+
            '   "row": 12,'+
            '   "rowspan": 20,'+
            '   "widgetStyle": {'+
            '   "backgroundColor": "#FFFFFF",'+
            '   "borderColor": "#2EC2BA",'+
            '   "borderEdges": ["all"],'+
            '   "borderRadius": 0,'+
            '   "borderWidth": 4'+
            '   }'+
            '   }, {'+
            '   "colspan": 4,'+
            '   "column": 14,'+
            '   "name": "text_4",'+
            '   "row": 12,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "backgroundColor": "rgba(255, 255, 255, 0)",'+
            '   "borderColor": "#E6ECF2",'+
            '   "borderEdges": [],'+
            '   "borderRadius": 0,'+
            '   "borderWidth": 1'+
            '   }'+
            '   }, {'+
            '   "colspan": 4,'+
            '   "column": 19,'+
            '   "name": "listselector_5",'+
            '   "row": 12,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 9,'+
            '   "column": 14,'+
            '   "name": "number_3",'+
            '   "row": 13,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 9,'+
            '   "column": 14,'+
            '   "name": "number_7",'+
            '   "row": 14,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": ["top"]'+
            '   }'+
            '   }, {'+
            '   "colspan": 9,'+
            '   "column": 14,'+
            '   "name": "number_4",'+
            '   "row": 15,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": ["top"]'+
            '   }'+
            '   }, {'+
            '   "colspan": 9,'+
            '   "column": 14,'+
            '   "name": "number_8",'+
            '   "row": 16,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": ["top"]'+
            '   }'+
            '   }, {'+
            '   "colspan": 9,'+
            '   "column": 14,'+
            '   "name": "number_14",'+
            '   "row": 17,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "backgroundColor": "rgba(255, 255, 255, 0)",'+
            '   "borderColor": "#E6ECF2",'+
            '   "borderEdges": ["top"],'+
            '   "borderRadius": 0,'+
            '   "borderWidth": 1'+
            '   }'+
            '   }, {'+
            '   "colspan": 9,'+
            '   "column": 14,'+
            '   "name": "chart_5",'+
            '   "row": 19,'+
            '   "rowspan": 6,'+
            '   "widgetStyle": {'+
            '   "borderColor": "#44A2F5",'+
            '   "borderEdges": [],'+
            '   "borderRadius": 4,'+
            '   "borderWidth": 4'+
            '   }'+
            '   }, {'+
            '   "colspan": 9,'+
            '   "column": 14,'+
            '   "name": "container_3",'+
            '   "row": 12,'+
            '   "rowspan": 20,'+
            '   "widgetStyle": {'+
            '   "backgroundColor": "#FFFFFF",'+
            '   "borderColor": "#44A2F5",'+
            '   "borderEdges": ["all"],'+
            '   "borderRadius": 0,'+
            '   "borderWidth": 4'+
            '   }'+
            '   }, {'+
            '   "colspan": 4,'+
            '   "column": 23,'+
            '   "name": "text_10",'+
            '   "row": 12,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 4,'+
            '   "column": 28,'+
            '   "name": "pillbox_2",'+
            '   "row": 12,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 9,'+
            '   "column": 23,'+
            '   "name": "number_9",'+
            '   "row": 13,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 9,'+
            '   "column": 23,'+
            '   "name": "number_10",'+
            '   "row": 14,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": ["top"]'+
            '   }'+
            '   }, {'+
            '   "colspan": 9,'+
            '   "column": 23,'+
            '   "name": "number_11",'+
            '   "row": 15,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": ["top"]'+
            '   }'+
            '   }, {'+
            '   "colspan": 9,'+
            '   "column": 23,'+
            '   "name": "number_12",'+
            '   "row": 16,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": ["top"]'+
            '   }'+
            '   }, {'+
            '   "colspan": 9,'+
            '   "column": 23,'+
            '   "name": "number_15",'+
            '   "row": 17,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "backgroundColor": "rgba(255, 255, 255, 0)",'+
            '   "borderColor": "#E6ECF2",'+
            '   "borderEdges": ["top"],'+
            '   "borderRadius": 0,'+
            '   "borderWidth": 1'+
            '   }'+
            '   }, {'+
            '   "colspan": 9,'+
            '   "column": 23,'+
            '   "name": "chart_6",'+
            '   "row": 19,'+
            '   "rowspan": 6,'+
            '   "widgetStyle": {'+
            '   "borderColor": "#9271E8",'+
            '   "borderEdges": [],'+
            '   "borderRadius": 4,'+
            '   "borderWidth": 4'+
            '   }'+
            '   }, {'+
            '   "colspan": 9,'+
            '   "column": 23,'+
            '   "name": "container_6",'+
            '   "row": 12,'+
            '   "rowspan": 20,'+
            '   "widgetStyle": {'+
            '   "backgroundColor": "#FFFFFF",'+
            '   "borderColor": "#9271E8",'+
            '   "borderEdges": ["all"],'+
            '   "borderRadius": 0,'+
            '   "borderWidth": 4'+
            '   }'+
            '   }, {'+
            '   "colspan": 5,'+
            '   "column": 25,'+
            '   "name": "pillbox_1",'+
            '   "row": 18,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }';
            String json4='  }, {'+
            '   "colspan": 5,'+
            '   "column": 16,'+
            '   "name": "pillbox_4",'+
            '   "row": 18,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 5,'+
            '   "column": 7,'+
            '   "name": "pillbox_6",'+
            '   "row": 18,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 4,'+
            '   "column": 20,'+
            '   "name": "dateselector_1",'+
            '   "row": 3,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 4,'+
            '   "column": 24,'+
            '   "name": "dateselector_2",'+
            '   "row": 3,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 4,'+
            '   "column": 28,'+
            '   "name": "dateselector_3",'+
            '   "row": 3,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 4,'+
            '   "column": 16,'+
            '   "name": "listselector_2",'+
            '   "row": 3,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 4,'+
            '   "column": 0,'+
            '   "name": "listselector_3",'+
            '   "row": 2,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 4,'+
            '   "column": 4,'+
            '   "name": "listselector_6",'+
            '   "row": 2,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 4,'+
            '   "column": 4,'+
            '   "name": "listselector_7",'+
            '   "row": 3,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 4,'+
            '   "column": 12,'+
            '   "name": "listselector_8",'+
            '   "row": 2,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 4,'+
            '   "column": 16,'+
            '   "name": "listselector_9",'+
            '   "row": 2,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 4,'+
            '   "column": 8,'+
            '   "name": "listselector_10",'+
            '   "row": 3,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 4,'+
            '   "column": 0,'+
            '   "name": "listselector_11",'+
            '   "row": 3,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 4,'+
            '   "column": 12,'+
            '   "name": "listselector_12",'+
            '   "row": 3,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 4,'+
            '   "column": 20,'+
            '   "name": "listselector_13",'+
            '   "row": 2,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 4,'+
            '   "column": 8,'+
            '   "name": "listselector_15",'+
            '   "row": 2,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 4,'+
            '   "column": 28,'+
            '   "name": "listselector_16",'+
            '   "row": 2,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 4,'+
            '   "column": 24,'+
            '   "name": "listselector_18",'+
            '   "row": 2,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 13,'+
            '   "column": 0,'+
            '   "name": "text_9",'+
            '   "row": 4,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 9,'+
            '   "column": 5,'+
            '   "name": "chart_1",'+
            '   "row": 26,'+
            '   "rowspan": 6,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 9,'+
            '   "column": 14,'+
            '   "name": "chart_2",'+
            '   "row": 26,'+
            '   "rowspan": 6,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 9,'+
            '   "column": 23,'+
            '   "name": "chart_4",'+
            '   "row": 26,'+
            '   "rowspan": 6,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 6,'+
            '   "column": 13,'+
            '   "name": "text_11",'+
            '   "row": 1,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 5,'+
            '   "column": 0,'+
            '   "name": "listselector_20",'+
            '   "row": 26,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 5,'+
            '   "column": 0,'+
            '   "name": "listselector_21",'+
            '   "row": 27,'+
            '   "rowspan": 1,'+
            '   "widgetStyle": {'+
            '   "borderEdges": []'+
            '   }'+
            '   }, {'+
            '   "colspan": 32,'+
            '   "column": 0,'+
            '   "name": "table_1",'+
            '   "row": 32,'+
            '   "rowspan": 7,'+
            '   "widgetStyle": {'+
            '   "borderColor": "#44A2F5",'+
            '   "borderEdges": ["all"],'+
            '   "borderRadius": 0,'+
            '   "borderWidth": 4'+
            '   }'+
            '   }]'+
            '   }],';
            String json1 = '"rowHeight": "normal",'+
            '   "selectors": [],'+
            '   "style": {'+
            '   "alignmentX": "left",'+
            '   "alignmentY": "top",'+
            '   "backgroundColor": "#F2F6FA",'+
            '   "cellSpacingX": 8,'+
            '   "cellSpacingY": 16,'+
            '   "documentId": "",'+
            '   "fit": "original",'+
            '   "gutterColor": "#F2F6FA"'+
            '   },'+
            '   "version": 1.0'+
            '   }],'+
            '   "layouts": [],'+
            '   "steps": {'+
            '   "Static_Measure_List": {'+
            '   "broadcastFacet": true,'+
            '   "datasets": [],'+
            '   "dimensions": [],'+
            '   "groups": [],'+
            '   "isGlobal": false,'+
            '   "numbers": [],'+
            '   "selectMode": "singlerequired",'+
            '   "strings": [],'+
            '   "type": "staticflex",'+
            '   "useGlobal": true,'+
            '   "values": []'+
            '   },'+
            '   "Static_Filter_1": {'+
            '   "broadcastFacet": false,'+
            '   "datasets": [],'+
            '   "dimensions": [],'+
            '   "groups": [],'+
            '   "isGlobal": false,'+
            '   "numbers": [],'+
            '   "selectMode": "singlerequired",'+
            '   "strings": [],'+
            '   "type": "staticflex",'+
            '   "useGlobal": false,'+
            '   "values": []'+
            '   },'+
            '   "Step_Measure_1": {'+
            '   "broadcastFacet": false,'+
            '   "datasets": [],'+
            '   "dimensions": [],'+
            '   "groups": [],'+
            '   "isGlobal": false,'+
            '   "label": "Step Measure",'+
            '   "numbers": [],'+
            '   "selectMode": "multirequired",'+
            '   "strings": [],'+
            '   "type": "staticflex",'+
            '   "useGlobal": false,'+
            '   "values": []'+
            '   },'+
            '   "Step_Measure_2": {'+
            '   "broadcastFacet": false,'+
            '   "datasets": [],'+
            '   "dimensions": [],'+
            '   "groups": [],'+
            '   "isGlobal": false,'+
            '   "label": "Step Measure",'+
            '   "numbers": [],'+
            '   "selectMode": "singlerequired",'+
            '   "strings": [],'+
            '   "type": "staticflex",'+
            '   "useGlobal": false,'+
            '   "values": []'+
            '   },'+
            '   "Step_Measure_3": {'+
            '   "broadcastFacet": false,'+
            '   "datasets": [],'+
            '   "dimensions": [],'+
            '   "groups": [],'+
            '   "isGlobal": false,'+
            '   "label": "Step Measure",'+
            '   "numbers": [],'+
            '   "selectMode": "singlerequired",'+
            '   "strings": [],'+
            '   "type": "staticflex",'+
            '   "useGlobal": false,'+
            '   "values": []'+
            '   },'+
            '   "Static_Sort_2_1": {'+
            '   "broadcastFacet": false,'+
            '   "datasets": [],'+
            '   "dimensions": [],'+
            '   "groups": [],'+
            '   "isGlobal": false,'+
            '   "numbers": [],'+
            '   "selectMode": "singlerequired",'+
            '   "strings": [],'+
            '   "type": "staticflex",'+
            '   "useGlobal": false,'+
            '   "values": []'+
            '   },'+
            '   "Static_Sort_2_2": {'+
            '   "broadcastFacet": false,'+
            '   "datasets": [],'+
            '   "dimensions": [],'+
            '   "groups": [],'+
            '   "isGlobal": false,'+
            '   "numbers": [],'+
            '   "selectMode": "singlerequired",'+
            '   "strings": [],'+
            '   "type": "staticflex",'+
            '   "useGlobal": false,'+
            '   "values": []'+
            '   },'+
            '   "Select_type_1": {'+
            '   "broadcastFacet": false,'+
            '   "datasets": [],'+
            '   "dimensions": [],'+
            '   "groups": [],'+
            '   "isGlobal": false,'+
            '   "label": "Select type",'+
            '   "numbers": [],'+
            '   "selectMode": "singlerequired",'+
            '   "strings": [],'+
            '   "type": "staticflex",'+
            '   "useGlobal": false,'+
            '   "values": []'+
            '   },'+
            '   "Static_Sort_2_3": {'+
            '   "broadcastFacet": false,'+
            '   "datasets": [],'+
            '   "dimensions": [],'+
            '   "groups": [],'+
            '   "isGlobal": false,'+
            '   "numbers": [],'+
            '   "selectMode": "singlerequired",'+
            '   "strings": [],'+
            '   "type": "staticflex",'+
            '   "useGlobal": false,'+
            '   "values": []'+
            '   },'+
            '   "step_dimension_1": {'+
            '   "broadcastFacet": false,'+
            '   "datasets": [],'+
            '   "dimensions": [],'+
            '   "groups": [],'+
            '   "isGlobal": false,'+
            '   "numbers": [],'+
            '   "selectMode": "singlerequired",'+
            '   "strings": [],'+
            '   "type": "staticflex",'+
            '   "useGlobal": true,'+
            '   "values": []'+
            '   },'+
            '   "step_dimension_2": {'+
            '   "broadcastFacet": false,'+
            '   "datasets": [],'+
            '   "dimensions": [],'+
            '   "groups": [],'+
            '   "isGlobal": false,'+
            '   "numbers": [],'+
            '   "selectMode": "singlerequired",'+
            '   "strings": [],'+
            '   "type": "staticflex",'+
            '   "useGlobal": true,'+
            '   "values": []'+
            '   },'+
            '   "Static_Dimensions": {'+
            '   "broadcastFacet": false,'+
            '   "datasets": [],'+
            '   "dimensions": [],'+
            '   "groups": [],'+
            '   "isGlobal": false,'+
            '   "numbers": [],'+
            '   "selectMode": "singlerequired",'+
            '   "strings": [],'+
            '   "type": "staticflex",'+
            '   "useGlobal": false,'+
            '   "values": ["{}"]'+
            '   }'+
            '   },'+
            '   "widgetStyle": {'+
            '   "backgroundColor": "rgba(255, 255, 255, 0)",'+
            '   "borderColor": "#E6ECF2",'+
            '   "borderEdges": [],'+
            '   "borderRadius": 0,'+
            '   "borderWidth": 1'+
            '   },'+
            '   "widgets": {'+
            '   "number_12": {'+
            '   "parameters": {'+
            '   "compact": true,'+
            '   "exploreLink": true,'+
            '   "measureField": "sum_CloseDate_sec_epoch",'+
            '   "numberColor": "#335779",'+
            '   "numberSize": 24,'+
            '   "textAlignment": "center",'+
            '   "title": "",'+
            '   "titleColor": "#335779",'+
            '   "titleSize": 16'+
            '   },'+
            '   "type": "number"'+
            '   },'+
            '   "number_11": {'+
            '   "parameters": {'+
            '   "compact": true,'+
            '   "exploreLink": true,'+
            '   "measureField": "min_Amount",'+
            '   "numberColor": "#335779",'+
            '   "numberSize": 24,'+
            '   "textAlignment": "center",'+
            '   "title": "",'+
            '   "titleColor": "#335779",'+
            '   "titleSize": 16'+
            '   },'+
            '   "type": "number"'+
            '   },'+
            '   "number_10": {'+
            '   "parameters": {'+
            '   "compact": true,'+
            '   "exploreLink": true,'+
            '   "measureField": "max_Amount",'+
            '   "numberColor": "#335779",'+
            '   "numberSize": 24,'+
            '   "textAlignment": "center",'+
            '   "title": "",'+
            '   "titleColor": "#335779",'+
            '   "titleSize": 16'+
            '   },'+
            '   "type": "number"'+
            '   },'+
            '   "text_10": {'+
            '   "parameters": {'+
            '   "fontSize": 18,'+
            '   "text": "Snapshot Delta",'+
            '   "textAlignment": "left",'+
            '   "textColor": "#091A3E"'+
            '   },'+
            '   "type": "text"'+
            '   },'+
            '   "number_15": {'+
            '   "parameters": {'+
            '   "compact": false,'+
            '   "exploreLink": true,'+
            '   "measureField": "sum_CreatedDate_day_epoch",'+
            '   "numberColor": "#335779",'+
            '   "numberSize": 24,'+
            '   "textAlignment": "center",'+
            '   "title": "",'+
            '   "titleColor": "#335779",'+
            '   "titleSize": 16'+
            '   },'+
            '   "type": "number"'+
            '   },'+
            '   "number_14": {'+
            '   "parameters": {'+
            '   "compact": true,'+
            '   "exploreLink": true,'+
            '   "measureField": "sum_CreatedDate_day_epoch",'+
            '   "numberColor": "#335779",'+
            '   "numberSize": 24,'+
            '   "textAlignment": "center",'+
            '   "title": "",'+
            '   "titleColor": "#335779",'+
            '   "titleSize": 16'+
            '   },'+
            '   "type": "number"'+
            '   },'+
            '   "number_13": {'+
            '   "parameters": {'+
            '   "compact": true,'+
            '   "exploreLink": true,'+
            '   "measureField": "sum_CreatedDate_day_epoch",'+
            '   "numberColor": "#335779",'+
            '   "numberSize": 24,'+
            '   "textAlignment": "center",'+
            '   "title": "",'+
            '   "titleColor": "#335779",'+
            '   "titleSize": 16'+
            '   },'+
            '   "type": "number"'+
            '   },'+
            '   "text_11": {'+
            '   "parameters": {'+
            '   "fontSize": 18,'+
            '   "text": "Filters",'+
            '   "textAlignment": "center",'+
            '   "textColor": "#091A3E"'+
            '   },'+
            '   "type": "text"'+
            '   },'+
            '   "container_1": {'+
            '   "parameters": {'+
            '   "alignmentX": "left",'+
            '   "alignmentY": "top",'+
            '   "documentId": "",'+
            '   "fit": "original"'+
            '   },'+
            '   "type": "container"'+
            '   },'+
            '   "container_2": {'+
            '   "parameters": {'+
            '   "alignmentX": "left",'+
            '   "alignmentY": "top",'+
            '   "fit": "original"'+
            '   },'+
            '   "type": "container"'+
            '   },'+
            '   "Chart_1_1": {'+
            '   "parameters": {'+
            '   "showPoints": true,'+
            '   "legend": {'+
            '   "showHeader": true,'+
            '   "show": true,'+
            '   "customSize": "auto",'+
            '   "position": "top-center",'+
            '   "inside": false'+
            '   },'+
            '   "axisMode": "sync",'+
            '   "tooltip": {'+
            '   "showBinLabel": true,'+
            '   "measures": "",'+
            '   "showPercentage": true,'+
            '   "showDimensions": true,'+
            '   "showMeasures": true,'+
            '   "customizeTooltip": false,'+
            '   "dimensions": ""'+
            '   },'+
            '   "visualizationType": "time",'+
            '   "missingValue": "connect",'+
            '   "dashLine": {'+
            '   "measures": "",'+
            '   "showDashLine": false'+
            '   },'+
            '   "exploreLink": true,'+
            '   "timeAxis": {'+
            '   "showTitle": true,'+
            '   "showAxis": true,'+
            '   "title": ""'+
            '   },'+
            '   "title": {'+
            '   "fontSize": 14,'+
            '   "subtitleFontSize": 11,'+
            '   "label": "",'+
            '   "align": "center",'+
            '   "subtitleLabel": ""'+
            '   },'+
            '   "trellis": {'+
            '   "flipLabels": false,'+
            '   "showGridLines": true,'+
            '   "size": [100, 100],'+
            '   "enable": false,'+
            '   "type": "x",'+
            '   "chartsPerLine": 4'+
            '   },'+
            '   "fillArea": true,'+
            '   "showZero": false,'+
            '   "measureAxis2": {'+
            '   "sqrtScale": false,'+
            '   "showTitle": true,'+
            '   "showAxis": true,'+
            '   "title": "",'+
            '   "customDomain": {'+
            '   "showDomain": false'+
            '   }'+
            '   },'+
            '   "measureAxis1": {'+
            '   "sqrtScale": false,'+
            '   "showTitle": false,'+
            '   "showAxis": true,'+
            '   "title": "",'+
            '   "customDomain": {'+
            '   "showDomain": false'+
            '   }'+
            '   },'+
            '   "theme": "wave",'+
            '   "drawArea": {'+
            '   "measure": "",'+
            '   "showDrawArea": false,'+
            '   "bounding1": "",'+
            '   "bounding2": ""'+
            '   }'+
            '   },'+
            '   "type": "chart"'+
            '   },'+
            '   "container_3": {'+
            '   "parameters": {'+
            '   "alignmentX": "left",'+
            '   "alignmentY": "top",'+
            '   "documentId": "",'+
            '   "fit": "original"'+
            '   },'+
            '   "type": "container"'+
            '   },'+
            '   "container_4": {'+
            '   "parameters": {'+
            '   "alignmentX": "left",'+
            '   "alignmentY": "top",'+
            '   "fit": "original"'+
            '   },'+
            '   "type": "container"'+
            '   },'+
            '   "container_5": {'+
            '   "parameters": {'+
            '   "alignmentX": "left",'+
            '   "alignmentY": "top",'+
            '   "fit": "original"'+
            '   },'+
            '   "type": "container"'+
            '   },'+
            '   "text_3": {'+
            '   "parameters": {'+
            '   "fontSize": 18,'+
            '   "text": "Select Snapshot",'+
            '   "textAlignment": "left",'+
            '   "textColor": "#000000"'+
            '   },'+
            '   "type": "text"'+
            '   },'+
            '   "container_6": {'+
            '   "parameters": {'+
            '   "alignmentX": "left",'+
            '   "alignmentY": "top",'+
            '   "fit": "original"'+
            '   },'+
            '   "type": "container"'+
            '   },'+
            '   "chart_6": {'+
            '   "parameters": {'+
            '   "autoFitMode": "none",'+
            '   "showValues": true,'+
            '   "bins": {'+
            '   "breakpoints": {'+
            '   "high": 100,'+
            '   "low": 0'+
            '   },'+
            '   "bands": {'+
            '   "high": {'+
            '   "color": "#008000",'+
            '   "label": ""'+
            '   },'+
            '   "low": {'+
            '   "color": "#B22222",'+
            '   "label": ""'+
            '   },'+
            '   "medium": {'+
            '   "color": "#ffa500",'+
            '   "label": ""'+
            '   }'+
            '   }'+
            '   },'+
            '   "legend": {'+
            '   "showHeader": false,'+
            '   "show": false,'+
            '   "customSize": "auto",'+
            '   "position": "right-top",'+
            '   "inside": false'+
            '   },'+
            '   "axisMode": "multi",'+
            '   "tooltip": {'+
            '   "showBinLabel": true,'+
            '   "measures": "",'+
            '   "showPercentage": true,'+
            '   "showDimensions": true,'+
            '   "showMeasures": true,'+
            '   "customizeTooltip": false,'+
            '   "dimensions": ""'+
            '   },'+
            '   "visualizationType": "hbar",'+
            '   "exploreLink": false,'+
            '   "title": {'+
            '   "fontSize": 14,'+
            '   "subtitleFontSize": 11,'+
            '   "label": "",'+
            '   "align": "center",'+
            '   "subtitleLabel": ""'+
            '   },'+
            '   "binValues": false,'+
            '   "trellis": {'+
            '   "flipLabels": false,'+
            '   "showGridLines": true,'+
            '   "size": [100, 100],'+
            '   "enable": false,'+
            '   "type": "x",'+
            '   "chartsPerLine": 4'+
            '   },'+
            '   "measureAxis2": {'+
            '   "sqrtScale": false,'+
            '   "showTitle": true,'+
            '   "showAxis": true,'+
            '   "title": "",'+
            '   "customDomain": {'+
            '   "showDomain": false'+
            '   }'+
            '   },'+
            '   "measureAxis1": {'+
            '   "sqrtScale": false,'+
            '   "showTitle": false,'+
            '   "showAxis": true,'+
            '   "title": "",'+
            '   "customDomain": {'+
            '   "showDomain": false'+
            '   }'+
            '   },'+
            '   "theme": "wave",'+
            '   "dimensionAxis": {'+
            '   "showTitle": false,'+
            '   "customSize": "auto",'+
            '   "showAxis": true,'+
            '   "title": "",'+
            '   "icons": {'+
            '   "useIcons": false,'+
            '   "iconProps": {'+
            '   "fit": "cover",'+
            '   "column": "",'+
            '   "type": "round"'+
            '   }'+
            '   }'+
            '   }'+
            '   },'+
            '   "type": "chart"'+
            '   },'+
            '   "text_2": {'+
            '   "parameters": {'+
            '   "fontSize": 14,'+
            '   "text": "{{cell(Static_Measure_List.selection,0, \\\"labelkpi1\\\").asObject()}}",'+
            '   "textAlignment": "right",'+
            '   "textColor": "#091A3E"'+
            '   },'+
            '   "type": "text"'+
            '   },'+
            '   "chart_5": {'+
            '   "parameters": {'+
            '   "autoFitMode": "none",'+
            '   "showValues": true,'+
            '   "bins": {'+
            '   "breakpoints": {'+
            '   "high": 100,'+
            '   "low": 0'+
            '   },'+
            '   "bands": {'+
            '   "high": {'+
            '   "color": "#008000",'+
            '   "label": ""'+
            '   },'+
            '   "low": {'+
            '   "color": "#B22222",'+
            '   "label": ""'+
            '   },'+
            '   "medium": {'+
            '   "color": "#ffa500",'+
            '   "label": ""'+
            '   }'+
            '   }'+
            '   },'+
            '   "legend": {'+
            '   "showHeader": true,'+
            '   "show": false,'+
            '   "customSize": "auto",'+
            '   "position": "right-top",'+
            '   "inside": false'+
            '   },'+
            '   "axisMode": "multi",'+
            '   "tooltip": {'+
            '   "showBinLabel": true,'+
            '   "measures": "",'+
            '   "showPercentage": true,'+
            '   "showDimensions": true,'+
            '   "showMeasures": true,'+
            '   "customizeTooltip": false,'+
            '   "dimensions": ""'+
            '   },';
            string json2 = '"visualizationType": "hbar",'+
            '   "exploreLink": false,'+
            '   "title": {'+
            '   "fontSize": 14,'+
            '   "subtitleFontSize": 11,'+
            '   "label": "",'+
            '   "align": "center",'+
            '   "subtitleLabel": ""'+
            '   },'+
            '   "binValues": false,'+
            '   "trellis": {'+
            '   "flipLabels": false,'+
            '   "showGridLines": true,'+
            '   "size": [100, 100],'+
            '   "enable": false,'+
            '   "type": "x",'+
            '   "chartsPerLine": 4'+
            '   },'+
            '   "measureAxis2": {'+
            '   "sqrtScale": false,'+
            '   "showTitle": true,'+
            '   "showAxis": true,'+
            '   "title": "",'+
            '   "customDomain": {'+
            '   "showDomain": false'+
            '   }'+
            '   },'+
            '   "measureAxis1": {'+
            '   "sqrtScale": false,'+
            '   "showTitle": false,'+
            '   "showAxis": true,'+
            '   "title": "",'+
            '   "customDomain": {'+
            '   "showDomain": false'+
            '   }'+
            '   },'+
            '   "theme": "wave",'+
            '   "dimensionAxis": {'+
            '   "showTitle": false,'+
            '   "customSize": "auto",'+
            '   "showAxis": true,'+
            '   "title": "",'+
            '   "icons": {'+
            '   "useIcons": false,'+
            '   "iconProps": {'+
            '   "fit": "cover",'+
            '   "column": "",'+
            '   "type": "round"'+
            '   }'+
            '   }'+
            '   }'+
            '   },'+
            '   "type": "chart"'+
            '   },'+
            '   "text_5": {'+
            '   "parameters": {'+
            '   "fontSize": 14,'+
            '   "text": "{{cell(Static_Measure_List.selection,0, \\\"labelkpi2\\\").asObject()}}",'+
            '   "textAlignment": "right",'+
            '   "textColor": "#091A3E"'+
            '   },'+
            '   "type": "text"'+
            '   },'+
            '   "text_4": {'+
            '   "parameters": {'+
            '   "fontSize": 18,'+
            '   "text": "Select Snapshot",'+
            '   "textAlignment": "left",'+
            '   "textColor": "#000000"'+
            '   },'+
            '   "type": "text"'+
            '   },'+
            '   "text_7": {'+
            '   "parameters": {'+
            '   "fontSize": 14,'+
            '   "text": "{{cell(Static_Measure_List.selection,0, \\\"labelkpi4\\\").asObject()}}",'+
            '   "textAlignment": "right",'+
            '   "textColor": "#091A3E"'+
            '   },'+
            '   "type": "text"'+
            '   },'+
            '   "chart_2": {'+
            '   "parameters": {'+
            '   "autoFitMode": "none",'+
            '   "showValues": true,'+
            '   "bins": {'+
            '   "breakpoints": {'+
            '   "high": 100,'+
            '   "low": 0'+
            '   },'+
            '   "bands": {'+
            '   "high": {'+
            '   "color": "#008000",'+
            '   "label": ""'+
            '   },'+
            '   "low": {'+
            '   "color": "#B22222",'+
            '   "label": ""'+
            '   },'+
            '   "medium": {'+
            '   "color": "#ffa500",'+
            '   "label": ""'+
            '   }'+
            '   }'+
            '   },'+
            '   "legend": {'+
            '   "showHeader": true,'+
            '   "show": false,'+
            '   "customSize": "auto",'+
            '   "position": "right-top",'+
            '   "inside": false'+
            '   },'+
            '   "axisMode": "multi",'+
            '   "tooltip": {'+
            '   "showBinLabel": true,'+
            '   "measures": "",'+
            '   "showPercentage": true,'+
            '   "showDimensions": true,'+
            '   "showMeasures": true,'+
            '   "customizeTooltip": false,'+
            '   "dimensions": ""'+
            '   },'+
            '   "visualizationType": "hbar",'+
            '   "exploreLink": false,'+
            '   "title": {'+
            '   "fontSize": 14,'+
            '   "subtitleFontSize": 11,'+
            '   "label": "",'+
            '   "align": "center",'+
            '   "subtitleLabel": ""'+
            '   },'+
            '   "binValues": false,'+
            '   "trellis": {'+
            '   "flipLabels": false,'+
            '   "showGridLines": true,'+
            '   "size": [100, 100],'+
            '   "enable": false,'+
            '   "type": "x",'+
            '   "chartsPerLine": 4'+
            '   },'+
            '   "measureAxis2": {'+
            '   "sqrtScale": false,'+
            '   "showTitle": true,'+
            '   "showAxis": true,'+
            '   "title": "",'+
            '   "customDomain": {'+
            '   "showDomain": false'+
            '   }'+
            '   },'+
            '   "measureAxis1": {'+
            '   "sqrtScale": false,'+
            '   "showTitle": false,'+
            '   "showAxis": true,'+
            '   "title": "",'+
            '   "customDomain": {'+
            '   "showDomain": false'+
            '   }'+
            '   },'+
            '   "theme": "wave",'+
            '   "dimensionAxis": {'+
            '   "showTitle": false,'+
            '   "customSize": "auto",'+
            '   "showAxis": true,'+
            '   "title": "",'+
            '   "icons": {'+
            '   "useIcons": false,'+
            '   "iconProps": {'+
            '   "fit": "cover",'+
            '   "column": "",'+
            '   "type": "round"'+
            '   }'+
            '   }'+
            '   }'+
            '   },'+
            '   "type": "chart"'+
            '   },'+
            '   "text_6": {'+
            '   "parameters": {'+
            '   "fontSize": 14,'+
            '   "text": "{{cell(Static_Measure_List.selection,0, \\\"labelkpi3\\\").asObject()}}",'+
            '   "textAlignment": "right",'+
            '   "textColor": "#091A3E"'+
            '   },'+
            '   "type": "text"'+
            '   },'+
            '   "chart_1": {'+
            '   "parameters": {'+
            '   "autoFitMode": "none",'+
            '   "showValues": true,'+
            '   "bins": {'+
            '   "breakpoints": {'+
            '   "high": 100,'+
            '   "low": 0'+
            '   },'+
            '   "bands": {'+
            '   "high": {'+
            '   "color": "#008000",'+
            '   "label": ""'+
            '   },'+
            '   "low": {'+
            '   "color": "#B22222",'+
            '   "label": ""'+
            '   },'+
            '   "medium": {'+
            '   "color": "#ffa500",'+
            '   "label": ""'+
            '   }'+
            '   }'+
            '   },'+
            '   "legend": {'+
            '   "showHeader": true,'+
            '   "show": false,'+
            '   "customSize": "auto",'+
            '   "position": "right-top",'+
            '   "inside": false'+
            '   },'+
            '   "axisMode": "multi",'+
            '   "tooltip": {'+
            '   "showBinLabel": true,'+
            '   "measures": "",'+
            '   "showPercentage": true,'+
            '   "showDimensions": true,'+
            '   "showMeasures": true,'+
            '   "customizeTooltip": false,'+
            '   "dimensions": ""'+
            '   },'+
            '   "visualizationType": "hbar",'+
            '   "exploreLink": false,'+
            '   "title": {'+
            '   "fontSize": 14,'+
            '   "subtitleFontSize": 11,'+
            '   "label": "",'+
            '   "align": "center",'+
            '   "subtitleLabel": ""'+
            '   },'+
            '   "binValues": false,'+
            '   "trellis": {'+
            '   "flipLabels": false,'+
            '   "showGridLines": true,'+
            '   "size": [100, 100],'+
            '   "enable": false,'+
            '   "type": "x",'+
            '   "chartsPerLine": 4'+
            '   },'+
            '   "measureAxis2": {'+
            '   "sqrtScale": false,'+
            '   "showTitle": true,'+
            '   "showAxis": true,'+
            '   "title": "",'+
            '   "customDomain": {'+
            '   "showDomain": false'+
            '   }'+
            '   },'+
            '   "measureAxis1": {'+
            '   "sqrtScale": false,'+
            '   "showTitle": false,'+
            '   "showAxis": true,'+
            '   "title": "",'+
            '   "customDomain": {'+
            '   "showDomain": false'+
            '   }'+
            '   },'+
            '   "theme": "wave",'+
            '   "dimensionAxis": {'+
            '   "showTitle": false,'+
            '   "customSize": "auto",'+
            '   "showAxis": true,'+
            '   "title": "",'+
            '   "icons": {'+
            '   "useIcons": false,'+
            '   "iconProps": {'+
            '   "fit": "cover",'+
            '   "column": "",'+
            '   "type": "round"'+
            '   }'+
            '   }'+
            '   }'+
            '   },'+
            '   "type": "chart"'+
            '   },'+
            '   "text_9": {'+
            '   "parameters": {'+
            '   "fontSize": 18,'+
            '   "text": "Trend over time by the following measure(s):",'+
            '   "textAlignment": "left",'+
            '   "textColor": "#091A3E"'+
            '   },'+
            '   "type": "text"'+
            '   },'+
            '   "chart_4": {'+
            '   "parameters": {'+
            '   "autoFitMode": "none",'+
            '   "showValues": true,'+
            '   "bins": {'+
            '   "breakpoints": {'+
            '   "high": 100,'+
            '   "low": 0'+
            '   },'+
            '   "bands": {'+
            '   "high": {'+
            '   "color": "#008000",'+
            '   "label": ""'+
            '   },'+
            '   "low": {'+
            '   "color": "#B22222",'+
            '   "label": ""'+
            '   },'+
            '   "medium": {'+
            '   "color": "#ffa500",'+
            '   "label": ""'+
            '   }'+
            '   }'+
            '   },'+
            '   "legend": {'+
            '   "showHeader": true,'+
            '   "show": false,'+
            '   "customSize": "auto",'+
            '   "position": "right-top",'+
            '   "inside": false'+
            '   },'+
            '   "axisMode": "multi",'+
            '   "tooltip": {'+
            '   "showBinLabel": true,'+
            '   "measures": "",'+
            '   "showPercentage": true,'+
            '   "showDimensions": true,'+
            '   "showMeasures": true,'+
            '   "customizeTooltip": false,'+
            '   "dimensions": ""'+
            '   },'+
            '   "visualizationType": "hbar",'+
            '   "exploreLink": false,'+
            '   "title": {'+
            '   "fontSize": 14,'+
            '   "subtitleFontSize": 11,'+
            '   "label": "",'+
            '   "align": "center",'+
            '   "subtitleLabel": ""'+
            '   },'+
            '   "binValues": false,'+
            '   "trellis": {'+
            '   "flipLabels": false,'+
            '   "showGridLines": true,'+
            '   "size": [100, 100],'+
            '   "enable": false,'+
            '   "type": "x",'+
            '   "chartsPerLine": 4'+
            '   },'+
            '   "measureAxis2": {'+
            '   "sqrtScale": false,'+
            '   "showTitle": true,'+
            '   "showAxis": true,'+
            '   "title": "",'+
            '   "customDomain": {'+
            '   "showDomain": false'+
            '   }'+
            '   },'+
            '   "measureAxis1": {'+
            '   "sqrtScale": false,'+
            '   "showTitle": false,'+
            '   "showAxis": true,'+
            '   "title": "",'+
            '   "customDomain": {'+
            '   "showDomain": false'+
            '   }'+
            '   },'+
            '   "theme": "wave",'+
            '   "dimensionAxis": {'+
            '   "showTitle": false,'+
            '   "customSize": "auto",'+
            '   "showAxis": true,'+
            '   "title": "",'+
            '   "icons": {'+
            '   "useIcons": false,'+
            '   "iconProps": {'+
            '   "fit": "cover",'+
            '   "column": "",'+
            '   "type": "round"'+
            '   }'+
            '   }'+
            '   }'+
            '   },'+
            '   "type": "chart"'+
            '   },'+
            '   "text_8": {'+
            '   "parameters": {'+
            '   "fontSize": 14,'+
            '   "text": "{{cell(Static_Measure_List.selection,0, \\\"labelkpi5\\\").asObject()}}",'+
            '   "textAlignment": "right",'+
            '   "textColor": "#091A3E"'+
            '   },'+
            '   "type": "text"'+
            '   },'+
            '   "chart_3": {'+
            '   "parameters": {'+
            '   "autoFitMode": "none",'+
            '   "showValues": true,'+
            '   "bins": {'+
            '   "breakpoints": {'+
            '   "high": 100,'+
            '   "low": 0'+
            '   },'+
            '   "bands": {'+
            '   "high": {'+
            '   "color": "#008000",'+
            '   "label": ""'+
            '   },'+
            '   "low": {'+
            '   "color": "#B22222",'+
            '   "label": ""'+
            '   },'+
            '   "medium": {'+
            '   "color": "#ffa500",'+
            '   "label": ""'+
            '   }'+
            '   }'+
            '   },'+
            '   "legend": {'+
            '   "showHeader": false,'+
            '   "show": false,'+
            '   "customSize": "auto",'+
            '   "position": "right-top",'+
            '   "inside": false'+
            '   },'+
            '   "axisMode": "multi",'+
            '   "tooltip": {'+
            '   "showBinLabel": true,'+
            '   "measures": "",'+
            '   "showPercentage": true,'+
            '   "showDimensions": true,'+
            '   "showMeasures": true,'+
            '   "customizeTooltip": false,'+
            '   "dimensions": ""'+
            '   },'+
            '   "visualizationType": "hbar",'+
            '   "exploreLink": true,'+
            '   "title": {'+
            '   "fontSize": 14,'+
            '   "subtitleFontSize": 11,'+
            '   "label": "",'+
            '   "align": "center",'+
            '   "subtitleLabel": ""'+
            '   },'+
            '   "binValues": false,'+
            '   "trellis": {'+
            '   "flipLabels": false,'+
            '   "showGridLines": true,'+
            '   "size": [100, 100],'+
            '   "enable": false,'+
            '   "type": "x",'+
            '   "chartsPerLine": 4'+
            '   },'+
            '   "measureAxis2": {'+
            '   "sqrtScale": false,'+
            '   "showTitle": true,'+
            '   "showAxis": true,'+
            '   "title": "",'+
            '   "customDomain": {'+
            '   "showDomain": false'+
            '   }'+
            '   },'+
            '   "measureAxis1": {'+
            '   "sqrtScale": false,'+
            '   "showTitle": false,'+
            '   "showAxis": true,'+
            '   "title": "",'+
            '   "customDomain": {'+
            '   "showDomain": false'+
            '   }'+
            '   },'+
            '   "theme": "wave",'+
            '   "dimensionAxis": {'+
            '   "showTitle": false,'+
            '   "customSize": "auto",'+
            '   "showAxis": true,'+
            '   "title": "",'+
            '   "icons": {'+
            '   "useIcons": false,'+
            '   "iconProps": {'+
            '   "fit": "cover",'+
            '   "column": "",'+
            '   "type": "round"'+
            '   }'+
            '   }'+
            '   }'+
            '   },'+
            '   "type": "chart"'+
            '   },'+
            '   "dateselector_1": {'+
            '   "parameters": {'+
            '   "calendarTypeSwitchingAllowed": false,'+
            '   "defaultAbsoluteMode": true,'+
            '   "defaultFiscalMode": false,'+
            '   "instant": false,'+
            '   "modeSwitchingAllowed": true,'+
            '   "title": "{{cell(Static_Dimensions.selection,0, \\\"datelabel1\\\").asObject()}}"'+
            '   },'+
            '   "type": "dateselector"'+
            '   },'+
            '   "text_1": {'+
            '   "parameters": {'+
            '   "fontSize": 24,'+
            '   "text": "Til",'+
            '   "textAlignment": "center",'+
            '   "textColor": "#335779"'+
            '   },'+
            '   "type": "text"'+
            '   },'+
            '   "number_5": {'+
            '   "parameters": {'+
            '   "compact": true,'+
            '   "exploreLink": false,'+
            '   "measureField": "max_Amount",'+
            '   "numberColor": "#335779",'+
            '   "numberSize": 24,'+
            '   "textAlignment": "center",'+
            '   "title": "",'+
            '   "titleColor": "#335779",'+
            '   "titleSize": 16'+
            '   },';
            String json3 = '"type": "number"'+
            '   },'+
            '   "number_4": {'+
            '   "parameters": {'+
            '   "compact": true,'+
            '   "exploreLink": false,'+
            '   "measureField": "min_Amount",'+
            '   "numberColor": "#335779",'+
            '   "numberSize": 24,'+
            '   "textAlignment": "center",'+
            '   "title": "",'+
            '   "titleColor": "#335779",'+
            '   "titleSize": 16'+
            '   },'+
            '   "type": "number"'+
            '   },'+
            '   "number_3": {'+
            '   "parameters": {'+
            '   "compact": true,'+
            '   "exploreLink": false,'+
            '   "measureField": "sum_CloseDate_day_epoch",'+
            '   "numberColor": "#335779",'+
            '   "numberSize": 24,'+
            '   "textAlignment": "center",'+
            '   "title": "",'+
            '   "titleColor": "#335779",'+
            '   "titleSize": 16'+
            '   },'+
            '   "type": "number"'+
            '   },'+
            '   "listselector_18": {'+
            '   "parameters": {'+
            '   "compact": false,'+
            '   "exploreLink": false,'+
            '   "instant": true,'+
            '   "measureField": "count",'+
            '   "title": "{{cell(Static_Dimensions.selection,0, \\\"label7\\\").asObject()}}"'+
            '   },'+
            '   "type": "listselector"'+
            '   },'+
            '   "number_2": {'+
            '   "parameters": {'+
            '   "compact": true,'+
            '   "exploreLink": false,'+
            '   "measureField": "min_Amount",'+
            '   "numberColor": "#335779",'+
            '   "numberSize": 24,'+
            '   "textAlignment": "center",'+
            '   "title": "",'+
            '   "titleColor": "#335779",'+
            '   "titleSize": 16'+
            '   },'+
            '   "type": "number"'+
            '   },'+
            '   "listselector_17": {'+
            '   "parameters": {'+
            '   "compact": false,'+
            '   "exploreLink": false,'+
            '   "instant": true,'+
            '   "title": "Select Grouping(s)"'+
            '   },'+
            '   "type": "listselector"'+
            '   },'+
            '   "number_1": {'+
            '   "parameters": {'+
            '   "compact": true,'+
            '   "exploreLink": false,'+
            '   "measureField": "sum_CloseDate_day_epoch",'+
            '   "numberColor": "#335779",'+
            '   "numberSize": 24,'+
            '   "textAlignment": "center",'+
            '   "title": "",'+
            '   "titleColor": "#335779",'+
            '   "titleSize": 16'+
            '   },'+
            '   "type": "number"'+
            '   },'+
            '   "listselector_12": {'+
            '   "parameters": {'+
            '   "compact": false,'+
            '   "exploreLink": false,'+
            '   "instant": true,'+
            '   "measureField": "count",'+
            '   "title": "{{cell(Static_Dimensions.selection,0, \\\"label12\\\").asObject()}}"'+
            '   },'+
            '   "type": "listselector"'+
            '   },'+
            '   "listselector_11": {'+
            '   "parameters": {'+
            '   "compact": false,'+
            '   "exploreLink": false,'+
            '   "instant": true,'+
            '   "measureField": "count",'+
            '   "title": "{{cell(Static_Dimensions.selection,0, \\\"label9\\\").asObject()}}"'+
            '   },'+
            '   "type": "listselector"'+
            '   },'+
            '   "listselector_10": {'+
            '   "parameters": {'+
            '   "compact": false,'+
            '   "exploreLink": false,'+
            '   "instant": true,'+
            '   "measureField": "count",'+
            '   "title": "{{cell(Static_Dimensions.selection,0, \\\"label11\\\").asObject()}}"'+
            '   },'+
            '   "type": "listselector"'+
            '   },'+
            '   "listselector_16": {'+
            '   "parameters": {'+
            '   "compact": false,'+
            '   "exploreLink": false,'+
            '   "instant": true,'+
            '   "measureField": "count",'+
            '   "title": "{{cell(Static_Dimensions.selection,0, \\\"label8\\\").asObject()}}"'+
            '   },'+
            '   "type": "listselector"'+
            '   },'+
            '   "listselector_15": {'+
            '   "parameters": {'+
            '   "compact": false,'+
            '   "exploreLink": false,'+
            '   "instant": true,'+
            '   "measureField": "count",'+
            '   "title": "{{cell(Static_Dimensions.selection,0, \\\"label3\\\").asObject()}}"'+
            '   },'+
            '   "type": "listselector"'+
            '   },'+
            '   "listselector_14": {'+
            '   "parameters": {'+
            '   "compact": false,'+
            '   "exploreLink": false,'+
            '   "instant": true,'+
            '   "title": "Select Measure"'+
            '   },'+
            '   "type": "listselector"'+
            '   },'+
            '   "listselector_13": {'+
            '   "parameters": {'+
            '   "compact": false,'+
            '   "exploreLink": false,'+
            '   "instant": true,'+
            '   "measureField": "count",'+
            '   "title": "{{cell(Static_Dimensions.selection,0, \\\"label6\\\").asObject()}}"'+
            '   },'+
            '   "type": "listselector"'+
            '   },'+
            '   "number_9": {'+
            '   "parameters": {'+
            '   "compact": true,'+
            '   "exploreLink": true,'+
            '   "measureField": "sum_CloseDate_day_epoch",'+
            '   "numberColor": "#335779",'+
            '   "numberSize": 24,'+
            '   "textAlignment": "center",'+
            '   "title": "",'+
            '   "titleColor": "#335779",'+
            '   "titleSize": 16'+
            '   },'+
            '   "type": "number"'+
            '   },'+
            '   "number_8": {'+
            '   "parameters": {'+
            '   "compact": true,'+
            '   "exploreLink": false,'+
            '   "measureField": "sum_CloseDate_sec_epoch",'+
            '   "numberColor": "#335779",'+
            '   "numberSize": 24,'+
            '   "textAlignment": "center",'+
            '   "title": "",'+
            '   "titleColor": "#335779",'+
            '   "titleSize": 16'+
            '   },'+
            '   "type": "number"'+
            '   },'+
            '   "number_7": {'+
            '   "parameters": {'+
            '   "compact": true,'+
            '   "exploreLink": false,'+
            '   "measureField": "max_Amount",'+
            '   "numberColor": "#335779",'+
            '   "numberSize": 24,'+
            '   "textAlignment": "center",'+
            '   "title": "",'+
            '   "titleColor": "#335779",'+
            '   "titleSize": 16'+
            '   },'+
            '   "type": "number"'+
            '   },'+
            '   "number_6": {'+
            '   "parameters": {'+
            '   "compact": true,'+
            '   "exploreLink": false,'+
            '   "measureField": "sum_CloseDate_sec_epoch",'+
            '   "numberColor": "#335779",'+
            '   "numberSize": 24,'+
            '   "textAlignment": "center",'+
            '   "title": "",'+
            '   "titleColor": "#335779",'+
            '   "titleSize": 16'+
            '   },'+
            '   "type": "number"'+
            '   },'+
            '   "dateselector_2": {'+
            '   "parameters": {'+
            '   "calendarTypeSwitchingAllowed": false,'+
            '   "defaultAbsoluteMode": true,'+
            '   "defaultFiscalMode": false,'+
            '   "instant": false,'+
            '   "modeSwitchingAllowed": true,'+
            '   "title": "{{cell(Static_Dimensions.selection,0, \\\"datelabel2\\\").asObject()}}"'+
            '   },'+
            '   "type": "dateselector"'+
            '   },'+
            '   "listselector_21": {'+
            '   "parameters": {'+
            '   "compact": false,'+
            '   "exploreLink": false,'+
            '   "instant": true,'+
            '   "title": "Select Measure"'+
            '   },'+
            '   "type": "listselector"'+
            '   },'+
            '   "dateselector_3": {'+
            '   "parameters": {'+
            '   "calendarTypeSwitchingAllowed": false,'+
            '   "defaultAbsoluteMode": true,'+
            '   "defaultFiscalMode": false,'+
            '   "instant": false,'+
            '   "modeSwitchingAllowed": true,'+
            '   "title": "{{cell(Static_Dimensions.selection,0, \\\"datelabel3\\\").asObject()}}"'+
            '   },'+
            '   "type": "dateselector"'+
            '   },'+
            '   "listselector_20": {'+
            '   "parameters": {'+
            '   "compact": false,'+
            '   "exploreLink": false,'+
            '   "instant": true,'+
            '   "title": "Select Grouping(s)"'+
            '   },'+
            '   "type": "listselector"'+
            '   },'+
            '   "listselector_7": {'+
            '   "parameters": {'+
            '   "compact": false,'+
            '   "exploreLink": false,'+
            '   "instant": true,'+
            '   "measureField": "count",'+
            '   "title": "{{cell(Static_Dimensions.selection,0, \\\"label10\\\").asObject()}}"'+
            '   },'+
            '   "type": "listselector"'+
            '   },'+
            '   "listselector_6": {'+
            '   "parameters": {'+
            '   "compact": false,'+
            '   "exploreLink": false,'+
            '   "instant": true,'+
            '   "measureField": "count",'+
            '   "title": "{{cell(Static_Dimensions.selection,0, \\\"label2\\\").asObject()}}"'+
            '   },'+
            '   "type": "listselector"'+
            '   },'+
            '   "listselector_9": {'+
            '   "parameters": {'+
            '   "compact": false,'+
            '   "exploreLink": false,'+
            '   "instant": true,'+
            '   "measureField": "count",'+
            '   "title": "{{cell(Static_Dimensions.selection,0, \\\"label5\\\").asObject()}}"'+
            '   },'+
            '   "type": "listselector"'+
            '   },'+
            '   "listselector_8": {'+
            '   "parameters": {'+
            '   "compact": false,'+
            '   "exploreLink": false,'+
            '   "instant": true,'+
            '   "measureField": "count",'+
            '   "title": "{{cell(Static_Dimensions.selection,0, \\\"label4\\\").asObject()}}"'+
            '   },'+
            '   "type": "listselector"'+
            '   },'+
            '   "listselector_3": {'+
            '   "parameters": {'+
            '   "compact": false,'+
            '   "exploreLink": false,'+
            '   "instant": true,'+
            '   "measureField": "count",'+
            '   "title": "{{cell(Static_Dimensions.selection,0, \\\"label1\\\").asObject()}}"'+
            '   },'+
            '   "type": "listselector"'+
            '   },'+
            '   "listselector_2": {'+
            '   "parameters": {'+
            '   "compact": false,'+
            '   "exploreLink": false,'+
            '   "instant": true,'+
            '   "measureField": "count",'+
            '   "title": "Filter_Records"'+
            '   },'+
            '   "type": "listselector"'+
            '   },'+
            '   "listselector_5": {'+
            '   "parameters": {'+
            '   "compact": false,'+
            '   "displayTemplate": "[\\\"analyticscc__Date_2__c_Year\\\",\\\"analyticscc__Date_2__c_Month\\\",\\\"analyticscc__Date_2__c_Day\\\"]",'+
            '   "exploreLink": false,'+
            '   "instant": true,'+
            '   "measureField": "none",'+
            '   "title": ""'+
            '   },'+
            '   "type": "listselector"'+
            '   },'+
            '   "listselector_4": {'+
            '   "parameters": {'+
            '   "compact": false,'+
            '   "displayTemplate": "[\\\"analyticscc__Date_2__c_Year\\\",\\\"analyticscc__Date_2__c_Month\\\",\\\"analyticscc__Date_2__c_Day\\\"]",'+
            '   "exploreLink": false,'+
            '   "instant": true,'+
            '   "measureField": "none",'+
            '   "title": ""'+
            '   },'+
            '   "type": "listselector"'+
            '   },'+
            '   "table_1": {'+
            '   "parameters": {'+
            '   "borderColor": "#e0e5ee",'+
            '   "borderWidth": 1,'+
            '   "cell": {'+
            '   "backgroundColor": "#ffffff",'+
            '   "fontColor": "#16325c",'+
            '   "fontSize": 12'+
            '   },'+
            '   "columns": [],'+
            '   "customBulkActions": [],'+
            '   "exploreLink": true,'+
            '   "header": {'+
            '   "backgroundColor": "#f4f6f9",'+
            '   "fontColor": "#16325c",'+
            '   "fontSize": 12'+
            '   },'+
            '   "innerMajorBorderColor": "#a8b7c7",'+
            '   "innerMinorBorderColor": "#e0e5ee",'+
            '   "maxColumnWidth": 300,'+
            '   "minColumnWidth": 40,'+
            '   "mode": "variable",'+
            '   "numberOfLines": 1,'+
            '   "verticalPadding": 8'+
            '   },'+
            '   "type": "table"'+
            '   },'+
            '   "pillbox_2": {'+
            '   "parameters": {'+
            '   "compact": false,'+
            '   "exploreLink": false'+
            '   },'+
            '   "type": "pillbox"'+
            '   },'+
            '   "pillbox_1": {'+
            '   "parameters": {'+
            '   "compact": false,'+
            '   "exploreLink": false'+
            '   },'+
            '   "type": "pillbox"'+
            '   },'+
            '   "pillbox_4": {'+
            '   "parameters": {'+
            '   "compact": false,'+
            '   "exploreLink": false'+
            '   },'+
            '   "type": "pillbox"'+
            '   },'+
            '   "pillbox_6": {'+
            '   "parameters": {'+
            '   "compact": false,'+
            '   "exploreLink": false'+
            '   },'+
            '   "type": "pillbox"'+
            '   },'+
            '   "listselector_1": {'+
            '   "parameters": {'+
            '   "compact": false,'+
            '   "expanded": true,'+
            '   "exploreLink": false,'+
            '   "instant": false,'+
            '   "title": "Select Measure(s)"'+
            '   },'+
            '   "type": "listselector"'+
            '   }'+
            '   }'+
            '   }'+
            '}';
                String jsonss = json +json4+ json1 +json2+json3;
                return jsonss;
            }
    
    public string NewStringval2(){
        String json=    '{'+
    '   "folder": {'+
    '   "id": "00l28000001VoU1AAK"'+
    '   },'+
    '   "label": "Copy of Single DB Template",'+
    '   "state": {'+
    '   "dataSourceLinks": [],'+
    '   "filters": [],'+
    '   "gridLayouts": [{'+
    '   "name": "Default",'+
    '   "numColumns": 20,'+
    '   "pages": [{'+
    '   "name": "03942376-0b77-4993-875d-3521ff42e2a8",'+
    '   "widgets": [{'+
    '   "colspan": 20,'+
    '   "column": 0,'+
    '   "name": "text_1",'+
    '   "row": 0,'+
    '   "rowspan": 3,'+
    '   "widgetStyle": {'+
    '   "backgroundColor": "#335779",'+
    '   "borderColor": "#5C7A99",'+
    '   "borderEdges": ["bottom"],'+
    '   "borderRadius": 0,'+
    '   "borderWidth": 2'+
    '   }'+
    '   }, {'+
    '   "colspan": 3,'+
    '   "column": 0,'+
    '   "name": "text_4",'+
    '   "row": 11,'+
    '   "rowspan": 3,'+
    '   "widgetStyle": {'+
    '   "backgroundColor": "#335779",'+
    '   "borderEdges": []'+
    '   }'+
    '   }, {'+
    '   "colspan": 3,'+
    '   "column": 0,'+
    '   "name": "listselector_1",'+
    '   "row": 15,'+
    '   "rowspan": 3,'+
    '   "widgetStyle": {'+
    '   "borderEdges": [],'+
    '   "backgroundColor": "rgba(255, 255, 255, 0)"'+
    '   }'+
    '   }, {'+
    '   "colspan": 3,'+
    '   "column": 0,'+
    '   "name": "listselector_2",'+
    '   "row": 19,'+
    '   "rowspan": 3,'+
    '   "widgetStyle": {'+
    '   "borderEdges": [],'+
    '   "backgroundColor": "rgba(255, 255, 255, 0)"'+
    '   }'+
    '   }, {'+
    '   "colspan": 3,'+
    '   "column": 0,'+
    '   "name": "listselector_3",'+
    '   "row": 23,'+
    '   "rowspan": 3,'+
    '   "widgetStyle": {'+
    '   "borderEdges": [],'+
    '   "backgroundColor": "rgba(255, 255, 255, 0)"'+
    '   }'+
    '   }, {'+
    '   "colspan": 3,'+
    '   "column": 0,'+
    '   "name": "listselector_11",'+
    '   "row": 27,'+
    '   "rowspan": 3,'+
    '   "widgetStyle": {'+
    '   "backgroundColor": "rgba(255, 255, 255, 0)",'+
    '   "borderColor": "#E6ECF2",'+
    '   "borderEdges": [],'+
    '   "borderRadius": 0,'+
    '   "borderWidth": 1'+
    '   }'+
    '   }, {'+
    '   "colspan": 3,'+
    '   "column": 0,'+
    '   "name": "listselector_10",'+
    '   "row": 31,'+
    '   "rowspan": 3,'+
    '   "widgetStyle": {'+
    '   "backgroundColor": "rgba(255, 255, 255, 0)",'+
    '   "borderColor": "#E6ECF2",'+
    '   "borderEdges": [],'+
    '   "borderRadius": 0,'+
    '   "borderWidth": 1'+
    '   }'+
    '   }, {'+
    '   "colspan": 3,'+
    '   "column": 0,'+
    '   "name": "listselector_9",'+
    '   "row": 35,'+
    '   "rowspan": 3,'+
    '   "widgetStyle": {'+
    '   "backgroundColor": "rgba(255, 255, 255, 0)",'+
    '   "borderColor": "#E6ECF2",'+
    '   "borderEdges": [],'+
    '   "borderRadius": 0,'+
    '   "borderWidth": 1'+
    '   }'+
    '   }, {'+
    '   "colspan": 3,'+
    '   "column": 0,'+
    '   "name": "dateselector_1",'+
    '   "row": 39,'+
    '   "rowspan": 3,'+
    '   "widgetStyle": {'+
    '   "borderEdges": [],'+
    '   "backgroundColor": "rgba(255, 255, 255, 0)"'+
    '   }'+
    '   }, {'+
    '   "colspan": 3,'+
    '   "column": 0,'+
    '   "name": "container_3",'+
    '   "row": 14,'+
    '   "rowspan": 30,'+
    '   "widgetStyle": {'+
    '   "borderColor": "#335779",'+
    '   "borderEdges": ["bottom"]'+
    '   }'+
    '   }, {'+
    '   "colspan": 6,'+
    '   "column": 7,'+
    '   "name": "chart_5",'+
    '   "row": 4,'+
    '   "rowspan": 6,'+
    '   "widgetStyle": {'+
    '   "backgroundColor": "#FFFFFF",'+
    '   "borderColor": "#335779",'+
    '   "borderEdges": ["bottom"],'+
    '   "borderRadius": 0,'+
    '   "borderWidth": 2'+
    '   }'+
    '   }, {'+
    '   "colspan": 17,'+
    '   "column": 3,'+
    '   "name": "text_2",'+
    '   "row": 11,'+
    '   "rowspan": 3,'+
    '   "widgetStyle": {'+
    '   "backgroundColor": "#335779",'+
    '   "borderColor": "#2EC2BA",'+
    '   "borderEdges": [],'+
    '   "borderRadius": 0,'+
    '   "borderWidth": 2'+
    '   }'+
    '   }, {'+
    '   "colspan": 3,'+
    '   "column": 17,'+
    '   "name": "listselector_8",'+
    '   "row": 14,'+
    '   "rowspan": 3,'+
    '   "widgetStyle": {'+
    '   "borderEdges": [],'+
    '   "backgroundColor": "rgba(255, 255, 255, 0)"'+
    '   }'+
    '   }, {'+
    '   "colspan": 17,'+
    '   "column": 3,'+
    '   "name": "chart_1",'+
    '   "row": 17,'+
    '   "rowspan": 27,'+
    '   "widgetStyle": {'+
    '   "borderEdges": []'+
    '   }'+
    '   }, {'+
    '   "colspan": 17,'+
    '   "column": 3,'+
    '   "name": "container_9",'+
    '   "row": 14,'+
    '   "rowspan": 30,'+
    '   "widgetStyle": {'+
    '   "backgroundColor": "#FFFFFF",'+
    '   "borderColor": "#335779",'+
    '   "borderEdges": ["bottom"],'+
    '   "borderRadius": 0,'+
    '   "borderWidth": 1'+
    '   }'+
    '   }, {'+
    '   "colspan": 20,'+
    '   "column": 0,'+
    '   "name": "text_3",'+
    '   "row": 47,'+
    '   "rowspan": 3,'+
    '   "widgetStyle": {'+
    '   "backgroundColor": "#335779",'+
    '   "borderColor": "#335779",'+
    '   "borderEdges": [],'+
    '   "borderRadius": 0,'+
    '   "borderWidth": 2'+
    '   }'+
    '   }, {'+
    '   "colspan": 3,'+
    '   "column": 1,'+
    '   "name": "listselector_5",'+
    '   "row": 51,'+
    '   "rowspan": 3,'+
    '   "widgetStyle": {'+
    '   "borderEdges": [],'+
    '   "backgroundColor": "rgba(255, 255, 255, 0)"'+
    '   }'+
    '   }, {'+
    '   "colspan": 3,'+
    '   "column": 7,'+
    '   "name": "listselector_4",'+
    '   "row": 51,'+
    '   "rowspan": 3,'+
    '   "widgetStyle": {'+
    '   "backgroundColor": "rgba(255, 255, 255, 0)",'+
    '   "borderColor": "#E6ECF2",'+
    '   "borderEdges": [],'+
    '   "borderRadius": 0,'+
    '   "borderWidth": 1'+
    '   }'+
    '   }, {'+
    '   "colspan": 3,'+
    '   "column": 15,'+
    '   "name": "listselector_7",'+
    '   "row": 51,'+
    '   "rowspan": 3,'+
    '   "widgetStyle": {'+
    '   "backgroundColor": "rgba(255, 255, 255, 0)",'+
    '   "borderColor": "#E6ECF2",'+
    '   "borderEdges": [],'+
    '   "borderRadius": 0,'+
    '   "borderWidth": 1'+
    '   }'+
    '   }, {'+
    '   "colspan": 5,'+
    '   "column": 0,'+
    '   "name": "chart_2",'+
    '   "row": 54,'+
    '   "rowspan": 27,'+
    '   "widgetStyle": {'+
    '   "borderEdges": ["all"]'+
    '   }'+
    '   }, {'+
    '   "colspan": 7,'+
    '   "column": 5,'+
    '   "name": "chart_3",'+
    '   "row": 54,'+
    '   "rowspan": 27,'+
    '   "widgetStyle": {'+
    '   "borderEdges": ["all"]'+
    '   }'+
    '   }, {'+
    '   "colspan": 8,'+
    '   "column": 12,'+
    '   "name": "chart_4",'+
    '   "row": 54,'+
    '   "rowspan": 27,'+
    '   "widgetStyle": {'+
    '   "borderEdges": ["all"]'+
    '   }'+
    '   }, {'+
    '   "colspan": 20,'+
    '   "column": 0,'+
    '   "name": "container_5",'+
    '   "row": 50,'+
    '   "rowspan": 33,'+
    '   "widgetStyle": {'+
    '   "backgroundColor": "#FFFFFF",'+
    '   "borderColor": "#335779",'+
    '   "borderEdges": ["bottom"],'+
    '   "borderRadius": 0,'+
    '   "borderWidth": 1'+
    '   }'+
    '   }, {'+
    '   "colspan": 20,'+
    '   "column": 0,'+
    '   "name": "text_5",'+
    '   "row": 86,'+
    '   "rowspan": 3,'+
    '   "widgetStyle": {'+
    '   "backgroundColor": "#335779",'+
    '   "borderColor": "#2EC2BA",'+
    '   "borderEdges": [],'+
    '   "borderRadius": 0,'+
    '   "borderWidth": 2'+
    '   }'+
    '   }, {'+
    '   "colspan": 20,'+
    '   "column": 0,'+
    '   "name": "table_1",'+
    '   "row": 89,'+
    '   "rowspan": 32,'+
    '   "widgetStyle": {'+
    '   "borderEdges": []'+
    '   }'+
    '   }]'+
    '   }],'+
    '   "rowHeight": "fine",'+
    '   "selectors": ["minWidth(1000)"],'+
    '   "style": {'+
    '   "alignmentX": "left",'+
    '   "alignmentY": "top",'+
    '   "backgroundColor": "#F2F6FA",'+
    '   "cellSpacingX": 16,'+
    '   "cellSpacingY": 0,'+
    '   "fit": "original",'+
    '   "gutterColor": "#FFFFFF"'+
    '   },'+
    '   "version": 1.0'+
    '   }],'+
    '   "layouts": [],'+
    '   "steps": {},'+
    '   "widgetStyle": {'+
    '   "backgroundColor": "#FFFFFF",'+
    '   "borderColor": "#E6ECF2",'+
    '   "borderEdges": [],'+
    '   "borderRadius": 0,'+
    '   "borderWidth": 1'+
    '   },';
    String json1 = '"widgets": {'+
    '   "container_1": {'+
    '   "parameters": {'+
    '   "alignmentX": "left",'+
    '   "alignmentY": "top",'+
    '   "fit": "original"'+
    '   },'+
    '   "type": "container"'+
    '   },'+
    '   "container_2": {'+
    '   "parameters": {'+
    '   "alignmentX": "left",'+
    '   "alignmentY": "top",'+
    '   "fit": "original"'+
    '   },'+
    '   "type": "container"'+
    '   },'+
    '   "container_3": {'+
    '   "parameters": {'+
    '   "alignmentX": "left",'+
    '   "alignmentY": "top",'+
    '   "fit": "original"'+
    '   },'+
    '   "type": "container"'+
    '   },'+
    '   "container_4": {'+
    '   "parameters": {'+
    '   "alignmentX": "left",'+
    '   "alignmentY": "top",'+
    '   "fit": "original"'+
    '   },'+
    '   "type": "container"'+
    '   },'+
    '   "container_5": {'+
    '   "parameters": {'+
    '   "alignmentX": "left",'+
    '   "alignmentY": "top",'+
    '   "fit": "original"'+
    '   },'+
    '   "type": "container"'+
    '   },'+
    '   "text_3": {'+
    '   "parameters": {'+
    '   "fontSize": 20,'+
    '   "text": "How are we doing against our target by different groupings?",'+
    '   "textAlignment": "center",'+
    '   "textColor": "#FFFFFF"'+
    '   },'+
    '   "type": "text"'+
    '   },'+
    '   "text_2": {'+
    '   "parameters": {'+
    '   "fontSize": 20,'+
    '   "text": "How are we doing against our target over time?",'+
    '   "textAlignment": "center",'+
    '   "textColor": "#FFFFFF"'+
    '   },'+
    '   "type": "text"'+
    '   },'+
    '   "chart_5": {'+
    '   "parameters": {'+
    '   "max": "0.85",'+
    '   "legend": {'+
    '   "showHeader": true,'+
    '   "show": false,'+
    '   "position": "right-top",'+
    '   "inside": false'+
    '   },'+
    '   "tooltip": {'+
    '   "showBinLabel": true,'+
    '   "measures": "",'+
    '   "showPercentage": true,'+
    '   "showDimensions": true,'+
    '   "showMeasures": true,'+
    '   "customizeTooltip": false,'+
    '   "dimensions": ""'+
    '   },'+
    '   "visualizationType": "flatgauge",'+
    '   "exploreLink": true,'+
    '   "medium": "0.90",'+
    '   "title": {'+
    '   "fontSize": 14,'+
    '   "subtitleFontSize": 11,'+
    '   "label": "sum(QuotaAmount)",'+
    '   "align": "center",'+
    '   "subtitleLabel": ""'+
    '   },'+
    '   "trellis": {'+
    '   "flipLabels": false,'+
    '   "showGridLines": true,'+
    '   "size": [100, 100],'+
    '   "enable": false,'+
    '   "type": "x",'+
    '   "chartsPerLine": 4'+
    '   },'+
    '   "colors": {'+
    '   "mediumColor2": "#F29946",'+
    '   "mediumColor1": "#FED444",'+
    '   "lowColor1": "#F71979",'+
    '   "lowColor2": "#CC203D",'+
    '   "highColor1": "#7BDE4E",'+
    '   "highColor2": "#169913"'+
    '   },'+
    '   "high": "0.88",'+
    '   "min": 0,'+
    '   "valueType": "compactNumber",'+
    '   "theme": "wave"'+
    '   },'+
    '   "type": "chart"'+
    '   },'+
    '   "text_5": {'+
    '   "parameters": {'+
    '   "fontSize": 20,'+
    '   "text": "Actual Results",'+
    '   "textAlignment": "center",'+
    '   "textColor": "#FFFFFF"'+
    '   },'+
    '   "type": "text"'+
    '   },'+
    '   "text_4": {'+
    '   "parameters": {'+
    '   "fontSize": 20,'+
    '   "text": "Filters",'+
    '   "textAlignment": "center",'+
    '   "textColor": "#FFFFFF"'+
    '   },'+
    '   "type": "text"'+
    '   },'+
    '   "container_9": {'+
    '   "parameters": {'+
    '   "alignmentX": "left",'+
    '   "alignmentY": "top",'+
    '   "fit": "original"'+
    '   },'+
    '   "type": "container"'+
    '   },'+
    '   "chart_2": {'+
    '   "parameters": {'+
    '   "autoFitMode": "keepLabels",'+
    '   "showValues": true,'+
    '   "showPoints": true,'+
    '   "legend": {'+
    '   "showHeader": false,'+
    '   "show": true,'+
    '   "customSize": "auto",'+
    '   "position": "bottom-center",'+
    '   "inside": false'+
    '   },'+
    '   "axisMode": "sync",'+
    '   "tooltip": {'+
    '   "showBinLabel": true,'+
    '   "measures": "",'+
    '   "showPercentage": true,'+
    '   "showDimensions": true,'+
    '   "showMeasures": true,'+
    '   "customizeTooltip": false,'+
    '   "dimensions": ""'+
    '   },'+
    '   "visualizationType": "combo",'+
    '   "missingValue": "connect",'+
    '   "exploreLink": false,'+
    '   "title": {'+
    '   "fontSize": 14,'+
    '   "subtitleFontSize": 11,'+
    '   "label": "",'+
    '   "align": "center",'+
    '   "subtitleLabel": ""'+
    '   },'+
    '   "trellis": {'+
    '   "flipLabels": false,'+
    '   "showGridLines": true,'+
    '   "size": [100, 100],'+
    '   "enable": false,'+
    '   "type": "x",'+
    '   "chartsPerLine": 4'+
    '   },'+
    '   "measureAxis2": {'+
    '   "sqrtScale": false,'+
    '   "showTitle": true,'+
    '   "showAxis": true,'+
    '   "title": "",'+
    '   "customDomain": {'+
    '   "showDomain": false'+
    '   }'+
    '   },'+
    '   "measureAxis1": {'+
    '   "sqrtScale": false,'+
    '   "showTitle": false,'+
    '   "showAxis": true,'+
    '   "title": "",'+
    '   "customDomain": {'+
    '   "showDomain": false'+
    '   }'+
    '   },'+
    '   "theme": "wave",'+
    '   "dimensionAxis": {'+
    '   "showTitle": false,'+
    '   "customSize": "auto",'+
    '   "showAxis": true,'+
    '   "title": "",'+
    '   "icons": {'+
    '   "useIcons": false,'+
    '   "iconProps": {'+
    '   "fit": "cover",'+
    '   "column": "",'+
    '   "type": "round"'+
    '   }'+
    '   }'+
    '   }'+
    '   },'+
    '   "type": "chart"'+
    '   },'+
    '   "chart_1": {'+
    '   "parameters": {'+
    '   "showValues": true,'+
    '   "bins": {'+
    '   "breakpoints": {'+
    '   "high": 100,'+
    '   "low": 0'+
    '   },'+
    '   "bands": {'+
    '   "high": {'+
    '   "color": "#008000",'+
    '   "label": ""'+
    '   },'+
    '   "low": {'+
    '   "color": "#B22222",'+
    '   "label": ""'+
    '   },'+
    '   "medium": {'+
    '   "color": "#ffa500",'+
    '   "label": ""'+
    '   }'+
    '   }'+
    '   },'+
    '   "showPoints": true,'+
    '   "legend": {'+
    '   "showHeader": true,'+
    '   "show": true,'+
    '   "customSize": "auto",'+
    '   "position": "bottom-center",'+
    '   "inside": false'+
    '   },'+
    '   "axisMode": "sync",'+
    '   "tooltip": {'+
    '   "showBinLabel": true,'+
    '   "measures": "",'+
    '   "showPercentage": true,'+
    '   "showDimensions": true,'+
    '   "showMeasures": true,'+
    '   "customizeTooltip": false,'+
    '   "dimensions": ""'+
    '   },'+
    '   "visualizationType": "time",'+
    '   "missingValue": "connect",'+
    '   "dashLine": {'+
    '   "measures": "",'+
    '   "showDashLine": false'+
    '   },'+
    '   "exploreLink": false,'+
    '   "timeAxis": {'+
    '   "showTitle": false,'+
    '   "showAxis": true,'+
    '   "title": ""'+
    '   },'+
    '   "title": {'+
    '   "fontSize": 14,'+
    '   "subtitleFontSize": 11,'+
    '   "label": "",'+
    '   "align": "center",'+
    '   "subtitleLabel": ""'+
    '   },'+
    '   "binValues": false,'+
    '   "trellis": {'+
    '   "flipLabels": false,'+
    '   "showGridLines": true,'+
    '   "size": [100, 100],'+
    '   "enable": false,'+
    '   "type": "x",'+
    '   "chartsPerLine": 4'+
    '   },'+
    '   "fillArea": true,'+
    '   "showZero": false,'+
    '   "measureAxis2": {'+
    '   "sqrtScale": false,'+
    '   "showTitle": true,'+
    '   "showAxis": true,'+
    '   "title": "",'+
    '   "customDomain": {'+
    '   "showDomain": false'+
    '   }'+
    '   },'+
    '   "measureAxis1": {'+
    '   "sqrtScale": false,'+
    '   "showTitle": false,'+
    '   "showAxis": true,'+
    '   "title": "",'+
    '   "customDomain": {'+
    '   "showDomain": false'+
    '   }'+
    '   },'+
    '   "theme": "wave",'+
    '   "drawArea": {'+
    '   "measure": "",'+
    '   "showDrawArea": false,'+
    '   "bounding1": "",'+
    '   "bounding2": ""'+
    '   }'+
    '   },'+
    '   "type": "chart"'+
    '   },'+
    '   "chart_4": {'+
    '   "parameters": {'+
    '   "autoFitMode": "keepLabels",'+
    '   "showValues": true,'+
    '   "showPoints": true,'+
    '   "legend": {'+
    '   "showHeader": false,'+
    '   "show": true,'+
    '   "customSize": "auto",'+
    '   "position": "bottom-center",'+
    '   "inside": false'+
    '   },'+
    '   "axisMode": "sync",'+
    '   "tooltip": {'+
    '   "showBinLabel": true,'+
    '   "measures": "",'+
    '   "showPercentage": true,'+
    '   "showDimensions": true,'+
    '   "showMeasures": true,'+
    '   "customizeTooltip": false,'+
    '   "dimensions": ""'+
    '   },'+
    '   "visualizationType": "combo",'+
    '   "missingValue": "connect",'+
    '   "exploreLink": false,'+
    '   "title": {'+
    '   "fontSize": 14,'+
    '   "subtitleFontSize": 11,'+
    '   "label": "",'+
    '   "align": "center",'+
    '   "subtitleLabel": ""'+
    '   },'+
    '   "trellis": {'+
    '   "flipLabels": false,'+
    '   "showGridLines": true,'+
    '   "size": [100, 100],'+
    '   "enable": false,'+
    '   "type": "x",'+
    '   "chartsPerLine": 4'+
    '   },'+
    '   "measureAxis2": {'+
    '   "sqrtScale": false,'+
    '   "showTitle": true,'+
    '   "showAxis": true,'+
    '   "title": "",'+
    '   "customDomain": {'+
    '   "showDomain": false'+
    '   }'+
    '   },'+
    '   "measureAxis1": {'+
    '   "sqrtScale": false,'+
    '   "showTitle": false,'+
    '   "showAxis": true,'+
    '   "title": "",'+
    '   "customDomain": {'+
    '   "showDomain": false'+
    '   }'+
    '   },';
    String json2 = '"theme": "wave",'+
    '   "dimensionAxis": {'+
    '   "showTitle": false,'+
    '   "customSize": "auto",'+
    '   "showAxis": true,'+
    '   "title": "",'+
    '   "icons": {'+
    '   "useIcons": false,'+
    '   "iconProps": {'+
    '   "fit": "cover",'+
    '   "column": "",'+
    '   "type": "round"'+
    '   }'+
    '   }'+
    '   }'+
    '   },'+
    '   "type": "chart"'+
    '   },'+
    '   "chart_3": {'+
    '   "parameters": {'+
    '   "autoFitMode": "keepLabels",'+
    '   "showValues": true,'+
    '   "showPoints": true,'+
    '   "legend": {'+
    '   "showHeader": false,'+
    '   "show": true,'+
    '   "customSize": "auto",'+
    '   "position": "bottom-center",'+
    '   "inside": false'+
    '   },'+
    '   "axisMode": "sync",'+
    '   "tooltip": {'+
    '   "showBinLabel": true,'+
    '   "measures": "",'+
    '   "showPercentage": true,'+
    '   "showDimensions": true,'+
    '   "showMeasures": true,'+
    '   "customizeTooltip": false,'+
    '   "dimensions": ""'+
    '   },'+
    '   "visualizationType": "combo",'+
    '   "missingValue": "connect",'+
    '   "exploreLink": false,'+
    '   "title": {'+
    '   "fontSize": 14,'+
    '   "subtitleFontSize": 11,'+
    '   "label": "",'+
    '   "align": "center",'+
    '   "subtitleLabel": ""'+
    '   },'+
    '   "trellis": {'+
    '   "flipLabels": false,'+
    '   "showGridLines": true,'+
    '   "size": [100, 100],'+
    '   "enable": false,'+
    '   "type": "x",'+
    '   "chartsPerLine": 4'+
    '   },'+
    '   "measureAxis2": {'+
    '   "sqrtScale": false,'+
    '   "showTitle": true,'+
    '   "showAxis": true,'+
    '   "title": "",'+
    '   "customDomain": {'+
    '   "showDomain": false'+
    '   }'+
    '   },'+
    '   "measureAxis1": {'+
    '   "sqrtScale": false,'+
    '   "showTitle": false,'+
    '   "showAxis": true,'+
    '   "title": "",'+
    '   "customDomain": {'+
    '   "showDomain": false'+
    '   }'+
    '   },'+
    '   "theme": "wave",'+
    '   "dimensionAxis": {'+
    '   "showTitle": false,'+
    '   "customSize": "auto",'+
    '   "showAxis": true,'+
    '   "title": "",'+
    '   "icons": {'+
    '   "useIcons": false,'+
    '   "iconProps": {'+
    '   "fit": "cover",'+
    '   "column": "",'+
    '   "type": "round"'+
    '   }'+
    '   }'+
    '   }'+
    '   },'+
    '   "type": "chart"'+
    '   },'+
    '   "listselector_7": {'+
    '   "parameters": {'+
    '   "compact": false,'+
    '   "exploreLink": false,'+
    '   "instant": true,'+
    '   "title": ""'+
    '   },'+
    '   "type": "listselector"'+
    '   },'+
    '   "listselector_9": {'+
    '   "parameters": {'+
    '   "compact": false,'+
    '   "exploreLink": false,'+
    '   "instant": true,'+
    '   "measureField": "count",'+
    '   "title": "StartDate"'+
    '   },'+
    '   "type": "listselector"'+
    '   },'+
    '   "listselector_8": {'+
    '   "parameters": {'+
    '   "compact": false,'+
    '   "exploreLink": false,'+
    '   "instant": true,'+
    '   "title": "Date Filter"'+
    '   },'+
    '   "type": "listselector"'+
    '   },'+
    '   "listselector_3": {'+
    '   "parameters": {'+
    '   "compact": false,'+
    '   "exploreLink": false,'+
    '   "instant": true,'+
    '   "measureField": "count",'+
    '   "title": "OwnerName"'+
    '   },'+
    '   "type": "listselector"'+
    '   },'+
    '   "listselector_2": {'+
    '   "parameters": {'+
    '   "compact": false,'+
    '   "exploreLink": false,'+
    '   "instant": true,'+
    '   "measureField": "count",'+
    '   "title": "Manager"'+
    '   },'+
    '   "type": "listselector"'+
    '   },'+
    '   "dateselector_1": {'+
    '   "parameters": {'+
    '   "calendarTypeSwitchingAllowed": false,'+
    '   "defaultAbsoluteMode": true,'+
    '   "defaultFiscalMode": false,'+
    '   "instant": false,'+
    '   "modeSwitchingAllowed": true,'+
    '   "title": "StartDate"'+
    '   },'+
    '   "type": "dateselector"'+
    '   },'+
    '   "text_1": {'+
    '   "parameters": {'+
    '   "fontSize": 24,'+
    '   "text": "Target vs Actual",'+
    '   "textAlignment": "center",'+
    '   "textColor": "#FFFFFF"'+
    '   },'+
    '   "type": "text"'+
    '   },'+
    '   "listselector_5": {'+
    '   "parameters": {'+
    '   "compact": false,'+
    '   "exploreLink": false,'+
    '   "instant": true,'+
    '   "title": ""'+
    '   },'+
    '   "type": "listselector"'+
    '   },'+
    '   "listselector_4": {'+
    '   "parameters": {'+
    '   "compact": false,'+
    '   "exploreLink": false,'+
    '   "instant": true,'+
    '   "title": ""'+
    '   },'+
    '   "type": "listselector"'+
    '   },'+
    '   "table_1": {'+
    '   "parameters": {'+
    '   "borderColor": "#e1e5ee",'+
    '   "borderWidth": 1,'+
    '   "cell": {'+
    '   "backgroundColor": "#f2f6fa",'+
    '   "fontColor": "#16325c",'+
    '   "fontSize": 12'+
    '   },'+
    '   "columns": [],'+
    '   "customBulkActions": [],'+
    '   "evenRowColor": "#f2f6fa",'+
    '   "exploreLink": true,'+
    '   "header": {'+
    '   "backgroundColor": "#e4ecf2",'+
    '   "fontColor": "#5c7a99",'+
    '   "fontSize": 12'+
    '   },'+
    '   "innerMajorBorderColor": "#7D98B3",'+
    '   "innerMinorBorderColor": "#e1e5ee",'+
    '   "mode": "fittocontainer",'+
    '   "numberOfLines": 1,'+
    '   "oddRowColor": "#ffffff",'+
    '   "totals": true,'+
    '   "verticalPadding": 8'+
    '   },'+
    '   "type": "table"'+
    '   },'+
    '   "listselector_11": {'+
    '   "parameters": {'+
    '   "compact": false,'+
    '   "exploreLink": false,'+
    '   "instant": false,'+
    '   "measureField": "count",'+
    '   "title": "QuotaOwnerId"'+
    '   },'+
    '   "type": "listselector"'+
    '   },'+
    '   "listselector_1": {'+
    '   "parameters": {'+
    '   "compact": false,'+
    '   "exploreLink": false,'+
    '   "instant": false,'+
    '   "measureField": "count",'+
    '   "title": "Geo"'+
    '   },'+
    '   "type": "listselector"'+
    '   },'+
    '   "listselector_10": {'+
    '   "parameters": {'+
    '   "compact": false,'+
    '   "exploreLink": false,'+
    '   "instant": true,'+
    '   "measureField": "count",'+
    '   "title": "Region"'+
    '   },'+
    '   "type": "listselector"'+
    '   }'+
    '   }'+
    '   }'+
    '}';
    
        String jsonss = json+json1+json2;
        return jsonss;
    }
    
    public string NewStringval3(){
        String json=        '{'+
        '   "folder": {'+
        '       "id": "00l28000001VoU1AAK"'+
        '   },'+
        '   "label": "Copy of Single DB Template",'+
        '   "state": {'+
        '       "dataSourceLinks": [],'+
        '       "filters": [],'+
        '       "gridLayouts": [{'+
        '           "name": "Default",'+
        '           "numColumns": 24,'+
        '           "pages": [{'+
        '               "label": "Untitled",'+
        '               "name": "83a16e97-9cd6-448d-b057-7ec6ba78f6a0",'+
        '               "widgets": [{'+
        '                   "colspan": 9,'+
        '                   "column": 0,'+
        '                   "name": "text_4",'+
        '                   "row": 0,'+
        '                   "rowspan": 2,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "#091A3E",'+
        '                       "borderColor": "#E6ECF2",'+
        '                       "borderEdges": [],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 1'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 11,'+
        '                   "column": 13,'+
        '                   "name": "text_1",'+
        '                   "row": 0,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "#091A3E",'+
        '                       "borderColor": "#E6ECF2",'+
        '                       "borderEdges": [],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 1'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 10,'+
        '                   "column": 13,'+
        '                   "name": "text_2",'+
        '                   "row": 1,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "#091A3E",'+
        '                       "borderColor": "#E6ECF2",'+
        '                       "borderEdges": [],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 1'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 11,'+
        '                   "column": 13,'+
        '                   "name": "text_3",'+
        '                   "row": 2,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "#091A3E",'+
        '                       "borderColor": "#E6ECF2",'+
        '                       "borderEdges": [],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 1'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 24,'+
        '                   "column": 0,'+
        '                   "name": "container_1",'+
        '                   "row": 0,'+
        '                   "rowspan": 3,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "#091A3E",'+
        '                       "borderColor": "#E6ECF2",'+
        '                       "borderEdges": [],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 1'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 3,'+
        '                   "column": 3,'+
        '                   "name": "dateselector_1",'+
        '                   "row": 2,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)",'+
        '                       "borderEdges": []'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 6,'+
        '                   "column": 0,'+
        '                   "name": "link_1",'+
        '                   "row": 3,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "#FFFFFF",'+
        '                       "borderColor": "rgb(250, 91, 11)",'+
        '                       "borderEdges": ["top"],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 4'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 6,'+
        '                   "column": 6,'+
        '                   "name": "link_2",'+
        '                   "row": 3,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "#F2F6FA",'+
        '                       "borderColor": "#7EC2BA",'+
        '                       "borderEdges": ["top"],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 4'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 6,'+
        '                   "column": 12,'+
        '                   "name": "link_3",'+
        '                   "row": 3,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "#F2F6FA",'+
        '                       "borderColor": "#9271E8",'+
        '                       "borderEdges": ["top"],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 4'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 6,'+
        '                   "column": 18,'+
        '                   "name": "link_4",'+
        '                   "row": 3,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "#F2F6FA",'+
        '                       "borderColor": "#44A2F5",'+
        '                       "borderEdges": ["top"],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 4'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 8,'+
        '                   "column": 8,'+
        '                   "name": "text_7",'+
        '                   "row": 4,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)",'+
        '                       "borderColor": "#E6ECF2",'+
        '                       "borderEdges": [],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 1'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 13,'+
        '                   "column": 11,'+
        '                   "name": "chart_1",'+
        '                   "row": 5,'+
        '                   "rowspan": 5,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": []'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 6,'+
        '                   "name": "number_2",'+
        '                   "row": 6,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 6,'+
        '                   "name": "number_3",'+
        '                   "row": 7,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 6,'+
        '                   "name": "number_4",'+
        '                   "row": 8,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 6,'+
        '                   "name": "number_6",'+
        '                   "row": 9,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 8,'+
        '                   "column": 8,'+
        '                   "name": "text_16",'+
        '                   "row": 11,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "rgba(146, 113, 232, 0)",'+
        '                       "borderColor": "#E6ECF2",'+
        '                       "borderEdges": [],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 1'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 13,'+
        '                   "column": 11,'+
        '                   "name": "chart_3",'+
        '                   "row": 12,'+
        '                   "rowspan": 5,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": []'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 8,'+
        '                   "column": 8,'+
        '                   "name": "text_21",'+
        '                   "row": 18,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "rgba(68, 162, 245, 0)",'+
        '                       "borderColor": "#E6ECF2",'+
        '                       "borderEdges": [],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 1'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 6,'+
        '                   "name": "number_11",'+
        '                   "row": 19,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 6,'+
        '                   "name": "number_12",'+
        '                   "row": 20,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 6,'+
        '                   "name": "number_13",'+
        '                   "row": 21,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 6,'+
        '                   "name": "number_14",'+
        '                   "row": 22,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 6,'+
        '                   "name": "number_15",'+
        '                   "row": 23,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 13,'+
        '                   "column": 11,'+
        '                   "name": "chart_4",'+
        '                   "row": 19,'+
        '                   "rowspan": 5,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": []'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 0,'+
        '                   "name": "listselector_10",'+
        '                   "row": 5,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 0,'+
        '                   "name": "listselector_11",'+
        '                   "row": 6,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 0,'+
        '                   "name": "listselector_12",'+
        '                   "row": 7,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 0,'+
        '                   "name": "listselector_14",'+
        '                   "row": 8,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 0,'+
        '                   "name": "listselector_15",'+
        '                   "row": 9,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 0,'+
        '                   "name": "listselector_16",'+
        '                   "row": 12,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 0,'+
        '                   "name": "listselector_17",'+
        '                   "row": 13,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 0,'+
        '                   "name": "listselector_18",'+
        '                   "row": 14,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 0,'+
        '                   "name": "listselector_19",'+
        '                   "row": 15,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 0,'+
        '                   "name": "listselector_20",'+
        '                   "row": 16,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 0,'+
        '                   "name": "listselector_21",'+
        '                   "row": 19,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 0,'+
        '                   "name": "listselector_22",'+
        '                   "row": 20,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 0,'+
        '                   "name": "listselector_23",'+
        '                   "row": 21,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 0,'+
        '                   "name": "listselector_24",'+
        '                   "row": 22,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 0,'+
        '                   "name": "listselector_25",'+
        '                   "row": 23,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 6,'+
        '                   "name": "number_1",'+
        '                   "row": 5,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 17,'+
        '                   "name": "listselector_27",'+
        '                   "row": 4,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)",'+
        '                       "borderColor": "#E6ECF2",'+
        '                       "borderEdges": [],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 1'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 24,'+
        '                   "column": 0,'+
        '                   "name": "container_5",'+
        '                   "row": 4,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "#7EC2BA",'+
        '                       "borderColor": "#E6ECF2",'+
        '                       "borderEdges": [],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 1'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 24,'+
        '                   "column": 0,'+
        '                   "name": "container_4",'+
        '                   "row": 18,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "#44A2F5",'+
        '                       "borderColor": "#E6ECF2",'+
        '                       "borderEdges": [],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 1'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 17,'+
        '                   "name": "listselector_26",'+
        '                   "row": 18,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)",'+
        '                       "borderColor": "#E6ECF2",'+
        '                       "borderEdges": [],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 1'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 24,'+
        '                   "column": 0,'+
        '                   "name": "container_6",'+
        '                   "row": 11,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "#9271E8",'+
        '                       "borderColor": "#E6ECF2",'+
        '                       "borderEdges": [],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 1'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 17,'+
        '                   "name": "listselector_28",'+
        '                   "row": 11,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)",'+
        '                       "borderColor": "#E6ECF2",'+
        '                       "borderEdges": [],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 1'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 3,'+
        '                   "column": 8,'+
        '                   "name": "pillbox_1",'+
        '                   "row": 5,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 3,'+
        '                   "column": 8,'+
        '                   "name": "pillbox_2",'+
        '                   "row": 6,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 3,'+
        '                   "column": 8,'+
        '                   "name": "pillbox_3",'+
        '                   "row": 7,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 3,'+
        '                   "column": 8,'+
        '                   "name": "pillbox_4",'+
        '                   "row": 8,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 3,'+
        '                   "column": 8,'+
        '                   "name": "pillbox_5",'+
        '                   "row": 9,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               },';
        String json1 = '{'+
        '                   "colspan": 3,'+
        '                   "column": 8,'+
        '                   "name": "pillbox_7",'+
        '                   "row": 12,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 3,'+
        '                   "column": 8,'+
        '                   "name": "pillbox_8",'+
        '                   "row": 13,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 3,'+
        '                   "column": 8,'+
        '                   "name": "pillbox_9",'+
        '                   "row": 14,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 3,'+
        '                   "column": 8,'+
        '                   "name": "pillbox_11",'+
        '                   "row": 15,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 3,'+
        '                   "column": 8,'+
        '                   "name": "pillbox_12",'+
        '                   "row": 16,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 3,'+
        '                   "column": 8,'+
        '                   "name": "pillbox_13",'+
        '                   "row": 19,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 3,'+
        '                   "column": 8,'+
        '                   "name": "pillbox_14",'+
        '                   "row": 20,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 3,'+
        '                   "column": 8,'+
        '                   "name": "pillbox_15",'+
        '                   "row": 21,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 3,'+
        '                   "column": 8,'+
        '                   "name": "pillbox_16",'+
        '                   "row": 22,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 3,'+
        '                   "column": 8,'+
        '                   "name": "pillbox_17",'+
        '                   "row": 23,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 4,'+
        '                   "name": "listselector_29",'+
        '                   "row": 5,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 4,'+
        '                   "name": "listselector_30",'+
        '                   "row": 6,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 4,'+
        '                   "name": "listselector_31",'+
        '                   "row": 7,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 4,'+
        '                   "name": "listselector_32",'+
        '                   "row": 8,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 4,'+
        '                   "name": "listselector_33",'+
        '                   "row": 9,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 4,'+
        '                   "name": "listselector_34",'+
        '                   "row": 12,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 4,'+
        '                   "name": "listselector_35",'+
        '                   "row": 13,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 4,'+
        '                   "name": "listselector_36",'+
        '                   "row": 14,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 4,'+
        '                   "name": "listselector_37",'+
        '                   "row": 15,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 4,'+
        '                   "name": "listselector_38",'+
        '                   "row": 16,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 4,'+
        '                   "name": "listselector_39",'+
        '                   "row": 19,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 4,'+
        '                   "name": "listselector_40",'+
        '                   "row": 20,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 4,'+
        '                   "name": "listselector_41",'+
        '                   "row": 21,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 4,'+
        '                   "name": "listselector_43",'+
        '                   "row": 22,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 4,'+
        '                   "name": "listselector_44",'+
        '                   "row": 23,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 6,'+
        '                   "name": "number_5",'+
        '                   "row": 12,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 6,'+
        '                   "name": "number_7",'+
        '                   "row": 13,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 6,'+
        '                   "name": "number_8",'+
        '                   "row": 14,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 6,'+
        '                   "name": "number_9",'+
        '                   "row": 15,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 6,'+
        '                   "name": "number_10",'+
        '                   "row": 16,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 2,'+
        '                   "name": "listselector_50",'+
        '                   "row": 5,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 0,'+
        '                   "name": "text_6",'+
        '                   "row": 4,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)",'+
        '                       "borderColor": "#E6ECF2",'+
        '                       "borderEdges": [],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 1'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 2,'+
        '                   "name": "text_8",'+
        '                   "row": 4,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)",'+
        '                       "borderColor": "#E6ECF2",'+
        '                       "borderEdges": [],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 1'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 4,'+
        '                   "name": "text_9",'+
        '                   "row": 4,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)",'+
        '                       "borderColor": "#E6ECF2",'+
        '                       "borderEdges": [],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 1'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 2,'+
        '                   "name": "listselector_49",'+
        '                   "row": 6,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 2,'+
        '                   "name": "listselector_51",'+
        '                   "row": 7,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 2,'+
        '                   "name": "listselector_52",'+
        '                   "row": 8,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 2,'+
        '                   "name": "listselector_53",'+
        '                   "row": 9,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 2,'+
        '                   "name": "listselector_54",'+
        '                   "row": 12,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 2,'+
        '                   "name": "listselector_55",'+
        '                   "row": 13,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 2,'+
        '                   "name": "listselector_56",'+
        '                   "row": 14,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 2,'+
        '                   "name": "listselector_57",'+
        '                   "row": 15,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 2,'+
        '                   "name": "listselector_58",'+
        '                   "row": 16,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 2,'+
        '                   "name": "listselector_59",'+
        '                   "row": 19,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 2,'+
        '                   "name": "listselector_60",'+
        '                   "row": 20,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 2,'+
        '                   "name": "listselector_61",'+
        '                   "row": 21,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 2,'+
        '                   "name": "listselector_62",'+
        '                   "row": 22,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 2,'+
        '                   "name": "listselector_63",'+
        '                   "row": 23,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "borderEdges": [],'+
        '                       "backgroundColor": "rgba(255, 255, 255,0)"'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 0,'+
        '                   "name": "text_10",'+
        '                   "row": 11,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)",'+
        '                       "borderColor": "#E6ECF2",'+
        '                       "borderEdges": [],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 1'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 2,'+
        '                   "name": "text_11",'+
        '                   "row": 11,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)",'+
        '                       "borderColor": "#E6ECF2",'+
        '                       "borderEdges": [],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 1'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 4,'+
        '                   "name": "text_12",'+
        '                   "row": 11,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)",'+
        '                       "borderColor": "#E6ECF2",'+
        '                       "borderEdges": [],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 1'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 0,'+
        '                   "name": "text_13",'+
        '                   "row": 18,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)",'+
        '                       "borderColor": "#E6ECF2",'+
        '                       "borderEdges": [],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 1'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 2,'+
        '                   "name": "text_14",'+
        '                   "row": 18,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)",'+
        '                       "borderColor": "#E6ECF2",'+
        '                       "borderEdges": [],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 1'+
        '                   }'+
        '               }, {'+
        '                   "colspan": 2,'+
        '                   "column": 4,'+
        '                   "name": "text_15",'+
        '                   "row": 18,'+
        '                   "rowspan": 1,'+
        '                   "widgetStyle": {'+
        '                       "backgroundColor": "rgba(255, 255, 255, 0)",'+
        '                       "borderColor": "#E6ECF2",'+
        '                       "borderEdges": [],'+
        '                       "borderRadius": 0,'+
        '                       "borderWidth": 1'+
        '                   }'+
        '               }]'+
        '           }],';
        String json2 = '"rowHeight": "normal",'+
        '           "selectors": [],'+
        '           "style": {'+
        '               "alignmentX": "left",'+
        '               "alignmentY": "top",'+
        '               "backgroundColor": "#FFFFFF",'+
        '               "cellSpacingX": 8,'+
        '               "cellSpacingY": 8,'+
        '               "documentId": "",'+
        '               "fit": "original"'+
        '           },'+
        '           "version": 1.0'+
        '       }],'+
        '       "layouts": [],'+
        '       "steps": {'+
        '           "Static_Marketing__KPI_4_Filter": {'+
        '               "broadcastFacet": false,'+
        '               "datasets": [],'+
        '               "dimensions": [],'+
        '               "groups": [],'+
        '               "isGlobal": false,'+
        '               "numbers": [],'+
        '               "selectMode": "singlerequired",'+
        '               "strings": [],'+
        '               "type": "staticflex",'+
        '               "useGlobal": false,'+
        '               "values": ["{\\"display\\":\\"All\\",\\"value\\":\\"\'OWNERID\' in all\\"}", "{\\"display\\":\\"Section3 Filter4\\",\\"value\\":\\" \'AMOUNT\' >= 680 && \'AMOUNT\' <= 8577295\\"}"],'+
        '               "visualizationParameters": {}'+
        '           },'+
        '           "Static_Marketing__KPI_5_Filter": {'+
        '               "broadcastFacet": false,'+
        '               "datasets": [],'+
        '               "dimensions": [],'+
        '               "groups": [],'+
        '               "isGlobal": false,'+
        '               "numbers": [],'+
        '               "selectMode": "singlerequired",'+
        '               "strings": [],'+
        '               "type": "staticflex",'+
        '               "useGlobal": false,'+
        '               "values": ["{\\"display\\":\\"All\\",\\"value\\":\\"\'OWNERID\' in all\\"}", "{\\"display\\":\\"Section3 Filter5\\",\\"value\\":\\" \'AMOUNT\' >= 680 && \'AMOUNT\' <= 8577295\\"}"],'+
        '               "visualizationParameters": {}'+
        '           },'+
        '           "Static_Marketing__KPI_3_Filter": {'+
        '               "broadcastFacet": false,'+
        '               "datasets": [],'+
        '               "dimensions": [],'+
        '               "groups": [],'+
        '               "isGlobal": false,'+
        '               "numbers": [],'+
        '               "selectMode": "singlerequired",'+
        '               "strings": [],'+
        '               "type": "staticflex",'+
        '               "useGlobal": false,'+
        '               "values": ["{\\"display\\":\\"All\\",\\"value\\":\\"\'OWNERID\' in all\\"}", "{\\"display\\":\\"Section3 Filter3\\",\\"value\\":\\" \'PROBABILITY\' > 0\\"}"],'+
        '               "visualizationParameters": {}'+
        '           },'+
        '           "Static_Marketing__KPI_1_Filter": {'+
        '               "broadcastFacet": false,'+
        '               "datasets": [],'+
        '               "dimensions": [],'+
        '               "groups": [],'+
        '               "isGlobal": false,'+
        '               "numbers": [],'+
        '               "selectMode": "singlerequired",'+
        '               "strings": [],'+
        '               "type": "staticflex",'+
        '               "useGlobal": false,'+
        '               "values": ["{\\"display\\":\\"All\\",\\"value\\":\\"\'OWNERID\' in all\\"}", "{\\"display\\":\\"Section3 Filter1\\",\\"value\\":\\" \'AMOUNT\' >= 680 && \'AMOUNT\' <= 8577295\\"}"],'+
        '               "visualizationParameters": {}'+
        '           },'+
        '           "Static_Marketing__KPI_2_Filter": {'+
        '               "broadcastFacet": false,'+
        '               "datasets": [],'+
        '               "dimensions": [],'+
        '               "groups": [],'+
        '               "isGlobal": false,'+
        '               "numbers": [],'+
        '               "selectMode": "singlerequired",'+
        '               "strings": [],'+
        '               "type": "staticflex",'+
        '               "useGlobal": false,'+
        '               "values": ["{\\"display\\":\\"All\\",\\"value\\":\\"\'OWNERID\' in all\\"}", "{\\"display\\":\\"Section3 Filter2\\",\\"value\\":\\" \'AMOUNT\' >= 680 && \'AMOUNT\' <= 8577295\\"}"],'+
        '               "visualizationParameters": {}'+
        '           }'+
        '       },'+
        '       "widgetStyle": {'+
        '           "backgroundColor": "#FFFFFF",'+
        '           "borderColor": "#E6ECF2",'+
        '           "borderEdges": [],'+
        '           "borderRadius": 0,'+
        '           "borderWidth": 1'+
        '       },'+
        '       "widgets": {'+
        '           "listselector_52": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_51": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_50": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "text_14": {'+
        '               "parameters": {'+
        '                   "fontSize": 14,'+
        '                   "text": "Choose a Date",'+
        '                   "textAlignment": "center",'+
        '                   "textColor": "#FFFFFF"'+
        '               },'+
        '               "type": "text"'+
        '           },'+
        '           "text_13": {'+
        '               "parameters": {'+
        '                   "fontSize": 14,'+
        '                   "text": "Choose a Measure",'+
        '                   "textAlignment": "center",'+
        '                   "textColor": "#FFFFFF"'+
        '               },'+
        '               "type": "text"'+
        '           },'+
        '           "text_16": {'+
        '               "parameters": {'+
        '                   "fontSize": 24,'+
        '                   "text": "Command Drill-in #2",'+
        '                   "textAlignment": "center",'+
        '                   "textColor": "#FFFFFF"'+
        '               },'+
        '               "type": "text"'+
        '           },'+
        '           "text_15": {'+
        '               "parameters": {'+
        '                   "fontSize": 14,'+
        '                   "text": "Choose a Filter",'+
        '                   "textAlignment": "center",'+
        '                   "textColor": "#FFFFFF"'+
        '               },'+
        '               "type": "text"'+
        '           },'+
        '           "text_10": {'+
        '               "parameters": {'+
        '                   "fontSize": 14,'+
        '                   "text": "Choose a Measure",'+
        '                   "textAlignment": "center",'+
        '                   "textColor": "#FFFFFF"'+
        '               },'+
        '               "type": "text"'+
        '           },'+
        '           "text_12": {'+
        '               "parameters": {'+
        '                   "fontSize": 14,'+
        '                   "text": "Choose a Filter",'+
        '                   "textAlignment": "center",'+
        '                   "textColor": "#FFFFFF"'+
        '               },'+
        '               "type": "text"'+
        '           },'+
        '           "text_11": {'+
        '               "parameters": {'+
        '                   "fontSize": 14,'+
        '                   "text": "Choose a Date",'+
        '                   "textAlignment": "center",'+
        '                   "textColor": "#FFFFFF"'+
        '               },'+
        '               "type": "text"'+
        '           },'+
        '           "text_3": {'+
        '               "parameters": {'+
        '                   "fontSize": 14,'+
        '                   "text": "",'+
        '                   "textAlignment": "left",'+
        '                   "textColor": "#FFFFFF"'+
        '               },'+
        '               "type": "text"'+
        '           },'+
        '           "listselector_45": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "step": "Static_Marketing__KPI_2_Filter",'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "text_2": {'+
        '               "parameters": {'+
        '                   "fontSize": 14,'+
        '                   "text": "Click on any one of the tabs to get further details.",'+
        '                   "textAlignment": "left",'+
        '                   "textColor": "#FFFFFF"'+
        '               },'+
        '               "type": "text"'+
        '           },'+
        '           "listselector_44": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "text_5": {'+
        '               "parameters": {'+
        '                   "fontSize": 16,'+
        '                   "text": "Top Hierarchy Level Filters",'+
        '                   "textAlignment": "left",'+
        '                   "textColor": "#091A3E"'+
        '               },'+
        '               "type": "text"'+
        '           },'+
        '           "listselector_43": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "text_4": {'+
        '               "parameters": {'+
        '                   "fontSize": 32,'+
        '                   "text": "How Are We Doing?",'+
        '                   "textAlignment": "center",'+
        '                   "textColor": "#FFFFFF"'+
        '               },'+
        '               "type": "text"'+
        '           },'+
        '           "listselector_42": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "step": "Static_Marketing__KPI_1_Filter",'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "text_7": {'+
        '               "parameters": {'+
        '                   "fontSize": 24,'+
        '                   "text": "Command Drill-in #1",'+
        '                   "textAlignment": "center",'+
        '                   "textColor": "#FFFFFF"'+
        '               },'+
        '               "type": "text"'+
        '           },'+
        '           "listselector_49": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "chart_1": {'+
        '               "parameters": {'+
        '                   "showPoints": true,'+
        '                   "legend": {'+
        '                       "showHeader": true,'+
        '                       "show": true,'+
        '                       "customSize": "auto",'+
        '                       "position": "top-center",'+
        '                       "inside": false'+
        '                   },'+
        '                   "axisMode": "multi",'+
        '                   "tooltip": {'+
        '                       "showBinLabel": true,'+
        '                       "measures": "",'+
        '                       "showPercentage": true,'+
        '                       "showDimensions": true,'+
        '                       "showMeasures": true,'+
        '                       "customizeTooltip": false,'+
        '                       "dimensions": ""'+
        '                   },'+
        '                   "visualizationType": "time",'+
        '                   "missingValue": "connect",'+
        '                   "dashLine": {'+
        '                       "measures": "",'+
        '                       "showDashLine": false'+
        '                   },'+
        '                   "exploreLink": false,'+
        '                   "timeAxis": {'+
        '                       "showTitle": false,'+
        '                       "showAxis": true,'+
        '                       "title": ""'+
        '                   },'+
        '                   "title": {'+
        '                       "fontSize": 14,'+
        '                       "subtitleFontSize": 11,'+
        '                       "label": "",'+
        '                       "align": "center",'+
        '                       "subtitleLabel": ""'+
        '                   },'+
        '                   "trellis": {'+
        '                       "flipLabels": false,'+
        '                       "showGridLines": true,'+
        '                       "size": [100, 100],'+
        '                       "enable": false,'+
        '                       "type": "x",'+
        '                       "chartsPerLine": 4'+
        '                   },'+
        '                   "fillArea": true,'+
        '                   "showZero": false,'+
        '                   "measureAxis2": {'+
        '                       "sqrtScale": false,'+
        '                       "showTitle": true,'+
        '                       "showAxis": true,'+
        '                       "title": "",'+
        '                       "customDomain": {'+
        '                           "showDomain": false'+
        '                       }'+
        '                   },'+
        '                   "measureAxis1": {'+
        '                       "sqrtScale": false,'+
        '                       "showTitle": false,'+
        '                       "showAxis": true,'+
        '                       "title": "",'+
        '                       "customDomain": {'+
        '                           "showDomain": false'+
        '                       }'+
        '                   },'+
        '                   "theme": "wave",'+
        '                   "drawArea": {'+
        '                       "measure": "",'+
        '                       "showDrawArea": false,'+
        '                       "bounding1": "",'+
        '                       "bounding2": ""'+
        '                   }'+
        '               },'+
        '               "type": "chart"'+
        '           },'+
        '           "listselector_48": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "step": "Static_Marketing__KPI_5_Filter",'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "text_6": {'+
        '               "parameters": {'+
        '                   "fontSize": 14,'+
        '                   "text": "Choose a Measure",'+
        '                   "textAlignment": "center",'+
        '                   "textColor": "#FFFFFF"'+
        '               },'+
        '               "type": "text"'+
        '           },'+
        '           "chart_4": {'+
        '               "parameters": {'+
        '                   "showPoints": true,'+
        '                   "legend": {'+
        '                       "showHeader": true,'+
        '                       "show": true,'+
        '                       "customSize": "auto",'+
        '                       "position": "top-center",'+
        '                       "inside": false'+
        '                   },'+
        '                   "axisMode": "multi",'+
        '                   "tooltip": {'+
        '                       "showBinLabel": true,'+
        '                       "measures": "",'+
        '                       "showPercentage": true,'+
        '                       "showDimensions": true,'+
        '                       "showMeasures": true,'+
        '                       "customizeTooltip": false,'+
        '                       "dimensions": ""'+
        '                   },'+
        '                   "visualizationType": "time",'+
        '                   "missingValue": "connect",'+
        '                   "dashLine": {'+
        '                       "measures": "",'+
        '                       "showDashLine": false'+
        '                   },'+
        '                   "exploreLink": false,'+
        '                   "timeAxis": {'+
        '                       "showTitle": true,'+
        '                       "showAxis": true,'+
        '                       "title": ""'+
        '                   },'+
        '                   "title": {'+
        '                       "fontSize": 14,'+
        '                       "subtitleFontSize": 11,'+
        '                       "label": "",'+
        '                       "align": "center",'+
        '                       "subtitleLabel": ""'+
        '                   },'+
        '                   "trellis": {'+
        '                       "flipLabels": false,'+
        '                       "showGridLines": true,'+
        '                       "size": [100, 100],'+
        '                       "enable": false,'+
        '                       "type": "x",'+
        '                       "chartsPerLine": 4'+
        '                   },'+
        '                   "fillArea": true,'+
        '                   "showZero": false,'+
        '                   "measureAxis2": {'+
        '                       "sqrtScale": false,'+
        '                       "showTitle": true,'+
        '                       "showAxis": true,'+
        '                       "title": "",'+
        '                       "customDomain": {'+
        '                           "showDomain": false'+
        '                       }'+
        '                   },'+
        '                   "measureAxis1": {'+
        '                       "sqrtScale": false,'+
        '                       "showTitle": false,'+
        '                       "showAxis": true,'+
        '                       "title": "",'+
        '                       "customDomain": {'+
        '                           "showDomain": false'+
        '                       }'+
        '                   },'+
        '                   "theme": "wave",'+
        '                   "drawArea": {'+
        '                       "measure": "",'+
        '                       "showDrawArea": false,'+
        '                       "bounding1": "",'+
        '                       "bounding2": ""'+
        '                   }'+
        '               },'+
        '               "type": "chart"'+
        '           },'+
        '           "listselector_47": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "step": "Static_Marketing__KPI_4_Filter",'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "text_9": {'+
        '               "parameters": {'+
        '                   "fontSize": 14,'+
        '                   "text": "Choose a Filter",'+
        '                   "textAlignment": "center",'+
        '                   "textColor": "#FFFFFF"'+
        '               },'+
        '               "type": "text"'+
        '           },'+
        '           "chart_3": {'+
        '               "parameters": {'+
        '                   "showPoints": true,'+
        '                   "legend": {'+
        '                       "showHeader": true,'+
        '                       "show": true,'+
        '                       "customSize": "auto",'+
        '                       "position": "top-center",'+
        '                       "inside": false'+
        '                   },'+
        '                   "axisMode": "multi",'+
        '                   "tooltip": {'+
        '                       "showBinLabel": true,'+
        '                       "measures": "",'+
        '                       "showPercentage": true,'+
        '                       "showDimensions": true,'+
        '                       "showMeasures": true,'+
        '                       "customizeTooltip": false,'+
        '                       "dimensions": ""'+
        '                   },'+
        '                   "visualizationType": "time",'+
        '                   "missingValue": "connect",'+
        '                   "dashLine": {'+
        '                       "measures": "",'+
        '                       "showDashLine": false'+
        '                   },'+
        '                   "exploreLink": false,'+
        '                   "timeAxis": {'+
        '                       "showTitle": true,'+
        '                       "showAxis": true,'+
        '                       "title": ""'+
        '                   },'+
        '                   "title": {'+
        '                       "fontSize": 14,'+
        '                       "subtitleFontSize": 11,'+
        '                       "label": "",'+
        '                       "align": "center",'+
        '                       "subtitleLabel": ""'+
        '                   },'+
        '                   "trellis": {'+
        '                       "flipLabels": false,'+
        '                       "showGridLines": true,'+
        '                       "size": [100, 100],'+
        '                       "enable": false,'+
        '                       "type": "x",'+
        '                       "chartsPerLine": 4'+
        '                   },'+
        '                   "fillArea": true,'+
        '                   "showZero": false,'+
        '                   "measureAxis2": {'+
        '                       "sqrtScale": false,'+
        '                       "showTitle": true,'+
        '                       "showAxis": true,'+
        '                       "title": "",'+
        '                       "customDomain": {'+
        '                           "showDomain": false'+
        '                       }'+
        '                   },'+
        '                   "measureAxis1": {'+
        '                       "sqrtScale": false,'+
        '                       "showTitle": false,'+
        '                       "showAxis": true,'+
        '                       "title": "",'+
        '                       "customDomain": {'+
        '                           "showDomain": false'+
        '                       }'+
        '                   },'+
        '                   "theme": "wave",'+
        '                   "drawArea": {'+
        '                       "measure": "",'+
        '                       "showDrawArea": false,'+
        '                       "bounding1": "",'+
        '                       "bounding2": ""'+
        '                   }'+
        '               },'+
        '               "type": "chart"'+
        '           },'+
        '           "listselector_46": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "step": "Static_Marketing__KPI_3_Filter",'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "text_8": {'+
        '               "parameters": {'+
        '                   "fontSize": 14,'+
        '                   "text": "Choose a Date",'+
        '                   "textAlignment": "center",'+
        '                   "textColor": "#FFFFFF"'+
        '               },'+
        '               "type": "text"'+
        '           },'+
        '           "listselector_63": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_62": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "text_1": {'+
        '               "parameters": {'+
        '                   "fontSize": 14,'+
        '                   "text": "View key performance indicators based on the selected filters below. You can also \\"show/hide\\" these KPIs, when viewing the timeline charts.",'+
        '                   "textAlignment": "left",'+
        '                   "textColor": "#FFFFFF"'+
        '               },'+
        '               "type": "text"'+
        '           },'+
        '           "listselector_61": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_60": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "number_5": {'+
        '               "parameters": {'+
        '                   "compact": true,'+
        '                   "exploreLink": true,'+
        '                   "measureField": "count",'+
        '                   "numberColor": "#335779",'+
        '                   "numberSize": 24,'+
        '                   "textAlignment": "right",'+
        '                   "title": "",'+
        '                   "titleColor": "#335779",'+
        '                   "titleSize": 16'+
        '               },'+
        '               "type": "number"'+
        '           },';
        String json3 = '"number_4": {'+
        '               "parameters": {'+
        '                   "compact": true,'+
        '                   "exploreLink": true,'+
        '                   "measureField": "count",'+
        '                   "numberColor": "#335779",'+
        '                   "numberSize": 24,'+
        '                   "textAlignment": "right",'+
        '                   "title": "",'+
        '                   "titleColor": "#335779",'+
        '                   "titleSize": 16'+
        '               },'+
        '               "type": "number"'+
        '           },'+
        '           "number_3": {'+
        '               "parameters": {'+
        '                   "compact": true,'+
        '                   "exploreLink": true,'+
        '                   "measureField": "count",'+
        '                   "numberColor": "#335779",'+
        '                   "numberSize": 24,'+
        '                   "textAlignment": "right",'+
        '                   "title": "",'+
        '                   "titleColor": "#335779",'+
        '                   "titleSize": 16'+
        '               },'+
        '               "type": "number"'+
        '           },'+
        '           "number_2": {'+
        '               "parameters": {'+
        '                   "compact": true,'+
        '                   "exploreLink": true,'+
        '                   "measureField": "count",'+
        '                   "numberColor": "#335779",'+
        '                   "numberSize": 24,'+
        '                   "textAlignment": "right",'+
        '                   "title": "",'+
        '                   "titleColor": "#335779",'+
        '                   "titleSize": 16'+
        '               },'+
        '               "type": "number"'+
        '           },'+
        '           "number_1": {'+
        '               "parameters": {'+
        '                   "compact": true,'+
        '                   "exploreLink": true,'+
        '                   "measureField": "count",'+
        '                   "numberColor": "#335779",'+
        '                   "numberSize": 24,'+
        '                   "textAlignment": "right",'+
        '                   "title": "",'+
        '                   "titleColor": "#335779",'+
        '                   "titleSize": 16'+
        '               },'+
        '               "type": "number"'+
        '           },'+
        '           "listselector_56": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_55": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_54": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_53": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_59": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_58": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_57": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "number_9": {'+
        '               "parameters": {'+
        '                   "compact": true,'+
        '                   "exploreLink": true,'+
        '                   "measureField": "count",'+
        '                   "numberColor": "#335779",'+
        '                   "numberSize": 24,'+
        '                   "textAlignment": "right",'+
        '                   "title": "",'+
        '                   "titleColor": "#335779",'+
        '                   "titleSize": 16'+
        '               },'+
        '               "type": "number"'+
        '           },'+
        '           "number_8": {'+
        '               "parameters": {'+
        '                   "compact": true,'+
        '                   "exploreLink": true,'+
        '                   "measureField": "count",'+
        '                   "numberColor": "#335779",'+
        '                   "numberSize": 24,'+
        '                   "textAlignment": "right",'+
        '                   "title": "",'+
        '                   "titleColor": "#335779",'+
        '                   "titleSize": 16'+
        '               },'+
        '               "type": "number"'+
        '           },'+
        '           "number_7": {'+
        '               "parameters": {'+
        '                   "compact": true,'+
        '                   "exploreLink": true,'+
        '                   "measureField": "count",'+
        '                   "numberColor": "#335779",'+
        '                   "numberSize": 24,'+
        '                   "textAlignment": "right",'+
        '                   "title": "",'+
        '                   "titleColor": "#335779",'+
        '                   "titleSize": 16'+
        '               },'+
        '               "type": "number"'+
        '           },'+
        '           "number_6": {'+
        '               "parameters": {'+
        '                   "compact": true,'+
        '                   "exploreLink": true,'+
        '                   "measureField": "count",'+
        '                   "numberColor": "#335779",'+
        '                   "numberSize": 24,'+
        '                   "textAlignment": "right",'+
        '                   "title": "",'+
        '                   "titleColor": "#335779",'+
        '                   "titleSize": 16'+
        '               },'+
        '               "type": "number"'+
        '           },'+
        '           "link_3": {'+
        '               "parameters": {'+
        '                   "destination": "0FK36000000UlJmGAK",'+
        '                   "destinationType": "dashboard",'+
        '                   "fontSize": 18,'+
        '                   "includeState": false,'+
        '                   "text": "Command Drill-in #2",'+
        '                   "textAlignment": "center",'+
        '                   "textColor": "#091A3E"'+
        '               },'+
        '               "type": "link"'+
        '           },'+
        '           "link_4": {'+
        '               "parameters": {'+
        '                   "destination": "0FK36000000UlJrGAK",'+
        '                   "destinationType": "dashboard",'+
        '                   "fontSize": 18,'+
        '                   "includeState": false,'+
        '                   "text": "Command Drill-in #3",'+
        '                   "textAlignment": "center",'+
        '                   "textColor": "#091A3E"'+
        '               },'+
        '               "type": "link"'+
        '           },'+
        '           "link_1": {'+
        '               "parameters": {'+
        '                   "destinationType": "lens",'+
        '                   "fontSize": 18,'+
        '                   "includeState": false,'+
        '                   "text": "Command Overview",'+
        '                   "textAlignment": "center",'+
        '                   "textColor": "#091A3E"'+
        '               },'+
        '               "type": "link"'+
        '           },'+
        '           "link_2": {'+
        '               "parameters": {'+
        '                   "destination": "0FK36000000UlKpGAK",'+
        '                   "destinationType": "dashboard",'+
        '                   "fontSize": 18,'+
        '                   "includeState": false,'+
        '                   "text": "Command Drill-in #1",'+
        '                   "textAlignment": "center",'+
        '                   "textColor": "#091A3E"'+
        '               },'+
        '               "type": "link"'+
        '           },'+
        '           "pillbox_12": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "exploreLink": false'+
        '               },'+
        '               "type": "pillbox"'+
        '           },'+
        '           "pillbox_13": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "exploreLink": false'+
        '               },'+
        '               "type": "pillbox"'+
        '           },'+
        '           "pillbox_11": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "exploreLink": false'+
        '               },'+
        '               "type": "pillbox"'+
        '           },'+
        '           "pillbox_16": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "exploreLink": false'+
        '               },'+
        '               "type": "pillbox"'+
        '           },'+
        '           "pillbox_17": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "exploreLink": false'+
        '               },'+
        '               "type": "pillbox"'+
        '           },'+
        '           "pillbox_14": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "exploreLink": false'+
        '               },'+
        '               "type": "pillbox"'+
        '           },'+
        '           "pillbox_15": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "exploreLink": false'+
        '               },'+
        '               "type": "pillbox"'+
        '           },'+
        '           "pillbox_2": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "exploreLink": false'+
        '               },'+
        '               "type": "pillbox"'+
        '           },'+
        '           "pillbox_1": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "exploreLink": false'+
        '               },'+
        '               "type": "pillbox"'+
        '           },'+
        '           "pillbox_4": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "exploreLink": false'+
        '               },'+
        '               "type": "pillbox"'+
        '           },'+
        '           "pillbox_3": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "exploreLink": false'+
        '               },'+
        '               "type": "pillbox"'+
        '           },'+
        '           "pillbox_5": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "exploreLink": false'+
        '               },'+
        '               "type": "pillbox"'+
        '           },'+
        '           "pillbox_8": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "exploreLink": false'+
        '               },'+
        '               "type": "pillbox"'+
        '           },'+
        '           "pillbox_7": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "exploreLink": false'+
        '               },'+
        '               "type": "pillbox"'+
        '           },'+
        '           "pillbox_9": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "exploreLink": false'+
        '               },'+
        '               "type": "pillbox"'+
        '           },'+
        '           "number_12": {'+
        '               "parameters": {'+
        '                   "compact": true,'+
        '                   "exploreLink": true,'+
        '                   "measureField": "count",'+
        '                   "numberColor": "#335779",'+
        '                   "numberSize": 24,'+
        '                   "textAlignment": "right",'+
        '                   "title": "",'+
        '                   "titleColor": "#335779",'+
        '                   "titleSize": 16'+
        '               },'+
        '               "type": "number"'+
        '           },'+
        '           "number_11": {'+
        '               "parameters": {'+
        '                   "compact": true,'+
        '                   "exploreLink": true,'+
        '                   "measureField": "count",'+
        '                   "numberColor": "#335779",'+
        '                   "numberSize": 24,'+
        '                   "textAlignment": "right",'+
        '                   "title": "",'+
        '                   "titleColor": "#335779",'+
        '                   "titleSize": 16'+
        '               },'+
        '               "type": "number"'+
        '           },'+
        '           "number_10": {'+
        '               "parameters": {'+
        '                   "compact": true,'+
        '                   "exploreLink": true,'+
        '                   "measureField": "count",'+
        '                   "numberColor": "#335779",'+
        '                   "numberSize": 24,'+
        '                   "textAlignment": "right",'+
        '                   "title": "",'+
        '                   "titleColor": "#335779",'+
        '                   "titleSize": 16'+
        '               },'+
        '               "type": "number"'+
        '           },'+
        '           "number_15": {'+
        '               "parameters": {'+
        '                   "compact": true,'+
        '                   "exploreLink": true,'+
        '                   "measureField": "count",'+
        '                   "numberColor": "#335779",'+
        '                   "numberSize": 24,'+
        '                   "textAlignment": "right",'+
        '                   "title": "",'+
        '                   "titleColor": "#335779",'+
        '                   "titleSize": 16'+
        '               },'+
        '               "type": "number"'+
        '           },'+
        '           "number_14": {'+
        '               "parameters": {'+
        '                   "compact": true,'+
        '                   "exploreLink": true,'+
        '                   "measureField": "count",'+
        '                   "numberColor": "#335779",'+
        '                   "numberSize": 24,'+
        '                   "textAlignment": "right",'+
        '                   "title": "",'+
        '                   "titleColor": "#335779",'+
        '                   "titleSize": 16'+
        '               },'+
        '               "type": "number"'+
        '           },'+
        '           "number_13": {'+
        '               "parameters": {'+
        '                   "compact": true,'+
        '                   "exploreLink": true,'+
        '                   "measureField": "count",'+
        '                   "numberColor": "#335779",'+
        '                   "numberSize": 24,'+
        '                   "textAlignment": "right",'+
        '                   "title": "",'+
        '                   "titleColor": "#335779",'+
        '                   "titleSize": 16'+
        '               },'+
        '               "type": "number"'+
        '           },'+
        '           "container_1": {'+
        '               "parameters": {'+
        '                   "alignmentX": "left",'+
        '                   "alignmentY": "top",'+
        '                   "documentId": "",'+
        '                   "fit": "original"'+
        '               },'+
        '               "type": "container"'+
        '           },'+
        '           "container_2": {'+
        '               "parameters": {'+
        '                   "alignmentX": "left",'+
        '                   "alignmentY": "top",'+
        '                   "documentId": "",'+
        '                   "fit": "original"'+
        '               },'+
        '               "type": "container"'+
        '           },'+
        '           "container_4": {'+
        '               "parameters": {'+
        '                   "alignmentX": "left",'+
        '                   "alignmentY": "top",'+
        '                   "documentId": "",'+
        '                   "fit": "original"'+
        '               },'+
        '               "type": "container"'+
        '           },'+
        '           "container_5": {'+
        '               "parameters": {'+
        '                   "alignmentX": "left",'+
        '                   "alignmentY": "top",'+
        '                   "documentId": "",'+
        '                   "fit": "original"'+
        '               },'+
        '               "type": "container"'+
        '           },'+
        '           "container_6": {'+
        '               "parameters": {'+
        '                   "alignmentX": "left",'+
        '                   "alignmentY": "top",'+
        '                   "documentId": "",'+
        '                   "fit": "original"'+
        '               },'+
        '               "type": "container"'+
        '           },'+
        '           "dateselector_1": {'+
        '               "parameters": {'+
        '                   "calendarTypeSwitchingAllowed": false,'+
        '                   "defaultAbsoluteMode": true,'+
        '                   "defaultFiscalMode": false,'+
        '                   "instant": false,'+
        '                   "modeSwitchingAllowed": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "dateselector"'+
        '           },'+
        '           "listselector_19": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_18": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_17": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_12": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_11": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_10": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_16": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_15": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },';
        String json4 = '"listselector_14": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_30": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_29": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_28": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_23": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_22": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_21": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_20": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_27": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_26": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_25": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_24": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_41": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_40": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "text_21": {'+
        '               "parameters": {'+
        '                   "fontSize": 24,'+
        '                   "text": "Command Drill-in #3",'+
        '                   "textAlignment": "center",'+
        '                   "textColor": "#FFFFFF"'+
        '               },'+
        '               "type": "text"'+
        '           },'+
        '           "listselector_39": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_34": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_33": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_32": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_31": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_38": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_37": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_36": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           },'+
        '           "listselector_35": {'+
        '               "parameters": {'+
        '                   "compact": false,'+
        '                   "expanded": true,'+
        '                   "exploreLink": false,'+
        '                   "instant": true,'+
        '                   "title": ""'+
        '               },'+
        '               "type": "listselector"'+
        '           }'+
        '       }'+
        '   }'+
        '}';
        
        String jsonss = json+json1+json2+json3+json4;
        return jsonss;
    }
    
    public string NewStringval4(){
        list<Sales_Insight__c> Sales = [select id,Sales_Insight_String1__c,Sales_insight_String2__c,Sales_Insight_String3__c from Sales_Insight__c where Name= 'Theme For NewSalesSight' and Dashboard_Id__c = null and Dashboard_Id__c = '' limit 1];
        String jsonss = Sales[0].Sales_Insight_String1__c + Sales[0].Sales_insight_String2__c + Sales[0].Sales_Insight_String3__c;
        jsonss= jsonss.replace('00l36000000jQsyAAE','00l28000001VoU1AAK');
        jsonss= jsonss.replace('Multi-KPI Sales (NEW) - Clone','Copy of Single DB Template');
        return jsonss;
    }
    
        public string NewStringval5(){
        list<Sales_Insight__c> Sales = [select id,Sales_Insight_String4__c,Sales_insight_String2__c,Sales_Insight_String3__c from Sales_Insight__c where Name= 'Theme For NewSalesSight' and Dashboard_Id__c = null and Dashboard_Id__c = '' limit 1];
        String jsonss = Sales[0].Sales_Insight_String4__c + Sales[0].Sales_insight_String2__c + Sales[0].Sales_Insight_String3__c;
        jsonss= jsonss.replace('00l36000000jQsyAAE','00l28000001VoU1AAK');
        jsonss= jsonss.replace('Multi-KPI Sales (NEW) - Clone','Copy of Single DB Template');
        return jsonss;
    }
    
    
        public string NewStringval6(){
        list<Sales_Insight__c> Sales = [select id,Sales_Insight_String5__c,Sales_insight_String2__c,Sales_Insight_String3__c from Sales_Insight__c where Name= 'Theme For NewSalesSight' and Dashboard_Id__c = null and Dashboard_Id__c = '' limit 1];
        String jsonss = Sales[0].Sales_Insight_String5__c + Sales[0].Sales_insight_String2__c + Sales[0].Sales_Insight_String3__c;
        jsonss= jsonss.replace('00l36000000jQsyAAE','00l28000001VoU1AAK');
        jsonss= jsonss.replace('Multi-KPI Sales (NEW) - Clone','Copy of Single DB Template');
        return jsonss;
    }
    
     public static HttpResponse m_createSingleDashboard(String jsonss){  
         String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v41.0';     
        String endpoint;        
        endpoint = sfdcInstance + '/wave/dashboards';  
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint); 
        req.settimeout(60000);
        req.setMethod('POST');
        req.setHeader('content-type', 'application/json');
        req.setHeader('Authorization','Bearer ' + UserInfo.getSessionId()); 
         if(!Test.isRunningTest())     
          req.setBody(jsonss);
        HttpResponse res;
        if(!Test.isRunningTest()){
            res = http.send(req); 
            System.debug('*********** Response is '+res.getStatus() + res.getBody() );  
            return res;                
        }
        else{
            return null;
        }
    }
    
   
    public pageReference SaveTheme(){
      if(ThemeName != null && ThemeName != ''){
          String DBName = ThemeName;
       
       String NewStrings='';
       String NewStringsone='';
       String NewStringstwo='';
       String NewStringsthree='';
       String DatasetType;
       Sales_Insight__c sales = new Sales_Insight__c();
       Json_class__c jsons = new Json_class__c();
         if(listVal == 'Insights'){
             Sales = [select id,Sales_Insight_String1__c,Sales_insight_String2__c,Sales_Insight_String3__c,Sales_Insight_String4__c from Sales_Insight__c where Name= 'Default SingleKPI Theme' limit 1];
            DatasetType = 'Insights';
            NewStrings = NewStringval();
         }else if(listVal == 'Compare'){
             Sales = [select id,Sales_Insight_String1__c,Sales_insight_String2__c,Sales_Insight_String3__c,Sales_Insight_String4__c from Sales_Insight__c where Name= 'Default SnapshotKPI Theme' limit 1];
            DatasetType = 'Compare';
            NewStrings = NewStringval1();
         }else if(listVal == 'Contrast'){
            Sales = [select id,Sales_Insight_String1__c,Sales_insight_String2__c,Sales_Insight_String3__c,Sales_Insight_String4__c from Sales_Insight__c where Name= 'Default Actual Target Theme' limit 1];
            DatasetType = 'Contrast';
            NewStrings = NewStringval2();
            //system.debug('@@@@@@@@@@@@@@@@'+NewStrings);
         }else if(listVal == 'Command'){
            jsons = [select id,analyticscc__Json1__c,analyticscc__Dashboard_Type__c,analyticscc__Json_Measure_List__c,analyticscc__Json_FilterLabel_Delete__c,analyticscc__Sales_Filter1__c,analyticscc__Sales_Filter2__c,analyticscc__Sales_Filter3__c,analyticscc__Sales_Filter4__c,analyticscc__Sales_Filter5__c,analyticscc__Json_String__c,
                                            analyticscc__Json_Pillbox__c,analyticscc__Json_String_Toggle__c,analyticscc__Json_Full_pillbox__c,analyticscc__Json_Pillbox_comma__c,analyticscc__Json_Pillbox1__c,analyticscc__Json_Pillbox2__c,analyticscc__Json_Section1__c,analyticscc__Json_Section2__c,analyticscc__Json_section3__c,
                                            analyticscc__Json_Measure__c,analyticscc__Json_listselector__c,analyticscc__Json_ListSelector1__c,analyticscc__Json_Selector_Date__c,analyticscc__Json_listselector_Date2__c,analyticscc__Json_KPI__c,analyticscc__Json_Number__c,analyticscc__Json_Number1__c,analyticscc__Json_list_Measure__c,
                                            analyticscc__Json_List_Selector2__c,analyticscc__Json_Selector3__c,analyticscc__Json_MeasureLabel_Delete__c,analyticscc__Success_Filter1__c,analyticscc__Success_Filter2__c,analyticscc__Success_Filter3__c,analyticscc__Success_Filter4__c,analyticscc__Success_Filter5__c,
                                            analyticscc__Json_Pillbox5__c,analyticscc__Json_KPI_1__c,analyticscc__Market__c,analyticscc__Market_Filter1__c,analyticscc__Market_Filter2__c,analyticscc__Market_Filter3__c,analyticscc__Market_Filter4__c,
                                            analyticscc__Json_Selector38__c,analyticscc__Filter5_deleted__c,analyticscc__Chart_Delete_marketing__c,analyticscc__Chart_Delete_marketing1__c,analyticscc__Json_Static_Measure__c,analyticscc__List_Selector35__c,analyticscc__Chart_Delete_Success__c,analyticscc__Chart_Delete_Success1__c,
                                            analyticscc__Json2__c,analyticscc__Json_KPI_2__c,analyticscc__Chart_Delete_Row__c,analyticscc__Json3__c,analyticscc__Success_KPI_1__c,analyticscc__Success_Timeline__c,analyticscc__Json4__c,analyticscc__Success_KPI_2__c,analyticscc__Sales_Timeline__c,analyticscc__Json_Del__c,analyticscc__Success_KPI_3__c,analyticscc__Marketing_Timeline__c,analyticscc__Json_Filter__c,analyticscc__Success_KPI_4__c,analyticscc__Json_Last_Dataset__c,analyticscc__Success_KPI_5__c,
                                            analyticscc__Json_Filter_Remove__c,analyticscc__Chart_Delete__c,analyticscc__Dashboard_Id__c
                                            from analyticscc__Json_class__c where Name='Default MultiKPI Theme' limit 1];
            DatasetType = 'Command';
            NewStrings = NewStringval3();
            
             Sales = [SELECT  Name,DataSet_Delete__c,Sales_Insight_String5__c,Measures_Delete__c,Sales_insight_String1__c,Grouping_label_Delete__c,
                            Sales_insight_String2__c,Sales_insight_String3__c,Sales_insight_String4__c,Grouping_Delete__c 
                            FROM Sales_Insight__c
                            where Name='New Default Sales Insight' limit 1];
            DatasetType = 'Sales Insights';
            NewStringsone = NewStringval4();
            NewStringstwo = NewStringval5();
            NewStringsthree = NewStringval6();
            //system.debug('@@@@@@@@@@@@@@@@'+NewStrings);
         }
        
           String SalesId = '';
           String SuccesssId = '';
           String MarketId = '';
          //String NewStrings = NewStringval();
          if(listval == 'Command'){
                NewStringsone = NewStringsone.replace('Copy of Single DB Template',Dbname+' Drill 1').replace('00l28000001VoU1AAK',FloderList);
                 NewStringsone = NewStringsone.replaceAll('"destination": "NewDashboardBuilderTwo",','').replaceAll('"destination": "NewDashboardBuilderFour",','');
                NewStringsone = NewStringsone.replaceAll('"destination": "NewDashboardBuilderThree",','').replaceAll('"destination": "NewDashboardBuilderOne",','');
                httpResponse Res = new httpResponse();
                if(!Test.isRunningTest())
                Res = TouchAnalytics_UIClass.m_createSingleDashboard(NewStringsone);
                 dashbocreatejson payTypes = new dashbocreatejson();
                String Datesetvalues = res.getBody();   
                if(Datesetvalues != null && Datesetvalues != ''){ 
                     payTypes = dashbocreatejson.parse(Datesetvalues);
                } 
                SalesId = payTypes.Id;
                
                NewStringstwo = NewStringstwo.replace('Copy of Single DB Template',Dbname+' Drill2').replace('00l28000001VoU1AAK',FloderList);
                  NewStringstwo = NewStringstwo.replaceAll('"destination": "NewDashboardBuilderTwo",','').replaceAll('"destination": "NewDashboardBuilderFour",','');
                NewStringstwo = NewStringstwo.replaceAll('"destination": "NewDashboardBuilderThree",','').replaceAll('"destination": "NewDashboardBuilderOne",','');
               
                httpResponse Res1 = new httpResponse();
                if(!Test.isRunningTest())
                Res1 = TouchAnalytics_UIClass.m_createSingleDashboard(NewStringstwo);
                 dashbocreatejson payTypes1 = new dashbocreatejson();
                String Datesetvalues1 = Res1.getBody();   
                if(Datesetvalues1 != null && Datesetvalues1 != ''){ 
                     system.debug('StringTwo@@@@@@@@@ '+Datesetvalues1);
                     payTypes1 = dashbocreatejson.parse(Datesetvalues1);
                } 
                SuccesssId = payTypes1.Id;
                
                NewStringsthree = NewStringsthree.replace('Copy of Single DB Template',Dbname+' Drill3').replace('00l28000001VoU1AAK',FloderList);
                   NewStringsthree = NewStringsthree.replaceAll('"destination": "NewDashboardBuilderTwo",','').replaceAll('"destination": "NewDashboardBuilderFour",','');
                NewStringsthree = NewStringsthree.replaceAll('"destination": "NewDashboardBuilderThree",','').replaceAll('"destination": "NewDashboardBuilderOne",','');
               
                httpResponse Res2 = new httpResponse();
                if(!Test.isRunningTest())
                Res2 = TouchAnalytics_UIClass.m_createSingleDashboard(NewStringsthree);
                 dashbocreatejson payTypes2 = new dashbocreatejson();
                String Datesetvalues2 = Res2.getBody();   
                if(Datesetvalues2 != null && Datesetvalues2 != ''){ 
                     system.debug('String Three @@@@@@@@@ '+Datesetvalues2);
                     payTypes2 = dashbocreatejson.parse(Datesetvalues2);
                } 
                MarketId = payTypes2.Id;
                
                
          }
          else{
          }
          NewStrings = NewStrings.replace('Copy of Single DB Template',Dbname).replace('00l28000001VoU1AAK',FloderList);
          NewStrings = NewStrings.replace('0FK36000000UlJrGAK',MarketId).replace('0FK36000000UlJmGAK',SuccesssId).replace('0FK36000000UlKpGAK',SalesId);
          NewStrings = NewStrings.replace('"Til"','"'+Dbname+'"');
          httpResponse Res = new httpResponse();
          
          if(!Test.isRunningTest())
            Res = TouchAnalytics_UIClass.m_createSingleDashboard(NewStrings); 
          
          
          if(res.getStatus() == 'Created'){
                dashbocreatejson payTypes = new dashbocreatejson();
                String Datesetvalues = res.getBody();   
                if(Datesetvalues != null && Datesetvalues != ''){ 
                     payTypes = dashbocreatejson.parse(Datesetvalues);
                } 
                String Newstr;
                if(payTypes != null){
                    Newstr = payTypes.assetSharingUrl;
                }
                Sales_Insight__c  Sl = new Sales_Insight__c();
                sl.Name= DBName ;
                Json_class__c j1 = new Json_class__c();
                j1.Name = DBName;
               
                if(payTypes != null){
                    if(listVal != 'Command' && listVal != 'Sales Insights'){
                        sl.Dashboard_Id__c = payTypes.id;
                        sl.Sales_Insight_String1__c = Sales.Sales_Insight_String1__c;
                        sl.Sales_Insight_String2__c = Sales.Sales_Insight_String2__c;
                        sl.Sales_Insight_String3__c = Sales.Sales_Insight_String3__c;
                        sl.Sales_Insight_String4__c = Sales.Sales_Insight_String4__c;
                        sl.Dashboard_Type__c = DatasetType;
                        insert Sl;
                        //Sales.Dashboard_Type__c = 'Insights';
                        //update Sales;
                        
                    }else if(listVal == 'Command' ){
                        j1.analyticscc__Dashboard_Id__c = payTypes.id;
                        j1.analyticscc__Json1__c = jsons.analyticscc__Json1__c;
                        j1.analyticscc__Json_Pillbox__c = jsons.analyticscc__Json_Pillbox__c;
                        j1.analyticscc__Json_String_Toggle__c = jsons.analyticscc__Json_String_Toggle__c;
                        j1.analyticscc__Json_Full_pillbox__c = jsons.analyticscc__Json_Full_pillbox__c;
                        j1.analyticscc__Json_Pillbox_comma__c = jsons.analyticscc__Json_Pillbox_comma__c;
                        j1.analyticscc__Json_Pillbox1__c = jsons.analyticscc__Json_Pillbox1__c;
                        j1.analyticscc__Json_Pillbox2__c = jsons.analyticscc__Json_Pillbox2__c;
                        j1.analyticscc__Json_Section1__c = jsons.analyticscc__Json_Section1__c;
                        j1.analyticscc__Json_Section2__c = jsons.analyticscc__Json_Section2__c;
                        j1.analyticscc__Json_section3__c = jsons.analyticscc__Json_section3__c;
                        j1.analyticscc__Json_Measure__c = jsons.analyticscc__Json_Measure__c;
                        j1.analyticscc__Json_listselector__c = jsons.analyticscc__Json_listselector__c;
                        j1.analyticscc__Json_ListSelector1__c = jsons.analyticscc__Json_ListSelector1__c;
                        j1.analyticscc__Json_Selector_Date__c = jsons.analyticscc__Json_Selector_Date__c;
                        j1.analyticscc__Json_listselector_Date2__c = jsons.analyticscc__Json_listselector_Date2__c;
                        j1.analyticscc__Json_KPI__c = jsons.analyticscc__Json_KPI__c;
                        j1.analyticscc__Json_Number__c = jsons.analyticscc__Json_Number__c;
                        j1.analyticscc__Json_Number1__c = jsons.analyticscc__Json_Number1__c;
                        j1.analyticscc__Json_list_Measure__c = jsons.analyticscc__Json_list_Measure__c;
                        j1.analyticscc__Json_List_Selector2__c = jsons.analyticscc__Json_List_Selector2__c;
                        j1.analyticscc__Json_Selector3__c = jsons.analyticscc__Json_Selector3__c;
                        j1.analyticscc__Json_MeasureLabel_Delete__c = jsons.analyticscc__Json_MeasureLabel_Delete__c;
                        j1.analyticscc__Success_Filter1__c = jsons.analyticscc__Success_Filter1__c;
                        j1.analyticscc__Success_Filter2__c = jsons.analyticscc__Success_Filter2__c;
                        j1.analyticscc__Success_Filter3__c = jsons.analyticscc__Success_Filter3__c;
                        j1.analyticscc__Success_Filter4__c = jsons.analyticscc__Success_Filter4__c;
                        j1.analyticscc__Success_Filter5__c = jsons.analyticscc__Success_Filter5__c;
                        j1.analyticscc__Json_Measure_List__c = jsons.analyticscc__Json_Measure_List__c;
                        j1.analyticscc__Json_FilterLabel_Delete__c = jsons.analyticscc__Json_FilterLabel_Delete__c;
                        j1.analyticscc__Sales_Filter1__c = jsons.analyticscc__Sales_Filter1__c;
                        j1.analyticscc__Sales_Filter2__c = jsons.analyticscc__Sales_Filter2__c;
                        j1.analyticscc__Sales_Filter3__c = jsons.analyticscc__Sales_Filter3__c;
                        j1.analyticscc__Sales_Filter4__c = jsons.analyticscc__Sales_Filter4__c;
                        j1.analyticscc__Sales_Filter5__c = jsons.analyticscc__Sales_Filter5__c;
                        j1.analyticscc__Json_Pillbox5__c = jsons.analyticscc__Json_Pillbox5__c;
                        j1.analyticscc__Json_KPI_1__c = jsons.analyticscc__Json_KPI_1__c;
                        j1.analyticscc__Market__c = jsons.analyticscc__Market__c;
                        j1.analyticscc__Market_Filter1__c = jsons.analyticscc__Market_Filter1__c;
                        j1.analyticscc__Market_Filter2__c = jsons.analyticscc__Market_Filter2__c;
                        j1.analyticscc__Market_Filter3__c = jsons.analyticscc__Market_Filter3__c;
                        j1.analyticscc__Market_Filter4__c = jsons.analyticscc__Market_Filter4__c;
                        j1.analyticscc__Json_Selector38__c = jsons.analyticscc__Json_Selector38__c;
                        j1.analyticscc__Filter5_deleted__c = jsons.analyticscc__Filter5_deleted__c;
                        j1.analyticscc__Chart_Delete_marketing__c = jsons.analyticscc__Chart_Delete_marketing__c;
                        j1.analyticscc__Chart_Delete_marketing1__c = jsons.analyticscc__Chart_Delete_marketing1__c;
                        j1.analyticscc__Json_Static_Measure__c = jsons.analyticscc__Json_Static_Measure__c;
                        j1.analyticscc__List_Selector35__c = jsons.analyticscc__List_Selector35__c;
                        j1.analyticscc__Chart_Delete_Success__c = jsons.analyticscc__Chart_Delete_Success__c;
                        j1.analyticscc__Chart_Delete_Success1__c = jsons.analyticscc__Chart_Delete_Success1__c;
                        j1.analyticscc__Json2__c = jsons.analyticscc__Json2__c;
                        j1.analyticscc__Json_KPI_2__c = jsons.analyticscc__Json_KPI_2__c;
                        j1.analyticscc__Chart_Delete_Row__c = jsons.analyticscc__Chart_Delete_Row__c;
                        j1.analyticscc__Json3__c = jsons.analyticscc__Json3__c;
                        j1.analyticscc__Success_KPI_1__c = jsons.analyticscc__Success_KPI_1__c;
                        j1.analyticscc__Success_Timeline__c = jsons.analyticscc__Success_Timeline__c;
                        j1.analyticscc__Json4__c = jsons.analyticscc__Json4__c;
                        j1.analyticscc__Success_KPI_2__c = jsons.analyticscc__Success_KPI_2__c;
                        j1.analyticscc__Sales_Timeline__c = jsons.analyticscc__Sales_Timeline__c;
                        j1.analyticscc__Json_Del__c = jsons.analyticscc__Json_Del__c;
                        j1.analyticscc__Success_KPI_3__c = jsons.analyticscc__Success_KPI_3__c;
                        j1.analyticscc__Marketing_Timeline__c = jsons.analyticscc__Marketing_Timeline__c;
                        j1.analyticscc__Json_Filter__c = jsons.analyticscc__Json_Filter__c;
                        j1.analyticscc__Success_KPI_4__c = jsons.analyticscc__Success_KPI_4__c;
                        j1.analyticscc__Json_Last_Dataset__c = jsons.analyticscc__Json_Last_Dataset__c;
                        j1.analyticscc__Success_KPI_5__c = jsons.analyticscc__Success_KPI_5__c;
                        j1.analyticscc__Json_Filter_Remove__c = jsons.analyticscc__Json_Filter_Remove__c;
                        j1.analyticscc__Chart_Delete__c = jsons.analyticscc__Chart_Delete__c;
                        j1.analyticscc__Json_FilterLabel_Delete__c = jsons.analyticscc__Json_FilterLabel_Delete__c;
                        j1.analyticscc__Sales_Filter1__c = jsons.analyticscc__Sales_Filter1__c;
                        j1.analyticscc__Sales_Filter2__c = jsons.analyticscc__Sales_Filter2__c;
                        j1.analyticscc__Sales_Filter3__c = jsons.analyticscc__Sales_Filter3__c;
                        j1.analyticscc__Sales_Filter4__c = jsons.analyticscc__Sales_Filter4__c;
                        j1.analyticscc__Sales_Filter5__c = jsons.analyticscc__Sales_Filter5__c;
                        j1.analyticscc__Json_Measure_List__c = jsons.analyticscc__Json_Measure_List__c;
                        j1.analyticscc__Dashboard_Type__c = 'Command';
                        j1.analyticscc__Json_String__c = jsons.analyticscc__Json_String__c;
                        insert j1;
                        
                        Sl = new Sales_Insight__c();
                        sl.Name= SalesId ;
                        sl.Dashboard_Id__c = payTypes.id;
                        sl.Sales_Insight_String1__c = Sales.Sales_Insight_String1__c;
                        sl.Sales_Insight_String2__c = Sales.Sales_Insight_String2__c;
                        sl.Sales_Insight_String3__c = Sales.Sales_Insight_String3__c;
                        sl.Sales_Insight_String4__c = Sales.Sales_Insight_String4__c;
                        sl.Sales_Insight_String5__c = Sales.Sales_Insight_String5__c;
                        sl.DataSet_Delete__c = Sales.DataSet_Delete__c;
                        sl.Grouping_Delete__c = Sales.Grouping_Delete__c;
                        sl.Grouping_label_Delete__c = Sales.Grouping_label_Delete__c;
                        sl.Measures_Delete__c = Sales.Measures_Delete__c;
                        sl.Dashboard_Type__c = 'Sales Insights';
                        insert sl;
                        
                        Sales_Insight__c sl1 = new Sales_Insight__c();
                        sl1.Name= SuccesssId;
                        sl1.Dashboard_Id__c = payTypes.id;
                        sl1.Sales_Insight_String1__c = Sales.Sales_Insight_String1__c;
                        sl1.Sales_Insight_String2__c = Sales.Sales_Insight_String2__c;
                        sl1.Sales_Insight_String3__c = Sales.Sales_Insight_String3__c;
                        sl1.Sales_Insight_String4__c = Sales.Sales_Insight_String4__c;
                        sl1.Sales_Insight_String5__c = Sales.Sales_Insight_String5__c;
                        sl1.DataSet_Delete__c = Sales.DataSet_Delete__c;
                        sl1.Grouping_Delete__c = Sales.Grouping_Delete__c;
                        sl1.Grouping_label_Delete__c = Sales.Grouping_label_Delete__c;
                        sl1.Measures_Delete__c = Sales.Measures_Delete__c;
                        sl1.Dashboard_Type__c = 'Success Insight';
                        insert sl1;
                        
                        Sales_Insight__c sl2 = new Sales_Insight__c();
                        sl2.Name= MarketId ;
                        sl2.Dashboard_Id__c = payTypes.id;
                        sl2.Sales_Insight_String1__c = Sales.Sales_Insight_String1__c;
                        sl2.Sales_Insight_String2__c = Sales.Sales_Insight_String2__c;
                        sl2.Sales_Insight_String3__c = Sales.Sales_Insight_String3__c;
                        sl2.Sales_Insight_String4__c = Sales.Sales_Insight_String4__c;
                        sl2.Sales_Insight_String5__c = Sales.Sales_Insight_String5__c;
                        sl2.DataSet_Delete__c = Sales.DataSet_Delete__c;
                        sl2.Grouping_Delete__c = Sales.Grouping_Delete__c;
                        sl2.Grouping_label_Delete__c = Sales.Grouping_label_Delete__c;
                        sl2.Measures_Delete__c = Sales.Measures_Delete__c;
                        sl2.Dashboard_Type__c = 'Marketing Insight';
                        insert sl2;
                    }
                    else if(listVal == 'Sales Insights' ){
                       
                    }
                    
                }
                
                
                pageReference pr = new pageReference(Newstr);
                pr.setRedirect(true);
                return pr;
        }
      }
      else{
           //Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.ERROR, 'You Must Enter Value'));  
            return null;
      }
        return null;
    }
    
    public string FloderNames(){
        String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v43.0';
        String endpoint;
        endpoint = sfdcInstance + '/wave/folders?hasCurrentOnly=true';         
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint); 
        req.settimeout(60000);
        req.setMethod('GET');
        req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
        req.setHeader('content-type', 'application/json');         
        HttpResponse res;
        
       if(!Test.isRunningTest()){
            res = http.send(req);            
            return res.getBody();  
        }
        else{
                return null;
            } 
    }
    
     public Void TemplatesManage(){
        TemplateFalse = true;
        Managelists = new list<Sales_Insight__c>();
        Multilist = new list<Json_class__c>();
        String SingleMulties ;
        if(SingleMultis == 'Single KPI'){
            SingleMulties = 'Insights';
        }
        else if(SingleMultis == 'Multi KPI'){
            SingleMulties = 'Command';
        }
        else if(SingleMultis == 'Snapshot KPI'){
            SingleMulties = 'Compare';
        }
        else if(SingleMultis == 'Actual/Target'){
            SingleMulties = 'Contrast';
        }
        else{
            SingleMulties = SingleMultis;
        }
        if(SingleMultis == 'All' && CreatedUsersAll == 'All'){
            Multilist =  [select Id,Name,Dashboard_Type__c,CreatedDate,CreatedBy.Name,Dashboard_Id__c  from Json_class__c where  Dashboard_Id__c != null order By createddate desc limit 300];
        }
        else if(SingleMultis != 'All' && CreatedUsersAll == 'All'){
            Multilist =  [select Id,Name,Dashboard_Type__c,CreatedDate,CreatedBy.Name,Dashboard_Id__c  from Json_class__c where Dashboard_Type__c =:SingleMulties and Dashboard_Id__c != null order By createddate desc limit 300];
            
        }
        else if(SingleMultis == 'All' && CreatedUsersAll != 'All'){
            Multilist =  [select Id,Name,Dashboard_Type__c,CreatedDate,CreatedBy.Name,Dashboard_Id__c  from Json_class__c  where createdbyId =:CreatedUsersAll and Dashboard_Id__c != null order By createddate desc limit 300];
            
        }
        else if(SingleMultis != 'All' && CreatedUsersAll != 'All'){
            Multilist =  [select Id,Name,Dashboard_Type__c,CreatedDate,CreatedBy.Name,Dashboard_Id__c  from Json_class__c  where Dashboard_Type__c =:SingleMulties and createdbyId =:CreatedUsersAll and Dashboard_Id__c != null order By createddate desc limit 300];
            
        }
        
        if(SingleMultis == 'All' && CreatedUsersAll == 'All'){
            Managelists =  [select Id,Name,Dashboard_Type__c,CreatedDate,CreatedBy.Name,Dashboard_Id__c  from Sales_Insight__c where  Dashboard_Id__c != null and Dashboard_Type__c != 'Sales Insights' and Dashboard_Type__c != 'Sales Insight' and Dashboard_Type__c != 'Marketing Insight' and Dashboard_Type__c != 'Success Insight' order By createddate desc limit 700];
        }
        else if(SingleMultis != 'All' && CreatedUsersAll == 'All'){
            Managelists =  [select Id,Name,Dashboard_Type__c,CreatedDate,CreatedBy.Name,Dashboard_Id__c  from Sales_Insight__c where Dashboard_Type__c =:SingleMulties and Dashboard_Id__c != null order By createddate desc limit 700];
            
        }
        else if(SingleMultis == 'All' && CreatedUsersAll != 'All'){
            Managelists =  [select Id,Name,Dashboard_Type__c,CreatedDate,CreatedBy.Name,Dashboard_Id__c  from Sales_Insight__c  where createdbyId =:CreatedUsersAll and Dashboard_Id__c != null and Dashboard_Type__c != 'Sales Insights' and Dashboard_Type__c != 'Sales Insight' and Dashboard_Type__c != 'Marketing Insight' and Dashboard_Type__c != 'Success Insight' order By createddate desc limit 700];
            
        }
        else if(SingleMultis != 'All' && CreatedUsersAll != 'All'){
            Managelists =  [select Id,Name,Dashboard_Type__c,CreatedDate,CreatedBy.Name,Dashboard_Id__c  from Sales_Insight__c  where Dashboard_Type__c =:SingleMulties and createdbyId =:CreatedUsersAll and Dashboard_Id__c != null order By createddate desc limit 700];
            
        }
         
    }
    public void removedbs(){
        string Rw = Apexpages.currentpage().getParameters().get('DeleteDB');
        System.debug('Debug for Delete' + Rw);
        
        
        Managelists = new list<Sales_Insight__c>();
        Multilist = new list<Json_class__c>();
        String SingleMulties ; 
        if(SingleMultis == 'Single KPI'){
            SingleMulties = 'Insights';
        }
        else if(SingleMultis == 'Multi KPI'){
            SingleMulties = 'Command';
        }
        else if(SingleMultis == 'Snapshot KPI'){
            SingleMulties = 'Compare';
        }
        else if(SingleMultis == 'Actual/Target'){
            SingleMulties = 'Contrast';
        }
        else{
            SingleMulties = SingleMultis;
        }
        
        if(SingleMulties == 'Command'){
            system.debug('listval@@@@@@@ '+SingleMulties);
            Json_class__c js = [select id from Json_class__c where Id=: Rw];
            Delete js;
        }else{  
            system.debug('listval$$$$$$$ '+SingleMulties);
            Sales_Insight__c DBTemp = [select id from Sales_Insight__c where Id=: Rw];
            Delete DBTemp;
        }
        
        if(SingleMultis == 'All' && CreatedUsersAll == 'All'){
            Multilist =  [select Id,Name,Dashboard_Type__c,CreatedDate,CreatedBy.Name,Dashboard_Id__c  from Json_class__c where  Dashboard_Id__c != null order By createddate desc limit 300];
        }
        else if(SingleMultis != 'All' && CreatedUsersAll == 'All'){
            Multilist =  [select Id,Name,Dashboard_Type__c,CreatedDate,CreatedBy.Name,Dashboard_Id__c  from Json_class__c where Dashboard_Type__c =:SingleMulties and Dashboard_Id__c != null order By createddate desc limit 300];
            
        }
        else if(SingleMultis == 'All' && CreatedUsersAll != 'All'){
            Multilist =  [select Id,Name,Dashboard_Type__c,CreatedDate,CreatedBy.Name,Dashboard_Id__c  from Json_class__c  where createdbyId =:CreatedUsersAll and Dashboard_Id__c != null order By createddate desc limit 300];
            
        }
        else if(SingleMultis != 'All' && CreatedUsersAll != 'All'){
            Multilist =  [select Id,Name,Dashboard_Type__c,CreatedDate,CreatedBy.Name,Dashboard_Id__c  from Json_class__c  where Dashboard_Type__c =:SingleMulties and createdbyId =:CreatedUsersAll and Dashboard_Id__c != null order By createddate desc limit 300];
            
        }
        if(SingleMultis == 'All' && CreatedUsersAll == 'All'){
            Managelists =  [select Id,Name,Dashboard_Type__c,CreatedDate,CreatedBy.Name,Dashboard_Id__c  from Sales_Insight__c where  Dashboard_Id__c != null and Dashboard_Type__c != 'Sales Insights' and Dashboard_Type__c != 'Sales Insight' and Dashboard_Type__c != 'Marketing Insight' and Dashboard_Type__c != 'Success Insight' order By createddate desc limit 700];
        }
        else if(SingleMultis != 'All' && CreatedUsersAll == 'All'){
            Managelists =  [select Id,Name,Dashboard_Type__c,CreatedDate,CreatedBy.Name,Dashboard_Id__c  from Sales_Insight__c where Dashboard_Type__c =:SingleMulties and Dashboard_Id__c != null order By createddate desc limit 700];
            
        }
        else if(SingleMultis == 'All' && CreatedUsersAll != 'All'){
            Managelists =  [select Id,Name,Dashboard_Type__c,CreatedDate,CreatedBy.Name,Dashboard_Id__c  from Sales_Insight__c  where createdbyId =:CreatedUsersAll and Dashboard_Id__c != null and Dashboard_Type__c != 'Sales Insights' and Dashboard_Type__c != 'Sales Insight' and Dashboard_Type__c != 'Marketing Insight' and Dashboard_Type__c != 'Success Insight' order By createddate desc limit 700];
            
        }
        else if(SingleMultis != 'All' && CreatedUsersAll != 'All'){
            Managelists =  [select Id,Name,Dashboard_Type__c,CreatedDate,CreatedBy.Name,Dashboard_Id__c  from Sales_Insight__c  where Dashboard_Type__c =:SingleMulties and createdbyId =:CreatedUsersAll and Dashboard_Id__c != null order By createddate desc limit 700];
            
        }
        
        
        
    }
    public list<selectoption> NewListopt{get;set;}
    public list<selectoption> NewListopt1{get;set;}
    public list<selectoption> NewListopt2{get;set;}
    public list<selectoption> NewListopt3{get;set;}
    public String Allval{get;set;}
    public String Allval1{get;set;}
    public String Allval2{get;set;}
    public String Allval3{get;set;}
    public void AllSingleDashboards(){
        NewListopt = new list<selectoption>();
        list<Sales_Insight__c> ListSals = [select id,Name,Dashboard_Id__c  from Sales_Insight__c where Name = 'Default SingleKPI Theme' and Dashboard_Id__c = null and Dashboard_Id__c = '']; 
        for(Sales_Insight__c Sl :ListSals){
            NewListopt.add(new SelectOption(sl.id,sl.Name));
        }
        list<Sales_Insight__c> ListSal = [select id,Name,Dashboard_Id__c  from Sales_Insight__c where Dashboard_Type__c = 'Insights' and Name != 'Default SingleKPI Theme' and Dashboard_Id__c != null and Dashboard_Id__c != ''];
        for(Sales_Insight__c Sl :ListSal){
            NewListopt.add(new SelectOption(sl.id,sl.Name));
        }
        Allval = 'Default SingleKPI Theme';
    } 
    
    public void AllSnapshotDashboards(){
        NewListopt1 = new list<selectoption>();
        list<Sales_Insight__c> ListSals1 = [select id,Name,Dashboard_Id__c  from Sales_Insight__c where Name = 'Default SnapshotKPI Theme' and Dashboard_Id__c = null and Dashboard_Id__c = '']; 
        for(Sales_Insight__c Sl1 :ListSals1){
            NewListopt1.add(new SelectOption(sl1.id,sl1.Name));
        }
        list<Sales_Insight__c> ListSal1 = [select id,Name,Dashboard_Id__c  from Sales_Insight__c where Dashboard_Type__c = 'Compare' and Name != 'Default SnapshotKPI Theme ' and Dashboard_Id__c != null and Dashboard_Id__c != ''];
        for(Sales_Insight__c Sl1 :ListSal1){
            NewListopt1.add(new SelectOption(sl1.id,sl1.Name));
        }
        
        Allval1 = 'Default SnapshotKPI Theme';
    } 
    
    public void AllActualDashboards(){
        NewListopt2 = new list<selectoption>();
        list<Sales_Insight__c> ListSals1 = [select id,Name,Dashboard_Id__c  from Sales_Insight__c where Name = 'Default Actual Target Theme' and Dashboard_Id__c = null and Dashboard_Id__c = '']; 
        for(Sales_Insight__c Sl1 :ListSals1){
            NewListopt2.add(new SelectOption(sl1.id,sl1.Name));
        }
        list<Sales_Insight__c> ListSal1 = [select id,Name,Dashboard_Id__c  from Sales_Insight__c where Dashboard_Type__c = 'Contrast' and Name != 'Default Actual Target Theme' and Dashboard_Id__c != null and Dashboard_Id__c != ''];
        for(Sales_Insight__c Sl1 :ListSal1){
            NewListopt2.add(new SelectOption(sl1.id,sl1.Name));
        }
        
        Allval2 = 'Default Actual Target Theme';
    }
    
    public void AllMultiKPIDashboards(){
        NewListopt3 = new list<selectoption>();
        list<Json_class__c> ListJson = [select id,Name,Dashboard_Id__c  from Json_class__c where Name = 'Default MultiKPI Theme' and Dashboard_Id__c = null and Dashboard_Id__c = '']; 
        for(Json_class__c js :ListJson){
            NewListopt3.add(new SelectOption(js.id,js.Name));
        }
        list<Json_class__c> ListJson1 = [select id,Name,Dashboard_Id__c  from Json_class__c where Dashboard_Type__c = 'Command' and Name != 'Default MultiKPI Theme' and Dashboard_Id__c != null and Dashboard_Id__c != ''];
        for(Json_class__c js1 :ListJson1){
            NewListopt3.add(new SelectOption(js1.id,js1.Name));
        }
        
        Allval3 = 'Default MultiKPI Theme';
    } 
    
    public boolean SyncThemesBool{get;set;}
    public void Syncthemes(){
        SyncThemesBool = true;
        
            Dashboard_Backup_AC  DBUp = new Dashboard_Backup_AC();
            //DBUp.NewDashboards();
            //DBUp.NewDashboards1();   
        
        
    }
    
    public list<DatasetInnerclass> DatasetInnerclassList{get;set;}
    public list<DatasetInnerclass> NewDatasetInnerclassList{get;set;}
    public class DatasetInnerclass{
         public String Datasetname{get;set;}   
        public String DatasetApp{get;set;}
        public String DatasetAlias{get;set;}
        public String DatasetIds{get;set;}
        public String DatasetCurrentVersionId{get;set;}
        public String DrillId{get;set;}
        public Boolean DrillBoxOne{get;set;}
        public Boolean DrillBoxTwo{get;set;}
        public Boolean DrillBoxThree{get;set;}
        public List<SelectOption> DrillList{get;set;}
         public DatasetInnerclass(String Datasetname,String DatasetApp,String DatasetAlias,String DatasetIds, String DatasetCurrentVersionId,String DrillId,Boolean DrillBoxOne,Boolean DrillBoxTwo,Boolean DrillBoxThree, List<selectOption> DrillList){
              this.Datasetname = Datasetname;
                this.DatasetApp = DatasetApp;
                this.DatasetAlias = DatasetAlias;
                this.DatasetIds = DatasetIds;
                this.DatasetCurrentVersionId = DatasetCurrentVersionId;
                this.DrillId = DrillId;
                this.DrillList = DrillList;
                this.DrillBoxOne = DrillBoxOne;
                this.DrillBoxTwo = DrillBoxTwo;
                this.DrillBoxThree = DrillBoxThree;
         }
    }
public string folderName{get;set;}
public List<SelectOption> FolderLists{get;set;} 
public void NewDatasets(){
        NewDatasetInnerclassList = new list<DatasetInnerclass>();
        if(folderName == 'All'){
            NewDatasetInnerclassList = DatasetInnerclassList;
        }
        else{
            for(DatasetInnerclass Dtlist : DatasetInnerclassList){
                if(folderName == Dtlist.DatasetApp){
                    NewDatasetInnerclassList.add(new DatasetInnerclass(Dtlist.Datasetname,Dtlist.DatasetApp,Dtlist.DatasetAlias,Dtlist.DatasetIds,Dtlist.DatasetCurrentVersionId,Dtlist.DrillId,Dtlist.DrillBoxOne,Dtlist.DrillBoxTwo,Dtlist.DrillBoxThree,Dtlist.DrillList));
                }
            }
        }
    }
    
    
     public void singleDashboardTheme(){
        if(DashAllval != null){
             Dashboard_Backup_AC  DBUp = new Dashboard_Backup_AC();
             DBUp.NewDashboardsSingle1(DashAllval);
        }
    }
    
 // @remoteAction
   public boolean DashboardSuccess{get;set;}
    public boolean DashboardSales{get;set;} 
    public boolean DashboardDB{get;set;}
    public DB_Template__c DatasetRec = new DB_Template__c();
  public pageReference MultiDtasets(){
        String Sectionone = System.currentPageReference().getParameters().get('AllSectionone');
        String Sectiontwo = System.currentPageReference().getParameters().get('AllSectiontwo');
        String Sectionthree = System.currentPageReference().getParameters().get('AllSectionthree');
     DashboardName = System.currentPageReference().getParameters().get('hiddenThemeId');
          AllSectionone = System.currentPageReference().getParameters().get('AllSectiononeId');
         AllSectiontwo = System.currentPageReference().getParameters().get('AllSectiontwoId');
         AllSectionthree = System.currentPageReference().getParameters().get('AllSectionthreeId');
        String AllString= '';
        String AllStringone = '';
        String AllStringtwo = '';
        list<DatasClassResult> DatasClassResultlist = new list<DatasClassResult>();
       // list<String> valsList = new list<String>();
        if(Sectionone.contains('<li')){
            Sectionone = Sectionone.replace('"/>','spvalues').replace('" />','spvalues').replace('value="','spvalues');
            Sectionone = Sectionone.replace('</span>','spvalues').replace('">','spvalues').replace('</li>','Nextlivalue');
            String[] SectiononeSplit = Sectionone.split('Nextlivalue');
            integer i = 1;
            integer s1 = 1;
            String NewString = '';
            for(String Str : SectiononeSplit){
                String[] Sectiononechild = Str.split('spvalues');
                if(Sectiononechild.size() >4){
                    DatasClassResultlist.add(new DatasClassResult(Sectiononechild[5],s1,Sectiononechild[7],Sectiononechild[3],Sectiononechild[9]));
                    s1 = s1+1;
                }
               //i++; 
            }
        }
        if(Sectiontwo.contains('<li')){
            Sectiontwo = Sectiontwo.replace('"/>','spvalues').replace('" />','spvalues').replace('value="','spvalues');
            Sectiontwo = Sectiontwo.replace('</span>','spvalues').replace('">','spvalues').replace('</li>','Nextlivalue');
            String[] SectiononeSplit = Sectiontwo.split('Nextlivalue');
            //integer i = 1;
            String NewString = '';
            integer s1 = 6;
            for(String Str : SectiononeSplit){
                String[] Sectiononechild = Str.split('spvalues');
                if(Sectiononechild.size() >4){
                    DatasClassResultlist.add(new DatasClassResult(Sectiononechild[5],s1,Sectiononechild[7],Sectiononechild[3],Sectiononechild[9]));
                   
                    s1 = s1+1;
                }
               // i++;
            }
        }
        if(Sectionthree.contains('<li')){
            Sectionthree = Sectionthree.replace('"/>','spvalues').replace('" />','spvalues').replace('value="','spvalues');
            Sectionthree = Sectionthree.replace('</span>','spvalues').replace('">','spvalues').replace('</li>','Nextlivalue');
            String[] SectiononeSplit = Sectionthree.split('Nextlivalue');
            integer i = 1;
            String NewString = '';
            integer s1 = 11;
            for(String Str : SectiononeSplit){
                String[] Sectiononechild = Str.split('spvalues');
                if(Sectiononechild.size() >4){
                    DatasClassResultlist.add(new DatasClassResult(Sectiononechild[5],s1,Sectiononechild[7],Sectiononechild[3],Sectiononechild[9]));
                 
                    S1= S1+1;
                }
               //i++; 
            }
            system.debug('NewStringthree &&&&&&&&&&&&'+DatasClassResultlist.size());
        } 
        
        
        DatasClassResultlist.sort();
        
        if(DashboardName != null && DashboardName != ''){
            DatasetRec.DB_Name__c = DashboardName; 
        }
        else{
            DatasetRec.DB_Name__c = 'AutoMultiDataset';  
        }
        DatasetRec.Type__c = 'Multi KPI';
        DatasetRec.Section_Name_1__c = AllSectionone;
        DatasetRec.Section_Name_2__c = AllSectiontwo;
        DatasetRec.Section_Name_3__c = AllSectionthree;     
       // insert    DatasetRec;
        list<KPIs__c> DatasetReclist = new list<KPIs__c>(); 
        list<Dataset__c> DatasetRecords = new list<Dataset__c>();   
        integer NewRow = 1;
        String NewDashId = '';
        String AvailableMeasure = '';
        String MeasureAPI = '';
        String AliasMeasureAPIN = '';
        String CompactMeasureAPIN = '';  
        String AvailableDimension = '';
        String DimensionApi = '';
        String FilterDimensionApi = '';
        String AvailableDateField = '';
        String DateFieldApi = '';
        for(DatasClassResult DashId : DatasClassResultlist){
        if(DashId.Name != NewDashId){
            NewDashId = DashId.Name;
            String CurrentverId='';
            list<InnerClassResult> InnerClassResultList = new list<InnerClassResult>();
            list<MeasInnerClassResult> MeasInnerClassResultList = new list<MeasInnerClassResult>();
            list<innerClass> values = new list<innerClass>();
            list<string> SetListDim = new list<string>();
            list<string> SetListDate = new list<string>();
            list<string> SetListMeas = new list<string>();
       // map<string,string> datasetmap = new map<string,string>();
        map<string,string> dateFieldsMap = new map<string,string>();
        map<string,string> DimensionFieldsMap = new map<string,string>();
        map<string,integer> MeasureStringMap = new map<string,integer>();
        CurrentverId = DashId.Dashurl;
       //DashId.Dashname;
        // DatasetFromJson  payTypes = new DatasetFromJson();
        // String Datesetvalues = getDatasets();
        // if(Datesetvalues != null && Datesetvalues != ''){ 
        //  payTypes = DatasetFromJson.parse(Datesetvalues);
        // } 
        // if(payTypes.datasets !=null){
        //  for(DatasetFromJson.cls_datasets Rep : payTypes.datasets){ 
        //      if(Rep.Id == DashId.Name){
        //          CurrentverId = Rep.currentVersionId;
        //          datasetmap.put(Rep.Id,Rep.Name);            
        //      }
        //  } 
        // }                            
        DatasetDimensionFromJson  DimensionTypes = new DatasetDimensionFromJson();
        string DimensionsReturnValue = Dimensions(DashId.Name,CurrentverId);
        if(DimensionsReturnValue != null && DimensionsReturnValue != ''){
            DimensionTypes = DatasetDimensionFromJson.parse(DimensionsReturnValue);     
        }
        if(DimensionTypes.dimensions !=null){
            for(DatasetDimensionFromJson.cls_dimensions Dim : DimensionTypes.dimensions){ 
                if(Dim.showInExplorer == true) { 
                    if(Dim.origin != '' && Dim.origin != null){
                        SetListDim.add(Dim.Field);
                        DimensionFieldsMap.put(Dim.Field,Dim.label);
                    }
                }           
            }
        }
        if(DimensionTypes.measures !=null){
            for(DatasetDimensionFromJson.cls_measures Dim : DimensionTypes.measures){  
                    SetListMeas.add(Dim.Field); 
            } 
        }  
        if(DimensionTypes.dates !=null){
            for(DatasetDimensionFromJson.cls_dates Dim : DimensionTypes.dates){ 
                if(Dim.showInExplorer == true){
                    SetListDate.add(Dim.fields.fullField); 
                    dateFieldsMap.put(Dim.fields.fullField,Dim.label);              
                }        
            } 
        }    
        AvailableDateField = '';
        DateFieldApi = '';
        integer Datei= 1;
        for(String dtS : SetListDate){
            if(Datei <= 3){
                if(AvailableDateField == ''){
                    AvailableDateField = dateFieldsMap.get(dts);
                    DateFieldApi = dts;
                }
                else{
                    AvailableDateField = AvailableDateField + ','+dateFieldsMap.get(dts);
                    DateFieldApi = DateFieldApi +','+dts;
                }
            }
            Datei++;  
        }
        String varssdim = '{"query" : "q = load \\"'+DashId.Name+'/'+CurrentverId+'\\";q = group q by all;q = foreach q generate ';
        integer i=1;
        for(String Str : SetListDim){
        if(SetListDim.size() <= i){
            varssdim += 'unique(\''+Str+'\') as \''+Str+'\''; 
        }
        else{
            varssdim += 'unique(\''+Str+'\') as \''+Str+'\',';  
        } 
            i++;
        }
        varssdim += ';q = limit q 2000;"}';
        varssdim = varssdim.replace(',;',';');             
        // system.debug('vars*************'+vars);  
        httpResponse Res1;
        map<String,integer> Mapvalues = new map<string,integer>();
        String SessionIds = userInfo.getsessionId();
        if(!Test.isRunningTest()){
            Res1 =  KPI_DashboardService.Dim_createDashboardss(varssdim,SessionId);   
            if(Res1.getStatus() == 'OK'){
                DimensionMeasurefromJSON  payTypesss = new DimensionMeasurefromJSON();
                payTypesss = DimensionMeasurefromJSON.parse(Res1.getBody());
                for(DimensionMeasurefromJSON.cls_columns Rep : payTypesss.results.metadata[0].columns){
                    Map<String,Object> m1 = (Map<String,Object>) JSON.deserializeUntyped(res1.getBody());
                    Map<String,Object> posts = (Map<String,Object>)m1.get('results');    
                    list<Object> replies = (list<Object>)posts.get('records');
                    for( Object o1 : replies) {
                        Map<String, Object> newCast = (Map<String, Object>)o1;
                        integer con = (integer)newCast.get(Rep.name);
                        if(con > 0){
                            values.add(new InnerClass(Rep.name,con));
                            Mapvalues.put(Rep.name,con);
                        }
                    }
                }
                values.sort();
            }
        }
        String vars = '{"query" : "q = load \\"'+DashId.Name+'/'+CurrentverId+'\\";';   
        integer m=1;
        for(InnerClass Str : values){
            if(Str.value > 0){
            vars+= 'q'+m+' = group q by \''+Str.Name+'\';q'+m+' = foreach q'+m+' generate \''+Str.Name+'\' as \''+Str.Name+'\', count() as \'numberone\';q'+m+' = foreach q'+m+' generate sum(\'numberone\') as \'numberone\';';
                m++;
            }
        }
        vars+= 'final = group q by \'all\'';                    
        integer k=1;
         for(InnerClass Str : values){
            if(Str.value > 0){ 
                vars+= ', q'+k+' by \'all\'';
                k++;
            }
        }
        vars+= ';final = foreach final generate ';
        integer l=1;
         for(InnerClass Str : values){
            if(Str.value > 0){
                if(SetListDim.size() <= l){
                    vars+= '(sum(q'+l+'.\'numberone\') / count(\'q\')) * 100 as \''+Str.Name+'\'';
                }
                else{
                   vars+= '(sum(q'+l+'.\'numberone\') / count(\'q\')) * 100 as \''+Str.Name+'\','; 
                }
                l++;
            }
        }
        vars+= ';"}';
        vars = vars.replace(',;',';');
        
         system.debug('vars ***********'+ vars);
        httpResponse Res = new httpResponse();
        if(!Test.isRunningTest())
            Res =  KPI_DashboardService.Dim_createDashboards(vars,SessionId);   
            system.debug('getBody ***********' + Res.getBody());
            if(Res.getStatus() == 'OK'){
                DimensionMeasurefromJSON  NumpayTypesss = new DimensionMeasurefromJSON();
                NumpayTypesss = DimensionMeasurefromJSON.parse(Res.getBody());
                for(DimensionMeasurefromJSON.cls_columns Reps : NumpayTypesss.results.metadata[0].columns){
                    Map<String,Object> m2 = (Map<String,Object>) JSON.deserializeUntyped(Res.getBody());
                    Map<String,Object> posts1 = (Map<String,Object>)m2.get('results');
                    list<Object> replies = (list<Object>)posts1.get('records');
                    for( Object o11 : replies) {
                        Map<String, Object> newCasts = (Map<String, Object>)o11;
                        integer con = (integer)integer.valueof(newCasts.get(Reps.name));
                        InnerClassResultList.add(new InnerClassResult(Reps.name,mapvalues.get(Reps.name),con));
                    }
                }
            }
            InnerClassResultList.sort();
            
            AvailableDimension = '';
            DimensionApi = '';
            FilterDimensionApi = '';
            //integer Datei= 1;
            list<Dashboard_Automation__c> Autdatlst = [select Cardinality_Greater_than__c,
                                        Cardinality_Less_Than__c,
                                        Max_of_Fields__c,
                                        Utilization__c 
                                        from Dashboard_Automation__c];
            set<String> Newlist = new set<string>();
           system.debug('InnerClassResultList ***********' + InnerClassResultList.size());
           
            for(Dashboard_Automation__c dtSl : Autdatlst){
                integer lm = 1;
                for(InnerClassResult Inn :InnerClassResultList){
                     system.debug('Inn.newvalue *************'+ Inn.newvalue + ' dtSl '+ dtSl.Max_of_Fields__c + ' Inn.value '+Inn.value );
                           
                    if(Inn.value > dtSl.Cardinality_Greater_than__c && Inn.value < dtSl.Cardinality_Less_Than__c  && Inn.values > dtSl.Utilization__c && dtSl.Max_of_Fields__c >= lm && !Newlist.contains(DimensionFieldsMap.get(Inn.Name)) && Newlist.size() <= 8){
                        if(AvailableDimension == ''){
                            AvailableDimension = DimensionFieldsMap.get(Inn.Name);
                            DimensionApi = Inn.Name;
                            FilterDimensionApi = Inn.Name;
                        }
                        else{
                            AvailableDimension = AvailableDimension + ','+DimensionFieldsMap.get(Inn.Name);
                            DimensionApi = DimensionApi +','+Inn.Name;
                        }
                        Newlist.add(DimensionFieldsMap.get(Inn.Name));
                        lm = lm+1;
                    }
                } 
            }                   
            integer j=1;
            String varss = '{"query" : "q = load \\"'+DashId.Name+'/'+CurrentverId+'\\";q = group q by all;q = foreach q generate ';
            for(String St:SetListMeas){
                if(!St.contains('epoch')){
                    if(SetListMeas.size() <= j){
                       varss += 'unique(\''+St+'\') as \''+St+'\'';  
                    }
                    else{
                       varss += 'unique(\''+St+'\') as \''+St+'\',';   
                    }
                    
                }
                j++;
            }                
            varss += ';q = limit q 2000;"}';
            varss = varss.replace(',;',';');            
            integer n=1;
            /*String varssmin = '{"query" : "q = load \\"'+DashId.Name+'/'+CurrentverId+'\\";q = group q by all;q = foreach q generate ';
            for(String St:SetListMeas){
                if(!St.contains('epoch')){
                    if(SetListMeas.size() <= n){
                       varssmin += 'min(\''+St+'\') as \''+St+'\'';  
                    }
                    else{
                       varssmin += 'min(\''+St+'\') as \''+St+'\',';   
                    }           
                }
                n++;
            }        
            varssmin += ';q = limit q 2000;"}';
            varssmin = varssmin.replace(',;',';');*/
            httpResponse ResMes = new httpResponse();  
            if(!Test.isRunningTest())
                ResMes = KPI_DashboardService.Meas_createDashboardss(varss,SessionId);             
                if(ResMes.getStatus() == 'OK'){     
                    DimensionMeasurefromJSON  payTypess = new DimensionMeasurefromJSON();
                    payTypess = DimensionMeasurefromJSON.parse(ResMes.getBody());                
                    for(DimensionMeasurefromJSON.cls_columns Rep : payTypess.results.metadata[0].columns){
                        Map<String,Object> m2 = (Map<String,Object>) JSON.deserializeUntyped(ResMes.getBody());
                        Map<String,Object> posts1 = (Map<String,Object>)m2.get('results');                     
                        list<Object> replies = (list<Object>)posts1.get('records');
                        for( Object o11 : replies) {
                            Map<String, Object> newCasts = (Map<String, Object>)o11;
                            integer con = (integer)integer.valueof(newCasts.get(Rep.name));
                            MeasureStringMap.put(Rep.name,con); 
                            MeasInnerClassResultList.add(new MeasInnerClassResult(Rep.name,con,con));
                        }
                    }
                    //httpResponse ResMess   = new httpResponse();
                    //if(!Test.isRunningTest())
                        //ResMess =KPI_DashboardService.Meas_createDashboardss(varssmin,SessionId);   
                        /*if(ResMess.getStatus() == 'OK'){                 
                            DimensionMeasurefromJSON  payTypessMess = new DimensionMeasurefromJSON();
                            payTypessMess = DimensionMeasurefromJSON.parse(ResMess.getBody());     
                            for(DimensionMeasurefromJSON.cls_columns Rep : payTypessMess.results.metadata[0].columns){
                                Map<String,Object> m2 = (Map<String,Object>) JSON.deserializeUntyped(ResMess.getBody());
                                Map<String,Object> posts1 = (Map<String,Object>)m2.get('results');                            
                                list<Object> replies = (list<Object>)posts1.get('records');
                                for( Object o11 : replies) {
                                    Map<String, Object> newCasts = (Map<String, Object>)o11;
                                    integer con = (integer)integer.valueof(newCasts.get(Rep.name));
                                    MeasInnerClassResultList.add(new MeasInnerClassResult(Rep.name,MeasureStringMap.get(Rep.name),con));
                                    system.debug('MeasInnerClassResultList@@@@@@@@@@@ '+MeasInnerClassResultList);
                                }       
                            }                                    
                        }*/
                    }              
                    list<Dashboard_Automation__c> Autdatlsts = [select  Id,Cardinality_Measure__c,
                                                                    Utilization_Measure__c 
                                                                    from Dashboard_Automation__c where Measure_Number__c = 2 limit 1];                                                                  
                    list<MeasInnerClassResult> MeasInnerClassResultListone = new list<MeasInnerClassResult>();
                    for(MeasInnerClassResult Mes :MeasInnerClassResultList ){
                        if(Autdatlsts.size() > 0){
                            if(Mes.value > Autdatlsts[0].Cardinality_Measure__c /*&& Mes.values > Autdatlsts[0].Utilization_Measure__c*/){
                                MeasInnerClassResultListone.add(new MeasInnerClassResult(Mes.Name,Mes.value,Mes.values));
                            }
                        }
                    }
                    integer vals = MeasInnerClassResultListone.size();
                    AvailableMeasure = '';
                    MeasureAPI = '';
                    AliasMeasureAPIN = '';
                    CompactMeasureAPIN = '';  
                    
                    list<Measure_Requirements__c> Measdatlst = new list<Measure_Requirements__c>();
                    list<Measure_Requirements__c> MeasdatlstsDup= new list<Measure_Requirements__c>();
                    if(Autdatlsts.size() > 0)
                     MeasdatlstsDup = [select  id,operator__c,Measure_Number__c from Measure_Requirements__c where Dashboard_Automation__c=: Autdatlsts[0].Id];
                
                system.debug('MeasdatlstsDup@@@@@@@@ '+MeasdatlstsDup); 
               String MeasIds = '';
               for(Measure_Requirements__c Meas :MeasdatlstsDup){
                   if(Measids == ''){
                       system.debug('Meas.operator__c@@@@@@@ '+Meas.operator__c+'Meas.Measure_Number__c@@@@@@@ '+Meas.Measure_Number__c);
                       if(Meas.operator__c == 'equals to' && Meas.Measure_Number__c == vals){
                           MeasIds = Meas.Id;
                       }
                       else if(Meas.operator__c == 'less than' && Meas.Measure_Number__c == vals){
                           MeasIds = Meas.Id;
                       }
                       else if(Meas.operator__c == 'greater than' && Meas.Measure_Number__c == vals){
                           MeasIds = Meas.Id;
                       }
                       else if(Meas.operator__c == 'less than equals to' && vals <= Meas.Measure_Number__c ){
                           MeasIds = Meas.Id;
                       }
                       else if(Meas.operator__c == 'greater than equals to' && vals >= Meas.Measure_Number__c){
                           MeasIds = Meas.Id;
                       }
                   }
               }
               system.debug('MeasIds@@@@@@@@@@ '+MeasIds);
               Measdatlst = [select  Field_1__c,Field_2__c,Field_3__c,Field_4__c,Field_5__c,
                                                              Value_1__c,Value_2__c,Value_3__c,Value_4__c,Value_5__c
                                                              from Measure_Requirements__c where id =: Measids limit 1];
                 

                    if(MeasInnerClassResultListone.size() <= 0 || Measdatlst.size() <= 0){                      
                        AvailableMeasure =  'count(Rows)';
                        AliasMeasureAPIN = 'count';
                        MeasureAPI = 'count()';
                        CompactMeasureAPIN = '[\\"count\\",\\"*\\"]';                             
                    } 
                    else if(MeasInnerClassResultListone.size() > 0 && Measdatlst.size() > 0){
                        system.debug('MeasInnerClassResultListone.size ********' + MeasInnerClassResultListone.size());
                            for(integer w=0;w<=MeasInnerClassResultListone.size();w++){  
                             j= w-1;
                            if(Measdatlst[0].Value_1__c == String.valueof(w) && Measdatlst[0].Field_1__c != 'none' && Measdatlst[0].Field_1__c != ''){
                                if(Measdatlst[0].Value_1__c !=  '0'){
                                    AvailableMeasure +=  Measdatlst[0].Field_1__c+'('+MeasInnerClassResultListone[j].Name+'),';
                                    AliasMeasureAPIN +=  Measdatlst[0].Field_1__c+'_'+MeasInnerClassResultListone[j].Name+',';
                                    MeasureAPI += Measdatlst[0].Field_1__c+'(\''+MeasInnerClassResultListone[j].Name+'\'),';
                                    CompactMeasureAPIN += '[\\"'+Measdatlst[0].Field_1__c + '\\",\\"'+ MeasInnerClassResultListone[j].Name + '\\"],';
                                }
                                else{
                                    AvailableMeasure +=  'count(Rows),';
                                    AliasMeasureAPIN +=  'count,';
                                    MeasureAPI += 'count(),';
                                    CompactMeasureAPIN += '[\\"count\\",\\"*\\"],';
                                }
                      
                            }
                    }   
                    for(integer w=0;w<=MeasInnerClassResultListone.size();w++){     
                    j= w-1;
                        if(Measdatlst[0].Value_2__c == String.valueof(w) && Measdatlst[0].Field_2__c != 'none' && Measdatlst[0].Field_2__c != ''){
                            if(Measdatlst[0].Value_2__c !=  '0'){
                                AvailableMeasure +=  Measdatlst[0].Field_2__c+'('+MeasInnerClassResultListone[j].Name+'),';
                                AliasMeasureAPIN +=  Measdatlst[0].Field_2__c+'_'+MeasInnerClassResultListone[j].Name+',';
                                MeasureAPI += Measdatlst[0].Field_2__c+'(\''+MeasInnerClassResultListone[j].Name+'\'),';
                                CompactMeasureAPIN += '[\\"'+Measdatlst[0].Field_2__c + '\\",\\"'+ MeasInnerClassResultListone[j].Name + '\\"],';
                            }
                            else{
                                AvailableMeasure +=  'count(Rows),';
                                AliasMeasureAPIN +=  'count,';
                                MeasureAPI += 'count(),';
                                CompactMeasureAPIN += '[\\"count\\",\\"*\\"],';
                            }
                  
                        }
                    }
                    
                    for(integer w=0;w<=MeasInnerClassResultListone.size();w++){     
                    j= w-1;
                        if(Measdatlst[0].Value_3__c == String.valueof(w) && Measdatlst[0].Field_3__c != 'none' && Measdatlst[0].Field_3__c != ''){
                            if(Measdatlst[0].Value_3__c !=  '0'){
                                AvailableMeasure +=  Measdatlst[0].Field_3__c+'('+MeasInnerClassResultListone[j].Name+'),';
                                AliasMeasureAPIN +=  Measdatlst[0].Field_3__c+'_'+MeasInnerClassResultListone[j].Name+',';
                                MeasureAPI += Measdatlst[0].Field_3__c+'(\''+MeasInnerClassResultListone[j].Name+'\'),';
                                CompactMeasureAPIN += '[\\"'+Measdatlst[0].Field_3__c + '\\",\\"'+ MeasInnerClassResultListone[j].Name + '\\"],';
                            }
                            else{
                                AvailableMeasure +=  'count(Rows),';
                                AliasMeasureAPIN +=  'count,';
                                MeasureAPI += 'count(),';
                                CompactMeasureAPIN += '[\\"count\\",\\"*\\"],';
                            }
                        }
                    }
                    
                    for(integer w=0;w<=MeasInnerClassResultListone.size();w++){ 
                    j= w-1; 
                        if(Measdatlst[0].Value_4__c == String.valueof(w) && Measdatlst[0].Field_4__c != 'none' && Measdatlst[0].Field_4__c != ''){
                            if(Measdatlst[0].Value_4__c !=  '0' ){
                                AvailableMeasure +=  Measdatlst[0].Field_4__c+'('+MeasInnerClassResultListone[j].Name+'),';
                                AliasMeasureAPIN +=  Measdatlst[0].Field_4__c+'_'+MeasInnerClassResultListone[j].Name+',';
                                MeasureAPI += Measdatlst[0].Field_4__c+'(\''+MeasInnerClassResultListone[j].Name+'\'),';
                                CompactMeasureAPIN += '[\\"'+Measdatlst[0].Field_4__c + '\\",\\"'+ MeasInnerClassResultListone[j].Name + '\\"],';
                            }
                            else{
                                AvailableMeasure +=  'count(Rows),';
                                AliasMeasureAPIN +=  'count,';
                                MeasureAPI += 'count(),';
                                CompactMeasureAPIN += '[\\"count\\",\\"*\\"],';
                            }
                        }
                    }
                    for(integer w=0;w<=MeasInnerClassResultListone.size();w++){ 
                    j= w-1;
                        if(Measdatlst[0].Value_5__c == String.valueof(w) && Measdatlst[0].Field_5__c != 'none' && Measdatlst[0].Field_5__c != ''){
                            if(Measdatlst[0].Value_5__c !=  '0'){
                                AvailableMeasure +=  Measdatlst[0].Field_5__c+'('+MeasInnerClassResultListone[j].Name+'),';
                                AliasMeasureAPIN +=  Measdatlst[0].Field_5__c+'_'+MeasInnerClassResultListone[j].Name+',';
                                MeasureAPI += Measdatlst[0].Field_5__c+'(\''+MeasInnerClassResultListone[j].Name+'\'),';
                                CompactMeasureAPIN += '[\\"'+Measdatlst[0].Field_5__c + '\\",\\"'+ MeasInnerClassResultListone[j].Name + '\\"],';
                            }
                            else{
                                AvailableMeasure +=  'count(Rows),';
                                AliasMeasureAPIN +=  'count,';
                                MeasureAPI += 'count(),';
                                CompactMeasureAPIN += '[\\"count\\",\\"*\\"],';
                            }
                            
                        }
                }
                        
                    } 
                    
                    AvailableMeasure = AvailableMeasure.removeEnd(',');
                    AliasMeasureAPIN = AliasMeasureAPIN.removeEnd(',');
                    MeasureAPI = MeasureAPI.removeEnd(',');
                    CompactMeasureAPIN = CompactMeasureAPIN.removeEnd(',');
                //  list<Measure_Requirements__c> Measdatlsts= [select  id,Field_3__c,Measure_Number__c,Field_4__c
                                                          //    from Measure_Requirements__c where Field_5__c =: 'Batch job' and Field_3__c =: SessionIds];
                 
                //  Measure_Requirements__c Measdatlsta= new Measure_Requirements__c();
                        
                    KPIs__c KPIs = new KPIs__c();                           
                    KPIs.RowNumber__c = DashId.value; 
                    KPIs.Dataset_Name__c = DashId.DBNames;
                    KPIs.Dataset_Id__c = DashId.Name; 
                   
                    KPIs.Date_Label__c = AvailableDateField; 
                    KPIs.Measure_Label__c = AvailableMeasure; 
                    if(FilterDimensionApi != null && FilterDimensionApi != ''){
                        KPIs.Filter_Logics__c = '\''+FilterDimensionApi+ '\' in all';
                    }
                    KPIs.KPI_Name__c = DashId.Dashname;
                    KPIs.Filter_Name__c = 'All';
                    KPIs.User_Logic__c = '1';
                    KPIs.AliasMeasure_API__c = AliasMeasureAPIN;
                    KPIs.CompactMeasure_API__c =  CompactMeasureAPIN; 
                    KPIs.Measure_API__c = MeasureAPI; 
                    
                    KPIs.Dimension_Name__c = AvailableDimension;  
                    KPIs.Dimension_API_Name__c = DimensionApi; 
                    
                    
                    KPIs.Date_API__c = DateFieldApi;
                    //KPIs.DB_Template__c = DatasetRec.Id;
                    KPIs.Filter_Code__c = '';
                    DatasetReclist.add(KPIs);
                    
                    Dataset__c DatasetRecs = new Dataset__c();
                    DatasetRecs.RowNumber__c = DashId.value; 
                    DatasetRecs.Dataset_Name__c = DashId.DBNames; 
                    DatasetRecs.Dataset_Id__c = DashId.Name;   
                    
                    DatasetRecs.New_Dimension_Name__c = AvailableDimension; 
                    DatasetRecs.New_Dimension_API__c = DimensionApi;
                    
                    DatasetRecs.Date_Label__c = AvailableDateField;    
                    DatasetRecs.Data_API__c = DateFieldApi; 
                    DatasetRecs.Measure_Name__c = AvailableMeasure; 
                    DatasetRecs.Measure_API__c = MeasureAPI; 
                    if(FilterDimensionApi != null && FilterDimensionApi != ''){
                        DatasetRecs.Filter_Logics__c = '\''+FilterDimensionApi+ '\' in all';
                    }
                    DatasetRecs.KPI_Name__c = DashId.Dashname;
                    DatasetRecs.FilterName__c = 'All';
                    DatasetRecs.UserLogic__c = '1';
                    DatasetRecs.Session_Id__c = SessionId;
                    DatasetRecs.AliasMeasure_API__c = AliasMeasureAPIN;
                    DatasetRecs.CompactMeasure_API__c = CompactMeasureAPIN;
                    DatasetRecords.add(DatasetRecs);
                    NewRow = NewRow+1;
                //  httpResponse SingleRes =  new httpResponse();          
                //  if(!Test.isRunningTest())
            }
            else{
                   KPIs__c KPIs = new KPIs__c();                            
                    KPIs.RowNumber__c = DashId.value; 
                    KPIs.Dataset_Name__c = DashId.DBNames;
                    KPIs.Dataset_Id__c = DashId.Name; 
                     
                    KPIs.Date_Label__c = AvailableDateField; 
                    KPIs.Measure_Label__c = AvailableMeasure; 
                    if(FilterDimensionApi != null && FilterDimensionApi != ''){
                        KPIs.Filter_Logics__c = '\''+FilterDimensionApi+ '\' in all';
                    }
                    KPIs.KPI_Name__c = DashId.Dashname;
                    KPIs.Filter_Name__c = 'All';
                    KPIs.User_Logic__c = '1';
                    KPIs.AliasMeasure_API__c = AliasMeasureAPIN;
                    KPIs.CompactMeasure_API__c =  CompactMeasureAPIN; 
                    KPIs.Measure_API__c = MeasureAPI; 
                    KPIs.Dimension_Name__c = AvailableDimension; 
                    KPIs.Dimension_API_Name__c = DimensionApi;
                    
                    
                    KPIs.Date_API__c = DateFieldApi;
                    //KPIs.DB_Template__c = DatasetRec.Id;
                    KPIs.Filter_Code__c = '';
                    DatasetReclist.add(KPIs);
                    
                    Dataset__c DatasetRecs = new Dataset__c();
                    DatasetRecs.RowNumber__c = DashId.value; 
                    DatasetRecs.Dataset_Name__c = DashId.DBNames; 
                    DatasetRecs.Dataset_Id__c = DashId.Name;   
                     DatasetRecs.New_Dimension_Name__c = AvailableDimension; 
                    DatasetRecs.New_Dimension_API__c = DimensionApi;
                   
                    DatasetRecs.Date_Label__c = AvailableDateField; 
                    DatasetRecs.Data_API__c = DateFieldApi; 
                    DatasetRecs.Measure_Name__c = AvailableMeasure; 
                    DatasetRecs.Measure_API__c = MeasureAPI; 
                    if(FilterDimensionApi != null && FilterDimensionApi != ''){
                    DatasetRecs.Filter_Logics__c = '\''+FilterDimensionApi+ '\' in all';
                    }
                    DatasetRecs.KPI_Name__c = DashId.Dashname;
                    DatasetRecs.FilterName__c = 'All';
                    DatasetRecs.UserLogic__c = '1';
                    DatasetRecs.Session_Id__c = SessionId;
                    DatasetRecs.AliasMeasure_API__c = AliasMeasureAPIN;
                    DatasetRecs.CompactMeasure_API__c = CompactMeasureAPIN;
                    DatasetRecords.add(DatasetRecs);
            }
        }
        System.debug('DashId.Name***************** '+DatasetReclist.size());
        list<Dataset__c> DelDatasetReclist = [select id,Session_Id__c,RowNumber__c from Dataset__c where Session_Id__c =: SessionId order by RowNumber__c];  
        if(Dataset__c.sObjectType.getDescribe().isDeletable()){
            Delete  DelDatasetReclist;
        }
        if(DatasetReclist.size() > 0 && !Test.isRunningTest()){
            insert DatasetRec;
            insert DatasetRecords;
            insert DatasetReclist;
            for(KPIS__C KC : DatasetReclist){
                KC.DB_Template__c = DatasetRec.Id;
            }
            update DatasetReclist;
            
            // pageReference Pg = new pageReference('/apex/MultiKPI_NewUI?dbid='+DatasetRec.Id);
            // //String Pg = DatasetRec.Id;
            // return Pg;
        }
        
       // pageReference Pg = new pageReference('/apex/MultiKPI_NewUI?dbid='+DatasetRec.Id);
       // pageReference Pg = new pageReference('/apex/MultiKPI_NewUI?secone='+AllSectionone+'&sectwo='+AllSectiontwo+'&secthree='+AllSectionthree+'&Allvaluesone='+AllString+'&Allvaluestwo='+AllStringone+'&Allvaluesthree='+AllStringtwo);
        return null;
        
    }
    
    public String sessionId{get;set;}
    public String AllSectionone;
    public String AllSectiontwo;
    public String AllSectionthree;
    public String DashboardName;
    
    public void saveandcloseopp(){
        saveAndCancelDashboard(1);
        MultiDtasets();
    }
    public boolean NewAccountClose{get;set;}
    public void buildDashboards(){
        if(accountBalance >= TotalCost){
        MultiDtasets();
        string dbsss = DatasetRec.Id;
        startpoller = true;
        
        list<String> FolderList = new list<String>();
        FolderList.add(strFloderId);
        FolderList.add(AllSectionone);
        FolderList.add(AllSectiontwo);
        FolderList.add(AllSectionthree);
        FolderList.add(SessionId);
       
        String ThemeValues = '';
        
        list<Json_class__c> Sales = [select id from Json_class__c where id=:DashAllval];
         if(Sales.Size() > 0){
            ThemeValues = Sales[0].Id;
        }
        else{
            Json_class__c JsonRec =  [select id from Json_class__c where Name='Default MultiKPI Theme' and Dashboard_Id__c = null and Dashboard_Id__c = ''];
            ThemeValues = JsonRec.Id;
        }
        
        submitbuildDashboards(DashboardName,FolderList,ThemeValues,SessionId,strFloderId,dbsss);
         NoAcccountbalance = false;
         NewAccountClose = true;
        }
        else{
            purchaseAndBuildDashboard('Not Enough Credits',1);
             NoAcccountbalance = true;
             NewAccountClose = false;
        }
    }
    
     @future(callout=true)
    public static void submitbuildDashboards(String DashboardName,list<string> Folderlist,String ThemeValues,String SessionId,String strFloderId,String DatasetsIds){
        
        

        String NewThemevalue = 'New Default Sales Insight';
        String ThemeValues1 = '';
        String ThemeValues2 = '';
        String ThemeValues3 = '';
        list<Json_class__c> Sales = [select id,Dashboard_Id__c from Json_class__c where id=:ThemeValues];
        
        list<Sales_Insight__c> ListSals1 = [select id,Name,Dashboard_Id__c  from Sales_Insight__c where Name = 'New Default Sales Insight' and Dashboard_Id__c = null and Dashboard_Id__c = '']; 
        if(Sales.size() > 0){
                list<Sales_Insight__c> ListSals2 = new list<Sales_Insight__c>();
            if(Sales[0].Dashboard_Id__c != null && Sales[0].Dashboard_Id__c != '')
            ListSals2 = [select id,Name,Dashboard_Id__c,Dashboard_Type__c  from Sales_Insight__c where Dashboard_Id__c =: Sales[0].Dashboard_Id__c]; 
            system.debug('ListSals2 ****************'+ListSals2);
            if(ListSals2.size()>0){
                for(Sales_Insight__c Sls : ListSals2){
                    if(Sls.Dashboard_Type__c == 'Sales Insights' || Sls.Dashboard_Type__c == 'Sales Insight'){
                        ThemeValues1 = Sls.Id;
                    }
                   
                    if(Sls.Dashboard_Type__c == 'Success Insight'){
                        ThemeValues2 = Sls.Id;
                    }
                  
                    if(Sls.Dashboard_Type__c == 'Marketing Insight'){
                        ThemeValues3 = Sls.Id;
                    }
                    
                }
            }
            else{
                ThemeValues1= ListSals1[0].id;
                ThemeValues2= ListSals1[0].id;
                ThemeValues3= ListSals1[0].id;
            }
            system.debug('ListSals2 ****************'+ThemeValues1);
            system.debug('ThemeValues2 ****************'+ThemeValues2);
            system.debug('ThemeValues3 ****************'+ThemeValues3);
        }
        else{
            ThemeValues1= ListSals1[0].id;
            ThemeValues2= ListSals1[0].id;
            ThemeValues3= ListSals1[0].id;
        }
        list<String> FolderList1 = new list<String>();
        FolderList1.add(strFloderId);
        FolderList1.add(FolderList[1]);
        FolderList1.add(SessionId);
        FolderList1.add(FolderList[2]);
        FolderList1.add(FolderList[3]);
        
        
        list<String> FolderList2 = new list<String>();
        FolderList2.add(strFloderId);
        FolderList2.add(FolderList[2]);
        FolderList2.add(SessionId);
        FolderList2.add(FolderList[1]);
        FolderList2.add(FolderList[3]);
        
        
        list<String> FolderList3 = new list<String>();
        FolderList3.add(strFloderId);
        FolderList3.add(FolderList[3]);
        FolderList3.add(SessionId);
        FolderList3.add(FolderList[1]);
        FolderList3.add(FolderList[2]);
         httpResponse Res1 = new httpResponse();
         httpResponse Res2 = new httpResponse();
         
            httpResponse Res3 = new httpResponse();
        string posts1 = '';
        string posts2 = '';
        string posts3 = '';
        String SessionIds = SessionId;
        String SessionIds1 = SessionId;
        String SessionIds2 = SessionId;
        if(!Test.isRunningTest()){
            Res1 = KPI_DashboardSalesService.m_createDashboard(FolderList1[1],FolderList1,ThemeValues1,NewThemevalue,SessionIds); 
            if(Res1.getStatus() == 'Created'){
                Map<String,Object> m2 = (Map<String,Object>) JSON.deserializeUntyped(Res1.getBody());
                posts1 = (string)m2.get('id');
            }
            //System.debug('AllDashboards sales ***********' + Res1.getBody());
            
            Res2 = KPI_DashboardSuccessFilter.m_createDashboard(FolderList2[1],FolderList2,ThemeValues2,NewThemevalue,SessionIds1);
            if(Res2.getStatus() == 'Created'){
                Map<String,Object> m2 = (Map<String,Object>) JSON.deserializeUntyped(Res2.getBody());
                posts2 = (string)m2.get('id');
            }
            //System.debug('AllDashboards succ***********' + Res2.getBody());
            
            Res3 = KPI_DashboardMarketingService.m_createDashboard(FolderList3[1],FolderList3,ThemeValues3,NewThemevalue,SessionIds2);
            //System.debug('AllDashboards Mar***********' + Res3.getBody());
             if(Res3.getStatus() == 'Created'){
                  Map<String,Object> m2 = (Map<String,Object>) JSON.deserializeUntyped(Res3.getBody());
                posts3 = (string)m2.get('id');
            }
        }
        FolderList.add(posts1);
        FolderList.add(posts2);
        FolderList.add(posts3);
        
        httpResponse Res = new httpResponse();
        Res = KPI_DashboardService.Build_createDashboard(DashboardName,FolderList,ThemeValues,SessionId); 
        
        list<Measure_Requirements__c> Measdatlsts= [select  id,Field_3__c,Measure_Number__c,Field_4__c from Measure_Requirements__c where Field_5__c =: 'Future Method'];
             String Allvaluestrue = '';   
             Measure_Requirements__c Measdatlsta= new Measure_Requirements__c();
             if(!Test.isRunningTest()){
             if(Res.getStatus() == 'Created'){
                 
                   Map<String,Object> m2 = (Map<String,Object>) JSON.deserializeUntyped(Res.getBody());
                    String posts4 = (string)m2.get('id');
                     FolderList1.add(posts1);
                     FolderList1.add(posts2);
                     FolderList1.add(posts3);
                     FolderList1.add(posts4);
                     
                     FolderList2.add(posts1);
                     FolderList2.add(posts2);
                     FolderList2.add(posts3);
                     FolderList2.add(posts4);
                     
                     FolderList3.add(posts1);
                     FolderList3.add(posts2);
                     FolderList3.add(posts3);
                     FolderList3.add(posts4);
                     
                     if(posts1 != Null && posts1 != ''){
                        httpResponse Res5 = new httpResponse();
                        Res5 = KPI_DashboardMarketingService.DUp_createDashboard(FolderList1[1],FolderList1,ThemeValues1,NewThemevalue,SessionIds,posts1,'Sales');
                     }
                     if(posts2 != Null && posts2 != ''){
                        httpResponse Res6 = new httpResponse();
                        Res6 = KPI_DashboardMarketingService.DUp_createDashboard(FolderList2[1],FolderList2,ThemeValues2,NewThemevalue,SessionIds1,posts2,'Success');
                     }
                     if(posts3 != Null && posts3 != ''){
                        httpResponse Res7 = new httpResponse();
                        Res7 = KPI_DashboardMarketingService.DUp_createDashboard(FolderList3[1],FolderList3,ThemeValues3,NewThemevalue,SessionIds2,posts3,'Market');
                     }
                //   System.debug('Posts1*********** '+posts1+' Posts2*********** '+posts2+' Posts3***********'+posts3+' Posts4***********'+posts4);
                //     System.debug('AllDashboards APR***********' + Res5.getBody());
                //      System.debug('AllDashboards APR***********' + Res6.getBody());
                //       System.debug('AllDashboards APR***********' + Res7.getBody());
                 Allvaluestrue = 'true';               
                 Measdatlsta.Field_2__c = Allvaluestrue;
                 Measdatlsta.Field_4__c = posts4;
              } 
              else{
                  Allvaluestrue = 'false';
                  Measdatlsta.Field_2__c = Allvaluestrue;
              }
             Measdatlsta.Field_5__c = 'Future Method';
             if(Measdatlsts.size() <= 0){
                insert Measdatlsta;
             }
             if(Measdatlsts.size()> 0){
                 Measdatlsta.Id = Measdatlsts[0].id;
                 update Measdatlsta;
             }
             }
    }
     
     public boolean startpoller{get;set;}
     public string Truevalue{get;set;}
     public pageReference NewClone(){
         startpoller = true;
        list<Measure_Requirements__c> Measdatlsts= [select  id,Field_2__c,Field_4__c,Field_1__c
                                                              from Measure_Requirements__c where Field_5__c =: 'Future Method' limit 1 ]; 
             if(Measdatlsts.size() > 0){
                  if(Measdatlsts[0].Field_2__c == 'true'){
                     DashboardDB = true; 
                     DashboardSales = false;
                     
                     
                     
                     List<ApexClass> classes = [Select Name From ApexClass Where Name = 'TouchAnalytics_UIClass' limit 1];
                        if(classes.size() > 0){
                            list<AsyncApexJob> aaj = [SELECT Id, Status, TotalJobItems, NumberOfErrors FROM AsyncApexJob WHERE ApexClassID =: classes[0].id order by createddate desc limit 1]; 
                            if(aaj.size() > 0){
                                if(aaj[0].status == 'completed'){
                                    DashboardSuccess = true;
                                    purchaseAndBuildDashboard('Purchase & Build',1);
                                    startpoller = false;
                                                        System.debug('AllDashboards APR***********' +  Measdatlsts[0].Field_4__c );
                                     Truevalue = Measdatlsts[0].Field_4__c;
                                                         pageReference Pg = new pageReference('/apex/MultiKPI_NewUI?dbid='+DatasetRec.Id+'&&Success=true&&Truevalue='+Truevalue);
                                     pg.setRedirect(true);
                                     return Pg;
                                                 }
                                        }
                        }
                     
                  }
                 else if(Measdatlsts[0].Field_2__c == 'false'){
                    DashboardDB = false;
                    DashboardSales = true;
                    DashboardSuccess = false;
                    startpoller = false; 
                     purchaseAndBuildDashboard('Failed',1);
                 }
                 else{
                     DashboardDB = true;
                     DashboardSales = false;
                  DashboardSuccess = false;
                 }
                 if(Schema.sObjectType.Measure_Requirements__c.fields.Field_2__c.isUpdateable()){
                    Measdatlsts[0].Field_2__c = '';
                    update Measdatlsts;
                 }    
              }
              else{
                  DashboardDB = true;
                  DashboardSales = false;
                  DashboardSuccess = false;
              }
              return null;
     }
    public class InnerClass implements Comparable{
        public String Name;
        public integer value;
        public innerclass(String Name,integer value){
            this.Name = Name;
            this.value = value;
        }
        
        public Integer compareTo(Object ObjToCompare) {
             innerclass compareToEmp = (innerclass)ObjToCompare;
            if (value == compareToEmp.value) return 0;
            if (value > compareToEmp.value) return 1;
            return -1;        
            }
    }
    
    
    public class InnerClassResult implements Comparable{
        public String Name;
        public integer value;
        public integer values;
        public integer newvalue = 0;
        public InnerClassResult(String Name,integer value,integer values){
            this.Name = Name;
            this.value = value;
            this.values = values;
        }
        
         public Integer compareTo(Object ObjToCompare) {
             InnerClassResult compareToEmp = (InnerClassResult)ObjToCompare;
            if (Integer.valueof(values) == Integer.valueof(compareToEmp.values)) return 0;
            if (Integer.valueof(values) < Integer.valueof(compareToEmp.values)) return 1;
            return -1;        
            }
    }
    
    public class DatasClassResult implements Comparable{
        public String Name;
        public integer value;
        public string Dashurl;
        public string Dashname;
        public String DBNames;
        public DatasClassResult(String Name,integer value,string Dashurl,string Dashname,String DBNames){
            this.Name = Name;
            this.value = value;
             this.Dashurl = Dashurl;
            this.Dashname = Dashname;
            this.DBNames = DBNames;
        }
        
        public Integer compareTo(Object ObjToCompare) {
            return Name.CompareTo(((DatasClassResult)ObjToCompare).Name);
        }  
    }
    
    
    public class MeasInnerClassResult{
        public String Name;
        public integer value;
        public integer values;
        public MeasInnerClassResult(String Name,integer value,integer values){
            this.Name = Name;
            this.value = value;
            this.values = values;
        }
    }
    
    public String DashAllval{get;set;}
     public list<selectoption> DashNewListopt{get;set;}
     public string strFloderId{get; set;}
    public List<SelectOption> getFloderList{get;set;} 
    public void ActNamings(){
        DashNewListopt = new list<selectoption>();
        list<Json_class__c> ListJson = [select id,Name,Dashboard_Id__c  from Json_class__c where Name = 'Default MultiKPI Theme' and Dashboard_Id__c = null and Dashboard_Id__c = '']; 
        for(Json_class__c js :ListJson){
            DashNewListopt.add(new SelectOption(js.id,js.Name));
        }
        list<Json_class__c> ListJson1 = [select id,Name,Dashboard_Id__c  from Json_class__c where Dashboard_Type__c = 'Command' and Name != 'Default MultiKPI Theme' and Dashboard_Id__c != null and Dashboard_Id__c != ''];
        for(Json_class__c js1 :ListJson1){
            DashNewListopt.add(new SelectOption(js1.id,js1.Name));
        }
        DashAllval = 'Default MultiKPI Theme';
        
    }
     
     public String ConfigName{get;set;}
     public String ConfigId{get;set;}
     public String Description{get;set;}
     public void saveConfig(){
         ConfigName = System.currentPageReference().getParameters().get('HiddenConfig');
         Description = System.currentPageReference().getParameters().get('HiddenDesc');
         ConfigId = System.currentPageReference().getParameters().get('HiddenConfigId');
         //for(DB_Template__c DBList : DBTemplates){
         DB_Template__c DBLists= new DB_Template__c();
         DBLists.DB_Name__c = ConfigName;
         
         DBLists.id = ConfigId;
         update DBLists;
         for(Templateclass DBList : Templatelist){
             system.debug('Configuration Id '+DBList.DBTemplates.Id);
             if(ConfigId == DBList.DBTemplates.Id){
               DBList.DBTemplates.DB_Name__c = ConfigName;
               
            }
         }
         
             
         //}
     }
     
     
     public void saveManage(){
         ConfigName = System.currentPageReference().getParameters().get('HiddenConfig');
         String Type = System.currentPageReference().getParameters().get('HiddenDesc');
         ConfigId = System.currentPageReference().getParameters().get('HiddenConfigId');
         //for(DB_Template__c DBList : DBTemplates){
         if(Type == 'Multi'){
             Json_class__c Jcs = new Json_class__c();
             Jcs.Name = ConfigName;
             Jcs.Id = ConfigId;
             update Jcs;
         }
         else{
              Sales_Insight__c Jcs = new Sales_Insight__c();
             Jcs.Name = ConfigName;
             Jcs.Id = ConfigId;
             update Jcs;
         }
         
         String SingleMulties ; 
        if(SingleMultis == 'Single KPI'){
            SingleMulties = 'Insights';
        }
        else if(SingleMultis == 'Multi KPI'){
            SingleMulties = 'Command';
        }
        else if(SingleMultis == 'Snapshot KPI'){
            SingleMulties = 'Compare';
        }
        else if(SingleMultis == 'Actual/Target'){
            SingleMulties = 'Contrast';
        }
        else{
            SingleMulties = SingleMultis;
        }
         
         if(SingleMultis == 'All' && CreatedUsersAll == 'All'){
            Multilist =  [select Id,Name,Dashboard_Type__c,CreatedDate,CreatedBy.Name,Dashboard_Id__c  from Json_class__c where  Dashboard_Id__c != null order By createddate desc limit 300];
        }
        else if(SingleMultis != 'All' && CreatedUsersAll == 'All'){
            Multilist =  [select Id,Name,Dashboard_Type__c,CreatedDate,CreatedBy.Name,Dashboard_Id__c  from Json_class__c where Dashboard_Type__c =:SingleMulties and Dashboard_Id__c != null order By createddate desc limit 300];
            
        }
        else if(SingleMultis == 'All' && CreatedUsersAll != 'All'){
            Multilist =  [select Id,Name,Dashboard_Type__c,CreatedDate,CreatedBy.Name,Dashboard_Id__c  from Json_class__c  where createdbyId =:CreatedUsersAll and Dashboard_Id__c != null order By createddate desc limit 300];
            
        }
        else if(SingleMultis != 'All' && CreatedUsersAll != 'All'){
            Multilist =  [select Id,Name,Dashboard_Type__c,CreatedDate,CreatedBy.Name,Dashboard_Id__c  from Json_class__c  where Dashboard_Type__c =:SingleMulties and createdbyId =:CreatedUsersAll and Dashboard_Id__c != null order By createddate desc limit 300];
            
        }
        if(SingleMultis == 'All' && CreatedUsersAll == 'All'){
            Managelists =  [select Id,Name,Dashboard_Type__c,CreatedDate,CreatedBy.Name,Dashboard_Id__c  from Sales_Insight__c where  Dashboard_Id__c != null and Dashboard_Type__c != 'Sales Insights' and Dashboard_Type__c != 'Sales Insight' and Dashboard_Type__c != 'Marketing Insight' and Dashboard_Type__c != 'Success Insight' order By createddate desc limit 700];
        }
        else if(SingleMultis != 'All' && CreatedUsersAll == 'All'){
            Managelists =  [select Id,Name,Dashboard_Type__c,CreatedDate,CreatedBy.Name,Dashboard_Id__c  from Sales_Insight__c where Dashboard_Type__c =:SingleMulties and Dashboard_Id__c != null order By createddate desc limit 700];
            
        }
        else if(SingleMultis == 'All' && CreatedUsersAll != 'All'){
            Managelists =  [select Id,Name,Dashboard_Type__c,CreatedDate,CreatedBy.Name,Dashboard_Id__c  from Sales_Insight__c  where createdbyId =:CreatedUsersAll and Dashboard_Id__c != null and Dashboard_Type__c != 'Sales Insights' and Dashboard_Type__c != 'Sales Insight' and Dashboard_Type__c != 'Marketing Insight' and Dashboard_Type__c != 'Success Insight' order By createddate desc limit 700];
            
        }
        else if(SingleMultis != 'All' && CreatedUsersAll != 'All'){
            Managelists =  [select Id,Name,Dashboard_Type__c,CreatedDate,CreatedBy.Name,Dashboard_Id__c  from Sales_Insight__c  where Dashboard_Type__c =:SingleMulties and createdbyId =:CreatedUsersAll and Dashboard_Id__c != null order By createddate desc limit 700];
            
        }
         
         //}
     }
     
     public void UncheckBox(){
         for(DatasetInnerclass datasetInnerclasslist : NewDatasetInnerclassList){
             datasetInnerclasslist.DrillBoxOne = false;
             datasetInnerclasslist.DrillBoxTwo = false;
             datasetInnerclasslist.DrillBoxThree = false;
         }
     }
    
      public String CloneNames{get;set;}
      public pageReference SaveCloneTheme(){
      
      String CloneThemeId = System.currentPageReference().getParameters().get('hiddenCloneThemeId');
      String CloneThemeName = System.currentPageReference().getParameters().get('hiddenCloneThemeName');
      
      if(CloneNames != null && CloneNames != ''){
       String DBName = CloneNames;
       
       String NewStrings='';
       String NewStringsone='';
       String NewStringstwo='';
       String NewStringsthree='';
       String DatasetType;
       Sales_Insight__c sales = new Sales_Insight__c();
       Json_class__c jsons = new Json_class__c();
         if(CloneThemeName == 'Insights'){
             Sales = [select id,Sales_Insight_String1__c,Sales_insight_String2__c,Dashboard_Id__c,Sales_Insight_String3__c,Sales_Insight_String4__c from Sales_Insight__c where Id = :CloneThemeId limit 1];
            DatasetType = 'Insights';
            String Str = userInfo.getSessionId();
             HttpResponse hRes = SingleKPI_DashboardService.retriveDashboardFile(Sales.Dashboard_Id__c, Str);
             if(hRes.getStatus() == 'OK'){
                 String responseBody= hRes.getBody();
                 String[] responseBodylists = responseBody.split('"state":');
                 responseBody =  '{ "folder" : { "id" : "00l28000001VoU1AAK" },"label" : "Copy of Single DB Template","state" : ' + responseBodylists[1];
                 responseBody = responseBody.replace(',"type":"dashboard",','');
                 responseBody = responseBody.replace('"url":"/services/data/v41.0/wave/dashboards/'+Sales.Dashboard_Id__c+'"','');
                 responseBody  = responseBody.replace('&quot;','\\"');
                // responseBody = responseBody.replaceAll('\\s+\\s+','#testcode#').replaceAll('#testcode#',' ');
                 system.debug('responseBody *********'+ responseBody);
                 NewStrings = responseBody;
             }
            //NewStrings = NewStringval();
         }else if(CloneThemeName == 'Compare'){
             Sales = [select id,Sales_Insight_String1__c,Dashboard_Id__c,Sales_insight_String2__c,Sales_Insight_String3__c,Sales_Insight_String4__c from Sales_Insight__c where Id = :CloneThemeId limit 1];
            DatasetType = 'Compare';
            String Str = userInfo.getSessionId();
             HttpResponse hRes = SingleKPI_DashboardService.retriveDashboardFile(Sales.Dashboard_Id__c, Str);
             if(hRes.getStatus() == 'OK'){
                 String responseBody= hRes.getBody();
                 String[] responseBodylists = responseBody.split('"state":');
                 responseBody =  '{ "folder" : { "id" : "00l28000001VoU1AAK" },"label" : "Copy of Single DB Template","state" : ' + responseBodylists[1];
                 responseBody = responseBody.replace(',"type":"dashboard",','');
                 responseBody = responseBody.replace('"url":"/services/data/v41.0/wave/dashboards/'+Sales.Dashboard_Id__c+'"','');
                 responseBody  = responseBody.replace('&quot;','\\"');
                // responseBody = responseBody.replaceAll('\\s+\\s+','#testcode#').replaceAll('#testcode#',' ');
                 system.debug('responseBody *********'+ responseBody);
                 NewStrings = responseBody;
             }
            //NewStrings = NewStringval1();
         }else if(CloneThemeName == 'Contrast'){
            Sales = [select id,Sales_Insight_String1__c,Dashboard_Id__c,Sales_insight_String2__c,Sales_Insight_String3__c,Sales_Insight_String4__c from Sales_Insight__c where Id = :CloneThemeId limit 1];
            DatasetType = 'Contrast';
            String Str = userInfo.getSessionId();
             HttpResponse hRes = SingleKPI_DashboardService.retriveDashboardFile(Sales.Dashboard_Id__c, Str);
             if(hRes.getStatus() == 'OK'){
                 String responseBody= hRes.getBody();
                 String[] responseBodylists = responseBody.split('"state":');
                 responseBody =  '{ "folder" : { "id" : "00l28000001VoU1AAK" },"label" : "Copy of Single DB Template","state" : ' + responseBodylists[1];
                 responseBody = responseBody.replace(',"type":"dashboard",','');
                 responseBody = responseBody.replace('"url":"/services/data/v41.0/wave/dashboards/'+Sales.Dashboard_Id__c+'"','');
                 responseBody  = responseBody.replace('&quot;','\\"');
                // responseBody = responseBody.replaceAll('\\s+\\s+','#testcode#').replaceAll('#testcode#',' ');
                 system.debug('responseBody *********'+ responseBody);
                 NewStrings = responseBody;
             }
            //NewStrings = NewStringval2();
            //system.debug('@@@@@@@@@@@@@@@@'+NewStrings);
         }else if(CloneThemeName == 'Command'){
            jsons = [select id,analyticscc__Json1__c,analyticscc__Dashboard_Type__c,analyticscc__Json_Measure_List__c,analyticscc__Json_FilterLabel_Delete__c,analyticscc__Sales_Filter1__c,analyticscc__Sales_Filter2__c,analyticscc__Sales_Filter3__c,analyticscc__Sales_Filter4__c,analyticscc__Sales_Filter5__c,analyticscc__Json_String__c,
                                            analyticscc__Json_Pillbox__c,analyticscc__Json_String_Toggle__c,analyticscc__Json_Full_pillbox__c,analyticscc__Json_Pillbox_comma__c,analyticscc__Json_Pillbox1__c,analyticscc__Json_Pillbox2__c,analyticscc__Json_Section1__c,analyticscc__Json_Section2__c,analyticscc__Json_section3__c,
                                            analyticscc__Json_Measure__c,analyticscc__Json_listselector__c,analyticscc__Json_ListSelector1__c,analyticscc__Json_Selector_Date__c,analyticscc__Json_listselector_Date2__c,analyticscc__Json_KPI__c,analyticscc__Json_Number__c,analyticscc__Json_Number1__c,analyticscc__Json_list_Measure__c,
                                            analyticscc__Json_List_Selector2__c,analyticscc__Json_Selector3__c,analyticscc__Json_MeasureLabel_Delete__c,analyticscc__Success_Filter1__c,analyticscc__Success_Filter2__c,analyticscc__Success_Filter3__c,analyticscc__Success_Filter4__c,analyticscc__Success_Filter5__c,
                                            analyticscc__Json_Pillbox5__c,analyticscc__Json_KPI_1__c,analyticscc__Market__c,analyticscc__Market_Filter1__c,analyticscc__Market_Filter2__c,analyticscc__Market_Filter3__c,analyticscc__Market_Filter4__c,
                                            analyticscc__Json_Selector38__c,analyticscc__Filter5_deleted__c,analyticscc__Chart_Delete_marketing__c,analyticscc__Chart_Delete_marketing1__c,analyticscc__Json_Static_Measure__c,analyticscc__List_Selector35__c,analyticscc__Chart_Delete_Success__c,analyticscc__Chart_Delete_Success1__c,
                                            analyticscc__Json2__c,analyticscc__Json_KPI_2__c,analyticscc__Chart_Delete_Row__c,analyticscc__Json3__c,analyticscc__Success_KPI_1__c,analyticscc__Success_Timeline__c,analyticscc__Json4__c,analyticscc__Success_KPI_2__c,analyticscc__Sales_Timeline__c,analyticscc__Json_Del__c,analyticscc__Success_KPI_3__c,analyticscc__Marketing_Timeline__c,analyticscc__Json_Filter__c,analyticscc__Success_KPI_4__c,analyticscc__Json_Last_Dataset__c,analyticscc__Success_KPI_5__c,
                                            analyticscc__Json_Filter_Remove__c,analyticscc__Chart_Delete__c,analyticscc__Dashboard_Id__c
                                            from analyticscc__Json_class__c where Id = :CloneThemeId limit 1];
            DatasetType = 'Command';
            String Str = userInfo.getSessionId();
             HttpResponse hRes = SingleKPI_DashboardService.retriveDashboardFile(jsons.Dashboard_Id__c, Str);
             if(hRes.getStatus() == 'OK'){
                 String responseBody= hRes.getBody();
                 String[] responseBodylists = responseBody.split('"state":');
                 responseBody =  '{ "folder" : { "id" : "00l28000001VoU1AAK" },"label" : "Copy of Single DB Template","state" : ' + responseBodylists[1];
                 responseBody = responseBody.replace(',"type":"dashboard",','');
                 responseBody = responseBody.replace('"url":"/services/data/v41.0/wave/dashboards/'+jsons.Dashboard_Id__c+'"','');
                 responseBody  = responseBody.replace('&quot;','\\"');
                // responseBody = responseBody.replaceAll('\\s+\\s+','#testcode#').replaceAll('#testcode#',' ');
                 system.debug('responseBody *********'+ responseBody);
                 NewStrings = responseBody;
             }
            //NewStrings = NewStringval3();
            
             Sales = [SELECT  Name,DataSet_Delete__c,Sales_Insight_String5__c,Measures_Delete__c,Sales_insight_String1__c,Grouping_label_Delete__c,
                            Sales_insight_String2__c,Sales_insight_String3__c,Sales_insight_String4__c,Grouping_Delete__c 
                            FROM Sales_Insight__c
                            where Name='New Default Sales Insight' limit 1];
            DatasetType = 'Sales Insights';
            
            list<Sales_Insight__c> SalesIds = [SELECT  Name,Dashboard_Id__c FROM Sales_Insight__c where Dashboard_Id__c =:jsons.analyticscc__Dashboard_Id__c and (Dashboard_Type__c = 'Sales Insights' or Dashboard_Type__c = 'Sales Insight')]; 
            list<Sales_Insight__c> SalesIds1 = [SELECT  Name,Dashboard_Id__c FROM Sales_Insight__c where Dashboard_Id__c =:jsons.analyticscc__Dashboard_Id__c and Dashboard_Type__c = 'Success Insight']; 
            list<Sales_Insight__c> SalesIds2 = [SELECT  Name,Dashboard_Id__c FROM Sales_Insight__c where Dashboard_Id__c =:jsons.analyticscc__Dashboard_Id__c and Dashboard_Type__c = 'Marketing Insight']; 
            
            if(SalesIds.size() > 0){
                //String Str = userInfo.getSessionId();
             HttpResponse hRes1 = SingleKPI_DashboardService.retriveDashboardFile(SalesIds[0].Name, Str);
             if(hRes1.getStatus() == 'OK'){
                 String responseBody= hRes1.getBody();
                 String[] responseBodylists = responseBody.split('"state":');
                 responseBody =  '{ "folder" : { "id" : "00l28000001VoU1AAK" },"label" : "Copy of Single DB Template","state" : ' + responseBodylists[1];
                 responseBody = responseBody.replace(',"type":"dashboard",','');
                 responseBody = responseBody.replace('"url":"/services/data/v41.0/wave/dashboards/'+SalesIds[0].Name+'"','');
                 responseBody  = responseBody.replace('&quot;','\\"');
                // responseBody = responseBody.replaceAll('\\s+\\s+','#testcode#').replaceAll('#testcode#',' ');
                 system.debug('responseBody *********'+ responseBody);
                 NewStringsone = responseBody;
             }
               
            }
            if(SalesIds1.size() > 0){
                 // String Str = userInfo.getSessionId();
             HttpResponse hRes2 = SingleKPI_DashboardService.retriveDashboardFile(SalesIds1[0].Name, Str);
             if(hRes2.getStatus() == 'OK'){
                 String responseBody= hRes2.getBody();
                 String[] responseBodylists = responseBody.split('"state":');
                 responseBody =  '{ "folder" : { "id" : "00l28000001VoU1AAK" },"label" : "Copy of Single DB Template","state" : ' + responseBodylists[1];
                 responseBody = responseBody.replace(',"type":"dashboard",','');
                 responseBody = responseBody.replace('"url":"/services/data/v41.0/wave/dashboards/'+SalesIds1[0].Name+'"','');
                 responseBody  = responseBody.replace('&quot;','\\"');
                // responseBody = responseBody.replaceAll('\\s+\\s+','#testcode#').replaceAll('#testcode#',' ');
                 system.debug('responseBody *********'+ responseBody);
                 NewStringstwo = responseBody;
             }
            }
            if(SalesIds2.size() > 0){
                 // String Str = userInfo.getSessionId();
             HttpResponse hRes3 = SingleKPI_DashboardService.retriveDashboardFile(SalesIds2[0].Name, Str);
             if(hRes3.getStatus() == 'OK'){
                 String responseBody= hRes3.getBody();
                 String[] responseBodylists = responseBody.split('"state":');
                 responseBody =  '{ "folder" : { "id" : "00l28000001VoU1AAK" },"label" : "Copy of Single DB Template","state" : ' + responseBodylists[1];
                 responseBody = responseBody.replace(',"type":"dashboard",','');
                 responseBody = responseBody.replace('"url":"/services/data/v41.0/wave/dashboards/'+SalesIds2[0].Name+'"','');
                 responseBody  = responseBody.replace('&quot;','\\"');
                // responseBody = responseBody.replaceAll('\\s+\\s+','#testcode#').replaceAll('#testcode#',' ');
                 system.debug('responseBody *********'+ responseBody);
                 NewStringsthree = responseBody;
             }
            }
            if(!Test.isRunningTest())
            NewStrings = NewStrings.replace(SalesIds2[0].Name,'0FK36000000UlJrGAK').replace(SalesIds1[0].Name,'0FK36000000UlJmGAK').replace(SalesIds[0].Name,'0FK36000000UlKpGAK');
            //NewStringsone = NewStringval4();
            //NewStringstwo = NewStringval5();
            //NewStringsthree = NewStringval6();
            //system.debug('@@@@@@@@@@@@@@@@'+NewStrings);
         }
        
           String SalesId = '';
           String SuccesssId = '';
           String MarketId = '';
          //String NewStrings = NewStringval();
          if(CloneThemeName == 'Command'){
                NewStringsone = NewStringsone.replace('Copy of Single DB Template',Dbname+' Drill 1').replace('00l28000001VoU1AAK',userInfo.getuserId());
                 NewStringsone = NewStringsone.replaceAll('"destination": "NewDashboardBuilderTwo",','').replaceAll('"destination": "NewDashboardBuilderFour",','');
                NewStringsone = NewStringsone.replaceAll('"destination": "NewDashboardBuilderThree",','').replaceAll('"destination": "NewDashboardBuilderOne",','');
                httpResponse Res = new httpResponse();
                if(!Test.isRunningTest())
                Res = TouchAnalytics_UIClass.m_createSingleDashboard(NewStringsone);
                 dashbocreatejson payTypes = new dashbocreatejson();
                String Datesetvalues = res.getBody();   
                if(Datesetvalues != null && Datesetvalues != ''){ 
                     payTypes = dashbocreatejson.parse(Datesetvalues);
                } 
                SalesId = payTypes.Id;
                
                NewStringstwo = NewStringstwo.replace('Copy of Single DB Template',Dbname+' Drill2').replace('00l28000001VoU1AAK',userInfo.getuserId());
                  NewStringstwo = NewStringstwo.replaceAll('"destination": "NewDashboardBuilderTwo",','').replaceAll('"destination": "NewDashboardBuilderFour",','');
                NewStringstwo = NewStringstwo.replaceAll('"destination": "NewDashboardBuilderThree",','').replaceAll('"destination": "NewDashboardBuilderOne",','');
               
                httpResponse Res1 = new httpResponse();
                if(!Test.isRunningTest())
                Res1 = TouchAnalytics_UIClass.m_createSingleDashboard(NewStringstwo);
                 dashbocreatejson payTypes1 = new dashbocreatejson();
                String Datesetvalues1 = Res1.getBody();   
                if(Datesetvalues1 != null && Datesetvalues1 != ''){ 
                     payTypes1 = dashbocreatejson.parse(Datesetvalues1);
                } 
                SuccesssId = payTypes1.Id;
                
                NewStringsthree = NewStringsthree.replace('Copy of Single DB Template',Dbname+' Drill3').replace('00l28000001VoU1AAK',userInfo.getuserId());
                   NewStringsthree = NewStringsthree.replaceAll('"destination": "NewDashboardBuilderTwo",','').replaceAll('"destination": "NewDashboardBuilderFour",','');
                NewStringsthree = NewStringsthree.replaceAll('"destination": "NewDashboardBuilderThree",','').replaceAll('"destination": "NewDashboardBuilderOne",','');
               
                httpResponse Res2 = new httpResponse();
                if(!Test.isRunningTest())
                Res2 = TouchAnalytics_UIClass.m_createSingleDashboard(NewStringsthree);
                 dashbocreatejson payTypes2 = new dashbocreatejson();
                String Datesetvalues2 = Res2.getBody();   
                if(Datesetvalues2 != null && Datesetvalues2 != ''){ 
                     payTypes2 = dashbocreatejson.parse(Datesetvalues2);
                } 
                MarketId = payTypes2.Id;        
                
                
          }
          else{
          }
          NewStrings = NewStrings.replace('Copy of Single DB Template',Dbname).replace('00l28000001VoU1AAK',userInfo.getuserId());
          if(!Test.isRunningTest())
          NewStrings = NewStrings.replace('0FK36000000UlJrGAK',MarketId).replace('0FK36000000UlJmGAK',SuccesssId).replace('0FK36000000UlKpGAK',SalesId);
          
          httpResponse Res = new httpResponse();
          
          if(!Test.isRunningTest())
            Res = TouchAnalytics_UIClass.m_createSingleDashboard(NewStrings); 
          
          system.debug('MultiKPI Res *********'+ res.getBody());
          if(res.getStatus() == 'Created'){
                dashbocreatejson payTypes = new dashbocreatejson();
                String Datesetvalues = res.getBody();   
                if(Datesetvalues != null && Datesetvalues != ''){ 
                     payTypes = dashbocreatejson.parse(Datesetvalues);
                } 
                String Newstr;
                if(payTypes != null){
                    Newstr = payTypes.assetSharingUrl;
                }
                Sales_Insight__c  Sl = new Sales_Insight__c();
                sl.Name= DBName ;
                Json_class__c j1 = new Json_class__c();
                j1.Name = DBName;
               
                if(payTypes != null){
                    if(CloneThemeName != 'Command' && CloneThemeName != 'Sales Insights'){
                        sl.Dashboard_Id__c = payTypes.id;
                        sl.Sales_Insight_String1__c = Sales.Sales_Insight_String1__c;
                        sl.Sales_Insight_String2__c = Sales.Sales_Insight_String2__c;
                        sl.Sales_Insight_String3__c = Sales.Sales_Insight_String3__c;
                        sl.Sales_Insight_String4__c = Sales.Sales_Insight_String4__c;
                        sl.Dashboard_Type__c = DatasetType;
                        insert Sl;
                        //Sales.Dashboard_Type__c = 'Insights';
                        //update Sales;
                        
                    }else if(CloneThemeName == 'Command' ){
                        j1.analyticscc__Dashboard_Id__c = payTypes.id;
                        j1.analyticscc__Json1__c = jsons.analyticscc__Json1__c;
                        j1.analyticscc__Json_Pillbox__c = jsons.analyticscc__Json_Pillbox__c;
                        j1.analyticscc__Json_String_Toggle__c = jsons.analyticscc__Json_String_Toggle__c;
                        j1.analyticscc__Json_Full_pillbox__c = jsons.analyticscc__Json_Full_pillbox__c;
                        j1.analyticscc__Json_Pillbox_comma__c = jsons.analyticscc__Json_Pillbox_comma__c;
                        j1.analyticscc__Json_Pillbox1__c = jsons.analyticscc__Json_Pillbox1__c;
                        j1.analyticscc__Json_Pillbox2__c = jsons.analyticscc__Json_Pillbox2__c;
                        j1.analyticscc__Json_Section1__c = jsons.analyticscc__Json_Section1__c;
                        j1.analyticscc__Json_Section2__c = jsons.analyticscc__Json_Section2__c;
                        j1.analyticscc__Json_section3__c = jsons.analyticscc__Json_section3__c;
                        j1.analyticscc__Json_Measure__c = jsons.analyticscc__Json_Measure__c;
                        j1.analyticscc__Json_listselector__c = jsons.analyticscc__Json_listselector__c;
                        j1.analyticscc__Json_ListSelector1__c = jsons.analyticscc__Json_ListSelector1__c;
                        j1.analyticscc__Json_Selector_Date__c = jsons.analyticscc__Json_Selector_Date__c;
                        j1.analyticscc__Json_listselector_Date2__c = jsons.analyticscc__Json_listselector_Date2__c;
                        j1.analyticscc__Json_KPI__c = jsons.analyticscc__Json_KPI__c;
                        j1.analyticscc__Json_Number__c = jsons.analyticscc__Json_Number__c;
                        j1.analyticscc__Json_Number1__c = jsons.analyticscc__Json_Number1__c;
                        j1.analyticscc__Json_list_Measure__c = jsons.analyticscc__Json_list_Measure__c;
                        j1.analyticscc__Json_List_Selector2__c = jsons.analyticscc__Json_List_Selector2__c;
                        j1.analyticscc__Json_Selector3__c = jsons.analyticscc__Json_Selector3__c;
                        j1.analyticscc__Json_MeasureLabel_Delete__c = jsons.analyticscc__Json_MeasureLabel_Delete__c;
                        j1.analyticscc__Success_Filter1__c = jsons.analyticscc__Success_Filter1__c;
                        j1.analyticscc__Success_Filter2__c = jsons.analyticscc__Success_Filter2__c;
                        j1.analyticscc__Success_Filter3__c = jsons.analyticscc__Success_Filter3__c;
                        j1.analyticscc__Success_Filter4__c = jsons.analyticscc__Success_Filter4__c;
                        j1.analyticscc__Success_Filter5__c = jsons.analyticscc__Success_Filter5__c;
                        j1.analyticscc__Json_Measure_List__c = jsons.analyticscc__Json_Measure_List__c;
                        j1.analyticscc__Json_FilterLabel_Delete__c = jsons.analyticscc__Json_FilterLabel_Delete__c;
                        j1.analyticscc__Sales_Filter1__c = jsons.analyticscc__Sales_Filter1__c;
                        j1.analyticscc__Sales_Filter2__c = jsons.analyticscc__Sales_Filter2__c;
                        j1.analyticscc__Sales_Filter3__c = jsons.analyticscc__Sales_Filter3__c;
                        j1.analyticscc__Sales_Filter4__c = jsons.analyticscc__Sales_Filter4__c;
                        j1.analyticscc__Sales_Filter5__c = jsons.analyticscc__Sales_Filter5__c;
                        j1.analyticscc__Json_Pillbox5__c = jsons.analyticscc__Json_Pillbox5__c;
                        j1.analyticscc__Json_KPI_1__c = jsons.analyticscc__Json_KPI_1__c;
                        j1.analyticscc__Market__c = jsons.analyticscc__Market__c;
                        j1.analyticscc__Market_Filter1__c = jsons.analyticscc__Market_Filter1__c;
                        j1.analyticscc__Market_Filter2__c = jsons.analyticscc__Market_Filter2__c;
                        j1.analyticscc__Market_Filter3__c = jsons.analyticscc__Market_Filter3__c;
                        j1.analyticscc__Market_Filter4__c = jsons.analyticscc__Market_Filter4__c;
                        j1.analyticscc__Json_Selector38__c = jsons.analyticscc__Json_Selector38__c;
                        j1.analyticscc__Filter5_deleted__c = jsons.analyticscc__Filter5_deleted__c;
                        j1.analyticscc__Chart_Delete_marketing__c = jsons.analyticscc__Chart_Delete_marketing__c;
                        j1.analyticscc__Chart_Delete_marketing1__c = jsons.analyticscc__Chart_Delete_marketing1__c;
                        j1.analyticscc__Json_Static_Measure__c = jsons.analyticscc__Json_Static_Measure__c;
                        j1.analyticscc__List_Selector35__c = jsons.analyticscc__List_Selector35__c;
                        j1.analyticscc__Chart_Delete_Success__c = jsons.analyticscc__Chart_Delete_Success__c;
                        j1.analyticscc__Chart_Delete_Success1__c = jsons.analyticscc__Chart_Delete_Success1__c;
                        j1.analyticscc__Json2__c = jsons.analyticscc__Json2__c;
                        j1.analyticscc__Json_KPI_2__c = jsons.analyticscc__Json_KPI_2__c;
                        j1.analyticscc__Chart_Delete_Row__c = jsons.analyticscc__Chart_Delete_Row__c;
                        j1.analyticscc__Json3__c = jsons.analyticscc__Json3__c;
                        j1.analyticscc__Success_KPI_1__c = jsons.analyticscc__Success_KPI_1__c;
                        j1.analyticscc__Success_Timeline__c = jsons.analyticscc__Success_Timeline__c;
                        j1.analyticscc__Json4__c = jsons.analyticscc__Json4__c;
                        j1.analyticscc__Success_KPI_2__c = jsons.analyticscc__Success_KPI_2__c;
                        j1.analyticscc__Sales_Timeline__c = jsons.analyticscc__Sales_Timeline__c;
                        j1.analyticscc__Json_Del__c = jsons.analyticscc__Json_Del__c;
                        j1.analyticscc__Success_KPI_3__c = jsons.analyticscc__Success_KPI_3__c;
                        j1.analyticscc__Marketing_Timeline__c = jsons.analyticscc__Marketing_Timeline__c;
                        j1.analyticscc__Json_Filter__c = jsons.analyticscc__Json_Filter__c;
                        j1.analyticscc__Success_KPI_4__c = jsons.analyticscc__Success_KPI_4__c;
                        j1.analyticscc__Json_Last_Dataset__c = jsons.analyticscc__Json_Last_Dataset__c;
                        j1.analyticscc__Success_KPI_5__c = jsons.analyticscc__Success_KPI_5__c;
                        j1.analyticscc__Json_Filter_Remove__c = jsons.analyticscc__Json_Filter_Remove__c;
                        j1.analyticscc__Chart_Delete__c = jsons.analyticscc__Chart_Delete__c;
                        j1.analyticscc__Json_FilterLabel_Delete__c = jsons.analyticscc__Json_FilterLabel_Delete__c;
                        j1.analyticscc__Sales_Filter1__c = jsons.analyticscc__Sales_Filter1__c;
                        j1.analyticscc__Sales_Filter2__c = jsons.analyticscc__Sales_Filter2__c;
                        j1.analyticscc__Sales_Filter3__c = jsons.analyticscc__Sales_Filter3__c;
                        j1.analyticscc__Sales_Filter4__c = jsons.analyticscc__Sales_Filter4__c;
                        j1.analyticscc__Sales_Filter5__c = jsons.analyticscc__Sales_Filter5__c;
                        j1.analyticscc__Json_Measure_List__c = jsons.analyticscc__Json_Measure_List__c;
                        j1.analyticscc__Dashboard_Type__c = 'Command';
                        j1.analyticscc__Json_String__c = jsons.analyticscc__Json_String__c;
                        insert j1;
                        
                        Sl = new Sales_Insight__c();
                        sl.Name= SalesId ;
                        sl.Dashboard_Id__c = payTypes.id;
                        sl.Sales_Insight_String1__c = Sales.Sales_Insight_String1__c;
                        sl.Sales_Insight_String2__c = Sales.Sales_Insight_String2__c;
                        sl.Sales_Insight_String3__c = Sales.Sales_Insight_String3__c;
                        sl.Sales_Insight_String4__c = Sales.Sales_Insight_String4__c;
                        sl.Sales_Insight_String5__c = Sales.Sales_Insight_String5__c;
                        sl.DataSet_Delete__c = Sales.DataSet_Delete__c;
                        sl.Grouping_Delete__c = Sales.Grouping_Delete__c;
                        sl.Grouping_label_Delete__c = Sales.Grouping_label_Delete__c;
                        sl.Measures_Delete__c = Sales.Measures_Delete__c;
                        sl.Dashboard_Type__c = 'Sales Insights';
                        insert sl;
                        
                        Sales_Insight__c sl1 = new Sales_Insight__c();
                        sl1.Name= SuccesssId;
                        sl1.Dashboard_Id__c = payTypes.id;
                        sl1.Sales_Insight_String1__c = Sales.Sales_Insight_String1__c;
                        sl1.Sales_Insight_String2__c = Sales.Sales_Insight_String2__c;
                        sl1.Sales_Insight_String3__c = Sales.Sales_Insight_String3__c;
                        sl1.Sales_Insight_String4__c = Sales.Sales_Insight_String4__c;
                        sl1.Sales_Insight_String5__c = Sales.Sales_Insight_String5__c;
                        sl1.DataSet_Delete__c = Sales.DataSet_Delete__c;
                        sl1.Grouping_Delete__c = Sales.Grouping_Delete__c;
                        sl1.Grouping_label_Delete__c = Sales.Grouping_label_Delete__c;
                        sl1.Measures_Delete__c = Sales.Measures_Delete__c;
                        sl1.Dashboard_Type__c = 'Success Insight';
                        insert sl1;
                        
                        Sales_Insight__c sl2 = new Sales_Insight__c();
                        sl2.Name= MarketId ;
                        sl2.Dashboard_Id__c = payTypes.id;
                        sl2.Sales_Insight_String1__c = Sales.Sales_Insight_String1__c;
                        sl2.Sales_Insight_String2__c = Sales.Sales_Insight_String2__c;
                        sl2.Sales_Insight_String3__c = Sales.Sales_Insight_String3__c;
                        sl2.Sales_Insight_String4__c = Sales.Sales_Insight_String4__c;
                        sl2.Sales_Insight_String5__c = Sales.Sales_Insight_String5__c;
                        sl2.DataSet_Delete__c = Sales.DataSet_Delete__c;
                        sl2.Grouping_Delete__c = Sales.Grouping_Delete__c;
                        sl2.Grouping_label_Delete__c = Sales.Grouping_label_Delete__c;
                        sl2.Measures_Delete__c = Sales.Measures_Delete__c;
                        sl2.Dashboard_Type__c = 'Marketing Insight';
                        insert sl2;
                    }
                    else if(CloneThemeName == 'Sales Insights' ){
                       
                    }
                    
                }
                
                
                pageReference pr = new pageReference(Newstr);
                pr.setRedirect(true);
                return pr;
        }
      }
      else{
           //Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.ERROR, 'You Must Enter Value'));  
            return null;
      }
        return null;
    }
    
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
    
   // public builKPIjoeytest(){
       
   // }
    
    
    public void booleanConnections(){
        isConnect = false;
        isCheckAccount = false; 
        isCheckContact = false;
    }
    public void buildSelected(){
        
        try{
            selectedDashboard = System.currentPageReference().getParameters().get('getProductName');
            system.debug('selectedDashboard *************'+ selectedDashboard);
            if(selectedDashboard != 'Select'){
                if(buildCostMap.get(selectedDashboard) != null){
                    getBulidCost();
                }
                if(CouponValue != null && CouponValue != 0){
                    TotalCost = BuildCost - CouponValue;
                }
                else{
                    TotalCost = BuildCost;
                }
                CreditsRemaining = accountBalance - TotalCost;
            }
            else{
                BuildCost = null;
                CouponValue = null;
                TotalCost = null;
                CreditsRemaining = null;
            }
        }
        catch(Exception exp){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, '' + exp.getmessage());
            ApexPages.addMessage(myMsg);
        }
    }
    
    public void getCouponInformation(){
        try{
            if(CouponCode != null && CouponCode != '' && selectedDashboard != null && selectedDashboard != ''){
                String query = 'select Id,Discount__c from Coupon__c where Name = \''+ CouponCode + '\' and ((Product__c = \''+ selectedDashboard + '\') OR (Any_Product__c = true)) and Active__c = true';
                SFDCApiUtil.couponResponseClass verifyCoupon = SFDCApiUtil.getCouponInformation(sessionIds, serverURL, query);
                 CouponCodeId = verifyCoupon.couponId;
                if(verifyCoupon.response){
                    if(verifyCoupon.discount != null){
                        CouponValue = (BuildCost * verifyCoupon.discount) / 100;
                        TotalCost = BuildCost - CouponValue;
                        CreditsRemaining = accountBalance - TotalCost;
                    }
                }
                else{
                    CouponCodeId = '';
                    TotalCost = BuildCost;
                    CreditsRemaining = accountBalance - TotalCost;
                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, '' + verifyCoupon.responsemessage);
                    ApexPages.addMessage(myMsg);
                }
                
            }
        }
        catch(Exception exp){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, '' + exp.getmessage());
            ApexPages.addMessage(myMsg);
        }
    }
    
    public void getBulidCost(){
        try{
            if(selectedDashboard != null && selectedDashboard != ''){
                String query = 'select Id,UnitPrice from PricebookEntry where  Product2Id = \''+ selectedDashboard + '\' and IsActive = true limit 1';
                SFDCApiUtil.buildResponseClass verifyBuild = SFDCApiUtil.getBuildCostformation(sessionIds, serverURL, query);
                if(verifyBuild.response){
                        //String RemoveId = System.currentPageReference().getParameters().get('SalesNumbersval');
                    if(verifyBuild.listPrice != null){
                        BuildCost = integer.valueOf(verifyBuild.listPrice);
                    }
                    if(verifyBuild.priceBookId != null){
                        priceBookId = verifyBuild.pricebookId;
                    }
                   
                    // ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Pricebook Id ' + verifyBuild.pricebookId + 'BuildCost '+ BuildCost);
                    // ApexPages.addMessage(myMsg);

                }
                else{

                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'PriceBook Error' + verifyBuild.responsemessage);
                    ApexPages.addMessage(myMsg);
                }
            }
        }
        catch(Exception exp){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, '' + exp.getmessage());
            ApexPages.addMessage(myMsg);
        }
    }    
    public string sessionIds;
    public void connectToSFDC(){
        system.debug('Sample Response @@@@@@@@@@@');
        SFDCApiUtil.connectResponseClass connectResponse = SFDCApiUtil.connectToSFDC();
        system.debug('Connection Response @@@@@@@@@@@@ '+connectResponse.response);
        if(connectResponse.response){
            sessionIds = connectResponse.sessionId;
            serverURL = connectResponse.responseServerUrl;
            //  ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, '' + connectResponse);
            //  ApexPages.addMessage(myMsg);
            booleanConnections();
            isCheckAccount = true;
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
                recordDetails.put('Email__c', userData.Email);
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
    
    
    public string OpportunityStage{get;set;}
    public pageReference saveAndCancelDashboard(integer Allsets){
        String recordTypeName = 'ISV App Debit';
        String query = 'select id from recordType where name = \''+ recordTypeName + '\'';
        SFDCApiUtil.verifyResponseClass verifyRecordType = SFDCApiUtil.verifyDetails(sessionIds, serverURL, query);
        if(verifyRecordType.response){
            if(verifyRecordType.hasDetails){
                recordTypeId = verifyRecordType.recordId;
                // ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'recordType ' + recordTypeId);
                // ApexPages.addMessage(myMsg);
                OpportunityStage = 'Save & Cancel';
                saveOpportunity(Allsets);
                
            }

        }
        else{
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'RecordType ' + verifyRecordType.responsemessage);
            ApexPages.addMessage(myMsg);
            return null;
        }
        return null;
    }    
    
    public boolean NoAcccountbalance{get;set;}
    public void purchaseAndBuildDashboard(String FiledValue,integer Allsets){
        // system.debug(accountBalance + ' *************  '+ TotalCost);
        // if(accountBalance >= TotalCost){  
        String recordTypeName = 'ISV App Debit';
        String query = 'select id from recordType where name = \''+ recordTypeName + '\'';
        SFDCApiUtil.verifyResponseClass verifyRecordType = SFDCApiUtil.verifyDetails(sessionIds, serverURL, query);
        if(verifyRecordType.response){
            if(verifyRecordType.hasDetails){
                recordTypeId = verifyRecordType.recordId;
                // ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'recordType ' + recordTypeId);
                // ApexPages.addMessage(myMsg);
                OpportunityStage = FiledValue;
                saveOpportunity(Allsets);
                
            }

        }
        else{
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'RecordType ' + verifyRecordType.responsemessage);
            ApexPages.addMessage(myMsg);
            
        }
        //  NoAcccountbalance = false;
         
        // }
        // else{
        //   NoAcccountbalance = true;
           
        // }
        
    }    
    
    public void saveOpportunity(integer AllSets){
        Map<String, String> recordDetails = new Map<String, String>();
        recordDetails.put('Name', UserInfo.getOrganizationName());
        recordDetails.put('AccountId', accountRecId);
        recordDetails.put('Primary_Contact__c', contactRecId);
        recordDetails.put('StageName', OpportunityStage);
        recordDetails.put('recordTypeId', recordTypeId);
        recordDetails.put('CloseDate', string.valueOf(date.today()));
        SFDCApiUtil.createResponseClass createOpportunity = SFDCApiUtil.createOpportunity(sessionIds, serverURL,'Opportunity', recordDetails);
                if(createOpportunity.response){
                    opportunityRecId = createOpportunity.recordId;
                    saveOpportunityLineItem(AllSets);
                    //  ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Opportunity  Record Id' + createOpportunity.recordId);
                    // ApexPages.addMessage(myMsg);
                    
                   
                }
                else{
                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Opportunity ' + createOpportunity.responsemessage);
                    ApexPages.addMessage(myMsg);
                    
                }
               
    }
    public void saveOpportunityLineItem(integer AllSets){
        Map<String, String> recordDetails = new Map<String, String>();
        recordDetails.put('OpportunityId', opportunityRecId);
        recordDetails.put('Quantity', string.valueOf(AllSets));
        recordDetails.put('PriceBookEntryId',priceBookId);
        // recordDetails.put('Product2Id',selectedDashboard);
        recordDetails.put('Unitprice',string.valueOf(BuildCost/AllSets));
        if(CouponCodeId != '' && CouponCodeId != null){
            recordDetails.put('Coupon__c',CouponCodeId);
        }
  
        system.debug('opportunityRecId '+ opportunityRecId + 'PriceBookEntryId '+ priceBookId + ' Product2Id '+ selectedDashboard + ' BuildCost '+ string.valueOf(BuildCost));
        SFDCApiUtil.createResponseClass createOpportunityLineItem = SFDCApiUtil.createOpportunityLineItem(sessionIds, serverURL,'OpportunityLineItem', recordDetails);
                system.debug('createOpportunityLineItem ****' + createOpportunityLineItem.response);
                if(createOpportunityLineItem.response){
                    opportunityLineItemRecId = createOpportunityLineItem.recordId;
                    displayConnectButtons = false;
                    // ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'OpportunityLineItem Record Id' + createOpportunityLineItem.recordId);
                    // ApexPages.addMessage(myMsg);
                    

                }
                else{
                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, ' OpportunityLineItem  ' + createOpportunityLineItem.responsemessage);
                    ApexPages.addMessage(myMsg);
                    
                }
            
    }
    public void ConnectSfdc(){
        isConnect = true;
        //Newvaluesboll = false;
        if(CouponCode == null || CouponCode == ''){
            Couponvalue = 0;
        }
    }
    
    // public void ConnectSfdcclone(){
    //     isConnect = true;
    //     //Newvaluesboll = true;
    //     if(CouponCode == null || CouponCode == ''){
    //         Couponvalue = 0;
    //     }
        
    // }
    
    public void Goback(){
        NoAcccountbalance = false;
    }
    
     public void Cancelclose(){
        purchaseAndBuildDashboard('Cancel',1);
    }
    
    
    
    public void connectToSFDCs(){
        SFDCApiUtil.connectResponseClass connectResponse = SFDCApiUtil.connectToSFDC();
        if(connectResponse.response){
            sessionIds = connectResponse.sessionId;
            serverURL = connectResponse.responseServerUrl;
            //  ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, '' + connectResponse);
            //  ApexPages.addMessage(myMsg);
            booleanConnections();
            isCheckAccount = true;
            TouchverifyAccountDetails();
            String vals = string.valueof(accountbalance);     
        }
        else{
            // system.debug('connectResponse.responsemessage ********'+connectResponse.responsemessage);
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, '' + connectResponse.responsemessage);
            ApexPages.addMessage(myMsg);
            booleanConnections();      
        }    
    }
    
    public void TouchverifyAccountDetails(){
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
                TouchverifyContactDetails();
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
                        TouchverifyContactDetails();
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
                            TouchverifyContactDetails();
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
                                        TouchverifyContactDetails();
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
    
    public void TouchverifyContactDetails(){
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
                recordDetails.put('Email__c', userData.Email);
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

}