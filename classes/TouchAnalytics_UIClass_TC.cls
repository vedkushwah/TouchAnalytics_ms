@isTest
private class TouchAnalytics_UIClass_TC {

     public  static testMethod void testLightningReports() {
        
        DB_Template__c DatasetRec1 = new DB_Template__c();
				DatasetRec1.DB_Name__c = 'Sales';
				DatasetRec1.Type__c = 'Single KPI';
			    insert 	DatasetRec1;
	    DB_Template__c DatasetRec2 = new DB_Template__c();
				DatasetRec2.DB_Name__c = 'Sales 1';
				DatasetRec2.Type__c = 'Snapshot KPI';
			    insert 	DatasetRec2;
			    
	    DB_Template__c DatasetRec3 = new DB_Template__c();
				DatasetRec3.DB_Name__c = 'Sales 2';
				DatasetRec3.Type__c = 'Actual/Target';
			    insert 	DatasetRec3;
	    DB_Template__c DatasetRec4 = new DB_Template__c();
				DatasetRec4.DB_Name__c = 'Sales 2';
				DatasetRec4.Type__c = 'Multi KPI';
			    insert 	DatasetRec4;
        
        Json_class__c jc = new Json_class__c();
        jc.Name = 'Default MultiKPI Theme';
        insert jc;
        Sales_Insight__c Sls = new Sales_Insight__c();
        Sls.Name = 'New Default Sales Insight';
        insert Sls;
        
        Sales_Insight__c Slss = new Sales_Insight__c();
        Slss.Name = 'Theme For NewSalesSight';
        Slss.Sales_Insight_String1__c = 'New Default Sales Insight';
        Slss.Sales_Insight_String2__c = 'New Default Sales Insight';
        Slss.Sales_Insight_String3__c = 'New Default Sales Insight';
        Slss.Sales_Insight_String4__c = 'New Default Sales Insight';
        Slss.Sales_Insight_String5__c = 'New Default Sales Insight';
        insert Slss;
        
         analyticscc__Remote_Site_Settings__c tytyt = new analyticscc__Remote_Site_Settings__c();
         tytyt.analyticscc__Remote_Settings__c = true;
         tytyt.analyticscc__Base_URL__c = 'http:';
         tytyt.Name = 'RemoteSettings';
         insert tytyt;
         list<analyticscc__Remote_Site_Settings__c> Listvals = new list<analyticscc__Remote_Site_Settings__c>();
         Listvals.add(tytyt);
         TouchAnalytics_UIClass Tc = new TouchAnalytics_UIClass();
         Tc.SelectKPIValue2 = 'ActualTarget';
         Tc.SelectKPIValue3 = 'ActualTarget Sales';
         Tc.SingleMulti = 'All';
         Tc.CreatedUsers= 'All';
         Tc.Sales();
         TouchAnalytics_UIClass.getDatasets();
         Tc.Templates();
         Tc.Cancel();
         Tc.Sales();
         Tc.MultiSales();
         //Tc.CloneSales();
         TC.remoteSiteSettings();
         TC.sales1();
         string DimensionsReturnValue;
         DimensionsReturnValue = 'test';
         TC.SelectKPIValue1 = 'Test';
         TC.SingleKPIValue1 ='NONE' ;
         TC.datevalues();
         TouchAnalytics_UIClass.Dimensions('Test','Tested');
         
         TC.Syncthemes();
         
         

        TC.TemplatesManage();
        Tc.ThemeName = 'Sales Insight';
        Tc.listVal = 'Insights';
        
       // Tc.ActualTarget();
       Apexpages.currentpage().getParameters().put('DeleteDB',DatasetRec4.id);
       Apexpages.currentpage().getParameters().put('HiddenConfigId',DatasetRec2.id);
       System.currentPageReference().getParameters().put('AllSectionone','<lispvaluestestspvaluestestspvaluestestspvaluestestspvaluestestspvaluestestspvaluestestspvaluestestspvaluestestspvaluestestspvaluestestspvaluestesttest');
System.currentPageReference().getParameters().put('AllSectiontwo','<lispvaluestestspvaluestestspvaluestestspvaluestestspvaluestestspvaluestestspvaluestestspvaluestestspvaluestestspvaluestestspvaluestestspvaluestesttest');
System.currentPageReference().getParameters().put('AllSectionthree','<lispvaluestestspvaluestestspvaluestestspvaluestestspvaluestestspvaluestestspvaluestestspvaluestestspvaluestestspvaluestestspvaluestestspvaluestesttest');
System.currentPageReference().getParameters().put('hiddenThemeId','AllNames');
System.currentPageReference().getParameters().put('AllSectiononeId','AllNamessss');
System.currentPageReference().getParameters().put('AllSectiontwoId','AllNamesaa');
System.currentPageReference().getParameters().put('AllSectionthreeId','AllNamess');
 Tc.accountBalance = 1000;
        Tc.totalCost = 100;
        Tc.selectedDashboard = 'Insights (Single Auto)';
        Tc.couponcode = 'Free Single Auto';
         Tc.BuildCost = 1000;
        Tc.removedb();
        Tc.datevaluesone();
        Tc.UncheckBox();
        Tc.saveConfig();
        Tc.ActNamings();
        Tc.buildDashboards();
        Tc.SaveandCloseopp();
        Tc.FloderList = 'Test';
       // Tc.NewStrings = 'NewStrings.replace(Copy of Single DB Template,Dbname).replace(00l28000001VoU1AAK,FloderList)';
          Sales_insight__c Sales= new Sales_Insight__c();
                Sales.Name = 'Default SingleKPI Theme';
                insert Sales;
                Apexpages.currentpage().getParameters().put('DeleteDB',Sales.id);
                Apexpages.currentpage().getParameters().put('HiddenConfig','Salesid');
                Apexpages.currentpage().getParameters().put('HiddenDesc','nnn');
                Apexpages.currentpage().getParameters().put('HiddenConfigId',Sales.id); 
                Apexpages.currentpage().getParameters().put('hiddenCloneThemeId',Sales.id);
                Apexpages.currentpage().getParameters().put('hiddenCloneThemeName','Insights');
                Tc.CloneNames = 'CloneName';
        TC.SaveTheme();
        TC.SaveCloneTheme();
        TC.SaveManage();
        TC.removedbs();
        Tc.ThemeName = 'Snapshot Dataset Insight';
        Tc.listVal = 'Compare';
        Sales_insight__c Sales1= new Sales_Insight__c();
                Sales1.Name = 'Default SnapshotKPI Theme';
                insert Sales1;
        TC.SaveTheme();
        Tc.CloneNames = 'CloneName';
        System.currentPageReference().getParameters().put('hiddenCloneThemeId',Sales1.id);
        System.currentPageReference().getParameters().put('hiddenCloneThemeName','Compare');
        TC.SaveCloneTheme();
        
        Tc.ThemeName = 'Actual Dataset Dataset Insight';
        Tc.listVal = 'Contrast';
        Sales_insight__c Sales2= new Sales_Insight__c();
        Sales2.Name = 'Default Actual Target Theme';
        insert Sales2;
        TC.SaveTheme();
        
         Tc.CloneNames = 'CloneName';
        System.currentPageReference().getParameters().put('hiddenCloneThemeId',Sales2.id);
        System.currentPageReference().getParameters().put('hiddenCloneThemeName','Contrast');
        TC.SaveCloneTheme();
        
         
        Tc.ThemeName = 'Multi Dataset Dataset Insight';
        Tc.listVal = 'Command';
         Json_class__c Sales3= new Json_class__c();
                Sales3.Name = 'Default MultiKPI Theme';
                insert Sales3;
                
                 Tc.CloneNames = 'CloneName';
        System.currentPageReference().getParameters().put('hiddenCloneThemeId',Sales3.id); 
        System.currentPageReference().getParameters().put('hiddenCloneThemeName','Command');
        //TC.SaveTheme();
         TC.SaveCloneTheme();
        
        
        
        TouchAnalytics_UIClass.m_createSingleDashboard('Tests');
        TC.AllMultiKPIDashboards();
         TC.AllActualDashboards();
         TC.AllSnapshotDashboards();
         TC.AllSingleDashboards();
         
         
         Apexpages.currentpage().getParameters().put('DeleteDB',DatasetRec1.id);
         TC.ActualTargetSales();
         TC.removedb();
         TC.datevaluesone();
          TC.booleanConnections();
 TC.buildSelected();
 TC.getCouponInformation();
 TC.getBulidCost();
 TC.connectToSFDC();
 TC.connectToSFDCs();
 TC.verifyAccountDetails();
 TC.TouchverifyAccountDetails();
 TC.verifyContactDetails();
 TC.TouchverifyContactDetails();
 TC.saveAndCancelDashboard(1);
 TC.purchaseAndBuildDashboard('Failed',1);
 TC.saveOpportunity(1);
TC.saveOpportunityLineItem(1);
 TC.ConnectSfdc();
 TC.Goback();
 TC.Cancelclose();
       
       
        
         //Tc.removedb();
         //Apexpages.currentpage().getParameters().put('DeleteDB','1');
         system.assertEquals('test', 'test');
     }
     
     public  static testMethod void testLightningReports1() {
         TouchAnalytics_UIClass Tc = new TouchAnalytics_UIClass();
         Tc.SingleKPIValue = 'None';
         Tc.Sales();
         TouchAnalytics_UIClass.getDatasets();
         Tc.Templates();
         Tc.Cancel();
         Tc.Sales();
         Tc.MultiSales();
         Remote_Site_Settings__c rss = new Remote_Site_Settings__c();
         rss.Name = 'Touch Analytics';
         rss.Remote_Settings__c = true;
         insert rss;
         Tc.openTouchAnalyticsPage();
         Tc.openTouchBackupPage();
         Tc.openTouchHomePage();
         Sales_Insight__c sales = new Sales_Insight__c();
         sales.Name = 'Theme For NewSalesSight';
         sales.Dashboard_Id__c = '';
         insert sales;
         Tc.NewStringval4();
         Tc.NewStringval5();
         Tc.NewStringval6();
         Tc.singleDashboardTheme();
         
         //Tc.CloneSales();
         
         //Tc.SelectKPIValue = 'Test';
         //Tc.removedb();
         //Apexpages.currentpage().getParameters().put('DeleteDB','1');
         system.assertEquals('test', 'test');
     }
  
     
}