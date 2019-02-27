@isTest
private class SingleKPI_JsonString_TC {

	private static testMethod void testjsonoverview() {
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
           ads.Filter_Logics__c = '(\'AccountId.Name\' == \\\"cscsc\\\")';
           ads.KPI_Name__c  ='Sales Insight';   
           ads.Measure_API__c   ='sum(\'LastModifiedDate_day_epoch\'), min(\'analyticscc__Date_2__c_day_epoch\'),avg(\'CloseDate_day_epoch\'),count(),count(\'AccountId\')';    
           ads.Measure_Name__c  ='sum(LastModifiedDate_day_epoch),min(analyticscc__Date_2__c_day_epoch),avg(CloseDate_day_epoch),count (),count(Account ID)';   
           ads.RowNumber__c=1; 
           ads.FilterName__c = 'test'; 
         list<Dataset__c> d= new list<Dataset__c>();
         d.add(ads);
         
            Sales_Insight__c sales = new Sales_Insight__c();
        sales.name = 'Default SingleKPI Theme';
        Sales.Sales_Insight_String1__c = 'test';  
        Sales.Sales_insight_String2__c = 'test1';
        insert sales;
       
       SingleKPI_JsonString_AC  jos = new SingleKPI_JsonString_AC ();
       SingleKPI_JsonString_AC.jsonMethod(d,'hg','test','dg','123',sales.Id);
       
       System.assertEquals('Sales Insight',ads.KPI_Name__c);
       
	}
		private static testMethod void testjsonoverview2() {
        Dataset__c ads = new Dataset__c ();
        ads.AliasMeasure_API__c ='sum_CloseDate_day_epoch';
       ads.CompactMeasure_API__c ='[\"sum\",\"LastModifiedDate_day_epoch\"]';
        ads.Data_API__c ='LastModifiedDate';
        ads.Dataset_Id__c ='0Fb36000000H8iHCAS';
         ads.Dataset_Name__c ='All_Opportunities';      
           ads.Date_Label__c = 'Last Modified Date';  
           ads.Dimension_Api__c ='AccountId.Name';       
           ads.Dimension_Name__c ='AccountId.Name';      
           ads.FilterLogic__c = '';    
           ads.KPI_Name__c  ='Sales Insight';   
           ads.Measure_API__c   ='sum(\'LastModifiedDate_day_epoch\')';    
           ads.Measure_Name__c  ='sum(LastModifiedDate_day_epoch)';   
           ads.RowNumber__c=1;  
         list<Dataset__c> d= new list<Dataset__c>();
         d.add(ads);
         
            Sales_Insight__c sales = new Sales_Insight__c();
        sales.name = 'KPI Sales';
        Sales.Sales_Insight_String1__c = 'test';  
        Sales.Sales_insight_String2__c = 'test1';
        insert sales;
       
       SingleKPI_JsonString_AC  jos = new SingleKPI_JsonString_AC ();
       SingleKPI_JsonString_AC.jsonMethod(d,'hg','test','dg','123',sales.Id);
       
       System.assertEquals('Sales Insight',ads.KPI_Name__c);
       
	}
	
	
		private static testMethod void testjsonoverview3() {
        Dataset__c ads = new Dataset__c ();
        ads.Dataset_Id__c ='0Fb36000000H8iHCAS';
         ads.Dataset_Name__c ='All_Opportunities';      
            ads.RowNumber__c=1;  
         list<Dataset__c> d= new list<Dataset__c>();
         d.add(ads);
         
            Sales_Insight__c sales = new Sales_Insight__c();
        sales.name = 'KPI Sales';
        Sales.Sales_Insight_String1__c = 'test';  
        Sales.Sales_insight_String2__c = 'test1';
        insert sales;
       
       SingleKPI_JsonString_AC  jos = new SingleKPI_JsonString_AC ();
       SingleKPI_JsonString_AC.jsonMethod(d,'hg','test','dg','123',sales.Id);
       
       System.assertEquals('All_Opportunities',ads.Dataset_Name__c);
       
	}


}