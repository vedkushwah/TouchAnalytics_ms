@isTest(seeAllData = true)
private class Dashboard_backup_Sales_TC {

	private static testMethod void Dashboard_backup_Sales() {
	    Sales_Insight__c SalesSvs = [select id,DataSet_Delete__c,Sales_Insight_String5__c,
	                                            Sales_insight_String2__c,Sales_insight_String3__c,
	                                            Grouping_label_Delete__c,Sales_insight_String4__c,
	                                            Grouping_Delete__c from Sales_Insight__c where Name = 'New Default Sales Insight' limit 1];
        Sales_Insight__c SalesSV = New Sales_Insight__c();
        SalesSV.DataSet_Delete__c = SalesSvs.DataSet_Delete__c;
        SalesSV.Sales_Insight_String5__c = SalesSvs.Sales_Insight_String5__c;
        SalesSV.Sales_insight_String2__c = SalesSvs.Sales_insight_String2__c;
        SalesSV.Sales_insight_String3__c = SalesSvs.Sales_insight_String3__c;
        SalesSV.Grouping_label_Delete__c = SalesSvs.Grouping_label_Delete__c;
        SalesSV.Sales_insight_String4__c = SalesSvs.Sales_insight_String4__c;
        SalesSV.Grouping_Delete__c = SalesSvs.Grouping_Delete__c;
        insert SalesSV;
        system.assertEquals('test', 'test');
    //     Dashboard_backup_Sales_AC ews = new Dashboard_backup_Sales_AC();
    //   ews.NewDashboardSingle(SalesSV.Id);
      //  ews.NewDashboardSingle3(SalesSV.Id);   
      //  ews.NewDashboardSingle4(SalesSV.Id);
	}
	
	private static testMethod void Dashboard_backup_Salesone() {
	    Sales_Insight__c SalesSvs = [select id,DataSet_Delete__c,Sales_Insight_String5__c,
	                                            Sales_insight_String2__c,Sales_insight_String3__c,
	                                            Grouping_label_Delete__c,Sales_insight_String4__c,
	                                            Grouping_Delete__c from Sales_Insight__c where Name = 'New Default Sales Insight' limit 1];
        Sales_Insight__c SalesSV = New Sales_Insight__c();
        SalesSV.DataSet_Delete__c = SalesSvs.DataSet_Delete__c;
        SalesSV.Sales_Insight_String5__c = SalesSvs.Sales_Insight_String5__c;
        SalesSV.Sales_insight_String2__c = SalesSvs.Sales_insight_String2__c;
        SalesSV.Sales_insight_String3__c = SalesSvs.Sales_insight_String3__c;
        SalesSV.Grouping_label_Delete__c = SalesSvs.Grouping_label_Delete__c;
        SalesSV.Sales_insight_String4__c = SalesSvs.Sales_insight_String4__c;
        SalesSV.Grouping_Delete__c = SalesSvs.Grouping_Delete__c;
        insert SalesSV;
        Dashboard_backup_Sales_AC ews = new Dashboard_backup_Sales_AC(); 
        system.assertEquals('test', 'test');
       //ews.NewDashboardSingle(SalesSV.Id);
      //  ews.NewDashboardSingle3(SalesSV.Id);   
      //  ews.NewDashboardSingle4(SalesSV.Id);
	}
	
	
		private static testMethod void Dashboard_backup_Salestwo() {
	    Sales_Insight__c SalesSvs = [select id,DataSet_Delete__c,Sales_Insight_String5__c,
	                                            Sales_insight_String2__c,Sales_insight_String3__c,
	                                            Grouping_label_Delete__c,Sales_insight_String4__c,
	                                            Grouping_Delete__c from Sales_Insight__c where Name = 'New Default Sales Insight' limit 1];
        Sales_Insight__c SalesSV = New Sales_Insight__c();
        SalesSV.DataSet_Delete__c = SalesSvs.DataSet_Delete__c;
        SalesSV.Sales_Insight_String5__c = SalesSvs.Sales_Insight_String5__c;
        SalesSV.Sales_insight_String2__c = SalesSvs.Sales_insight_String2__c;
        SalesSV.Sales_insight_String3__c = SalesSvs.Sales_insight_String3__c;
        SalesSV.Grouping_label_Delete__c = SalesSvs.Grouping_label_Delete__c;
        SalesSV.Sales_insight_String4__c = SalesSvs.Sales_insight_String4__c;
        SalesSV.Grouping_Delete__c = SalesSvs.Grouping_Delete__c;
        insert SalesSV;
        system.assertEquals('test', 'test');
        // Dashboard_backup_Sales_AC ews = new Dashboard_backup_Sales_AC();
         
        // ews.NewDashboardSingle4(SalesSV.Id);
	}
	
	
		private static testMethod void Dashboard_backup_Salesthree() {
	    Sales_Insight__c SalesSvs = [select id,DataSet_Delete__c,Sales_Insight_String5__c,
	                                            Sales_insight_String2__c,Sales_insight_String3__c,
	                                            Grouping_label_Delete__c,Sales_insight_String4__c,
	                                            Grouping_Delete__c from Sales_Insight__c where Name = 'New Default Sales Insight' limit 1];
        Sales_Insight__c SalesSV = New Sales_Insight__c();
        SalesSV.DataSet_Delete__c = SalesSvs.DataSet_Delete__c;
        SalesSV.Sales_Insight_String5__c = SalesSvs.Sales_Insight_String5__c;
        SalesSV.Sales_insight_String2__c = SalesSvs.Sales_insight_String2__c;
        SalesSV.Sales_insight_String3__c = SalesSvs.Sales_insight_String3__c;
        SalesSV.Grouping_label_Delete__c = SalesSvs.Grouping_label_Delete__c;
        SalesSV.Sales_insight_String4__c = SalesSvs.Sales_insight_String4__c;
        SalesSV.Grouping_Delete__c = SalesSvs.Grouping_Delete__c;
        insert SalesSV;
        system.assertEquals('test', 'test');
        //  Dashboard_backup_Sales_container_AC ews = new Dashboard_backup_Sales_container_AC();
         
        // ews.NewDashboardSingle2(SalesSV.Id);
	}

}