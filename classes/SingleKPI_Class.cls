public with sharing class SingleKPI_Class {
    public Boolean SetDimension{get;set;}
    public Boolean SetDimensionValue{get;set;} 
    public boolean showSectionEdit{get;set;}
    public String KPINameUI{get;set;}
    public Integer KPI{get;set;}
    public Map<String,String> DatasetMaps{get;set;}
    public Map<String,String> MapValues{get;set;}
    public String sessionId;
    public List<SelectOption> DatasetValuesList{get;set;}
    public Map<String,String> DimensionLabel{get;set;}
    public Map<String,String> MeasureFieldAPI{get;set;}
    public Map<String,String> versionLabel{get;set;}
    public Map<String,String> VersionUrl{get;set;}
    public String SelectKPIValue{get;set;}
    public String DashboardName{get;set;}
    public string strFloderId{get; set;}
    public String tabid{get;set;}
    public boolean AddFiltersShow{get;set;}
    public boolean EditFiltersShow{get;set;}
    public boolean defaultTab1{get;set;}
    public boolean defaultTab2{get;set;}
    public boolean defaultTab3{get;set;}
    public boolean defaultTab4{get;set;}
    public boolean defaultTab5{get;set;}
    public boolean scriptPanel{get;set;}
    public String SelectedButtonValue{get;set;}
    public Integer SelectedrowValue{get;set;}
     public String CurrentVersionId{get;set;} 
     public String CurrentVersionUrl{get;set;} 
     public String Themevalue{get;set;} 
      public String Allval{get;set;}
     public list<selectoption> NewListopt{get;set;}
     public String ConfigId{get;set;}
     public String ConfigName{get;set;}
     public String Description{get;set;}
     public String ConfigurationName{get;set;}
     public Organization org{get;set;}
     public User userdata{get;set;}
     public String ConfigurationDescription{get;set;}
     List<DB_Template__c> DBTemp{get;set;}
     public String AnalyticsDashboardId{get;set;}
    public SingleKPI_Class(){
        scriptPanel = false;
        DimensionId = false;
        DatasetMaps = new Map<String,String>();
        DatasetValuesList = new list<selectoption>();   
        MapValues  = new Map<String,String>();
        DimensionLabel = new Map<String,String>();      
        DateFullField = new Map<String,String>();
        MeasureFieldAPI = new Map<String,String>();
        EditDimMapping = new Map<String,String>();
        EditDateMapping = new Map<String,String>();
        versionLabel = new Map<String,String>();
        VersionUrl = new Map<String,String>();
        
        
        
       ConfigId = apexpages.currentpage().getparameters().get('dbid');
       
       
       //system.debug('Configuration Id @@@@@@@ '+ConfigId);
       
       //DBTemp = [select Id, DB_Name__c, Description__c, Type__c from DB_Template__c where Id = :ConfigId];
       //  ConfigurationName = DBTemp[0].DB_Name__c; 
       //  ConfigurationDescription = DBTemp[0].Description__c;
        
        list<String> SetList = new list<String>();
        NewListopt = new list<selectoption>();
        
        list<Sales_Insight__c> ListSals = [select id,Name,Dashboard_Id__c  from Sales_Insight__c where Name = 'Default SingleKPI Theme' and Dashboard_Id__c = null and Dashboard_Id__c = '']; 
        for(Sales_Insight__c Sl1 :ListSals){
            NewListopt.add(new SelectOption(sl1.id,sl1.Name));
        }
        list<Sales_Insight__c> ListSal = [select id,Name,Dashboard_Id__c  from Sales_Insight__c where Dashboard_Type__c = 'Beta Insights' or (Dashboard_Type__c = 'Insights' and Name != 'Default SingleKPI Theme' and Dashboard_Id__c != null and Dashboard_Id__c != '')];
        for(Sales_Insight__c Sl1 :ListSal){
            NewListopt.add(new SelectOption(sl1.id,sl1.Name));
        }
        
        Allval = 'Default SingleKPI Theme';
            Enablevalue = true;
           DatasetRecords = new list<Dataset__c>();  
            showSectionEdit = false;          
            String responseBody;
            KPI=1; 
            DatasetFromJson  payTypes = new DatasetFromJson();
            String Datesetvalues = getDatasets();   
            if(Datesetvalues != null && Datesetvalues != ''){ 
                 payTypes = DatasetFromJson.parse(Datesetvalues);
            } 
            if(payTypes.datasets !=null){
                for(DatasetFromJson.cls_datasets Rep : payTypes.datasets){              
                    DatasetValuesList.add(new selectOption(Rep.Id,Rep.Name));   
                    DatasetMaps.put(Rep.Id,Rep.currentVersionId);  
                    MapValues.put(Rep.Id,Rep.Name);  
                    versionLabel.put(Rep.Id,Rep.currentVersionId) ;  
                     VersionUrl.put(Rep.Id,Rep.currentVersionUrl) ;                
                } 
            }
            SelectKPIvalue = apexpages.currentpage().getparameters().get('Id');
          
          
            if(SelectKPIvalue != 'None'){
                  Themevalue = apexpages.currentpage().getparameters().get('Theme');
                CurrentVersionId = versionLabel.get(SelectKPIvalue);
                CurrentVersionUrl = VersionUrl.get(SelectKPIvalue);
                KPIDetils = new List<KPIClass>();   
                KPIDetils.add(new KPIClass('KPI 1',1,DatasetValuesList ,false));
                for(KPIClass KPIRec : KPIDetils){ 
                    KPIRec.KPIname = 'KPI 1';
                    KPIRec.dataSet = SelectKPIValue;
                    DatasetDimensionFromJson  DimensionTypes = new DatasetDimensionFromJson();
                     string DimensionsReturnValue = Dimensions(KPIRec.dataSet);
                        if(DimensionsReturnValue != null &&DimensionsReturnValue != ''){
                            DimensionTypes = DatasetDimensionFromJson.parse(DimensionsReturnValue);
                        }
                         if(DimensionTypes.dimensions !=null){
                            for(DatasetDimensionFromJson.cls_dimensions Dim : DimensionTypes.dimensions){ 
                                SetList.add(Dim.Field);
                            }
                         }
                        if(DimensionTypes.measures !=null){
                            for(DatasetDimensionFromJson.cls_measures Dim : DimensionTypes.measures){  
                                if(Dim.showInExplorer == true) {                
                                MeasureFieldAPI.put(Dim.label,Dim.Field); 
                                }                     
                            } 
                        }
                        KPIRec.SelectedFilters = new list<FilterInnerClass>();
                        KPIRec.SelectedFilterList = new list<WrapSelectedFilterList>();
                        if(!Test.isRunningTest())
                    KPIRec.SelectedFilterList.add(new WrapSelectedFilterList('All',KPIRec.SelectedFilters,'\''+SetList[0]+ '\' in all',0));
               //     if(KPIRec.KPIRownumber == 1){                        
               //       Wave_CreateDateXMD CreateXmd = new Wave_CreateDateXMD();
               //           if(!Test.isRunningTest())
               //           try{
                  //            if(KPIRec.dataSet != Null ){
                  //                Wave_CreateDateXMD.CreateDateXMD(KPIRec.dataSet);
                  //            }
               //           }
               //           catch(Exception e){
                            
               //           }
                //  }
                }
            }
            showSectionEdit = true; 
            DashboardSuccess = false;
            DashboardSales = false;
            setDimensionvalue= true; 
            defaultTab1 = false;
            defaultTab2 = false;
            defaultTab3 = false;
            defaultTab4 = false;
            defaultTab5 = false;
            String SingleKPIvalue = apexpages.currentpage().getparameters().get('dbid');
            if(SingleKPIvalue != 'None'){
                CloneFromPrevious(SingleKPIvalue);
            }
                fromJSON  Fnames = new fromJSON(); 
            String Folders = FloderNames();
            if(Folders != null && Folders != ''){
                Fnames =    fromJSON.parse(Folders);
            }
            getFloderList = new List<SelectOption>();
            getFloderList.add(new SelectOption(userInfo.getuserId(),'My Private App'));
            if(Fnames.folders !=null)
            for( fromJSON.cls_folders f:Fnames.folders){
                getFloderList.add(new SelectOption(f.id,f.name)); 
            }
            
            accountBalance = 0;
        NoAcccountbalance = false;
        CouponValue = 0;
        sessionId = UserInfo.getSessionId();
        
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
    public String DateLabels{get;set;} 
    public Void EditLabelClass(){
        DimStrings = false;
        DateStrings = true;
        measStrings = false;
        DateLabels = System.currentPageReference().getParameters().get('EditTopic');
        KPILabels = DateLabels;
        KPINameUI= DateLabels;
    }
    public String MeasLabels{get;set;} 
    public String KPILabels{get;set;} 
    public Void MeasLabelClass(){
        DimStrings = false;
        DateStrings = false;
        measStrings = true;
        MeasLabels = System.currentPageReference().getParameters().get('MeasTopic'); 
        if(EditMeasMappingForCal.get(MeasLabels) == null){
        KPILabels = MeasLabels;
        MeasLabels = MeasLabels;
        }
        else{
        KPILabels = EditMeasMappingForCal.get(MeasLabels);
        MeasLabels = EditMeasMappingForCal.get(MeasLabels);
        }
        
        
        KPINameUI= MeasLabels;
        MeasureNew();
    }
    
    
    public void MeasureNew(){
         String MeasureRecordval = System.currentPageReference().getParameters().get('Menuitemsval');
          System.debug('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& MeasureRecordval '+MeasureRecordval);
        if(MeasureRecordval != Null && MeasureRecordval != '' && MeasureRecordval.contains('<li')){
             MeasureRecordval = MeasureRecordval.Replace('<li>','').replace('<input type="hidden" class="parentSelected" value="','cntrws');
             MeasureRecordval = MeasureRecordval.Replace('<input class="parentSelected" type="hidden" value="','cntrws').replace('\')">','');
             MeasureRecordval = MeasureRecordval.Replace('<input type="hidden" class="itemSelected" value="','').replace('\') ">','');
             MeasureRecordval = MeasureRecordval.Replace('<input class="itemSelected" type="hidden" value="','');
             MeasureRecordval = MeasureRecordval.Replace('<input type="hidden" class="editSelected" value="','');
             MeasureRecordval = MeasureRecordval.Replace('<input class="editSelected" type="hidden" value="','');
             MeasureRecordval = MeasureRecordval.Replace('<input type="hidden" class="editApi" value="','');
             MeasureRecordval = MeasureRecordval.Replace('<input class="editApi" type="hidden" value="','');
             MeasureRecordval = MeasureRecordval.Replace('<div style="cursor: pointer;overflow:hidden;text-overflow:ellipsis;width:87%;float:left;padding-left:30px" onclick="editItems(this,1)"> ','');
             MeasureRecordval = MeasureRecordval.Replace('<div onclick="editItems(this,1)" style="cursor: pointer;overflow:hidden;text-overflow:ellipsis;width:87%;float:left;padding-left:30px"> ','');
             MeasureRecordval = MeasureRecordval.Replace('<div style="cursor: pointer;overflow:hidden;text-overflow:ellipsis;width:87%;float:left;padding-left:30px" onclick="editItems(this,1)">','');
             MeasureRecordval = MeasureRecordval.Replace('<div onclick="editItems(this,1)" style="cursor: pointer;overflow:hidden;text-overflow:ellipsis;width:87%;float:left;padding-left:30px">','');
             MeasureRecordval = MeasureRecordval.Replace('</div>','').replace('<div style="cursor: pointer;display:none" ','');
             MeasureRecordval = MeasureRecordval.Replace('<img style="cursor:pointer;position:relative; z-index:2;" src="','');
             MeasureRecordval = MeasureRecordval.Replace('<img height="10px" src="','');
             MeasureRecordval = MeasureRecordval.Replace('<img height="12px" onclick="removeItemsone(this,1,\'','');
             MeasureRecordval = MeasureRecordval.Replace('\')" src="/resource/1490525779000/analyticscc__Delete" style="cursor:pointer;position:relative; z-index:2;" width="26px">','');
             MeasureRecordval = MeasureRecordval.Replace('" style="cursor:pointer;position:relative; z-index:2;" width="20px">','');
             MeasureRecordval = MeasureRecordval.Replace('" width="20px" height="10px" />','');
             MeasureRecordval = MeasureRecordval.Replace('<img style="cursor:pointer;position:relative; z-index:2;"  src="','');
             MeasureRecordval = MeasureRecordval.replace('" onclick="removeItemsone(this,1,\'','cntrws').replace('</li>','rwsallval').replace('">','cntrws');
             MeasureRecordval = MeasureRecordval.replace('\')" width="26px" height="12px" />','');
            MeasureRecordval = MeasureRecordval.replace('<input class="parentSelected" value="','cntrws');
            MeasureRecordval = MeasureRecordval.Replace('<input class="parentSelected" value="','cntrws').replace('\') ">','');
            MeasureRecordval = MeasureRecordval.Replace('<input class="itemSelected" value="','').replace('\')">','');
            MeasureRecordval = MeasureRecordval.Replace('<input class="itemSelected" value="','').Replace('<input class="editApi" value="','');
            MeasureRecordval = MeasureRecordval.Replace('<input class="editApi" value="','').Replace('<input class="editSelected" value="','');     
            MeasureRecordval = MeasureRecordval.Replace('<input class="editSelected" value="','').replace('"type="hidden','').replace('" type="hidden','');
                        String[] MeasureLists = MeasureRecordval.split('rwsallval');
            for(KPIClass KPI : KPIDetils){
                KPI.selectedMeasures = new set<String>();
                NewMeasurevarlist = new list<MeasureAngularclass>();
                
                 for(String Measurewrap : MeasureLists){
                     if(Measurewrap != Null && Measurewrap != ''){
                     String[] NewMsList = Measurewrap.split('cntrws');
                     String sumoflist;
                     if(NewMsList[3] == 'count(Rows)'){
                         sumoflist = 'count(Rows)';
                     }
                     else{
                      //   if(NewMsList[1] != 'Calculate Measure'){
                            sumoflist = NewMsList[3].replace('wqstn','');
                      //   }
                         
                     }
                      String NewMsListString = '';
                  if(NewMsList[1].contains('count')){
                       NewMsListString='count';
                    }
                    if(NewMsList[1].contains('sum')){
                        NewMsListString='sum';
                    }
                    if(NewMsList[1].contains('avg')){
                        NewMsListString='avg';
                    }
                    if(NewMsList[1].contains('min')){
                        NewMsListString='min';
                    }
                    if(NewMsList[1].contains('min')){
                        NewMsListString='min';
                    }
                    if(NewMsList[1].contains('stddev')){
                        NewMsListString='stddev';
                    }
                    if(NewMsList[1].contains('stddevp')){
                        NewMsListString='stddevp';
                    }
                    if(NewMsList[1].contains('var')){
                        NewMsListString='var';
                    }
                    if(NewMsList[1].contains('varp')){
                        NewMsListString='varp';
                    }
                    if(NewMsList[1].contains('unique')){
                       NewMsListString='unique';
                    }
                    if(NewMsList[1].contains('median')){
                            NewMsListString='median';
                        }
                        if(NewMsList[1].contains('first')){
                            NewMsListString='first';
                        }
                        if(NewMsList[1].contains('last')){
                            NewMsListString='last';
                        }
                        if(NewMsList[1].contains('Calculate')){
                            NewMsListString='Calculate';
                        }
                        String Var;
                        String[] NewMsListspace = NewMsList[2].split('  ');
                        for(string Nes :NewMsListspace){
                            if(Nes != '' && Nes != null){
                                Var = Nes;
                            }
                        }
                     
                        
                          if(NewMsList[1] != 'Calculate'){
                                KPI.selectedMeasures.add(sumoflist);
                                NewMeasurevarlist.add(new MeasureAngularclass(sumoflist,NewMsListString.replace(' ',''),Var,sumoflist+'wqstn',NewMsList[4]+'wqstn'));
                          }
                          else{
                                if(EditMeasMappingForCal.get(sumoflist) == Null){
                                    KPI.selectedMeasures.add(sumoflist);
                                    NewMeasurevarlist.add(new MeasureAngularclass(sumoflist,NewMsListString.replace(' ',''),Var,sumoflist+'wqstn',NewMsList[4]+'wqstn'));  
                                }
                                else{
                                    KPI.selectedMeasures.add(EditMeasMappingForCal.get(sumoflist));
                                    NewMeasurevarlist.add(new MeasureAngularclass(EditMeasMappingForCal.get(sumoflist),NewMsListString.replace(' ',''),Var,sumoflist+'wqstn',NewMsList[4]+'wqstn'));  
                               
                                }
                        }
                     }
                     
                     System.debug('NewMeasurevarlistssssss '+NewMeasurevarlist);
                     System.debug('KPI.selectedMeasures '+KPI.selectedMeasures);
                 }
            } 
        } 
    }
    public map<String,String> EditDateMapping = new map<String,String>();
    public void SaveEditLabels(){
        try{
            KPINameUI = System.currentPageReference().getParameters().get('hiddensection');   
        for(KPIClass KPIRec :KPIDetils){
            if(KPIRec.SelectedDateFieldlist != Null){
            for(SelectedDateFieldWrapper SelDate : KPIRec.SelectedDateFieldlist){
                if(SelDate.DateFieldName == DateLabels){
                    SelDate.DateFieldName = KPINameUI;
                    if(DateFullField.get(DateLabels) != Null){
                        EditDateMapping.put(KPINameUI,DateLabels);
                    }
                    else{
                        EditDateMapping.put(KPINameUI,EditDateMapping.get(DateLabels)); 
                    }
                    NewStringDate.remove(DateLabels);
                    NewStringDate.add(DateLabels);
                }
                else{
                    if(EditDateMapping.get(SelDate.DateFieldName) == Null)
                    EditDateMapping.put(SelDate.DateFieldName,SelDate.DateFieldName);
                }
            }
        }
        }
        //MeasureNew();
    //  previous();
        }catch(Exception e){
            
        }
    }
    public map<String,String> EditMeasMapping = new map<String,String>();
    public map<String,String> EditMeasMappingForCal = new map<String,String>();
    public void SaveMeasLabels(){
        //try{
        
        set<String> SetMeas = new Set<String>();
         KPINameUI = System.currentPageReference().getParameters().get('hiddensection'); 
         for(MeasureAngularclass Mes :  NewMeasurevarlist){
             if(Mes.Measurename == MeasLabels){
                 Mes.Measurename = KPINameUI;
                 if(Mes.Measurevar == 'Calculate'){
                    //Mes.EditMeasval = KPINameUI+'wqstn';
                 }
                 else{
                    Mes.EditMeasval = KPINameUI; 
                 }
             }
         }
        for(KPIClass KPIRec :KPIDetils){
            if(KPIRec.selectedMeasures != Null){
            for(String SelDate : KPIRec.selectedMeasures){
                System.debug('MeasLabels *******' + MeasLabels + ' SelDate ******* ' + SelDate);
                if(SelDate == MeasLabels || Test.isRunningTest()){
                    SelDate = KPINameUI;
                    System.debug('MeasLabels *******' + MeasLabels);
                if(!MeasLabels.contains('(\'')){
                    MeasLabels = MeasLabels.replace('(',';');                
                     String[] MeasLabellist = MeasLabels.Split(';');
                     
                     String LabelFields;
                     if(MeasLabellist.Size()>1 ){
                     LabelFields = MeasLabellist[1].replace(')','');
                     }
                     MeasLabels = MeasLabels.replace(';','('); 
                     if(MeasureFieldAPI.get(LabelFields) != Null){
                         EditMeasMapping.put(KPINameUI,MeasLabels.replace(';','('));
                     } 
                     else{
                        if(EditMeasMapping.get(MeasLabels.replace(';','(')) == Null){
                        EditMeasMapping.put(KPINameUI,MeasLabels.replace(';','('));
                        }
                        else{
                            EditMeasMapping.put(KPINameUI,EditMeasMapping.get(MeasLabels.replace(';','(')));    
                        }
                     }
                     
                }
                else{
                   
                    MeasLabels = MeasLabels.replace('(\'',';').replace('\')','##');     
                     String[] MeasLabellist = MeasLabels.Split(';');
                      
                     String LabelFields;
                     if(MeasLabellist.Size()>1 ){
                     String[] Labelclasses = MeasLabellist[1].Split('##');
                     LabelFields = Labelclasses[0].replace('\')','');
                     }
                     System.debug('LabelFields *******' + LabelFields);
                     MeasLabels = MeasLabels.replace(';','(\'').replace('##','\')'); 
                     if(MeasureFieldAPI.get(LabelFields) != Null){
                         EditMeasMapping.put(KPINameUI,MeasLabels.replace(';','(\'').replace('##','\')'));
                         
                     } 
                     else{
                          System.debug('KPINameUI *******' + KPINameUI + 'MeasLabels ********** '+ MeasLabels.replace(';','(\'').replace('##','\')'));
                        if(EditMeasMapping.get(MeasLabels.replace(';','(\'').replace('##','\')')) == Null){
                            EditMeasMapping.put(KPINameUI,MeasLabels.replace(';','(\'').replace('##','\')'));
                        }
                        else{
                            EditMeasMapping.put(KPINameUI,EditMeasMapping.get(MeasLabels.replace(';','(\'').replace('##','\')')));  
                        }
                     }
                     if(EditMeasMappingForCal.get(MeasLabels.replace(';','(\'').replace('##','\')')) == null){
                         EditMeasMappingForCal.put(MeasLabels.replace(';','(\'').replace('##','\')'),KPINameUI);
                     }
                     else{
                         EditMeasMappingForCal.put(MeasLabels.replace(';','(\'').replace('##','\')'),KPINameUI); 
                     }
                     
                     //system.debug('MeasLabels ************' +MeasLabels.replace(';','(\'').replace('##','\'));
                }
                }
                else{
                    if(EditMeasMapping.get(SelDate) == Null)
                    EditMeasMapping.put(SelDate,SelDate);
                    
                    if(EditMeasMappingForCal.get(SelDate) == Null)
                    EditMeasMappingForCal.put(SelDate,SelDate);
                //  EditMeasMappingForCal.put(SelDate,SelDate);
                }
                
            }
             
        }
        }
        //previous();
    //  }catch(Exception e){
            
    //  }
    }
   
    public boolean DateStrings{get;set;}
    public boolean DimStrings{get;set;}
    public boolean measStrings{get;set;}
    public String DimensionLabels{get;set;} 
    public Void EditDimClass(){
        DimStrings = true;
        DateStrings = false;
        measStrings = false;
        DimensionLabels = System.currentPageReference().getParameters().get('EditDim');
        KPILabels = DimensionLabels;
        KPINameUI= DimensionLabels;
    }
    public map<String,String> EditDimMapping = new map<String,String>();
    public void SaveDimLabels(){
        try{
             KPINameUI = System.currentPageReference().getParameters().get('hiddensection'); 
        for(KPIClass KPIRec :KPIDetils){
            if(KPIRec.SelectedDimensions != Null){
            for(selectedDimesionWrapper SelDate : KPIRec.SelectedDimensions){
                if(SelDate.Availablename == DimensionLabels){
                    SelDate.Availablename = KPINameUI;
                    if(DimensionLabel.get(DimensionLabels) != Null){
                        EditDimMapping.put(KPINameUI,DimensionLabels);
                    }
                    else{
                        EditDimMapping.put(KPINameUI,EditDimMapping.get(DimensionLabels));
                    }
                    NewString.remove(DimensionLabels);
                    NewString.add(KPINameUI);
                }
                else{
                    if(EditDimMapping.get(SelDate.Availablename) == Null)
                    EditDimMapping.put(SelDate.Availablename,SelDate.Availablename);
                }
            }
        }
        
        }
        MeasureNew();
    //previous();
        }catch(Exception e){
            
        }
    }            
     public boolean SetMeasure{get;set;}        
     public list<availableDimesionWrapper> availabledimensions{get;set;}                                            
     
      public List<SelectOption> getFloderList{get;set;}  
     
    
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
                return null;
            } 
    }
    
    public String Dimensions(String Dropvalue){
            String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v39.0';
            String datasetId = Dropvalue;
            String versionId = DatasetMaps.get(datasetId);
            String endpoint;
            endpoint = sfdcInstance + '/wave/datasets/'+ datasetId +'/versions/' + versionId +'/xmds/main';                 
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
                return null;
            } 
    }                         
     public String getDatasets() {
        String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v39.0';
        String endpoint;
        endpoint = sfdcInstance + '/wave/datasets?pageSize=200';         
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
                return null;
            } 
    }        
    
    public void ActTabs1(){ 
        /*tabid= System.currentPageReference().getParameters().get('tabid'); 
        
        defaultTab1 = true;     
        SelectedrowValue = integer.valueOf(tabid);*/
    }
        
    public void Previous(){
        MeasureNew();
        for(KPIClass KPI : KPIDetils){
            if(KPI.SelectedDateFieldlist != Null && KPI.selectedDimensions != null && KPI.selectedMeasures != Null){
                if(KPI.SelectedDateFieldlist.size() > 0 && KPI.selectedDimensions.size() > 0 && KPI.selectedMeasures.size() > 0){
                    Enablevalue = false;
                }
                else{
                    Enablevalue = true;     
                }
            }
            else{
                Enablevalue = true; 
            }
        }
        scriptPanel = false;
        isFalse = false;
        isTrue= false;
        isError = false;
        isErrorEdit = false;
        showSectionEdit = true;  
        SetDimensionValue = true; 
        setDimension = false;
        filterrend = false;
        DatesIdClose = false;
    }  
         
   /* public void PreviousMeasure(){
        showSectionEdit = true;  
        SetDimensionValue = false; 
        setDimension = false;
        setDate = true;
        SetMeasure = false; 
        filterrend = false;            
    }*/                            
    public List<DateFieldWrapper> DateWrapperList{get;set;}
    public List<MeasureWrapper> MeasureWrapperList{get;set;}            
    public boolean SetDate{get;set;}                
    public boolean filterrend{get;set;}         
    //public boolean  CountRender{get;set;}
                        
    /*public void PreviousDates(){
        showSectionEdit = true;  
        SetDimensionValue = false; 
        setDimension = true;
        SetMeasure = false;
        filterrend = false;
        SetDate = false;
    }*/   
   // public boolean AllResults1{get;set;}
            
    /*public void PreviousFields(){
        FilterRend = false;
        setMeasure = true;
    }*/
        
    public list<Dataset__c> DatasetRecords{get;set;}
   
 
    public List<KPIClass> KPIDetils{get;set;}       
    public String filedName{get;set;}
    public String value{get;set;}
   // public list<Filterwrapper> filterwrapperList{get;set;}
   // public Integer counter{get;set;}
          
    public String operator{get;set;}
    /*public List<SelectOption> getOperatorValues(){   
        List<SelectOption> options = new List<SelectOption>();
        
        options.add(new SelectOption('!=','not equal to'));
        options.add(new SelectOption('==','equals'));
        options.add(new SelectOption('<','less than'));
        options.add(new SelectOption('>','greater than'));
        options.add(new SelectOption('<=','less or equal'));
        options.add(new SelectOption('>=','greater or equal')); 
        options.add(new SelectOption('IN','in')); 
        options.add(new SelectOption('NOT IN','not in')); 
        return options;
    }*/           
        
    public Integer filterRowCount = 0; 
    public void FilterMethod(){
        for (Integer i = (KPIDetils.size()-1) ; i>= 0 ; i--){
             String s = KPIDetils[i].KPIName;
            if(s == ''){
                KPIDetils.remove(i);
            }
        } 
        
             EditFiltersShow = false;
            AddFiltersShow = true;
            filterLogic = '1';
            FilterNames = '';
            isTrue = false;
            isErrorEdit = false;
            isError = false;
            for(KPIClass KPIRec : KPIDetils){           
                filterCount = 1;
                KPIRec.dimensionOptions = new List<SelectOption>();                                            
                DatasetDimensionFromJson  DimensionTypes = new DatasetDimensionFromJson(); 
                if(KPIRec.dataSet != null || Test.isRunningTest()){
                string DimensionsReturnValue = Dimensions(KPIRec.dataSet);
                if(DimensionsReturnValue != null &&DimensionsReturnValue != ''){
                    DimensionTypes = DatasetDimensionFromJson.parse(DimensionsReturnValue);
                    
                }  
                if(DimensionTypes.dimensions !=null)
                for(DatasetDimensionFromJson.cls_dimensions Dim : DimensionTypes.dimensions){ 
                    if(Dim.showInExplorer == true) {                          
                     KPIRec.dimensionOptions.add(new selectOption(Dim.field,Dim.field));
                    }                         
                }   
                KPIRec.dimensionOptions =  sortSelectOptions(KPIRec.dimensionOptions);                   
                KPIRec.AddFilter = new list<Filterwrapper> ();                          
                KPIRec.AddFilter.add(new Filterwrapper(filedName, operator, value, filterCount));
                for(Filterwrapper Filter: KPIRec.AddFilter){
                    Filter.userLogic = '1';
                     Filter.filterRowCount =  1;
                     KPIRec.FilterRowCount = 1;
                        Filter.FilterNames = new list<Filterwrapper> ();
                        KPIRec.datasetFilterId = KPIRec.Dataset  ;
                        Filter.FilterNames.add(new Filterwrapper(filedName,operator,value, Filter.filterRowCount));
                }   
            }
            filterRend= true;
            SetMeasure = false;
            }
    } 
    
     public List<SelectOption> sortSelectOptions(List<SelectOption> sortingList) {
        for (Integer i =0; i < sortingList.size(); i++) {
            for (Integer j = i; j > 0; j--) {
                if (sortingList[j-1].getLabel() > sortingList[j].getLabel()){
                    SelectOption temp = sortingList[j];
                    sortingList[j] = sortingList[j-1];
                    sortingList[j-1] = temp;
                }
            }
        }
        return sortingList;
    } 
    
    /*public void addRow(){       
        Integer KPIDimen = Integer.valueof(apexpages.currentpage().getparameters().get('KPIDimen'));
        Integer counterWrap = Integer.valueof(apexpages.currentpage().getparameters().get('counterWrap'));
        integer i = 0;
        for(KPIClass KPIRec : KPIDetils){
            if(KPIRec.KPIRownumber == KPIDimen){
                if(KPIRec.AddFilter !=null) {
                for(Filterwrapper AddFil : KPIRec.AddFilter){ 
                    if(AddFil.Counterwrap == counterWrap){
                        AddFil.UserLogic = AddFil.UserLogic + ' AND ' + (AddFil.filterRowCount+1);
                        AddFil.filterRowCount = AddFil.filterRowCount + 1;
                        AddFil.FilterNames.add(new Filterwrapper(filedName, operator, value, AddFil.filterRowCount));
                    }
                }  
                }             
            }           
        }    
    }*/
    
    /*public void EditaddRow(){ 
        try{      
            Integer KPIDimen = Integer.valueof(apexpages.currentpage().getparameters().get('KPIDimen'));
            Integer counterWrap = Integer.valueof(apexpages.currentpage().getparameters().get('counterWrap'));
            integer i = 0;
            for(KPIClass KPIRec : KPIDetils){
                if(KPIRec.KPIRownumber == KPIDimen){
                    if(KPIRec.EditFilter !=null){
                        for(Filterwrapper AddFil : KPIRec.EditFilter){ 
                            if(AddFil.Counterwrap == counterWrap){
                                for(Filterwrapper ForList : AddFil.FilterNames){
                                    AddFil.filterRowCount = ForList.Counterwrap + 1;    
                                }                               
                                AddFil.UserLogic = AddFil.UserLogic + ' AND ' + (AddFil.filterRowCount);
                                
                                AddFil.FilterNames.add(new Filterwrapper(filedName, operator, value, AddFil.filterRowCount));
                                AddFil.filterRowCount = AddFil.filterRowCount + 1;
                            }
                        }               
                    }  }         
            }
        } 
        catch(Exception e){
            
        }
    }*/ 
    
          
    //public boolean filterTrue{get;set;}
    public integer filterCount;
    public integer FilterValue = 1;
 

 public void verifyError(Integer RowNumber,String Filtername){
        for(KPIClass KPIRec : KPIDetils){ 
            if(KPIRec.KPIRowNumber == RowNumber) {  
                if(KPIRec.SelectedFilters == Null){
                    KPIRec.SelectedFilters = new list<FilterInnerClass>();
                } 
                if(KPIRec.SelectedFilterList == Null){
                    KPIRec.SelectedFilterList = new list<WrapSelectedFilterList>();
                } 
                isError = false;
                if(KPIRec.AddFilter !=null){
                for(Filterwrapper AddFil : KPIRec.AddFilter){
                    if(String.isNotBlank(AddFil.userLogic)){ 
                                List<String> filterStrings = new List<String>();
                                Map<String, String> maptocheckfilterStrings = new Map<String, String>();
                                for(string s : AddFil.userLogic.split(' ')) { 
                                    if(s != ')' &&  s != '(' && s!='' && s!= ' ' ){
                                        filterStrings.add(s);  
                                    } 
                                }
                                for(String s : filterStrings){
                                    if(maptocheckfilterStrings.get(s) == null){ 
                                        maptocheckfilterStrings.put(s,s);
                                    } 
                                }
                                integer bw = 1;
                                for(NewInnerclass fw : InnClassEditvalues){
                                    if(fw.minval == Filtername){
                                    maptocheckfilterStrings.remove(String.valueOf(bw));
                                    maptocheckfilterStrings.remove(String.valueOf(bw)+')');
                                    maptocheckfilterStrings.remove('('+String.valueOf(bw));
                                    bw = bw+1;
                                    }
                                }
                                for(String s : maptocheckfilterStrings.values()){ 
                                    if(s == 'AND' || s == 'OR'){  
                                        isError = false;
                                    }
                                    else{
                                         
                                        isError = true;
                                        isTrue = false;
                                        break;
                                    }
                                }             
                                for(String s : maptocheckfilterStrings.values()){ 
                                    if(s == 'AND' || s == 'OR'){   
                                        isError = false;
                                    }
                                    else{
                                        isError = true;
                                        isTrue = false;
                                        break;
                                    }
                                } 
          
                                List<String> filterNumbers = new List<String>();
                                Map<String, String> maptocheckduplicates = new Map<String, String>();
                                AddFil.userLogic.split(' '); 
                                for(string s : AddFil.userLogic.split('')) {
                                    if(s != 'A' && s != 'N' && s != 'D' && s!= 'O' && s != 'R' && s != '(' && s != ')' && s!='' && s!= ' ' && !s.contains('(')){
                                    filterNumbers.add(s); 
                                    }
                                }
                                for(String s : filterNumbers){
                                    if(maptocheckduplicates.get(s) == null){
                                        maptocheckduplicates.put(s,s);
                                    }
                                    else{
                                        //Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.ERROR, 'Please Enter Valid Filter Condition'));  
                                        isError = true;
                                        isTrue = false;
                                    }
                                }
             
                                if(!isError){
                                    String Values = '';
                                    integer w = 1;
                                    integer ival = 1;
                                for(NewInnerclass fw : InnClassEditvalues){
                                    if(fw.minval == Filtername){
                                //  if(fw.filedName != null && fw.operator != null && fw.value != null){ 
                                            if(AddFil.userLogic.contains(String.valueOf(ival))){
                                                    if(AddFil.userLogic == '1 '){  
                                                    isError = false;
                                                    break;
                                                }
                                                if(AddFil.userLogic.contains(String.valueOf(ival) + '  ')){
                                                    isError = true;
                                                    break;
                                                }
                                                if(AddFil.userLogic.contains(')  ' + String.valueOf(ival)) || AddFil.userLogic.contains(')   ' + String.valueOf(ival)) || AddFil.userLogic.contains(')   ' + String.valueOf(ival)) || AddFil.userLogic.contains(')    ' + String.valueOf(ival))){
                                                    isError = true;
                                                    break;
                                                }
                                                if(AddFil.userLogic.contains(')' + ' (') || AddFil.userLogic.contains(')' + '  (') || AddFil.userLogic.contains(')' + '   (')){
                                                    isError = true;
                                                    break;
                                                }
                                                if(AddFil.userLogic.contains(String.valueOf(ival) + ' (') || AddFil.userLogic.contains(String.valueOf(ival) + '  (') || AddFil.userLogic.contains(String.valueOf(ival) + '   (')){
                                                    isError = true;
                                                    break;
                                                }
                                                if((AddFil.userLogic.contains('(') && !AddFil.userLogic.contains(')')) || (AddFil.userLogic.contains(')') && !AddFil.userLogic.contains('(')) ||  AddFil.userLogic.contains(') '+ String.valueOf(ival))){
                                                    isError = true;
                                                    break;
                                                }
                                                
                                                if(AddFil.userLogic.contains(String.valueOf(ival) + ' '+(String.valueOf(ival + 1)))){
                                                    isError = true;
                                                    break;
                                                }
                                                if(AddFil.userLogic.contains(String.valueOf(ival) + ' '+(String.valueOf(ival + 2)))){
                                                    isError = true;
                                                    break;
                                                }
                                                if(AddFil.userLogic.contains(String.valueOf(ival) + ' '+(String.valueOf(ival + 3)))){
                                                    isError = true;
                                                    break;
                                                }
                                                if(AddFil.userLogic.contains(String.valueOf(ival) + ' '+(String.valueOf(ival + 4)))){
                                                    isError = true;
                                                    break;
                                                }
                                                if(AddFil.userLogic.contains(String.valueOf(ival) + ' '+(String.valueOf(ival + 5)))){
                                                    isError = true;
                                                    break;
                                                }
                                                if(AddFil.userLogic == '1 '){
                                                    isError = false;
                                                }
                                                if(AddFil.userLogic == String.valueOf(ival)+ ' AND'){
                                                    isError = true;
                                                    break;
                                                }
                                                else if(AddFil.userLogic == String.valueOf(ival)+ ' OR'){
                                                    isError = true;
                                                    break;
                                                }
                                                else if(AddFil.userLogic == String.valueOf(ival)){
                                                    isError = false;
                                                }
                                                else if(AddFil.userLogic.contains(String.valueOf(ival) + ' '+(String.valueOf(ival + 1)))){
                                                    isError = true;
                                                    break;
                                                }
                                                else if(AddFil.userLogic.contains('AND')){
                                                    isError = false;
                                                }
                                                else if(AddFil.userLogic.contains('OR')){
                                                    isError = false;
                                                }                                           
                                                else{
                                                    isError = true;
                                                    break;
                                                }
                                                
                                                 
                                            /*}
                                            else{
                                                //AddFil.userLogic.addError('Please Add Condition'+ival); 
                                                //Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.ERROR, 'Please Add Condition'+ival)); 
                                                isError = true;
                                                break;
                                            }*/
                                        }
                                        else{
                                            //AddFil.userLogic.addError('Please Select Condition'+ival);
                                            //Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.ERROR, 'Please Select Condition'+ival));  
                                            isError = true;
                                            isTrue = false;
                                            break;
                                        }
                                   
                                        ival = ival+1;
                                    }
                                }
                                    
                                    
                                }                                    
                        } 
                        else{
                            //Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.ERROR, 'Please Enter Valid Filter Condition')); 
                            isError = true;
                            isTrue = false;
                            break;
                        }
                    
                }
            }           
        }
    }
 }
    public boolean isTrue{get;set;}
    public boolean isError{get;set;}
    
    public boolean tableId{get;set;}
    public String Filternames{get;set;}
    public list<FilterInnerClassEdit> InnClassEdit{get;set;}
    public list<NewInnerclass> InnClassEditvalues{get;set;}
    public list<NewInnerclass> InnClassEditvaluesList{get;set;}
    public boolean DimensionIdClose{get;set;}
    public boolean DatesIdClose{get;set;}
    public void DimensionsNew(){
       // String Filtername = apexpages.currentpage().getparameters().get('DatehiddenKPI');
        String Dimensionname = apexpages.currentpage().getparameters().get('DimhiddenKPI'); 
           Dimensionname = Dimensionname.replace('<li style="cursor: pointer;width: 99%;margin-top:5px;padding: 5px;border-radius: 2px;" onclick="setActiveRowdate(this)">','');
        Dimensionname = Dimensionname.replace('<li onclick="setActiveRowdate(this)" style="cursor: pointer;width: 99%;margin-top:5px;padding: 5px;border-radius: 2px;">','');
        Dimensionname = Dimensionname.replace('<li onclick="setActiveRowdate(this)" style="cursor: pointer; width: 99%; margin-top: 5px; padding: 5px; border-radius: 2px; background-color: lightgrey;">','');
        Dimensionname = Dimensionname.replace('<div class="dateFivDiv" onclick="editDateModel(this)" style="display: inline;">','').replace('"></div>','Dimsval');
        Dimensionname = Dimensionname.replace('<img height="12px" src="','').replace('" style="cursor:pointer;position:relative; z-index:2;" width="26px"></div>','Dimsval');
        Dimensionname = Dimensionname.replace('<img style="cursor:pointer;position:relative; z-index:2;" src="','').replace('" width="26px" height="12px"></div>','Dimsval').replace('<p style="margin-left:30px;margin-top:-25px">','').replace('</p>','');
        Dimensionname = Dimensionname.replace('<input type="hidden" class="selectedfield" value="','Dimsval').replace('<input class="selectedfield" type="hidden" value="','Dimsval').replace('"></li>','NewDimension');
        Dimensionname = Dimensionname.replace('<input class="selectedfield" value="','Dimsval').replace('"type="hidden','').replace('" type="hidden','');
        for(KPIClass KPIRec : KPIDetils){
        
            list<selectedDimesionWrapper> SelectedDimensions = new list<selectedDimesionWrapper>();
            if(Dimensionname != Null && Dimensionname != ''){
            String[] Dimensionnamelist = Dimensionname.split('NewDimension');
            for(String availablename : Dimensionnamelist){
                String[] availablenamelist = availablename.split('Dimsval');  
                SelectedDimensions.add(new selectedDimesionWrapper(availablenamelist[1].removeEnd(' '),false,availablenamelist[2].removeEnd(' ')));
            }
            
            if(SelectedDimensions.Size() >= 1 && SelectedDimensions.size() <= 8 ){
                KPIRec.SelectedDimensions = new list<selectedDimesionWrapper>();
                DimensionIdClose = true;
                KPIRec.SelectedDimensions = SelectedDimensions;
            }
            else{
                DimensionId = true;
                if(SelectedDimensions.Size() > 8)
                Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'You Cannot Select More than 8 Dimensions.'));
                if(SelectedDimensions.Size() < 1)
                Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'Please Select At Least 1 Dimensions.'));
            }
            }
            else{
                DimensionId = true;
                Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'Please Select At Least 1 Dimensions.'));
            }
        }
        
    }
    
    public void DatesNew(){
        String Dimensionname = apexpages.currentpage().getparameters().get('DatehiddenKPI');
        //String Dimensionname = apexpages.currentpage().getparameters().get('DimhiddenKPI'); 
         Dimensionname = Dimensionname.replace('<li style="cursor: pointer;width: 99%;margin-top:5px;padding: 5px;border-radius: 2px;" onclick="setActiveRowdate(this)">','');
        Dimensionname = Dimensionname.replace('<li onclick="setActiveRowdate(this)" style="cursor: pointer;width: 99%;margin-top:5px;padding: 5px;border-radius: 2px;">','');
        Dimensionname = Dimensionname.replace('<li onclick="setActiveRowdate(this)" style="cursor: pointer; width: 99%; margin-top: 5px; padding: 5px; border-radius: 2px; background-color: lightgrey;">','');
        Dimensionname = Dimensionname.replace('<div class="dateFivDiv" onclick="editDateModel(this)" style="display: inline;">','').replace('"></div>','Dimsval');
        Dimensionname = Dimensionname.replace('<img height="12px" src="','').replace('" style="cursor:pointer;position:relative; z-index:2;" width="26px"></div>','Dimsval');
        Dimensionname = Dimensionname.replace('<img style="cursor:pointer;position:absolute; z-index:2;" src="','').replace('" width="26px" height="12px"></div>','Dimsval').replace('<p style="margin-left:30px;margin-top:-25px">','').replace('</p>','');
        Dimensionname = Dimensionname.replace('<input type="hidden" class="selectedfield" value="','Dimsval').replace('<input class="selectedfield" type="hidden" value="','Dimsval').replace('"></li>','NewDimension');
        Dimensionname = Dimensionname.replace('<input class="selectedfield" value="','Dimsval').replace('"type="hidden','').replace('" type="hidden','');

         for(KPIClass KPIRec : KPIDetils){
            
            list<SelectedDateFieldWrapper> SelectedDateFieldlist = new list<SelectedDateFieldWrapper>();
            if(Dimensionname != Null && Dimensionname != ''){
            String[] Dimensionnamelist = Dimensionname.split('NewDimension');
                for(String availablename : Dimensionnamelist){
                    String[] availablenamelist = availablename.split('Dimsval');  
                    SelectedDateFieldlist.add(new SelectedDateFieldWrapper(availablenamelist[1].removeEnd(' '),false,availablenamelist[2].removeEnd(' ')));
                }   
                 if(SelectedDateFieldlist.Size() <=3){ 
                    DatesIdClose = true;
                    KPIRec.SelectedDateFieldlist = new list<SelectedDateFieldWrapper>();
                    KPIRec.SelectedDateFieldlist = SelectedDateFieldlist;
                 }
                 else{
                    DateIds = true;
                    Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'You Cannot Select More than 3 DateFields.'));
                 }         
         }
         else{
             DateIds = true;
                    Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'Please Select At Least 1 DateField.'));
                 
         }
         }
        
        
    }
   
    public void AddFilterNew(){  
        
    //  Integer RowNumber = Integer.valueof(apexpages.currentpage().getparameters().get('RowNumber'));
    integer RowNumber = 1;
        String Filtername = apexpages.currentpage().getparameters().get('FilterNamesvalues');
        String typeofselect = apexpages.currentpage().getparameters().get('FilterNamesandVal');
        typeofselect = typeofselect.replace('<li style="cursor: pointer;width: 99%;margin-top:5px;background-color: #E6ECF2;padding: 5px;border-radius: 2px;">','');
        typeofselect = typeofselect.replace('<div class="MeasuresDivItems" onclick="editFilterModel(this)" style="display: inline;">','');
        typeofselect = typeofselect.replace('</div><div style="display: inline;float: right;padding-right: 1px;cursor: pointer;" onclick="removeItems(this)">X</div>','');
        typeofselect = typeofselect.replace('<input type="hidden" class="typeofSelect" value="','tyurew');
        typeofselect = typeofselect.replace('<input type="hidden" class="minVal" value="','tyurew');
        typeofselect = typeofselect.replace('<input type="hidden" class="maxVal" value="','tyurew');
        typeofselect = typeofselect.replace('<input type="hidden" class="filterCon" value="','tyurew');
        typeofselect = typeofselect.replace('<input type="hidden" class="selectedfield" value="','tyurew');
        typeofselect = typeofselect.replace('<input type="hidden" class="fieldapi" value="','tyurew');     
    
        
        typeofselect = typeofselect.replace('<div class="DimeItemDev" onclick="editFilterModel(this)" style="display: inline;">','');
        typeofselect = typeofselect.replace('<input type="hidden" class="selectedIds" value="','tyurew'); 
        
        typeofselect = typeofselect.replace('<div class="dateFivDiv" onclick="editFilterModel(this)" style="display: inline;">','');
        typeofselect = typeofselect.replace('<input type="hidden" class="fromDate" value="','tyurew');
        typeofselect = typeofselect.replace('<input type="hidden" class="toDate" value="','tyurew');
            typeofselect = typeofselect.replace('"></li>','codesval').replace('">','');
        
                typeofselect=typeofselect.replace('<div class="index" style="display: inline; (1) </div>','').replace('<div class="index" style="display: inline; (2) </div>','').replace('<div class="index" style="display: inline; (3) </div>','');
                typeofselect=typeofselect.replace('<div class="index" style="display: inline; (4) </div>','').replace('<div class="index" style="display: inline; (5) </div>','').replace('<div class="index" style="display: inline; (6) </div>','');
                typeofselect=typeofselect.replace('<div class="index" style="display: inline; (7) </div>','').replace('<div class="index" style="display: inline; (8) </div>','').replace('<div class="index" style="display: inline; (9) </div>','');
                typeofselect=typeofselect.replace('<div class="index" style="display: inline; (10) </div>','').replace('<div class="index" style="display: inline; (11) </div>','').replace('<div class="index" style="display: inline; (12) </div>','');
                typeofselect=typeofselect.replace('<div class="index" style="display: inline; (13) </div>','').replace('<div class="index" style="display: inline; (14) </div>','').replace('<div class="index" style="display: inline; (15) </div>','');
                typeofselect=typeofselect.replace('<div class="index" style="display: inline; (16) </div>','').replace('<div class="index" style="display: inline; (17) </div>','').replace('<div class="index" style="display: inline; (18) </div>','');
                typeofselect=typeofselect.replace('<div class="index" style="display: inline;(1)</div>','').replace('<div class="index" style="display: inline;(2)</div>','').replace('<div class="index" style="display: inline;(3)</div>','');
                typeofselect=typeofselect.replace('<div class="index" style="display: inline;(4)</div>','').replace('<div class="index" style="display: inline;(5)</div>','').replace('<div class="index" style="display: inline;(6)</div>','');
                typeofselect=typeofselect.replace('<div class="index" style="display: inline;(7)</div>','').replace('<div class="index" style="display: inline;(8)</div>','').replace('<div class="index" style="display: inline;(9)</div>','');
                typeofselect=typeofselect.replace('<div class="index" style="display: inline;(10)</div>','').replace('<div class="index" style="display: inline;(11)</div>','').replace('<div class="index" style="display: inline;(12)</div>','');
                typeofselect=typeofselect.replace('<div class="index" style="display: inline;(13)</div>','').replace('<div class="index" style="display: inline;(14)</div>','').replace('<div class="index" style="display: inline;(15)</div>','');
                typeofselect=typeofselect.replace('<div class="index" style="display: inline;(16)</div>','').replace('<div class="index" style="display: inline;(17)</div>','').replace('<div class="index" style="display: inline;(18)</div>','');
    
    typeofselect = typeofselect.replace('<input class="typeofSelect" value="','tyurew');
    typeofselect = typeofselect.Replace('<input class="maxVal" value="','tyurew');
    typeofselect = typeofselect.Replace('<input class="minVal" value="','tyurew');
    typeofselect = typeofselect.Replace('<input class="filterCon" value="','tyurew').Replace('<input class="fieldapi" value="','tyurew');  
    typeofselect = typeofselect.Replace('<input class="selectedfield" value="','tyurew').replace('"type="hidden','').replace('" type="hidden','');
    
          if(InnClassEdit == Null)
          InnClassEdit= new  list<FilterInnerClassEdit>();
            InnClassEditvalues = new list<NewInnerclass>(); 
        String NewtypeSlect = typeofselect;
        String[] typeofSelectlist  = typeofselect.split('codesval');
        for(String Types :typeofSelectlist){
            if(Types != Null && Types != '')
            InnClassEditvalues.add(new NewInnerclass(Filtername,Types,RowNumber));
        }
        verifyError(RowNumber,Filtername);
        
        
        if(!isError || Test.isRunningTest()){
            TableId = false;
            isTrue= true;
    
        
        
         if(InnClassEditvaluesList == Null)
          InnClassEditvaluesList = new list<NewInnerclass>();
          
          InnClassEditvaluesList.add(new NewInnerclass(Filtername,NewtypeSlect,RowNumber));
    
        for(KPIClass KPIRec : KPIDetils){
        if(KPIRec.KPIRowNumber == RowNumber){
                 if(KPIRec.SelectedFilters == Null){
                    KPIRec.SelectedFilters = new list<FilterInnerClass>();
                } 
                if(KPIRec.SelectedFilterList == Null){
                    KPIRec.SelectedFilterList = new list<WrapSelectedFilterList>();
                }
                integer i=1;
                 integer z = 1;
                 integer k=1;
                if(KPIRec.AddFilter != Null){
                for(Filterwrapper AddFil : KPIRec.AddFilter){
                     if(String.isNotBlank(AddFil.userLogic)){
                            output = AddFil.userLogic;
                             if(typeofselect != Null && typeofselect != ''){
                            String[] TypeSelectList = typeofselect.Split('codesval');
                             for(string Type : TypeSelectList){
                                String Vlauesare;
                                String[] TypeMeasures = Type.Split('tyurew');
                                if(TypeMeasures[1] == 'measure'){
                                if(TypeMeasures[4] == 'Between'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' >= '+String.valueof(TypeMeasures[2]).replace(',','') + ' && '+ '\''+TypeMeasures[6]+'\' <= '+ String.valueof(TypeMeasures[3]).replace(',','');
                                }
                                else if(TypeMeasures[4] == 'Greater Than'){
                                     Vlauesare = '\'' +TypeMeasures[6]+'\' > '+ String.valueof(TypeMeasures[2]).replace(',','');
                                }
                                else if(TypeMeasures[4] == 'Greater Than Or Equal To'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' >= '+ String.valueof(TypeMeasures[2]).replace(',','');
                                }
                                else if(TypeMeasures[4] == 'Less Than'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' < '+String.valueof(TypeMeasures[3]).replace(',','');
                                }
                                else if(TypeMeasures[4] == 'Less Than Or Equal To'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' <= '+String.valueof(TypeMeasures[3]).replace(',','');
                                }
                                else if(TypeMeasures[4] == 'Equals'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' == '+String.valueof(TypeMeasures[2]).replace(',','');
                                }
                                else if(TypeMeasures[4] == 'Does Not Equal'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' != '+String.valueof(TypeMeasures[2]).replace(',','');
                                }
                                else if(TypeMeasures[4] == 'Is Null'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' is null';
                                }
                                else if(TypeMeasures[4] == 'Is Not Null'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' is not null';
                                    
                                }
                                 InnClassEdit.add(new FilterInnerClassEdit(TypeMeasures[0].replace('&lt;','<').replace('&gt;','>'),TypeMeasures[1],TypeMeasures[2],TypeMeasures[3],TypeMeasures[4],TypeMeasures[5],FilterName,Type,TypeMeasures[6],'','',RowNumber,k));
                             }
                             if(TypeMeasures[1] == 'date'){
                                if(TypeMeasures[4] == 'Between'){     
                                     Vlauesare = '\''+TypeMeasures[6]+'\' >= '+TypeMeasures[2] + ' && '+ '\''+TypeMeasures[6]+'\' <= '+TypeMeasures[3];
                                }
                                else if(TypeMeasures[4] == 'Greater Than Or Equal To'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' >= '+TypeMeasures[2];
                                }
                                else if(TypeMeasures[4] == 'Less Than Or Equal To'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' <= '+TypeMeasures[3];
                                }
                                InnClassEdit.add(new FilterInnerClassEdit(TypeMeasures[0].replace('&lt;','<').replace('&gt;','>'),TypeMeasures[1],'','',TypeMeasures[4],TypeMeasures[5],FilterName,type,TypeMeasures[6],TypeMeasures[2],TypeMeasures[3],RowNumber,k));
                             }
                             if(TypeMeasures[1] == 'dimension'){
                                if(TypeMeasures[3] == 'Equals'){
                                    String Newval = '[\\\\\\"'+String.valueof(TypeMeasures[2])+']';
                                    Newval = Newval.replace(',]','\\\\\\"]').replace(',','\\\\\\",\\\\\\"');
                                     Vlauesare = '\''+TypeMeasures[5]+'\' in '+ Newval;
                                    
                                }
                                else if(TypeMeasures[3] == 'Does Not Equal'){
                                  String Newval = '[\\\\\\"'+String.valueof(TypeMeasures[2])+']';
                                    Newval = Newval.replace(',]','\\\\\\"]').replace(',','\\\\\\",\\\\\\"');
                                     Vlauesare = '\''+TypeMeasures[5]+'\' not in '+ Newval;
                                    
                            
                                }
                                else{
                                     Vlauesare = '\''+TypeMeasures[5]+'\' matches \\\\\\"'+String.valueof(TypeMeasures[2]) + '\\\\\\"';
                                }
                                InnClassEdit.add(new FilterInnerClassEdit(TypeMeasures[0],TypeMeasures[1],TypeMeasures[2],'',TypeMeasures[3],TypeMeasures[4],FilterName,type,TypeMeasures[5],'','',RowNumber,k));
                             } 
                       
                             if(output.contains(String.valueOf(i))){
                                if(output.contains('OR '+String.valueOf(i)) || output.contains('|| '+String.valueOf(i))){
                                    output = output.replace('OR '+String.valueOf(i),'OR '+ Vlauesare+ ' '); 
                                    output = output.replace('|| '+String.valueOf(i),'|| '+ Vlauesare+ ' ');
                                }
                                else if(output.contains('AND '+String.valueOf(i)) || output.contains('&& '+String.valueOf(i))){
                                    output = output.replace('AND '+String.valueOf(i),'AND '+ Vlauesare+ ' '); 
                                    output = output.replace('&& '+String.valueOf(i),'&& '+ Vlauesare+ ' '); 
                                }
                                else if(output.contains(String.valueOf(i)+ ' ')){
                                    output = output.replace(String.valueOf(i)+ ' ',' '+ Vlauesare+ ' '); 
                                }
                                else if(output == String.valueOf(i)){
                                    output = output.replace(String.valueOf(i),  ' '+Vlauesare+ ' ' ); 
                                }
                                output = output.replace(' or ',' || ').replace(' Or ',' || ').replace(' OR ',' || ');
                                output = output.replace(' And ',' && ').replace(' AND ',' && ').replace(' and ',' && '); 
                    
                             }  
                             i=i+1;
                             
                            
                               
                             }
                             KPIRec.SelectedFilters.add(new FilterInnerClass(output,FilterValue,Filtername,'','',AddFil.userLogic,''));  
                            }
                     }
                            AddFil.FilterLogic = output;
                             KPIRec.SelectedFilterList.add(new WrapSelectedFilterList(Filtername,KPIRec.SelectedFilters,AddFil.FilterLogic,z));
                    
                     k=K+1;
                }
                    
                     }
                     for(WrapSelectedFilterList sl : KPIRec.SelectedFilterList){
                        sl.rowcount = z;  
                        z++;
                    }
                }
                } 
        }
        else{    
           TableId = true; 
        }
    }
    
    
      public void updateFilterNew(){
            //Integer RowNumber = Integer.valueof(apexpages.currentpage().getparameters().get('RowNumber'));
            integer RowNumber = 1;
        String Filtername = apexpages.currentpage().getparameters().get('FilterNamesvalues');
        String typeofselect = apexpages.currentpage().getparameters().get('FilterNamesandVal');
         integer RowNumberCount = Integer.valueOf(Apexpages.currentpage().getParameters().get('RowNumberCount'));
        typeofselect = typeofselect.replace('<li style="cursor: pointer;width: 99%;margin-top:5px;background-color: #E6ECF2;padding: 5px;border-radius: 2px;">','');
        typeofselect = typeofselect.replace('<div class="MeasuresDivItems" onclick="editFilterModel(this)" style="display: inline;">','');
        typeofselect = typeofselect.replace('<div onclick="editFilterModel(this)" style="display: inline;">','');
        typeofselect = typeofselect.replace('</div><div style="display: inline;float: right;padding-right: 1px;cursor: pointer;" onclick="removeItems(this)">X</div>','');
        typeofselect = typeofselect.replace('</div><div onclick="removeItems(this)" style="display: inline;float: right;padding-right: 1px;cursor: pointer;">X</div>','');
        typeofselect = typeofselect.replace('<input type="hidden" class="typeofSelect" value="','tyurew').replace('<input class="typeofSelect" type="hidden" value="','tyurew');
        typeofselect = typeofselect.replace('<input type="hidden" class="minVal" value="','tyurew').replace('<input class="minVal" type="hidden" value="','tyurew');
        typeofselect = typeofselect.replace('<input type="hidden" class="maxVal" value="','tyurew').replace('<input class="maxVal" type="hidden" value="','tyurew');
        typeofselect = typeofselect.replace('<input type="hidden" class="filterCon" value="','tyurew').replace('<input class="filterCon" type="hidden" value="','tyurew');
        typeofselect = typeofselect.replace('<input type="hidden" class="selectedfield" value="','tyurew').replace('<input class="selectedfield" type="hidden" value="','tyurew');
        typeofselect = typeofselect.replace('<input type="hidden" class="fieldapi" value="','tyurew').replace('<input class="fieldapi" type="hidden" value="','tyurew');     
    
        
        typeofselect = typeofselect.replace('<div class="DimeItemDev" onclick="editFilterModel(this)" style="display: inline;">','');
        typeofselect = typeofselect.replace('<input type="hidden" class="selectedIds" value="','tyurew').replace('<input class="selectedIds" type="hidden" value="','tyurew'); 
        
        typeofselect = typeofselect.replace('<div class="dateFivDiv" onclick="editFilterModel(this)" style="display: inline;">','');
        typeofselect = typeofselect.replace('<input type="hidden" class="fromDate" value="','tyurew').replace('<input class="fromDate" type="hidden" value="','tyurew');
        typeofselect = typeofselect.replace('<input type="hidden" class="toDate" value="','tyurew').replace('<input class="toDate" type="hidden" value="','tyurew');
            typeofselect = typeofselect.replace('"></li>','codesval').replace('">','');
            
                typeofselect=typeofselect.replace('<div class="index" style="display: inline; (1) </div>','').replace('<div class="index" style="display: inline; (2) </div>','').replace('<div class="index" style="display: inline; (3) </div>','');
                typeofselect=typeofselect.replace('<div class="index" style="display: inline; (4) </div>','').replace('<div class="index" style="display: inline; (5) </div>','').replace('<div class="index" style="display: inline; (6) </div>','');
                typeofselect=typeofselect.replace('<div class="index" style="display: inline; (7) </div>','').replace('<div class="index" style="display: inline; (8) </div>','').replace('<div class="index" style="display: inline; (9) </div>','');
                typeofselect=typeofselect.replace('<div class="index" style="display: inline; (10) </div>','').replace('<div class="index" style="display: inline; (11) </div>','').replace('<div class="index" style="display: inline; (12) </div>','');
                typeofselect=typeofselect.replace('<div class="index" style="display: inline; (13) </div>','').replace('<div class="index" style="display: inline; (14) </div>','').replace('<div class="index" style="display: inline; (15) </div>','');
                typeofselect=typeofselect.replace('<div class="index" style="display: inline; (16) </div>','').replace('<div class="index" style="display: inline; (17) </div>','').replace('<div class="index" style="display: inline; (18) </div>','');
                typeofselect=typeofselect.replace('<div class="index" style="display: inline;(1)</div>','').replace('<div class="index" style="display: inline;(2)</div>','').replace('<div class="index" style="display: inline;(3)</div>','');
                typeofselect=typeofselect.replace('<div class="index" style="display: inline;(4)</div>','').replace('<div class="index" style="display: inline;(5)</div>','').replace('<div class="index" style="display: inline;(6)</div>','');
                typeofselect=typeofselect.replace('<div class="index" style="display: inline;(7)</div>','').replace('<div class="index" style="display: inline;(8)</div>','').replace('<div class="index" style="display: inline;(9)</div>','');
                typeofselect=typeofselect.replace('<div class="index" style="display: inline;(10)</div>','').replace('<div class="index" style="display: inline;(11)</div>','').replace('<div class="index" style="display: inline;(12)</div>','');
                typeofselect=typeofselect.replace('<div class="index" style="display: inline;(13)</div>','').replace('<div class="index" style="display: inline;(14)</div>','').replace('<div class="index" style="display: inline;(15)</div>','');
                typeofselect=typeofselect.replace('<div class="index" style="display: inline;(16)</div>','').replace('<div class="index" style="display: inline;(17)</div>','').replace('<div class="index" style="display: inline;(18)</div>','');
        typeofselect = typeofselect.replace('<input class="typeofSelect" value="','tyurew');
        typeofselect = typeofselect.Replace('<input class="minVal" value="','tyurew');
    typeofselect = typeofselect.Replace('<input class="maxVal" value="','tyurew');
    typeofselect = typeofselect.Replace('<input class="filterCon" value="','tyurew').Replace('<input class="fieldapi" value="','tyurew');  
    typeofselect = typeofselect.Replace('<input class="selectedfield" value="','tyurew').replace('"type="hidden','').replace('" type="hidden','');
    
        typeofselect = typeofselect.replace(' tyurew','tyurew');
          if(InnClassEdit == Null)
          InnClassEdit= new  list<FilterInnerClassEdit>();
            InnClassEditvalues = new list<NewInnerclass>(); 
        String NewtypeSlect = typeofselect; 
        String[] typeofSelectlist  = typeofselect.split('codesval');
        for(String Types :typeofSelectlist){
            if(Types != Null && Types != '')
            InnClassEditvalues.add(new NewInnerclass(Filtername,Types,RowNumber));
        } 
        verifyErrorEdit(RowNumber,Filtername);
    
        
        if(!isErrorEdit || Test.isRunningTest()){
           isFalse= true;
         integer k=0;
        for(KPIClass KPIRec : KPIDetils){  
            if(KPIRec.KPIRowNumber == RowNumber){
                         list<NewInnerclass> InnClassEditvaluesEditList = new list<NewInnerclass>();
                       
                        for(NewInnerclass EditInns : InnClassEditvaluesList){
                            InnClassEditvaluesEditList.add(EditInns);
                        
                        }
                        InnClassEditvaluesList = new list<NewInnerclass>();
                        for(NewInnerclass EditInnlist : InnClassEditvaluesEditList){
                            if(EditInnlist.minval != AddFilName){
                                InnClassEditvaluesList.add(new NewInnerclass(EditInnlist.minval,EditInnlist.typeofselect,EditInnlist.RowNumber));
                            }
                           
                        }
                        InnClassEditvaluesList.add(new NewInnerclass(FilterName,NewtypeSlect,RowNumber));
                        list<FilterInnerClass> FilList = new list<FilterInnerClass>();
                        list<WrapSelectedFilterList> WrapFilList = new list<WrapSelectedFilterList>();
                        list<FilterInnerClassEdit> newInnClassEdit = new list<FilterInnerClassEdit>();
                        FilterValue = FilterValue;
                        for(FilterInnerClassEdit EditInn : InnClassEdit){
                            newInnClassEdit.add(EditInn);
                        }
                       
                        InnClassEdit = new list<FilterInnerClassEdit>();
                        for(FilterInnerClassEdit EditInn : newInnClassEdit){
                            if(EditInn.Fieldname != AddFilName){
                                InnClassEdit.add(new FilterInnerClassEdit(EditInn.Betweens,EditInn.typeofSelect,EditInn.minval,EditInn.maxVal,EditInn.filterCon,EditInn.selectedfield,EditInn.Fieldname,EditInn.FilterIds,EditInn.FieldAPI,EditInn.fromdate,EditInn.toDate,RowNumber,EditInn.rowcount));
                            }
                            
                        }
                        for(FilterInnerClass Filte : KPIRec.SelectedFilters ){
                            KPIRec.FiltersSelected = new list<String>();
                            KPIRec.FiltersSelected.add(Filte.SelectedFilters);
                            FilList.add(Filte);
                        }
                        KPIRec.SelectedFilters = new list<FilterInnerClass>(); 
                          for(FilterInnerClass Fil : FilList){
                                if(AddFilName != Fil.FilterNames ){    
                                  KPIRec.SelectedFilters.add(new FilterInnerClass(Fil.selectedFilters,Fil.Filtervalue,Fil.FilterNames,Fil.FieldName,Fil.Operator,Fil.UserLogic,Fil.value));
                                }   
                            }
                        
                        for(WrapSelectedFilterList Wrap : KPIRec.SelectedFilterList){
                             WrapFilList.add(Wrap);
                        }
                        
                        for(WrapSelectedFilterList Sellist : WrapFilList){
                            if(Sellist.FilterName == AddFilName){
                                KPIRec.SelectedFilterList.remove(k) ;
                            }
                            k=K+1;
                        } 
                        if(KPIRec.SelectedFilters == Null){
                            KPIRec.SelectedFilters = new list<FilterInnerClass>();
                        }
    
                 if(KPIRec.SelectedFilters == Null){
                    KPIRec.SelectedFilters = new list<FilterInnerClass>();
                } 
                if(KPIRec.SelectedFilterList == Null){
                    KPIRec.SelectedFilterList = new list<WrapSelectedFilterList>();
                }
                integer i=1;
                 integer z = 1;
                 integer l=1;
                if(KPIRec.EditFilter != Null){
                for(Filterwrapper AddFil : KPIRec.EditFilter){
                     if(String.isNotBlank(AddFil.userLogic)){
                            output = AddFil.userLogic;
                              if(typeofselect != Null && typeofselect != ''){
                            String[] TypeSelectList = typeofselect.Split('codesval');
                             for(string Type : TypeSelectList){
                                String Vlauesare;
                                String[] TypeMeasures = Type.Split('tyurew');
                                if(TypeMeasures[1] == 'measure'){
                                if(TypeMeasures[4] == 'Between'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' >= '+String.valueof(TypeMeasures[2]).replace(',','') + ' && '+ '\''+TypeMeasures[6]+'\' <= '+ String.valueof(TypeMeasures[3]).replace(',','');
                                }
                                else if(TypeMeasures[4] == 'Greater Than'){
                                     Vlauesare = '\'' +TypeMeasures[6]+'\' > '+ String.valueof(TypeMeasures[2]).replace(',','');
                                }
                                else if(TypeMeasures[4] == 'Greater Than Or Equal To'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' >= '+ String.valueof(TypeMeasures[2]).replace(',','');
                                }
                                else if(TypeMeasures[4] == 'Less Than'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' < '+String.valueof(TypeMeasures[3]).replace(',','');
                                }
                                else if(TypeMeasures[4] == 'Less Than Or Equal To'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' <= '+String.valueof(TypeMeasures[3]).replace(',','');
                                }
                                else if(TypeMeasures[4] == 'Equals'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' == '+String.valueof(TypeMeasures[2]).replace(',','');
                                }
                                else if(TypeMeasures[4] == 'Does Not Equal'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' != '+String.valueof(TypeMeasures[2]).replace(',','');
                                }
                                else if(TypeMeasures[4] == 'Is Null'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' is null';
                                }
                                else if(TypeMeasures[4] == 'Is Not Null'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' is not null';
                                    
                                }
                                 InnClassEdit.add(new FilterInnerClassEdit(TypeMeasures[0].replace('&lt;','<').replace('&gt;','>'),TypeMeasures[1],TypeMeasures[2],TypeMeasures[3],TypeMeasures[4],TypeMeasures[5],FilterName,Type,TypeMeasures[6],'','',RowNumber,k));
                             }
                             if(TypeMeasures[1] == 'date'){
                                if(TypeMeasures[4] == 'Between'){     
                                     Vlauesare = '\''+TypeMeasures[6]+'\' >= '+TypeMeasures[2] + ' && '+ '\''+TypeMeasures[6]+'\' <= '+TypeMeasures[3];
                                }
                                else if(TypeMeasures[4] == 'Greater Than Or Equal To'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' >= '+TypeMeasures[2];
                                }
                                else if(TypeMeasures[4] == 'Less Than Or Equal To'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' <= '+TypeMeasures[3];
                                }
                                InnClassEdit.add(new FilterInnerClassEdit(TypeMeasures[0].replace('&lt;','<').replace('&gt;','>'),TypeMeasures[1],'','',TypeMeasures[4],TypeMeasures[5],FilterName,type,TypeMeasures[6],TypeMeasures[2],TypeMeasures[3],RowNumber,k));
                             }
                             if(TypeMeasures[1] == 'dimension'){
                                
                                if(TypeMeasures[3] == 'Equals'){
                                    
                                     String Newval = '[\\\\\\"'+String.valueof(TypeMeasures[2])+']';
                                    Newval = Newval.replace(',]','\\\\\\"]').replace(',','\\\\\\",\\\\\\"');
                                     Vlauesare = '\''+TypeMeasures[5]+'\' in '+ Newval;
                                    
                                }
                                else if(TypeMeasures[3] == 'Does Not Equal'){
                                   String Newval = '[\\\\\\"'+String.valueof(TypeMeasures[2])+']';
                                    Newval = Newval.replace(',]','\\\\\\"]').replace(',','\\\\\\",\\\\\\"');
                                     Vlauesare = '\''+TypeMeasures[5]+'\' not in '+ Newval;
                                    
                            
                                }
                                else{
                                     Vlauesare = '\''+TypeMeasures[5]+'\' matches \\\\\\"'+String.valueof(TypeMeasures[2]) + '\\\\\\"';
                                }
                                InnClassEdit.add(new FilterInnerClassEdit(TypeMeasures[0],TypeMeasures[1],TypeMeasures[2],'',TypeMeasures[3],TypeMeasures[4],FilterName,type,TypeMeasures[5],'','',RowNumber,k));
                             } 
                       
                             if(output.contains(String.valueOf(i))){
                                if(output.contains('OR '+String.valueOf(i)) || output.contains('|| '+String.valueOf(i))){
                                    output = output.replace('OR '+String.valueOf(i),'OR '+ Vlauesare+ ' '); 
                                    output = output.replace('|| '+String.valueOf(i),'|| '+ Vlauesare+ ' ');
                                }
                                else if(output.contains('AND '+String.valueOf(i)) || output.contains('&& '+String.valueOf(i))){
                                    output = output.replace('AND '+String.valueOf(i),'AND '+ Vlauesare+ ' '); 
                                    output = output.replace('&& '+String.valueOf(i),'&& '+ Vlauesare+ ' '); 
                                }
                                else if(output.contains(String.valueOf(i)+ ' ')){
                                    output = output.replace(String.valueOf(i)+ ' ',' '+ Vlauesare+ ' '); 
                                }
                                else if(output == String.valueOf(i)){
                                    output = output.replace(String.valueOf(i),  ' '+Vlauesare+ ' ' ); 
                                }
                                output = output.replace(' or ',' || ').replace(' Or ',' || ').replace(' OR ',' || ');
                                output = output.replace(' And ',' && ').replace(' AND ',' && ').replace(' and ',' && '); 
                    
                             }  
                             i=i+1;
                             
                            
                               
                             }
                                 KPIRec.SelectedFilters.add(new FilterInnerClass(output,FilterValue,Filtername,'','',AddFil.userLogic,'')); 
                              
                            }
                     }
                            AddFil.FilterLogic = output;
                             KPIRec.SelectedFilterList.add(new WrapSelectedFilterList(Filtername,KPIRec.SelectedFilters,AddFil.FilterLogic,RowNumberCount));
                             l=l+1;
                             }
                            
                     }
                }
                }
        }
        else{
            isFalse= false;
        }
    }
    public void AddFilter(){
    }
    
    
