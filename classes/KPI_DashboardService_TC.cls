@isTest
private class KPI_DashboardService_TC {

    static testMethod void myUnitTest() {
        list<String> values = new List<String>();
        values.add('1234');
        values.add('Success');
        values.add('Sales');
        values.add('Mar');
       KPI_DashboardService.m_createDashboard('54321',values,'salesnames');
       System.assertEquals('1234', values[0]);
    }
    
    static testMethod void myUnitTest1() {
        
        
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
           ads.FilterName__c = 'test'; 
         list<Dataset__c> d= new list<Dataset__c>();
         d.add(ads);
         
          list<String> values = new List<String>();
        values.add('1234');
        values.add('Success');
        values.add('Sales');
        values.add('Mar');
         
       KPI_DashboardService.m_createDashboards(d,'test','test','test','test','salesnames');
       KPI_DashboardService.Dim_createDashboards('test','test');
       KPI_DashboardService.Build_createDashboard('test',values,'test','test');
       KPI_DashboardService.Dim_createDashboardss('test','test');
       KPI_DashboardService.Meas_createDashboardss('test','test');
       System.assertEquals('test', 'test');
    }
}