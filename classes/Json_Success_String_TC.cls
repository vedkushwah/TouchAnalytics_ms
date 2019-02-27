@isTest
private class Json_Success_String_TC {

    static testMethod void myUnitTest() {
        
            Json_Success_String jss = new Json_Success_String();
        Sales_Insight__c Sales = SalesString();
        list<Sales_Insight__c> saleslist = new list<Sales_Insight__c>();
        saleslist.add(sales);
        
        Dataset__c ads = new Dataset__c ();
        ads.AliasMeasure_API__c ='sum_CloseDate_day_epoch,min_analyticscc__Date_2__c_day_epoch,avg_CloseDate_day_epoch,count';
        ads.CompactMeasure_API__c ='[\"sum\",\"LastModifiedDate_day_epoch\"],[\"min\",\"analyticscc__Date_2__c_day_epoch\"],[\"avg\",\"CloseDate_day_epoch\"],[\"count\",\"*\"]';
        ads.Data_API__c ='LastModifiedDate,analyticscc__Date_2__c';
        ads.Dataset_Id__c ='0Fb36000000H8iHCAS';
        ads.Dataset_Name__c ='All_Opportunities';       
        ads.Date_Label__c = 'Last Modified Date,Date 2';  
        ads.Dimension_Api__c ='AccountId.Name,LastModifiedDate,LastModifiedDate_Year';      
        ads.Dimension_Name__c ='AccountId.Name,LastModifiedDate,LastModifiedDate_Year';     
        ads.FilterLogic__c = '(\'AccountId.Name\' == \\\"cscsc\\\")';
        ads.FilterName__c = 'Test';   
        ads.KPI_Name__c ='Sales Insight';   
        ads.Measure_API__c  ='sum(\'LastModifiedDate_day_epoch\'), min(\'analyticscc__Date_2__c_day_epoch\'),avg(\'CloseDate_day_epoch\'),count()';    
        ads.Measure_Name__c ='sum(LastModifiedDate_day_epoch),min(analyticscc__Date_2__c_day_epoch),avg(CloseDate_day_epoch),count ()';   
        ads.Session_Id__c = UserInfo.getSessionId();
        ads.RowNumber__c=6; 
        ads.session_Id__c = UserInfo.getUserId();
        insert ads;
          Dataset__c ads1 = new Dataset__c ();
        ads1.AliasMeasure_API__c ='sum_CloseDate_day_epoch';
        ads1.CompactMeasure_API__c ='[\"sum\",\"LastModifiedDate_day_epoch\"]';
        ads1.Data_API__c ='LastModifiedDate';
        ads1.Dataset_Id__c ='0Fb36000000H8iHCAS';
        ads1.Dataset_Name__c ='All_Opportunities';       
        ads1.Date_Label__c = 'Last Modified Date';  
        ads1.Dimension_Api__c ='AccountId.Name,';      
        ads1.Dimension_Name__c ='AccountId.Name,';     
        ads1.FilterLogic__c = '(\'AccountId.Name\' == \\\"cscsc\\\")';   
        ads1.KPI_Name__c ='Sales Insight';   
        ads1.FilterName__c = 'Test';
        ads1.Measure_API__c  ='sum(\'LastModifiedDate_day_epoch\')';    
        ads1.Measure_Name__c ='sum(LastModifiedDate_day_epoch)';   
        ads1.RowNumber__c=7; 
        ads1.session_Id__c = UserInfo.getUserId();
        insert ads1;
        
         Dataset__c ads2 = new Dataset__c ();
        ads2.AliasMeasure_API__c ='sum_CloseDate_day_epoch';
        ads2.CompactMeasure_API__c ='[\"sum\",\"LastModifiedDate_day_epoch\"]';
        ads2.Data_API__c ='LastModifiedDate,';
        ads2.Dataset_Id__c ='0Fb36000000H8iHCAS';
        ads2.Dataset_Name__c ='All_Opportunities';       
        ads2.Date_Label__c = 'Last Modified Date';  
        ads2.Dimension_Api__c ='AccountId.Name,';      
        ads2.Dimension_Name__c ='AccountId.Name,';     
        ads2.FilterLogic__c = '(\'AccountId.Name\' == \\\"cscsc\\\")';   
        ads2.KPI_Name__c ='Sales Insight';   
        ads2.FilterName__c = 'Test';
        ads2.Measure_API__c  ='sum(\'LastModifiedDate_day_epoch\')';    
        ads2.Measure_Name__c ='sum(LastModifiedDate_day_epoch)';   
        ads2.RowNumber__c=8; 
        ads2.session_Id__c = UserInfo.getUserId();
        insert ads2;
        
         Dataset__c ads3 = new Dataset__c ();
        ads3.AliasMeasure_API__c ='sum_CloseDate_day_epoch';
        ads3.CompactMeasure_API__c ='[\"sum\",\"LastModifiedDate_day_epoch\"]';
        ads3.Data_API__c ='LastModifiedDate,';
        ads3.Dataset_Id__c ='0Fb36000000H8iHCAS';
        ads3.Dataset_Name__c ='All_Opportunities';       
        ads3.Date_Label__c = 'Last Modified Date';  
        ads3.Dimension_Api__c ='AccountId.Name,';      
        ads3.Dimension_Name__c ='AccountId.Name,';     
        ads3.FilterLogic__c = '(\'AccountId.Name\' == \\\"cscsc\\\")';   
        ads3.KPI_Name__c ='Sales Insight';   
        ads3.FilterName__c = 'Test';
        ads3.Measure_API__c  ='sum(\'LastModifiedDate_day_epoch\')';    
        ads3.Measure_Name__c ='sum(LastModifiedDate_day_epoch)';   
        ads3.RowNumber__c=9; 
        ads3.session_Id__c = UserInfo.getUserId();
        insert ads3;
        
         Dataset__c ads4 = new Dataset__c ();
        ads4.AliasMeasure_API__c ='sum_CloseDate_day_epoch';
        ads4.CompactMeasure_API__c ='[\"sum\",\"LastModifiedDate_day_epoch\"]';
        ads4.Data_API__c ='LastModifiedDate,';
        ads4.Dataset_Id__c ='0Fb36000000H8iHCAS';
        ads4.Dataset_Name__c ='All_Opportunities';       
        ads4.Date_Label__c = 'Last Modified Date';  
        ads4.Dimension_Api__c ='AccountId.Name,';      
        ads4.Dimension_Name__c ='AccountId.Name,';     
        ads4.FilterLogic__c = '(\'AccountId.Name\' == \\\"cscsc\\\")';   
        ads4.KPI_Name__c ='Sales Insight';   
        ads4.FilterName__c = 'Test';
        ads4.Measure_API__c  ='sum(\'LastModifiedDate_day_epoch\')';    
        ads4.Measure_Name__c ='sum(LastModifiedDate_day_epoch)';  
        ads4.Filter_Logics__c = '(\'AccountId.Name\' == \\\"cscsc\\\")'; 
        ads4.RowNumber__c=10; 
        ads4.session_Id__c = UserInfo.getUserId();
        insert ads4;
        
        
        list<Dataset__c> DatsetList = new list<Dataset__c> ();
        DatsetList.add(ads);
        DatsetList.add(ads1);
        DatsetList.add(ads2);
        DatsetList.add(ads3);
        DatsetList.add(ads4);
        list<String> values = new List<String>();
        values.add('1234');
        values.add('Success');
        values.add(UserInfo.getUserId());  
        values.add('Mar');
        Json_Success_String.SuccessString('test',values,sales.Id); 
         System.assertEquals('test',Sales.Sales_Header_text__c);
        
    }
    