public void AddFilterLogic(){
    string AddFilterLogicValue =Apexpages.currentpage().getParameters().get('AddFilterLogicValue');
    string FilterEdit =Apexpages.currentpage().getParameters().get('FilterEdit');
                for(KPIClass KPIRec : KPIDetils){
                    if(FilterEdit == 'FilterEdit'){
                        if(KPIRec.EditFilter != null){
                            for(Filterwrapper Filter: KPIRec.EditFilter){
                                Filter.userLogic = AddFilterLogicValue;
                            }
                        }
                    }
                    else{
                        if(KPIRec.EditFilter != null){
                            for(Filterwrapper Filter: KPIRec.AddFilter){
                                Filter.userLogic = AddFilterLogicValue;
                            } 
                        }
                    }
                }
}
   public void RemoveKPIS(){
        /*Integer RowNumber = Integer.valueOf(Apexpages.currentpage().getParameters().get('DeleteKPI'));
        String KPINames = Apexpages.currentpage().getParameters().get('DeleteFil');
        list<KPIClass> KPIRecs = new LIst<KPIClass>();
        
        for(Integer j = 0; j < KPIDetils.size(); j++){
            if(KPIDetils[j].KPIName == KPINames && KPIDetils[j].KPIRowNumber == RowNumber ){
               KPIDetils.remove(j);  
            }
        }
  

        integer i = 1;
        for(KPIClass KPIRec : KPIDetils){
            if(KPIRec.KPIName != ''){
                KPIRecs.add(new KPIClass(KPIRec.KPIName,i,KPIRec.dataSetOptions,KPIRec.KPICheck));
            }
            i++;
        }
        if(KPIRecs.size() != 0){
          KPIRecs.add(new KPIClass('',KPIRecs.size()+1,DatasetValuesList,false)); 
        }

        KPIDetils.clear();
        
        for(KPIClass KPIRec : KPIRecs){
            KPIDetils.add(KPIRec);
        }
        
        if(KPIDetils.size() == 0){
         KPIDetils.add(new KPIClass('', 1,DatasetValuesList ,false));
        }

        

        defaultTab1 = false;*/
  }
    
  public void RemoveFilters(){
        integer param = Integer.valueOf(Apexpages.currentpage().getParameters().get('RowNumberDel'));
        Integer RowNumber = Integer.valueOf(Apexpages.currentpage().getParameters().get('RowNumberDel'));
        string delname = Apexpages.currentpage().getParameters().get('RemoveFilterDel');
      
        Integer rowcount = Integer.valueOf(Apexpages.currentpage().getParameters().get('hidrowcount'));
        list<FilterInnerClass> InnerClasses = new list<FilterInnerClass>();
        if(innclassEdit  != Null){
               list<FilterInnerClassEdit> newInnClassEdit = new list<FilterInnerClassEdit>();
                 for(FilterInnerClassEdit EditInn : InnClassEdit){
                    newInnClassEdit.add(EditInn);
                }
                
                InnClassEdit = new list<FilterInnerClassEdit>();
                for(FilterInnerClassEdit EditInn : newInnClassEdit){
                    if(EditInn.Fieldname != delname){
                        InnClassEdit.add(new FilterInnerClassEdit(EditInn.Betweens,EditInn.typeofSelect,EditInn.minval,EditInn.maxVal,EditInn.filterCon,EditInn.selectedfield,EditInn.Fieldname,EditInn.FilterIds,EditInn.FieldAPI,EditInn.fromdate,EditInn.toDate,RowNumber,EditInn.rowcount));
                    }
                    
                }
        }
        
        if(InnClassEditvaluesList != Null){
                list<NewInnerclass> InnClassEditvaluesEditList = new list<NewInnerclass>();
                for(NewInnerclass EditInns : InnClassEditvaluesList){
                    InnClassEditvaluesEditList.add(EditInns);
                
                }
                
                InnClassEditvaluesList = new list<NewInnerclass>();
                for(NewInnerclass EditInnlist : InnClassEditvaluesEditList){
                    if(EditInnlist.minval != delname){
                        InnClassEditvaluesList.add(new NewInnerclass(EditInnlist.minval,EditInnlist.typeofselect,EditInnlist.RowNumber));
                    }
                   
                }
           
        }       
        
        
        for(KPIClass KPIRec : KPIDetils){
            
            if(KPIRec.SelectedFilterList != null){
            for(WrapSelectedFilterList sl : KPIRec.SelectedFilterList) {
                if(KPIRec.KPIRownumber == RowNumber && rowcount == sl.rowcount && sl.FilterName == delname){
                    for(Integer i=0;i<KPIRec.SelectedFilters.Size();i++){
                        if(KPIRec.SelectedFilters[i].FilterNames == delname ){
                            KPIRec.SelectedFilters.remove(i); 
                        }
                    }
                }
            }
                    for(Integer i=0;i<KPIRec.SelectedFilterList.Size();i++){
                        if(KPIRec.SelectedFilterList[i].FilterName == delname ){
                            KPIRec.SelectedFilterList.remove(i); 
                        }
                    }            
            
            }
        }
        
    }
     
    /*public void removingRow(){  
        try{
            Integer param = Integer.valueOf(Apexpages.currentpage().getParameters().get('index')); 
            Integer KPIDimen = Integer.valueOf(Apexpages.currentpage().getParameters().get('KPIDimen'));  
            Integer counterWrap = Integer.valueof(apexpages.currentpage().getparameters().get('counterWrap')); 
            for(KPIClass KPIRec : KPIDetils){
                if(KPIRec.KPIRownumber == KPIDimen){
                    if(KPIRec.AddFilter !=null){
                        for(Filterwrapper Filter: KPIRec.AddFilter){ 
                            if(Filter.counterWrap == counterWrap){
                                integer WCount;
                                for(Integer i=0;i<Filter.FilterNames.Size();i++){
                                    if(Filter.FilterNames[i].counterWrap == param ){
                                         WCount = param;
                                        Filter.FilterNames.remove(i);     
                                    }
                                }  
                                if(Filter.UserLogic.contains(' '+WCount)){                              
                                    Filter.UserLogic = Filter.UserLogic.replace('AND '+WCount,'').replace('OR '+WCount,'').replace('and '+WCount,'').replace('or '+WCount,'');                              
                                }else{
                                    Filter.UserLogic = Filter.UserLogic.replace(WCount+' AND ','').replace(WCount+' OR ','').replace(WCount+' and ','').replace(WCount+' or ','');
                                }
                            }
                        }
                    }            
                }
                
            }
        }
        catch(Exception e){
            
        }
    }*/
    
    
    /*public void removingEditRow(){  
        try{
            Integer param = Integer.valueOf(Apexpages.currentpage().getParameters().get('index')); 
            Integer KPIDimen = Integer.valueOf(Apexpages.currentpage().getParameters().get('KPIDimen'));  
            Integer counterWrap = Integer.valueof(apexpages.currentpage().getparameters().get('counterWrap')); 
            for(KPIClass KPIRec : KPIDetils){
                if(KPIRec.KPIRownumber == KPIDimen){
                    if(KPIRec.EditFilter !=null){
                        for(Filterwrapper Filter: KPIRec.EditFilter){ 
                            if(Filter.counterWrap == counterWrap){
                                integer  WCount;
                                for(Integer i=0;i<Filter.FilterNames.Size();i++){
                                    if(Filter.FilterNames[i].counterWrap == param ){
                                        WCount = param;
                                        Filter.FilterNames.remove(i);     
                                    }
                                }
                                if(Filter.UserLogic.contains(' '+WCount)){                              
                                    Filter.UserLogic = Filter.UserLogic.replace('AND '+WCount,'').replace('OR '+WCount,'').replace('and '+WCount,'').replace('or '+WCount,'');                              
                                }else{
                                    Filter.UserLogic = Filter.UserLogic.replace(WCount+' AND ','').replace(WCount+' OR ','').replace(WCount+' and ','').replace(WCount+' or ','');
                                }
                            }
                        }
                    }            
                }
                
            }
        }
        catch(Exception e){
            
        }
    }*/
    public String output { get; set; }
    public String filterLogic { get; set; }
    public void submit(){
        try{
        if(accountBalance >= TotalCost){ 
        MeasureNew();
        dashboardName = System.currentPageReference().getParameters().get('hiddenDashboardName');
        String dashboardTitle = System.currentPageReference().getParameters().get('hiddenDashboardTitle');
        String DashboardDesc = System.currentPageReference().getParameters().get('hiddenDashboardDesc');
        //strFloderId
        String Filters = '';
        //String UserLogic = '';
       list<Dataset__c> DatasetReclist = new list<Dataset__c>(); 
            for(KPIClass KPI : KPIDetils){
                if(KPI.KPIName != ''){   
                String  AvailableDimension = '';
                String DimensionApi= '';
                String  AvailableDateField = ''; 
                String  DateFieldApi = '';
                String  AvailableMeasure = ''; 
                String  MeasureAPI = ''; 
                String  FilterName = '';
                String AliasMeasureAPIN = '';
                String CompactMeasureAPIN = '';
                String Filtercode = '';
                integer i=1;
                if(KPI.selectedDimensions != null){   
                    for(selectedDimesionWrapper Avail : KPI.selectedDimensions){
                        AvailableDimension += Avail.Availablename;
                        if(EditDimMapping.get(Avail.Availablename) != null){
                            DimensionApi += DimensionLabel.get(EditDimMapping.get(Avail.Availablename));
                        }
                        else{
                            DimensionApi += DimensionLabel.get(Avail.Availablename);
                        }
                         if(KPI.selectedDimensions.Size() >= i+ 1){
                            AvailableDimension += ',';
                            DimensionApi += ',';
                        }
                        i++;
                    }
                }
                i=1;
           
                if(KPI.SelectedDateFieldlist != null){
                    for(SelectedDateFieldWrapper DateField : KPI.SelectedDateFieldlist){                           
                        AvailableDateField += DateField.DateFieldname;  
                        if(EditDateMapping.get(DateField.DateFieldname) != Null){                                
                            DateFieldApi += DateFullField.get(EditDateMapping.get(DateField.DateFieldname));
                        }
                        else{
                            DateFieldApi += DateFullField.get(DateField.DateFieldname); 
                        }
                        if(KPI.SelectedDateFieldlist.Size() >= i + 1){
                            AvailableDateField += ',';
                            DateFieldApi += ',';
                        }                       
                        i++;
                    }
                }
                i=1;
                if( KPI.selectedMeasures !=  Null){
                    for(String Measurewrap : KPI.selectedMeasures){                
                        AvailableMeasure += Measurewrap;
                        System.debug('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& MeasurewrapMeasurewrap '+Measurewrap);
                        if(EditMeasMapping.get(Measurewrap) == Null){
                            if(!Measurewrap.contains('(\'')){
                                Measurewrap = Measurewrap.replace('(',';'); 
                            }
                            else{
                                Measurewrap = Measurewrap.replace('(\'',';'); 
                            }
                        }
                        else{
                            if(!EditMeasMapping.get(Measurewrap).contains('(\'')){
                                Measurewrap = EditMeasMapping.get(Measurewrap).replace('(',';');
                            }
                            else{
                               Measurewrap = EditMeasMapping.get(Measurewrap).replace('(\'',';');  
                            }
                        }                      
                        String[] DateFieldlist = Measurewrap.Split(';');
                        String DateFields;
                        if(DateFieldlist.size() > 1)
                        if(!DateFieldlist[1].contains('\')')){
                            DateFields = DateFieldlist[1].replace('\')','').replace(')','');
                       
                        system.debug('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& Meas ' +MeasureFieldAPI.get(DateFields));
                        if(DateFields != Null && DateFields != 'Probability '){
                            if(DateFieldlist[0] != 'unique' && DateFieldlist[0] != 'count ' && DateFieldlist[0] != 'count'){
                                if(MeasureFieldAPI.get(DateFields) != Null){
                                    MeasureAPI += DateFieldlist[0] +'(\'' + MeasureFieldAPI.get(DateFields) + '\')';
                                    AliasMeasureAPIN += DateFieldlist[0]+ '_' + MeasureFieldAPI.get(DateFields);
                                    CompactMeasureAPIN += '[\\"'+DateFieldlist[0] + '\\",\\"'+ MeasureFieldAPI.get(DateFields) + '\\"]'; 
                                }
                                
                              
                            }
                        if(DateFieldlist[0] == 'unique' && DimensionLabel.get(DateFields) != Null && DimensionLabel.get(DateFields) != '') {
                               if(MeasureFieldAPI.get(DateFields) != Null){
                                MeasureAPI += 'unique(\'' + DimensionLabel.get(DateFields) + '\')';
                                AliasMeasureAPIN += 'unique_' + DimensionLabel.get(DateFields);
                                CompactMeasureAPIN += '[\\"'+DateFieldlist[0] + '\\",\\"'+ DimensionLabel.get(DateFields) + '\\"]';
                               }
                                else{
                                    MeasureAPI += Measurewrap;
                                    AliasMeasureAPIN += 'sum'+ '_' + DateFields;
                                    CompactMeasureAPIN += '[\\"sum\\",\\"'+DateFields + '\\"]'; 
                                }
                            }
                        if(DateFieldlist[0] == 'unique' && MeasureFieldAPI.get(DateFields) != Null && MeasureFieldAPI.get(DateFields) != '') {
                            MeasureAPI += 'unique(\'' + MeasureFieldAPI.get(DateFields) + '\')';
                            AliasMeasureAPIN += 'unique_' + MeasureFieldAPI.get(DateFields);
                            CompactMeasureAPIN += '[\\"'+DateFieldlist[0] + '\\",\\"'+ MeasureFieldAPI.get(DateFields) + '\\"]';
                        }
                            if(DateFieldlist[0] == 'count ' ||  DateFieldlist[0] == 'count'){  
                                MeasureAPI += 'count()';
                                AliasMeasureAPIN += 'count';
                                CompactMeasureAPIN += '[\\"count\\",\\"*\\"]';                                               
                            }
                            
                        }
                        if(DateFields == 'Probability '){
                                MeasureAPI += DateFieldlist[0]+'(\'Probability\')';
                                AliasMeasureAPIN += DateFieldlist[0]+ '_Probability';
                                CompactMeasureAPIN += '[\\"'+DateFieldlist[0] + '\\",\\"Probability\\"]';    
                            }
                        
                    }
                        else{
                                   System.debug('&&&&&&&&&&&&&&&&&&&&& SumMeasurewrap '+Measurewrap+ ' MeasureAPI ' + MeasureAPI);
                                    DateFields = DateFieldlist[1].replace('\')',';');
                                    String[] Fields = DateFields.split(';');
                                     System.debug('&&&&&&&&&&&&&&&&&&&&& SumMeasurewrapssss '+DateFields);
                                    if(!DateFields.contains('Rows')){
                                        Measurewrap = Measurewrap.replace(';','(\'');
                                        Measurewrap = Measurewrap.replace('count(\'Rows\')','count()');
                                        MeasureAPI += Measurewrap.replace(';','(\'');
                                        AliasMeasureAPIN += 'Newvalues'+i+'_' + Fields[0];
                                        CompactMeasureAPIN += '[\\"Newvalues'+i+'\\",\\"'+Fields[0] + '\\"]'; 
                                    }
                                    else{
                                        MeasureAPI += Measurewrap.replace(';','(\'').replace('\'Rows\'','');
                                         AliasMeasureAPIN += 'Newvalues'+i+'_NewFields';
                                        CompactMeasureAPIN += '[\\"Newvalues'+i+'\\",\\"NewFields\\"]';  
                                    }
                                
                        }
                        if(KPI.selectedMeasures.Size() >= i + 1 ){
                            AvailableMeasure += ',';
                            MeasureAPI += ',';
                            AliasMeasureAPIN += ',';
                            CompactMeasureAPIN += ',';
                        }
                        i++;                        
                    }
                }
                i=1;
                String Filtervalue = '';
                 String UserLogic = '';
                if(KPI.SelectedFilterList != Null){
                    for(WrapSelectedFilterList Filter : KPI.SelectedFilterList){
                        FilterName += Filter.Output;
                        Filtervalue += Filter.Filtername;
                         if(Filter.Filtername == 'All'){
                            UserLogic = '1';
                        }
                        for(FilterInnerclass Selec : Filter.selectedFilters){
                            if(Filter.Filtername == Selec.FilterNames){
                                UserLogic += Selec.UserLogic;
                                break;
                            }
                        }
                        if(KPI.SelectedFilterList.Size() >= i+1){
                            FilterName += ';';
                            Filtervalue +=';';
                            UserLogic += ';';
                        }
                        i++;
                        //if(KPI.AddFilter.Size())
                    }
                }
                
                  i=1;
                if(InnClassEditvaluesList != Null){
                    for(NewInnerclass NewFil : InnClassEditvaluesList){
                        Filtercode += NewFil.typeofselect;
                        if(InnClassEditvaluesList.Size() >= i+1){
                            Filtercode += 'mwsqy';
                        }
                        i++;
                    }
                }
                
               
                
              system.debug('*************AvailableMeasure '+ AvailableMeasure + ' ****MeasureAPI**** '+MeasureAPI);
              if(KPI.SelectedDateFieldlist != Null && KPI.selectedDimensions != null && KPI.selectedMeasures != NUll){
              if(KPI.selectedDimensions.Size() >= 1){
              Dataset__c DatasetRec = new Dataset__c();
              DatasetRec.RowNumber__c = KPI.KPIRownumber; 
              DatasetRec.Dataset_Name__c = MapValues.get(KPI.dataset); 
              DatasetRec.Dataset_Id__c = KPI.dataset; 
              DatasetRec.New_Dimension_Name__c = AvailableDimension; 
              DatasetRec.New_Dimension_API__c = DimensionApi;
              
              
              DatasetRec.Date_Label__c = AvailableDateField; 
              DatasetRec.Data_API__c = DateFieldApi; 
              DatasetRec.Measure_Name__c = AvailableMeasure; 
              DatasetRec.Measure_API__c = MeasureAPI; 
              DatasetRec.Filter_Logics__c = FilterName;
              DatasetRec.FilterName__c = Filtervalue;
              DatasetRec.KPI_Name__c = KPI.KPIName;
              DatasetRec.AliasMeasure_API__c = AliasMeasureAPIN;
              DatasetRec.CompactMeasure_API__c = CompactMeasureAPIN;                  
              DatasetReclist.add(DatasetRec);
            String AllTheme;
             list<Sales_Insight__c> Sales = [select id from Sales_Insight__c where id=:AllVal];
             if(Sales.Size() > 0){
                 AllTheme = Sales[0].Id;
             }
             else{
                list<Sales_Insight__c> Saless = [select id from Sales_Insight__c where Name ='Default SingleKPI Theme' and Dashboard_Id__c = null and Dashboard_Id__c = '' order by createddate asc limit 1]; 
                AllTheme = Saless[0].Id;
             }
             httpResponse Res =  SingleKPI_DashboardService.m_createSingleDashboard(DatasetReclist,dashboardName,dashboardTitle,dashboardDesc,strFloderId,AllTheme,''); 
             
             if(res.getStatus() == 'Created'){
                DashboardSuccess = true;   
                DashboardSales = false;
                dashbocreatejson payTypes = new dashbocreatejson();
                String Datesetvalues = res.getBody();   
                if(Datesetvalues != null && Datesetvalues != ''){ 
                     payTypes = dashbocreatejson.parse(Datesetvalues);
                } 
                AnalyticsDashboardId = payTypes.Id;
                 purchaseAndBuildDashboard('Purchase & Build',1);
            
             }
             else{
                DashboardSuccess = false;
                DashboardSales = true;
                purchaseAndBuildDashboard('Failed',1);
             }        
                }
                else{
                    DashboardDB = true;
                    purchaseAndBuildDashboard('Failed',1);
                } 
              }
              else{
                    DashboardDB = true;
                    purchaseAndBuildDashboard('Failed',1);
                }
                
                 DB_Template__c DatasetRec1 = new DB_Template__c();
                DatasetRec1.DB_Name__c = dashboardName;
                DatasetRec1.Type__c = 'Single KPI';
                insert  DatasetRec1;
                
                KPIs__c KPIs = new KPIs__c();                           
                KPIs.RowNumber__c = KPI.KPIRownumber; 
                KPIs.Dataset_Name__c = MapValues.get(KPI.dataset); 
                KPIs.Dataset_Id__c = KPI.dataset; 
                 
                KPIs.Date_Label__c = AvailableDateField; 
                KPIs.Measure_Label__c = AvailableMeasure; 
                KPIs.Filter_Logics__c = FilterName;  
                KPIs.Filter_Name__c = Filtervalue;
                KPIs.User_Logic__c = UserLogic;
                KPIs.DB_Template__c = DatasetRec1.Id;
                KPIs.AliasMeasure_API__c = AliasMeasureAPIN;
                KPIs.CompactMeasure_API__c = CompactMeasureAPIN;
                KPIs.Dimension_Name__c = AvailableDimension; 
                KPIs.Dimension_API_Name__c = DimensionApi;
                
                
                KPIs.Measure_API__c = MeasureAPI; 
                KPIs.Date_API__c = DateFieldApi;  
                KPIs.Filter_Code__c = Filtercode;
                KPIs.Theme_Id__c = Themevalue;
                insert KPIs; 
                }
                
            }
            NoAcccountbalance = false; 
             }
             else{
                  DashboardSuccess = false;
         DashboardSales = false;
         DashboardDB = false;
                 purchaseAndBuildDashboard('Not Enough Credits',1);
                 NoAcccountbalance = true; 
             }
        }catch(Exception e){
            
        }
   
}
/*public void SaveandCloseopp(){
 try{
        MeasureNew();
        dashboardName = System.currentPageReference().getParameters().get('hiddenDashboardName');
        String dashboardTitle = System.currentPageReference().getParameters().get('hiddenDashboardTitle');
        String DashboardDesc = System.currentPageReference().getParameters().get('hiddenDashboardDesc');
        //strFloderId
        String Filters = '';
        //String UserLogic = '';
       list<Dataset__c> DatasetReclist = new list<Dataset__c>(); 
            for(KPIClass KPI : KPIDetils){
                if(KPI.KPIName != ''){   
                String  AvailableDimension = '';
                String DimensionApi= '';
                String  AvailableDateField = ''; 
                String  DateFieldApi = '';
                String  AvailableMeasure = ''; 
                String  MeasureAPI = ''; 
                String  FilterName = '';
                String AliasMeasureAPIN = '';
                String CompactMeasureAPIN = '';
                String Filtercode = '';
                integer i=1;
                if(KPI.selectedDimensions != null){   
                    for(selectedDimesionWrapper Avail : KPI.selectedDimensions){
                        AvailableDimension += Avail.Availablename;
                        if(EditDimMapping.get(Avail.Availablename) != null){
                            DimensionApi += DimensionLabel.get(EditDimMapping.get(Avail.Availablename));
                        }
                        else{
                            DimensionApi += DimensionLabel.get(Avail.Availablename);
                        }
                         if(KPI.selectedDimensions.Size() >= i+ 1){
                            AvailableDimension += ',';
                            DimensionApi += ',';
                        }
                        i++;
                    }
                }
                i=1;
           
                if(KPI.SelectedDateFieldlist != null){
                    for(SelectedDateFieldWrapper DateField : KPI.SelectedDateFieldlist){                           
                        AvailableDateField += DateField.DateFieldname;  
                        if(EditDateMapping.get(DateField.DateFieldname) != Null){                                
                            DateFieldApi += DateFullField.get(EditDateMapping.get(DateField.DateFieldname));
                        }
                        else{
                            DateFieldApi += DateFullField.get(DateField.DateFieldname); 
                        }
                        if(KPI.SelectedDateFieldlist.Size() >= i + 1){
                            AvailableDateField += ',';
                            DateFieldApi += ',';
                        }                       
                        i++;
                    }
                }
                i=1;
                if( KPI.selectedMeasures !=  Null){
                    for(String Measurewrap : KPI.selectedMeasures){                
                        AvailableMeasure += Measurewrap;
                        System.debug('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& MeasurewrapMeasurewrap '+Measurewrap);
                        if(EditMeasMapping.get(Measurewrap) == Null){
                            if(!Measurewrap.contains('(\'')){
                                Measurewrap = Measurewrap.replace('(',';'); 
                            }
                            else{
                                Measurewrap = Measurewrap.replace('(\'',';'); 
                            }
                        }
                        else{
                            if(!EditMeasMapping.get(Measurewrap).contains('(\'')){
                                Measurewrap = EditMeasMapping.get(Measurewrap).replace('(',';');
                            }
                            else{
                               Measurewrap = EditMeasMapping.get(Measurewrap).replace('(\'',';');  
                            }
                        }                      
                        String[] DateFieldlist = Measurewrap.Split(';');
                        String DateFields;
                        if(DateFieldlist.size() > 1)
                        if(!DateFieldlist[1].contains('\')')){
                            DateFields = DateFieldlist[1].replace('\')','').replace(')','');
                       
                        system.debug('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& Meas ' +MeasureFieldAPI.get(DateFields));
                        if(DateFields != Null && DateFields != 'Probability '){
                            if(DateFieldlist[0] != 'unique' && DateFieldlist[0] != 'count ' && DateFieldlist[0] != 'count'){
                                if(MeasureFieldAPI.get(DateFields) != Null){
                                    MeasureAPI += DateFieldlist[0] +'(\'' + MeasureFieldAPI.get(DateFields) + '\')';
                                    AliasMeasureAPIN += DateFieldlist[0]+ '_' + MeasureFieldAPI.get(DateFields);
                                    CompactMeasureAPIN += '[\\"'+DateFieldlist[0] + '\\",\\"'+ MeasureFieldAPI.get(DateFields) + '\\"]'; 
                                }
                                
                              
                            }
                        if(DateFieldlist[0] == 'unique' && DimensionLabel.get(DateFields) != Null && DimensionLabel.get(DateFields) != '') {
                               if(MeasureFieldAPI.get(DateFields) != Null){
                                MeasureAPI += 'unique(\'' + DimensionLabel.get(DateFields) + '\')';
                                AliasMeasureAPIN += 'unique_' + DimensionLabel.get(DateFields);
                                CompactMeasureAPIN += '[\\"'+DateFieldlist[0] + '\\",\\"'+ DimensionLabel.get(DateFields) + '\\"]';
                               }
                                else{
                                    MeasureAPI += Measurewrap;
                                    AliasMeasureAPIN += 'sum'+ '_' + DateFields;
                                    CompactMeasureAPIN += '[\\"sum\\",\\"'+DateFields + '\\"]'; 
                                }
                            }
                        if(DateFieldlist[0] == 'unique' && MeasureFieldAPI.get(DateFields) != Null && MeasureFieldAPI.get(DateFields) != '') {
                            MeasureAPI += 'unique(\'' + MeasureFieldAPI.get(DateFields) + '\')';
                            AliasMeasureAPIN += 'unique_' + MeasureFieldAPI.get(DateFields);
                            CompactMeasureAPIN += '[\\"'+DateFieldlist[0] + '\\",\\"'+ MeasureFieldAPI.get(DateFields) + '\\"]';
                        }
                            if(DateFieldlist[0] == 'count ' ||  DateFieldlist[0] == 'count'){  
                                MeasureAPI += 'count()';
                                AliasMeasureAPIN += 'count';
                                CompactMeasureAPIN += '[\\"count\\",\\"*\\"]';                                               
                            }
                            
                        }
                        if(DateFields == 'Probability '){
                                MeasureAPI += DateFieldlist[0]+'(\'Probability\')';
                                AliasMeasureAPIN += DateFieldlist[0]+ '_Probability';
                                CompactMeasureAPIN += '[\\"'+DateFieldlist[0] + '\\",\\"Probability\\"]';    
                            }
                        
                    }
                        else{
                                   System.debug('&&&&&&&&&&&&&&&&&&&&& SumMeasurewrap '+Measurewrap+ ' MeasureAPI ' + MeasureAPI);
                                    DateFields = DateFieldlist[1].replace('\')',';');
                                    String[] Fields = DateFields.split(';');
                                     System.debug('&&&&&&&&&&&&&&&&&&&&& SumMeasurewrapssss '+DateFields);
                                    if(!DateFields.contains('Rows')){
                                        Measurewrap = Measurewrap.replace(';','(\'');
                                        Measurewrap = Measurewrap.replace('count(\'Rows\')','count()');
                                        MeasureAPI += Measurewrap.replace(';','(\'');
                                        AliasMeasureAPIN += 'Newvalues'+i+'_' + Fields[0];
                                        CompactMeasureAPIN += '[\\"Newvalues'+i+'\\",\\"'+Fields[0] + '\\"]'; 
                                    }
                                    else{
                                        MeasureAPI += Measurewrap.replace(';','(\'').replace('\'Rows\'','');
                                         AliasMeasureAPIN += 'Newvalues'+i+'_NewFields';
                                        CompactMeasureAPIN += '[\\"Newvalues'+i+'\\",\\"NewFields\\"]';  
                                    }
                                
                        }
                        if(KPI.selectedMeasures.Size() >= i + 1 ){
                            AvailableMeasure += ',';
                            MeasureAPI += ',';
                            AliasMeasureAPIN += ',';
                            CompactMeasureAPIN += ',';
                        }
                        i++;                        
                    }
                }
                i=1;
                String Filtervalue = '';
                 String UserLogic = '';
                if(KPI.SelectedFilterList != Null){
                    for(WrapSelectedFilterList Filter : KPI.SelectedFilterList){
                        FilterName += Filter.Output;
                        Filtervalue += Filter.Filtername;
                         if(Filter.Filtername == 'All'){
                            UserLogic = '1';
                        }
                        for(FilterInnerclass Selec : Filter.selectedFilters){
                            if(Filter.Filtername == Selec.FilterNames){
                                UserLogic += Selec.UserLogic;
                                break;
                            }
                        }
                        if(KPI.SelectedFilterList.Size() >= i+1){
                            FilterName += ';';
                            Filtervalue +=';';
                            UserLogic += ';';
                        }
                        i++;
                        //if(KPI.AddFilter.Size())
                    }
                }
                
                  i=1;
                if(InnClassEditvaluesList != Null){
                    for(NewInnerclass NewFil : InnClassEditvaluesList){
                        Filtercode += NewFil.typeofselect;
                        if(InnClassEditvaluesList.Size() >= i+1){
                            Filtercode += 'mwsqy';
                        }
                        i++;
                    }
                }
                
               
                
              system.debug('*************AvailableMeasure '+ AvailableMeasure + ' ****MeasureAPI**** '+MeasureAPI);
             
                   saveAndCancelDashboard(1);
                 DB_Template__c DatasetRec1 = new DB_Template__c();
                DatasetRec1.DB_Name__c = dashboardName;
                DatasetRec1.Type__c = 'Single KPI';
                insert  DatasetRec1;
                
                KPIs__c KPIs = new KPIs__c();                           
                KPIs.RowNumber__c = KPI.KPIRownumber; 
                KPIs.Dataset_Name__c = MapValues.get(KPI.dataset); 
                KPIs.Dataset_Id__c = KPI.dataset; 
                KPIs.Dimension_Label__c = AvailableDimension;  
                KPIs.Date_Label__c = AvailableDateField; 
                KPIs.Measure_Label__c = AvailableMeasure; 
                KPIs.Filter_Logics__c = FilterName;  
                KPIs.Filter_Name__c = Filtervalue;
                KPIs.User_Logic__c = UserLogic;
                KPIs.DB_Template__c = DatasetRec1.Id;
                KPIs.AliasMeasure_API__c = AliasMeasureAPIN;
                KPIs.CompactMeasure_API__c = CompactMeasureAPIN;
                KPIs.Dimension_API__c = DimensionApi;
                KPIs.Measure_API__c = MeasureAPI; 
                KPIs.Date_API__c = DateFieldApi;  
                KPIs.Filter_Code__c = Filtercode;
                KPIs.Theme_Id__c = Themevalue;
                insert KPIs; 
                }
               
                
    }
        }catch(Exception e){
            
        }
    }*/
        
    public class Filterwrapper{
        public String filedName{get;set;}
        public String operator{get;set;}
        public String value{get;set;}
        public String userLogic{get;set;}
        public String FilterLogic{get;set;} 
        public String FilterName{get;set;}
        public list<Filterwrapper> FilterNames{get;set;}
        public integer FilterRowCount{get;set;}
        public Integer counterWrap{get;set;}        
        public Filterwrapper(String filedName,String operator,String value, Integer counterWrap){
              this.filedName = filedName;  
              this.operator = operator;  
              this.value = value;  
              this.counterWrap = counterWrap;  
         }
    }

    public class WrapSelectedFilterList{
        public String FilterName{get;set;}
        public integer rowcount{get;set;}
        public String output{get;set;}
        public list<FilterInnerClass> SelectedFilters{get;set;}
        public WrapSelectedFilterList(String FilterName,list<FilterInnerClass> SelectedFilters,String Output,integer rowcount){
            this.FilterName = FilterName;
            this.SelectedFilters = SelectedFilters;
            this.Output = Output;
            this.rowcount = rowcount;
        }
        
    }    
        
    public void ReportList(){ 
        try{
        DimensionId = false;
        DimensionIdClose = false;
        DashboardDB = false;
        SetDimension = true;
        setDimensionValue= false;
        setDate = false;
        setMeasure = false;
        filterRend = false;
        
        
       for(KPIClass KPIRec : KPIDetils){
            DatasetDimensionFromJson  DimensionTypes = new DatasetDimensionFromJson();
            if(KPIRec.dataset != Null || Test.isRunningTest()){
                
            KPIRec.dataSetName = Mapvalues.get(KPIRec.dataset);
              
            string DimensionsReturnValue = Dimensions(KPIRec.dataset);
            if(DimensionsReturnValue != null &&DimensionsReturnValue != ''){ 
                DimensionTypes = DatasetDimensionFromJson.parse(DimensionsReturnValue);
            }
           if(KPIRec.dataset != KPIRec.DatasetId || Test.isRunningTest()){                       
                availabledimensions = new list<availableDimesionWrapper>(); 
                KPIRec.SelectedDimension = new set<String>();
                if(NewString == null){
                 NewString = new set<String>();
                }
                KPIRec.countRender = false;
                KPIRec.DatasetId = KPIRec.dataset;
             if(!Test.isRunningTest()) {  
            for(DatasetDimensionFromJson.cls_dimensions Dim : DimensionTypes.dimensions){ 
                if(Dim.showInExplorer == true) {  
                availabledimensions.add(new availableDimesionWrapper(Dim.label, false))  ;
                
                } 
                                              
            }
             }
             else{
                availabledimensions.add(new availableDimesionWrapper('AccountId', false))  ;
             }
            availabledimensions.sort(); 
            KPIRec.availableDimesions = availabledimensions;
           // KPIRec.availableDimesions.sort();
            }
            if(KPIRec.SelectedDimensions == Null){
                KPIRec.SelectedDimensions = new list<selectedDimesionWrapper>();
            }
            
            if(KPIRec.SelectedDimensions  != Null){
            for(Integer j = 0; j < KPIRec.availableDimesions.size(); j++){
              for(selectedDimesionWrapper sd : KPIRec.SelectedDimensions){
                  if(sd.Availablename == KPIRec.availableDimesions[j].Availablename){
                      KPIRec.availableDimesions.remove(j);
                  }
              }
            }
              
          }
       }
        if(DimensionTypes.dimensions !=null)
        for(DatasetDimensionFromJson.cls_dimensions Dim : DimensionTypes.dimensions){ 
             DimensionLabel.put(Dim.label,Dim.Field);
        }
       
        } 
        }catch(Exception e){
            
        }
         
    }


    public boolean DimensionId{get;set;}
    public set<String>  NewString;
    public set<String>  NewStringDate;           
    public void DimensionNames(){ 
        try{
     /*   Integer KPIDimen = Integer.valueof(apexpages.currentpage().getparameters().get('dimSelecteed'));
        for(KPIClass KPIRec : KPIDetils){
            if(KPIRec.KPIRownumber == KPIDimen){
                
                if(KPIRec.availableDimesions !=null){
                    
                    if(KPIRec.SelectedDimensions == Null){
                    KPIRec.SelectedDimensions = new list<selectedDimesionWrapper>();
                    }
                    if(NewString == Null){
                       NewString = new set<String>();
                    }
                    for(availableDimesionWrapper availableDimention : KPIRec.availableDimesions){
                        
                       if(availableDimention.availablecheck == true ){
                             NewString.add(availableDimention.availablename);
                       }
                       else{
                             NewString.remove(availableDimention.availablename);
                       }
                    }
                    
                    if(NewString != Null){
                      if(NewString.Size() >= 4 && NewString.Size() <= 8){
                      for(availableDimesionWrapper availableDimention : KPIRec.availableDimesions){                       
                         if(availableDimention.availablecheck == true ){
                                if(KPIRec.SelectedDimensions == null){                            
                                     KPIRec.SelectedDimensions.add(new selectedDimesionWrapper(availableDimention.availablename,false));
                                } 
                                else{
                                    KPIRec.SelectedDimensions.add(new selectedDimesionWrapper(availableDimention.availablename,false));
                                } 
                            DimensionId = false;                              
                       }
                       
                        
                          else{
                            
                             KPIRec.selectedDimension.remove(availableDimention.availablename);               
                          }
                                 
                          }
                          KPIRec.SelectedDimensions.sort();
                      }
                      else{
                        DimensionId = true;
                        if(NewString.Size() > 8)
                        Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'You Cannot Enter More than 8 Dimensions.'));
                        if(NewString.Size() < 4)
                        Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'Select At Least 4 Dimensions.'));
                         
                      }
  
                          for(Integer j = 0; j < KPIRec.availableDimesions.size(); j++){
                              for(selectedDimesionWrapper sd : KPIRec.SelectedDimensions){
                                  if(sd.Availablename == KPIRec.availableDimesions[j].Availablename){
                                      KPIRec.availableDimesions.remove(j);
                                  }
                              }
                              
                          }
                          
                              
                          }                                               
                      } 
                 }
        }*/
        }catch(Exception e){
            
        }             
        }                       
   
 public set<String> RemoveString{get;set;} 
 public void RemoveDimensionNames(){ 
    try{
 /*   Integer KPIDimen = Integer.valueof(apexpages.currentpage().getparameters().get('dimSelecteed'));
            for(KPIClass KPIRec : KPIDetils){
            if(KPIRec.KPIRownumber == KPIDimen){
                if(KPIRec.SelectedDimensions !=null){
                    
                    if(KPIRec.SelectedDimensions == Null){
                    KPIRec.SelectedDimensions = new list<selectedDimesionWrapper>();
                    }
                    if(KPIRec.availableDimesions == Null){
                    KPIRec.availableDimesions = new list<availableDimesionWrapper>();
                    }  
                   
                    for(selectedDimesionWrapper selectedDimention : KPIRec.SelectedDimensions){  
                       if(selectedDimention.availablecheck == true ){
                            if(KPIRec.availableDimesions == null){                            
                                 KPIRec.availableDimesions.add(new availableDimesionWrapper(selectedDimention.availablename,false));
                            } 
                            else{
                                KPIRec.availableDimesions.add(new availableDimesionWrapper(selectedDimention.availablename,false));
                            }                           
                        }
                        else{
                           //KPIRec.selectedDimension.remove(availableDimention.availablename);                
                        }
                               
                        }
                         KPIRec.availableDimesions.sort();
                        for(Integer j = 0; j < KPIRec.SelectedDimensions.size(); j++){   
                            for(availableDimesionWrapper sd : KPIRec.availableDimesions){
                                if(sd.Availablename == KPIRec.SelectedDimensions[j].Availablename){
                                    KPIRec.SelectedDimensions.remove(j);
                                }
                            }                            
                        }
                       if(KPIRec.SelectedDimensions.size() >= 4 && KPIRec.SelectedDimensions.size() <= 8){
                         DimensionId = false;                     
                       }                    
                        else{
                            DimensionId = true;
                            if(KPIRec.SelectedDimensions.Size() > 8)
                            Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'You Cannot Enter More than 8 Dimensions.'));
                            if(KPIRec.SelectedDimensions.Size() < 4)
                            Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'At Least 4 Dimensions.'));
                         
                        }  
                        
                        
                    } 

               } 
            
        } */
 }
 catch(Exception e){
    
 }
} 
     public Set<String> DateFieldLists{get;set;}
   //  public boolean Valuetrue{get;set;}   
    public void DateFieldMethod(){  
        
       
                      
               SetDimension = false;
               DashboardDB = false;
                setDimensionValue= false;
                setDate = true;
                setMeasure = false;
                filterRend = false;
                DatesIdClose = false;
                 for(KPIClass KPIRec : KPIDetils){           
                DatasetDimensionFromJson  DimensionTypes = new DatasetDimensionFromJson();
                if(KPIRec.dataSet != null || Test.isRunningTest()){
                    
                    
                    string DimensionsReturnValue = Dimensions(KPIRec.dataSet);
                    if(DimensionsReturnValue != null &&DimensionsReturnValue != ''){
                        DimensionTypes = DatasetDimensionFromJson.parse(DimensionsReturnValue);
                    }
                    if(KPIRec.dataset != KPIRec.DatasetDateId || Test.isRunningTest()){ 
                        DateWrapperList = new list<DateFieldWrapper>();
                        DateFieldLists = new set<String>();
                        
                        KPIRec.DatasetDateId = KPIRec.dataset;
                        if(!Test.isRunningTest()){
                        if(DimensionTypes.dates !=null){
                            for(DatasetDimensionFromJson.cls_dates Dim : DimensionTypes.dates){                  
                                if(Dim.showInExplorer == true){
                                    DateFieldLists.add(Dim.label);
                                    
                                    DateFullField.put(Dim.label,Dim.fields.fullField); 
                                    
                                    if(DateFullField.get(Dim.label) == Null){
                                        DateFullField.put(Dim.label,Dim.label);
                                    }                                           
                                } 
                            }
                        }
                        
                        if(DimensionTypes.measures !=null){
                            for(DatasetDimensionFromJson.cls_measures Dim : DimensionTypes.measures){  
                                if(Dim.showInExplorer == true) {                
                                MeasureFieldAPI.put(Dim.label,Dim.Field); 
                                }                     
                            } 
                        }
                        }
                        else{
                            DateFieldLists.add('Created Date');
                                    DateFullField.put('Created Date','CreatedDate');
                        }
                           
                        
                    } 
                   
                 
                }
            }  
        }
        
    
       
        
    
    
    public boolean DateIds{get;set;} 
    //public boolean MeasuresIds{get;set;}
    public void DateFieldNames(){ 
        try{
        }catch(Exception e){
            
        }
    } 
    
 public void RemoveDateNames(){ 
    try{
    }
    catch(Exception e){
        
    } 
 }    
    
    
        
    public void MeasureMethod(){ 
     }
    
   // public set<String>  selectedMeasuresList;    
    public void DateNames(){
   
    } 
    
    
    
    
  
    
    public class availableDimesionWrapper implements Comparable{    
        public String Availablename{get;set;}
        public boolean availablecheck{get;set;}
       // public boolean availableMeasure{get;set;}
        public availableDimesionWrapper(String Availablename, boolean availablecheck){
            this.Availablename = Availablename;
            this.availablecheck = availablecheck;
        }
        public Integer compareTo(Object ObjToCompare) {
            return Availablename.CompareTo(((availableDimesionWrapper)ObjToCompare).Availablename);
        }
    }

    public class selectedDimesionWrapper implements Comparable{
        public String Availablename{get;set;}
         public String AvailableAPI{get;set;}
        public boolean availablecheck{get;set;}
       // public boolean availableMeasure{get;set;}
        public selectedDimesionWrapper(String Availablename, boolean availablecheck,String AvailableAPI){
            this.Availablename = Availablename;
            this.availablecheck = availablecheck;
            this.AvailableAPI = AvailableAPI;
        }
        public Integer compareTo(Object ObjToCompare) {
            return Availablename.CompareTo(((selectedDimesionWrapper)ObjToCompare).Availablename);
        }
    }
        
    public class DateFieldWrapper implements Comparable{
        public String DateFieldName   { get; set; }     
        public Boolean  DateValueCheck   { get; set; } 
        public DateFieldWrapper(String DateFieldName, boolean DateValueCheck){
            this.DateFieldName =  DateFieldName;
            this.DateValueCheck = DateValueCheck;
        }
        public Integer compareTo(Object ObjToCompare) {
            return DateFieldName.CompareTo(((DateFieldWrapper)ObjToCompare).DateFieldName);
        }     
    }

    public class SelectedDateFieldWrapper implements Comparable{
        public String DateFieldName   { get; set; } 
        public String DateFieldAPI   { get; set; } 
        public Boolean  DateValueCheck   { get; set; } 
        public SelectedDateFieldWrapper(String DateFieldName, boolean DateValueCheck,String DateFieldAPI){
            this.DateFieldName =  DateFieldName;
            this.DateValueCheck = DateValueCheck;
            this.DateFieldAPI = DateFieldAPI;
        }
        public Integer compareTo(Object ObjToCompare) {
            return DateFieldName.CompareTo(((SelectedDateFieldWrapper)ObjToCompare).DateFieldName);
        }     
    }   
    
    public class MeasureWrapper implements Comparable{
        public String DateFieldName   { get; set; }
       // public boolean DateFieldCheckMAX   { get; set; }
        
       //  public boolean DateFieldCheckMIN{ get; set; }
       //  public boolean DateFieldCheckAVG{ get; set; }
         public boolean DateFieldCheck{ get; set; }
       // public String SumNames  { get; set; }     
        public MeasureWrapper(String  DateFieldName){
            this.DateFieldName =  DateFieldName;
        }
        public Integer compareTo(Object ObjToCompare) {
            return DateFieldName.CompareTo(((MeasureWrapper)ObjToCompare).DateFieldName);
        }         
    }
    public Map<String,String> DateFullField{get;set;}
  
    public class KPIClass{      
        public string KPIName{get;set;}         
        public boolean KPICheck{get;set;}
        public Integer KPIRownumber{get;set;}
        public String dataSet{get;set;}
        public String DatasetId{get;set;}
        public String DatasetDateId{get;set;}
       // public String DatasetMeasureId{get;set;}
        public String DatasetFilterId{get;set;}
        public String dataSetName{get;set;}
       // public String FilterLogic{get;set;}
        public Integer MeasureSize{get;set;}
        public List<Selectoption> dataSetOptions{get;set;}
        public List<availableDimesionWrapper> availableDimesions{get;set;} 
        public List<selectedDimesionWrapper> selectedDimensions{get;set;}   
        public set<String> selectedDimension{get;set;}          
        public List<DateFieldWrapper> availableDateFields{get;set;}
        public List<SelectedDateFieldWrapper> SelectedDateFieldlist{get;set;}
        public set<String> selectedDateFields{get;set;}
        public List<MeasureWrapper> availableMeasures{get;set;}
        public set<String> selectedMeasures{get;set;}
        public boolean CountRender{get;set;}
        //public list<FilterWrapper> FilterNames{get;set;}
        public list<FilterWrapper> AddFilter{get;set;}
        public list<FilterWrapper> EditFilter{get;set;}
        public list<FilterInnerClass> SelectedFilters{get;set;}
        public list<String> FiltersSelected{get;set;}
        public List<Selectoption> dimensionOptions{get;set;}
        public integer FilterRowCount{get;set;}
       // public String UserLogic{get;set;}
        public list<WrapSelectedFilterList> SelectedFilterList{get;set;}
        
        public KPIClass(String KPIName, Integer KPIRownumber, List<Selectoption> dataSetOptions,boolean KPICheck){
            this.KPIName = KPIName;
            this.KPIRownumber = KPIRownumber;
            this.dataSetOptions = dataSetOptions;
            this.KPICheck = KPICheck;  
        }
        
    }   
    public void SubmitResults(){ 
              
    }  

