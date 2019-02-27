@isTest
private class LightningReports_Test_TC {

     public  static testMethod void testLightningReports() {
     
      Dataset__c ads = new Dataset__c ();
        ads.AliasMeasure_API__c ='sum_CloseDate_day_epoch,min_analyticscc__Date_2__c_day_epoch,avg_CloseDate_day_epoch,count,unique_AccountId';
       ads.CompactMeasure_API__c ='[\"sum\",\"LastModifiedDate_day_epoch\"],[\"min\",\"analyticscc__Date_2__c_day_epoch\"],[\"avg\",\"CloseDate_day_epoch\"],[\"count\",\"*\"],[\"count\",\"AccountId\"]';
        ads.Data_API__c ='LastModifiedDate,analyticscc__Date_2__c,CloseDate';
        ads.Dataset_Id__c ='0Fb36000000H8iHCAS';
         ads.Dataset_Name__c ='All_Opportunities';      
           ads.Date_Label__c = 'Last Modified Date,Date 2,Close Date';  
           ads.Dimension_Api__c ='AccountId.Name,LastModifiedDate,LastModifiedDate_Year';       
           ads.Dimension_Name__c ='AccountId.Name,LastModifiedDate,LastModifiedDate_Year';      
           ads.FilterLogic__c = '(\'AccountId.Name\' == \\\"cscsc\\\")';    
           ads.KPI_Name__c  ='Sales Insight';   
           ads.Measure_API__c   ='sum(\'LastModifiedDate_day_epoch\'), min(\'analyticscc__Date_2__c_day_epoch\'),avg(\'CloseDate_day_epoch\'),count(),count(\'AccountId\')';    
           ads.Measure_Name__c  ='sum(LastModifiedDate_day_epoch),min(analyticscc__Date_2__c_day_epoch),avg(CloseDate_day_epoch),count (),count(Account ID)';   
           ads.RowNumber__c=1; 
           ads.session_Id__c = UserInfo.getSessionId(); 
          insert ads;
        
        DB_Template__c DBTemplates = new DB_Template__c();
        DBTemplates.DB_Name__c = 'Sales KPI';
        insert DBTemplates;
        
        KPIs__c KPIs = new KPIs__c();
        KPIs.Dataset_Id__c = '0Fb36000000H8iHCAS';
        KPIs.Dataset_Name__c = 'All_Opportunities'; 
        KPIs.Dimension_Label__c = 'AccountId.Name,LastModifiedDate,LastModifiedDate_Year'; 
        KPIs.User_Logic__c = '1';
        KPIs.Filter_Logic__c = '(\'AccountId.Name\' == \\\"cscsc\\\")';  
        KPIs.Filter_Name__c = 'F1';
        KPIs.KPI_Name__c = 'Sales';
        KPIs.Measure_Label__c = 'sum(LastModifiedDate_day_epoch),min(analyticscc__Date_2__c_day_epoch),avg(CloseDate_day_epoch),count (),count(Account ID)';
        KPIs.RowNumber__c = 1;
        KPIs.AliasMeasure_API__c = 'sum_CloseDate_day_epoch,min_analyticscc__Date_2__c_day_epoch,avg_CloseDate_day_epoch,count,unique_AccountId';
        KPIs.CompactMeasure_API__c = '[\"sum\",\"LastModifiedDate_day_epoch\"],[\"min\",\"analyticscc__Date_2__c_day_epoch\"],[\"avg\",\"CloseDate_day_epoch\"],[\"count\",\"*\"],[\"count\",\"AccountId\"]';
         KPIs.Dimension_API__c = 'AccountId.Name,LastModifiedDate,LastModifiedDate_Year'; 
        KPIs.Measure_API__c = 'sum(\'LastModifiedDate_day_epoch\'), min(\'analyticscc__Date_2__c_day_epoch\'),avg(\'CloseDate_day_epoch\'),count(),count(\'AccountId\')';
        KPIs.Date_API__c = 'LastModifiedDate,analyticscc__Date_2__c,CloseDate';
        KPIs.DB_Template__c = DBTemplates.Id;
        KPIs.Date_Label__c = 'Last Modified Date,Date 2,Close Date';
        insert KPIs;
        
        Json_class__c Jsx = new Json_class__c();
        Jsx.name = 'All Actual';
        Jsx.Dashboard_Id__c = 'ssss';
        insert Jsx;
        
        Sales_insight__c Stcs = new Sales_insight__c();
        Stcs.name = 'New Default Sales Insightf';
        Stcs.Dashboard_Id__c = 'ssss';
        Stcs.Dashboard_Type__c = 'Sales Insights';
        insert Stcs;
        
         Sales_insight__c Stcs1 = new Sales_insight__c();
        Stcs1.name = 'New Default Sales Insights';
        Stcs1.Dashboard_Id__c = 'ssss';
        Stcs1.Dashboard_Type__c = 'Success Insight';
        insert Stcs1;
        
         Sales_insight__c Stcs3 = new Sales_insight__c();
        Stcs3.name = 'New Default Sales Insighta';
        Stcs3.Dashboard_Id__c = 'ssss';
        Stcs3.Dashboard_Type__c = 'Market Insight';
        insert Stcs3;
        
        Sales_insight__c Stc = new Sales_insight__c();
        Stc.name = 'New Default Sales Insight';
        Stc.Dashboard_Id__c = '';
        insert Stc;
        
        
        LightningReports_Test kc= new LightningReports_Test();
        kc.boxvalue = 'modal'; 
        System.currentPageReference().getParameters().put('tabid','1');
        System.currentPageReference().getParameters().put('hiddenKPI','1');
        System.currentPageReference().getParameters().put('KPIValue','1');
       
        Apexpages.currentpage().getParameters().put('RowNumberDel','1'); 
        Apexpages.currentpage().getParameters().put('hidrowcount','1');
        apexpages.currentpage().getparameters().put('KPIDimen','1');
        apexpages.currentpage().getparameters().put('counterWrap','1');
        apexpages.currentpage().getparameters().put('RowNumber','1');
        apexpages.currentpage().getparameters().put('KPIFilterName','1');
        apexpages.currentpage().getParameters().put('DeleteFil','1');
        apexpages.currentpage().getParameters().put('DeleteKPI','1');
        apexpages.currentpage().getParameters().put('RemoveFilter','1');
        apexpages.currentpage().getParameters().put('index','1');
        apexpages.currentpage().getparameters().put('SelectDimen','1');
        apexpages.currentpage().getparameters().put('SUM','1');
        apexpages.currentpage().getparameters().put('Count','1');
        apexpages.currentpage().getparameters().put('SUMName','1');
        apexpages.currentpage().getparameters().put('DimenCount','1');
        apexpages.currentpage().getparameters().put('DimenName','1');
        apexpages.currentpage().getparameters().put('Rowtrue','1');
        apexpages.currentpage().getparameters().put('Rowsumtrue','1');
        apexpages.currentpage().getparameters().put('RowDimtrue','1');          
        apexpages.currentpage().getparameters().put('RowNumbers','1');
        apexpages.currentpage().getParameters().put('RowNumberCount','1');
        apexpages.currentpage().getParameters().put('RowNumberFilter','1');
        apexpages.currentpage().getParameters().put('AddFilName','1');
        System.currentPageReference().getParameters().put('boxvalue','modal');
        apexpages.currentpage().getparameters().put('dbid',DBTemplates.Id);
       Kc.sessionId = UserInfo.getSessionId();
        kc.KPINameUI='test';
       kc.SaveSection();
       kc.removeSection();
       kc.Allval = Jsx.Id;
       kc.SubmitOverview();
       kc.SubmitMarketing();
       kc.SubmitSuccess();
           
        Kc.SessionId = UserInfo.getSessionId();
       kc.CloneFromPrevious(DbTemplates.Id);
       Kc.Save();
        Kc.DeleteAll();  
        Kc.previousvalue();
             
         Kc.FloderNames();
        
         
       System.assertEquals('Sales Insight',ads.KPI_Name__c);
     }
       public  static testMethod void testLightningReports1() {
     
      Dataset__c ads = new Dataset__c ();
        ads.AliasMeasure_API__c ='sum_CloseDate_day_epoch,min_analyticscc__Date_2__c_day_epoch,avg_CloseDate_day_epoch,count,unique_AccountId';
       ads.CompactMeasure_API__c ='[\"sum\",\"LastModifiedDate_day_epoch\"],[\"min\",\"analyticscc__Date_2__c_day_epoch\"],[\"avg\",\"CloseDate_day_epoch\"],[\"count\",\"*\"],[\"count\",\"AccountId\"]';
        ads.Data_API__c ='LastModifiedDate,analyticscc__Date_2__c,CloseDate';
        ads.Dataset_Id__c ='0Fb36000000H8iHCAS';
         ads.Dataset_Name__c ='All_Opportunities';      
           ads.Date_Label__c = 'Last Modified Date,Date 2,Close Date';  
           ads.Dimension_Api__c ='AccountId.Name,LastModifiedDate,LastModifiedDate_Year';       
           ads.Dimension_Name__c ='AccountId.Name,LastModifiedDate,LastModifiedDate_Year';      
           ads.FilterLogic__c = '(\'AccountId.Name\' == \\\"cscsc\\\")';    
           ads.KPI_Name__c  ='Sales Insight';   
           ads.Measure_API__c   ='sum(\'LastModifiedDate_day_epoch\'), min(\'analyticscc__Date_2__c_day_epoch\'),avg(\'CloseDate_day_epoch\'),count(),count(\'AccountId\')';    
           ads.Measure_Name__c  ='sum(LastModifiedDate_day_epoch),min(analyticscc__Date_2__c_day_epoch),avg(CloseDate_day_epoch),count (),count(Account ID)';   
           ads.RowNumber__c=1;  
          insert ads;
        
       
        LightningReports_Test kc= new LightningReports_Test();
        kc.boxvalue = 'modal1'; 
        System.currentPageReference().getParameters().put('tabid','1');
        System.currentPageReference().getParameters().put('hiddenKPI','1');
        System.currentPageReference().getParameters().put('KPIValue','1');
       
        Apexpages.currentpage().getParameters().put('RowNumberDel','1'); 
        Apexpages.currentpage().getParameters().put('hidrowcount','1');
        apexpages.currentpage().getparameters().put('KPIDimen','1');
        apexpages.currentpage().getparameters().put('counterWrap','1');
        apexpages.currentpage().getparameters().put('RowNumber','1');
        apexpages.currentpage().getparameters().put('KPIFilterName','1');
        apexpages.currentpage().getParameters().put('DeleteFil','1');
        apexpages.currentpage().getParameters().put('DeleteKPI','1');
        apexpages.currentpage().getParameters().put('RemoveFilter','1');
        apexpages.currentpage().getParameters().put('index','1');
        apexpages.currentpage().getparameters().put('SelectDimen','1');
        apexpages.currentpage().getparameters().put('SUM','1');
        apexpages.currentpage().getparameters().put('Count','1');
        apexpages.currentpage().getparameters().put('SUMName','1');
        apexpages.currentpage().getparameters().put('DimenCount','1');
        apexpages.currentpage().getparameters().put('DimenName','1');
        apexpages.currentpage().getparameters().put('Rowtrue','1');
        apexpages.currentpage().getparameters().put('Rowsumtrue','1');
        apexpages.currentpage().getparameters().put('RowDimtrue','1');          
        apexpages.currentpage().getparameters().put('RowNumbers','1');
        apexpages.currentpage().getParameters().put('RowNumberCount','1');
        apexpages.currentpage().getParameters().put('RowNumberFilter','1');
        apexpages.currentpage().getParameters().put('AddFilName','1');
        System.currentPageReference().getParameters().put('boxvalue','modal1');
                
      
        kc.KPINameUI='test';
       kc.SaveSection();
       kc.removeSection(); 
       kc.SubmitOverview();
       kc.SubmitMarketing();
       kc.SubmitSuccess();
       kc.SubmitSales();       
        Kc.DeleteAll();  
        
         Kc.FloderNames();   
         
       System.assertEquals('Sales Insight',ads.KPI_Name__c);
     }
       public  static testMethod void testLightningReports2() {
     
      Dataset__c ads = new Dataset__c ();
        ads.AliasMeasure_API__c ='sum_CloseDate_day_epoch,min_analyticscc__Date_2__c_day_epoch,avg_CloseDate_day_epoch,count,unique_AccountId';
       ads.CompactMeasure_API__c ='[\"sum\",\"LastModifiedDate_day_epoch\"],[\"min\",\"analyticscc__Date_2__c_day_epoch\"],[\"avg\",\"CloseDate_day_epoch\"],[\"count\",\"*\"],[\"count\",\"AccountId\"]';
        ads.Data_API__c ='LastModifiedDate,analyticscc__Date_2__c,CloseDate';
        ads.Dataset_Id__c ='0Fb36000000H8iHCAS';
         ads.Dataset_Name__c ='All_Opportunities';      
           ads.Date_Label__c = 'Last Modified Date,Date 2,Close Date';  
           ads.Dimension_Api__c ='AccountId.Name,LastModifiedDate,LastModifiedDate_Year';       
           ads.Dimension_Name__c ='AccountId.Name,LastModifiedDate,LastModifiedDate_Year';      
           ads.FilterLogic__c = '(\'AccountId.Name\' == \\\"cscsc\\\")';    
           ads.KPI_Name__c  ='Sales Insight';   
           ads.Measure_API__c   ='sum(\'LastModifiedDate_day_epoch\'), min(\'analyticscc__Date_2__c_day_epoch\'),avg(\'CloseDate_day_epoch\'),count(),count(\'AccountId\')';    
           ads.Measure_Name__c  ='sum(LastModifiedDate_day_epoch),min(analyticscc__Date_2__c_day_epoch),avg(CloseDate_day_epoch),count (),count(Account ID)';   
           ads.RowNumber__c=1;  
          insert ads;
        
       
        LightningReports_Test kc= new LightningReports_Test();
        kc.boxvalue = 'modal2'; 
        System.currentPageReference().getParameters().put('tabid','1');
        System.currentPageReference().getParameters().put('hiddenKPI','1');
        System.currentPageReference().getParameters().put('KPIValue','1');
       
        Apexpages.currentpage().getParameters().put('RowNumberDel','1'); 
        Apexpages.currentpage().getParameters().put('hidrowcount','1');
        apexpages.currentpage().getparameters().put('KPIDimen','1');
        apexpages.currentpage().getparameters().put('counterWrap','1');
        apexpages.currentpage().getparameters().put('RowNumber','1');
        apexpages.currentpage().getparameters().put('KPIFilterName','1');
        apexpages.currentpage().getParameters().put('DeleteFil','1');
        apexpages.currentpage().getParameters().put('DeleteKPI','1');
        apexpages.currentpage().getParameters().put('RemoveFilter','1');
        apexpages.currentpage().getParameters().put('index','1');
        apexpages.currentpage().getparameters().put('SelectDimen','1');
        apexpages.currentpage().getparameters().put('SUM','1');
        apexpages.currentpage().getparameters().put('Count','1');
        apexpages.currentpage().getparameters().put('SUMName','1');
        apexpages.currentpage().getparameters().put('DimenCount','1');
        apexpages.currentpage().getparameters().put('DimenName','1');
        apexpages.currentpage().getparameters().put('Rowtrue','1');
        apexpages.currentpage().getparameters().put('Rowsumtrue','1');
        apexpages.currentpage().getparameters().put('RowDimtrue','1');          
        apexpages.currentpage().getparameters().put('RowNumbers','1');
        apexpages.currentpage().getParameters().put('RowNumberCount','1');
        apexpages.currentpage().getParameters().put('RowNumberFilter','1');
        apexpages.currentpage().getParameters().put('AddFilName','1');
        System.currentPageReference().getParameters().put('boxvalue','modal2');
   KC.accountBalance = 1000;
        Kc.totalCost = 100;
        Kc.selectedDashboard = 'Insights (Single Auto)';
        Kc.couponcode = 'Free Single Auto';
         Kc.BuildCost = 1000;
        kc.KPINameUI='test';
       kc.SaveSection();
       kc.removeSection(); 
       kc.SubmitOverview();
       Kc.SaveandCloseopp();
       kc.SubmitMarketing();
       kc.SubmitSuccess();
       kc.SubmitSales();      
        Kc.DeleteAll();      
         Kc.FloderNames(); 
         Kc.singleDashboardThemeSale();
         Kc.singleDashboardTheme();
         Kc.NewClone();
          Kc.booleanConnections();
 Kc.buildSelected();
 Kc.getCouponInformation();
 Kc.getBulidCost();
 Kc.connectToSFDC();
 Kc.verifyAccountDetails();
 Kc.verifyContactDetails();
 Kc.saveAndCancelDashboard(1);
 Kc.purchaseAndBuildDashboard('Failed',1);
 Kc.saveOpportunity(1);
Kc.saveOpportunityLineItem(1);
 Kc.ConnectSfdc();
 Kc.Goback();
       
         
       System.assertEquals('Sales Insight',ads.KPI_Name__c);
     }
     }