     static testMethod void myUnitTest2() {
        
            Json_Success_String jss = new Json_Success_String();
         Sales_Insight__c Sales = SalesString();
        list<Sales_Insight__c> saleslist = new list<Sales_Insight__c>();
        saleslist.add(sales);
        
         Dataset__c ads = new Dataset__c ();
        ads.AliasMeasure_API__c ='';
        ads.CompactMeasure_API__c ='';
        ads.Data_API__c ='';
        ads.Dataset_Id__c ='0Fb36000000H8iHCAS';
        ads.Dataset_Name__c ='All_Opportunities';       
        ads.Date_Label__c = '';  
        ads.Dimension_Api__c ='';      
        ads.Dimension_Name__c ='';     
        ads.FilterLogic__c = '';
        ads.FilterName__c = 'Test';   
        ads.KPI_Name__c ='Sales Insight';   
        ads.Measure_API__c  ='';    
        ads.Measure_Name__c ='';   
        ads.Session_Id__c = UserInfo.getSessionId();
        ads.RowNumber__c=7;     
        insert ads;
        list<Dataset__c> DatsetList = new list<Dataset__c> ();
        DatsetList.add(ads);
        list<String> values = new List<String>();
        values.add('1234');
        values.add('Success');
        values.add('Sales');
        values.add('Mar');
        Json_Success_String.SuccessString('test',values,sales.Id); 
        System.assertEquals('test',Sales.Sales_KPI_Headers__c);
        
    }
    