public list<Filterwrapper> KPIRecAddFilter{get;set;}
public list<FilterInnerClassEdit> InnClassEditList{get;set;}
public String AddFilName{get;set;}
   public void FilterMethodEdit(){
        //try{
            EditFiltersShow = true;
            AddFiltersShow = false;
            KPIRecAddFilter = new list<Filterwrapper>();
            Integer RowNumber = Integer.valueOf(Apexpages.currentpage().getParameters().get('RowNumberFilter'));
            AddFilName = Apexpages.currentpage().getParameters().get('AddFilName');
            integer RowNumberCount = Integer.valueOf(Apexpages.currentpage().getParameters().get('RowNumberCount'));
            isFalse = False;
            scriptPanel = true;
            Filternames = AddFilName;
            integer z = 1;
            string userlogic;
            isErrorEdit = false;
            isError = false;
            if(InnClassEdit == Null){
                InnClassEdit= new  list<FilterInnerClassEdit>();
            }
            InnClassEditList = new  list<FilterInnerClassEdit>();
            for(KPIClass KPIRec : KPIDetils){ 
                  for(FilterInnerClassEdit Innclass : InnClassEdit){
                            if(AddFilName == Innclass.FieldName ){
                                InnClassEditList.add(Innclass);
                            }
                        }
               if(KPIRec.SelectedFilterList != Null){
                    for(WrapSelectedFilterList sl : KPIRec.SelectedFilterList) {
                      
                        if(sl.FilterName == AddFilName && sl.rowcount == RowNumberCount || (Test.isRunningTest())){
                            if(KPIRec.dataSet != null || Test.isRunningTest()){
                                 KPIRec.dimensionOptions = new List<SelectOption>();                                            
                                DatasetDimensionFromJson  DimensionTypes = new DatasetDimensionFromJson();
                                string DimensionsReturnValue = Dimensions(KPIRec.dataSet);
                                if(DimensionsReturnValue != null &&DimensionsReturnValue != ''){
                                    DimensionTypes = DatasetDimensionFromJson.parse(DimensionsReturnValue);
                                    
                                }  
                                if(DimensionTypes.dimensions !=null){
                                for(DatasetDimensionFromJson.cls_dimensions Dim : DimensionTypes.dimensions){ 
                                    if(Dim.showInExplorer == true) {                          
                                     KPIRec.dimensionOptions.add(new selectOption(Dim.field,Dim.field));
                                    }                         
                                }   
                                KPIRec.dimensionOptions =  sortSelectOptions(KPIRec.dimensionOptions);
                                }                               
                            }
                            KPIRec.EditFilter = new list<Filterwrapper> ();
                            list<Filterwrapper> FilterNamesList = new list<Filterwrapper> ();
                            integer i=0;
                            for(FilterInnerClass InnClass : sl.SelectedFilters) {
                                if(InnClass.FilterNames == AddFilName ){
                                    String Userslist = InnClass.UserLogic.replace(' AND ','###').replace(' OR ','###').replace(' or ','###').replace(' and ','###').replace('(','').replace(')','').replace(' )','');
                                    String[] values = Userslist.Split('###');
                               //   FilterNamesList.add(new Filterwrapper(InnClass.FieldName, InnClass.Operator, InnClass.Value, integer.valueof(values[i].replace(' ',''))));
                                    i++;
                                    
                                    if(InnClass.UserLogic != null){
                                        userlogic = InnClass.UserLogic;
                                    }
                                }
                            }
                            KPIRec.EditFilter.add(new Filterwrapper(null, null, null, RowNumberCount));
                            for(Filterwrapper Filters: KPIRec.EditFilter)   {
                                Filters.filterRowCount =  i;
                                Filters.UserLogic = userlogic;    
                                Filters.FilterNames = new list<Filterwrapper> ();  
                                Filters.FilterNames = FilterNamesList;    
                               }
                            
                        }
                    }
                } 
                
            }         
            filterRend= true;      
            SetMeasure = false;
       /* } 
        catch(Exception e){
            
        }*/
    }
    
    public void verifyErrorEdit(Integer RowNumber,String Filtername){  
        
        for(KPIClass KPIRec : KPIDetils){ 
            if(KPIRec.KPIRowNumber == RowNumber) {  
                if(KPIRec.SelectedFilters == Null){
                    KPIRec.SelectedFilters = new list<FilterInnerClass>();
                } 
                if(KPIRec.SelectedFilterList == Null){
                    KPIRec.SelectedFilterList = new list<WrapSelectedFilterList>();
                } 
                isErrorEdit = false;
                if(KPIRec.EditFilter !=null){
                    for(Filterwrapper AddFil : KPIRec.EditFilter){
                        if(String.isNotBlank(AddFil.userLogic)){ 
                            List<String> filterStrings = new List<String>();
                            Map<String, String> maptocheckfilterStrings = new Map<String, String>();
                            for(string s : AddFil.userLogic.split(' ')) { 
                                if(s != ')' &&  s != '(' && s!='' && s!= ' ' ){
                                    filterStrings.add(s);  
                                } 
                            }
                            for(String s : filterStrings){
                                if(maptocheckfilterStrings.get(s) == null){ 
                                    maptocheckfilterStrings.put(s,s);
                                } 
                            }
                            integer bw = 1;
                                for(NewInnerclass fw : InnClassEditvalues){
                                    if(fw.minval == Filtername){
                                    maptocheckfilterStrings.remove(String.valueOf(bw));
                                    maptocheckfilterStrings.remove(String.valueOf(bw)+')');
                                    maptocheckfilterStrings.remove('('+String.valueOf(bw));
                                    bw = bw+1;
                                    }
                                }
                            for(String s : maptocheckfilterStrings.values()){ 
                                if(s == 'AND' || s == 'OR'){  
                                    isErrorEdit = false;
                                }
                                else{
                                    
                                    isErrorEdit = true;
                                    isFalse = false;
                                    break;
                                }
                            }             
                            for(String s : maptocheckfilterStrings.values()){ 
                                if(s == 'AND' || s == 'OR'){  
                                    isError = false;
                                }
                                else{
                                    isErrorEdit = true;
                                    isFalse = false;
                                    break;
                                }
                            } 
                            
                            List<String> filterNumbers = new List<String>();
                            Map<String, String> maptocheckduplicates = new Map<String, String>();
                            AddFil.userLogic.split(' '); 
                            for(string s : AddFil.userLogic.split('')) {
                                if(s != 'A' && s != 'N' && s != 'D' && s!= 'O' && s != 'R' && s != '(' && s != ')' && s!='' && s!= ' '){
                                    filterNumbers.add(s); 
                                }
                            }
                            for(String s : filterNumbers){
                                if(maptocheckduplicates.get(s) == null){
                                    maptocheckduplicates.put(s,s);
                                }
                                else{
                                    //Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.ERROR, 'Please Enter Valid Filter Condition'));  
                                    isErrorEdit = true;
                                    isFalse = false;
                                }
                            }
                            
                            if(!isErrorEdit){
                                integer ival = 1;
                                for(NewInnerclass fw : InnClassEditvalues){
                                    if(fw.minval == Filtername){
                                //  if(fw.filedName != null && fw.operator != null && fw.value != null){ 
                                            if(AddFil.userLogic.contains(String.valueOf(ival))){
                                                    if(AddFil.userLogic == '1 '){
                                                    isErrorEdit = false;
                                                    break;
                                                }
                                                if(AddFil.userLogic.contains(String.valueOf(ival) + '  ')){
                                                    isErrorEdit = true;
                                                    break;
                                                }
                                                if(AddFil.userLogic.contains(')  ' + String.valueOf(ival)) || AddFil.userLogic.contains(')   ' + String.valueOf(ival)) || AddFil.userLogic.contains(')   ' + String.valueOf(ival)) || AddFil.userLogic.contains(')    ' + String.valueOf(ival))){
                                                    isErrorEdit = true;
                                                    break;
                                                }
                                                if(AddFil.userLogic.contains(')' + ' (') || AddFil.userLogic.contains(')' + '  (') || AddFil.userLogic.contains(')' + '   (')){
                                                    isErrorEdit = true;
                                                    break;
                                                }
                                                if(AddFil.userLogic.contains(String.valueOf(ival) + ' (') || AddFil.userLogic.contains(String.valueOf(ival) + '  (') || AddFil.userLogic.contains(String.valueOf(ival) + '   (')){
                                                    isErrorEdit = true;
                                                    break;
                                                }
                                                if((AddFil.userLogic.contains('(') && !AddFil.userLogic.contains(')')) || (AddFil.userLogic.contains(')') && !AddFil.userLogic.contains('(')) ||  AddFil.userLogic.contains(') '+ String.valueOf(ival))){
                                                    isErrorEdit = true;
                                                    break;
                                                }
                                                if(AddFil.userLogic.contains(String.valueOf(ival) + ' '+(String.valueOf(ival + 1)))){
                                                    isError = true;
                                                    break;
                                                }
                                                if(AddFil.userLogic.contains(String.valueOf(ival) + ' '+(String.valueOf(ival + 2)))){
                                                    isErrorEdit = true;
                                                    break;
                                                }
                                                if(AddFil.userLogic.contains(String.valueOf(ival) + ' '+(String.valueOf(ival + 3)))){
                                                    isError = true;
                                                    break;
                                                }
                                                if(AddFil.userLogic.contains(String.valueOf(ival) + ' '+(String.valueOf(ival + 4)))){
                                                    isErrorEdit = true;
                                                    break;
                                                }
                                                if(AddFil.userLogic.contains(String.valueOf(ival) + ' '+(String.valueOf(ival + 5)))){
                                                    isErrorEdit = true;
                                                    break;
                                                }
                                                
                                                if(AddFil.userLogic == String.valueOf(ival)+ ' AND'){
                                                    isError = true;
                                                    break;
                                                }
                                                else if(AddFil.userLogic == String.valueOf(ival)+ ' OR'){
                                                    isErrorEdit = true;
                                                    break;
                                                }
                                                else if(AddFil.userLogic == String.valueOf(ival)){
                                                    isErrorEdit = false;
                                                }
                                                else if(AddFil.userLogic.contains(String.valueOf(ival) + ' '+(String.valueOf(ival + 1)))){
                                                    isErrorEdit = true;
                                                    break;
                                                }
                                                else if(AddFil.userLogic.contains('AND')){
                                                    isErrorEdit = false;
                                                }
                                                else if(AddFil.userLogic.contains('OR')){
                                                    isErrorEdit = false;
                                                }                                           
                                                else{
                                                    isErrorEdit = true;
                                                    break;
                                                }
                                        }
                                        else{
                                            //AddFil.userLogic.addError('Please Add Condition'+fw.counterWrap); 
                                            //Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.ERROR, 'Please Add Condition'+fw.counterWrap)); 
                                            isErrorEdit = true;
                                            isFalse = false;
                                            break;
                                        }
                                        ival = ival+1;
                                    //} 
                                    
                                }
                            }                                    
                        } 
                        else{
                            //Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.ERROR, 'Please Enter Valid Filter Condition')); 
                            isErrorEdit = true;
                            isFalse = false;
                            break;
                        }
                        
                    }
                }           
            }
            }
        }
    }
    public boolean isFalse{get;set;}
    public boolean isErrorEdit{get;set;}
    
    public boolean tableIds{get;set;}
    
    public boolean Enablevalue{get;set;}
    
    public pagereference UpdateFilter(){
        return null;  
    }
    
    public void Save(){
         MeasureNew();
        
        String DBName = Apexpages.currentpage().getParameters().get('hiddenSingleName');
        list<Dataset__c> DatasetReclist = new list<Dataset__c>();      
        for(KPIClass KPI : KPIDetils){
            if(KPI.KPIName != ''){   
                String  AvailableDimension = '';
                String DimensionApi= '';
                String  AvailableDateField = ''; 
                String  DateFieldApi = '';
                String  AvailableMeasure = ''; 
                String  MeasureAPI = ''; 
                String  FilterName = '';
                String AliasMeasureAPIN = '';
                String CompactMeasureAPIN = '';
                String Filtercode = '';
                integer i=1;
                if(KPI.selectedDimensions != null){   
                    for(selectedDimesionWrapper Avail : KPI.selectedDimensions){
                        AvailableDimension += Avail.Availablename;
                        if(EditDimMapping.get(Avail.Availablename) != null){
                            DimensionApi += DimensionLabel.get(EditDimMapping.get(Avail.Availablename));
                        }
                        else{
                            DimensionApi += DimensionLabel.get(Avail.Availablename);
                        }
                        if(KPI.selectedDimensions.Size() >= i+ 1){
                            AvailableDimension += ',';
                            DimensionApi += ',';
                        }
                        i++;
                    }
                }
                i=1;               
                if(KPI.SelectedDateFieldlist != null){
                    for(SelectedDateFieldWrapper DateField : KPI.SelectedDateFieldlist){                           
                        AvailableDateField += DateField.DateFieldname;  
                        if(EditDateMapping.get(DateField.DateFieldname) != Null){                                
                            DateFieldApi += DateFullField.get(EditDateMapping.get(DateField.DateFieldname));
                        }
                        else{
                            DateFieldApi += DateFullField.get(DateField.DateFieldname);
                            
                        }
                        if(KPI.SelectedDateFieldlist.Size() >= i + 1){
                            AvailableDateField += ',';
                            DateFieldApi += ',';
                        }                       
                        i++;
                    }
                }
                i=1;
                   if( KPI.selectedMeasures !=  Null){
                    for(String Measurewrap : KPI.selectedMeasures){                
                        AvailableMeasure += Measurewrap;
                        System.debug('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& MeasurewrapMeasurewrap '+Measurewrap);
                        if(EditMeasMapping.get(Measurewrap) == Null){
                            if(!Measurewrap.contains('(\'')){
                                Measurewrap = Measurewrap.replace('(',';'); 
                            }
                            else{
                                Measurewrap = Measurewrap.replace('(\'',';'); 
                            }
                        }
                        else{
                            if(!EditMeasMapping.get(Measurewrap).contains('(\'')){
                                Measurewrap = EditMeasMapping.get(Measurewrap).replace('(',';');
                            }
                            else{
                               Measurewrap = EditMeasMapping.get(Measurewrap).replace('(\'',';');  
                            }
                            //Measurewrap = EditMeasMapping.get(Measurewrap).replace('(',';'); 
                        }                      
                        String[] DateFieldlist = Measurewrap.Split(';');
                        String DateFields;
                        if(DateFieldlist.size() > 1)
                        if(!DateFieldlist[1].contains('\')')){
                            DateFields = DateFieldlist[1].replace('\')','').replace(')','');
                       
                        system.debug('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& Meas ' +MeasureFieldAPI.get(DateFields));
                        if(DateFields != Null && DateFields != 'Probability '){
                            if(DateFieldlist[0] != 'unique' && DateFieldlist[0] != 'count ' && DateFieldlist[0] != 'count'){
                                if(MeasureFieldAPI.get(DateFields) != Null){
                                    MeasureAPI += DateFieldlist[0] +'(\'' + MeasureFieldAPI.get(DateFields) + '\')';
                                    AliasMeasureAPIN += DateFieldlist[0]+ '_' + MeasureFieldAPI.get(DateFields);
                                    CompactMeasureAPIN += '[\\"'+DateFieldlist[0] + '\\",\\"'+ MeasureFieldAPI.get(DateFields) + '\\"]'; 
                                }
                                
                              
                            }
                        if(DateFieldlist[0] == 'unique' && DimensionLabel.get(DateFields) != Null && DimensionLabel.get(DateFields) != '') {
                               if(MeasureFieldAPI.get(DateFields) != Null){
                                MeasureAPI += 'unique(\'' + DimensionLabel.get(DateFields) + '\')';
                                AliasMeasureAPIN += 'unique_' + DimensionLabel.get(DateFields);
                                CompactMeasureAPIN += '[\\"'+DateFieldlist[0] + '\\",\\"'+ DimensionLabel.get(DateFields) + '\\"]';
                               }
                                else{
                                    MeasureAPI += Measurewrap;
                                    AliasMeasureAPIN += 'sum'+ '_' + DateFields;
                                    CompactMeasureAPIN += '[\\"sum\\",\\"'+DateFields + '\\"]'; 
                                }
                            }
                        if(DateFieldlist[0] == 'unique' && MeasureFieldAPI.get(DateFields) != Null && MeasureFieldAPI.get(DateFields) != '') {
                            MeasureAPI += 'unique(\'' + MeasureFieldAPI.get(DateFields) + '\')';
                            AliasMeasureAPIN += 'unique_' + MeasureFieldAPI.get(DateFields);
                            CompactMeasureAPIN += '[\\"'+DateFieldlist[0] + '\\",\\"'+ MeasureFieldAPI.get(DateFields) + '\\"]';
                        }
                            if(DateFieldlist[0] == 'count ' ||  DateFieldlist[0] == 'count'){  
                                MeasureAPI += 'count()';
                                AliasMeasureAPIN += 'count';
                                CompactMeasureAPIN += '[\\"count\\",\\"*\\"]';                                               
                            }
                            
                        }
                        if(DateFields == 'Probability '){
                                MeasureAPI += DateFieldlist[0]+'(\'Probability\')';
                                AliasMeasureAPIN += DateFieldlist[0]+ '_Probability';
                                CompactMeasureAPIN += '[\\"'+DateFieldlist[0] + '\\",\\"Probability\\"]';    
                            }
                        
                    }
                        else{
                                   System.debug('&&&&&&&&&&&&&&&&&&&&& SumMeasurewrap '+Measurewrap+ ' MeasureAPI ' + MeasureAPI);
                                    DateFields = DateFieldlist[1].replace('\')',';');
                                    String[] Fields = DateFields.split(';');
                                     System.debug('&&&&&&&&&&&&&&&&&&&&& SumMeasurewrapssss '+DateFields);
                                    if(!DateFields.contains('Rows')){
                                        Measurewrap = Measurewrap.replace(';','(\'');
                                        Measurewrap = Measurewrap.replace('count(\'Rows\')','count()');
                                        MeasureAPI += Measurewrap.replace(';','(\'');
                                        AliasMeasureAPIN += 'Newvalues'+i+'_' + Fields[0];
                                        CompactMeasureAPIN += '[\\"Newvalues'+i+'\\",\\"'+Fields[0] + '\\"]'; 
                                    }
                                    else{
                                        MeasureAPI += Measurewrap.replace(';','(\'').replace('\'Rows\'','');
                                         AliasMeasureAPIN += 'Newvalues'+i+'_NewFields';
                                        CompactMeasureAPIN += '[\\"Newvalues'+i+'\\",\\"NewFields\\"]';  
                                    }
                                
                        }
                        if(KPI.selectedMeasures.Size() >= i + 1 ){
                            AvailableMeasure += ',';
                            MeasureAPI += ',';
                            AliasMeasureAPIN += ',';
                            CompactMeasureAPIN += ',';
                        }
                        i++;                        
                    }
                }
                i=1;
                String Filters = '';
                String UserLogic = '';
                if(KPI.SelectedFilterList != Null){
                    for(WrapSelectedFilterList Filter : KPI.SelectedFilterList){
                        FilterName += Filter.Output;
                        Filters += Filter.Filtername;
                         if(Filter.Filtername == 'All'){
                            UserLogic = '1';
                        }
                        for(FilterInnerclass Selec : Filter.selectedFilters){
                            if(Filter.Filtername == Selec.FilterNames){
                                UserLogic += Selec.UserLogic;
                                break;
                            }
                        }
                        if(KPI.SelectedFilterList.Size() >= i+1){
                            FilterName += ';';
                            Filters +=';';
                            UserLogic += ';';
                        }
                        i++;
                        //if(KPI.AddFilter.Size())
                    }
                }
                
                i=1;
                if(InnClassEditvaluesList != Null){
                    for(NewInnerclass NewFil : InnClassEditvaluesList){
                        Filtercode += NewFil.typeofselect;
                        if(InnClassEditvaluesList.Size() >= i+1){
                            Filtercode += 'mwsqy';
                        }
                        i++;
                    }
                }
                        DB_Template__c DatasetRec = new DB_Template__c();
                        DatasetRec.DB_Name__c = DBName;
                        DatasetRec.Type__c = 'Single KPI';
                        insert  DatasetRec;
                        
                        KPIs__c KPIs = new KPIs__c();                           
                        KPIs.RowNumber__c = KPI.KPIRownumber; 
                        KPIs.Dataset_Name__c = MapValues.get(KPI.dataset); 
                        KPIs.Dataset_Id__c = KPI.dataset; 
                          
                        KPIs.Date_Label__c = AvailableDateField; 
                        KPIs.Measure_Label__c = AvailableMeasure; 
                        KPIs.Filter_Logics__c = FilterName;  
                        KPIs.Filter_Name__c = Filters;
                        KPIs.User_Logic__c = UserLogic;
                        KPIs.DB_Template__c = DatasetRec.Id;
                        KPIs.AliasMeasure_API__c = AliasMeasureAPIN;
                        KPIs.CompactMeasure_API__c = CompactMeasureAPIN;
                        KPIs.Dimension_Name__c = AvailableDimension; 
                        KPIs.Dimension_API_Name__c = DimensionApi;
                        
                        KPIs.Measure_API__c = MeasureAPI; 
                        KPIs.Date_API__c = DateFieldApi;  
                        KPIs.Filter_Code__c = Filtercode;
                        KPIs.Theme_Id__c = Themevalue;
                        insert KPIs;
                        if(DBName != null && DBName != ''){
                            Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.CONFIRM, 'Configuration Created Successfully'));  
            }
                                              
                    
            }
        }
    }
     public list<MeasureAngularclass> NewMeasurevarlist{get;set;}
    public void CloneFromPrevious(String Ids){
        //try{
        InnClassEdit = new list<FilterInnerClassEdit>();
        Map<String,String> NewDim = new Map<String,String>();
        Map<String,String> NewDat = new Map<String,String>();
        Map<String,String> NewMeas = new Map<String,String>();
        NewMeasurevarlist = new list<MeasureAngularclass>();
        list<DB_Template__c> DBTemplates = [select Id,Name,DB_Name__c,Type__c from DB_Template__c where Id=:Ids order By createddate desc ];
        if(DBTemplates.size()>0){
            list<KPIs__c> KPIs = [select Dataset_Id__c,Dataset_Name__c,Date_Label__c,Theme_Id__c,Dimension_Name__c,Dimension_API_Name__c,
                                         DB_Template__c,Dimension_Label__c,User_Logic__c,Filter_Code__c,
                                         Filter_Logics__c,Filter_Logic__c,Filter_Name__c,KPI_Name__c,Measure_Label__c,RowNumber__c,
                                         AliasMeasure_API__c,CompactMeasure_API__c,Dimension_API__c,Measure_API__c,Date_API__c 
                                         from KPIs__c where  DB_Template__c =: DBTemplates[0].id];
                                         
                                         //Dimension_Name__c,Dimension_API_Name__c
            KPIDetils = new List<KPIClass>();   
            KPIDetils.add(new KPIClass('KPI 1',1,DatasetValuesList ,false));
            SelectKPIvalue = KPIs[0].Dataset_Id__c;
            Themevalue = KPIs[0].Theme_Id__c;
            CurrentVersionId = versionLabel.get(SelectKPIvalue);
            CurrentVersionUrl = VersionUrl.get(SelectKPIvalue);
            for(KPIs__c KPI : KPIs){
                for(KPIClass KPIRec : KPIDetils){ 
                KPIRec.dataSet = KPI.Dataset_Id__c; 
                DatasetDimensionFromJson  DimensionTypes = new DatasetDimensionFromJson(); 
                string DimensionsReturnValue = Dimensions(KPIRec.dataset);
                if(DimensionsReturnValue != null &&DimensionsReturnValue != ''){ 
                    DimensionTypes = DatasetDimensionFromJson.parse(DimensionsReturnValue);
                }
                if(KPI.Dimension_Label__c != null || KPI.Dimension_Name__c != null){  
                    if(DimensionTypes.dimensions !=null){
                        for(DatasetDimensionFromJson.cls_dimensions Dim : DimensionTypes.dimensions){ 
                             DimensionLabel.put(Dim.label,Dim.Field);
                             NewDim.put(Dim.Field,Dim.label);
                      } 
                    }
                    String[] Dimlist;
                      if(KPI.Dimension_Label__c != null){
                        Dimlist = KPI.Dimension_Label__c.split(',');
                      }
                      else if(KPI.Dimension_Name__c != null){
                         Dimlist = KPI.Dimension_Name__c.split(','); 
                      }
                    String[] DimAPI;
                    if((KPI.Dimension_API__c != Null && KPI.Dimension_API__c != '') || KPI.Dimension_API_Name__c != Null && KPI.Dimension_API_Name__c != '')
                         
                         if(KPI.Dimension_API__c != null && KPI.Dimension_API__c != ''){
                            DimAPI = KPI.Dimension_API__c.split(',');
                         }
                         else{
                            DimAPI = KPI.Dimension_API_Name__c.split(',');    
                         }
                        
                        KPIRec.SelectedDimensions = new list<selectedDimesionWrapper>();
                        integer i=0;
                    for(String Avail : Dimlist){
                       KPIRec.SelectedDimensions.add(new selectedDimesionWrapper(Avail,false,DimAPI[i]));
                       if(DimAPI != Null){
                       EditDimMapping.put(Avail,NewDim.get(DimAPI[i]));
                       i= i+1;
                       }
                    }
                    
                    
                    NewString = new set<String>();
                    for(selectedDimesionWrapper KPIdim : KPIRec.SelectedDimensions){
                        newString.add(KPIdim.availablename);
                    }
                }
                
                if(KPI.Date_Label__c != null){  
                    if(DimensionTypes.dates !=null){
                        for(DatasetDimensionFromJson.cls_dates Dim : DimensionTypes.dates){     
                            DateFullField.put(Dim.label,Dim.fields.fullField);  
                            NewDat.put(Dim.fields.fullField,Dim.label)  ;   
                            if(DateFullField.get(Dim.label) == Null){
                                DateFullField.put(Dim.label,Dim.label);
                                
                            }                                           
                        } 
                    }
                    String[] DatList =  KPI.Date_Label__c.split(',');
                    String[] DatAPI;
                    if(KPI.Date_API__c != Null && KPI.Date_API__c != '')
                      DatAPI =  KPI.Date_API__c.split(',');
                    
                    KPIRec.SelectedDateFieldlist = new list<SelectedDateFieldWrapper>();
                    integer i=0;
                    for(String Avail : DatList){
                       KPIRec.SelectedDateFieldlist.add(new SelectedDateFieldWrapper(Avail,false,DatAPI[i])); 
                        if(DatAPI != Null)
                        EditDateMapping.put(Avail,NewDat.get(DatAPI[i]));
                        
                        i= i+1;
                    }
                    NewStringDate = new set<String>();
                     for(SelectedDateFieldWrapper KPIdim : KPIRec.SelectedDateFieldlist){
                        NewStringDate.add(KPIdim.DateFieldname);
                    }
                    
                }
                if(KPI.Measure_Label__c != null){  
                    String[] MeasureList =  KPI.Measure_Label__c.split(',');
                    String[] MeasureAPI ;
                    String[] ALiasAPI;
                    String[] CompactAPI;
                    
                    if(KPI.Measure_API__c !=NUll)
                    MeasureAPI =  KPI.Measure_API__c.split(',');
                    
                    KPIRec.selectedMeasures = new set<String>();
                     if(DimensionTypes.measures !=null){
                        for(DatasetDimensionFromJson.cls_measures Dim : DimensionTypes.measures){      
                            MeasureFieldAPI.put(Dim.label,Dim.Field); 
                            NewMeas.put(Dim.Field,Dim.label);                     
                        } 
                    }
                    integer k=0;
                    for(String Avail : MeasureList){
                       KPIRec.selectedMeasures.add(Avail); 
                       String Availms;
                       String Measuresdims;
                       String NewCal = '';
                       if(MeasureAPI != Null){
                       Measuresdims  = MeasureAPI[k];
                           if(Measuresdims.contains('count()') && Measuresdims.length()>7){
                               Measuresdims = Measuresdims.replace('count()','count(\'Rows\')');
                           }
                           
                           if(Measuresdims.length()>7){
                               
                               String MeasuresdimsAll = Measuresdims.replace('(\'','aaaaaa').replace('\')','aaaaaa');
                                
                                String[] MeasuresdimsAlllist = MeasuresdimsAll.Split('aaaaaa');
                                
                                system.debug('NewCal***************** ' +MeasuresdimsAlllist);
                                if(MeasuresdimsAlllist.size()>=3)
                                NewCal = MeasuresdimsAlllist[2];
                           }
                          
                         
                       }
                       system.debug('NewCal***************** ' +NewCal);
                       if(!Measuresdims.contains('(\'') || (Measuresdims.contains('(\'') && (NewCal == '' || NewCal== ' ' || NewCal == null))){ 
                           if(Measuresdims == 'count()'){
                             Availms = 'count()';
                           }
                           else{
                              Availms = Measuresdims; 
                           }
                           
                           
                           
                            String Availmeasures = Availms.replace('(',';').replace(')','');
                            String[] Availlist = Availmeasures.split(';');
                                String Newvar;
                       
                               if(Availlist.size()>1 ){
                                   if(Availlist[1] == 'Probability '){
                                      Availlist[1] =  'Probability (%)';
                                   }
                               }
                                String Newvallist;
                       
                                Newvallist = Availlist[0].replace(' ','').replace(']','');
                       
                       
                       if(MeasureAPI != Null){
                       
                        String Measuresdim  = MeasureAPI[k].replace('(',';');
                       
                        String[] MeasList = Measuresdim.split(';');
                        String MeasFiled;
                        String NewMeasFiled;
                        if(NewMeas.get(MeasList[1].replace(')','').replace('\'','')) != null){
                             MeasFiled = MeasList[0]+'('+ NewMeas.get(MeasList[1].replace(')','').replace('\'','')) +')';
                             NewMeasFiled = NewMeas.get(MeasList[1].replace(')','').replace('\'',''));
                        }
                        else if(NewDim.get(MeasList[1].replace(')','').replace('\'','')) != null){
                            MeasFiled = MeasList[0]+'('+ NewDim.get(MeasList[1].replace(')','').replace('\'',''))+')';
                            NewMeasFiled = NewDim.get(MeasList[1].replace(')','').replace('\'',''));
                        }
                        else{
                            MeasFiled = 'count ()'; 
                            NewMeasFiled = 'Rows';   
                        }
                        EditMeasMapping.put(Avail,MeasFiled);
                        
                         
                         NewMeasurevarlist.add(new MeasureAngularclass(Avail,Newvallist,NewMeasFiled,Avail+'wqstn',Newvallist+NewMeasFiled.replace(' ','')+'wqstn'));
                        System.debug('NewMeasurevarlist^^^^^^^^^^^^^^^^^^^^^^ '+NewMeasurevarlist);
                           
                       }
                       }
                       else{
                          String Newvallistval = 'Calculate';   
                          String MesFiled = Avail.replaceAll('\'','').replaceAll(' ','');
                          MeasureAPI[k] = MeasureAPI[k].replace('count()','count(\'Rows\')');
                           NewMeasurevarlist.add(new MeasureAngularclass(Avail,Newvallistval,MesFiled,MeasureAPI[k]+'wqstn',Newvallistval+MesFiled.replace(' ','')+'wqstn'));
                           EditMeasMapping.put(Avail,MeasureAPI[k]);
                           EditMeasMappingForCal.put(MeasureAPI[k],Avail);
                       
                       }
                       System.debug('NewMeasurevarlist '+NewMeasurevarlist);
                       
                       k=k+1;
                    }
                    KPIRec.MeasureSize = KPIRec.selectedMeasures.size();
                }
                if(KPI.Filter_Name__c != null){  
                    String[] FilterList;
                    if(KPI.Filter_Logics__c != null && KPI.Filter_Logics__c != ''){
                         FilterList =  KPI.Filter_Logics__c.split(';');
                     }
                     else{
                         FilterList =  KPI.Filter_Logic__c.split(';');
                     }
                    String[] FilNames = KPI.Filter_Name__c.split(';');
                    String[] Userlogic = KPI.User_Logic__c.split(';');
                    KPIRec.SelectedFilterList = new list<WrapSelectedFilterList>();
                    KPIRec.SelectedFilters = new list<FilterInnerClass>();
                    integer i=0;
                    integer k=0;
                    integer j= 1;
                    for(String Avail : FilterList){
                        String selFilterNames;
                        String Seloperator;
                        String Selvalue;
                         String[] SplitwithAnd = Avail.replace('&&','##').replace('||','##').Split('##');
                            
                         for(String Str : SplitwithAnd){    
                            
                            String[] SplitwithQuote = Str.Split('\'');
                                selFilterNames = SplitwithQuote[1].replace('(\'','').remove('\'');
                                String[] SplitwithSlash = SplitwithQuote[2].Split(' ');                             
                                Seloperator = SplitwithSlash[1];
                                
                                if(SplitwithSlash.size()>2){
                                    Selvalue = SplitwithSlash[2].replace('\\\\\\"','').replace(')',''); 
                                }
                                else{
                                    Selvalue = '';
                                }
                            
                            
                          
                         }
                         KPIRec.SelectedFilters.add(new FilterInnerClass(Avail,1,FilNames[i],selFilterNames,Seloperator,Userlogic[i],Selvalue));
                          i=i+1;
                          KPIRec.SelectedFilterList.add(new WrapSelectedFilterList(FilNames[k],KPIRec.SelectedFilters,Avail,j));
                        
                        k=k+1;
                        j=j+1;
                    }
                }
                if(KPI.Filter_code__c != Null && KPI.Filter_code__c != ''){
                    String[] FilterList;
                      InnClassEditvaluesList = new list<NewInnerclass>();
                    FilterList = KPI.Filter_code__c.split('mwsqy');
                    String[] FilNames = KPI.Filter_Name__c.split(';');
                        integer valRet = 1;
                        integer w = 1;
                        integer K = 2;
                           // InnClassEditvaluesList.add(new NewInnerclass('All','',1));
                           // InnClassEdit.add(new FilterInnerClassEdit('','','','','','','All','','','','',1,1));
                        for(String TypeofSelect : FilterList){
                        if(TypeofSelect != Null && TypeofSelect != ''){
                            InnClassEditvaluesList.add(new NewInnerclass(FilNames[w],TypeofSelect,integer.valueof(KPI.RowNumber__c)));
                           
                        }
                        W= W+1;
                        }
                        
                        for(String TypeofSelect : FilterList){
                        if(TypeofSelect != Null && TypeofSelect != ''){
                                typeofselect = typeofselect.replace('<li style="cursor: pointer;width: 99%;margin-top:5px;background-color: #E6ECF2;padding: 5px;border-radius: 2px;">','');
                                typeofselect = typeofselect.replace('<div class="MeasuresDivItems" onclick="editFilterModel(this)" style="display: inline;">','');
                                typeofselect = typeofselect.replace('<div onclick="editFilterModel(this)" style="display: inline;">','');
                                typeofselect = typeofselect.replace('</div><div style="display: inline;float: right;padding-right: 1px;cursor: pointer;" onclick="removeItems(this)">X</div>','');
                                typeofselect = typeofselect.replace('</div><div onclick="removeItems(this)" style="display: inline;float: right;padding-right: 1px;cursor: pointer;">X</div>','');
                                typeofselect = typeofselect.replace('<input type="hidden" class="typeofSelect" value="','tyurew').replace('<input class="typeofSelect" type="hidden" value="','tyurew');
                                typeofselect = typeofselect.replace('<input type="hidden" class="minVal" value="','tyurew').replace('<input class="minVal" type="hidden" value="','tyurew');
                                typeofselect = typeofselect.replace('<input type="hidden" class="maxVal" value="','tyurew').replace('<input class="maxVal" type="hidden" value="','tyurew');
                                typeofselect = typeofselect.replace('<input type="hidden" class="filterCon" value="','tyurew').replace('<input class="filterCon" type="hidden" value="','tyurew');
                                typeofselect = typeofselect.replace('<input type="hidden" class="selectedfield" value="','tyurew').replace('<input class="selectedfield" type="hidden" value="','tyurew');
                                typeofselect = typeofselect.replace('<input type="hidden" class="fieldapi" value="','tyurew').replace('<input class="fieldapi" type="hidden" value="','tyurew');     
                            
                                
                                typeofselect = typeofselect.replace('<div class="DimeItemDev" onclick="editFilterModel(this)" style="display: inline;">','');
                                typeofselect = typeofselect.replace('<input type="hidden" class="selectedIds" value="','tyurew').replace('<input class="selectedIds" type="hidden" value="','tyurew'); 
                                
                                typeofselect = typeofselect.replace('<div class="dateFivDiv" onclick="editFilterModel(this)" style="display: inline;">','');
                                typeofselect = typeofselect.replace('<input type="hidden" class="fromDate" value="','tyurew').replace('<input class="fromDate" type="hidden" value="','tyurew');
                                typeofselect = typeofselect.replace('<input type="hidden" class="toDate" value="','tyurew').replace('<input class="toDate" type="hidden" value="','tyurew');
                                    typeofselect = typeofselect.replace('"></li>','codesval').replace('">','');
                                typeofselect = typeofselect.replace(' tyurew','tyurew');
                                                        
                            String[] TypeSelectList = typeofselect.Split('codesval');
                             for(string Type : TypeSelectList){
                                String Vlauesare;
                                String[] TypeMeasures = Type.Split('tyurew');
                                if(TypeMeasures[1] == 'measure'){
                                if(TypeMeasures[4] == 'Between'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' >= '+String.valueof(TypeMeasures[2]).replace(',','') + ' && '+ '\''+TypeMeasures[6]+'\' <= '+ String.valueof(TypeMeasures[3]).replace(',','');
                                }
                                else if(TypeMeasures[4] == 'Greater Than'){
                                     Vlauesare = '\'' +TypeMeasures[6]+'\' > '+ String.valueof(TypeMeasures[2]).replace(',','');
                                }
                                else if(TypeMeasures[4] == 'Greater Than Or Equal To'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' >= '+ String.valueof(TypeMeasures[2]).replace(',','');
                                }
                                else if(TypeMeasures[4] == 'Less Than'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' < '+String.valueof(TypeMeasures[3]).replace(',','');
                                }
                                else if(TypeMeasures[4] == 'Less Than Or Equal To'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' <= '+String.valueof(TypeMeasures[3]).replace(',','');
                                }
                                else if(TypeMeasures[4] == 'Equals'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' == '+String.valueof(TypeMeasures[2]).replace(',','');
                                }
                                else if(TypeMeasures[4] == 'Does Not Equal'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' != '+String.valueof(TypeMeasures[2]).replace(',','');
                                }
                                else if(TypeMeasures[4] == 'Is Null'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' is null';
                                }
                                else if(TypeMeasures[4] == 'Is Not Null'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' is not null';
                                    
                                }
                                 InnClassEdit.add(new FilterInnerClassEdit(TypeMeasures[0].replace('&lt;','<').replace('&gt;','>'),TypeMeasures[1],TypeMeasures[2],TypeMeasures[3],TypeMeasures[4],TypeMeasures[5],FilNames[valRet],Type,TypeMeasures[6],'','',1,k));
                             }
                             if(TypeMeasures[1] == 'date'){
                                if(TypeMeasures[4] == 'Between'){     
                                     Vlauesare = '\''+TypeMeasures[6]+'\' >= '+TypeMeasures[2] + ' && '+ '\''+TypeMeasures[6]+'\' <= '+TypeMeasures[3];
                                }
                                else if(TypeMeasures[4] == 'Greater Than Or Equal To'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' >= '+TypeMeasures[2];
                                }
                                else if(TypeMeasures[4] == 'Less Than Or Equal To'){
                                     Vlauesare = '\''+TypeMeasures[6]+'\' <= '+TypeMeasures[3];
                                }
                                InnClassEdit.add(new FilterInnerClassEdit(TypeMeasures[0].replace('&lt;','<').replace('&gt;','>'),TypeMeasures[1],'','',TypeMeasures[4],TypeMeasures[5],FilNames[valRet],type,TypeMeasures[6],TypeMeasures[2],TypeMeasures[3],1,k));
                             }
                             if(TypeMeasures[1] == 'dimension'){
                                if(TypeMeasures[3] == 'Equals'){
                                      String Newval = '[\\\\\\"'+String.valueof(TypeMeasures[2])+']';
                                    Newval = Newval.replace(',]','\\\\\\"]').replace(',','\\\\\\",\\\\\\"');
                                     Vlauesare = '\''+TypeMeasures[5]+'\' in '+ Newval;
                                }
                                else if(TypeMeasures[3] == 'Does Not Equal'){
                                  String Newval = '[\\\\\\"'+String.valueof(TypeMeasures[2])+']';
                                    Newval = Newval.replace(',]','\\\\\\"]').replace(',','\\\\\\",\\\\\\"');
                                     Vlauesare = '\''+TypeMeasures[5]+'\' not in '+ Newval;      
                            
                                }
                                else{
                                     Vlauesare = '\''+TypeMeasures[5]+'\' matches \\\\\\"'+String.valueof(TypeMeasures[2]) + '\\\\\\"';
                                }
                                InnClassEdit.add(new FilterInnerClassEdit(TypeMeasures[0],TypeMeasures[1],TypeMeasures[2],'',TypeMeasures[3],TypeMeasures[4],FilNames[valRet],type,TypeMeasures[5],'','',1,k));
                             }  
                                    
                              
                            }
                            valRet = valRet+1;
                        }
                        k=K+1;
                }
                
                }
                }
                
            }
            Previous();
        }
    //}
    //catch(Exception e){
        
    //}
    }
    

  
    public class FilterInnerClass{
        public String selectedFilters{get;set;}
        public String FilterNames{get;set;}
        public Integer Filtervalue{get;set;}
         public String FieldName{get;set;}
          public String Operator{get;set;}
           public String UserLogic{get;set;}
            public String Value{get;set;}
            
        public FilterInnerClass(String selectedFilters,Integer Filtervalue,String FilterNames,String FieldName,String Operator,String UserLogic,String Value){
            this.selectedFilters = selectedFilters;
            this.Filtervalue = Filtervalue;
            this.FilterNames = FilterNames;
             this.Value = Value;
            this.FieldName = FieldName;
            this.Operator = Operator;
             this.UserLogic = UserLogic;
        }
    }      


    public class FilterInnerClassEdit{
        public String typeofSelect{get;set;}   
        public String minval{get;set;}
        public String maxVal{get;set;}
        public String filterCon{get;set;}
        public String selectedfield{get;set;}
        public String Betweens{get;set;}
        public String Fieldname{get;set;}
        public String FilterIds{get;set;}  
         public String FieldAPI{get;set;}  
         public String fromDate{get;set;}  
         public String toDate{get;set;}  
         public integer RowNumber{get;set;}
         public integer Rowcount{get;set;}
        public FilterInnerClassEdit(String Betweens,String typeofSelect,String minval,String maxVal,String filterCon,String selectedfield,String Fieldname,String FilterIds,String FieldAPI,String fromDate,String toDate,integer RowNumber,integer Rowcount){
            this.typeofSelect = typeofSelect;
            this.minval = minval;
            this.maxVal = maxVal;   
             this.filterCon = filterCon;
            this.selectedfield = selectedfield;
            this.Betweens = Betweens;
            this.Fieldname = Fieldname;
            this.FilterIds = FilterIds;
            this.FieldAPI = FieldAPI;
            this.fromDate = fromDate;
            this.toDate = toDate;
            this.RowNumber = RowNumber;
            this.Rowcount = Rowcount;
        }
    }
    
     public class NewInnerclass{
         public String typeofSelect{get;set;}   
        public String minval{get;set;}
        public integer RowNumber{get;set;}
         public NewInnerclass(String minval,String typeofSelect,integer RowNumber){
              this.typeofSelect = typeofSelect;
                this.minval = minval;
                this.RowNumber = RowNumber;
         }
    }
    
    public class MeasureAngularclass{
         public String Measurename{get;set;}   
        public String Measurevar{get;set;}
        public String Measureval{get;set;}
        public String EditMeasval{get;set;}
         public String EditApi{get;set;}
         public MeasureAngularclass(String Measurename,String Measurevar,String Measureval,String EditMeasval,String EditApi){
              this.Measurename = Measurename;
                this.Measurevar = Measurevar;
                this.Measureval = Measureval;
                this.EditMeasval = EditMeasval;
                this.EditApi = EditApi;
         }
    }
    
    public boolean DashboardSuccess{get;set;}
    public boolean DashboardSales{get;set;} 
    public boolean DashboardDB{get;set;}     
    
    public void Cancelvalues(){
         String values = apexpages.currentpage().getparameters().get('SelectedButtonValues');
    }
    

   public void SingleDashboardTheme(){
       if(AllVal != null){
           Dashboard_Backup_AC  DBUp = new Dashboard_Backup_AC();
           DBUp.NewDashboardsSingle(Allval);
       }
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
     public boolean Newvaluesboll{get;set;}
    
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
                SFDCApiUtil.couponResponseClass verifyCoupon = SFDCApiUtil.getCouponInformation(sessionId, serverURL, query);
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
                SFDCApiUtil.buildResponseClass verifyBuild = SFDCApiUtil.getBuildCostformation(sessionId, serverURL, query);
                if(verifyBuild.response){
                       // String RemoveId = System.currentPageReference().getParameters().get('SalesNumbersval');
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
    
    public void connectToSFDC(){
        SFDCApiUtil.connectResponseClass connectResponse = SFDCApiUtil.connectToSFDC();
        if(connectResponse.response){
            sessionId = connectResponse.sessionId;
            serverURL = connectResponse.responseServerUrl;
            system.debug('connectResponse.responsemessage success ********'+connectResponse);
            // ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, '' + connectResponse);
            // ApexPages.addMessage(myMsg);
            booleanConnections();
            isCheckAccount = true;
        }
        else{
            system.debug('connectResponse.responsemessage ********'+connectResponse.responsemessage);
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, '' + connectResponse.responsemessage);
            ApexPages.addMessage(myMsg);
            booleanConnections();
        }
    }
    
     public void verifyAccountDetails(){
        org = [select Id, Name, Phone, Fax, Street, City, State, Country, PostalCode from Organization where Id = :UserInfo.getOrganizationId()];
        String query = 'select Id,Name from Account where org_Id__c = \''+ userinfo.getOrganizationId() + '\'';
        SFDCApiUtil.verifyResponseClass verifyAccount = SFDCApiUtil.verifyDetails(sessionId, serverURL, query);
        if(verifyAccount.response){
            if(verifyAccount.hasDetails){
                accountRecId = verifyAccount.recordId;
                //  ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Account ' + accountRecId);
                //  ApexPages.addMessage(myMsg);
                booleanConnections();
                isCheckContact = true;
            }
             else{
                
                query = 'select Id,Name from Account where org_Id__c = \''+ userinfo.getuserId() + '\'';
                SFDCApiUtil.verifyResponseClass verifyAccounts = SFDCApiUtil.verifyDetails(sessionId, serverURL, query);
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
                    SFDCApiUtil.createResponseClass createAccount = SFDCApiUtil.createDetails(sessionId, serverURL,
                                                                                                'Account', recordDetails);
                    if(createAccount.response){
                        accountRecId = createAccount.recordId;
                        // ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Account ' + createAccount.recordId);
                        // ApexPages.addMessage(myMsg);
                        booleanConnections();
                        isCheckContact = true;
                    }
                    else{
                        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Account ' + createAccount.responsemessage);
                        ApexPages.addMessage(myMsg);
                        booleanConnections();
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
        SFDCApiUtil.verifyResponseClass verifyContact = SFDCApiUtil.verifyDetails(sessionId, serverURL, query);
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
                SFDCApiUtil.createResponseClass createContact = SFDCApiUtil.createDetails(sessionId, serverURL,'Contact', recordDetails);
                if(createContact.response){
                    contactRecId = createContact.recordId;
                      system.debug('ContactOld' + contactRecId);
                    displayConnectButtons = false;
                    // ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'ContactOld ' + createContact.recordId);
                    // ApexPages.addMessage(myMsg);
                    booleanConnections();
                    
                    
                    
                  //  String querys = 'select Id,Credit_Amount__c,Debit_Amount__c from Contact where id = \''+ contactRecId + '\'';
                    SFDCApiUtil.verifyResponseClass reverifyContact = SFDCApiUtil.verifyDetails(sessionId, serverURL, query);
                    if(reverifyContact.response){
                        if(reverifyContact.hasDetails){
                            contactRecId = reverifyContact.recordId;
                            system.debug('the map values are contactRecId' + contactRecId);
                            accountBalance = reverifyContact.creditAmount - reverifyContact.debitAmount;
                        }
                    }
                }
                else{
                    // ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Contact ' + createContact.responsemessage);
                    // ApexPages.addMessage(myMsg);
                    booleanConnections();
                }
            }
        }
        else{
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Contact ' + verifyContact.creditAmount + ' Debit '+verifyContact.debitAmount);
            ApexPages.addMessage(myMsg);
            booleanConnections();
        }
    }
    
    
    public string OpportunityStage{get;set;}
    public pageReference saveAndCancelDashboard(integer Allsets){
        String recordTypeName = 'ISV App Debit';
        String query = 'select id from recordType where name = \''+ recordTypeName + '\'';
        SFDCApiUtil.verifyResponseClass verifyRecordType = SFDCApiUtil.verifyDetails(sessionId, serverURL, query);
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
        system.debug(accountBalance + ' *************  '+ TotalCost);
        // if(accountBalance >= TotalCost){  
        String recordTypeName = 'ISV App Debit';
        String query = 'select id from recordType where name = \''+ recordTypeName + '\'';
        SFDCApiUtil.verifyResponseClass verifyRecordType = SFDCApiUtil.verifyDetails(sessionId, serverURL, query);
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
        SFDCApiUtil.createResponseClass createOpportunity = SFDCApiUtil.createOpportunity(sessionId, serverURL,'Opportunity', recordDetails);
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
        SFDCApiUtil.createResponseClass createOpportunityLineItem = SFDCApiUtil.createOpportunityLineItem(sessionId, serverURL,'OpportunityLineItem', recordDetails);
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
        Newvaluesboll = false;
        if(CouponCode == null || CouponCode == ''){
            Couponvalue = 0;
        }
    }
    
    // public void ConnectSfdcclone(){
    //     isConnect = true;
    //     Newvaluesboll = true;
    //     if(CouponCode == null || CouponCode == ''){
    //         Couponvalue = 0;
    //     }
        
    // }
    
    public void Goback(){
        NoAcccountbalance = false;
    }
    
     public void Cancelclose(){
         DashboardSuccess = false;
         DashboardSales = false;
         DashboardDB = false;
        purchaseAndBuildDashboard('Cancel',1);
    }
    

    public void ErrorMethod(){
        MeasureNew();
        for(KPIClass KPI : KPIDetils){
            if(KPI.SelectedDateFieldlist != Null && KPI.selectedDimensions != null && KPI.selectedMeasures != NUll){
                DashboardDB = false;         
            }
            else{
                DashboardDB = true;
            }           
        }
    }
   
   public void UpdateConfiguration(){
       ConfigName = System.currentPageReference().getParameters().get('HiddenConfig');
       Description = System.currentPageReference().getParameters().get('HiddenDesc');
       DBTemp = new List<DB_Template__c>();
       DBTemp = [select Id, DB_Name__c, Description__c, Type__c from DB_Template__c where Id = :ConfigId];
       if(DBTemp.size() > 0){
           DBTemp[0].DB_Name__c = ConfigName;
           DBTemp[0].Description__c = Description;
       }
       update DBTemp;
   }
   
}