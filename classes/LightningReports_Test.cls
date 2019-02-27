public with sharing class LightningReports_Test { 
    public boolean SectionClose{get;set;}
    public Boolean SetDimension{get;set;} 
    public boolean showSectionEdit{get;set;}
    public String SectionName{get;set;}   
    public String BoxValue{get;set;} 
    public String KPINameUI{get;set;}  
    public boolean dashboardMarketing{get;set;}
    public boolean dashboardAll{get;set;}
    public boolean dashboardMarketingFail{get;set;}
    public boolean dashboardAllFail{get;set;}
    public boolean dashboardMarketingFails{get;set;}
    public boolean dashboardAllFails{get;set;} 
    public boolean Sectionones{get;set;} 
    public boolean Sectiontwos{get;set;}
    public boolean SectionFails{get;set;}
    public boolean Section1Fails{get;set;}
    public boolean Section2Fails{get;set;}
    public String SessionId{get;set;}
    public boolean Booleanvalues{get;set;}
    public List<SelectOption> getFloderList{get;set;} 
    public String ThemeValue{get;set;}
    public string Truevalue{get;set;}
    public Organization org{get;set;}
    public User userData{get;set;}
    //public String AnalyticsDashboardId{get;set;}
    public LightningReports_Test(){
        ThemeValue = ApexPages.currentPage().getParameters().get('theme');
        String secone = ApexPages.currentPage().getParameters().get('secone');
        String sectwo = ApexPages.currentPage().getParameters().get('sectwo');
        String secthree = ApexPages.currentPage().getParameters().get('secthree');
        String SuccessMsg = ApexPages.currentPage().getParameters().get('Success');
        
         Truevalue  = ApexPages.currentPage().getParameters().get('Truevalue');
        
       
        
        SectionList = new list<String>();
        SectionList1 = new list<String>();
        SectionList2 = new list<String>();
        DisplayPopup = true;
        Booleanvalues = true;
        DeleteAllvalues = false;
        DeleteAllvalues1 = false;
        DeleteAllvalues2 = false;
        if(DatasetRecords == null){
            DatasetRecords = new list<Dataset__c>();
        }
        system.currentPageReference().getParameters().put('aid','');   
        Sectionone = true;
        SectionClose = false;
        dashboardMarketing = false;
        dashboardAll = false;
        dashboardMarketingFail = false;
        dashboardAllFail = false;
        
         if(SuccessMsg == 'true'){
            DashboardAll = true;
        }
        fromJSON  Fnames = new fromJSON(); 
        String Folders = FloderNames();
        if(Folders != null && Folders != ''){
            Fnames =    fromJSON.parse(Folders);
        }
        system.debug('-------------'+Fnames);
        getFloderList = new List<SelectOption>();
        getFloderList.add(new SelectOption(userInfo.getuserId(),'My Private App'));
        if(Fnames.folders !=null)
        for( fromJSON.cls_folders f:Fnames.folders){
            getFloderList.add(new SelectOption(f.id,f.name)); 
        }
        
        
       
         
         if(secone != Null && secone != ''){
        SectionList.add(secone);
        SectionList1.add(sectwo);
        SectionList2.add(secthree); 
        for(string s:SectionList){
            if(s != '' || (SectionList1 != Null && SectionList1[0] != '')){
                box1 = true;    
            }
        }
        for(string s:SectionList1){
            if(s != '' || (SectionList2 != Null && SectionList2[0] != '')){
                box2 = true;    
            }
        } 
        
         Booleanvalues = false;
         }
         else{
              SectionList.add('');
         SectionList1.add('');
         SectionList2.add('');
         }
        Sectionone = true;         
        String SingleKPIvalue = apexpages.currentpage().getparameters().get('dbid');
        String SingleKPIvalues = apexpages.currentpage().getparameters().get('Allvaluesone');
        if(SingleKPIvalue != 'None'){
        	CloneFromPrevious(SingleKPIvalue);
        }
        
        NewListopt = new list<selectoption>();
        list<Json_class__c> ListJson = [select id,Name,Dashboard_Id__c  from Json_class__c where Name = 'Default MultiKPI Theme' and Dashboard_Id__c = null and Dashboard_Id__c = '']; 
        for(Json_class__c js :ListJson){
            NewListopt.add(new SelectOption(js.id,js.Name));
        }
        list<Json_class__c> ListJson1 = [select id,Name,Dashboard_Id__c  from Json_class__c where Dashboard_Type__c = 'Compare' and Name != 'Default MultiKPI Theme' and Dashboard_Id__c != null and Dashboard_Id__c != ''];
        for(Json_class__c js1 :ListJson1){
            NewListopt.add(new SelectOption(js1.id,js1.Name));
        }
	    Allval = 'Default MultiKPI Theme';
	    
	    NewListoptSales = new list<selectoption>();
	    list<Sales_Insight__c> ListJsons2 = [select id,Name,Dashboard_Id__c  from Sales_Insight__c where Name = 'New Default Sales Insight' and Dashboard_Id__c = null and Dashboard_Id__c = '']; 
        for(Sales_Insight__c js2 :ListJsons2){
            NewListoptSales.add(new SelectOption(js2.id,js2.Name));
        }
        
        list<Sales_Insight__c> ListJsons = [select id,Name,Dashboard_Id__c  from Sales_Insight__c where Name = 'Default Sales Insight' and Dashboard_Id__c = null and Dashboard_Id__c = '' and Dashboard_Type__c = 'Sales Insights']; 
        for(Sales_Insight__c js :ListJsons){
            NewListoptSales.add(new SelectOption(js.id,js.Name));
        }
        
        list<Sales_Insight__c> ListJsons1 = [select id,Name,Dashboard_Id__c  from Sales_Insight__c where Dashboard_Type__c = 'Sales Insights' and  Dashboard_Id__c != null and Dashboard_Id__c != ''];
        for(Sales_Insight__c js1 :ListJsons1){
            NewListoptSales.add(new SelectOption(js1.id,js1.Name));
        }
	    Allvals = 'Default Sales Insight';
	    
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
   
    public list<String> SectionList{get;set;}
    public list<String> SectionList1{get;set;}
    public list<String> SectionList2{get;set;}
    public Boolean Sectionone{get;set;}
    public boolean DisplayPopup{get;set;}
    public boolean box1{get;set;}
    public boolean box2{get;set;}
     public boolean DeleteAllvalues{get;set;}
     public boolean DeleteAllvalues1{get;set;}
     public boolean DeleteAllvalues2{get;set;}
    public void SaveSection(){
    	
        SectionName = System.currentPageReference().getParameters().get('hiddensection');
        String boxvalueslist = System.currentPageReference().getParameters().get('boxvalues');
        BoxValue = System.currentPageReference().getParameters().get('boxvalue');
        showSectionEdit = true;
        box1 = true;
        box2 = true;
        if(BoxValue == 'modal'){
            SectionList = new list<String>();
            SectionList.add(SectionName);
            Booleanvalues = false; 
            
            if(boxvalueslist == ''){
            	DeleteAllvalues = true;
            }
           if(SectionList1[0] != '') { 
            	DeleteAllvalues1 = false; 
            } 
            if(SectionList2[0] != '') { 
            	DeleteAllvalues2 = false; 
            }
            Sectionones = true;    
        }
        if(BoxValue == 'modal1'){
            SectionList1 = new list<String>();
            SectionList1.add(SectionName);
            if(boxvalueslist == ''){
            	DeleteAllvalues1 = true;
            }
            if(SectionList[0] != '') { 
            	DeleteAllvalues = false; 
            } 
            if(SectionList2[0] != '') { 
            	DeleteAllvalues2 = false; 
            }
            Sectiontwos = true;
        }
        if(BoxValue == 'modal2'){
            SectionList2 = new list<String>();
            SectionList2.add(SectionName);
            if(SectionList1[0] != '') { 
            	DeleteAllvalues1 = false; 
            } 
            if(SectionList[0] != '') { 
            	DeleteAllvalues = false; 
            }
            if(boxvalueslist == ''){
            	DeleteAllvalues2 = true;
            }
            
        }
        for(string s:SectionList){
            if(s != '' || (SectionList1 != Null && SectionList1[0] != '')){
                box1 = true;    
            }
        }
        for(string s:SectionList1){
            if(s != '' || (SectionList2 != Null && SectionList2[0] != '')){
                box2 = true;    
            }
        }                                   
        
    }
    public pageReference removeSection(){ 
    	BoxValue = System.currentPageReference().getParameters().get('boxvalue');    
        sectionName = '';
        String SingleKPIvalue = apexpages.currentpage().getparameters().get('dbid');
        if(BoxValue == 'modal'){   
        	SectionName = '';
            SectionList = new list<String>();
            SectionList.add(SectionName);
            list<Dataset__c> DatsetList = [select id,RowNumber__c from Dataset__c where Session_Id__c =: SessionId order by RowNumber__c limit 15];
        	list<Dataset__c> Dt = new list<Dataset__c>();
        	for(Dataset__c Datlist:DatsetList) {
        	if(Datlist.RowNumber__c >= 1 && Datlist.RowNumber__c <= 5 ){
        		Dt.add(Datlist);
        		}
        	} 
        	if(Dt.size() > 0){
        	    if(Dataset__c.sObjectType.getDescribe().isDeletable()){
        		    Delete Dt;
        	    }
        	}
        	system.currentPageReference().getParameters().put('aid','');
            SectionFails = true;
            DeleteAllvalues = true;
             if(SectionList1[0] != '') { 
            	DeleteAllvalues1 = false; 
            } 
            if(SectionList2[0] != '') { 
            	DeleteAllvalues2 = false; 
            }
        }
        if(BoxValue == 'modal1'){
        	SectionName = '';
            SectionList1 = new list<String>();
            SectionList1.add(SectionName);
            list<Dataset__c> DatsetList = [select id,RowNumber__c from Dataset__c where Session_Id__c =: SessionId order by RowNumber__c limit 15];
        	list<Dataset__c> Dt1 = new list<Dataset__c>();
        	for(Dataset__c Datlist:DatsetList) {
        	if(Datlist.RowNumber__c >= 6 && Datlist.RowNumber__c <= 10 ){
        		Dt1.add(Datlist);
        		}
        	} 
        	if(Dt1.size() > 0){
        	    if(Dataset__c.sObjectType.getDescribe().isDeletable()){
        		    Delete Dt1;
        	    }    
        	}
        	system.currentPageReference().getParameters().put('aid1','');
        	Section1Fails = true;
            DeleteAllvalues1 = true;
             if(SectionList[0] != '') { 
            	DeleteAllvalues = false; 
            } 
            if(SectionList2[0] != '') { 
            	DeleteAllvalues2 = false; 
            }
        }
        if(BoxValue == 'modal2'){
        	SectionName = '';
            SectionList2 = new list<String>();
            SectionList2.add(SectionName);
            list<Dataset__c> DatsetList = [select id,RowNumber__c from Dataset__c where Session_Id__c =: SessionId order by RowNumber__c limit 15];
        	list<Dataset__c> Dt2 = new list<Dataset__c>();
        	for(Dataset__c Datlist:DatsetList) {
        	if(Datlist.RowNumber__c >= 11 && Datlist.RowNumber__c <= 15 ){
        		Dt2.add(Datlist);
        		}
        	} 
        	if(Dt2.size() > 0){
        	    if(Dataset__c.sObjectType.getDescribe().isDeletable()){
        		    Delete Dt2;
        	    }
        	}
        	system.currentPageReference().getParameters().put('aid2','');
        	Section2Fails = true;
            DeleteAllvalues2 = true;
             if(SectionList[0] != '') { 
            	DeleteAllvalues = false; 
            } 
            if(SectionList1[0] != '') { 
            	DeleteAllvalues1 = false; 
            }
            System.debug('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^' + Dt2.size());
        }
            
       return Null;    
    }
  
    public integer KPI{get;set;}
    public boolean saveIds{get;set;}
  
    public String Responsebody{get;set;}
    public Void SubmitOverview(){
    	try{
    	    if(accountBalance >= TotalCost){
    		DeleteAllvalues = false;
            DeleteAllvalues1 = false;
            DeleteAllvalues2 = false;
        System.debug('--------------'+DashboardName);  
        System.debug('--------------'+strFloderId); 
        DashboardName = System.currentPageReference().getParameters().get('hiddenDashboardNames');   
        //list<Dataset__c> DatsetList = [select id from Dataset__c]; 
        list<Dataset__c> DatsetList = [select id,RowNumber__c,Dataset_Name__c,KPI_Name__c,
       											Dataset_Id__c,Filter_Logics__c,
       											FilterName__c,UserLogic__c,
       											Date_Label__c,Measure_Name__c,
       											Dimension_Name__c,Measure_API__c,
       											Dimension_Api__c,Data_API__c,Filter_Code__c,New_Dimension_Name__c,New_Dimension_API__c,
       											AliasMeasure_API__c,CompactMeasure_API__c
       											 from Dataset__c where Session_Id__c =: SessionId order by RowNumber__c limit 15];
        System.debug('Valuess are not Created' + '**********************'+DatsetList+ '********' + DatsetList.size());
        list<Dataset__c> Dt3 = new list<Dataset__c>();
        for(Dataset__c Datlist:DatsetList) {
        	if(Datlist.Date_Label__c !=null && Datlist.Date_Label__c !='' && ((Datlist.Dimension_Name__c != Null && Datlist.Dimension_Name__c != '') || (Datlist.New_Dimension_Name__c != Null && Datlist.New_Dimension_Name__c != '')) && Datlist.Measure_Name__c != Null && Datlist.Measure_Name__c != ''){
        		Dt3.add(Datlist);
        	}
        } 
        
        System.debug('Valuess are not Created' + Dt3 + '&&&&&&&&&&&&&&&&&&&&&&&&& '+Dt3.size());
        if(DatsetList.size() == Dt3.size()) {
        
        list<String> FolderList3 = new list<String>();
        FolderList3.add(strFloderId);
        FolderList3.add(SectionList2[0]); 
        FolderList3.add(SessionId); 
        FolderList3.add(SectionList[0]);
        FolderList3.add(SectionList1[0]);
        
        list<String> FolderList1 = new list<String>();	
        FolderList1.add(strFloderId);
        FolderList1.add(SectionList[0]);
        FolderList1.add(SessionId);
        FolderList1.add(SectionList1[0]);
        FolderList1.add(SectionList2[0]);
        
        list<String> FolderList2 = new list<String>();
        FolderList2.add(strFloderId);
        FolderList2.add(SectionList1[0]);
        FolderList2.add(SessionId);
        FolderList2.add(SectionList[0]);
        FolderList2.add(SectionList2[0]);
        string posts1 = '';
        string posts2 = '';
        string posts3 = '';
         String ThemeValues1;
         String ThemeValues2;
         String ThemeValues3;
         system.debug('ListSals2 ****************'+AllVal);
        list<Json_class__c> Sales = [select id,Dashboard_Id__c from Json_class__c where id=:AllVal];
         String NewThemevalue = 'New Default Sales Insight';
        list<Sales_Insight__c> ListSals1 = [select id,Name,Dashboard_Id__c  from Sales_Insight__c where Name = 'New Default Sales Insight' and Dashboard_Id__c = null and Dashboard_Id__c = '']; 
        if(Sales.size() > 0){
              list<Sales_Insight__c> ListSals2 = new list<Sales_Insight__c>();
           if(Sales[0].Dashboard_Id__c != null && Sales[0].Dashboard_Id__c != '')
            ListSals2 = [select id,Name,Dashboard_Id__c,Dashboard_Type__c  from Sales_Insight__c where Dashboard_Id__c =: Sales[0].Dashboard_Id__c]; 
            system.debug('ListSals2 ****************'+ListSals2);
            if(ListSals2.size()>0){
           
            for(Sales_Insight__c Sls : ListSals2){
                if(Sls.Dashboard_Type__c == 'Sales Insight' || Sls.Dashboard_Type__c == 'Sales Insights'){
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
        
        httpResponse Res1 = new httpResponse();
        if(!Test.isRunningTest()){
        Res1 =KPI_DashboardSalesService.m_createDashboard(FolderList1[1],FolderList1,ThemeValues1,NewThemevalue,UserInfo.getSessionId()); 
        
            if(Res1.getStatus() == 'Created'){
            	Map<String,Object> m2 = (Map<String,Object>) JSON.deserializeUntyped(Res1.getBody());
            	posts1 = (string)m2.get('id');
            }
        }
        httpResponse Res2= new httpResponse();
        if(!Test.isRunningTest()){
        Res2 = KPI_DashboardSuccessFilter.m_createDashboard(FolderList2[1],FolderList2,ThemeValues2,NewThemevalue,UserInfo.getSessionId());
        
            if(Res2.getStatus() == 'Created'){
            	Map<String,Object> m2 = (Map<String,Object>) JSON.deserializeUntyped(Res2.getBody());
            	posts2 = (string)m2.get('id');
            }
        }
        
        httpResponse Res3 = new httpResponse();
        if(!Test.isRunningTest()){
            Res3 = KPI_DashboardMarketingService.m_createDashboard(FolderList3[1],FolderList3,ThemeValues3,NewThemevalue,UserInfo.getSessionId());
            if(Res3.getStatus() == 'Created'){
            	Map<String,Object> m2 = (Map<String,Object>) JSON.deserializeUntyped(Res3.getBody());
            	posts3 = (string)m2.get('id');
            }
        }
        
        
        KPI_DashboardService DashboardService  = new KPI_DashboardService();
        list<String> FolderList = new list<String>();
        FolderList.add(strFloderId);
        FolderList.add(SectionList[0]);
        FolderList.add(SectionList1[0]);
        FolderList.add(SectionList2[0]);
        FolderList.add(SessionId);
        
        System.debug('FolderList --------------'+FolderList +' '+posts1+ ' '+ posts2 + ' ' + posts3 ); 
        httpResponse Res = new httpResponse();
        if(!Test.isRunningTest())
        try{
            String ThemeValues = '';
            
             if(Sales.Size() > 0){
                ThemeValues = Sales[0].Id;
            }
            else{
                Json_class__c JsonRec =  [select id from Json_class__c where Name='Default MultiKPI Theme' and Dashboard_Id__c = null and Dashboard_Id__c = ''];
                ThemeValues = JsonRec.Id;
            }
             startpoller = true;
              dashboardAllFail = false;
				    dashboardAllFails = false;
				    dashboardAll = false;
				    DashboardMarketingFails = false;
			 list<Measure_Requirements__c> Measdatlsts= [select  id,Field_3__c,Measure_Number__c,Field_4__c
                                                              from Measure_Requirements__c where Field_5__c = 'Future Methods' limit 1];
															  
															  if(Measdatlsts.size()> 0){
																	if(Schema.sObjectType.Measure_Requirements__c.fields.Field_2__c.isUpdateable()){
																	 Measdatlsts[0].Field_2__c = '';
																	 update Measdatlsts;
																 }
															  }
             FutureMethods(DashboardName,FolderList,ThemeValues,SessionId,posts1,posts2,posts3,ThemeValues1,ThemeValues2,ThemeValues3,FolderList1,FolderList2,FolderList3);
        }
        catch(Exception e){
    		
    	}
    	
       /* if(Res.getStatus() == 'Created'){       	
        	dashboardMarketing = false;
        	dashboardAll = true;       	
        	dashboardMarketingFail = false;
        	dashboardAllFail = false;       	
        	dashboardMarketingFails = false;
        	dashboardAllFails = false;
        	
        
        }
        else{
        	Responsebody = Res.getBody();        	
        	dashboardMarketingFail = false;
        	dashboardAllFail = true;       	
        	dashboardMarketing = false;
        	dashboardAll = false;        	
        	dashboardMarketingFails = false;
        	dashboardAllFails = false;
        }*/
        }
        else{  
            Measure_Requirements__c Measdatlsta= new Measure_Requirements__c();
        	dashboardMarketingFails = false;
        	dashboardAllFails = true;        	
        	dashboardMarketing = false;
        	dashboardAll = false;        	
        	dashboardMarketingFail = false;
        	dashboardAllFail = false;
        	purchaseAndBuildDashboard('Failed',1);
        } 
        	DB_Template__c DatasetRec = new DB_Template__c();
        if( Schema.sObjectType.DB_Template__c.fields.DB_Name__c .isCreateable() && Schema.sObjectType.DB_Template__c.fields.Type__c.isCreateable()
           && Schema.sObjectType.DB_Template__c.fields.Section_Name_1__c.isCreateable() && Schema.sObjectType.DB_Template__c.fields.Section_Name_2__c.isCreateable()
           && Schema.sObjectType.DB_Template__c.fields.Section_Name_3__c.isCreateable() ){
           
		DatasetRec.DB_Name__c = DashboardName;    
		DatasetRec.Type__c = 'Multi KPI';
		DatasetRec.Section_Name_1__c = SectionList[0];
		DatasetRec.Section_Name_2__c = SectionList1[0];
		DatasetRec.Section_Name_3__c = SectionList2[0];		
	    insert 	DatasetRec;
           }
	    
        for(Dataset__c Datlist:DatsetList) {					    
			KPIs__c KPIs = new KPIs__c();	
			
			 if(Schema.sObjectType.KPIs__c.fields.RowNumber__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.Dataset_Name__c.isCreateable()
			     && Schema.sObjectType.KPIs__c.fields.Dataset_Id__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.Dimension_Label__c.isCreateable()
			     && Schema.sObjectType.KPIs__c.fields.Date_Label__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.Measure_Label__c.isCreateable()
			     && Schema.sObjectType.KPIs__c.fields.Filter_Logics__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.KPI_Name__c.isCreateable()
			     && Schema.sObjectType.KPIs__c.fields.Filter_Name__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.User_Logic__c.isCreateable()
			     && Schema.sObjectType.KPIs__c.fields.AliasMeasure_API__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.CompactMeasure_API__c.isCreateable()
			      && Schema.sObjectType.KPIs__c.fields.Measure_API__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.Dimension_Api__c.isCreateable()
			     && Schema.sObjectType.KPIs__c.fields.Date_API__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.DB_Template__c.isCreateable()
			     && Schema.sObjectType.KPIs__c.fields.Filter_Code__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.Theme_Id__c.isCreateable()){

			     
			KPIs.RowNumber__c = Datlist.RowNumber__c; 
			KPIs.Dataset_Name__c = Datlist.Dataset_Name__c; 
			KPIs.Dataset_Id__c = Datlist.Dataset_Id__c; 
			//KPIs.Dimension_Label__c = Datlist.Dimension_Name__c;  
			KPIs.Date_Label__c = Datlist.Date_Label__c; 
			KPIs.Measure_Label__c = Datlist.Measure_Name__c; 
			KPIs.Filter_Logics__c = Datlist.Filter_Logics__c;
			KPIs.KPI_Name__c = DatList.KPI_Name__c;
			KPIs.Filter_Name__c = Datlist.FilterName__c;
			KPIs.User_Logic__c = Datlist.UserLogic__c;
			KPIs.AliasMeasure_API__c = Datlist.AliasMeasure_API__c;
			KPIs.CompactMeasure_API__c = Datlist.CompactMeasure_API__c; 
			KPIs.Measure_API__c = Datlist.Measure_API__c; 
			//KPIs.Dimension_Api__c = Datlist.Dimension_Api__c;
			if(Datlist.Dimension_Api__c != null && Datlist.Dimension_Api__c != ''){
    			KPIs.Dimension_API_Name__c = Datlist.Dimension_Api__c; 
                KPIs.Dimension_Name__c = Datlist.Dimension_Name__c; 
			}
			else{
			    KPIs.Dimension_API_Name__c = Datlist.New_Dimension_API__c; 
                KPIs.Dimension_Name__c = Datlist.New_Dimension_Name__c; 
			}
			
			KPIs.Date_API__c = Datlist.Data_API__c;
			KPIs.DB_Template__c = DatasetRec.Id;
			KPIs.Filter_Code__c = Datlist.Filter_Code__c;
			KPIs.Theme_Id__c = ThemeValue;
			insert KPIs;
		  }
		}
        newIds = true;
        newIdss = false;
         NoAcccountbalance = false; 
    	}
    	else{
    	     DashboardAll = false;
         DashboardAllFail = false;
    	    purchaseAndBuildDashboard('Not Enough Credits',1);
    	    NoAcccountbalance = true;  
    	}
    	}
    	catch(Exception e){
    		
    	}
         
    }
    
    @Future(callout=true)
    public static void FutureMethods(String DashboardName,list<string> FolderList,string ThemeValues,String SessionId,String posts1,String posts2,String posts3,String ThemeValues1,String ThemeValues2,String ThemeValues3,list<String> Folderlist1,list<String> Folderlist2,list<String> Folderlist3){
        string AnalyticsDashboardId = '';
        FolderList.add(posts1);
        FolderList.add(posts2);
        FolderList.add(posts3);
         System.debug('FolderList --------------'+FolderList); 
        httpResponse Res = new httpResponse();
        Res = KPI_DashboardService.Build_createDashboard(DashboardName,FolderList,ThemeValues,SessionId);
        list<Measure_Requirements__c> Measdatlsts= [select  id,Field_3__c,Field_2__c,Measure_Number__c,Field_4__c,Field_5__c
                                                              from Measure_Requirements__c where Field_5__c = 'Future Methods'];
             String Allvaluestrue = '';   
             Measure_Requirements__c Measdatlsta= new Measure_Requirements__c();
            //  if(Schema.sObjectType.Measure_Requirements__c.fields.Field_2__c.isUpdateable() && Schema.sObjectType.Measure_Requirements__c.fields.Field_4__c.isUpdateable()
            //     && Schema.sObjectType.Measure_Requirements__c.fields.Field_5__c.isUpdateable() && Schema.sObjectType.Measure_Requirements__c.fields.Id .isUpdateable()
            //      && Schema.sObjectType.Measure_Requirements__c.fields.Field_2__c.isCreateable() && Schema.sObjectType.Measure_Requirements__c.fields.Field_4__c.isCreateable()
            //     && Schema.sObjectType.Measure_Requirements__c.fields.Field_5__c.isCreateable() ){
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
                        Res5 = KPI_DashboardMarketingService.DUp_createDashboard(FolderList1[1],FolderList1,ThemeValues1,'New Default Sales Insight',SessionId,posts1,'Sales');
                        system.debug('Res5 *************** '+Res5.getbody());
                         
                     }
                     if(posts2 != Null && posts2 != ''){
                        httpResponse Res6 = new httpResponse();
                        Res6 = KPI_DashboardMarketingService.DUp_createDashboard(FolderList2[1],FolderList2,ThemeValues2,'New Default Sales Insight',SessionId,posts2,'Success');
                     
                         system.debug('Res6 *************** '+Res6.getbody());
                     }
                     if(posts3 != Null && posts3 != ''){
                        httpResponse Res7 = new httpResponse();
                        Res7 = KPI_DashboardMarketingService.DUp_createDashboard(FolderList3[1],FolderList3,ThemeValues3,'New Default Sales Insight',SessionId,posts3,'Market');
                     }
                 Allvaluestrue = 'true';               
                 Measdatlsta.Field_2__c = Allvaluestrue;
                 Measdatlsta.Field_4__c = posts4;
              } 
              else{
                  Allvaluestrue = 'false';
                  Measdatlsta.Field_2__c = Allvaluestrue;
              }
             Measdatlsta.Field_5__c = 'Future Methods';
			 if(Measdatlsts.size() <= 0){
			     
				insert Measdatlsta;
			    
			 }
			 system.debug('Measdatlsts *************** '+Measdatlsts.size());
             if(Measdatlsts.size()> 0){ 
                 system.debug('Measdatlsts *************** '+Measdatlsts.size());
                 Measdatlsta.Id = Measdatlsts[0].id;
                 update Measdatlsta;
             }
             
            // } 
             
             
             dashbocreatejson payTypes = new dashbocreatejson();
                String Datesetvalues = res.getBody();   
                if(Datesetvalues != null && Datesetvalues != ''){ 
                     payTypes = dashbocreatejson.parse(Datesetvalues);
                } 
                AnalyticsDashboardId = payTypes.Id;
    }
    
    public void Saveandcloseopp(){
         list<Dataset__c> DatsetList = [select id,RowNumber__c,Dataset_Name__c,KPI_Name__c,
       											Dataset_Id__c,Filter_Logics__c,
       											FilterName__c,UserLogic__c,
       											Date_Label__c,Measure_Name__c,
       											Dimension_Name__c,Measure_API__c,
       											Dimension_Api__c,Data_API__c,Filter_Code__c,New_Dimension_Name__c,New_Dimension_API__c,
       											AliasMeasure_API__c,CompactMeasure_API__c   
       											 from Dataset__c where Session_Id__c =: SessionId order by RowNumber__c limit 15];
         DashboardName = System.currentPageReference().getParameters().get('hiddenDashboardNames'); 
         saveAndCancelDashboard(1);
        	DB_Template__c DatasetRec = new DB_Template__c();
	if( Schema.sObjectType.DB_Template__c.fields.DB_Name__c .isCreateable() && Schema.sObjectType.DB_Template__c.fields.Type__c.isCreateable()
           && Schema.sObjectType.DB_Template__c.fields.Section_Name_1__c.isCreateable() && Schema.sObjectType.DB_Template__c.fields.Section_Name_2__c.isCreateable()
           && Schema.sObjectType.DB_Template__c.fields.Section_Name_3__c.isCreateable() ){
		DatasetRec.DB_Name__c = DashboardName;    
		DatasetRec.Type__c = 'Multi KPI';
		DatasetRec.Section_Name_1__c = SectionList[0];
		DatasetRec.Section_Name_2__c = SectionList1[0];
		DatasetRec.Section_Name_3__c = SectionList2[0];		
	    insert 	DatasetRec;
           }
        for(Dataset__c Datlist:DatsetList) {					    
			KPIs__c KPIs = new KPIs__c();	
			
		 if(Schema.sObjectType.KPIs__c.fields.RowNumber__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.Dataset_Name__c.isCreateable()
			     && Schema.sObjectType.KPIs__c.fields.Dataset_Id__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.Dimension_Label__c.isCreateable()
			     && Schema.sObjectType.KPIs__c.fields.Date_Label__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.Measure_Label__c.isCreateable()
			     && Schema.sObjectType.KPIs__c.fields.Filter_Logics__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.KPI_Name__c.isCreateable()
			     && Schema.sObjectType.KPIs__c.fields.Filter_Name__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.User_Logic__c.isCreateable()
			     && Schema.sObjectType.KPIs__c.fields.AliasMeasure_API__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.CompactMeasure_API__c.isCreateable()
			      && Schema.sObjectType.KPIs__c.fields.Measure_API__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.Dimension_Api__c.isCreateable()
			     && Schema.sObjectType.KPIs__c.fields.Date_API__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.DB_Template__c.isCreateable()
			     && Schema.sObjectType.KPIs__c.fields.Filter_Code__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.Theme_Id__c.isCreateable()){
			KPIs.RowNumber__c = Datlist.RowNumber__c; 
			KPIs.Dataset_Name__c = Datlist.Dataset_Name__c; 
			KPIs.Dataset_Id__c = Datlist.Dataset_Id__c;  
			KPIs.Date_Label__c = Datlist.Date_Label__c; 
			KPIs.Measure_Label__c = Datlist.Measure_Name__c; 
			KPIs.Filter_Logics__c = Datlist.Filter_Logics__c;
			KPIs.KPI_Name__c = DatList.KPI_Name__c;
			KPIs.Filter_Name__c = Datlist.FilterName__c;
			KPIs.User_Logic__c = Datlist.UserLogic__c;
			KPIs.AliasMeasure_API__c = Datlist.AliasMeasure_API__c;
			KPIs.CompactMeasure_API__c = Datlist.CompactMeasure_API__c; 
			KPIs.Measure_API__c = Datlist.Measure_API__c; 
		    if(Datlist.Dimension_Api__c != null &&Datlist.Dimension_Api__c != ''){
    		    KPIs.Dimension_API_Name__c = Datlist.Dimension_Api__c; 
            	KPIs.Dimension_Name__c = Datlist.Dimension_Name__c; 
		    }
		    else{
		        KPIs.Dimension_API_Name__c = Datlist.New_Dimension_API__c; 
            	KPIs.Dimension_Name__c = Datlist.New_Dimension_Name__c; 
		    }
			KPIs.Date_API__c = Datlist.Data_API__c;
			KPIs.DB_Template__c = DatasetRec.Id;
			KPIs.Filter_Code__c = Datlist.Filter_Code__c;
			KPIs.Theme_Id__c = ThemeValue;
			insert KPIs;
			}
			
		}
    }
    
     public boolean startpoller{get;set;}
     public void NewClone(){
         startpoller = true;
        list<Measure_Requirements__c> Measdatlsts= [select  id,Field_2__c,Field_4__c
                                                              from Measure_Requirements__c where Field_5__c = 'Future Methods' limit 1 ]; 
		     
		     system.debug('Measdatlsts ********8'+ Measdatlsts);
		      if(Measdatlsts.size() > 0){
		          Truevalue = Measdatlsts[0].Field_4__c;
				 if(Measdatlsts[0].Field_2__c == 'true'){
				    dashboardAllFail = false;
				    dashboardAllFails = false;
				    dashboardAll = true;
				    DashboardMarketingFails = false;
				    startpoller = false;
				    purchaseAndBuildDashboard('Purchase & Build',1);
				     
				 }
				 else if(Measdatlsts[0].Field_2__c == 'false'){
				    dashboardAllFail = true;
				    dashboardAllFails = false;
				    dashboardAll = true;
				    DashboardMarketingFails = false;
				    startpoller = false; 
				    purchaseAndBuildDashboard('Failed',1);
				 }
				 else{
				     dashboardAllFail = false;
				    dashboardAllFails = false;
				    dashboardAll = false;
				    DashboardMarketingFails = true;
				 }
				//  if(Schema.sObjectType.Measure_Requirements__c.fields.Field_2__c.isUpdateable()){
    // 				 Measdatlsts[0].Field_2__c = '';
    // 				 update Measdatlsts;
				//  }
			  }
			  else{
			      DashboardMarketingFails = true;
				  dashboardAllFail = false;
				    dashboardAllFails = false;
				    dashboardAll = false;
			  }
     }
    
    public Void SubmitMarketing(){ 
    	try{
    		DeleteAllvalues = false;
            DeleteAllvalues1 = false;
            DeleteAllvalues2 = false; 
        System.debug('--------------'+DashboardName);     
        System.debug('--------------'+strFloderId); 
        DashboardName = System.currentPageReference().getParameters().get('hiddenDashboardNames'); 
        list<String> FolderList = new list<String>();
        FolderList.add(strFloderId);
        FolderList.add(SectionList2[0]); 
        FolderList.add(SessionId);             
        //list<Dataset__c> DatsetList = [select id from Dataset__c];
        list<Dataset__c> DatsetList = [select id,Date_Label__c,Measure_Name__c,Dimension_Name__c from Dataset__c where Session_Id__c =: SessionId order by RowNumber__c limit 15];
        list<Dataset__c> Dt = new list<Dataset__c>();
        for(Dataset__c Datlist:DatsetList) {
        // 	if(Datlist.Date_Label__c !=null && Datlist.Date_Label__c !='' && Datlist.Dimension_Name__c != Null && Datlist.Dimension_Name__c != '' && Datlist.Measure_Name__c != Null && Datlist.Measure_Name__c != ''){
        // 		Dt.add(Datlist);
        // 	}
        } 
        
         String ThemeValues = '';
         String NewThemevalue = '';
            list<Sales_Insight__c> Sales = [select id from Sales_Insight__c where id=:AllVals];
             if(Sales.Size() > 0){
                // ThemeValues = Sales[0].Id;
                // NewThemevalue = Sales[0].Name;
            }
            else{
               // Sales_Insight__c JsonRec =  [select id from Sales_Insight__c where Name='Default Sales Insight' and Dashboard_Id__c = null and Dashboard_Id__c = ''];
                // ThemeValues = JsonRec.Id;
                // NewThemevalue = JsonRec.Id;
            }
        if(DatsetList.size() == Dt.size()) {          
        KPI_DashboardMarketingService DashboardService  = new KPI_DashboardMarketingService();
        httpResponse Res = new httpResponse();
        // if(!Test.isRunningTest())
        // 	Res = KPI_DashboardMarketingService.m_createDashboard(DashboardName,FolderList,ThemeValues,NewThemevalue,UserInfo.getSessionId());
        // if(Res.getStatus() == 'Created'){       	
        // 	dashboardMarketing = true;
        // 	dashboardAll = false;        	
        // 	dashboardMarketingFail = false;
        // 	dashboardAllFail = false;       	
        // 	dashboardMarketingFails = false;
        // 	dashboardAllFails = false;
        	
        	
        // }
        // else{
        // 	Responsebody = Res.getBody();        	
        // 	dashboardMarketingFail = true;
        // 	dashboardAllFail = false;        	
        // 	dashboardMarketing = false;
        // 	dashboardAll = false;       	
        // 	dashboardMarketingFails = false;
        // 	dashboardAllFails = false;
         }
        // }else{        
        // 	dashboardMarketingFail = false;
        // 	dashboardAllFail = false;       	
        // 	dashboardMarketing = false;
        // 	dashboardAll = false;  
        // 	dashboardMarketingFails = true;
        // 	dashboardAllFails = false;
        // }
        newIdss = true;
        newIds = false;
    	}
    	catch(Exception e){
    		
    	}
        
    }
    
    public Void SubmitSales(){ 
    	try{
    		DeleteAllvalues = false;
            DeleteAllvalues1 = false;
            DeleteAllvalues2 = false;
        System.debug('--------------Dash'+DashboardName); 
        system.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Dataset'+ DatasetRecords);
        System.debug('-------------- FolderId'+strFloderId);   
        DashboardName = System.currentPageReference().getParameters().get('hiddenDashboardNames'); 
        list<String> FolderList = new list<String>();
        FolderList.add(strFloderId);
        FolderList.add(SectionList[0]);
         FolderList.add(SessionId);
         list<Dataset__c> DatsetList = [select id,Date_Label__c,Measure_Name__c,Dimension_Name__c from Dataset__c where Session_Id__c =: SessionId order by RowNumber__c limit 15];
        list<Dataset__c> Dt = new list<Dataset__c>();
        for(Dataset__c Datlist:DatsetList) {
        // 	if(Datlist.Date_Label__c !=null && Datlist.Date_Label__c !='' && Datlist.Dimension_Name__c != Null && Datlist.Dimension_Name__c != '' && Datlist.Measure_Name__c != Null && Datlist.Measure_Name__c != ''){
        // 		Dt.add(Datlist);
        // 	}
        } 
        if(DatsetList.size() == Dt.size()) { 
        KPI_DashboardMarketingService DashboardService  = new KPI_DashboardMarketingService();
        
        String ThemeValues = '';
        String NewThemevalue = '';
            list<Sales_Insight__c> Sales = [select id,Name from Sales_Insight__c where id=:AllVals];
             if(Sales.Size() > 0){
                // ThemeValues = Sales[0].Id;
                // NewThemevalue = Sales[0].Name;
            }
            else{
                //Sales_Insight__c JsonRec =  [select id from Sales_Insight__c where Name='Default Sales Insight' and Dashboard_Id__c = null and Dashboard_Id__c = '' limit 1];
                // ThemeValues = JsonRec.Id;
                // NewThemevalue = JsonRec.Name;
            }
        httpResponse Res = new httpResponse();
       // if(!Test.isRunningTest())
        // Res =KPI_DashboardSalesService.m_createDashboard(DashboardName,FolderList,ThemeValues,NewThemevalue,UserInfo.getSessionId()); 
        // System.debug('Res.getStatus() --------------'+Res.getStatus());  
        // if(Res.getStatus() == 'Created'){

        // 	dashboardMarketing = true;
        // 	dashboardAll = false;
        
        // 	dashboardMarketingFail = false;
        // 	dashboardAllFail = false;
      
        // 	dashboardMarketingFails = false;
        // 	dashboardAllFails = false;
        	
        // }
        // else{
        // 	Responsebody = Res.getBody();
     
        // 	dashboardMarketingFail = true;
        // 	dashboardAllFail = false;
  
        // 	dashboardMarketing = false;
        // 	dashboardAll = false;
 
        // 	dashboardMarketingFails = false;
        // 	dashboardAllFails = false;
        // }
        }
        else{
       
        	dashboardMarketingFail = false;
        	dashboardAllFail = false;
       
        	dashboardMarketing = false;
        	dashboardAll = false;
   
        	dashboardMarketingFails = true;
        	dashboardAllFails = false;
        }
        newIdss = true;
        newIds = false;
        }
    	catch(Exception e){
    		
    	}
    }
    
    public Void SubmitSuccess(){   
    //	try{
    		DeleteAllvalues = false;
            DeleteAllvalues1 = false;
            DeleteAllvalues2 = false;
        System.debug('--------------'+DashboardName);  
        System.debug('--------------'+strFloderId);   
        DashboardName = System.currentPageReference().getParameters().get('hiddenDashboardNames');       
        //list<Dataset__c> DatsetList = [select id from Dataset__c];
         list<Dataset__c> DatsetList = [select id,Date_Label__c,Measure_Name__c,Dimension_Name__c from Dataset__c where Session_Id__c =: SessionId order by RowNumber__c limit 15];
        list<Dataset__c> Dt = new list<Dataset__c>();
        // for(Dataset__c Datlist:DatsetList) {
        // 	if(Datlist.Date_Label__c !=null && Datlist.Date_Label__c !='' && Datlist.Dimension_Name__c != Null && Datlist.Dimension_Name__c != '' && Datlist.Measure_Name__c != Null && Datlist.Measure_Name__c != ''){
        // 		Dt.add(Datlist);
        // 	}
        // }
        
         String ThemeValues = '';
         String NewThemevalue = '';
            list<Sales_Insight__c> Sales = [select id from Sales_Insight__c where id=:AllVals];
             if(Sales.Size() > 0){
                // ThemeValues = Sales[0].Id;
                // NewThemevalue = Sales[0].Name;
            }
            else{
                //Sales_Insight__c JsonRec =  [select id from Sales_Insight__c where Name='Default Sales Insight' and Dashboard_Id__c = null and Dashboard_Id__c = ''];
                // ThemeValues = JsonRec.Id;
                // NewThemevalue = JsonRec.Id;
            }
    //     if(DatsetList.size() == Dt.size()) { 
    //     KPI_DashboardSuccessFilter DashboardService  = new KPI_DashboardSuccessFilter();
    //     list<String> FolderList = new list<String>();
    //     FolderList.add(strFloderId);
    //     FolderList.add(SectionList1[0]);
    //     FolderList.add(SessionId);
    //   httpResponse Res= new httpResponse();
    //   if(!Test.isRunningTest())
    //     Res = KPI_DashboardSuccessFilter.m_createDashboard(DashboardName,FolderList,ThemeValues,NewThemevalue,UserInfo.getSessionId()); 
    //   if(Res.getStatus() == 'Created'){
        
    //     	dashboardMarketing = true;
    //     	dashboardAll = false;
      
    //     	dashboardMarketingFail = false;
    //     	dashboardAllFail = false;
      
    //     	dashboardMarketingFails = false;
    //     	dashboardAllFails = false;
    //     }
    //     else{
    //     	Responsebody = Res.getBody();
   
    //     	dashboardMarketingFail = true;
    //     	dashboardAllFail = false;
       
    //     	dashboardMarketing = false;
    //     	dashboardAll = false;
     
    //     	dashboardMarketingFails = false;
    //     	dashboardAllFails = false;
    //     }
    //     }
    //     else{
       
    //     	dashboardMarketingFail = false;
    //     	dashboardAllFail = false;
    
    //     	dashboardMarketing = false;
    //     	dashboardAll = false;
    
    //     	dashboardMarketingFails = true;
    //     	dashboardAllFails = false;
    //     }
        newIdss = true;
       // }
       
    }
    public boolean newIds{get;set;} 
    public boolean newIdss{get;set;} 
    public string DashboardName{get;set;}
    Public string strFloderId{get; set;}
   
    
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
    
    public void CloneFromPrevious(String Ids){
    	    DeleteAllvalues = false;
            DeleteAllvalues1 = false;
            DeleteAllvalues2 = false;
    	list<DB_Template__c> DBTemplates = [select Id,Section_Name_1__c,Section_Name_2__c,Section_Name_3__c from DB_Template__c where id =: Ids order By createddate desc];
    	if(DBTemplates.size()>0){
    	    list<KPIs__c> KPIs = [select Dataset_Id__c,Dataset_Name__c,Date_Label__c,Theme_Id__c,Dimension_Name__c,Dimension_API_Name__c,
    									 DB_Template__c,Dimension_Label__c,User_Logic__c,Filter_Code__c,
    									 Filter_Logics__c,Filter_Logic__c,Filter_Name__c,KPI_Name__c,Measure_Label__c,RowNumber__c,
    									 AliasMeasure_API__c,CompactMeasure_API__c,Dimension_API__c,Measure_API__c,Date_API__c
    									 from KPIs__c where  DB_Template__c =: DBTemplates[0].id];	
    									 
    		SectionList = new list<String>();
        	SectionList1 = new list<String>();
        	SectionList2 = new list<String>();
        	Booleanvalues = false;
        	Themevalue = KPIs[0].Theme_Id__c;
        	if(DBTemplates[0].Section_Name_1__c != Null && DBTemplates[0].Section_Name_1__c != ''){
    			SectionList.add(DBTemplates[0].Section_Name_1__c);
    			
    			system.currentPageReference().getParameters().put('aid', 'None');
        	}
        	else{
        		SectionList.add('');
        	}
        	if(DBTemplates[0].Section_Name_2__c != Null && DBTemplates[0].Section_Name_2__c != ''){
    			SectionList1.add(DBTemplates[0].Section_Name_2__c);
    			system.currentPageReference().getParameters().put('aid1', 'None');
        	}
        	else{
        		SectionList1.add('');
        	}
        	if(DBTemplates[0].Section_Name_3__c != Null && DBTemplates[0].Section_Name_3__c != ''){
    		SectionList2.add(DBTemplates[0].Section_Name_3__c);
    		system.currentPageReference().getParameters().put('aid2', 'None');
        	}
        	else{
        		SectionList2.add('');
        	}
        	
        	for(string s:SectionList){
            	if(s != '' || (SectionList1 != Null && SectionList1[0] != '')){
                	box1 = true;    
            	}
	        }
	        for(string s:SectionList1){
	            if(s != '' || (SectionList1 != Null && SectionList1[0] != '') ){
	                box2 = true;    
	            }
	        }
    		
	    		 	    
	    	}
    }
    
    public void Save(){
    	    DeleteAllvalues = false;
            DeleteAllvalues1 = false;
            DeleteAllvalues2 = false;
            saveIds = true;
    	String DBName = Apexpages.currentpage().getParameters().get('hiddenSingleName');
       list<Dataset__c> DatsetList = [select id,RowNumber__c,Dataset_Name__c,KPI_Name__c,
       											Dataset_Id__c,Filter_Logics__c,
       											FilterName__c,UserLogic__c,
       											Date_Label__c,Measure_Name__c,
       											Dimension_Name__c,Measure_API__c,
       											Dimension_Api__c,Data_API__c,Filter_Code__c,New_Dimension_Name__c,New_Dimension_API__c,
       											AliasMeasure_API__c,CompactMeasure_API__c
       											 from Dataset__c where Session_Id__c =: SessionId order by RowNumber__c limit 15];
        list<Dataset__c> Dt = new list<Dataset__c>();
        DB_Template__c DatasetRec = new DB_Template__c();
    if( Schema.sObjectType.DB_Template__c.fields.DB_Name__c .isCreateable() && Schema.sObjectType.DB_Template__c.fields.Type__c.isCreateable()
           && Schema.sObjectType.DB_Template__c.fields.Section_Name_1__c.isCreateable() && Schema.sObjectType.DB_Template__c.fields.Section_Name_2__c.isCreateable()
           && Schema.sObjectType.DB_Template__c.fields.Section_Name_3__c.isCreateable() ){
        
		DatasetRec.DB_Name__c = DBName;    
		DatasetRec.Type__c = 'Multi KPI';
		DatasetRec.Section_Name_1__c = SectionList[0];
		DatasetRec.Section_Name_2__c = SectionList1[0];
		DatasetRec.Section_Name_3__c = SectionList2[0];		
	    insert 	DatasetRec;
	    
           }
        for(Dataset__c Datlist:DatsetList) {					    
			KPIs__c KPIs = new KPIs__c();	
		 if(Schema.sObjectType.KPIs__c.fields.RowNumber__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.Dataset_Name__c.isCreateable()
			     && Schema.sObjectType.KPIs__c.fields.Dataset_Id__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.Dimension_Label__c.isCreateable()
			     && Schema.sObjectType.KPIs__c.fields.Date_Label__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.Measure_Label__c.isCreateable()
			     && Schema.sObjectType.KPIs__c.fields.Filter_Logics__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.KPI_Name__c.isCreateable()
			     && Schema.sObjectType.KPIs__c.fields.Filter_Name__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.User_Logic__c.isCreateable()
			     && Schema.sObjectType.KPIs__c.fields.AliasMeasure_API__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.CompactMeasure_API__c.isCreateable()
			      && Schema.sObjectType.KPIs__c.fields.Measure_API__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.Dimension_Api__c.isCreateable()
			     && Schema.sObjectType.KPIs__c.fields.Date_API__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.DB_Template__c.isCreateable()
			     && Schema.sObjectType.KPIs__c.fields.Filter_Code__c .isCreateable() && Schema.sObjectType.KPIs__c.fields.Theme_Id__c.isCreateable()){	
			
			KPIs.RowNumber__c = Datlist.RowNumber__c; 
			KPIs.Dataset_Name__c = Datlist.Dataset_Name__c; 
			KPIs.Dataset_Id__c = Datlist.Dataset_Id__c; 
			if(Datlist.Dimension_Name__c != null && Datlist.Dimension_Name__c != ''){
			    KPIs.Dimension_Name__c = Datlist.Dimension_Name__c;  
			}
			else{
			    KPIs.Dimension_Name__c = Datlist.New_Dimension_Name__c;   
			}
			KPIs.Date_Label__c = Datlist.Date_Label__c; 
			KPIs.Measure_Label__c = Datlist.Measure_Name__c; 
			KPIs.Filter_Logics__c = Datlist.Filter_Logics__c;
			KPIs.KPI_Name__c = DatList.KPI_Name__c;
			KPIs.Filter_Name__c = Datlist.FilterName__c;
			KPIs.User_Logic__c = Datlist.UserLogic__c;
			KPIs.AliasMeasure_API__c = Datlist.AliasMeasure_API__c;
			KPIs.CompactMeasure_API__c = Datlist.CompactMeasure_API__c; 
			KPIs.Measure_API__c = Datlist.Measure_API__c; 
			if(Datlist.Dimension_Api__c != null && Datlist.Dimension_Api__c != ''){
			    KPIs.Dimension_API_Name__c = Datlist.Dimension_Api__c;
			}
			else{
			    KPIs.Dimension_API_Name__c = Datlist.New_Dimension_API__c;   
			}
			
			
			KPIs.Date_API__c = Datlist.Data_API__c;
			KPIs.DB_Template__c = DatasetRec.Id;
			KPIs.Filter_Code__c = Datlist.Filter_Code__c;
			KPIs.Theme_Id__c = ThemeValue;
			insert KPIs;
			
			}
		}
		
		if(DBName != Null && DBName != '')
			Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.CONFIRM, 'Configuration Created Successfully'));
      
    }  
    
    public boolean TemplateSuccess{get;set;}          
    public list<Dataset__c> DatasetRecords{get;set;}
 
    public void DeleteAll(){     
        list<Dataset__c> DatasetReclist = [select id,Session_Id__c,RowNumber__c from Dataset__c where Session_Id__c =: SessionId order by RowNumber__c];  
        if(Dataset__c.sObjectType.getDescribe().isDeletable()){
            Delete  DatasetReclist;
        }
        System.debug('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&****************'+ DatasetReclist + '   '+ DatasetReclist.size());
        previousvalue();
     
    }
    
    public void previousvalue(){
    	
    	String Ids = apexpages.currentpage().getparameters().get('dbid');
    	if(Ids != Null && Ids != ''){
    	 list<DB_Template__c> DBTemplates = [select Id from DB_Template__c where Id=: ids order By createddate desc];
    	 System.debug('&&&&&&&&&&&&&&&&&&&&&&&&&&&&& DBTemplates'+ DBTemplates.size());
    		if(DBTemplates.size()>0){
    	list<KPIs__c> KPIs = [select Dataset_Id__c,Dataset_Name__c,Date_Label__c,
    									 DB_Template__c,Dimension_Label__c,User_Logic__c,Filter_Code__c,Dimension_Name__c,Dimension_API_Name__c,
    									 Filter_Logic__c,Filter_Logics__c,Filter_Name__c,KPI_Name__c,Measure_Label__c,RowNumber__c,
    									 Dimension_API__c,Measure_API__c,Date_API__c,AliasMeasure_API__c,CompactMeasure_API__c
    									 from KPIs__c where  DB_Template__c =: DBTemplates[0].id order by RowNumber__c limit 15];      
           list<Dataset__c> Datasetlist = new list<Dataset__c>();
           System.debug('&&&&&&&&&&&&&&&&&&&&&&&&&&&&& KPIs'+ KPIs.size());
            // if(Schema.sObjectType.Dataset__c.fields.Dataset_Name__c.isCreateable() && Schema.sObjectType.Dataset__c.fields.RowNumber__c.isCreateable() && Schema.sObjectType.Dataset__c.fields.Dimension_Name__c.isCreateable()
            //      && Schema.sObjectType.Dataset__c.fields.Dataset_Id__c.isCreateable() && Schema.sObjectType.Dataset__c.fields.Date_Label__c.isCreateable()
            //      && Schema.sObjectType.Dataset__c.fields.Measure_Name__c.isCreateable() && Schema.sObjectType.Dataset__c.fields.Filter_Code__c.isCreateable()
            //      && Schema.sObjectType.Dataset__c.fields.Filter_Logics__c.isCreateable() && Schema.sObjectType.Dataset__c.fields.KPI_Name__c.isCreateable()
            //      && Schema.sObjectType.Dataset__c.fields.FilterName__c.isCreateable() && Schema.sObjectType.Dataset__c.fields.UserLogic__c.isCreateable()
            //      && Schema.sObjectType.Dataset__c.fields.AliasMeasure_API__c.isCreateable() && Schema.sObjectType.Dataset__c.fields.CompactMeasure_API__c.isCreateable()
            //       && Schema.sObjectType.Dataset__c.fields.Measure_API__c.isCreateable() && Schema.sObjectType.Dataset__c.fields.Dimension_Api__c.isCreateable()
            //      && Schema.sObjectType.Dataset__c.fields.Data_API__c.isCreateable() && Schema.sObjectType.Dataset__c.fields.Session_Id__c.isCreateable()) {
	      for(KPIs__c Datlist : KPIs){    
		        Dataset__c Dt = new Dataset__c();						    	
				Dt.RowNumber__c = Datlist.RowNumber__c; 
				Dt.Dataset_Name__c = Datlist.Dataset_Name__c; 
				Dt.Dataset_Id__c = Datlist.Dataset_Id__c;
				if(Datlist.Dimension_Label__c != null && Datlist.Dimension_Label__c != ''){
				    Dt.New_Dimension_Name__c = Datlist.Dimension_Label__c;  
				}
				else{
				    Dt.New_Dimension_Name__c = Datlist.Dimension_Name__c;
				}
				Dt.Date_Label__c = Datlist.Date_Label__c; 
				Dt.Measure_Name__c = Datlist.Measure_Label__c; 
				Dt.Filter_Code__c = Datlist.Filter_Code__c;
				if(Datlist.Filter_Logics__c != Null && Datlist.Filter_Logics__c != ''){
					Dt.Filter_Logics__c = Datlist.Filter_Logics__c;
				}
				else{
					Dt.Filter_Logics__c = Datlist.Filter_Logic__c;
				}
				Dt.KPI_Name__c = DatList.KPI_Name__c;
				Dt.FilterName__c = Datlist.Filter_Name__c;
				Dt.UserLogic__c = Datlist.User_Logic__c;
				Dt.AliasMeasure_API__c = Datlist.AliasMeasure_API__c;
				Dt.CompactMeasure_API__c = Datlist.CompactMeasure_API__c; 
				Dt.Measure_API__c = Datlist.Measure_API__c;
				
				if(Datlist.Dimension_Api__c != null && Datlist.Dimension_Api__c != ''){
				    Dt.New_Dimension_API__c = Datlist.Dimension_Api__c; 
				}
				else{
				    Dt.New_Dimension_API__c = Datlist.Dimension_API_Name__c; 
				}
				Dt.Data_API__c = Datlist.Date_API__c; 
				Dt.Session_Id__c = SessionId;
				Datasetlist.add(Dt);
			}
			insert Datasetlist;
            //}
			System.debug('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'+ Datasetlist + '   '+ Datasetlist.size());
    		}
    	}
    	
    }
    
    public list<selectoption> NewListopt{get;set;}
     public list<selectoption> NewListoptSales{get;set;}
		public String Allval{get;set;}
		public String Allvals{get;set;}
    
    public void singleDashboardTheme(){
        NewListopt = new list<selectoption>();
        list<Json_class__c> ListJson = [select id,Name,Dashboard_Id__c  from Json_class__c where Name = 'Default MultiKPI Theme' and Dashboard_Id__c = null and Dashboard_Id__c = '']; 
        for(Json_class__c js :ListJson){
            NewListopt.add(new SelectOption(js.id,js.Name));
        }
        list<Json_class__c> ListJson1 = [select id,Name,Dashboard_Id__c  from Json_class__c where Dashboard_Type__c = 'Command' and Name != 'Default MultiKPI Theme' and Dashboard_Id__c != null and Dashboard_Id__c != ''];
        for(Json_class__c js1 :ListJson1){
            NewListopt.add(new SelectOption(js1.id,js1.Name));
        }
        if(Allval != null){
            String ThemeId = System.currentPageReference().getParameters().get('hiddenThemeId');
            Dashboard_Backup_AC DBUp = new Dashboard_Backup_AC();
            DBUp.NewDashboardsSingle1(Allval);
        }
    } 
    
    public void singleDashboardThemeSale(){
        /*if(Allvals != null){
            Dashboard_Backup_AC DBUp = new Dashboard_Backup_AC();
            DBUp.NewDashboardsSingle(Allvals);
        }*/
    } 
    
    public Void EditDimClass1(){
    	
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
        SFDCApiUtil.connectResponseClass connectResponse = SFDCApiUtil.connectToSFDC();
        if(connectResponse.response){
            sessionIds = connectResponse.sessionId;
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
                
                query = 'select Id,Name from Account where org_Id__c = \''+ userinfo.getuserId() + '\'';
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
                        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Account ' + createAccount.responsemessage);
                        ApexPages.addMessage(myMsg);
                        booleanConnections();
                    }
                }
                }
            }
        }
        else{
            // ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Account ' + verifyAccount.responsemessage);
            // ApexPages.addMessage(myMsg);
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
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Contact ' + verifyContact.creditAmount + ' Debit '+verifyContact.debitAmount);
            ApexPages.addMessage(myMsg);
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
        DashboardAll = false;
        DashboardAllFail = false;
        //Newvaluesboll = false;
        if(CouponCode == null || CouponCode == ''){
            Couponvalue = 0;
        }
    }
    
    public void ConnectSfdcclone(){
        isConnect = true;
        //Newvaluesboll = true;
        if(CouponCode == null || CouponCode == ''){
            Couponvalue = 0;
        }
        
    }
    
    public void Goback(){
        NoAcccountbalance = false;
    }
    
     public void Cancelclose(){
         DashboardAll = false;
         DashboardAllFail = false;
        purchaseAndBuildDashboard('Cancel',1);
    }
    
    public void getErrorMessage(){
        list<Dataset__c> DatsetList = [select id,RowNumber__c,Dataset_Name__c,KPI_Name__c,
       											Dataset_Id__c,Filter_Logics__c,
       											FilterName__c,UserLogic__c,
       											Date_Label__c,Measure_Name__c,
       											Dimension_Name__c,Measure_API__c,
       											Dimension_Api__c,Data_API__c,Filter_Code__c,
       											AliasMeasure_API__c,CompactMeasure_API__c,New_Dimension_Name__c,New_Dimension_API__c
       											 from Dataset__c where Session_Id__c =: SessionId order by RowNumber__c limit 15];
        //System.debug('Valuess are not Created' + '**********************'+DatsetList+ '********' + DatsetList.size());
        list<Dataset__c> Dt3 = new list<Dataset__c>();
        for(Dataset__c Datlist:DatsetList) {
        	if(Datlist.Date_Label__c !=null && Datlist.Date_Label__c !='' && ((Datlist.Dimension_Name__c != Null && Datlist.Dimension_Name__c != '') || (Datlist.New_Dimension_Name__c != Null && Datlist.New_Dimension_Name__c != '')) && Datlist.Measure_Name__c != Null && Datlist.Measure_Name__c != ''){
        		Dt3.add(Datlist);
        	}
        } 
        
        //System.debug('Valuess are not Created' + Dt3 + '&&&&&&&&&&&&&&&&&&&&&&&&& '+Dt3.size());
        if(DatsetList.size() == Dt3.size()) {
            DashboardAllFails = false;
        }else{
            DashboardAllFails = true;
        }
            
    }
   
    /* ------------------------------------------ */
}