    static testMethod void myUnitTest3() {
        
            Json_Success_String jss = new Json_Success_String();
        Sales_Insight__c Sales = SalesString();
        list<Sales_Insight__c> saleslist = new list<Sales_Insight__c>();
        saleslist.add(sales);
        
         Dataset__c ads4 = new Dataset__c ();
     	ads4.Dataset_Id__c ='0Fb36000000H8iHCAS'; 
        ads4.Dataset_Name__c ='All_Opportunities';       
        ads4.RowNumber__c=7; 
        ads4.session_Id__c = UserInfo.getUserId();
        insert ads4;
       
        list<String> values = new List<String>();
        values.add('1234');
        values.add('Success');
        values.add(UserInfo.getUserId());
        values.add('Mar');
        Json_Success_String.SuccessString('test',values,sales.Id); 
        System.assertEquals('test',Sales.Sales_KPI_Headers__c);
        
    }
    
     static testMethod void myUnitTest4() {
        
            Json_Success_String jss = new Json_Success_String();
        
        Sales_Insight__c Sales = SalesString();
        list<Sales_Insight__c> saleslist = new list<Sales_Insight__c>();
        saleslist.add(sales);
        
        Dataset__c ads = new Dataset__c ();
     	ads.Dataset_Id__c ='0Fb36000000H8iHCAS'; 
        ads.Dataset_Name__c ='All_Opportunities';       
        ads.RowNumber__c=6; 
        ads.session_Id__c = UserInfo.getUserId();
        insert ads;
        
       
        
         Dataset__c ads1 = new Dataset__c ();
     	ads1.Dataset_Id__c ='0Fb36000000H8iHCAS'; 
        ads1.Dataset_Name__c ='All_Opportunities';       
        ads1.RowNumber__c=7; 
        ads1.session_Id__c = UserInfo.getUserId();
        insert ads1;
        
         Dataset__c ads2 = new Dataset__c ();
     	ads2.Dataset_Id__c ='0Fb36000000H8iHCAS'; 
        ads2.Dataset_Name__c ='All_Opportunities';       
        ads2.RowNumber__c=8; 
        ads2.session_Id__c = UserInfo.getUserId();
        insert ads2;
        
         Dataset__c ads3 = new Dataset__c ();
     	ads3.Dataset_Id__c ='0Fb36000000H8iHCAS'; 
        ads3.Dataset_Name__c ='All_Opportunities';       
        ads3.RowNumber__c=9; 
        ads3.session_Id__c = UserInfo.getUserId();
        insert ads3;
        
        Dataset__c ads4 = new Dataset__c ();
     	ads4.Dataset_Id__c ='0Fb36000000H8iHCAS'; 
        ads4.Dataset_Name__c ='All_Opportunities';       
        ads4.RowNumber__c=10; 
        ads4.session_Id__c = UserInfo.getUserId();
        insert ads4;
       list<Dataset__c> DatsetList = new list<Dataset__c> ();
        DatsetList.add(ads4);
        DatsetList.add(ads3);
        DatsetList.add(ads2);
        DatsetList.add(ads1);
        DatsetList.add(ads);
        list<String> values = new List<String>();
        values.add('1234');
        values.add('Success');
        values.add(UserInfo.getUserId());
        values.add('Mar');
        Json_Success_String.SuccessString('test',values,sales.Id); 
        System.assertEquals('test',Sales.Sales_KPI_Headers__c);
        
    }
    
    
    public static Sales_Insight__c SalesString(){
        Sales_Insight__c sales = new Sales_Insight__c();
        sales.name = 'Sales Insight';
        Sales.Sales_Insight_String4__c = 'test';  
        Sales.Sales_insight_String2__c = 'test1';
        Sales.Sales_insight_String3__c = 'test2'; 
        Sales.Delete_All_Group__c = '#StaticSalesGrouping#';
        Sales.Delete_All_Dates__c = 'SalesKPIDate';
        Sales.DataSet_Delete__c= 'test';
        Sales.Delete_All_Orders__c= 'test';
        Sales.Sales_KPI_Delete__c= 'test';
        Sales.Number_Delete1__c= 'test';
        Sales.ListSelector__c= 'test';
        Sales.Lis_Selector36__c= 'test';
        Sales.Delete_All_Lists__c= 'test';
        Sales.Delete_List_Selector__c= 'test';
        Sales.Sales_Insight_Delete2__c= 'test';
        Sales.List_Selector6__c= 'test';
        Sales.Grouping_label_Delete__c= 'test';
        Sales.Delete_All_Group5__c= 'test';
        Sales.Grouping_Delete__c= 'test';
        Sales.Delete_All_Timeline1__c= 'test';
        Sales.Number_Delete2__c= 'test';
        Sales.Sales_Insight_Delete3__c= 'test';
        Sales.Container_Delete2__c= 'test';
        Sales.Grouping_Selectors__c= 'test';
        Sales.Delete_All_Timeline2__c= 'test';
        Sales.Date_label_Delete__c= 'test';
        Sales.Delete_All_Timeline3__c= 'test';
        Sales.Number_Delete3__c= 'test';
        Sales.Number_Delete4__c= 'test';
        Sales.Chart_Delete14__c= 'test';
         Sales.number_33__c='test';
        Sales.number_34__c='test';
        Sales.Date_Selector__c= 'test';
        Sales.Delete_All_Timeline4__c= 'test';
        Sales.Delete_All_dateselector1__c= 'test';
        Sales.Sales_Date_Delete__c= 'test';
        Sales.Delete_pillbox__c= 'test';
        Sales.Delete_All_dateselectors__c= 'test';
        Sales.Dates_Delete__c= 'test';
        Sales.Delete_All_Timeline__c= 'test';
        Sales.Sales_Insight_Measure_Delete__c= 'test';
        Sales.Delete_All_Measures__c= 'test';
        Sales.Chart_Delete2__c= 'test';
        Sales.Chart_Delete24__c= 'test';
        Sales.Measure_List_Selector__c= 'test';
        Sales.Measures_Delete__c= 'test';
        Sales.Delete_All_Texts__c= 'test';
        Sales.Sales_Insight_Filter_Delete__c= 'test';
        Sales.Delete_All_Static_KPIs__c= 'test';
        Sales.Delete_All_Chart4__c= 'test';
        Sales.Container1__c= 'test';
        Sales.Container2__c= 'test';
        Sales.Container3__c= 'test';
        Sales.Sales_KPI_1__c= 'test';
        Sales.Sales_KPI_2__c= 'test';
        Sales.Sales_KPI_3__c= 'test';
        Sales.Sales_KPI_4__c= 'test';
        Sales.Sales_KPI_5__c= 'test';
        Sales.Sales_Chart_1__c= 'test';
        Sales.Sales_Chart_2__c= 'test';
        Sales.Sales_Chart_3__c= 'test';
        Sales.Sales_Chart_4__c= 'test';
        Sales.Sales_Chart_5__c= 'test';
        Sales.Container__c= 'test';
        Sales.Container_Delete__c= 'test';
        Sales.Container_Delete1__c= 'test';
        Sales.Delete_All_Chart__c= 'test';
        Sales.Delete_All_Chart1__c= 'test';
        Sales.Delete_All_Chart2__c= 'test';
        Sales.Delete_All_Chart3__c= 'test';
        Sales.List_Selector__c= 'test';
        Sales.Pillbox__c= 'test';
        Sales.Date_Selector_Delete__c='test';
        Sales.Sales_insight_Day_Delete__c = 'test';
        Sales.Chart_Delete__c= 'test';
        Sales.Text_Delete__c= 'test';
        Sales.Chart_Delete1__c= 'test';
        Sales.Test1__c= 'test';
        Sales.Test2__c= 'test';
        Sales.Test3__c= 'test';
        Sales.Test4__c= 'test';
        Sales.Test5__c= 'test';
        Sales.Test6__c= 'test';
        Sales.Test7__c= 'test';
        Sales.Test8__c= 'test';
        Sales.Test9__c= 'test';
        Sales.Test10__c= 'test';
        Sales.Test11__c= 'test';
        Sales.Test12__c= 'test';
        Sales.Test13__c= 'test';
        Sales.Test14__c= 'test';
        Sales.Test15__c= 'test';
        Sales.Test16__c= 'test';
        Sales.Delete_List_Selector43__c= 'test';
        Sales.List_Selector43__c= 'test';
        Sales.Delete_List_Selector53__c= 'test';
        Sales.View_Results__c= 'test';
        Sales.View_Results_Text__c= 'test';
        Sales.List_Selector53__c= 'test';
        Sales.Sales_KPI_Headers__c= 'test';
        Sales.Sales_Header_text__c= 'test'; 
        insert sales;
        
        return Sales;
    }
}