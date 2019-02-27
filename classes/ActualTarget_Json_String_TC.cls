@isTest
private class ActualTarget_Json_String_TC {

	private static testMethod void test() {
	    
	     Dataset__c ads = new Dataset__c ();
        ads.AliasMeasure_API__c ='sum_CloseDate_day_epoch,min_analyticscc__Date_2__c_day_epoch,avg_CloseDate_day_epoch,count,unique_AccountId';
       ads.CompactMeasure_API__c ='[\"sum\",\"LastModifiedDate_day_epoch\"],[\"min\",\"analyticscc__Date_2__c_day_epoch\"],[\"avg\",\"CloseDate_day_epoch\"],[\"count\",\"*\"],[\"count\",\"AccountId\"]';
        ads.Data_API__c ='LastModifiedDate,analyticscc__Date_2__c,CloseDate';
        ads.Dataset_Id__c ='0Fb36000000H8iHCAS';
         ads.Dataset_Name__c ='All_Opportunities';      
           ads.Date_Label__c = 'Last Modified Date,Date 2,Close Date';  
           ads.Dimension_Api__c ='AccountId.Name,LastModifiedDate,LastModifiedDate_Year';       
           ads.Dimension_Name__c ='AccountId.Name,LastModifiedDate,LastModifiedDate_Year';      
           ads.FilterLogic__c = '25,30';    
           ads.KPI_Name__c  ='Sales Insight';   
           ads.Measure_API__c   ='sum(\'LastModifiedDate_day_epoch\'), min(\'analyticscc__Date_2__c_day_epoch\'),avg(\'CloseDate_day_epoch\'),count(),count(\'AccountId\')';    
           ads.Measure_Name__c  ='sum(LastModifiedDate_day_epoch),min(analyticscc__Date_2__c_day_epoch),avg(CloseDate_day_epoch),count (),count(Account ID)';   
           ads.RowNumber__c=1; 
           ads.FilterName__c = 'test'; 
           
            Dataset__c ads2 = new Dataset__c ();
        ads2.AliasMeasure_API__c ='sum_CloseDate_day_epoch,min_analyticscc__Date_2__c_day_epoch,avg_CloseDate_day_epoch,count,unique_AccountId';
       ads2.CompactMeasure_API__c ='[\"sum\",\"LastModifiedDate_day_epoch\"],[\"min\",\"analyticscc__Date_2__c_day_epoch\"],[\"avg\",\"CloseDate_day_epoch\"],[\"count\",\"*\"],[\"count\",\"AccountId\"]';
        ads2.Data_API__c ='LastModifiedDate,analyticscc__Date_2__c,CloseDate';
        ads2.Dataset_Id__c ='0Fb36000000H8iHCAS';
         ads2.Dataset_Name__c ='All_Opportunities';      
           ads2.Date_Label__c = 'Last Modified Date,Date 2,Close Date';  
           ads2.Dimension_Api__c ='AccountId.Name,LastModifiedDate,LastModifiedDate_Year';       
           ads2.Dimension_Name__c ='AccountId.Name,LastModifiedDate,LastModifiedDate_Year';      
           ads2.FilterLogic__c = '';    
           ads2.KPI_Name__c  ='Sales Insight';   
           ads2.Measure_API__c   ='sum(\'LastModifiedDate_day_epoch\'), min(\'analyticscc__Date_2__c_day_epoch\'),avg(\'CloseDate_day_epoch\'),count(),count(\'AccountId\')';    
           ads2.Measure_Name__c  ='sum(LastModifiedDate_day_epoch),min(analyticscc__Date_2__c_day_epoch),avg(CloseDate_day_epoch),count (),count(Account ID)';   
           ads2.RowNumber__c=2; 
           ads2.FilterName__c = '';
         list<Dataset__c> d= new list<Dataset__c>();
         d.add(ads);
         d.add(ads2);
         
        Sales_Insight__c sales = new Sales_Insight__c();
        sales.name = 'Default Actual Target Theme';
        Sales.Sales_Insight_String1__c = 'test';  
        Sales.Sales_insight_String2__c = 'test1';
         
        insert sales;
       
       ActualTarget_Json_String   At = new ActualTarget_Json_String  ();
       ActualTarget_Json_String.jsonMethod(d,'hg','test','dg','123',sales.Id);
       
       System.assertEquals('Sales Insight',ads.KPI_Name__c);

	}
	
	 private static testMethod void testmethod2() {
        Dataset__c ads = new Dataset__c ();
        ads.AliasMeasure_API__c ='sum_CloseDate_day_epoch';
       ads.CompactMeasure_API__c ='[\"sum\",\"LastModifiedDate_day_epoch\"]';
        ads.Data_API__c ='LastModifiedDate';
        ads.Dataset_Id__c ='0Fb36000000H8iHCAS';
         ads.Dataset_Name__c ='All_Opportunities';      
           ads.Date_Label__c = 'Last Modified Date';  
           ads.Dimension_Api__c ='AccountId.Name';       
           ads.Dimension_Name__c ='AccountId.Name';      
           ads.FilterLogic__c = '25,30';    
           ads.KPI_Name__c  ='Sales Insight';   
           ads.Measure_API__c   ='sum(\'LastModifiedDate_day_epoch\')';    
           ads.Measure_Name__c  ='sum(LastModifiedDate_day_epoch)';   
           ads.RowNumber__c=1;  
         list<Dataset__c> d= new list<Dataset__c>();
         d.add(ads);
         
            Sales_Insight__c sales = new Sales_Insight__c();
        sales.name = 'Default Actual Target Theme';
        Sales.Sales_Insight_String1__c = 'test';  
        Sales.Sales_insight_String2__c = 'test1';
        insert sales;
        
       ActualTarget_Json_String   At = new ActualTarget_Json_String  ();
       ActualTarget_Json_String.jsonMethod(d,'hg','test','dg','123',sales.Id);
       
       System.assertEquals('Sales Insight',ads.KPI_Name__c);
       
  }
    private static testMethod void test3() {
	    
	     Dataset__c ads = new Dataset__c ();
            ads.Dataset_Id__c ='0Fb36000000H8iHCAS';
            ads.Dataset_Name__c ='All_Opportunities';      
            ads.RowNumber__c=1; 
           
            Dataset__c ads2 = new Dataset__c ();
             ads2.Dataset_Id__c ='0Fb36000000H8iHCAS';
                ads2.Dataset_Name__c ='All_Opportunities';      
                ads2.RowNumber__c=2; 
           list<Dataset__c> d= new list<Dataset__c>();
         d.add(ads);
         d.add(ads2);
         
        Sales_Insight__c sales = new Sales_Insight__c();
        sales.name = 'Default Actual Target Theme';
        Sales.Sales_Insight_String1__c = 'test';  
        Sales.Sales_insight_String2__c = 'test1';
         
        insert sales;
       
       ActualTarget_Json_String   At = new ActualTarget_Json_String  ();
       ActualTarget_Json_String.jsonMethod(d,'hg','test','dg','123',sales.Id);
       
       System.assertEquals('All_Opportunities',ads.Dataset_Name__c);

	}
}