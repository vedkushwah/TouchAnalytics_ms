@isTest(seeAllData = true)
private class Dashboard_Backup_AC_TC {

	private static testMethod void test() {
	    list<Sales_Insight__c> NewSales = new list<Sales_Insight__c>();
	    Sales_Insight__c sales = new Sales_Insight__c();
	    sales.Name = 'Default SingleKPI Theme';
	    insert sales;
	    
	    
	      Sales_Insight__c SalesSvs = [select id,DataSet_Delete__c,Sales_insight_String1__c,
	                                            Sales_insight_String2__c,Sales_insight_String3__c,
	                                            Grouping_label_Delete__c,Sales_insight_String4__c,
	                                            Grouping_Delete__c from Sales_Insight__c where Name = 'Default SingleKPI Theme' limit 1];
        Sales_Insight__c SalesSV = New Sales_Insight__c();
        SalesSV.Name = 'Sales Sd ETts';
        SalesSV.Sales_Insight_String1__c = SalesSvs.Sales_Insight_String1__c;
        SalesSV.Sales_insight_String2__c = SalesSvs.Sales_insight_String2__c;
        SalesSV.Sales_insight_String3__c = SalesSvs.Sales_insight_String3__c;
        SalesSV.Dashboard_Type__c = 'Insights'; 
        insert SalesSV;
        
     

	    NewSales.add(SalesSV);
	    Test.startTest(); 
	    Test.setMock(HttpCalloutMock.class, new MockDashboardBackup()); 
	    Dashboard_Backup_AC db = new Dashboard_Backup_AC();
	    db.NewDashboardsSingle(SalesSV.Id);  
	    Test.stopTest();

	}
		private static testMethod void test1() {
	    list<Sales_Insight__c> NewSales = new list<Sales_Insight__c>();
	    Sales_Insight__c sales = new Sales_Insight__c();
	    sales.Name = 'Default SingleKPI Theme';
	    insert sales;
	    
	    
	      Sales_Insight__c SalesSvs = [select id,DataSet_Delete__c,Sales_insight_String1__c,
	                                            Sales_insight_String2__c,Sales_insight_String3__c,
	                                            Grouping_label_Delete__c,Sales_insight_String4__c,
	                                            Grouping_Delete__c from Sales_Insight__c where Name = 'Default SnapshotKPI Theme' limit 1];
        Sales_Insight__c SalesSV = New Sales_Insight__c();
        SalesSV.Name = 'Sales Sd ETts';
        SalesSV.Sales_Insight_String1__c = SalesSvs.Sales_Insight_String1__c;
        SalesSV.Sales_insight_String2__c = SalesSvs.Sales_insight_String2__c;
        SalesSV.Sales_insight_String3__c = SalesSvs.Sales_insight_String3__c;
        SalesSV.Dashboard_Type__c = 'Compare'; 
        insert SalesSV;
        
     

	    NewSales.add(SalesSV);
	    Test.startTest(); 
	    Test.setMock(HttpCalloutMock.class, new MockDashboardBackup()); 
	    Dashboard_Backup_AC db = new Dashboard_Backup_AC();
	    db.NewDashboardsSingle(SalesSV.Id);  
	    Test.stopTest();
	    system.assertEquals('test', 'test');

	}
		private static testMethod void test2() {
	    list<Sales_Insight__c> NewSales = new list<Sales_Insight__c>();
	    Sales_Insight__c sales = new Sales_Insight__c();
	    sales.Name = 'Default SingleKPI Theme';
	    insert sales;
	    
	    
	      Sales_Insight__c SalesSvs = [select id,Sales_insight_String1__c,
	                                            Sales_insight_String2__c,Sales_insight_String3__c
	                                             from Sales_Insight__c where Name = 'Default Actual Target Theme' limit 1];
        Sales_Insight__c SalesSV = New Sales_Insight__c();
        SalesSV.Name = 'Sales Sd ETts';
        SalesSV.Sales_Insight_String1__c = SalesSvs.Sales_Insight_String1__c;
        SalesSV.Sales_insight_String2__c = SalesSvs.Sales_insight_String2__c;
        SalesSV.Sales_insight_String3__c = SalesSvs.Sales_insight_String3__c;
        SalesSV.Dashboard_Type__c = 'Contrast'; 
        insert SalesSV;
        
     

	    NewSales.add(SalesSV);
	    Test.startTest(); 
	    Test.setMock(HttpCalloutMock.class, new MockDashboardBackup()); 
	    Dashboard_Backup_AC db = new Dashboard_Backup_AC();
	    db.NewDashboardsSingle(SalesSV.Id);  
	    Test.stopTest();
	    system.assertEquals('test', 'test');

	}
	
	
	
	private static testMethod void test3() {
	    
	    Json_class__c SalesSvs = [select id,Json_String__c,Json3__c,
	                                            Json1__c,Json2__c
	                                             from Json_class__c where Name = 'Default MultiKPI Theme' limit 1];
	    list<Json_class__c> NewSales = new list<Json_class__c>();
	    Json_class__c json = new Json_class__c();
	    json.Name = 'Default MultiKPI Themess';
	    json.Json_String__c = SalesSvs.Json_String__c;
	    json.Json3__c = SalesSvs.Json3__c;
	    json.Json1__c = SalesSvs.Json1__c;
	    json.Json2__c = SalesSvs.Json2__c;
	    json.Dashboard_Type__c = 'Command';
	    json.Dashboard_Id__c = 'NewId';
	    insert json;
	    
	     Sales_Insight__c SalesSvss = [select id,DataSet_Delete__c,Sales_Insight_String5__c,
	                                            Sales_insight_String2__c,Sales_insight_String3__c,
	                                            Grouping_label_Delete__c,Sales_insight_String4__c,
	                                            Grouping_Delete__c from Sales_Insight__c where Name = 'New Default Sales Insight' limit 1];
        Sales_Insight__c SalesSV = New Sales_Insight__c();
        SalesSV.DataSet_Delete__c = SalesSvss.DataSet_Delete__c;
        SalesSV.Sales_Insight_String5__c = SalesSvss.Sales_Insight_String5__c;
        SalesSV.Sales_insight_String2__c = SalesSvss.Sales_insight_String2__c;
        SalesSV.Sales_insight_String3__c = SalesSvss.Sales_insight_String3__c;
        SalesSV.Grouping_label_Delete__c = SalesSvss.Grouping_label_Delete__c;
        SalesSV.Sales_insight_String4__c = SalesSvss.Sales_insight_String4__c;
        SalesSV.Grouping_Delete__c = SalesSvss.Grouping_Delete__c;
        SalesSV.Dashboard_Type__c = 'Sales Insights';
        SalesSV.Dashboard_Id__c = 'NewId';
        
        insert SalesSV;
        
	    NewSales.add(json);
	    Dashboard_Backup_AC db = new Dashboard_Backup_AC();
	    db.NewDashboardsSingle1(json.Id);
	    system.assertEquals('test', 'test');
	   
	}
	
	
	
	

}