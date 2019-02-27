public with sharing class Json_Static_String {
    
     /****************** Marketing String **********************************/    
    public Static String MarketingString(String DashboardId,list<String> FolderId,String Allval){   
        Sales_Insight__c Sales = [select id,DataSet_Delete__c,Delete_All_Group__c,Delete_All_Orders__c,Sales_KPI_Delete__c,Number_Delete1__c,ListSelector__c,Lis_Selector36__c,Sales_insight_Day_Delete__c,Sales_Insight_String2__c,Delete_All_Lists__c,Sales_Insight_String3__c,Delete_List_Selector__c,Sales_Insight_Delete2__c,List_Selector6__c,Grouping_label_Delete__c,Delete_All_Group5__c,Grouping_Delete__c,Delete_All_Timeline1__c,Number_Delete2__c,Sales_Insight_Delete3__c,Container_Delete2__c,Grouping_Selectors__c,Delete_All_Timeline2__c,Date_label_Delete__c,Delete_All_Timeline3__c,Number_Delete3__c,Number_Delete4__c,Chart_Delete14__c,Date_Selector__c,Delete_All_Timeline4__c,Delete_All_dateselector1__c,Sales_Date_Delete__c,Delete_pillbox__c,Delete_All_dateselectors__c,Dates_Delete__c,Delete_All_Timeline__c,Delete_All_Dates__c,Sales_Insight_Measure_Delete__c,Delete_All_Measures__c,Chart_Delete2__c,Chart_Delete24__c,Measure_List_Selector__c,Measures_Delete__c,Delete_All_Texts__c,Sales_Insight_Filter_Delete__c,Delete_All_Static_KPIs__c,Delete_All_Chart4__c,Container1__c,Container2__c,Container3__c,number_33__c,number_34__c,Sales_KPI_1__c,Sales_KPI_2__c,Sales_KPI_3__c,Sales_KPI_4__c,Sales_KPI_5__c,Sales_Chart_1__c,Sales_Chart_2__c,Sales_Chart_3__c,Sales_Chart_4__c,Sales_Chart_5__c,Container__c,Container_Delete__c,Container_Delete1__c,Delete_All_Chart__c,Delete_All_Chart1__c,Delete_All_Chart2__c,Delete_All_Chart3__c,List_Selector__c,Pillbox__c,Date_Selector_Delete__c,Chart_Delete__c,Text_Delete__c,Chart_Delete1__c,Test1__c,Test2__c,Test3__c,Test4__c,Test5__c,Test6__c,Test7__c,Test8__c,Test9__c,Test10__c,Test11__c,Test12__c,Test13__c,Test14__c,Test15__c,Test16__c,Sales_Insight_String4__c,Delete_List_Selector43__c,List_Selector43__c,Delete_List_Selector53__c,View_Results__c,View_Results_Text__c,List_Selector53__c,Sales_KPI_Headers__c,Sales_Header_text__c,Sales_insight_String1__c from Sales_Insight__c where id=: Allval limit 1];    
         list<Dataset__c> DatsetList = [select id,Data_API__c,RowNumber__c,KPI_Name__c,FilterName__c,Dataset_Id__c,Date_Label__c,Filter_Logics__c,Measure_API__c,Measure_Name__c,Dataset_Name__c,Dimension_Api__c, Dimension_Name__c,AliasMeasure_API__c,CompactMeasure_API__c from Dataset__c  where Session_Id__c =: FolderId[2] order by RowNumber__c Desc limit 5];                              
        String MarketingString = Sales.Sales_Insight_String4__c + Sales.Sales_insight_String2__c + Sales.Sales_insight_String3__c;  
        Integer RowNumber;
        String Datasetname;
        String DatasetId;
        set<String> AllRownumbers = new set<String>();
        for(Dataset__c DatasetRec : DatsetList){
            AllRownumbers.add(String.valueof(DatasetRec.Rownumber__c));
        }
        for(integer RowNumberlist=11;RowNumberlist<=15;RowNumberlist++){
        if(AllRownumbers.contains(String.valueof(RowNumberlist))){  
        for(Dataset__c DatasetRec : DatsetList){            
             RowNumber = Integer.valueof(DatasetRec.Rownumber__c);
             
                    set<String> NewSet = new set<String>();
                    list<String> Newlist = new list<String>();
                    Map<String,String> NewMap= new Map<String,String>();
                    String[] Dimensions = new String[]{};
                    String[] DimensionApi = new String[]{};
                    if(DatasetRec.Dimension_Name__c != Null){
                        Dimensions = DatasetRec.Dimension_Name__c.Split(',');
                    }
                    if(DatasetRec.Dimension_Api__c != Null){
                        DimensionApi = DatasetRec.Dimension_Api__c.Split(',');
                    } 
                                       
                    String[] Datelabel = new String[]{};
                    String[] DateApi =new String[]{};
                    String[]  measureLabel = new String[]{};
                    String[]  MeasureAPI = new String[]{};
                    String[] AliasMeasureAPI = new String[]{};
                    String[] CompactMeasureAPI = new String[]{};
                    
                    if(DatasetRec.Date_Label__c != null){
                        Datelabel = DatasetRec.Date_Label__c.Split(',');
                       
                    }
                    if(DatasetRec.Data_API__c != Null){
                        DateApi = DatasetRec.Data_API__c.Split(',');
                    }
                    if(DatasetRec.Measure_Name__c != null){
                        measureLabel = DatasetRec.Measure_Name__c.Split(',');
                         MeasureAPI = DatasetRec.Measure_API__c.Split(',');
                        AliasMeasureAPI = DatasetRec.AliasMeasure_API__c.Split(',');
                        DatasetRec.CompactMeasure_API__c = DatasetRec.CompactMeasure_API__c.replace('],[','];[');               
                        CompactMeasureAPI = DatasetRec.CompactMeasure_API__c.Split(';');
                    }
                     String Numbers = String.valueof(RowNumber - 10);   
                    if(DatasetRec.Dataset_Id__c != NUll){
                        
                        MarketingString =  MarketingString.replace('#'+Numbers+'datasetId#',DatasetRec.Dataset_Id__c).replace('#'+Numbers+'datasetAlias#',DatasetRec.Dataset_Name__c);
                        Datasetname = DatasetRec.Dataset_Name__c;    
                        DatasetId = DatasetRec.Dataset_Id__c;
                    }
                    if(DatasetRec.KPI_Name__c != Null){
                    MarketingString =  MarketingString.replace('Sales KPI '+Numbers,DatasetRec.KPI_Name__c);
                    }
                    
                    if(DashboardId != Null && DashboardId != '')
                  MarketingString = MarketingString.replace('#InsightComplete#',DashboardId);
                  else
                    MarketingString = MarketingString.replace('#InsightComplete#','Sales New Dashboard' );
                    
                  if(FolderId[0] != Null && FolderId[0] != '')
                  MarketingString = MarketingString.replace('00l36000000PcfKAAS',FolderId[0]);
                   
                  if(FolderId[1] != Null && FolderId[1] != '')
                  MarketingString = MarketingString.replace('Marketing Insights',FolderId[1]);
                  
                  if(Dimensions.Size() > 0){               
                        integer i = 1;  
                        integer j = 10;
                        for(String Dim : Dimensions){
                            integer k = i-1;
                          MarketingString =  MarketingString.replace('#'+Numbers+'GroupingLabel'+ i +'#',Dim).replace('#'+Numbers+'GroupingAPI'+ i+'#',DimensionApi[k]);  
                          i = i+1;
                        }
                        for(Integer L=i;J >= L;L++){
                             integer k = L;
                             if(K == 10){
                                 Sales.Grouping_label_Delete__c = Sales.Grouping_label_Delete__c.replace('GroupingLabel',Numbers+'GroupingLabel'+k).replace('}",','}"').replace('GroupingAPI',Numbers+'GroupingAPI'+k);
                                 MarketingString =  MarketingString.replace(Sales.Grouping_label_Delete__c,'');
                                 Sales.Grouping_label_Delete__c = Sales.Grouping_label_Delete__c.replace(Numbers+'GroupingLabel'+k,'GroupingLabel').replace('}"','}",').replace(Numbers+'GroupingAPI'+k,'GroupingAPI');
                             }
                             else{
                                 Sales.Grouping_label_Delete__c = Sales.Grouping_label_Delete__c.replace('GroupingLabel',Numbers+'GroupingLabel'+k).replace('GroupingAPI',Numbers+'GroupingAPI'+k);
                                 MarketingString =  MarketingString.replace(Sales.Grouping_label_Delete__c,'');
                                 Sales.Grouping_label_Delete__c = Sales.Grouping_label_Delete__c.replace(Numbers+'GroupingLabel'+k,'GroupingLabel').replace(Numbers+'GroupingAPI'+k,'GroupingAPI'); 
                             }
                        }
                    }
                    else{
                        String[] Grouping1 = new string[]{'9','10','27'};
                        String[] Grouping2 = new string[]{'13','14','28'};
                        String[] Grouping3 = new string[]{'17','18','33'};
                        String[] Grouping4 = new string[]{'20','21','34'};
                        String[] Grouping5 = new string[]{'24','25','35'};
                        for(integer i=1;i<=3;i++){
                            Sales.Grouping_Delete__c = Sales.Grouping_Delete__c.replace('Static_Sales__KPI_%RowNumber%_Grouping_%Numbers%','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('%RowNumber%GroupingLabel','#'+Numbers+'GroupingLabel').replace('%RowNumber%GroupingAPI','#'+Numbers+'GroupingAPI');
                             MarketingString =  MarketingString.remove(Sales.Grouping_Delete__c);
                            Sales.Grouping_Delete__c = Sales.Grouping_Delete__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'Static_Sales__KPI_%RowNumber%_Grouping_%Numbers%').replace('#'+Numbers+'GroupingLabel','%RowNumber%GroupingLabel').replace('#'+Numbers+'GroupingAPI','%RowNumber%GroupingAPI'); 
                            if(Numbers == '5'){
                                for(String Grp : Grouping5){
                                    Sales.Grouping_Selectors__c = Sales.Grouping_Selectors__c.replace('#listselectors#','listselector_'+Grp).replace('#GroupingNumbers#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i);
                                     MarketingString =  MarketingString.remove(Sales.Grouping_Selectors__c);
                                    Sales.Grouping_Selectors__c = Sales.Grouping_Selectors__c.replace('listselector_'+Grp,'#listselectors#').replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#GroupingNumbers#');
                                    if(Grp == '24'){
                                        Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": #Colspan#','"colspan": 3').replace('"column": #Column#','"column": 9').replace('#listselector#','listselector_'+Grp).replace('"row": #Row#','"row": 58');
                                        MarketingString =  MarketingString.remove(Sales.Sales_Date_Delete__c);
                                    //    Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 3','"colspan": 2').replace('"column": 9','"column": 2').replace('listselector_'+Grp,'listselector_'+Grp).replace('"row": 58','"row": 4');
                                    //    MarketingString =  MarketingString.remove(Sales.Sales_Date_Delete__c);
                                  //     Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 2','"colspan": 1').replace('"column": 2','"column": 1').replace('listselector_'+Grp,'listselector_'+Grp).replace('"row": 4','"row": 9');
                                  //     MarketingString =  MarketingString.remove(Sales.Sales_Date_Delete__c);
                                        Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 3','"colspan": #Colspan#').replace('"column": 9','"column": #Column#').replace('listselector_'+Grp,'#listselector#').replace('"row": 58','"row": #Row#');
                                    }
                                    
                                    if(Grp == '25'){
                                        Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": #Colspan#','"colspan": 3').replace('"column": #Column#','"column": 19').replace('#listselector#','listselector_'+Grp).replace('"row": #Row#','"row": 58');
                                        MarketingString =  MarketingString.remove(Sales.Sales_Date_Delete__c);
                                      // Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 1','"column": 19').replace('listselector_'+Grp,'listselector_'+Grp).replace('"row": 10','"row": 58');
                                      // MarketingString =  MarketingString.remove(Sales.Sales_Date_Delete__c);
                                      //  Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 3','"colspan": 2').replace('"column": 19','"column": 6').replace('listselector_'+Grp,'listselector_'+Grp).replace('"row": 58','"row": 4');
                                      //  MarketingString =  MarketingString.remove(Sales.Sales_Date_Delete__c);
                                        Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 3','"colspan": #Colspan#').replace('"column": 19','"column": #Column#').replace('listselector_'+Grp,'#listselector#').replace('"row": 58','"row": #Row#');
                                    }
                                    
                                    if(Grp == '35'){
                                        Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": #Colspan#','"colspan": 3').replace('"column": #Column#','"column": 2').replace('#listselector#','listselector_'+Grp).replace('"row": #Row#','"row": 58');
                                        MarketingString =  MarketingString.remove(Sales.Sales_Date_Delete__c);
                                      // Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 3','"colspan": 2').replace('"column": 2','"column": 0').replace('listselector_'+Grp,'listselector_'+Grp).replace('"row": 58','"row": 4');
                                      // MarketingString =  MarketingString.remove(Sales.Sales_Date_Delete__c);
                                      // Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 2','"colspan": 1').replace('"column": 0','"column": 0').replace('listselector_'+Grp,'listselector_'+Grp).replace('"row": 4','"row": 9');
                                      // MarketingString =  MarketingString.remove(Sales.Sales_Date_Delete__c);
                                        Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 3','"colspan": #Colspan#').replace('"column": 2','"column": #Column#').replace('listselector_'+Grp,'#listselector#').replace('"row": 58','"row": #Row#');                                    
                                    }  
                                }
                            }
                            
                        }
                    }
                    
                    if(Datelabel.size() > 0){                   
                        integer i = 1;
                        integer j = 3;
                        for(String Datelab : DateLabel){
                            integer k = i-1;
                            MarketingString =  MarketingString.replace('#'+Numbers+'DateLabel'+ i +'#',Datelab).replace('#'+Numbers+'DateAPI'+ i+'#',DateApi[k]);  
                            i = i+1;
                        }
                        String[] StringList = new String[]{'Quarter','Month','Week','Day'}; 
                        for(Integer L=i;J >= L;L++){
                            integer k = L;
                           
                            for(String St : StringList){
                                
                                if(K == 3){
                                    String ChartDate = 'q = filter q by {{row(Sales__KPI_'+Numbers+'_Date_'+k+'.selection,[0],[\\\\\\"min\\\\\\",\\\\\\"max\\\\\\"]).asDateRange(\\\\\\"date(\'#'+Numbers+'DateAPI'+k+'#_Year\',\'#'+Numbers+'DateAPI'+k+'#_Month\',\'#'+Numbers+'DateAPI'+k+'#_Day\')\\\\\\")}};';
                                    String ChartDate1 = 'q = filter q by {{row(Sales__KPI_'+Numbers+'_Date_'+k+'.selection, [0],[\\\\\\"min\\\\\\",\\\\\\"max\\\\\\"]).asDateRange(\\\\\\"date(\'#'+Numbers+'DateAPI'+k+'#_Year\',\'#'+Numbers+'DateAPI'+k+'#_Month\',\'#'+Numbers+'DateAPI'+k+'#_Day\')\\\\\\")}};';
                                    MarketingString = MarketingString.replace(ChartDate,'').replace(ChartDate1,'');
                                    if(St == 'Day'){
                                        Sales.Sales_insight_Day_Delete__c = Sales.Sales_insight_Day_Delete__c.replace('DateLabel',Numbers+'DateLabel'+k).replace('#MonthDay#',St).replace('DateAPI',Numbers+'DateAPI'+k);
                                        MarketingString =  MarketingString.replace(Sales.Sales_insight_Day_Delete__c,'');   
                                        Sales.Sales_insight_Day_Delete__c = Sales.Sales_insight_Day_Delete__c.replace(Numbers+'DateLabel'+k,'DateLabel').replace(Numbers+'DateAPI'+k,'DateAPI').replace(St,'#MonthDay#');
                                    }
                                     else{
                                        Sales.Date_label_Delete__c = Sales.Date_label_Delete__c.replace('DateLabel',Numbers+'DateLabel'+k).replace('DateAPI',Numbers+'DateAPI'+k).replace('#MonthDay#',St);
                                        MarketingString =  MarketingString.replace(Sales.Date_label_Delete__c,'');
                                        Sales.Date_label_Delete__c = Sales.Date_label_Delete__c.replace(Numbers+'DateLabel'+k,'DateLabel').replace(Numbers+'DateAPI'+k,'DateAPI').replace(St,'#MonthDay#'); 
                                     }
                                     String Strs = '"step": "Sales__KPI_'+Numbers+'_Date_'+k+'",';
									  String Strss = '"title": "#'+Numbers+'DateLabel'+k+'#"';
									  MarketingString =  MarketingString.replace(Strs,'').replace(Strss,'');
									   Sales.Delete_All_Dates__c = Sales.Delete_All_Dates__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+k).replace('#Truewfalse#','false').replace('#datasetId#','#'+Numbers+'datasetId#').replace('#datasetAlias#','#'+Numbers+'datasetAlias#').replace('#DateAPI#','#'+Numbers+'DateAPI'+k+'#');
                            				MarketingString =  MarketingString.replace(Sales.Delete_All_Dates__c,'');
                            			Sales.Delete_All_Dates__c = Sales.Delete_All_Dates__c.replace('#'+Numbers+'DateAPI'+k+'#','#DateAPI#').replace('Sales__KPI_'+Numbers+'_Date_'+k,'SalesKPIDate').replace('#'+Numbers+'datasetAlias#','#datasetAlias#').replace('#'+Numbers+'datasetId#','#datasetId#').replace('false','#Truewfalse#'); 
                                     if(Numbers == '2'){
                                     	MarketingString =  MarketingString.replace(Sales.Sales_Insight_Delete3__c,'');
                                     }
                                     //MarketingString =  MarketingString.replace('#'+Numbers+'DateLabel'+ k +'#',DateLabel[0]).replace('#'+Numbers+'DateAPI'+ k+'#',DateApi[0]);
                                }
                                else{
                                	String ChartDate = 'q = filter q by {{row(Sales__KPI_'+Numbers+'_Date_'+k+'.selection,[0],[\\\\\\"min\\\\\\",\\\\\\"max\\\\\\"]).asDateRange(\\\\\\"date(\'#'+Numbers+'DateAPI'+k+'#_Year\',\'#'+Numbers+'DateAPI'+k+'#_Month\',\'#'+Numbers+'DateAPI'+k+'#_Day\')\\\\\\")}};';
                                	String ChartDate1 = 'q = filter q by {{row(Sales__KPI_'+Numbers+'_Date_'+k+'.selection, [0],[\\\\\\"min\\\\\\",\\\\\\"max\\\\\\"]).asDateRange(\\\\\\"date(\'#'+Numbers+'DateAPI'+k+'#_Year\',\'#'+Numbers+'DateAPI'+k+'#_Month\',\'#'+Numbers+'DateAPI'+k+'#_Day\')\\\\\\")}};';
                                    MarketingString = MarketingString.replace(ChartDate,'').replace(ChartDate1,'');
                                     if(St == 'Day'){
                                        Sales.Sales_insight_Day_Delete__c = Sales.Sales_insight_Day_Delete__c.replace('DateLabel',Numbers+'DateLabel'+k).replace('}"','}",').replace('#MonthDay#',St).replace('DateAPI',Numbers+'DateAPI'+k);
                                        MarketingString =  MarketingString.replace(Sales.Sales_insight_Day_Delete__c,'');   
                                        Sales.Sales_insight_Day_Delete__c = Sales.Sales_insight_Day_Delete__c.replace(Numbers+'DateLabel'+k,'DateLabel').replace('}",','}"').replace(Numbers+'DateAPI'+k,'DateAPI').replace(St,'#MonthDay#');
                                        
                                    }
                                    else{
                                         Sales.Date_label_Delete__c = Sales.Date_label_Delete__c.replace('DateLabel',Numbers+'DateLabel'+k).replace('DateAPI',Numbers+'DateAPI'+k).replace('#MonthDay#',St);
                                         MarketingString =  MarketingString.replace(Sales.Date_label_Delete__c,'');
                                         Sales.Date_label_Delete__c = Sales.Date_label_Delete__c.replace(Numbers+'DateLabel'+k,'DateLabel').replace(Numbers+'DateAPI'+k,'DateAPI').replace(St,'#MonthDay#');    
                                    } 
                                    String Strs = '"step": "Sales__KPI_'+Numbers+'_Date_'+k+'",';
									  String Strss = '"title": "#'+Numbers+'DateLabel'+k+'#"';
									  MarketingString =  MarketingString.replace(Strs,'').replace(Strss,''); 
									   Sales.Delete_All_Dates__c = Sales.Delete_All_Dates__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+k).replace('#Truewfalse#','false').replace('#datasetId#','#'+Numbers+'datasetId#').replace('#datasetAlias#','#'+Numbers+'datasetAlias#').replace('#DateAPI#','#'+Numbers+'DateAPI'+k+'#');
                            				MarketingString =  MarketingString.replace(Sales.Delete_All_Dates__c,'');
                            			Sales.Delete_All_Dates__c = Sales.Delete_All_Dates__c.replace('#'+Numbers+'DateAPI'+k+'#','#DateAPI#').replace('Sales__KPI_'+Numbers+'_Date_'+k,'SalesKPIDate').replace('#'+Numbers+'datasetAlias#','#datasetAlias#').replace('#'+Numbers+'datasetId#','#datasetId#').replace('false','#Truewfalse#'); 
                                     if(Numbers == '2' && K==2){
                                     	MarketingString =  MarketingString.replace(Sales.Sales_Insight_Delete2__c,'');
                                     }
                                     //MarketingString =  MarketingString.replace('#'+Numbers+'DateLabel'+ k +'#',DateLabel[0]).replace('#'+Numbers+'DateAPI'+ k+'#',DateApi[0]);      
                                }
                            }
                        }
                    }
                    else{                   
                        Sales.Dates_Delete__c = Sales.Dates_Delete__c.replace('#Timeline#','Static_Sales__KPI_'+Numbers+'_Timeline').replace('DateLabel',Numbers+'DateLabel').replace('DateAPI',Numbers+'DateAPI');
                        MarketingString =  MarketingString.replace(Sales.Dates_Delete__c,'');
                        Sales.Dates_Delete__c = Sales.Dates_Delete__c.replace('Static_Sales__KPI_'+Numbers+'_Timeline','#Timeline#').replace(Numbers+'DateLabel','DateLabel').replace(Numbers+'DateAPI','DateAPI');
                        if(Numbers == '5'){
                            Sales.Date_Selector__c = Sales.Date_Selector__c.replace('#listselector#','listselector_16').replace('#Timeline#"','Static_Sales__KPI_'+Numbers+'_Timeline');
                            MarketingString =  MarketingString.replace(Sales.Dates_Delete__c,'');
                            Sales.Date_Selector__c = Sales.Date_Selector__c.replace('listselector_16','#listselector#').replace('Static_Sales__KPI_'+Numbers+'_Timeline','#Timeline#'); 
                            
                            Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": #Colspan#','"colspan": 3').replace('"column": #Column#','"column": 16').replace('#listselector#','listselector_16').replace('"row": #Row#','"row": 58');
                            MarketingString =  MarketingString.remove(Sales.Sales_Date_Delete__c);
                            
                          // Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 1','"colspan": 2').replace('"column": 0','"column": 4').replace('"row": 10','"row": 4');
                          // MarketingString =  MarketingString.remove(Sales.Sales_Date_Delete__c);
                          //  Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 2','"colspan": 3').replace('"column": 4','"column": 16').replace('"row": 4','"row": 58');
                          //  MarketingString =  MarketingString.remove(Sales.Sales_Date_Delete__c);
                            Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 3','"colspan": #Colspan#').replace('"column": 16','"column": #Column#').replace('listselector_16','#listselector#').replace('"row": 58','"row": #Row#');
                            
                        }                       
                    }
                    if(measureLabel.size() > 0){               
                      
                        integer i = 1;
                        integer j = 5;
                        for(String Dim : measureLabel){
                            integer k = i-1;
                            String Str = '\\"#'+Numbers+'CompactMeasureAPI'+ i+'#\\"';
                            MarketingString =  MarketingString.replace('#'+Numbers+'MeasureLabel'+ i+'#',Dim).replace('#'+Numbers+'ExpressionMeasureAPI'+ i+'#',MeasureAPI[k]).replace('#'+Numbers+'AliasMeasureAPI'+ i+'#',AliasMeasureAPI[k]).replace(Str,CompactMeasureAPI[k]);  
                            i = i+1;
                        }
                        for(Integer L=i;J >= L;L++){
                            integer k = L;
                            if(K == 5){
                                Sales.Sales_Insight_Measure_Delete__c = Sales.Sales_Insight_Measure_Delete__c.replace('MeasureLabel','#'+Numbers+'MeasureLabel'+k+'#').replace('}",','}"').replace('ExpressionMeasureAPI',Numbers+'ExpressionMeasureAPI'+k).replace('AliasMeasureAPI',Numbers+'AliasMeasureAPI'+k).replace('CompactMeasureAPI',Numbers+'CompactMeasureAPI'+k);
                                MarketingString =  MarketingString.replace(Sales.Sales_Insight_Measure_Delete__c,'');
                                Sales.Sales_Insight_Measure_Delete__c = Sales.Sales_Insight_Measure_Delete__c.replace('#'+Numbers+'MeasureLabel'+k+'#','MeasureLabel').replace('}"','}",').replace(Numbers+'ExpressionMeasureAPI'+k,'ExpressionMeasureAPI').replace(Numbers+'AliasMeasureAPI'+k,'AliasMeasureAPI').replace(Numbers+'CompactMeasureAPI'+k,'CompactMeasureAPI');
                                String measure = '\\"label_'+k+ '\\":\\"#'+Numbers+'MeasureLabel'+k+'#\\"';
                                String alias = '\\"alias_'+k+ '\\":\\"#'+ Numbers+'AliasMeasureAPI'+k +'#\\",';
                                String expression = '\\"expression_'+k+ '\\":\\"#'+Numbers+'ExpressionMeasureAPI'+k+'#\\",';
                                String Compact = '\\"cf_'+k+ '\\":\\"#'+Numbers+'CompactMeasureAPI'+k +'#\\",';
                                
                                MarketingString =  MarketingString.replace(measure,'#TestCode1#').replace(expression,'').replace(Compact,'').replace(alias,'').replace(',#TestCode1#','').replace('#TestCode1#',''); 
                                
                                 
                            }
                            else{
                                String measure;
                                String alias = '\\"alias_'+k+ '\\":\\"#'+ Numbers+'AliasMeasureAPI'+k +'#\\",'; 
    
                                    measure = '\\"label_'+k+ '\\":\\"#'+Numbers+'MeasureLabel'+k+'#\\",';
                                    MarketingString =  MarketingString.replace(measure,'');  
                                
                                String expression = '\\"expression_'+k+ '\\":\\"#'+Numbers+'ExpressionMeasureAPI'+k+'#\\",';
                                String Compact = '\\"cf_'+k+ '\\":\\"#'+Numbers+'CompactMeasureAPI'+k +'#\\",';
                                MarketingString =  MarketingString.replace(alias,'').replace(Compact,'').replace(expression,'');
                                String Sales5 = ',column(Static_Sales_KPI_'+Numbers+'.selection,[\\\\\\"cf_'+k+'\\\\\\"])';
                                String Sales2;
                                if(Numbers== '4'){
                                  Sales2 = ',{{row(Static_Sales_KPI_'+Numbers+'.selection,[],[\\\\\\"expression_'+k+'\\\\\\",\\\\\\"alias_'+k+'\\\\\\"]).asProjection()}}';
                                }
                                else{
                                  Sales2 = ',{{row(Static_Sales_KPI_'+Numbers+'.selection,[],[\\\\\\"expression_'+k+'\\\\\\",\\\\\\"alias_'+k+'\\\\\\"]).asProjection()}}';
                                }
                                MarketingString =  MarketingString.replace(Sales2,'').replace(Sales5,'');
                                Sales.Sales_Insight_Measure_Delete__c = Sales.Sales_Insight_Measure_Delete__c.replace('MeasureLabel','#'+Numbers+'MeasureLabel'+k+'#').replace('ExpressionMeasureAPI',Numbers+'ExpressionMeasureAPI'+k).replace('AliasMeasureAPI',Numbers+'AliasMeasureAPI'+k).replace('CompactMeasureAPI',Numbers+'CompactMeasureAPI'+k);
                                MarketingString =  MarketingString.replace(Sales.Sales_Insight_Measure_Delete__c,'');
                                Sales.Sales_Insight_Measure_Delete__c = Sales.Sales_Insight_Measure_Delete__c.replace('#'+Numbers+'MeasureLabel'+k+'#','MeasureLabel').replace(Numbers+'ExpressionMeasureAPI'+k,'ExpressionMeasureAPI').replace(Numbers+'AliasMeasureAPI'+k,'AliasMeasureAPI').replace(Numbers+'CompactMeasureAPI'+k,'CompactMeasureAPI');                               
                            
                            }
                            String[] StNUmbers;
                                if(Numbers == '5'){
                                	StNUmbers = new String[]{'number_11','number_12','number_13','number_14'};
                                	 /*   if(K==2){
	                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_12').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 6').replace('"row": #rows#','"row": 56');
											MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');    
											Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 6','"column": #column#').replace('number_12','#charts#').replace('"row": 56','"row": #rows#');
	                                	} 
	                                    if(K==1){
	                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_11').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 56');
											MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');    
											Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('number_11','#charts#').replace('"row": 56','"row": #rows#');
	                                	} 
	                                    if(K==3){
	                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_13').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 12').replace('"row": #rows#','"row": 56');
											MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');    
											Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 12','"column": #column#').replace('number_13','#charts#').replace('"row": 56','"row": #rows#');
	                                	}    
	                                    if(K==4){
	                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_14').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 18').replace('"row": #rows#','"row": 56');
											MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');    
											Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 18','"column": #column#').replace('number_14','#charts#').replace('"row": 56','"row": #rows#');
	                                	}
	                                	*/
	                                	if(k<=4){
	                                	String[] Fields = new String[]{'#5AliasMeasureAPI1#','#5AliasMeasureAPI2#','#5AliasMeasureAPI3#','#5AliasMeasureAPI4#'};
                                            integer ll= 0;        
                                            for(String St : StNUmbers){                                     
                                            	Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Numbers#',St);
                                            	if(St == ''){
                                            		Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"exploreLink": #falses#','"exploreLink": false').replace('"compact": #trues#','"compact": true');
                                            	}
                                            	else{
                                            		Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"exploreLink": #falses#','"exploreLink": true').replace('"compact": #trues#','"compact": true');
                                            	}
                                            	Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Fields#',Fields[ll]).replace('#SalesKPIs#','Sales_KPI_5');
                                            	String Str7 = '"'+St+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                            //	System.debug('Str7*************'+Str7);
                                            	MarketingString =  MarketingString.replace(Sales.Sales_KPI_Delete__c,Str7);
                                            	Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace(St,'#Numbers#').replace(Fields[ll],'#Fields#').replace('Sales_KPI_5','#SalesKPIs#');
                                            	Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"compact": true','"compact": #trues#').replace('"exploreLink": true','"exploreLink": #falses#');
                                            	ll++;
                                            }
	                                	}
                                }
                                if(Numbers == '4'){
                                	StNUmbers = new String[]{'number_10','number_20','number_21','number_22'};
                                	 String[] Fields = new String[]{'#4AliasMeasureAPI1#','#4AliasMeasureAPI2#','#4AliasMeasureAPI3#','#4AliasMeasureAPI4#'};     
                                     /*   if(K==2){
	                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_20').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 6').replace('"row": #rows#','"row": 43');
											MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');    
											Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 6','"column": #column#').replace('number_20','#charts#').replace('"row": 43','"row": #rows#');
	                                	} 
	                                    if(K==1){
	                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_10').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 43');
											MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');    
											Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('number_10','#charts#').replace('"row": 43','"row": #rows#');
	                                	} 
	                                    if(K==3){
	                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_21').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 12').replace('"row": #rows#','"row": 43');
											MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');    
											Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 12','"column": #column#').replace('number_21','#charts#').replace('"row": 43','"row": #rows#');
	                                	}    
	                                    if(K==4){
	                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_22').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 18').replace('"row": #rows#','"row": 43');
											MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');    
											Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 18','"column": #column#').replace('number_22','#charts#').replace('"row": 43','"row": #rows#');
	                                	}  */
	                                	
	                                	if(k<=4){
	                                	 integer ll= 0;
                                        for(String St : StNUmbers){                                     
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Numbers#',St);
                                        
                                            Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"exploreLink": #falses#','"exploreLink": true').replace('"compact": #trues#','"compact": true');
                                     
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Fields#',Fields[ll]).replace('#SalesKPIs#','Sales_KPI_4');
                                        String StrNum48 = '"'+St+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.Sales_KPI_Delete__c,StrNum48);
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace(St,'#Numbers#').replace(Fields[ll],'#Fields#').replace('Sales_KPI_4','#SalesKPIs#');
                                        if(St == ''){
                                            Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"compact": false','"compact": #trues#').replace('"exploreLink": true','"exploreLink": #falses#');
                                        }
                                        else{
                                            Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"compact": true','"compact": #trues#').replace('"exploreLink": true','"exploreLink": #falses#');
                                        }
                                        ll++;
                                        } 
	                                	}
                                }
                                if(Numbers == '3'){
                                	StNUmbers = new String[]{'number_19','number_9','number_8','number_7'};
                                	String[] Fields = new String[]{'#3AliasMeasureAPI4#','#3AliasMeasureAPI3#','#3AliasMeasureAPI2#','#3AliasMeasureAPI1#'};
                                       
                                /*	if(K==2){ 
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_8').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 6').replace('"row": #rows#','"row": 30');
										MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');    
										Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 6','"column": #column#').replace('number_8','#charts#').replace('"row": 30','"row": #rows#');
                                	} 
                                    if(K==1){
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_7').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 30');
										MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');    
										Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('number_7','#charts#').replace('"row": 30','"row": #rows#');
                                	} 
                                    if(K==3){
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_9').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 12').replace('"row": #rows#','"row": 30');
										MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');    
										Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 12','"column": #column#').replace('number_9','#charts#').replace('"row": 30','"row": #rows#');
                                	}    
                                    if(K==4){
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_19').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 18').replace('"row": #rows#','"row": 30');
										MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');    
										Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 18','"column": #column#').replace('number_19','#charts#').replace('"row": 30','"row": #rows#');
                                	}  */
                                	if(k<=4){
                                	 integer ll= 0;
                                        for(String St : StNUmbers){                                     
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Numbers#',St);
                                            Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"exploreLink": #falses#','"exploreLink": true').replace('"compact": #trues#','"compact": true');
                                       
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Fields#',Fields[ll]).replace('#SalesKPIs#','Sales_KPI_3');
                                        String StrNumst = '"'+St+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.Sales_KPI_Delete__c,StrNumst);
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace(St,'#Numbers#').replace(Fields[ll],'#Fields#').replace('Sales_KPI_3','#SalesKPIs#');
                                      
                                            Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"compact": true','"compact": #trues#').replace('"exploreLink": true','"exploreLink": #falses#');
                                       
                                        ll++;
                                        } 
                                	}
                                }
                                if(Numbers == '2'){
                                	StNUmbers = new String[]{'number_4','number_5','number_6','number_18'};
                                /*	if(K==2){
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_5').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 6').replace('"row": #rows#','"row": 17');
										MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');    
										Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 6','"column": #column#').replace('number_5','#charts#').replace('"row": 17','"row": #rows#');
                                	} 
                                    if(K==1){
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_4').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 17');
										MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');    
										Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('number_4','#charts#').replace('"row": 17','"row": #rows#');
                                	} 
                                    if(K==3){
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_6').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 12').replace('"row": #rows#','"row": 17');
										MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');    
										Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 12','"column": #column#').replace('number_6','#charts#').replace('"row": 17','"row": #rows#');
                                	}    
                                    if(K==4){
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_18').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 18').replace('"row": #rows#','"row": 17');
										MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');    
										Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 18','"column": #column#').replace('number_18','#charts#').replace('"row": 17','"row": #rows#');
                                	} */
                                	
                                //	system.debug('Sales.Sales_KPI_Delete__ctwo************'+Sales.Sales_KPI_Delete__c);
                                	if(k<=4){
                                    integer ll= 0;
                                     String[] Fields = new String[]{'#2AliasMeasureAPI1#','#2AliasMeasureAPI2#','#2AliasMeasureAPI3#','#2AliasMeasureAPI4#'};
                                                                           
                                    for(String St : StNUmbers){                                     
                                    	Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Numbers#',St);
                                    	if(St == 'number_28'){                                           
                                    		Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"exploreLink": #falses#','"exploreLink": true').replace('"compact": #trues#','"compact": false'); 
                                    	}
                                    	else{
                                    		Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"exploreLink": #falses#','"exploreLink": true').replace('"compact": #trues#','"compact": true');
                                    	}
                                    	Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Fields#',Fields[ll]).replace('#SalesKPIs#','Sales_KPI_2');
                                    	String Strtnum44 = '"'+St+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                    
                                    	MarketingString =  MarketingString.replace(Sales.Sales_KPI_Delete__c,Strtnum44);
                                    	Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace(St,'#Numbers#').replace(Fields[ll],'#Fields#').replace('Sales_KPI_2','#SalesKPIs#');
                                    	if(St == 'number_28'){
                                    		Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"compact": false','"compact": #trues#').replace('"exploreLink": true','"exploreLink": #falses#');
                                    	}
                                    	else{
                                    		Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"compact": true','"compact": #trues#').replace('"exploreLink": true','"exploreLink": #falses#');
                                    	}
                                    	ll++;
                                    }
                                	}
                                //	system.debug('Sales.Sales_KPI_Delete__cssssstwo************'+Sales.Sales_KPI_Delete__c);
                                	
                                	
                                }
                                if(Numbers == '1'){
                                	StNUmbers = new String[]{'number_16','number_17','number_24','number_26'};
                                /*	if(K==2){
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_17').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 6').replace('"row": #rows#','"row": 4');
										MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');    
										Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 6','"column": #column#').replace('number_17','#charts#').replace('"row": 4','"row": #rows#');
                                	} 
                                    if(K==1){
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_24').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 4');
										MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');    
										Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('number_24','#charts#').replace('"row": 4','"row": #rows#');
                                	} 
                                    if(K==3){
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_24').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 12').replace('"row": #rows#','"row": 4');
										MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');    
										Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 12','"column": #column#').replace('number_24','#charts#').replace('"row": 4','"row": #rows#');
                                	}    
                                    if(K==4){
                                        Sales.Number_Delete2__c = Sales.Number_Delete2__c.replace('#charts#','number_26').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 18').replace('"row": #rows#','"row": 4');
										MarketingString =  MarketingString.replace(Sales.Number_Delete2__c,'');    
										Sales.Number_Delete2__c = Sales.Number_Delete2__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 18','"column": #column#').replace('number_26','#charts#').replace('"row": 4','"row": #rows#');
                                	} */
                                	
                                	    
                             //  system.debug('Sales.Sales_KPI_Delete__c************'+Sales.Sales_KPI_Delete__c);
                                String[] Fields = new String[]{'#1AliasMeasureAPI1#','#1AliasMeasureAPI2#','#1AliasMeasureAPI3#','#1AliasMeasureAPI4#'}; 
	                             integer Z=0;
	                             if(StNUmbers != null){
	                             for(String St : StNUmbers){ 
	                                Sales.Sales_KPI_Delete__c = '"#Numbers#": { "parameters": { "compact": #trues#, "exploreLink": #falses#, "measureField": "#Fields#", "numberColor": "#335779", "numberSize": 32, "step": "#SalesKPIs#", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
									Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Numbers#',St).replace('#Fields#',Fields[Z]).replace('#SalesKPIs#','Sales_KPI_1').replace('"exploreLink": #falses#','"exploreLink": true').replace('"compact": #trues#','"compact": true');
									String Strtnum44 = '"'+St+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
	
									MarketingString =  MarketingString.replace(Sales.Sales_KPI_Delete__c,Strtnum44);
								 //   system.debug('MarketingString************'+MarketingString);	
									Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace(St,'#Numbers#').replace(Fields[Z],'#Fields#').replace('Sales_KPI_1','#SalesKPIs#').replace('"compact": true','"compact": #trues#').replace('"exploreLink": true','"exploreLink": #falses#');
							         Z = Z+1;
							     }
	                             }
	                            // system.debug('Sales.Sales_KPI_Delete__csssss************'+Sales.Sales_KPI_Delete__c);
	                             }
                        }   
                    }
                    else{  
                    
                    Sales.Measure_List_Selector__c = Sales.Measure_List_Selector__c.replace('MeasureLabel1',Numbers+'MeasureLabel1').replace('ExpressionMeasureAPI1',Numbers+'ExpressionMeasureAPI1').replace('AliasMeasureAPI1',Numbers+'AliasMeasureAPI1').replace('CompactMeasureAPI1',Numbers+'CompactMeasureAPI1').replace('MeasureLabel2',Numbers+'MeasureLabel2').replace('ExpressionMeasureAPI2',Numbers+'ExpressionMeasureAPI2').replace('AliasMeasureAPI2',Numbers+'AliasMeasureAPI2').replace('CompactMeasureAPI2',Numbers+'CompactMeasureAPI2').replace('MeasureLabel3',Numbers+'MeasureLabel3').replace('ExpressionMeasureAPI3',Numbers+'ExpressionMeasureAPI3').replace('AliasMeasureAPI3',Numbers+'AliasMeasureAPI3').replace('CompactMeasureAPI3',Numbers+'CompactMeasureAPI3').replace('MeasureLabel4',Numbers+'MeasureLabel4').replace('ExpressionMeasureAPI4',Numbers+'ExpressionMeasureAPI4').replace('AliasMeasureAPI4',Numbers+'AliasMeasureAPI4').replace('CompactMeasureAPI4',Numbers+'CompactMeasureAPI4').replace('MeasureLabel5',Numbers+'MeasureLabel5').replace('ExpressionMeasureAPI5',Numbers+'ExpressionMeasureAPI5').replace('AliasMeasureAPI5',Numbers+'AliasMeasureAPI5').replace('CompactMeasureAPI5',Numbers+'CompactMeasureAPI5');                    
                    MarketingString =  MarketingString.replace(Sales.Measure_List_Selector__c,'');
                    Sales.Measure_List_Selector__c = Sales.Measure_List_Selector__c.replace(Numbers+'MeasureLabel1','MeasureLabel1').replace(Numbers+'ExpressionMeasureAPI1','ExpressionMeasureAPI1').replace(Numbers+'AliasMeasureAPI1','AliasMeasureAPI1').replace(Numbers+'CompactMeasureAPI1','CompactMeasureAPI1').replace(Numbers+'MeasureLabel2','MeasureLabel2').replace(Numbers+'ExpressionMeasureAPI2','ExpressionMeasureAPI2').replace(Numbers+'AliasMeasureAPI2','AliasMeasureAPI2').replace(Numbers+'CompactMeasureAPI2','CompactMeasureAPI2').replace(Numbers+'MeasureLabel3','MeasureLabel3').replace(Numbers+'ExpressionMeasureAPI3','ExpressionMeasureAPI3').replace(Numbers+'AliasMeasureAPI3','AliasMeasureAPI3').replace(Numbers+'CompactMeasureAPI3','CompactMeasureAPI3').replace(Numbers+'MeasureLabel4','MeasureLabel4').replace(Numbers+'ExpressionMeasureAPI4','ExpressionMeasureAPI4').replace(Numbers+'AliasMeasureAPI4','AliasMeasureAPI4').replace(Numbers+'CompactMeasureAPI4','CompactMeasureAPI4').replace(Numbers+'MeasureLabel5','MeasureLabel5').replace(Numbers+'ExpressionMeasureAPI5','ExpressionMeasureAPI5').replace(Numbers+'AliasMeasureAPI5','AliasMeasureAPI5').replace(Numbers+'CompactMeasureAPI5','CompactMeasureAPI5');
                    
                        if(Numbers == '5'){
                            Sales.Measures_Delete__c = Sales.Measures_Delete__c.replace('#listselector#','listselector_23').replace('#Measure#','Static_Sales_Measure_5');
                            MarketingString =  MarketingString.replace(Sales.Measures_Delete__c,'');
                            Sales.Measures_Delete__c = Sales.Measures_Delete__c.replace('listselector_23','#listselector#').replace('Static_Sales_Measure_5','#Measure#');
                        
                            Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": #Colspan#','"colspan": 3').replace('"column": #Column#','"column": 18').replace('#listselector#','listselector_23').replace('"row": #Row#','"row": 55');
                            MarketingString =  MarketingString.remove(Sales.Sales_Date_Delete__c);
                          // Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 1','"colspan": 1').replace('"column": 1','"column": 6').replace('"row": 2','"row": 1');
                          //  MarketingString =  MarketingString.remove(Sales.Sales_Date_Delete__c);
                          //  Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 6','"column": 18').replace('"row": 1','"row": 55');
                          //  MarketingString =  MarketingString.remove(Sales.Sales_Date_Delete__c);
                            Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 3','"colspan": #Colspan#').replace('"column": 18','"column": #Column#').replace('listselector_23','#listselector#').replace('"row": 55','"row": #Row#');                        
                        }
                    
                    }
                    if(DatasetRec.Filter_Logics__c != null){ 
                        String[] FilterList = DatasetRec.Filter_Logics__c.split(';');
                         String[] Filtervalues = DatasetRec.FilterName__c.split(';');
                        if(FilterList.size() > 0){
                            integer i = 1;
                            integer M = 0;
                            integer j = 5;
                            for(String Dim : FilterList){
                                integer k = i-1;
                                MarketingString =  MarketingString.replace('#'+Numbers+'queryFiltersLabel'+ i+'#',Filtervalues[M]).replace('#'+Numbers+'queryFiltersString'+ i+'#',Dim);     
                                i = i+1;
                                M = M+1;
                            }
                            for(Integer L=i;J >= L;L++){
                                integer k = L;
                                if(K == 5){   
                                    Sales.Sales_Insight_Filter_Delete__c = Sales.Sales_Insight_Filter_Delete__c.replace('queryFiltersLabel','#'+Numbers+'queryFiltersLabel'+k+'#').replace('}",','}"').replace('queryFiltersString','#'+Numbers+'queryFiltersString'+k+'#');
                                    MarketingString =  MarketingString.replace(Sales.Sales_Insight_Filter_Delete__c,'');
                                    Sales.Sales_Insight_Filter_Delete__c = Sales.Sales_Insight_Filter_Delete__c.replace('#'+Numbers+'queryFiltersLabel'+k+'#','queryFiltersLabel').replace('}"','}",').replace('#'+Numbers+'queryFiltersString'+k+'#','queryFiltersString');
                                }
                                else{
                                    Sales.Sales_Insight_Filter_Delete__c = Sales.Sales_Insight_Filter_Delete__c.replace('queryFiltersLabel','#'+Numbers+'queryFiltersLabel'+k+'#').replace('queryFiltersString','#'+Numbers+'queryFiltersString'+k+'#');
                                    MarketingString =  MarketingString.replace(Sales.Sales_Insight_Filter_Delete__c,'');
                                    Sales.Sales_Insight_Filter_Delete__c = Sales.Sales_Insight_Filter_Delete__c.replace('#'+Numbers+'queryFiltersLabel'+k+'#','queryFiltersLabel').replace('#'+Numbers+'queryFiltersString'+k+'#','queryFiltersString');
                                }
                            } 
                        }
                            
                    }
                    else{
                    	if(DimensionApi != Null){
                    		if(DimensionApi.size() > 0)
                        	MarketingString =  MarketingString.replace('#'+Numbers+'queryFiltersLabel1#','All').replace('#'+Numbers+'queryFiltersString1'+'#','\''+DimensionApi[0]+'\' in all');
                    	}
                        integer j = 5;
                        for(Integer L=2;J >= L;L++){
                                integer k = L;
                                if(K == 5){   
                                    Sales.Sales_Insight_Filter_Delete__c = Sales.Sales_Insight_Filter_Delete__c.replace('queryFiltersLabel','#'+Numbers+'queryFiltersLabel'+k+'#').replace('}",','}"').replace('queryFiltersString','#'+Numbers+'queryFiltersString'+k+'#');
                                    MarketingString =  MarketingString.replace(Sales.Sales_Insight_Filter_Delete__c,'');
                                    Sales.Sales_Insight_Filter_Delete__c = Sales.Sales_Insight_Filter_Delete__c.replace('#'+Numbers+'queryFiltersLabel'+k+'#','queryFiltersLabel').replace('}"','}",').replace('#'+Numbers+'queryFiltersString'+k+'#','queryFiltersString');
                                }
                                else{
                                    Sales.Sales_Insight_Filter_Delete__c = Sales.Sales_Insight_Filter_Delete__c.replace('queryFiltersLabel','#'+Numbers+'queryFiltersLabel'+k+'#').replace('queryFiltersString','#'+Numbers+'queryFiltersString'+k+'#');
                                    MarketingString =  MarketingString.replace(Sales.Sales_Insight_Filter_Delete__c,'');
                                    Sales.Sales_Insight_Filter_Delete__c = Sales.Sales_Insight_Filter_Delete__c.replace('#'+Numbers+'queryFiltersLabel'+k+'#','queryFiltersLabel').replace('#'+Numbers+'queryFiltersString'+k+'#','queryFiltersString');
                                }
                            } 	
                    }                       
                }
        }
                else{
                        integer Numbers = RowNumberlist-10;
                        
                        for(integer i=1;i<=3;i++){
                            Sales.Delete_All_Group__c = Sales.Delete_All_Group__c.replace('#StaticSalesGrouping#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#GroupingLabel','#'+Numbers+'GroupingLabel').replace('#GroupingAPI','#'+Numbers+'GroupingAPI');
                            MarketingString =  MarketingString.replace(Sales.Delete_All_Group__c,'');
                            Sales.Delete_All_Group__c = Sales.Delete_All_Group__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSalesGrouping#').replace('#'+Numbers+'GroupingLabel','#GroupingLabel').replace('#'+Numbers+'GroupingAPI','#GroupingAPI');
                            
                            Sales.Delete_All_Dates__c = Sales.Delete_All_Dates__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#Truewfalse#','false'); 
                        
                            Sales.Delete_All_Dates__c = Sales.Delete_All_Dates__c.replace('#datasetId#','#'+Numbers+'datasetId#').replace('#datasetAlias#','#'+Numbers+'datasetAlias#').replace('#DateAPI#','#'+Numbers+'DateAPI'+i+'#');
                            MarketingString =  MarketingString.replace(Sales.Delete_All_Dates__c,'');
                            Sales.Delete_All_Dates__c = Sales.Delete_All_Dates__c.replace('#'+Numbers+'DateAPI'+i+'#','#DateAPI#').replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('#'+Numbers+'datasetAlias#','#datasetAlias#').replace('#'+Numbers+'datasetId#','#datasetId#').replace('false','#Truewfalse#'); 
                    
                            if(Numbers == 2 && i == 1){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#listselectors#','listselector_28');
                                String Strlst28 = '"listselector_28": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,Strlst28);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSales#').replace('listselector_28','#listselectors#');
                                
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#datasetselector#','dateselector_4').replace('#Dates#','#2DateLabel1#');
                                String Strds4 = '"dateselector_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_All_dateselectors__c,Strds4);
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('dateselector_4','#datasetselector#').replace('#2DateLabel1#','#Dates#');
                                
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('#Charts#','Sales_Chart_2_1').replace('#SalesCharts#','chart_4');
                                  String Str8 = '"chart_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                                MarketingString =  MarketingString.replace(Sales.Delete_All_Chart__c,Str8);
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('Sales_Chart_2_1','#Charts#').replace('chart_4','#SalesCharts#');
                                
                            }
                            if(Numbers == 2 && i == 2){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#listselectors#','listselector_13');
                                String Strlst13 = '"listselector_13": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,Strlst13);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSales#').replace('listselector_13','#listselectors#');
                                
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#datasetselector#','dateselector_11').replace('#Dates#','#2DateLabel2#');
                                String Strds11 = '"dateselector_11": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_All_dateselectors__c,Strds11);
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('dateselector_11','#datasetselector#').replace('#2DateLabel2#','#Dates#');
                               
                                
                                Sales.Delete_All_Dates__c = Sales.Delete_All_Dates__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#Truewfalse#','true').replace('#datasetId#','#'+Numbers+'datasetId#').replace('#datasetAlias#','#'+Numbers+'datasetAlias#').replace('#DateAPI#','#'+Numbers+'DateAPI'+i+'#');
                                MarketingString =  MarketingString.replace(Sales.Delete_All_Dates__c,'');
                                Sales.Delete_All_Dates__c = Sales.Delete_All_Dates__c.replace('#'+Numbers+'DateAPI'+i+'#','#DateAPI#').replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('#'+Numbers+'datasetAlias#','#datasetAlias#').replace('#'+Numbers+'datasetId#','#datasetId#').replace('true','#Truewfalse#'); 
                                
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('#Charts#','Sales_Chart_2_2').replace('#SalesCharts#','chart_5');
                                  String Str8 = '"chart_5": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                                MarketingString =  MarketingString.replace(Sales.Delete_All_Chart__c,Str8);
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('Sales_Chart_2_2','#Charts#').replace('chart_5','#SalesCharts#');
                                
                                MarketingString =  MarketingString.replace(Sales.Sales_Insight_Delete2__c,'');
                            }
                            if(Numbers == 2 && i == 3){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#listselectors#','listselector_14');
                                String Strlst14 = '"listselector_14": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,Strlst14);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSales#').replace('listselector_14','#listselectors#');
                                
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#datasetselector#','dateselector_10').replace('#Dates#','#2DateLabel3#');
                                String Strds10 = '"dateselector_10": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_All_dateselectors__c,Strds10);
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('dateselector_10','#datasetselector#').replace('#2DateLabel3#','#Dates#');
                                
                                Sales.Delete_All_Dates__c = Sales.Delete_All_Dates__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#Truewfalse#','true').replace('#datasetId#','#'+Numbers+'datasetId#').replace('#datasetAlias#','#'+Numbers+'datasetAlias#').replace('#DateAPI#','#'+Numbers+'DateAPI'+i+'#');
                                MarketingString =  MarketingString.replace(Sales.Delete_All_Dates__c,'');
                                Sales.Delete_All_Dates__c = Sales.Delete_All_Dates__c.replace('#'+Numbers+'DateAPI'+i+'#','#DateAPI#').replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('#'+Numbers+'datasetAlias#','#datasetAlias#').replace('#'+Numbers+'datasetId#','#datasetId#').replace('true','#Truewfalse#'); 
                                
                                Sales.Delete_All_Chart1__c = Sales.Delete_All_Chart1__c.replace('#Charts#','Sales_Chart_2_3').replace('#SalesCharts#','chart_22');
                                  String Str8 = '"chart_22": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                                MarketingString =  MarketingString.replace(Sales.Delete_All_Chart1__c,Str8);
                                Sales.Delete_All_Chart1__c = Sales.Delete_All_Chart1__c.replace('Sales_Chart_2_3','#Charts#').replace('chart_22','#SalesCharts#');
                                MarketingString =  MarketingString.replace(Sales.Sales_Insight_Delete3__c,'');
                            }
                            if(Numbers == 4 && i == 1){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#listselectors#','listselector_34');
                                String Strls34 = '"listselector_34": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,Strls34);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSales#').replace('listselector_34','#listselectors#');
                                
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#datasetselector#','dateselector_6').replace('#Dates#','#4DateLabel1#');
                                String Strds6 = '"dateselector_6": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_All_dateselectors__c,Strds6);
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('dateselector_6','#datasetselector#').replace('#4DateLabel1#','#Dates#');
                                
                                
                                    Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('#Charts#','Sales_Chart_4_1').replace('#SalesCharts#','chart_11');
                                  String Str8 = '"chart_11": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                                MarketingString =  MarketingString.replace(Sales.Delete_All_Chart__c,Str8);
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('Sales_Chart_4_1','#Charts#').replace('chart_11','#SalesCharts#');
                                
                            }
                            if(Numbers == 4 && i == 2){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#listselectors#','listselector_20');
                                String Strls20 = '"listselector_20": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,Strls20);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSales#').replace('listselector_20','#listselectors#');
                                
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#datasetselector#','dateselector_14').replace('#Dates#','#4DateLabel2#');
                                String Strds14 = '"dateselector_14": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_All_dateselectors__c,Strds14);
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('dateselector_14','#datasetselector#').replace('#4DateLabel2#','#Dates#');
                                
                                
                                    Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('#Charts#','Sales_Chart_4_2').replace('#SalesCharts#','chart_12');
                                      String Str8 = '"chart_12": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                                MarketingString =  MarketingString.replace(Sales.Delete_All_Chart__c,Str8);
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('Sales_Chart_4_2','#Charts#').replace('chart_12','#SalesCharts#');
                                
                            }
                            if(Numbers == 4 && i == 3){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#listselectors#','listselector_21');
                                String Strls27 = '"listselector_21": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,Strls27);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSales#').replace('listselector_21','#listselectors#');
                                
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#datasetselector#','dateselector_15').replace('#Dates#','#4DateLabel3#');
                                String Strds15 = '"dateselector_15": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_All_dateselectors__c,Strds15);
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('dateselector_15','#datasetselector#').replace('#4DateLabel3#','#Dates#');
                                
                                Sales.Delete_All_Chart1__c = Sales.Delete_All_Chart1__c.replace('#Charts#','Sales_Chart_4_3').replace('#SalesCharts#','chart_10');
                                  String Str8 = '"chart_10": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                                MarketingString =  MarketingString.replace(Sales.Delete_All_Chart1__c,Str8);
                                Sales.Delete_All_Chart1__c = Sales.Delete_All_Chart1__c.replace('Sales_Chart_4_3','#Charts#').replace('chart_10','#SalesCharts#');
                                MarketingString =  MarketingString.replace(Sales.Chart_Delete2__c,'');
                                
                            }
                            if(Numbers == 3 && i == 1){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#listselectors#','listselector_44');
                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('listselector_44','listselector_48');
                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('listselector_48','listselector_33');
                                String Strclst33 = '"listselector_33": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,Strclst33);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('listselector_33','#listselectors#').replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSales#');
                                
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#datasetselector#','dateselector_5').replace('#Dates#','#3DateLabel1#');
                                String Strds5 = '"dateselector_5": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                MarketingString =  MarketingString.replace(Sales.Delete_All_dateselectors__c,Strds5);
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('dateselector_5','#datasetselector#').replace('#3DateLabel1#','#Dates#');
                                
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('#Charts#','Sales_Chart_3_1').replace('#SalesCharts#','chart_7');
                                  String Str8 = '"chart_7": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                                MarketingString =  MarketingString.replace(Sales.Delete_All_Chart__c,str8);
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('Sales_Chart_3_1','#Charts#').replace('chart_7','#SalesCharts#');
                                
                            }
                            if(Numbers == 3 && i == 2){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#listselectors#','listselector_49');
                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('listselector_49','listselector_46');
                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('listselector_46','listselector_18');
                                String Strclst18 = '"listselector_18": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,Strclst18);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSales#').replace('listselector_18','#listselectors#');
                                
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#datasetselector#','dateselector_13').replace('#Dates#','#3DateLabel2#');
                                String Strds13 = '"dateselector_13": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_All_dateselectors__c,Strds13);
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('dateselector_13','#datasetselector#').replace('#3DateLabel2#','#Dates#');
                                
                                    Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('#Charts#','Sales_Chart_3_2').replace('#SalesCharts#','chart_8');
                                      String Str8 = '"chart_8": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                                MarketingString =  MarketingString.replace(Sales.Delete_All_Chart__c,str8);
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('Sales_Chart_3_2','#Charts#').replace('chart_8','#SalesCharts#');
                                
                            }
                            if(Numbers == 3 && i == 3){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#listselectors#','listselector_50');
                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('listselector_50','listselector_45');
                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('listselector_45','listselector_17');
                                String Strclst17 = '"listselector_17": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,Strclst17);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSales#').replace('listselector_17','#listselectors#');
                                
                                Sales.Delete_All_dateselector1__c = Sales.Delete_All_dateselector1__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#datasetselector#','dateselector_12').replace('#Dates#','#3DateLabel3#');
                                String Strds12 = '"dateselector_12": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                MarketingString =  MarketingString.replace(Sales.Delete_All_dateselector1__c,Strds12);
                                Sales.Delete_All_dateselector1__c = Sales.Delete_All_dateselector1__c.replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('dateselector_12','#datasetselector#').replace('#3DateLabel3#','#Dates#');
                                
                                Sales.Delete_All_Chart1__c = Sales.Delete_All_Chart1__c.replace('#Charts#','Sales_Chart_3_3').replace('#SalesCharts#','chart_18');
                                  String Str8 = '"chart_18": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                                MarketingString =  MarketingString.replace(Sales.Delete_All_Chart1__c,str8);
                                Sales.Delete_All_Chart1__c = Sales.Delete_All_Chart1__c.replace('Sales_Chart_3_3','#Charts#').replace('chart_18','#SalesCharts#');
                                MarketingString =  MarketingString.replace(Sales.Delete_All_Chart3__c,'');                  
                                
                            }
                            if(Numbers == 5 && i == 1){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#listselectors#','listselector_35');
                                String  Str5 = '"listselector_35": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            
                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,Str5);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSales#').replace('listselector_35','#listselectors#');
                                
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#datasetselector#','dateselector_7').replace('#Dates#','#5DateLabel1#');
                                String  Str6 = '"dateselector_7": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            
                                MarketingString =  MarketingString.replace(Sales.Delete_All_dateselectors__c,Str6);
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('dateselector_7','#datasetselector#').replace('#5DateLabel1#','#Dates#');
                                
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('#Charts#','Sales_Chart_5_1').replace('#SalesCharts#','chart_14');
                                 String Str8 = '"chart_14": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                                MarketingString =  MarketingString.replace(Sales.Delete_All_Chart__c,Str8);
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('Sales_Chart_5_1','#Charts#').replace('chart_14','#SalesCharts#');
                                
                                MarketingString =  MarketingString.replace(Sales.Chart_Delete14__c,'');
                            }
                            if(Numbers == 5 && i == 2){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#listselectors#','listselector_24');
                                 String  Str4 = '"listselector_24": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            
                               
                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,Str4);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSales#').replace('listselector_24','#listselectors#');
                                
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#datasetselector#','dateselector_17').replace('#Dates#','#5DateLabel2#');
                                 String  Str5 = '"dateselector_17": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            
                               
                                MarketingString =  MarketingString.replace(Sales.Delete_All_dateselectors__c,Str5);
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('dateselector_17','#datasetselector#').replace('#5DateLabel2#','#Dates#');
                                
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('#Charts#','Sales_Chart_5_2').replace('#SalesCharts#','chart_24');
                                  String Str7 = '"chart_24": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                      
                                MarketingString =  MarketingString.replace(Sales.Delete_All_Chart__c,Str7);                           
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('Sales_Chart_5_2','#Charts#').replace('chart_24','#SalesCharts#');
                                 String Strch24 = '"chart_24": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                
                                MarketingString =  MarketingString.replace(Sales.Delete_All_Chart4__c,Strch24);
                                Sales.Delete_All_Chart2__c = Sales.Delete_All_Chart2__c.replace('#Charts#','Sales_Chart_5_2').replace('#SalesCharts#','chart_16');
                                  String Str8 = '"chart_16": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                
                                MarketingString =  MarketingString.replace(Sales.Delete_All_Chart2__c,Str8);                              
                                Sales.Delete_All_Chart2__c = Sales.Delete_All_Chart2__c.replace('Sales_Chart_5_2','#Charts#').replace('chart_16','#SalesCharts#');
                                
                                MarketingString =  MarketingString.replace(Sales.Chart_Delete24__c,'');
                                
                            }
                            if(Numbers == 5 && i == 3){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#listselectors#','listselector_25');
                                 String  Str4 = '"listselector_25": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            
                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,Str4);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSales#').replace('listselector_25','#listselectors#');
                                
                                Sales.Delete_All_Group5__c = Sales.Delete_All_Group5__c.replace('#StaticSalesGrouping#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#GroupingLabel','#'+Numbers+'GroupingLabel').replace('#GroupingAPI','#'+Numbers+'GroupingAPI');
                              
                                MarketingString =  MarketingString.replace(Sales.Delete_All_Group5__c,'');
                                Sales.Delete_All_Group5__c = Sales.Delete_All_Group5__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSalesGrouping#').replace('#'+Numbers+'GroupingLabel','#GroupingLabel').replace('#'+Numbers+'GroupingAPI','#GroupingAPI');
                                
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#datasetselector#','dateselector_16').replace('#Dates#','#5DateLabel3#');
                                 String  Str6 = '"dateselector_16": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            
                                MarketingString =  MarketingString.replace(Sales.Delete_All_dateselectors__c,Str6);
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('dateselector_16','#datasetselector#').replace('#5DateLabel3#','#Dates#');
                                
                                Sales.Delete_All_Chart1__c = Sales.Delete_All_Chart1__c.replace('#Charts#','Sales_Chart_5_3').replace('#SalesCharts#','chart_20');
                                String  Str7 = '"chart_20": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            
                                MarketingString =  MarketingString.replace(Sales.Delete_All_Chart1__c,Str7);
                                Sales.Delete_All_Chart1__c = Sales.Delete_All_Chart1__c.replace('Sales_Chart_5_3','#Charts#').replace('chart_20','#SalesCharts#');
                                
                            }                                                       
                        } 
                            Sales.Delete_All_Timeline__c = Sales.Delete_All_Timeline__c.replace('#StaticSalesTimelines#','Static_Sales__KPI_'+Numbers+'_Timeline').replace('#DateLabel','#'+Numbers+'DateLabel').replace('#DateAPI','#'+Numbers+'DateAPI');
                            MarketingString =  MarketingString.replace(Sales.Delete_All_Timeline__c,'');
                            Sales.Delete_All_Timeline__c = Sales.Delete_All_Timeline__c.replace('Static_Sales__KPI_'+Numbers+'_Timeline','#StaticSalesTimelines#').replace('#'+Numbers+'DateLabel','#DateLabel').replace('#'+Numbers+'DateAPI','#DateAPI'); 
                            
                            Sales.Delete_All_Timeline4__c = Sales.Delete_All_Timeline4__c.replace('#StaticSalesFilter#','Static_Sales__KPI_'+Numbers +'_Filter').replace('#queryFiltersLabel','#'+Numbers+'queryFiltersLabel').replace('#queryFiltersString','#'+Numbers+'queryFiltersString');
                            MarketingString =  MarketingString.replace(Sales.Delete_All_Timeline4__c,'');
                            Sales.Delete_All_Timeline4__c = Sales.Delete_All_Timeline4__c.replace('Static_Sales__KPI_'+Numbers +'_Filter','#StaticSalesFilter#').replace('#'+Numbers+'queryFiltersLabel','#queryFiltersLabel').replace('#'+Numbers+'queryFiltersString','#queryFiltersString'); 
                            
                            Sales.Delete_All_Orders__c = Sales.Delete_All_Orders__c.replace('#StaticSalesOrder#','Static_Sales_Order_'+Numbers);
                            MarketingString =  MarketingString.replace(Sales.Delete_All_Orders__c,'');
                            Sales.Delete_All_Orders__c = Sales.Delete_All_Orders__c.replace('Static_Sales_Order_'+Numbers,'#StaticSalesOrder#'); 
                            
                            Sales.Delete_All_Measures__c = Sales.Delete_All_Measures__c.replace('#StaticSalesMeasure#','Static_Sales_Measure_'+Numbers ).replace('#MeasureLabel','#'+Numbers+'MeasureLabel').replace('#CompactMeasureAPI','#'+Numbers+'CompactMeasureAPI').replace('#ExpressionMeasureAPI','#'+Numbers+'ExpressionMeasureAPI').replace('#AliasMeasureAPI','#'+Numbers+'AliasMeasureAPI');
                            MarketingString =  MarketingString.replace(Sales.Delete_All_Measures__c,'');
                            Sales.Delete_All_Measures__c = Sales.Delete_All_Measures__c.replace('Static_Sales_Measure_'+Numbers,'#StaticSalesMeasure#').replace('#'+Numbers+'MeasureLabel','#MeasureLabel').replace('#'+Numbers+'CompactMeasureAPI','#CompactMeasureAPI').replace('#'+Numbers+'ExpressionMeasureAPI','#ExpressionMeasureAPI').replace('#'+Numbers+'AliasMeasureAPI','#AliasMeasureAPI');
                            
                            Sales.Delete_All_Static_KPIs__c = Sales.Delete_All_Static_KPIs__c.replace('#StaticSales#','Static_Sales_KPI_'+Numbers ).replace('#MeasureLabel','#'+Numbers+'MeasureLabel').replace('#CompactMeasureAPI','#'+Numbers+'CompactMeasureAPI').replace('#ExpressionMeasureAPI','#'+Numbers+'ExpressionMeasureAPI').replace('#AliasMeasureAPI','#'+Numbers+'AliasMeasureAPI');
                            MarketingString =  MarketingString.replace(Sales.Delete_All_Static_KPIs__c,'');
                            Sales.Delete_All_Static_KPIs__c = Sales.Delete_All_Static_KPIs__c.replace('Static_Sales_KPI_'+Numbers,'#StaticSales#').replace('#'+Numbers+'MeasureLabel','#MeasureLabel').replace('#'+Numbers+'CompactMeasureAPI','#CompactMeasureAPI').replace('#'+Numbers+'ExpressionMeasureAPI','#ExpressionMeasureAPI').replace('#'+Numbers+'AliasMeasureAPI','#AliasMeasureAPI');
                            
                            //MarketingString =  MarketingString.replace(Sales.Delete_All_Timeline4__c,'');
                                                        
                            if(Numbers == 5){
                                MarketingString =  MarketingString.replace(Sales.Delete_All_Timeline3__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales_Measure_'+Numbers).replace('#listselectors#','listselector_23').replace('Choose Groupings','Choose Measures');
                                String Str24 = '"listselector_23": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,Str24);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales_Measure_'+Numbers,'#StaticSales#').replace('listselector_23','#listselectors#').replace('Choose Measures','Choose Groupings');
                                
                                Sales.List_Selector__c = Sales.List_Selector__c.replace('#listselectors#','listselector_23').replace('"colspan": #Colspans#','"colspan": 3').replace('"column": #Cloumns#','"column": 18').replace('"row": #rows#','"row": 55');
                                MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_23','listselector_23').replace('"colspan": 3','"colspan": 1').replace('"column": 18','"column": 6').replace('"row": 55','"row": 1');
                                MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_23','listselector_23').replace('"colspan": 1','"colspan": 1').replace('"column": 6','"column": 1').replace('"row": 1','"row": 2');
                                MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_23','#listselectors#').replace('"colspan": 1','"colspan": #Colspans#').replace('"column": 1','"column": #Cloumns#').replace('"row": 2','"row": #rows#');
                                        
                                        
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Timeline').replace('#listselectors#','listselector_16').replace('Choose Groupings','Choose Date Format');
                                String Strlst = '"listselector_16": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,Strlst);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Timeline','#StaticSales#').replace('listselector_16','#listselectors#').replace('Choose Date Format','Choose Groupings');
                                
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers +'_Filter').replace('#listselectors#','listselector_41').replace('Choose Groupings','Choose Filters');
                                String Str41 = '"listselector_41": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,Str41);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('listselector_41','listselector_6');
                                 String Str6 = '"listselector_6": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,Str6);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers +'_Filter','#StaticSales#').replace('listselector_6','#listselectors#').replace('Choose Filters','Choose Groupings');
                                
                                Sales.Delete_pillbox__c = Sales.Delete_pillbox__c.replace('#StaticSalesOrder#','Static_Sales_Order_'+Numbers).replace('#pillboxs#','pillbox_7');
                                String Strpill = '"pillbox_7": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_pillbox__c,Strpill);
                                Sales.Delete_pillbox__c = Sales.Delete_pillbox__c.replace('Static_Sales_Order_'+Numbers,'#StaticSalesOrder#').replace('pillbox_7','#pillboxs#');                               
                                
                            } 
                            if(Numbers == 4){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales_Measure_'+Numbers).replace('#listselectors#','listselector_19').replace('Choose Groupings','Choose Measures');
                                String Strls19 = '"listselector_19": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,Strls19);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales_Measure_'+Numbers,'#StaticSales#').replace('listselector_19','#listselectors#').replace('Choose Measures','Choose Groupings');
                                
                                MarketingString =  MarketingString.replace(Sales.Delete_All_Timeline2__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Timeline').replace('#listselectors#','listselector_15').replace('Choose Groupings','Choose Date Format');
                                String Strls15 = '"listselector_15": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,Strls15);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Timeline','#StaticSales#').replace('listselector_15','#listselectors#').replace('Choose Date Format','Choose Groupings');
                                
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers +'_Filter').replace('#listselectors#','listselector_40').replace('Choose Groupings','Choose Filters');
                                String Strls40 = '"listselector_40": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,Strls40);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers +'_Filter','#StaticSales#').replace('listselector_40','#listselectors#').replace('Choose Filters','Choose Groupings');
                                
                                Sales.Delete_pillbox__c = Sales.Delete_pillbox__c.replace('#StaticSalesOrder#','Static_Sales_Order_'+Numbers).replace('#pillboxs#','pillbox_5');
                                String Strpill5 = '"pillbox_5": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_pillbox__c,Strpill5);
                                Sales.Delete_pillbox__c = Sales.Delete_pillbox__c.replace('Static_Sales_Order_'+Numbers,'#StaticSalesOrder#').replace('pillbox_5','#pillboxs#');    
                            } 
                            if(Numbers == 3){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales_Measure_'+Numbers).replace('#listselectors#','listselector_43').replace('Choose Groupings','Choose Measures');
                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('listselector_43','listselector_53');
                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('listselector_53','listselector_36');
                                String Strclst36 = '"listselector_36": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,Strclst36);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales_Measure_'+Numbers,'#StaticSales#').replace('listselector_36','#listselectors#').replace('Choose Measures','Choose Groupings');
                                
                                        MarketingString =  MarketingString.replace(Sales.Lis_Selector36__c,'').replace(Sales.List_Selector43__c,'').replace(Sales.Delete_List_Selector43__c,'').replace(Sales.List_Selector53__c,'').replace(Sales.Delete_List_Selector53__c,'');
                                MarketingString =  MarketingString.replace(Sales.Delete_All_Timeline1__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Timeline').replace('#listselectors#','listselector_37').replace('Choose Groupings','Choose Date Format');
                              String Strclst37 = '"listselector_37": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,Strclst37);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('listselector_37','listselector_47');
                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('listselector_47','listselector_51');
                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Timeline','#StaticSales#').replace('listselector_51','#listselectors#').replace('Choose Date Format','Choose Groupings');
                                
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers +'_Filter').replace('#listselectors#','listselector_39').replace('Choose Groupings','Choose Filters');
                                String Strclst39 = '"listselector_39": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,Strclst39);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers +'_Filter','#StaticSales#').replace('listselector_39','#listselectors#').replace('Choose Filters','Choose Groupings');
                                
                                
                                
                                Sales.Delete_pillbox__c = Sales.Delete_pillbox__c.replace('#StaticSalesOrder#','Static_Sales_Order_'+Numbers).replace('#pillboxs#','pillbox_2');
                                MarketingString =  MarketingString.replace(Sales.Delete_pillbox__c,'');
                                Sales.Delete_pillbox__c = Sales.Delete_pillbox__c.replace('pillbox_2','pillbox_6');
                                MarketingString =  MarketingString.replace(Sales.Delete_pillbox__c,'');
                                Sales.Delete_pillbox__c = Sales.Delete_pillbox__c.replace('pillbox_6','pillbox_4');
                                String Strpill4 = '"pillbox_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_pillbox__c,Strpill4);
                                Sales.Delete_pillbox__c = Sales.Delete_pillbox__c.replace('Static_Sales_Order_'+Numbers,'#StaticSalesOrder#').replace('pillbox_4','#pillboxs#');
                            }
                            if(Numbers == 2){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales_Measure_'+Numbers).replace('#listselectors#','listselector_12').replace('Choose Groupings','Choose Measures');
                                String Strlst12 = '"listselector_12": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,Strlst12);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales_Measure_'+Numbers,'#StaticSales#').replace('listselector_12','#listselectors#').replace('Choose Measures','Choose Groupings');
                                
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Timeline').replace('#listselectors#','listselector_22').replace('Choose Groupings','Choose Date Format');
                                String Strlst22 = '"listselector_22": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,Strlst22);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Timeline','#StaticSales#').replace('listselector_22','#listselectors#').replace('Choose Date Format','Choose Groupings');
                                
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers +'_Filter').replace('#listselectors#','listselector_38').replace('Choose Groupings','Choose Filters');
                                String Strlst38 = '"listselector_38": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_List_Selector__c,Strlst38);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers +'_Filter','#StaticSales#').replace('listselector_38','#listselectors#').replace('Choose Filters','Choose Groupings');
                                
                                Sales.Delete_pillbox__c = Sales.Delete_pillbox__c.replace('#StaticSalesOrder#','Static_Sales_Order_'+Numbers).replace('#pillboxs#','pillbox_3');
                                String Strpill3 = '"pillbox_3": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                MarketingString =  MarketingString.replace(Sales.Delete_pillbox__c,Strpill3);
                                Sales.Delete_pillbox__c = Sales.Delete_pillbox__c.replace('Static_Sales_Order_'+Numbers,'#StaticSalesOrder#').replace('pillbox_3','#pillboxs#');
                            } 
                       
                                    if(Numbers == 5 ){
                                        //  System.debug('Sales.Sales_KPI_Delete__c*************'+Sales.Sales_KPI_Delete__c);
                                        String[] StNUmbers = new String[]{'number_13','number_12','number_11','number_14'};
                                        String[] Fields = new String[]{'#5AliasMeasureAPI3#','#5AliasMeasureAPI2#','#5AliasMeasureAPI1#','#5AliasMeasureAPI4#'};
                                        MarketingString =  MarketingString.replace(Sales.List_Selector6__c,'').replace(Sales.Sales_Chart_5__c,'').replace(Sales.Sales_KPI_5__c,'').replace(Sales.number_33__c,'').replace(Sales.number_34__c,'');     
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('#texts#','text_31').replace('#StaticSales#','Static_Sales_KPI_'+ Numbers).replace('#labels#','label_1');
                                        String Str11 = '"text_31": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                        
                                        MarketingString =  MarketingString.replace(Sales.Delete_All_Texts__c,Str11);
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_31','text_32').replace('label_1','label_2');
                                        String Str8 = '"text_32": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                        
                                        MarketingString =  MarketingString.replace(Sales.Delete_All_Texts__c,Str8);
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_32','text_33').replace('label_2','label_3');
                                        String Str9 = '"text_33": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                        
                                        MarketingString =  MarketingString.replace(Sales.Delete_All_Texts__c,Str9);                                       
                                        
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_33','text_34').replace('label_3','label_4');                                        
                                        String Str10 = '"text_34": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                        
                                        MarketingString =  MarketingString.replace(Sales.Delete_All_Texts__c,Str10);                                       
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_34','#texts#').replace('label_4','#labels#').replace('Static_Sales_KPI_'+ Numbers,'#StaticSales#');
                                        
                                        integer i= 0;        
                                        for(String St : StNUmbers){                                     
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Numbers#',St);
                                        if(St == ''){
                                            Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"exploreLink": #falses#','"exploreLink": false').replace('"compact": #trues#','"compact": true');
                                        }
                                        else{
                                            Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"exploreLink": #falses#','"exploreLink": true').replace('"compact": #trues#','"compact": true');
                                        }
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Fields#',Fields[i]).replace('#SalesKPIs#','Sales_KPI_5');
                                        String Str7 = '"'+St+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                     //   System.debug('Sales.Sales_KPI_Delete__c*************'+Sales.Sales_KPI_Delete__c);
                                     //   System.debug('Str7*************'+Str7);
                                        MarketingString =  MarketingString.replace(Sales.Sales_KPI_Delete__c,Str7);
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace(St,'#Numbers#').replace(Fields[i],'#Fields#').replace('Sales_KPI_5','#SalesKPIs#');
                                       
                                            Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"compact": true','"compact": #trues#').replace('"exploreLink": true','"exploreLink": #falses#');
                                        
                                        i++;
                                        }   
                                        
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('#listselectors#','listselector_16').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #Cloumns#','"column": 0').replace('"row": #rows#','"row": 10');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 0','"column": 4').replace('"row": 10','"row": 4');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 4','"column": 16').replace('"row": 4','"row": 58');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 16','"column": 0').replace('listselector_16','listselector_41').replace('"row": 58','"row": 2');
                                        
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_41','listselector_6').replace('"colspan": 1','"colspan": 1').replace('"column": 0','"column": 2').replace('"row": 2','"row": 1');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_6','listselector_41').replace('"colspan": 1','"colspan": 3').replace('"column": 2','"column": 6').replace('"row": 1','"row": 55');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 6','"column": 0').replace('listselector_41','listselector_35').replace('"row": 55','"row": 9');
                                        
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 0','"column": 0').replace('"row": 9','"row": 4');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 0','"column": 2').replace('"row": 4','"row": 58');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 2','"column": 1').replace('listselector_35','listselector_24').replace('"row": 58','"row": 9');
                                        
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 1','"column": 2').replace('"row": 9','"row": 4');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 2','"column": 9').replace('"row": 4','"row": 58');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 9','"column": 1').replace('listselector_24','listselector_25').replace('"row": 58','"row": 10');
                                        
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 1','"column": 6').replace('"row": 10','"row": 4');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 6','"column": 19').replace('"row": 4','"row": 58');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 19','"column": #Cloumns#').replace('listselector_25','#listselectors#').replace('"row": 58','"row": #rows#');
                                        
                                        Sales.Pillbox__c = Sales.Pillbox__c.replace('#pillboxs#','pillbox_7').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #Cloumns#','"column": 1').replace('"row": #rows#','"row": 4');
                                            MarketingString =  MarketingString.replace(Sales.Pillbox__c,'');
                                            Sales.Pillbox__c = Sales.Pillbox__c.replace('"colspan": 1','"colspan": 1').replace('"column": 1','"column": 7').replace('"row": 4','"row": 1');
                                            MarketingString =  MarketingString.replace(Sales.Pillbox__c,'');
                                            Sales.Pillbox__c = Sales.Pillbox__c.replace('"colspan": 1','"colspan": 3').replace('"column": 7','"column": 21').replace('"row": 1','"row": 55');
                                            MarketingString =  MarketingString.replace(Sales.Pillbox__c,'');                                                                            
                                            Sales.Pillbox__c = Sales.Pillbox__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 21','"column": #Cloumns#').replace('pillbox_7','#pillboxs#').replace('"row": 55','"row": #rows#');
                                            
                                            Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('#charts#','chart_20').replace('"colspan": #Colspans#','"colspan": 4').replace('"column": #Cloumns#','"column": 4').replace('"row": #rows#','"row": 5').replace('"rowspan": #rowspans#','"rowspan": 7');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');
                                            
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 4','"colspan": 10').replace('"column": 4','"column": 14').replace('"row": 5','"row": 59');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');  
                                                                                                                
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 10','"colspan": 2').replace('"column": 14','"column": 2').replace('chart_20','chart_16').replace('"row": 59','"row": 5').replace('"rowspan": 7','"rowspan": 7');
                                        
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');
                                            
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('chart_16','chart_24').replace('"colspan": 2','"colspan": 7').replace('"column": 2','"column": 7').replace('"row": 5','"row": 59');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');      
                                                                                                            
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 7','"colspan": 2').replace('"column": 7','"column": 0').replace('chart_24','chart_14').replace('"row": 59','"row": 5').replace('"rowspan": 7','"rowspan": 7');
                                        
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');
                                            
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 2','"colspan": 7').replace('"column": 0','"column": 0').replace('"row": 5','"row": 59');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');  
                                            
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 7','"colspan": 2').replace('"row": 59','"row": 11').replace('"rowspan": 7','"rowspan": 6');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');  
                                                                                                                
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 7','"colspan": #Colspans#').replace('"column": 0','"column": #Cloumns#').replace('chart_14','#charts#').replace('"row": 59','"row": #rows#').replace('"rowspan": 6','"rowspan": #rowspans#');
                                        
                                        Sales.Chart_Delete__c = Sales.Chart_Delete__c.replace('#charts#','chart_20').replace('"colspan": #Colspans#','"colspan": 2').replace('"column": #Cloumns#','"column": 0').replace('"row": #rows#','"row": 23').replace('"rowspan": #rowspans#','"rowspan": 6');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete__c,'');         
                                        Sales.Chart_Delete__c = Sales.Chart_Delete__c.replace('chart_20','chart_24').replace('"row": 23','"row": 17');      
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete__c,'');                                                                   
                                        Sales.Chart_Delete__c = Sales.Chart_Delete__c.replace('"colspan": 2','"colspan": #Colspans#').replace('"column": 0','"column": #Cloumns#').replace('chart_24','#charts#').replace('"row": 17','"row": #rows#').replace('"rowspan": 6','"rowspan": #rowspans#'); 
                                        
                                        String[] St1 = new String[]{'6','2','1'};
                                        String[] St2 = new String[]{'0','0','0'};
                                        String[] St3 = new String[]{'57','3','6'};
                                        String[] St5 = new String[]{'6','2','1'};
                                        integer j=0;
                                        for(String St : St1){
                                        Sales.Test1__c = Sales.Test1__c.replace('"colspan": #Cols#','"colspan": '+St).replace('"column": #colm#','"column": '+st2[j]).replace('"row": #rows#','"row": '+st3[j]);
                                        MarketingString =  MarketingString.replace(Sales.Test1__c,'');                                                                  
                                        Sales.Test1__c = Sales.Test1__c.replace('"colspan": '+St,'"colspan": #Cols#').replace('"column": '+st2[j],'"column": #colm#').replace('"row": '+st3[j],'"row": #rows#');
                                            j++;
                                        }
                                        
                                        
                                        integer k=0;
                                        for(String St : St1){
                                        Sales.Test2__c = Sales.Test2__c.replace('"colspan": #Cols#','"colspan": '+St).replace('"column": #colm#','"column": '+st5[k]).replace('"row": #rows#','"row": '+st3[k]);
                                        MarketingString =  MarketingString.replace(Sales.Test2__c,'');                                                                      
                                        Sales.Test2__c = Sales.Test2__c.replace('"colspan": '+St,'"colspan": #Cols#').replace('"column": '+st5[k],'"column": #colm#').replace('"row": '+st3[k],'"row": #rows#');
                                            k++;
                                        }
                                        
                                        String[] St8 = new String[]{'12','4','0'};
                                        String[] St9 = new String[]{'57','3','8'};                                      
                                        String[] St11 = new String[]{'18','6','1'};
                                        integer l=0;
                                        for(String St : St1){
                                        Sales.Test3__c = Sales.Test3__c.replace('"colspan": #Cols#','"colspan": '+St).replace('"column": #colm#','"column": '+st8[l]).replace('"row": #rows#','"row": '+St9[l]);
                                        MarketingString =  MarketingString.replace(Sales.Test3__c,'');                                                                  
                                        Sales.Test3__c = Sales.Test3__c.replace('"colspan": '+St,'"colspan": #Cols#').replace('"column": '+st8[l],'"column": #colm#').replace('"row": '+St9[l],'"row": #rows#');
                                            l++;
                                        }
                                        
                                        integer m=0;
                                        for(String St : St1){
                                        Sales.Test4__c = Sales.Test4__c.replace('"colspan": #Cols#','"colspan": '+St).replace('"column": #colm#','"column": '+st11[m]).replace('"row": #rows#','"row": '+st9[m]);
                                        MarketingString =  MarketingString.replace(Sales.Test4__c,'');                                                                  
                                        Sales.Test4__c = Sales.Test4__c.replace('"colspan": '+St,'"colspan": #Cols#').replace('"column": '+st11[m],'"column": #colm#').replace('"row": '+st9[m],'"row": #rows#');
                                            m++;
                                        }
                                        
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('#dateselector#','dateselector_7').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 3');
                                        //Sales.Chart_Delete__c = Sales.Chart_Delete__c.replace('"rowspan": #rowspans#','"rowspan": 6');
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');         
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 1').replace('"column": 0','"column": 3').replace('"row": 3','"row": 1');   
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 3','"column": 9').replace('"row": 1','"row": 55');  
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');                                                                   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 9','"column": #column#').replace('dateselector_7','#dateselector#').replace('"row": 55','"row": #rows#');  
                                        
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('#dateselector#','dateselector_17').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #column#','"column": 1').replace('"row": #rows#','"row": 3');
                                        //Sales.Chart_Delete__c = Sales.Chart_Delete__c.replace('"rowspan": #rowspans#','"rowspan": 6');
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');         
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 1').replace('"column": 1','"column": 4').replace('"row": 3','"row": 1');   
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 4','"column": 12').replace('"row": 1','"row": 55'); 
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');                                                                   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 12','"column": #column#').replace('dateselector_17','#dateselector#').replace('"row": 55','"row": #rows#');
                                        //Sales.Chart_Delete__c = Sales.Chart_Delete__c.replace('"rowspan": 6','"rowspan": #rowspans#');
                                        
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('#dateselector#','dateselector_16').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 4');
                                        //Sales.Chart_Delete__c = Sales.Chart_Delete__c.replace('"rowspan": #rowspans#','"rowspan": 6');
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');         
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 1').replace('"column": 0','"column": 5').replace('"row": 4','"row": 1');   
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 5','"column": 15').replace('"row": 1','"row": 55'); 
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');                                                                   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 15','"column": #column#').replace('dateselector_16','#dateselector#').replace('"row": 55','"row": #rows#');    
                                        
                                            Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_13').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 12').replace('"row": #rows#','"row": 56');
                                        MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');       
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_13','number_12').replace('"colspan": 6','"colspan": 6').replace('"column": 12','"column": 6').replace('"row": 56','"row": 56');   
                                        MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');  
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_12','number_11').replace('"colspan": 6','"colspan": 6').replace('"column": 6','"column": 0').replace('"row": 56','"row": 56');    
                                        MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,''); 
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_11','number_14').replace('"colspan": 6','"colspan": 6').replace('"column": 0','"column": 18').replace('"row": 56','"row": 56');   
                                        MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');                                                                 
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 18','"column": #column#').replace('number_14','#charts#').replace('"row": 56','"row": #rows#');
                                        
                                      
                                        Sales.View_Results__c = Sales.View_Results__c.replace('#texts#','text_30');
                                        String Strtex30 = '"text_30": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.View_Results__c,Strtex30);                                                                   
                                        Sales.View_Results__c = Sales.View_Results__c.replace('text_30','#texts#');
                                        
                                        Sales.View_Results_Text__c = Sales.View_Results_Text__c.replace('#texts#','text_30').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 55');
                                        MarketingString =  MarketingString.replace(Sales.View_Results_Text__c,'');  
                                        Sales.View_Results_Text__c = Sales.View_Results_Text__c.replace('text_30','text_30').replace('"colspan": 6','"colspan": 2').replace('"column": 0','"column": 0').replace('"row": 55','"row": 1');
                                        MarketingString =  MarketingString.replace(Sales.View_Results_Text__c,'');                                                                  
                                        Sales.View_Results_Text__c = Sales.View_Results_Text__c.replace('text_30','#texts#').replace('"colspan": 2','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 1','"row": #rows#');
                                        
                                        Sales.Sales_KPI_Headers__c = Sales.Sales_KPI_Headers__c.replace('#text#','text_29').replace('#SaleskPIs#','Sales KPI 5');
                                        String Strtex = '"text_29": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.Sales_KPI_Headers__c,Strtex);                                                                  
                                        Sales.Sales_KPI_Headers__c = Sales.Sales_KPI_Headers__c.replace('text_29','#text#').replace('Sales KPI 5','#SaleskPIs#');    
                                        
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('#texts#','text_29').replace('"colspan": #Colspans#','"colspan": 8').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 0');
                                        MarketingString =  MarketingString.replace(Sales.Sales_Header_text__c,'');
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('text_24','text_29').replace('"colspan": 8','"colspan": 2').replace('"column": 0','"column": 0').replace('"row": 0','"row": 0');
                                        MarketingString =  MarketingString.replace(Sales.Sales_Header_text__c,'');  
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('text_29','text_29').replace('"colspan": 2','"colspan": 24').replace('"column": 0','"column": 0').replace('"row": 0','"row": 54');
                                        MarketingString =  MarketingString.replace(Sales.Sales_Header_text__c,'');                                                                  
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('text_29','#texts#').replace('"colspan": 24','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 54','"row": #rows#');
                                       
                                        Sales.Container_Delete__c = Sales.Container_Delete__c.replace('#texts#','container_21').replace('"colspan": #Colspans#','"colspan": 24').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 56').replace('"rowspan": #rowspan#','"rowspan": 2');
                                        MarketingString =  MarketingString.replace(Sales.Container_Delete__c,'');                                                               
                                        Sales.Container_Delete__c = Sales.Container_Delete__c.replace('container_21','#texts#').replace('"colspan": 24','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 56','"row": #rows#').replace('"rowspan": 2','"rowspan": #rowspan#');
                                        
                                        Sales.Container_Delete1__c = Sales.Container_Delete1__c.replace('#texts#','container_21').replace('"colspan": #Colspans#','"colspan": 2').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 5').replace('"rowspan": #rowspan#','"rowspan": 4');
                                        MarketingString =  MarketingString.replace(Sales.Container_Delete1__c,''); 
                                        Sales.Container_Delete1__c = Sales.Container_Delete1__c.replace('container_21','container_21').replace('"colspan": 2','"colspan": 8').replace('"column": 0','"column": 0').replace('"row": 5','"row": 2').replace('"rowspan": 4','"rowspan": 2');
                                        MarketingString =  MarketingString.replace(Sales.Container_Delete1__c,'');                                                              
                                        Sales.Container_Delete1__c = Sales.Container_Delete1__c.replace('container_21','#texts#').replace('"colspan": 8','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 2','"row": #rows#').replace('"rowspan": 2','"rowspan": #rowspan#');
                                        
                                         String Strtexs = '"container_21": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                       
                                        MarketingString =  MarketingString.replace(Sales.container3__c,Strtexs);                                                                  
                                         
                                        
                                    }
                                    
                                    if(Numbers == 4){
                                        String[] StNUmbers = new String[]{'number_22','number_21','number_20','number_10'};
                                        String[] Fields = new String[]{'#4AliasMeasureAPI4#','#4AliasMeasureAPI3#','#4AliasMeasureAPI2#','#4AliasMeasureAPI1#'};
                                        MarketingString =  MarketingString.replace(Sales.Sales_Chart_4__c,'').replace(Sales.ListSelector__c,'').replace(Sales.Sales_KPI_4__c,'');
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('#texts#','text_26').replace('#StaticSales#','Static_Sales_KPI_'+ Numbers).replace('#labels#','label_1');
                                        String Strtx26 = '"text_26": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.Delete_All_Texts__c,Strtx26);
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_26','text_46').replace('label_1','label_2');
                                         String Strtx46 = '"text_46": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.Delete_All_Texts__c,Strtx46);
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_46','text_47').replace('label_2','label_3');
                                        String Strtx47 = '"text_47": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.Delete_All_Texts__c,Strtx47);                                       
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_47','text_48').replace('label_3','label_4');                                        
                                         String Strtx48 = '"text_48": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.Delete_All_Texts__c,Strtx48);                                       
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_48','#texts#').replace('label_4','#labels#').replace('Static_Sales_KPI_'+ Numbers,'#StaticSales#');
                                        
                                        integer i= 0;
                                        for(String St : StNUmbers){                                     
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Numbers#',St);
                                        
                                            Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"exploreLink": #falses#','"exploreLink": true').replace('"compact": #trues#','"compact": true');
                                     
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Fields#',Fields[i]).replace('#SalesKPIs#','Sales_KPI_4');
                                        String StrNum48 = '"'+St+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.Sales_KPI_Delete__c,StrNum48);
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace(St,'#Numbers#').replace(Fields[i],'#Fields#').replace('Sales_KPI_4','#SalesKPIs#');
                                        if(St == ''){
                                            Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"compact": false','"compact": #trues#').replace('"exploreLink": true','"exploreLink": #falses#');
                                        }
                                        else{
                                            Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"compact": true','"compact": #trues#').replace('"exploreLink": true','"exploreLink": #falses#');
                                        }
                                        i++;
                                        }   
                                        
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('#listselectors#','listselector_19').replace('"colspan": #Colspans#','"colspan": 3').replace('"column": #Cloumns#','"column": 18').replace('"row": #rows#','"row": 42');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_19','listselector_19').replace('"colspan": 3','"colspan": 1').replace('"column": 18','"column": 6').replace('"row": 42','"row": 1');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_19','listselector_19').replace('"colspan": 1','"colspan": 1').replace('"column": 6','"column": 1').replace('"row": 1','"row": 2');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_19','#listselectors#').replace('"colspan": 1','"colspan": #Colspans#').replace('"column": 1','"column": #Cloumns#').replace('"row": 2','"row": #rows#');
                                        
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('#listselectors#','listselector_15').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #Cloumns#','"column": 0').replace('"row": #rows#','"row": 10');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 0','"column": 4').replace('"row": 10','"row": 4');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 4','"column": 16').replace('"row": 4','"row": 45');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 16','"column": 0').replace('listselector_15','listselector_40').replace('"row": 45','"row": 2');  
                                        
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 1').replace('"column": 0','"column": 2').replace('"row": 2','"row": 1');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 3').replace('"column": 2','"column": 6').replace('"row": 1','"row": 42');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 6','"column": 0').replace('listselector_40','listselector_34').replace('"row": 42','"row": 9');
                                        
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 0','"column": 0').replace('"row": 9','"row": 4');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 0','"column": 2').replace('"row": 4','"row": 45');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 2','"column": 1').replace('listselector_34','listselector_20').replace('"row": 45','"row": 9');
                                        
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 1','"column": 2').replace('"row": 9','"row": 4');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 2','"column": 9').replace('"row": 4','"row": 45');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 9','"column": 1').replace('listselector_20','listselector_21').replace('"row": 45','"row": 10');
                                        
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 1','"column": 6').replace('"row": 10','"row": 4');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 6','"column": 19').replace('"row": 4','"row": 45');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 19','"column": #Cloumns#').replace('listselector_21','#listselectors#').replace('"row": 45','"row": #rows#');
                                        
                                        
                                            Sales.Pillbox__c = Sales.Pillbox__c.replace('#pillboxs#','pillbox_5').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #Cloumns#','"column": 1').replace('"row": #rows#','"row": 4');
                                            MarketingString =  MarketingString.replace(Sales.Pillbox__c,'');
                                            Sales.Pillbox__c = Sales.Pillbox__c.replace('"colspan": 1','"colspan": 1').replace('"column": 1','"column": 7').replace('"row": 4','"row": 1');
                                            MarketingString =  MarketingString.replace(Sales.Pillbox__c,'');
                                            Sales.Pillbox__c = Sales.Pillbox__c.replace('"colspan": 1','"colspan": 3').replace('"column": 7','"column": 21').replace('"row": 1','"row": 42');
                                            MarketingString =  MarketingString.replace(Sales.Pillbox__c,'');                                                                            
                                            Sales.Pillbox__c = Sales.Pillbox__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 21','"column": #Cloumns#').replace('pillbox_5','#pillboxs#').replace('"row": 42','"row": #rows#');
                                            
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('#charts#','chart_11').replace('"colspan": #Colspans#','"colspan": 2').replace('"column": #Cloumns#','"column": 0').replace('"row": #rows#','"row": 5').replace('"rowspan": #rowspans#','"rowspan": 7');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');  
                                                                    
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"row": 5','"row": 11').replace('"rowspan": 7','"rowspan": 6');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');  
                                        
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 2','"colspan": 7').replace('"rowspan": 6','"rowspan": 7').replace('"row": 11','"row": 46');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');  
                                                                                                                                                    
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 7','"colspan": 2').replace('"column": 0','"column": 2').replace('chart_11','chart_12').replace('"row": 46','"row": 5').replace('""rowspan": 7','"rowspan": 7');
                                        
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');
                                        
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 2','"colspan": 7').replace('"column": 2','"column": 7').replace('"row": 5','"row": 46');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');  
                                         
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"rowspan": 7','"rowspan": 6').replace('"colspan": 7','"colspan": 2').replace('"column": 7','"column": 0').replace('"row": 46','"row": 17');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');  
                                                                                                        
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 2','"colspan": 4').replace('"column": 0','"column": 4').replace('chart_12','chart_10').replace('"row": 17','"row": 5').replace('"rowspan": 6','"rowspan": 7');
                                        
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');
                                        
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 4','"colspan": 10').replace('"column": 4','"column": 14').replace('"row": 5','"row": 46');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');  
                                         
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"rowspan": 7','"rowspan": 6').replace('"colspan": 10','"colspan": 2').replace('"column": 14','"column": 0').replace('"row": 46','"row": 27');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');  
                                                                                                            
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 2','"colspan": #Colspans#').replace('"column": 0','"column": #Cloumns#').replace('chart_10','#charts#').replace('"row": 27','"row": #rows#').replace('"rowspan": 6','"rowspan": #rowspans#');
                                        
                                        String[] St1 = new String[]{'6','2','1'};
                                        String[] St2 = new String[]{'0','0','0'};
                                        String[] St3 = new String[]{'44','3','6'};
                                        
                                        String[] St5 = new String[]{'6','2','1'};
                                        integer j=0;
                                        for(String St : St1){
                                        Sales.Test5__c = Sales.Test5__c.replace('"colspan": #Cols#','"colspan": '+St).replace('"column": #colm#','"column": '+st2[j]).replace('"row": #rows#','"row": '+st3[j]);
                                        MarketingString =  MarketingString.replace(Sales.Test5__c,'');                                                                  
                                        Sales.Test5__c = Sales.Test5__c.replace('"colspan": '+St,'"colspan": #Cols#').replace('"column": '+st2[j],'"column": #colm#').replace('"row": '+st3[j],'"row": #rows#');
                                            j++;
                                        }
                                        
                                        
                                        integer k=0;
                                        for(String St : St1){
                                        Sales.Test6__c = Sales.Test6__c.replace('"colspan": #Cols#','"colspan": '+St).replace('"column": #colm#','"column": '+st5[k]).replace('"row": #rows#','"row": '+st3[k]);
                                        MarketingString =  MarketingString.replace(Sales.Test6__c,'');                                                                  
                                        Sales.Test6__c = Sales.Test6__c.replace('"colspan": '+St,'"colspan": #Cols#').replace('"column": '+st5[k],'"column": #colm#').replace('"row": '+st3[k],'"row": #rows#');
                                            k++;
                                        }
                                        
                                        String[] St8 = new String[]{'18','6','1'};
                                        String[] St9 = new String[]{'44','3','8'};                                      
                                        String[] St11 = new String[]{'12','4','0'};
                                        integer l=0;
                                        for(String St : St1){
                                        Sales.Test8__c = Sales.Test8__c.replace('"colspan": #Cols#','"colspan": '+St).replace('"column": #colm#','"column": '+st8[l]).replace('"row": #rows#','"row": '+St9[l]);
                                        MarketingString =  MarketingString.replace(Sales.Test8__c,'');                                                                  
                                        Sales.Test8__c = Sales.Test8__c.replace('"colspan": '+St,'"colspan": #Cols#').replace('"column": '+st8[l],'"column": #colm#').replace('"row": '+St9[l],'"row": #rows#');
                                            l++;
                                        }
                                        
                                        integer m=0;
                                        for(String St : St1){
                                        Sales.Test7__c = Sales.Test7__c.replace('"colspan": #Cols#','"colspan": '+St).replace('"column": #colm#','"column": '+st11[m]).replace('"row": #rows#','"row": '+st9[m]);
                                        MarketingString =  MarketingString.replace(Sales.Test7__c,'');                                                                  
                                        Sales.Test7__c = Sales.Test7__c.replace('"colspan": '+St,'"colspan": #Cols#').replace('"column": '+st11[m],'"column": #colm#').replace('"row": '+st9[m],'"row": #rows#');
                                            m++;
                                        }
                                        
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('#dateselector#','dateselector_14').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #column#','"column": 1').replace('"row": #rows#','"row": 3');
                                        //Sales.Chart_Delete__c = Sales.Chart_Delete__c.replace('"rowspan": #rowspans#','"rowspan": 6');
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');         
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 1').replace('"column": 1','"column": 4').replace('"row": 3','"row": 1');  
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 4','"column": 12').replace('"row": 1','"row": 42');    
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');                                                                   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 12','"column": #column#').replace('dateselector_14','#dateselector#').replace('"row": 42','"row": #rows#'); 
                                        
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('#dateselector#','dateselector_6').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 3');
                                        //Sales.Chart_Delete__c = Sales.Chart_Delete__c.replace('"rowspan": #rowspans#','"rowspan": 6');
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');         
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 1').replace('"column": 0','"column": 3').replace('"row": 3','"row": 1');  
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 3','"column": 9').replace('"row": 1','"row": 42'); 
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');                                                                   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 9','"column": #column#').replace('dateselector_6','#dateselector#').replace('"row": 42','"row": #rows#');
                                        //Sales.Chart_Delete__c = Sales.Chart_Delete__c.replace('"rowspan": 6','"rowspan": #rowspans#');
                                        
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('#dateselector#','dateselector_15').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 4');
                                        //Sales.Chart_Delete__c = Sales.Chart_Delete__c.replace('"rowspan": #rowspans#','"rowspan": 6');
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');         
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 1').replace('"column": 0','"column": 5').replace('"row": 4','"row": 1');  
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 5','"column": 15').replace('"row": 1','"row": 42');    
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');                                                                   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 15','"column": #column#').replace('dateselector_15','#dateselector#').replace('"row": 42','"row": #rows#'); 
                                        
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_22').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 18').replace('"row": #rows#','"row": 43');
                                        MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');                           
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_22','number_21').replace('"column": 18','"column": 12');    
                                        MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');                                     
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_21','number_20').replace('"column": 12','"column": 6'); 
                                        MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');                                         
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_20','number_10').replace('"column": 6','"column": 0'); 
                                        MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');                                                                                                         
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('number_10','#charts#').replace('"row": 43','"row": #rows#'); 
                                        
                                        
                                        Sales.View_Results__c = Sales.View_Results__c.replace('#texts#','text_25');
                                        String Strtx25 = '"text_25": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.View_Results__c,Strtx25);                                                                   
                                        Sales.View_Results__c = Sales.View_Results__c.replace('text_25','#texts#'); 
                                        
                                        Sales.View_Results_Text__c = Sales.View_Results_Text__c.replace('#texts#','text_25').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 42');
                                        MarketingString =  MarketingString.replace(Sales.View_Results_Text__c,'');  
                                        Sales.View_Results_Text__c = Sales.View_Results_Text__c.replace('text_25','text_25').replace('"colspan": 6','"colspan": 2').replace('"column": 0','"column": 0').replace('"row": 42','"row": 1');
                                        MarketingString =  MarketingString.replace(Sales.View_Results_Text__c,'');                                                                  
                                        Sales.View_Results_Text__c = Sales.View_Results_Text__c.replace('text_25','#texts#').replace('"colspan": 2','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 1','"row": #rows#');
                                        
                                        Sales.Sales_KPI_Headers__c = Sales.Sales_KPI_Headers__c.replace('#text#','text_24').replace('#SaleskPIs#','Sales KPI 4');
                                        String Strtx24 = '"text_24": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.Sales_KPI_Headers__c,Strtx24);                                                                  
                                        Sales.Sales_KPI_Headers__c = Sales.Sales_KPI_Headers__c.replace('text_24','#text#').replace('Sales KPI 4','#SaleskPIs#');  
                                        
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('#texts#','text_24').replace('"colspan": #Colspans#','"colspan": 8').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 0');
                                        MarketingString =  MarketingString.replace(Sales.Sales_Header_text__c,'');
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('text_24','text_24').replace('"colspan": 8','"colspan": 2').replace('"column": 0','"column": 0').replace('"row": 0','"row": 0');
                                        MarketingString =  MarketingString.replace(Sales.Sales_Header_text__c,'');  
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('text_24','text_24').replace('"colspan": 2','"colspan": 24').replace('"column": 0','"column": 0').replace('"row": 0','"row": 41');
                                        MarketingString =  MarketingString.replace(Sales.Sales_Header_text__c,'');                                                                  
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('text_24','#texts#').replace('"colspan": 24','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 41','"row": #rows#');
                                        
                                        Sales.Container__c = Sales.Container__c.replace('#container#','container_17');
                                        String Strcon27 = '"container_17": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.Container__c,Strcon27);                                                                  
                                        Sales.Container__c = Sales.Container__c.replace('container_17','#container#');  
                                        
                                        
                                        Sales.Container_Delete__c = Sales.Container_Delete__c.replace('#texts#','container_17').replace('"colspan": #Colspans#','"colspan": 24').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 43').replace('"rowspan": #rowspan#','"rowspan": 2');
                                        MarketingString =  MarketingString.replace(Sales.Container_Delete__c,'');  
                                        Sales.Container_Delete__c = Sales.Container_Delete__c.replace('container_17','container_17').replace('"colspan": 24','"colspan": 8').replace('"column": 0','"column": 0').replace('"row": 43','"row": 5').replace('"rowspan": 2','"rowspan": 2');
                                        MarketingString =  MarketingString.replace(Sales.Container_Delete__c,'');                                                               
                                        Sales.Container_Delete__c = Sales.Container_Delete__c.replace('container_17','#texts#').replace('"colspan": 8','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 5','"row": #rows#').replace('"rowspan": 2','"rowspan": #rowspan#');
                                        
                                        Sales.Container_Delete1__c = Sales.Container_Delete1__c.replace('#texts#','container_17').replace('"colspan": #Colspans#','"colspan": 2').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 5').replace('"rowspan": #rowspan#','"rowspan": 4');
                                        MarketingString =  MarketingString.replace(Sales.Container_Delete1__c,''); 
                                        Sales.Container_Delete1__c = Sales.Container_Delete1__c.replace('container_17','container_17').replace('"colspan": 2','"colspan": 8').replace('"column": 0','"column": 0').replace('"row": 5','"row": 5').replace('"rowspan": 4','"rowspan": 2');
                                        MarketingString =  MarketingString.replace(Sales.Container_Delete1__c,'');                                                              
                                        Sales.Container_Delete1__c = Sales.Container_Delete1__c.replace('container_17','#texts#').replace('"colspan": 8','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 5','"row": #rows#').replace('"rowspan": 2','"rowspan": #rowspan#');
                                        MarketingString =  MarketingString.replace(Sales.Container_Delete2__c,'').replace(Sales.Container1__c,Strcon27);     
                                        
                                    }
                                    
                                    if(Numbers == 3){
                                        
                                        String[] StNUmbers = new String[]{'number_19','number_9','number_8','number_7'};
                                        String[] Fields = new String[]{'#3AliasMeasureAPI4#','#3AliasMeasureAPI3#','#3AliasMeasureAPI2#','#3AliasMeasureAPI1#'};
                                        MarketingString =  MarketingString.replace(Sales.Sales_Chart_3__c,'').replace(Sales.Sales_KPI_3__c,'');
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('#texts#','text_19').replace('#StaticSales#','Static_Sales_KPI_'+ Numbers).replace('#labels#','label_1');
                                        String Strtx19 = '"text_19": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.Delete_All_Texts__c,Strtx19);
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_19','text_20').replace('label_1','label_2');
                                        String Strtx20 = '"text_20": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.Delete_All_Texts__c,Strtx20);
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_20','text_21').replace('label_2','label_3');
                                        String Strtx21 = '"text_21": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.Delete_All_Texts__c,Strtx21);                                       
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_21','text_45').replace('label_3','label_4');                                        
                                         String Strtx45 = '"text_45": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.Delete_All_Texts__c,Strtx45); 
                                        
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_45','#texts#').replace('label_4','#labels#').replace('Static_Sales_KPI_'+ Numbers,'#StaticSales#');
                                        
                                        integer i= 0;
                                        for(String St : StNUmbers){                                     
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Numbers#',St);
                                            Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"exploreLink": #falses#','"exploreLink": true').replace('"compact": #trues#','"compact": true');
                                       
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Fields#',Fields[i]).replace('#SalesKPIs#','Sales_KPI_3');
                                        String StrNumst = '"'+St+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.Sales_KPI_Delete__c,StrNumst);
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace(St,'#Numbers#').replace(Fields[i],'#Fields#').replace('Sales_KPI_3','#SalesKPIs#');
                                      
                                            Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"compact": true','"compact": #trues#').replace('"exploreLink": true','"exploreLink": #falses#');
                                       
                                        i++;
                                        }   
                                        
                                        
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('#listselectors#','listselector_51').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #Cloumns#','"column": 0').replace('"row": #rows#','"row": 10');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 0','"column": 4').replace('"row": 10','"row": 4').replace('listselector_51','listselector_47');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 4','"column": 16').replace('"row": 4','"row": 32').replace('listselector_47','listselector_37');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 16','"column": 0').replace('listselector_37','listselector_39').replace('"row": 32','"row": 2');   
                                        
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 1').replace('"column": 0','"column": 2').replace('"row": 2','"row": 1');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 3').replace('"column": 2','"column": 6').replace('"row": 1','"row": 29');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 6','"column": 0').replace('listselector_39','listselector_48').replace('"row": 29','"row": 9');   
                                        
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_48','listselector_44').replace('"colspan": 1','"colspan": 2').replace('"column": 0','"column": 0').replace('"row": 9','"row": 4');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_44','listselector_33').replace('"colspan": 2','"colspan": 3').replace('"column": 0','"column": 2').replace('"row": 4','"row": 32');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 2','"column": 1').replace('listselector_33','listselector_49').replace('"row": 32','"row": 9');
                                        
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_49','listselector_46').replace('"colspan": 1','"colspan": 2').replace('"column": 1','"column": 2').replace('"row": 9','"row": 4');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_46','listselector_18').replace('"colspan": 2','"colspan": 3').replace('"column": 2','"column": 9').replace('"row": 4','"row": 32');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 9','"column": 1').replace('listselector_18','listselector_50').replace('"row": 32','"row": 10');
                                        
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_50','listselector_45').replace('"colspan": 1','"colspan": 2').replace('"column": 1','"column": 6').replace('"row": 10','"row": 4');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_45','listselector_17').replace('"colspan": 2','"colspan": 3').replace('"column": 6','"column": 19').replace('"row": 4','"row": 32');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');                                                                              
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 19','"column": #Cloumns#').replace('listselector_17','#listselectors#').replace('"row": 32','"row": #rows#');  
                                        
                                    
                                            Sales.Pillbox__c = Sales.Pillbox__c.replace('#pillboxs#','pillbox_2').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #Cloumns#','"column": 1').replace('"row": #rows#','"row": 4');
                                            MarketingString =  MarketingString.replace(Sales.Pillbox__c,'');
                                            Sales.Pillbox__c = Sales.Pillbox__c.replace('pillbox_2','pillbox_6').replace('"colspan": 1','"colspan": 1').replace('"column": 1','"column": 7').replace('"row": 4','"row": 1');
                                            MarketingString =  MarketingString.replace(Sales.Pillbox__c,'');
                                            Sales.Pillbox__c = Sales.Pillbox__c.replace('pillbox_6','pillbox_4').replace('"colspan": 1','"colspan": 3').replace('"column": 7','"column": 21').replace('"row": 1','"row": 29');
                                            MarketingString =  MarketingString.replace(Sales.Pillbox__c,'');                                                                            
                                            Sales.Pillbox__c = Sales.Pillbox__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 21','"column": #Cloumns#').replace('pillbox_4','#pillboxs#').replace('"row": 29','"row": #rows#');  
                                            
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('#charts#','chart_7').replace('"colspan": #Colspans#','"colspan": 7').replace('"column": #Cloumns#','"column": 0').replace('"row": #rows#','"row": 33').replace('"rowspan": #rowspans#','"rowspan": 7');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');                                                                                                              
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 7','"colspan": #Colspans#').replace('"column": 0','"column": #Cloumns#').replace('chart_7','#charts#').replace('"row": 33','"row": #rows#').replace('""rowspan": 7','"rowspan": #rowspans#');
                                        
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('#charts#','chart_8').replace('"colspan": #Colspans#','"colspan": 7').replace('"column": #Cloumns#','"column": 7').replace('"row": #rows#','"row": 33').replace('"rowspan": #rowspans#','"rowspan": 7');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');  
                                                                        
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"row": 33','"row": 46').replace('"rowspan": 7','"rowspan": 6');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');  
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 7','"colspan": 2').replace('"column": 7','"column": 0').replace('"row": 46','"row": 17');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');                                                                                              
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 2','"colspan": #Colspans#').replace('"column": 0','"column": #Cloumns#').replace('chart_8','#charts#').replace('"row": 17','"row": #rows#').replace('"rowspan": 6','"rowspan": #rowspans#');
                                        
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('#charts#','chart_9').replace('"colspan": #Colspans#','"colspan": 4').replace('"column": #Cloumns#','"column": 4').replace('"row": #rows#','"row": 5').replace('"rowspan": #rowspans#','"rowspan": 7');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');
                                        
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 4','"colspan": 2').replace('"column": 4','"column": 0').replace('"row": 5','"row": 23').replace('"rowspan": 7','"rowspan": 6');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');  
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('chart_9','chart_18').replace('"rowspan": 6','"rowspan": 7').replace('"colspan": 2','"colspan": 10').replace('"column": 0','"column": 14').replace('"row": 23','"row": 33');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');                                                                      
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 10','"colspan": #Colspans#').replace('"column": 14','"column": #Cloumns#').replace('chart_18','#charts#').replace('"row": 33','"row": #rows#').replace('""rowspan": 7','"rowspan": #rowspans#'); 
                                        
                                        MarketingString =  MarketingString.replace(Sales.Test9__c,'').replace(Sales.Test10__c,'').replace(Sales.Test11__c,'').replace(Sales.Test12__c,'');
                                        
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('#dateselector#','dateselector_5').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #column#','"column": 3').replace('"row": #rows#','"row": 1');
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');         
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 1').replace('"column": 3','"column": 0').replace('"row": 1','"row": 3');   
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 0','"column": 9').replace('"row": 3','"row": 29');  
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');                                                                   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 9','"column": #column#').replace('dateselector_5','#dateselector#').replace('"row": 29','"row": #rows#');  
                                        
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('#dateselector#','dateselector_13').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #column#','"column": 4').replace('"row": #rows#','"row": 1');
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');         
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 1').replace('"column": 4','"column": 1').replace('"row": 1','"row": 3');   
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 1','"column": 12').replace('"row": 3','"row": 29'); 
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');                                                                   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 12','"column": #column#').replace('dateselector_13','#dateselector#').replace('"row": 29','"row": #rows#');
                          
                                        
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('#dateselector#','dateselector_12').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #column#','"column": 5').replace('"row": #rows#','"row": 1');
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');         
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 1').replace('"column": 5','"column": 0').replace('"row": 1','"row": 4');   
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 0','"column": 15').replace('"row": 4','"row": 29'); 
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');                                                                   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 15','"column": #column#').replace('dateselector_12','#dateselector#').replace('"row": 29','"row": #rows#');    
                                                  
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_19').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 18').replace('"row": #rows#','"row": 30');
                                        MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');       
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_19','number_9').replace('"colspan": 6','"colspan": 6').replace('"column": 18','"column": 12').replace('"row": 30','"row": 30');   
                                        MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');  
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_9','number_8').replace('"colspan": 6','"colspan": 6').replace('"column": 12','"column": 6').replace('"row": 30','"row": 30'); 
                                        MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,''); 
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_8','number_7').replace('"colspan": 6','"colspan": 6').replace('"column": 6','"column": 0').replace('"row": 30','"row": 30');  
                                        MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,''); 
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_7','number_3').replace('"colspan": 6','"colspan": 2').replace('"column": 0','"column": 4').replace('"row": 30','"row": 2');   
                                        MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');                                                                 
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 2','"colspan": #Colspans#').replace('"column": 4','"column": #column#').replace('number_3','#charts#').replace('"row": 2','"row": #rows#');
                                        
                
                                         Sales.View_Results__c = Sales.View_Results__c.replace('#texts#','text_18');
                                         String Strtx18 = '"text_18": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.View_Results__c,Strtx18);                                                                   
                                        Sales.View_Results__c = Sales.View_Results__c.replace('text_18','#texts#'); 
                                        
                                        Sales.View_Results_Text__c = Sales.View_Results_Text__c.replace('#texts#','text_18').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 29');
                                        MarketingString =  MarketingString.replace(Sales.View_Results_Text__c,'');                                                                                                      
                                        Sales.View_Results_Text__c = Sales.View_Results_Text__c.replace('text_18','#texts#').replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 29','"row": #rows#');
                                        
                                        
                                        Sales.Sales_KPI_Headers__c = Sales.Sales_KPI_Headers__c.replace('#text#','text_11').replace('#SaleskPIs#','Sales KPI 3');
                                        String Strtx11 = '"text_11": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        
                                        MarketingString =  MarketingString.replace(Sales.Sales_KPI_Headers__c,Strtx11);  
                                        Sales.Sales_KPI_Headers__c = Sales.Sales_KPI_Headers__c.replace('text_11','text_17').replace('Sales KPI 3','Sales KPI 3');
                                        String Strtx17 = '"text_17": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.Sales_KPI_Headers__c,Strtx17);                                                                  
                                        Sales.Sales_KPI_Headers__c = Sales.Sales_KPI_Headers__c.replace('text_17','#text#').replace('Sales KPI 3','#SaleskPIs#');  
                                        
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('#texts#','text_11').replace('"colspan": #Colspans#','"colspan": 8').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 0');
                                        MarketingString =  MarketingString.replace(Sales.Sales_Header_text__c,'');
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('text_11','text_11').replace('"colspan": 8','"colspan": 2').replace('"column": 0','"column": 0').replace('"row": 0','"row": 0');
                                        MarketingString =  MarketingString.replace(Sales.Sales_Header_text__c,'');
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('text_11','text_17').replace('"colspan": 2','"colspan": 24').replace('"column": 0','"column": 0').replace('"row": 0','"row": 28');
                                        MarketingString =  MarketingString.replace(Sales.Sales_Header_text__c,'');                                                                  
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('text_17','#texts#').replace('"colspan": 24','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 28','"row": #rows#');
                                            
                                        Sales.Container__c = Sales.Container__c.replace('#container#','container_13');
                                        String Strcon13 = '"container_13": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.Container__c,Strcon13);                                                                  
                                        Sales.Container__c = Sales.Container__c.replace('container_13','#container#');  
                                        
                                        Sales.Container_Delete__c = Sales.Container_Delete__c.replace('#texts#','container_13').replace('"colspan": #Colspans#','"colspan": 24').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 30').replace('"rowspan": #rowspan#','"rowspan": 2');
                                        MarketingString =  MarketingString.replace(Sales.Container_Delete__c,'');                                                               
                                        Sales.Container_Delete__c = Sales.Container_Delete__c.replace('container_13','#texts#').replace('"colspan": 24','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 30','"row": #rows#').replace('"rowspan": 2','"rowspan": #rowspan#');
                                         MarketingString =  MarketingString.replace(Sales.container2__c,Strcon13);    
                                    }
                                    
                                    if(Numbers == 2 ){
                                        
                                         Sales.View_Results__c = Sales.View_Results__c.replace('#texts#','text_12');
                                         String Strtxt12 = '"text_12": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                        MarketingString =  MarketingString.replace(Sales.View_Results__c,Strtxt12);                                                                   
                                        Sales.View_Results__c = Sales.View_Results__c.replace('text_12','#texts#');  
                                        
                                        Sales.View_Results_Text__c = Sales.View_Results_Text__c.replace('#texts#','text_12').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 16');
                                        MarketingString =  MarketingString.replace(Sales.View_Results_Text__c,'');   
                                        Sales.View_Results_Text__c = Sales.View_Results_Text__c.replace('text_12','text_12').replace('"colspan": 6','"colspan": 2').replace('"column": 0','"column": 0').replace('"row": 16','"row": 1');
                                        MarketingString =  MarketingString.replace(Sales.View_Results_Text__c,'');                                                                  
                                        Sales.View_Results_Text__c = Sales.View_Results_Text__c.replace('text_12','#texts#').replace('"colspan": 2','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 1','"row": #rows#');
                                                
                                                
                                                
                                        String[] StNUmbers = new String[]{'number_5','number_4','number_6','number_18'};
                                        String[] Fields = new String[]{'#2AliasMeasureAPI2#','#2AliasMeasureAPI1#','#2AliasMeasureAPI3#','#2AliasMeasureAPI4#'};
                                        MarketingString =  MarketingString.replace(Sales.Sales_KPI_2__c,'').replace(Sales.Sales_Chart_2__c,'');
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('#texts#','text_13').replace('#StaticSales#','Static_Sales_KPI_'+ Numbers).replace('#labels#','label_1');
                                        String Strtxt13 = '"text_13": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.Delete_All_Texts__c,Strtxt13);
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_13','text_4').replace('label_1','label_2');
                                        String Strtxt4 = '"text_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.Delete_All_Texts__c,Strtxt4);
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_4','text_15').replace('label_2','label_3');
                                        String Strtxt15 = '"text_15": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.Delete_All_Texts__c,Strtxt15);                                   
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_15','text_44').replace('label_3','label_4');                                        
                                        String Strtxt44 = '"text_44": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.Delete_All_Texts__c,Strtxt44);                                   
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_44','#texts#').replace('label_4','#labels#').replace('Static_Sales_KPI_'+ Numbers,'#StaticSales#');
                                        
                                        integer i= 0;
                                        for(String St : StNUmbers){                                     
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Numbers#',St);
                                        if(St == 'number_28'){                                           
                                            Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"exploreLink": #falses#','"exploreLink": true').replace('"compact": #trues#','"compact": false'); 
                                        }
                                        else{
                                            
                                            Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"exploreLink": #falses#','"exploreLink": true').replace('"compact": #trues#','"compact": true');
                                        }
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Fields#',Fields[i]).replace('#SalesKPIs#','Sales_KPI_2');
                                        String Strtnum44 = '"'+St+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.Sales_KPI_Delete__c,Strtnum44);
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace(St,'#Numbers#').replace(Fields[i],'#Fields#').replace('Sales_KPI_2','#SalesKPIs#');
                                        if(St == 'number_28'){
                                            Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"compact": false','"compact": #trues#').replace('"exploreLink": true','"exploreLink": #falses#');
                                        }
                                        else{
                                            Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"compact": true','"compact": #trues#').replace('"exploreLink": true','"exploreLink": #falses#');
                                        }
                                        i++;
                                        }
                                        
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('#listselectors#','listselector_12').replace('"colspan": #Colspans#','"colspan": 3').replace('"column": #Cloumns#','"column": 18').replace('"row": #rows#','"row": 16');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_12','listselector_12').replace('"colspan": 3','"colspan": 1').replace('"column": 18','"column": 6').replace('"row": 16','"row": 1');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_12','listselector_12').replace('"colspan": 1','"colspan": 1').replace('"column": 6','"column": 1').replace('"row": 1','"row": 2');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_12','#listselectors#').replace('"colspan": 1','"colspan": #Colspans#').replace('"column": 1','"column": #Cloumns#').replace('"row": 2','"row": #rows#');
                                        
                                        
                                        
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('#listselectors#','listselector_22').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #Cloumns#','"column": 0').replace('"row": #rows#','"row": 10');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 0','"column": 4').replace('"row": 10','"row": 4');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 4','"column": 16').replace('"row": 4','"row": 19');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 16','"column": 0').replace('listselector_22','listselector_38').replace('"row": 19','"row": 2');
                                        
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 1').replace('"column": 0','"column": 2').replace('"row": 2','"row": 1');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 3').replace('"column": 2','"column": 6').replace('"row": 1','"row": 16');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 6','"column": 0').replace('listselector_38','listselector_28').replace('"row": 16','"row": 9');   
                                                                        
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"row": #rows#','"row": 9');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 0','"column": 0').replace('"row": 9','"row": 4');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 0','"column": 2').replace('"row": 4','"row": 19');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 2','"column": 1').replace('listselector_28','listselector_13').replace('"row": 19','"row": 9');
                                        
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 1','"column": 2').replace('"row": 9','"row": 4');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 2','"column": 9').replace('"row": 4','"row": 19');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 9','"column": 1').replace('listselector_13','listselector_14').replace('"row": 19','"row": 10');
                                        
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 1','"column": 6').replace('"row": 10','"row": 4');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 6','"column": 19').replace('"row": 4','"row": 19');
                                        MarketingString =  MarketingString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 19','"column": #Cloumns#').replace('listselector_14','#listselectors#').replace('"row": 19','"row": #rows#');
                                    
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('#charts#','chart_4').replace('"colspan": #Colspans#','"colspan": 2').replace('"column": #Cloumns#','"column": 0').replace('"row": #rows#','"row": 5').replace('"rowspan": #rowspans#','"rowspan": 7');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');                              
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"row": 5','"row": 11').replace('"rowspan": 7','"rowspan": 6');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 2','"colspan": 7').replace('"row": 11','"row": 20').replace('"rowspan": 6','"rowspan": 7');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');                                                                                                          
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 7','"colspan": 2').replace('"column": 0','"column": 2').replace('chart_4','chart_5').replace('"row": 20','"row": 5').replace('""rowspan": 7','"rowspan": 7');
                                        
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 2','"colspan": 2').replace('"column": 2','"column": 0').replace('"row": 5','"row": 17').replace('"rowspan": 7','"rowspan": 6');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');  
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 2','"colspan": 7').replace('"column": 0','"column": 7').replace('"row": 17','"row": 20').replace('"rowspan": 6','"rowspan": 7');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');                                                                                          
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 7','"colspan": 4').replace('"column": 7','"column": 4').replace('chart_5','chart_22').replace('"row": 20','"row": 5').replace('"rowspan": 7','"rowspan": 7');
                                        
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 4','"colspan": 2').replace('"column": 4','"column": 0').replace('"row": 5','"row": 23').replace('"rowspan": 7','"rowspan": 6');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');  
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('chart_9','chart_18').replace('"rowspan": 6','"rowspan": 7').replace('"colspan": 2','"colspan": 10').replace('"column": 0','"column": 14').replace('"row": 23','"row": 20');
                                        MarketingString =  MarketingString.replace(Sales.Chart_Delete1__c,'');                                                                      
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 10','"colspan": #Colspans#').replace('"column": 14','"column": #Cloumns#').replace('chart_22','#charts#').replace('"row": 20','"row": #rows#').replace('""rowspan": 7','"rowspan": #rowspans#'); 
                                        
                                         String[] St1 = new String[]{'6','2','1'};
                                        String[] St2 = new String[]{'0','0','0'};
                                        String[] St3 = new String[]{'18','3','6'};
                                        
                                        String[] St5 = new String[]{'6','2','1'};
                                        integer j=0;
                                        for(String St : St1){
                                        Sales.Test13__c = Sales.Test13__c.replace('"colspan": #Cols#','"colspan": '+St).replace('"column": #colm#','"column": '+st2[j]).replace('"row": #rows#','"row": '+st3[j]);
                                        MarketingString =  MarketingString.replace(Sales.Test13__c,'');                                                                 
                                        Sales.Test13__c = Sales.Test13__c.replace('"colspan": '+St,'"colspan": #Cols#').replace('"column": '+st2[j],'"column": #colm#').replace('"row": '+st3[j],'"row": #rows#');
                                            j++;
                                        }
                                        
                                        
                                        integer k=0;
                                        for(String St : St1){
                                        Sales.Test14__c = Sales.Test14__c.replace('"colspan": #Cols#','"colspan": '+St).replace('"column": #colm#','"column": '+st5[k]).replace('"row": #rows#','"row": '+st3[k]);
                                        MarketingString =  MarketingString.replace(Sales.Test14__c,'');                                                                 
                                        Sales.Test14__c = Sales.Test14__c.replace('"colspan": '+St,'"colspan": #Cols#').replace('"column": '+st5[k],'"column": #colm#').replace('"row": '+st3[k],'"row": #rows#');
                                            k++;
                                        }
                                        
                                        String[] St8 = new String[]{'18','6','1'};
                                        String[] St9 = new String[]{'18','3','8'};                                      
                                        String[] St11 = new String[]{'12','4','0'};
                                        integer l=0;
                                        for(String St : St1){
                                        Sales.Test16__c = Sales.Test16__c.replace('"colspan": #Cols#','"colspan": '+St).replace('"column": #colm#','"column": '+st8[l]).replace('"row": #rows#','"row": '+St9[l]);
                                        MarketingString =  MarketingString.replace(Sales.Test16__c,'');                                                             
                                        Sales.Test16__c = Sales.Test16__c.replace('"colspan": '+St,'"colspan": #Cols#').replace('"column": '+st8[l],'"column": #colm#').replace('"row": '+St9[l],'"row": #rows#');
                                            l++;
                                        }
                                        
                                        integer m=0;
                                        for(String St : St1){
                                        Sales.Test15__c = Sales.Test15__c.replace('"colspan": #Cols#','"colspan": '+St).replace('"column": #colm#','"column": '+st11[m]).replace('"row": #rows#','"row": '+st9[m]);
                                        MarketingString =  MarketingString.replace(Sales.Test15__c,'');                                                             
                                        Sales.Test15__c = Sales.Test15__c.replace('"colspan": '+St,'"colspan": #Cols#').replace('"column": '+st11[m],'"column": #colm#').replace('"row": '+st9[m],'"row": #rows#');
                                            m++;
                                        }
                                          
                                        Sales.Pillbox__c = Sales.Pillbox__c.replace('#pillboxs#','pillbox_3').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #Cloumns#','"column": 1').replace('"row": #rows#','"row": 4');
                                        MarketingString =  MarketingString.replace(Sales.Pillbox__c,'');
                                        Sales.Pillbox__c = Sales.Pillbox__c.replace('"colspan": 1','"colspan": 1').replace('"column": 1','"column": 7').replace('"row": 4','"row": 1');
                                        MarketingString =  MarketingString.replace(Sales.Pillbox__c,'');
                                        Sales.Pillbox__c = Sales.Pillbox__c.replace('"colspan": 1','"colspan": 3').replace('"column": 7','"column": 21').replace('"row": 1','"row": 16');
                                        MarketingString =  MarketingString.replace(Sales.Pillbox__c,'');                                                                            
                                        Sales.Pillbox__c = Sales.Pillbox__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 21','"column": #Cloumns#').replace('pillbox_3','#pillboxs#').replace('"row": 16','"row": #rows#');   
                                        
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('#dateselector#','dateselector_4').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 3');
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');         
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 0','"column": 9').replace('"row": 3','"row": 16');  
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 3','"colspan": 1').replace('"column": 9','"column": 3').replace('"row": 16','"row": 1');  
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');                                                                   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": #Colspans#').replace('"column": 3','"column": #column#').replace('dateselector_4','#dateselector#').replace('"row": 1','"row": #rows#');   
                                        
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('#dateselector#','dateselector_11').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #column#','"column": 1').replace('"row": #rows#','"row": 3');
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');         
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 1').replace('"column": 1','"column": 4').replace('"row": 3','"row": 1');   
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 4','"column": 12').replace('"row": 1','"row": 16');   
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');                                                                 
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 12','"column": #column#').replace('dateselector_11','#dateselector#').replace('"row": 16','"row": #rows#');
                                        
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('#dateselector#','dateselector_10').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 4');                          
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');         
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 1').replace('"column": 0','"column": 5').replace('"row": 4','"row": 1');   
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,''); 
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 5','"column": 15').replace('"row": 1','"row": 16');   
                                        MarketingString =  MarketingString.replace(Sales.Date_Selector_Delete__c,'');                                                                   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 15','"column": #column#').replace('dateselector_10','#dateselector#').replace('"row": 16','"row": #rows#');  
                                        
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_4').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 17');
                                        MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');       
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_4','number_5').replace('"colspan": 6','"colspan": 6').replace('"column": 0','"column": 6').replace('"row": 17','"row": 17');  
                                        MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');  
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_5','number_6').replace('"colspan": 6','"colspan": 6').replace('"column": 6','"column": 12').replace('"row": 17','"row": 17'); 
                                        MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,''); 
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_6','number_18').replace('"colspan": 6','"colspan": 6').replace('"column": 12','"column": 18').replace('"row": 17','"row": 17');   
                                        MarketingString =  MarketingString.replace(Sales.Number_Delete1__c,'');                                                                 
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 12','"column": #column#').replace('number_18','#charts#').replace('"row": 17','"row": #rows#');
                                        
                                         //Sales_KPI_Headers__c,Sales_Header_text__c 
                                        // System.debug('text_17*******************'+ Sales.Sales_KPI_Headers__c);
                                        Sales.Sales_KPI_Headers__c = Sales.Sales_KPI_Headers__c.replace('#text#','text_10').replace('#SaleskPIs#','Sales KPI 2');
                                        String Strtxt10 = '"text_10": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.Sales_KPI_Headers__c,Strtxt10);                                                                  
                                        Sales.Sales_KPI_Headers__c = Sales.Sales_KPI_Headers__c.replace('text_10','#text#').replace('Sales KPI 2','#SaleskPIs#');  
                                        
                                      //  System.debug('text_17111*******************'+ Sales.Sales_KPI_Headers__c);
                                        
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('#texts#','text_10').replace('"colspan": #Colspans#','"colspan": 24').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 15');
                                        MarketingString =  MarketingString.replace(Sales.Sales_Header_text__c,'');                                                              
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('text_10','#texts#').replace('"colspan": 24','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 15','"row": #rows#');
                                        
                                        //Container__c,Container_Delete__c,Container_Delete1__c,
                                        Sales.Container__c = Sales.Container__c.replace('#container#','container_9');
                                        String Strcon9 = '"container_9": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        MarketingString =  MarketingString.replace(Sales.Container__c,Strcon9);                                                                  
                                        Sales.Container__c = Sales.Container__c.replace('container_9','#container#');  
                                        
                                        Sales.Container_Delete__c = Sales.Container_Delete__c.replace('#texts#','container_9').replace('"colspan": #Colspans#','"colspan": 24').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 17').replace('"rowspan": #rowspan#','"rowspan": 2');
                                        MarketingString =  MarketingString.replace(Sales.Container_Delete__c,'');                                                                  
                                        Sales.Container_Delete__c = Sales.Container_Delete__c.replace('container_9','#texts#').replace('"colspan": 24','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 17','"row": #rows#').replace('"rowspan": 2','"rowspan": #rowspan#');
                                        
                                        Sales.Container_Delete1__c = Sales.Container_Delete1__c.replace('#texts#','container_9').replace('"colspan": #Colspans#','"colspan": 2').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 5').replace('"rowspan": #rowspan#','"rowspan": 4');
                                        MarketingString =  MarketingString.replace(Sales.Container_Delete1__c,'');                                                               
                                        Sales.Container_Delete1__c = Sales.Container_Delete1__c.replace('container_9','#texts#').replace('"colspan": 2','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 5','"row": #rows#').replace('"rowspan": 4','"rowspan": #rowspan#');
                                               
                                    }
                                                                                                                                            
                }                   
            }
            
          MarketingString = MarketingString.replaceAll('\\s+\\s+','#testcode#'); 
            MarketingString = MarketingString.replaceAll('#testcode#',' ');         
          MarketingString = MarketingString.replace('}, ]','}]').replace('}, ,','},').replace('}, , ,','},').replace('}, , , ,','},');     
            MarketingString = MarketingString.replace('}", ]','}"]');
            MarketingString = MarketingString.replace('}, }','}}');
            MarketingString = MarketingString.replace('}, , ]','}]').replace('}, ]','} ]').replace('}, , , ]','} ]');
            MarketingString = MarketingString.replace('[ , ,','[');
            MarketingString = MarketingString.replace('[ ,','[').replace(', },','},');
             
                      
            MarketingString = MarketingString.replace(', #TestCodes#','');  
            MarketingString = MarketingString.replace('"type": "container"},  "type": "container"},','"type": "container"},');
         MarketingString = MarketingString.replace('"type": "container" },"type": "container"},','"type": "container"},');
         MarketingString = MarketingString.replace('"type": "container" }, "type": "container" },','"type": "container"},'); 
        //     System.debug('^^^^^^^' + MarketingString);
            return null;
        }
        /****************** Marketing String **********************************/  
        
    public Static String SalesString(String DashboardId,list<String> FolderId,String Allval,String Salesval,String sessionId){      
        Sales_Insight__c Sales = [select id,DataSet_Delete__c,Sales_insight_String5__c,Delete_All_Group__c,Delete_All_Orders__c,Sales_KPI_Delete__c,Number_Delete1__c,ListSelector__c,Lis_Selector36__c,Sales_insight_Day_Delete__c,Sales_Insight_String2__c,Delete_All_Lists__c,Sales_Insight_String3__c,Delete_List_Selector__c,Sales_Insight_Delete2__c,List_Selector6__c,Grouping_label_Delete__c,Delete_All_Group5__c,Grouping_Delete__c,Delete_All_Timeline1__c,Number_Delete2__c,Sales_Insight_Delete3__c,Container_Delete2__c,Grouping_Selectors__c,Delete_All_Timeline2__c,Date_label_Delete__c,Delete_All_Timeline3__c,Number_Delete3__c,Number_Delete4__c,Chart_Delete14__c,Date_Selector__c,Delete_All_Timeline4__c,Delete_All_dateselector1__c,Sales_Date_Delete__c,Delete_pillbox__c,Delete_All_dateselectors__c,Dates_Delete__c,Delete_All_Timeline__c,Delete_All_Dates__c,Sales_Insight_Measure_Delete__c,Delete_All_Measures__c,Chart_Delete2__c,Chart_Delete24__c,Measure_List_Selector__c,Measures_Delete__c,Delete_All_Texts__c,Sales_Insight_Filter_Delete__c,Delete_All_Static_KPIs__c,Delete_All_Chart4__c,Container1__c,Container2__c,Container3__c,number_33__c,number_34__c,Sales_KPI_1__c,Sales_KPI_2__c,Sales_KPI_3__c,Sales_KPI_4__c,Sales_KPI_5__c,Sales_Chart_1__c,Sales_Chart_2__c,Sales_Chart_3__c,Sales_Chart_4__c,Sales_Chart_5__c,Container__c,Container_Delete__c,Container_Delete1__c,Delete_All_Chart__c,Delete_All_Chart1__c,Delete_All_Chart2__c,Delete_All_Chart3__c,List_Selector__c,Pillbox__c,Date_Selector_Delete__c,Chart_Delete__c,Text_Delete__c,Chart_Delete1__c,Test1__c,Test2__c,Test3__c,Test4__c,Test5__c,Test6__c,Test7__c,Test8__c,Test9__c,Test10__c,Test11__c,Test12__c,Test13__c,Test14__c,Test15__c,Test16__c,Sales_Insight_String4__c,Delete_List_Selector43__c,List_Selector43__c,Delete_List_Selector53__c,View_Results__c,View_Results_Text__c,List_Selector53__c,Sales_KPI_Headers__c,Sales_Header_text__c,Sales_insight_String1__c from Sales_Insight__c where  id=:Allval limit 1];    
        list<Dataset__c> DatsetList = new list<Dataset__c>();
        String SalesString = '';
        integer salsnumstr;
        integer salsnumend;
        if(Salesval == 'Sales'){
            DatsetList = [select id,Data_API__c,RowNumber__c,KPI_Name__c,Dataset_Id__c,Date_Label__c,Filter_Logics__c,Measure_API__c,Measure_Name__c,Dataset_Name__c,Dimension_Api__c, Dimension_Name__c,AliasMeasure_API__c,CompactMeasure_API__c,Session_Id__c,FilterName__c from Dataset__c where Session_Id__c =: sessionId order by RowNumber__c limit 5]; 
            SalesString =  Sales.DataSet_Delete__c +Sales.Sales_Insight_String5__c + Sales.Sales_insight_String2__c + Sales.Sales_insight_String3__c +Sales.Grouping_label_Delete__c + Sales.Sales_insight_String4__c + Sales.Grouping_Delete__c ; 
            salsnumstr = 1;
            salsnumend = 5;
        }
        else if(Salesval == 'Market'){
            DatsetList = [select id,Data_API__c,RowNumber__c,KPI_Name__c,FilterName__c,Dataset_Id__c,Date_Label__c,Filter_Logics__c,Measure_API__c,Measure_Name__c,Dataset_Name__c,Dimension_Api__c, Dimension_Name__c,AliasMeasure_API__c,CompactMeasure_API__c from Dataset__c  where Session_Id__c =: sessionId order by RowNumber__c Desc limit 5];                              
            SalesString = Sales.DataSet_Delete__c +Sales.Measures_Delete__c + Sales.Sales_insight_String2__c + Sales.Sales_insight_String3__c + Sales.Grouping_label_Delete__c+ Sales.Sales_insight_String4__c + Sales.Grouping_Delete__c ; 
            salsnumstr = 11;
            salsnumend = 15;
        }
        else if(Salesval == 'Success'){
            DatsetList = [select id,Data_API__c,RowNumber__c,KPI_Name__c,FilterName__c,Dataset_Id__c,Date_Label__c,Filter_Logics__c,Measure_API__c,Measure_Name__c,Dataset_Name__c,Dimension_Api__c, Dimension_Name__c,AliasMeasure_API__c,CompactMeasure_API__c from Dataset__c  where Session_Id__c =: sessionId order by RowNumber__c limit 10];                              
            SalesString =Sales.DataSet_Delete__c +Sales.Sales_Insight_String1__c + Sales.Sales_insight_String2__c + Sales.Sales_insight_String3__c +Sales.Grouping_label_Delete__c + Sales.Sales_insight_String4__c + Sales.Grouping_Delete__c ; 
            salsnumstr = 6;
            salsnumend = 10;
        }
        Integer RowNumber;
        String Datasetname;
        String DatasetId;
        // SalesString = SalesString .replace('"description": "CDB",','"description": "CDB","id" : "0FK36000000MN2EGAW",');
        set<String> AllRownumbers = new set<String>();
        for(Dataset__c DatasetRec : DatsetList){
            AllRownumbers.add(String.valueof(DatasetRec.Rownumber__c));
        }
        for(integer RowNumberlist=salsnumstr;RowNumberlist<=salsnumend;RowNumberlist++){
            if(AllRownumbers.contains(String.valueof(RowNumberlist))){  
                for(Dataset__c DatasetRec : DatsetList){ 
                    if(RowNumberlist == Integer.valueof(DatasetRec.Rownumber__c)){
                        RowNumber = Integer.valueof(DatasetRec.Rownumber__c);
                      if(Salesval == 'Market'){
                          RowNumber = Integer.valueof(DatasetRec.Rownumber__c -10);
                     }
                     else  if(Salesval == 'Success'){
                          RowNumber = Integer.valueof(DatasetRec.Rownumber__c -5);
                     }
                     else{
                             RowNumber = Integer.valueof(DatasetRec.Rownumber__c);
                     }
                     
                    if(DatasetRec.KPI_Name__c != Null){
                        SalesString =  SalesString.replace('"KPI '+RowNumber+'"','"'+DatasetRec.KPI_Name__c+'"');
                    }
                     if(FolderId[1] != Null && FolderId[1] != ''){
                            if(Salesval == 'Market'){
                                  SalesString = SalesString.replace('Marketing Insights',FolderId[1]);
                                  SalesString = SalesString.replace('"Marketing"','"'+FolderId[1]+'"');
                                   if(FolderId[4] != Null && FolderId[4] != ''){
                                  SalesString = SalesString.replace('"Success"','"'+FolderId[4]+'"');
                                   }
                                    if(FolderId[3] != Null && FolderId[3] != ''){
                                  SalesString = SalesString.replace('"Sales"','"'+FolderId[3]+'"');
                                    }
                                    
                                    
                             }
                             else  if(Salesval == 'Success'){
                                  SalesString = SalesString.replace('Success Insights',FolderId[1]);
                                  SalesString = SalesString.replace('"Success"','"'+FolderId[1]+'"'); 
                                  if(FolderId[3] != Null && FolderId[3] != ''){
                                    SalesString = SalesString.replace('"Sales"','"'+FolderId[3]+'"');
                                  }
                                  if(FolderId[4] != Null && FolderId[4] != ''){
                                    SalesString = SalesString.replace('"Marketing"','"'+FolderId[4]+'"');
                                  }
                             }
                             else{
                                    SalesString = SalesString.replace('Sales Insights',FolderId[1]); 
                                    SalesString = SalesString.replace('"Sales"','"'+FolderId[1]+'"');
                                    if(FolderId[3] != Null && FolderId[3] != ''){
                                        SalesString = SalesString.replace('"Success"','"'+FolderId[3]+'"');
                                    }
                                    if(FolderId[4] != Null && FolderId[4] != ''){
                                        SalesString = SalesString.replace('"Marketing"','"'+FolderId[4]+'"');
                                    }
                         }
                       }
                       
                       if(FolderId.size() >= 6){
                                        SalesString = SalesString.replace('NewDashboardBuilderTwo',FolderId[8]);
                                        SalesString = SalesString.replace('NewDashboardBuilderThree',FolderId[6]);
                                        SalesString = SalesString.replace('NewDashboardBuilderOne',FolderId[7]);
                                        SalesString = SalesString.replace('NewDashboardBuilderFour',FolderId[5]);
                                        SalesString = SalesString.replace('"mobileDisabled": false,','');
                                       }
                       
                       
                     set<String> NewSet = new set<String>();
                    list<String> Newlist = new list<String>();
                    Map<String,String> NewMap= new Map<String,String>();
                    String[] Dimensions = new String[]{};
                    String[] DimensionApi = new String[]{};
                    if(DatasetRec.Dimension_Name__c != Null){
                        Dimensions = DatasetRec.Dimension_Name__c.Split(',');
                    }
                    if(DatasetRec.Dimension_Api__c != Null){
                        DimensionApi = DatasetRec.Dimension_Api__c.Split(',');
                    } 
                    String[] Datelabel = new String[]{};
                    String[] DateApi =new String[]{};
                    String[]  measureLabel = new String[]{};
                    String[]  MeasureAPI = new String[]{};
                    String[] AliasMeasureAPI = new String[]{};
                    String[] CompactMeasureAPI = new String[]{};
                    if(DatasetRec.Date_Label__c != null){
                        Datelabel = DatasetRec.Date_Label__c.Split(',');
                    }
                    if(DatasetRec.Data_API__c != Null){
                        DateApi = DatasetRec.Data_API__c.Split(',');
                    }
                    if(DatasetRec.Measure_Name__c != null){
                        measureLabel = DatasetRec.Measure_Name__c.Split(',');
                         MeasureAPI = DatasetRec.Measure_API__c.Split(',');
                        AliasMeasureAPI = DatasetRec.AliasMeasure_API__c.Split(',');
                        DatasetRec.CompactMeasure_API__c = DatasetRec.CompactMeasure_API__c.replace('],[','];[');               
                        CompactMeasureAPI = DatasetRec.CompactMeasure_API__c.Split(';');
                    }
                     String Numbers = String.valueof(RowNumber); 
                    SalesString = SalesString.replaceAll('\\s+\\s+','#testcode#').replaceAll('#testcode#',' '); 
                    if(Dimensions.Size() > 0){               
                        integer i = 1;  
                        integer j = 8;
                        for(String Dim : Dimensions){
                            integer k = i-1;
                           SalesString =  SalesString.replace('#'+RowNumber+'label'+ i +'#',Dim).replace('#'+RowNumber+'alias'+ i+'#',DimensionApi[k]);             
                           i = i+1;
                        }
                        for(Integer L=i;J >= L;L++){
                             integer k = L;
                             if(K == 8){
                                 String Dimens = ', "{\\"display\\": \\"#'+RowNumber+'label'+k+'#\\",\\"value\\": \\"#'+RowNumber+'alias'+k+'#\\",\\"expression\\": \\"\'#'+RowNumber+'alias'+k+'#\'\\",\\"alias\\": \\"#'+RowNumber+'alias'+k+'#\\"}"';
                                  String DimenGrp2 = 'q = filter q by {{column(KPI'+RowNumber+'_KPI'+RowNumber+'_Grouping_'+k+'.selection, [\\\\\\"#'+RowNumber+'alias'+k+'#\\\\\\"]).asEquality(\\\\\\"#'+RowNumber+'alias'+k+'#\\\\\\")}};';
                           
                                 SalesString =  SalesString.replace(Dimens,'').replace(DimenGrp2,'');
                             }
                            else{
                                 String Dimens = ', "{\\"display\\": \\"#'+RowNumber+'label'+k+'#\\",\\"value\\": \\"#'+RowNumber+'alias'+k+'#\\",\\"expression\\": \\"\'#'+RowNumber+'alias'+k+'#\'\\",\\"alias\\": \\"#'+RowNumber+'alias'+k+'#\\"}"';
                                 SalesString =  SalesString.replace(Dimens,'');
                            }
                            String Dimen = 'q = filter q by {{column(KPI'+RowNumber+'_Filter_'+k+'.selection, [\\\\\\"#'+RowNumber+'alias'+k+'#\\\\\\"]).asEquality(\\\\\\"#'+RowNumber+'alias'+k+'#\\\\\\")}};';
                            String DimenGrp = 'q = filter q by {{column(KPI'+RowNumber+'_Grouping_'+k+'.selection, [\\\\\\"#'+RowNumber+'alias'+k+'#\\\\\\"]).asEquality(\\\\\\"#'+RowNumber+'alias'+k+'#\\\\\\")}};';
                            String Dimens1 = '"KPI'+RowNumber+'_Filter_'+K+'": { "datasets": [{ "id": "#'+RowNumber+'DatasetId#", "name": "#'+RowNumber+'DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"measures\\":[[\\"count\\",\\"*\\"]],\\"groups\\":[\\"{{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0,\\\\\\"alias'+K+'\\\\\\").asObject()}}\\"]}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": false, "visualizationParameters": {} },';
                            String Dimensionval = ',\\"value'+k+'\\": \\"\'#'+RowNumber+'alias'+k+'#\'\\",\\"alias'+k+'\\": \\"#'+RowNumber+'alias'+k+'#\\",\\"label'+k+'\\": \\"#'+RowNumber+'label'+k+'#\\"';     
                            
                            SalesString =  SalesString.replace(Dimen,'').replace(DimenGrp,'').replace(Dimens1,'').replace(Dimensionval,'');
                            
                            String DimenVal;
                            String DimenFil1;
                            String DimenFil2;
                            String DimenFil3;
                            String DimenFil4;
                            String DimenVal5;
                            String DimenFil6;
                            String DimenFil7;
                            String DimenFil8;
                            String DimenFil9;
                            String DimenFil10;
                            String DimenFil11;
                            String DimenFil12;
                            String StrNew = '';
                            String StrNew1 = '';
                            String StrNew2 = '';
                            String Strs = '';
                            if(k==8){
                              DimenVal = '"KPI'+RowNumber+'_Filter_8": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "KPI'+RowNumber+'_Filter_8", "title": "#'+RowNumber+'label8#" }, "type": "listselector" },';  
                                DimenFil1 = '{ "colspan": 2, "column": 1, "name": "Filter_8", "row": 14, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(230, 236, 242, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil2 = '{ "colspan": 1, "column": 1, "name": "Filter_8", "row": 8, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil3 = '{ "colspan": 1, "column": 3, "name": "Filter_8", "row": 5, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                
                               // DimenVal5 = '"KPI'+RowNumber+'_Chart_8": { "parameters": { "autoFitMode": "none", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "visualizationType": "hbar", "exploreLink": true, "title": { "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "referenceLine": null }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "referenceLine": null }, "step": "Grouping_8", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "" } }, "type": "chart" },';
                                DimenVal5 = '"KPI'+RowNumber+'_Chart_8": { "parameters": { "autoFitMode": "none", "totalValue": "computeTotal", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "tooltip": { "showBinLabel": true, "measures": "", "showPercentage": true, "showDimensions": true, "showMeasures": true, "customizeTooltip": false, "dimensions": "" }, "visualizationType": "hbar", "exploreLink": true, "title": { "fontSize": 14, "subtitleFontSize": 11, "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "size": [100, 100], "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "totalLabel": "", "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "step": "KPI'+RowNumber+'_KPI'+RowNumber+'_Grouping_8", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "", "icons": { "useIcons": false, "iconProps": { "fit": "cover", "column": "", "type": "round" } } } }, "type": "chart" },';
                               // DimenVal5 = '"KPI'+RowNumber+'_Chart_8": { "parameters": { "autoFitMode": "none", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "visualizationType": "hbar", "exploreLink": true, "title": { "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "referenceLine": null }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "referenceLine": null }, "step": "KPI'+RowNumber+'_KPI'+RowNumber+'_Grouping_8", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "" } }, "type": "chart" },';
                                DimenFil9  = '"KPI'+RowNumber+'_Chart_Title_8": { "parameters": { "fontSize": 20, "text": "{{ cell(KPI'+RowNumber+'_Static_Dimensions.selection, 0, \\"label8\\").asString()}}", "textAlignment": "center", "textColor": "#091A3E" }, "type": "text" },';
                               
                                DimenFil7 = '{ "colspan": 3, "column": 12, "name": "KPI'+RowNumber+'_Chart_Title_8", "row": 14, "rowspan": 1, "widgetStyle": { "backgroundColor": "#F2F6FA", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil8 = '{ "colspan": 3, "column": 3, "name": "KPI'+RowNumber+'_Chart_Title_8", "row": 26, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil6 = '{ "colspan": 4, "column": 0, "name": "KPI'+RowNumber+'_Chart_Title_8", "row": 46, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                
                                DimenFil10 = '{ "colspan": 3, "column": 12, "name": "KPI'+RowNumber+'_Chart_8", "row": 15, "rowspan": 6, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil11 = '{ "colspan": 3, "column": 3, "name": "KPI'+RowNumber+'_Chart_8", "row": 27, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil12 = '{ "colspan": 4, "column": 0, "name": "KPI'+RowNumber+'_Chart_8", "row": 47, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil4 = '"KPI'+RowNumber+'_KPI'+RowNumber+'_Grouping_8": { "datasets": [{ "id": "#'+RowNumber+'DatasetId#", "name": "#'+RowNumber+'DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#'+RowNumber+'DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI'+RowNumber+'_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0,\\\\\\"alias8\\\\\\").asGrouping()}}; q = foreach q generate {{row(KPI'+RowNumber+'_Static_Dimensions.selection, [0], [\\\\\\"value8\\\\\\", \\\\\\"alias8\\\\\\"]).asProjection()}}, {{row(KPI'+RowNumber+'_Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\\\n; q = order q by {{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"alias\\\\\\"]).asGrouping()}} {{column(KPI'+RowNumber+'_Static_Order.selection, [\\\\\\"value\\\\\\"]).asObject()}};\\",\\"measures\\":\\"{{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\":true,\\"groups\\":[\\"{{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0, \\\\\\"alias8\\\\\\").asObject()}}\\"]}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                               // DimenFil4 = '';
                               
                                StrNew = '"KPI'+RowNumber+'_Chart_Title_8": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew1 = '"KPI'+RowNumber+'_Chart_8": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew2 = '"KPI'+RowNumber+'_Filter_8": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                Strs='\\"#'+RowNumber+'alias8#\\"';
                            }
                            if(k==7){  
                                DimenVal = '"KPI'+RowNumber+'_Filter_7": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "KPI'+RowNumber+'_Filter_7", "title": "#'+RowNumber+'label7#" }, "type": "listselector" },';  
                                DimenFil1 = '{ "colspan": 2, "column": 1, "name": "Filter_7", "row": 13, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(230, 236, 242, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil2 = '{ "colspan": 1, "column": 0, "name": "Filter_7", "row": 8, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil3 = '{ "colspan": 1, "column": 2, "name": "Filter_7", "row": 5, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil4  = '"KPI'+RowNumber+'_Grouping_7": { "datasets": [{ "id": "#'+RowNumber+'DatasetId#", "name": "#'+RowNumber+'DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#'+RowNumber+'DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI'+RowNumber+'_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0,\\\\\\"alias7\\\\\\").asGrouping()}}; q = foreach q generate {{row(KPI'+RowNumber+'_Static_Dimensions.selection, [0], [\\\\\\"value7\\\\\\", \\\\\\"alias7\\\\\\"]).asProjection()}}, {{row(KPI'+RowNumber+'_Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\\\n; q = order q by {{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"alias\\\\\\"]).asGrouping()}} {{column(KPI'+RowNumber+'_Static_Order.selection, [\\\\\\"value\\\\\\"]).asObject()}};\\",\\"measures\\":\\"{{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\":true,\\"groups\\":[\\"{{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0, \\\\\\"alias7\\\\\\").asObject()}}\\"]}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                                
                                DimenVal5  = '"KPI'+RowNumber+'_Chart_7": { "parameters": { "autoFitMode": "none", "totalValue": "computeTotal", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "tooltip": { "showBinLabel": true, "measures": "", "showPercentage": true, "showDimensions": true, "showMeasures": true, "customizeTooltip": false, "dimensions": "" }, "visualizationType": "hbar", "exploreLink": true, "title": { "fontSize": 14, "subtitleFontSize": 11, "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "size": [100, 100], "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "totalLabel": "", "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "step": "KPI'+RowNumber+'_Grouping_7", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "", "icons": { "useIcons": false, "iconProps": { "fit": "cover", "column": "", "type": "round" } } } }, "type": "chart" },';
                                //DimenVal5 = '"KPI'+RowNumber+'_Chart_7": { "parameters": { "autoFitMode": "none", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "visualizationType": "hbar", "exploreLink": true, "title": { "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "referenceLine": null }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "referenceLine": null }, "step": "KPI'+RowNumber+'_Grouping_7", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "" } }, "type": "chart" },';
                                
                                DimenFil7 = '{ "colspan": 3, "column": 9, "name": "KPI'+RowNumber+'_Chart_7", "row": 15, "rowspan": 6, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil8 = '{ "colspan": 3, "column": 0, "name": "KPI'+RowNumber+'_Chart_7", "row": 27, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil6  = '{ "colspan": 4, "column": 0, "name": "KPI'+RowNumber+'_Chart_7", "row": 42, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                
                                DimenFil10 = '{ "colspan": 3, "column": 9, "name": "KPI'+RowNumber+'_Chart_Title_7", "row": 14, "rowspan": 1, "widgetStyle": { "backgroundColor": "#F2F6FA", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil11 = '{ "colspan": 3, "column": 0, "name": "KPI'+RowNumber+'_Chart_Title_7", "row": 26, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil12 = '{ "colspan": 4, "column": 0, "name": "KPI'+RowNumber+'_Chart_Title_7", "row": 41, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil9 = '"KPI'+RowNumber+'_Chart_Title_7": { "parameters": { "fontSize": 20, "text": "{{ cell(KPI'+RowNumber+'_Static_Dimensions.selection, 0, \\"label7\\").asString()}}", "textAlignment": "center", "textColor": "#091A3E" }, "type": "text" },';
                               
                                StrNew = '"KPI'+RowNumber+'_Chart_Title_7": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew1 = '"KPI'+RowNumber+'_Chart_7": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew2 = '"KPI'+RowNumber+'_Filter_7": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                 Strs='\\"#'+RowNumber+'alias'+k+'#\\",';
                            }
                            if(k==6){
                                DimenVal = '"KPI'+RowNumber+'_Filter_6": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "KPI'+RowNumber+'_Filter_6", "title": "#'+RowNumber+'label6#" }, "type": "listselector" },';  
                                DimenFil1 = '{ "colspan": 2, "column": 1, "name": "Filter_6", "row": 12, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(230, 236, 242, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil2 = '{ "colspan": 1, "column": 1, "name": "Filter_6", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil3 = '{ "colspan": 1, "column": 1, "name": "Filter_6", "row": 5, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil12='{ "colspan": 4, "column": 0, "name": "Chart_Title_6", "row": 36, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil11 ='{ "colspan": 3, "column": 3, "name": "Chart_Title_6", "row": 21, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil6='{ "colspan": 3, "column": 6, "name": "Chart_Title_6", "row": 14, "rowspan": 1, "widgetStyle": { "backgroundColor": "#F2F6FA", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                               DimenFil9 ='"KPI'+RowNumber+'_Chart_Title_6": { "parameters": { "fontSize": 20, "text": "{{ cell(KPI'+RowNumber+'_Static_Dimensions.selection, 0, \\"label6\\").asString()}}", "textAlignment": "center", "textColor": "#091A3E" }, "type": "text" },';
                                DimenFil8='{ "colspan": 4, "column": 0, "name": "Chart_6", "row": 37, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil7='{ "colspan": 3, "column": 3, "name": "Chart_6", "row": 22, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil10='{ "colspan": 3, "column": 6, "name": "Chart_6", "row": 15, "rowspan": 6, "widgetStyle": { "borderEdges": [] } },';
                                DimenVal5  = '"KPI'+RowNumber+'_Chart_6": { "parameters": { "autoFitMode": "none", "totalValue": "computeTotal", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "tooltip": { "showBinLabel": true, "measures": "", "showPercentage": true, "showDimensions": true, "showMeasures": true, "customizeTooltip": false, "dimensions": "" }, "visualizationType": "hbar", "exploreLink": true, "title": { "fontSize": 14, "subtitleFontSize": 11, "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "size": [100, 100], "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "totalLabel": "", "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "step": "KPI'+RowNumber+'_Grouping_6", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "", "icons": { "useIcons": false, "iconProps": { "fit": "cover", "column": "", "type": "round" } } } }, "type": "chart" },';
                                DimenFil4  = '"KPI'+RowNumber+'_Grouping_6": { "datasets": [{ "id": "#'+RowNumber+'DatasetId#", "name": "#'+RowNumber+'DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#'+RowNumber+'DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI'+RowNumber+'_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0,\\\\\\"alias6\\\\\\").asGrouping()}}; q = foreach q generate {{row(KPI'+RowNumber+'_Static_Dimensions.selection, [0], [\\\\\\"value6\\\\\\", \\\\\\"alias6\\\\\\"]).asProjection()}}, {{row(KPI'+RowNumber+'_Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\\\n; q = order q by {{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"alias\\\\\\"]).asGrouping()}} {{column(KPI'+RowNumber+'_Static_Order.selection, [\\\\\\"value\\\\\\"]).asObject()}};\\",\\"measures\\":\\"{{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\":true,\\"groups\\":[\\"{{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0, \\\\\\"alias6\\\\\\").asObject()}}\\"]}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                                
                                StrNew = '"KPI'+RowNumber+'_Chart_Title_6": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew1 = '"KPI'+RowNumber+'_Chart_6": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew2 = '"KPI'+RowNumber+'_Filter_6": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                 Strs='\\"#'+RowNumber+'alias'+k+'#\\",';
                                
                            }
                            if(k==5){
                                DimenVal = '"KPI'+RowNumber+'_Filter_5": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "KPI'+RowNumber+'_Filter_5", "title": "#'+RowNumber+'label5#" }, "type": "listselector" },';
                                DimenFil1 = '{ "colspan": 2, "column": 1, "name": "Filter_5", "row": 11, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(230, 236, 242, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil2 = '{ "colspan": 1, "column": 0, "name": "Filter_5", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil3 = '{ "colspan": 1, "column": 0, "name": "Filter_5", "row": 5, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil11='{ "colspan": 3, "column": 3, "name": "Chart_Title_5", "row": 14, "rowspan": 1, "widgetStyle": { "backgroundColor": "#F2F6FA", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil12  ='{ "colspan": 3, "column": 0, "name": "Chart_Title_5", "row": 21, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil6='{ "colspan": 4, "column": 0, "name": "Chart_Title_5", "row": 31, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil9 ='"KPI'+RowNumber+'_Chart_Title_5": { "parameters": { "fontSize": 20, "text": "{{ cell(KPI'+RowNumber+'_Static_Dimensions.selection, 0, \\"label5\\").asString()}}", "textAlignment": "center", "textColor": "#091A3E" }, "type": "text" },';
                                DimenFil8='{ "colspan": 3, "column": 3, "name": "Chart_5", "row": 15, "rowspan": 6, "widgetStyle": { "backgroundColor": "#FFFFFF", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                DimenFil7='{ "colspan": 3, "column": 0, "name": "Chart_5", "row": 22, "rowspan": 4, "widgetStyle": { "backgroundColor": "#FFFFFF", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                DimenFil10='{ "colspan": 4, "column": 0, "name": "Chart_5", "row": 32, "rowspan": 4, "widgetStyle": { "backgroundColor": "#FFFFFF", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                DimenVal5  = '"KPI'+RowNumber+'_Chart_5": { "parameters": { "autoFitMode": "none", "totalValue": "computeTotal", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "tooltip": { "showBinLabel": true, "measures": "", "showPercentage": true, "showDimensions": true, "showMeasures": true, "customizeTooltip": false, "dimensions": "" }, "visualizationType": "hbar", "exploreLink": true, "title": { "fontSize": 14, "subtitleFontSize": 11, "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "size": [100, 100], "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "totalLabel": "", "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "step": "KPI'+RowNumber+'_Grouping_5", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "", "icons": { "useIcons": false, "iconProps": { "fit": "cover", "column": "", "type": "round" } } } }, "type": "chart" },';
                                DimenFil4  = '"KPI'+RowNumber+'_Grouping_5": { "datasets": [{ "id": "#'+RowNumber+'DatasetId#", "name": "#'+RowNumber+'DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#'+RowNumber+'DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI'+RowNumber+'_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0,\\\\\\"alias5\\\\\\").asGrouping()}}; q = foreach q generate {{row(KPI'+RowNumber+'_Static_Dimensions.selection, [0], [\\\\\\"value5\\\\\\", \\\\\\"alias5\\\\\\"]).asProjection()}}, {{row(KPI'+RowNumber+'_Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\\\n; q = order q by {{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"alias\\\\\\"]).asGrouping()}} {{column(KPI'+RowNumber+'_Static_Order.selection, [\\\\\\"value\\\\\\"]).asObject()}};\\",\\"measures\\":\\"{{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\":true,\\"groups\\":[\\"{{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0, \\\\\\"alias5\\\\\\").asObject()}}\\"]}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                            
                                StrNew = '"KPI'+RowNumber+'_Chart_Title_5": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew1 = '"KPI'+RowNumber+'_Chart_5": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew2 = '"KPI'+RowNumber+'_Filter_5": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                 Strs='\\"#'+RowNumber+'alias'+k+'#\\",';
                                
                            }
                            if(k==4){
                                DimenVal = '"KPI'+RowNumber+'_Filter_4": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "KPI'+RowNumber+'_Filter_4", "title": "#'+RowNumber+'label4#" }, "type": "listselector" },';   
                                DimenFil1 = '{ "colspan": 2, "column": 1, "name": "Filter_4", "row": 10, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(230, 236, 242, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil2 = '{ "colspan": 1, "column": 1, "name": "Filter_4", "row": 6, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil3 = '{ "colspan": 1, "column": 3, "name": "Filter_4", "row": 4, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil4  = '"KPI'+RowNumber+'_Grouping_4": { "datasets": [{ "id": "#'+RowNumber+'DatasetId#", "name": "#'+RowNumber+'DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#'+RowNumber+'DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI'+RowNumber+'_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0,\\\\\\"alias4\\\\\\").asGrouping()}}; q = foreach q generate {{row(KPI'+RowNumber+'_Static_Dimensions.selection, [0], [\\\\\\"value4\\\\\\", \\\\\\"alias4\\\\\\"]).asProjection()}}, {{row(KPI'+RowNumber+'_Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\\\n; q = order q by {{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"alias\\\\\\"]).asGrouping()}} {{column(KPI'+RowNumber+'_Static_Order.selection, [\\\\\\"value\\\\\\"]).asObject()}};\\",\\"measures\\":\\"{{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\":true,\\"groups\\":[\\"{{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0, \\\\\\"alias4\\\\\\").asObject()}}\\"]}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                                DimenVal5  = '"KPI'+RowNumber+'_Chart_4": { "parameters": { "autoFitMode": "none", "totalValue": "computeTotal", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "tooltip": { "showBinLabel": true, "measures": "", "showPercentage": true, "showDimensions": true, "showMeasures": true, "customizeTooltip": false, "dimensions": "" }, "visualizationType": "hbar", "exploreLink": true, "title": { "fontSize": 14, "subtitleFontSize": 11, "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "size": [100, 100], "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "totalLabel": "", "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "step": "KPI'+RowNumber+'_Grouping_4", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "", "icons": { "useIcons": false, "iconProps": { "fit": "cover", "column": "", "type": "round" } } } }, "type": "chart" },';
                                DimenFil6='{ "colspan": 3, "column": 12, "name": "Chart_4", "row": 8, "rowspan": 6, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil7='{ "colspan": 3, "column": 3, "name": "Chart_4", "row": 17, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil8='{ "colspan": 4, "column": 0, "name": "Chart_4", "row": 27, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil9 ='"KPI'+RowNumber+'_Chart_Title_4": { "parameters": { "fontSize": 20, "text": "{{ cell(KPI'+RowNumber+'_Static_Dimensions.selection, 0, \\"label4\\").asString()}}", "textAlignment": "center", "textColor": "#091A3E" }, "type": "text" },';
                                DimenFil10='{ "colspan": 3, "column": 12, "name": "Chart_Title_4", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#F2F6FA", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil11='{ "colspan": 3, "column": 3, "name": "Chart_Title_4", "row": 16, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil12='{ "colspan": 4, "column": 0, "name": "Chart_Title_4", "row": 26, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                
                                StrNew = '"KPI'+RowNumber+'_Chart_Title_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew1 = '"KPI'+RowNumber+'_Chart_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew2 = '"KPI'+RowNumber+'_Filter_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                 Strs='\\"#'+RowNumber+'alias'+k+'#\\",';
                                
                            }
                            if(k==3){
                                DimenVal = '"KPI'+RowNumber+'_Filter_3": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "KPI'+RowNumber+'_Filter_3", "title": "#'+RowNumber+'label3#" }, "type": "listselector" },';
                                DimenFil1 = '{ "colspan": 2, "column": 1, "name": "Filter_3", "row": 9, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(230, 236, 242, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil2 = '{ "colspan": 1, "column": 0, "name": "Filter_3", "row": 6, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil3 = '{ "colspan": 1, "column": 2, "name": "Filter_3", "row": 4, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil11='{ "colspan": 4, "column": 0, "name": "Chart_Title_3", "row": 21, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil12='{ "colspan": 3, "column": 0, "name": "Chart_Title_3", "row": 16, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil6='{ "colspan": 3, "column": 9, "name": "Chart_Title_3", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#F2F6FA", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil9 ='"KPI'+RowNumber+'_Chart_Title_3": { "parameters": { "fontSize": 20, "text": "{{ cell(KPI'+RowNumber+'_Static_Dimensions.selection, 0, \\"label3\\").asString()}}", "textAlignment": "center", "textColor": "#091A3E" }, "type": "text" },';
                                DimenFil8='{ "colspan": 3, "column": 9, "name": "Chart_3", "row": 8, "rowspan": 6, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil7='{ "colspan": 3, "column": 0, "name": "Chart_3", "row": 17, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil10='{ "colspan": 4, "column": 0, "name": "Chart_3", "row": 22, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenVal5  = '"KPI'+RowNumber+'_Chart_3": { "parameters": { "autoFitMode": "none", "totalValue": "computeTotal", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "tooltip": { "showBinLabel": true, "measures": "", "showPercentage": true, "showDimensions": true, "showMeasures": true, "customizeTooltip": false, "dimensions": "" }, "visualizationType": "hbar", "exploreLink": true, "title": { "fontSize": 14, "subtitleFontSize": 11, "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "size": [100, 100], "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "totalLabel": "", "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "step": "KPI'+RowNumber+'_Grouping_3", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "", "icons": { "useIcons": false, "iconProps": { "fit": "cover", "column": "", "type": "round" } } } }, "type": "chart" },';
                                DimenFil4  = '"KPI'+RowNumber+'_Grouping_3": { "datasets": [{ "id": "#'+RowNumber+'DatasetId#", "name": "#'+RowNumber+'DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#'+RowNumber+'DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI'+RowNumber+'_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0,\\\\\\"alias3\\\\\\").asGrouping()}}; q = foreach q generate {{row(KPI'+RowNumber+'_Static_Dimensions.selection, [0], [\\\\\\"value3\\\\\\", \\\\\\"alias3\\\\\\"]).asProjection()}}, {{row(KPI'+RowNumber+'_Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\\\n; q = order q by {{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"alias\\\\\\"]).asGrouping()}} {{column(KPI'+RowNumber+'_Static_Order.selection, [\\\\\\"value\\\\\\"]).asObject()}};\\",\\"measures\\":\\"{{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\":true,\\"groups\\":[\\"{{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0, \\\\\\"alias3\\\\\\").asObject()}}\\"]}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                            
                                StrNew = '"KPI'+RowNumber+'_Chart_Title_3": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew1 = '"KPI'+RowNumber+'_Chart_3": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew2 = '"KPI'+RowNumber+'_Filter_3": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                 Strs='\\"#'+RowNumber+'alias'+k+'#\\",';
                            }
                            if(k==2){
                                DimenVal = '"KPI'+RowNumber+'_Filter_2": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "KPI'+RowNumber+'_Filter_2", "title": "#'+RowNumber+'label2#" }, "type": "listselector" },';  
                                DimenFil1 = '{ "colspan": 2, "column": 1, "name": "Filter_2", "row": 8, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(230, 236, 242, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil2 = '{ "colspan": 1, "column": 1, "name": "Filter_2", "row": 5, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil3 = '{ "colspan": 1, "column": 1, "name": "Filter_2", "row": 4, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil4  = '"KPI'+RowNumber+'_Grouping_2": { "datasets": [{ "id": "#'+RowNumber+'DatasetId#", "name": "#'+RowNumber+'DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#'+RowNumber+'DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI'+RowNumber+'_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0,\\\\\\"alias2\\\\\\").asGrouping()}}; q = foreach q generate {{row(KPI'+RowNumber+'_Static_Dimensions.selection, [0], [\\\\\\"value2\\\\\\", \\\\\\"alias2\\\\\\"]).asProjection()}}, {{row(KPI'+RowNumber+'_Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\\\n; q = order q by {{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"alias\\\\\\"]).asGrouping()}} {{column(KPI'+RowNumber+'_Static_Order.selection, [\\\\\\"value\\\\\\"]).asObject()}};\\",\\"measures\\":\\"{{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\":true,\\"groups\\":[\\"{{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0, \\\\\\"alias2\\\\\\").asObject()}}\\"]}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                                DimenVal5  = '"KPI'+RowNumber+'_Chart_2": { "parameters": { "autoFitMode": "none", "totalValue": "computeTotal", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "tooltip": { "showBinLabel": true, "measures": "", "showPercentage": true, "showDimensions": true, "showMeasures": true, "customizeTooltip": false, "dimensions": "" }, "visualizationType": "hbar", "exploreLink": true, "title": { "fontSize": 14, "subtitleFontSize": 11, "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "size": [100, 100], "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "totalLabel": "", "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "step": "KPI'+RowNumber+'_Grouping_2", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "", "icons": { "useIcons": false, "iconProps": { "fit": "cover", "column": "", "type": "round" } } } }, "type": "chart" },';
                                DimenFil6='{ "colspan": 3, "column": 3, "name": "Chart_2", "row": 12, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil7='{ "colspan": 3, "column": 6, "name": "Chart_2", "row": 8, "rowspan": 6, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil8='{ "colspan": 4, "column": 0, "name": "Chart_2", "row": 17, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil9 ='"KPI'+RowNumber+'_Chart_Title_2": { "parameters": { "fontSize": 20, "text": "{{ cell(KPI'+RowNumber+'_Static_Dimensions.selection, 0, \\"label2\\").asString()}}", "textAlignment": "center", "textColor": "#091A3E" }, "type": "text" },';   
                                DimenFil10='{ "colspan": 3, "column": 6, "name": "Chart_Title_2", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#F2F6FA", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil11='{ "colspan": 3, "column": 3, "name": "Chart_Title_2", "row": 11, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil12='{ "colspan": 4, "column": 0, "name": "Chart_Title_2", "row": 16, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                StrNew = '"KPI'+RowNumber+'_Chart_Title_2": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew1 = '"KPI'+RowNumber+'_Chart_2": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew2 = '"KPI'+RowNumber+'_Filter_2": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                 Strs='\\"#'+RowNumber+'alias'+k+'#\\",';
                            }
                            if(k==1){    
                              DimenVal = '"KPI'+RowNumber+'_Filter_1": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "KPI'+RowNumber+'_Filter_1", "title": "#'+RowNumber+'label1#" }, "type": "listselector" },'; 
                              DimenFil9 ='"KPI'+RowNumber+'_Chart_Title_1": { "parameters": { "fontSize": 20, "text": "{{ cell(KPI'+RowNumber+'_Static_Dimensions.selection, 0, \\"label2\\").asString()}}", "textAlignment": "center", "textColor": "#091A3E" }, "type": "text" },';
                              DimenFil4  = '"KPI'+RowNumber+'_Grouping_1": { "datasets": [{ "id": "#'+RowNumber+'DatasetId#", "name": "#'+RowNumber+'DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#'+RowNumber+'DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI'+RowNumber+'_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0,\\\\\\"alias1\\\\\\").asGrouping()}}; q = foreach q generate {{row(KPI'+RowNumber+'_Static_Dimensions.selection, [0], [\\\\\\"value1\\\\\\", \\\\\\"alias1\\\\\\"]).asProjection()}}, {{row(KPI'+RowNumber+'_Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\\\n; q = order q by {{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"alias\\\\\\"]).asGrouping()}} {{column(KPI'+RowNumber+'_Static_Order.selection, [\\\\\\"value\\\\\\"]).asObject()}};\\",\\"measures\\":\\"{{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\":true,\\"groups\\":[\\"{{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0, \\\\\\"alias1\\\\\\").asObject()}}\\"]}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';  
                            
                                DimenVal5  = '"KPI'+RowNumber+'_Chart_1": { "parameters": { "autoFitMode": "none", "totalValue": "computeTotal", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "tooltip": { "showBinLabel": true, "measures": "", "showPercentage": true, "showDimensions": true, "showMeasures": true, "customizeTooltip": false, "dimensions": "" }, "visualizationType": "hbar", "exploreLink": true, "title": { "fontSize": 14, "subtitleFontSize": 11, "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "size": [100, 100], "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "totalLabel": "", "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "step": "KPI'+RowNumber+'_Grouping_1", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "", "icons": { "useIcons": false, "iconProps": { "fit": "cover", "column": "", "type": "round" } } } }, "type": "chart" },';
                            
                                 StrNew = '"KPI'+RowNumber+'_Chart_Title_1": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew1 = '"KPI'+RowNumber+'_Chart_1": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew2 = '"KPI'+RowNumber+'_Filter_1": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                Strs='\\"#'+RowNumber+'alias'+k+'#\\",';
                                
                            }
                            String Strs1;
                            if(K== 8){
                              Strs1='\"#'+RowNumber+'alias8#\"';
                            }
                            else{
                              Strs1='\"#'+RowNumber+'alias'+k+'#\",';
                            }
                            
                            SalesString =  SalesString.replace(DimenVal,StrNew2).replace(DimenFil1,'').replace(DimenFil2,'').replace(DimenFil3,'').replace(Strs,'');
                            SalesString =  SalesString.replace(DimenFil4,'').replace(DimenVal5,StrNew1).replace(DimenFil6,'').replace(DimenFil7,'').replace(Strs1,'');
                            SalesString =  SalesString.replace(DimenFil8,'').replace(DimenFil9,StrNew).replace(DimenFil10,'').replace(DimenFil11,'').replace(DimenFil12,'');
                             
                        }
                    }
                    else{
                         String DimenAll = '"Static_Group": { "datasets": [], "dimensions": [], "groups": [], "isFacet": false, "isGlobal": false, "numbers": [], "selectMode": "singlerequired", "strings": [], "type": "staticflex", "useGlobal": false, "values": [ "{\\"display\\": \\"#label1\\",\\"value\\": \\"#alias1#\\",\\"expression\\": \\"\'#alias1#\'\\",\\"alias\\": \\"#alias1#\\"}", "{\\"display\\": \\"#label2#\\",\\"value\\": \\"#alias2#\\",\\"expression\\": \\"\'#alias2#\'\\",\\"alias\\": \\"#alias2#\\"}", "{\\"display\\": \\"#label3#\\",\\"value\\": \\"#alias3#\\",\\"expression\\": \\"\'#alias3#\'\\",\\"alias\\": \\"#alias3#\\"}", "{\\"display\\": \\"#label4#\\",\\"value\\": \\"#alias4#\\",\\"expression\\": \\"\'#alias4#\'\\",\\"alias\\": \\"#alias4#\\"}", "{\\"display\\": \\"#label5#\\",\\"value\\": \\"#alias5#\\",\\"expression\\": \\"\'#alias5#\'\\",\\"alias\\": \\"#alias5#\\"}", "{\\"display\\": \\"#label6#\\",\\"value\\": \\"#alias6#\\",\\"expression\\": \\"\'#alias6#\'\\",\\"alias\\": \\"#alias6#\\"}", "{\\"display\\": \\"#label7#\\",\\"value\\": \\"#alias7#\\",\\"expression\\": \\"\'#alias7#\'\\",\\"alias\\": \\"#alias7#\\"}", "{\\"display\\": \\"#label8#\\",\\"value\\": \\"#alias8#\\",\\"expression\\": \\"\'#alias8#\'\\",\\"alias\\": \\"#alias8#\\"}" ] },';
                      SalesString =  SalesString.replace(DimenAll,'');
                      
                      String DimensLabel = '"Additional_Feature_List_2": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "step": "Static_Group", "title": "Choose Grouping" }, "type": "listselector" },';
                      SalesString =  SalesString.replace(DimensLabel,'');
                      
                      String DimensLabel1 = '{ "colspan": 3, "column": 12, "name": "Additional_Feature_List_2", "row": 23, "rowspan": 1, "widgetStyle": { "borderEdges": [] } },';
                      SalesString =  SalesString.replace(DimensLabel1,'');
                      
                      String DimensLabel2 = '{ "colspan": 2, "column": 2, "name": "Additional_Feature_List_2", "row": 58, "rowspan": 1, "widgetStyle": { "borderEdges": [] } },';
                      SalesString =  SalesString.replace(DimensLabel2,'');
                      
                      String DimensLabel3 = '{ "colspan": 1, "column": 5, "name": "Additional_Feature_List_2", "row": 32, "rowspan": 1, "widgetStyle": { "borderEdges": [] } },';
                      SalesString =  SalesString.replace(DimensLabel3,'');
                    }
                   
                    if(Datelabel.size() > 0){
                         integer i = 1;
                        integer j = 3;
                        for(String Datelab : DateLabel){
                            integer k = i-1;
                            SalesString =  SalesString.replace('#'+RowNumber+'datelabel'+ i +'#',Datelab).replace('#'+RowNumber+'datealias'+ i+'#',DateApi[k]);  
                            i = i+1;
                        }
                        
                        for(Integer L=i;J >= L;L++){
                            String Str;
                            String Str1;
                            String Str2;
                            String Str3;
                            String Str4;
                            String Str5;
                            String Str6;
                            String StrNew;
                            integer k = L;
                                if(K == 3){                                 
                                    Str = ', "{\\\"display\\":\\"#'+RowNumber+'datelabel3# (Quarter)\\",\\"alias1\\":\\"#'+RowNumber+'datealias3#_Year\\",\\"expression1\\":\\"\'#'+RowNumber+'datealias3#_Year\'\\",\\"alias2\\":\\"#'+RowNumber+'datealias3#_Quarter\\",\\"expression2\\":\\"\'#'+RowNumber+'datealias3#_Quarter\'\\",\\"value\\":[\\"#'+RowNumber+'datealias3#_Quarter\\",\\"#'+RowNumber+'datealias3#_Year\\"],\\"filter\\":[\\"#'+RowNumber+'datealias3#_Year\\",\\"#'+RowNumber+'datealias3#_Month\\",\\"#'+RowNumber+'datealias3#_Day\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel3# (Month)\\",\\"alias1\\":\\"#'+RowNumber+'datealias3#_Year\\",\\"expression1\\":\\"\'#'+RowNumber+'datealias3#_Year\'\\",\\"alias2\\":\\"#'+RowNumber+'datealias3#_Month\\",\\"expression2\\":\\"\'#'+RowNumber+'datealias3#_Month\'\\",\\"value\\":[\\"#'+RowNumber+'datealias3#_Month\\",\\"#'+RowNumber+'datealias3#_Year\\"],\\"filter\\":[\\"#'+RowNumber+'datealias3#_Year\\",\\"#'+RowNumber+'datealias3#_Month\\",\\"#'+RowNumber+'datealias3#_Day\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel3# (Week)\\",\\"alias1\\":\\"#'+RowNumber+'datealias3#_Year\\",\\"expression1\\":\\"\'#'+RowNumber+'datealias3#_Year\'\\",\\"alias2\\":\\"#'+RowNumber+'datealias3#_Week\\",\\"expression2\\":\\"\'#'+RowNumber+'datealias3#_Week\'\\",\\"value\\":[\\"#'+RowNumber+'datealias3#_Week\\",\\"#'+RowNumber+'datealias3#_Year\\"],\\"filter\\":[\\"#'+RowNumber+'datealias3#_Year\\",\\"#'+RowNumber+'datealias3#_Month\\",\\"#'+RowNumber+'datealias3#_Day\\"]}"';                                   
                                    Str1 = ', "{\\"display\\":\\"#'+RowNumber+'datelabel3# (Quarter)\\",\\"alias\\":\\"#'+RowNumber+'datealias3#_Year~~~#'+RowNumber+'datealias3#_Quarter\\",\\"expression\\":\\"\'#'+RowNumber+'datealias3#_Year\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias3#_Quarter\'\\",\\"value\\":[\\"#'+RowNumber+'datealias3#_Year\\",\\"#'+RowNumber+'datealias3#_Quarter\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel3# (Month)\\",\\"alias\\":\\"#'+RowNumber+'datealias3#_Year~~~#'+RowNumber+'datealias3#_Month\\",\\"expression\\":\\"\'#'+RowNumber+'datealias3#_Year\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias3#_Month\'\\",\\"value\\":[\\"#'+RowNumber+'datealias3#_Year\\",\\"#'+RowNumber+'datealias3#_Month\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel3# (Week)\\",\\"alias\\":\\"#'+RowNumber+'datealias3#_Year~~~#'+RowNumber+'datealias3#_Week\\",\\"expression\\":\\"\'#'+RowNumber+'datealias3#_Year\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias3#_Week\'\\",\\"value\\":[\\"#'+RowNumber+'datealias3#_Year\\",\\"#'+RowNumber+'datealias3#_Week\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel3# (Day)\\",\\"alias\\":\\"#'+RowNumber+'datealias3#_Year~~~#'+RowNumber+'datealias3#_Month~~~#'+RowNumber+'datealias3#_Day\\",\\"expression\\":\\"\'#'+RowNumber+'datealias3#_Year\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias3#_Month\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias3#_Day\'\\",\\"value\\":[\\"#'+RowNumber+'datealias3#_Year\\",\\"#'+RowNumber+'datealias3#_Month\\",\\"#'+RowNumber+'datealias3#_Day\\"]}"';
                                    Str2 = '"KPI'+RowNumber+'_Date_3": { "datasets": [{ "id": "#'+RowNumber+'DatasetId#", "name": "#'+RowNumber+'DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"measures\\":[[\\"count\\",\\"*\\"]],\\"groups\\":[\\"{{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0,\\\\\\"datealias3\\\\\\").asObject()}}\\"]}", "version": -1.0 }, "selectMode": "single", "type": "aggregateflex", "useGlobal": false, "visualizationParameters": {} },';
                                    Str3 = '"KPI'+RowNumber+'_dateselector_2": { "parameters": { "calendarTypeSwitchingAllowed": false, "defaultAbsoluteMode": true, "defaultFiscalMode": false, "instant": false, "modeSwitchingAllowed": true, "step": "KPI'+RowNumber+'_Date_3", "title": "#'+RowNumber+'datelabel3#" }, "type": "dateselector" },';
                                    StrNew = '"KPI'+RowNumber+'_dateselector_2": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               }
                                if(K== 2){
                                  Str = ', "{\\\"display\\":\\"#'+RowNumber+'datelabel2# (Quarter)\\",\\"alias1\\":\\"#'+RowNumber+'datealias2#_Year\\",\\"expression1\\":\\"\'#'+RowNumber+'datealias2#_Year\'\\",\\"alias2\\":\\"#'+RowNumber+'datealias2#_Quarter\\",\\"expression2\\":\\"\'#'+RowNumber+'datealias2#_Quarter\'\\",\\"value\\":[\\"#'+RowNumber+'datealias2#_Quarter\\",\\"#'+RowNumber+'datealias2#_Year\\"],\\"filter\\":[\\"#'+RowNumber+'datealias2#_Year\\",\\"#'+RowNumber+'datealias2#_Month\\",\\"#'+RowNumber+'datealias2#_Day\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel2# (Month)\\",\\"alias1\\":\\"#'+RowNumber+'datealias2#_Year\\",\\"expression1\\":\\"\'#'+RowNumber+'datealias2#_Year\'\\",\\"alias2\\":\\"#'+RowNumber+'datealias2#_Month\\",\\"expression2\\":\\"\'#'+RowNumber+'datealias2#_Month\'\\",\\"value\\":[\\"#'+RowNumber+'datealias2#_Month\\",\\"#'+RowNumber+'datealias2#_Year\\"],\\"filter\\":[\\"#'+RowNumber+'datealias2#_Year\\",\\"#'+RowNumber+'datealias2#_Month\\",\\"#'+RowNumber+'datealias2#_Day\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel2# (Week)\\",\\"alias1\\":\\"#'+RowNumber+'datealias2#_Year\\",\\"expression1\\":\\"\'#'+RowNumber+'datealias2#_Year\'\\",\\"alias2\\":\\"#'+RowNumber+'datealias2#_Week\\",\\"expression2\\":\\"\'#'+RowNumber+'datealias2#_Week\'\\",\\"value\\":[\\"#'+RowNumber+'datealias2#_Week\\",\\"#'+RowNumber+'datealias2#_Year\\"],\\"filter\\":[\\"#'+RowNumber+'datealias2#_Year\\",\\"#'+RowNumber+'datealias2#_Month\\",\\"#'+RowNumber+'datealias2#_Day\\"]}"';                                   
                                    Str1 = ', "{\\"display\\":\\"#'+RowNumber+'datelabel2# (Quarter)\\",\\"alias\\":\\"#'+RowNumber+'datealias2#_Year~~~#'+RowNumber+'datealias2#_Quarter\\",\\"expression\\":\\"\'#'+RowNumber+'datealias2#_Year\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias2#_Quarter\'\\",\\"value\\":[\\"#'+RowNumber+'datealias2#_Year\\",\\"#'+RowNumber+'datealias2#_Quarter\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel2# (Month)\\",\\"alias\\":\\"#'+RowNumber+'datealias2#_Year~~~#'+RowNumber+'datealias2#_Month\\",\\"expression\\":\\"\'#'+RowNumber+'datealias2#_Year\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias2#_Month\'\\",\\"value\\":[\\"#'+RowNumber+'datealias2#_Year\\",\\"#'+RowNumber+'datealias2#_Month\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel2# (Week)\\",\\"alias\\":\\"#'+RowNumber+'datealias2#_Year~~~#'+RowNumber+'datealias2#_Week\\",\\"expression\\":\\"\'#'+RowNumber+'datealias2#_Year\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias2#_Week\'\\",\\"value\\":[\\"#'+RowNumber+'datealias2#_Year\\",\\"#'+RowNumber+'datealias2#_Week\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel2# (Day)\\",\\"alias\\":\\"#'+RowNumber+'datealias2#_Year~~~#'+RowNumber+'datealias2#_Month~~~#'+RowNumber+'datealias2#_Day\\",\\"expression\\":\\"\'#'+RowNumber+'datealias2#_Year\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias2#_Month\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias2#_Day\'\\",\\"value\\":[\\"#'+RowNumber+'datealias2#_Year\\",\\"#'+RowNumber+'datealias2#_Month\\",\\"#'+RowNumber+'datealias2#_Day\\"]}"';
                                     //Str3 = '"KPI'+RowNumber+'_dateselector_1": { "type": "dateselector", "parameters": { "step": "KPI'+RowNumber+'_Date_2", "instant": false, "defaultAbsoluteMode": true, "defaultFiscalMode": false, "modeSwitchingAllowed": true, "calendarTypeSwitchingAllowed": false, "title": "#'+RowNumber+'datelabel2#" } },';
                                     Str2 = '"KPI'+RowNumber+'_Date_2": { "datasets": [{ "id": "#'+RowNumber+'DatasetId#", "name": "#'+RowNumber+'DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"measures\\":[[\\"count\\",\\"*\\"]],\\"groups\\":[\\"{{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0,\\\\\\"datealias2\\\\\\").asObject()}}\\"]}", "version": -1.0 }, "selectMode": "single", "type": "aggregateflex", "useGlobal": false, "visualizationParameters": {} },';
                                   
                                    Str3 = '"KPI'+RowNumber+'_dateselector_1": { "parameters": { "calendarTypeSwitchingAllowed": false, "defaultAbsoluteMode": true, "defaultFiscalMode": false, "instant": false, "modeSwitchingAllowed": true, "step": "KPI'+RowNumber+'_Date_2", "title": "#'+RowNumber+'datelabel2#" }, "type": "dateselector" },';
                                    StrNew = '"KPI'+RowNumber+'_dateselector_1": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                              }    
                                if(K== 1){
                                   Str = ', "{\\\"display\\":\\"#'+RowNumber+'datelabel1# (Quarter)\\",\\"alias1\\":\\"#'+RowNumber+'datealias1#_Year\\",\\"expression1\\":\\"\'#'+RowNumber+'datealias1#_Year\'\\",\\"alias2\\":\\"#'+RowNumber+'datealias1#_Quarter\\",\\"expression2\\":\\"\'#'+RowNumber+'datealias1#_Quarter\'\\",\\"value\\":[\\"#'+RowNumber+'datealias1#_Quarter\\",\\"#'+RowNumber+'datealias1#_Year\\"],\\"filter\\":[\\"#'+RowNumber+'datealias1#_Year\\",\\"#'+RowNumber+'datealias1#_Month\\",\\"#'+RowNumber+'datealias1#_Day\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel1# (Month)\\",\\"alias1\\":\\"#'+RowNumber+'datealias1#_Year\\",\\"expression1\\":\\"\'#'+RowNumber+'datealias1#_Year\'\\",\\"alias2\\":\\"#'+RowNumber+'datealias1#_Month\\",\\"expression2\\":\\"\'#'+RowNumber+'datealias1#_Month\'\\",\\"value\\":[\\"#'+RowNumber+'datealias1#_Month\\",\\"#'+RowNumber+'datealias1#_Year\\"],\\"filter\\":[\\"#'+RowNumber+'datealias1#_Year\\",\\"#'+RowNumber+'datealias1#_Month\\",\\"#'+RowNumber+'datealias1#_Day\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel1# (Week)\\",\\"alias1\\":\\"#'+RowNumber+'datealias1#_Year\\",\\"expression1\\":\\"\'#'+RowNumber+'datealias1#_Year\'\\",\\"alias2\\":\\"#'+RowNumber+'datealias1#_Week\\",\\"expression2\\":\\"\'#'+RowNumber+'datealias1#_Week\'\\",\\"value\\":[\\"#'+RowNumber+'datealias1#_Week\\",\\"#'+RowNumber+'datealias1#_Year\\"],\\"filter\\":[\\"#'+RowNumber+'datealias1#_Year\\",\\"#'+RowNumber+'datealias1#_Month\\",\\"#'+RowNumber+'datealias1#_Day\\"]}"';                                   
                                    Str1 = ', "{\\"display\\":\\"#'+RowNumber+'datelabel1# (Quarter)\\",\\"alias\\":\\"#'+RowNumber+'datealias1#_Year~~~#'+RowNumber+'datealias1#_Quarter\\",\\"expression\\":\\"\'#'+RowNumber+'datealias1#_Year\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias1#_Quarter\'\\",\\"value\\":[\\"#'+RowNumber+'datealias1#_Year\\",\\"#'+RowNumber+'datealias1#_Quarter\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel1# (Month)\\",\\"alias\\":\\"#'+RowNumber+'datealias1#_Year~~~#'+RowNumber+'datealias1#_Month\\",\\"expression\\":\\"\'#'+RowNumber+'datealias1#_Year\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias1#_Month\'\\",\\"value\\":[\\"#'+RowNumber+'datealias1#_Year\\",\\"#'+RowNumber+'datealias1#_Month\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel1# (Week)\\",\\"alias\\":\\"#'+RowNumber+'datealias1#_Year~~~#'+RowNumber+'datealias1#_Week\\",\\"expression\\":\\"\'#'+RowNumber+'datealias1#_Year\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias1#_Week\'\\",\\"value\\":[\\"#'+RowNumber+'datealias1#_Year\\",\\"#'+RowNumber+'datealias1#_Week\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel1# (Day)\\",\\"alias\\":\\"#'+RowNumber+'datealias1#_Year~~~#'+RowNumber+'datealias1#_Month~~~#'+RowNumber+'datealias1#_Day\\",\\"expression\\":\\"\'#'+RowNumber+'datealias1#_Year\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias1#_Month\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias1#_Day\'\\",\\"value\\":[\\"#'+RowNumber+'datealias1#_Year\\",\\"#'+RowNumber+'datealias1#_Month\\",\\"#'+RowNumber+'datealias1#_Day\\"]}"';
                                    Str2 = '"KPI'+RowNumber+'_Date_1": { "datasets": [{ "id": "#'+RowNumber+'DatasetId#", "name": "#'+RowNumber+'DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"measures\\":[[\\"count\\",\\"*\\"]],\\"groups\\":[\\"{{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0,\\\\\\"datealias1\\\\\\").asObject()}}\\"]}", "version": -1.0 }, "selectMode": "single", "type": "aggregateflex", "useGlobal": false, "visualizationParameters": {} },';
                                    
                                }
                                
                                String DateString = ',\\"datevalue'+k+'\\": \\"\'#'+RowNumber+'datealias'+k+'#\'\\",\\"datealias'+k+'\\": \\"#'+RowNumber+'datealias'+k+'#\\",\\"datelabel'+k+'\\": \\"#'+RowNumber+'datelabel'+k+'#\\"';  
                                SalesString =  SalesString.replace(Str,'').replace(Str1,'').replace(DateString,''); 
                                SalesString =  SalesString.replace(Str3,StrNew).replace(Str2,'');
                        
                            }
                        }
                        else{                   
                           
                        }
                    
                    if(measureLabel.size() > 0){               
                      
                        integer i = 1;
                        integer j = 5;
                        for(String Dim : measureLabel){    
                            integer k = i-1;
                            String Str = '[\\"#'+RowNumber+'CompactMeasureAPI'+ i+'#\\"]';
                            String Meas = '#'+RowNumber+'ExpressionMeasureAPI4#';
                            SalesString =  SalesString.replace('#'+RowNumber+'MeasureLabel'+ i+'#',Dim).replace('#'+RowNumber+'MeasureExpression'+ i+'#',MeasureAPI[k]).replace('#'+RowNumber+'MeasureAlias'+ i+'#',AliasMeasureAPI[k]).replace(Str,CompactMeasureAPI[k]).replace('#'+RowNumber+'measurealias'+i+'#',AliasMeasureAPI[k]);  
                            SalesString =  SalesString.replace('#'+RowNumber+'ExpressionMeasureAPI'+i+'#',MeasureAPI[k]);
                            i = i+1;
                        }
                        for(Integer L=i;J >= L;L++){   
                            integer k = L;
                            String Str1;
                            String Str2;
                            String Str3;
                            String Str4;
                            String Str5;
                            String Str6;
                            String Str7 = '';
                            if(K == 5){
                              Str1 = ', "{\\"display\\": \\"#'+RowNumber+'label'+k+'#\\",\\"value\\": \\"#'+RowNumber+'alias'+k+'#\\",\\"expression\\": \\"\'#'+RowNumber+'alias'+k+'#\'\\",\\"alias\\": \\"#'+RowNumber+'alias'+k+'#\\"}"';
                                 Str2 = ', "{\\"display\\": \\"#'+RowNumber+'MeasureLabel5#\\",\\"cf\\": [\\"#'+RowNumber+'CompactMeasureAPI5#\\"],\\"expression\\": \\"#'+RowNumber+'ExpressionMeasureAPI5#\\",\\"alias\\": \\"#'+RowNumber+'MeasureAlias5#\\"}" ';
                               
                            }
                            else{
                              Str1 = ', "{\\"display\\": \\"#'+RowNumber+'label'+k+'#\\",\\"value\\": \\"#'+RowNumber+'alias'+k+'#\\",\\"expression\\": \\"\'#'+RowNumber+'alias'+k+'#\'\\",\\"alias\\": \\"#'+RowNumber+'alias'+k+'#\\"}"';
                                 Str2 = ', "{\\"display\\": \\"#'+RowNumber+'MeasureLabel'+k+'#\\",\\"cf\\": [\\"#'+RowNumber+'CompactMeasureAPI'+k+'#\\"],\\"expression\\": \\"#'+RowNumber+'ExpressionMeasureAPI'+k+'#\\",\\"alias\\": \\"#'+RowNumber+'MeasureAlias'+k+'#\\"}"';
                              
                            }
                            if(k == 4){
                              Str3 = '"KPI'+RowNumber+'_KPI_4": { "parameters": { "compact": true, "exploreLink": true, "measureField": "#'+RowNumber+'measurealias4#", "numberColor": "#FFFFFF", "numberSize": 32, "step": "KPI'+RowNumber+'_KPIs", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                                 Str4 = '{ "colspan": 3, "column": 12, "name": "KPI_4", "row": 3, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                 Str5 = '{ "colspan": 2, "column": 4, "name": "KPI_4", "row": 7, "rowspan": 2, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                 Str6 = '{ "colspan": 1, "column": 3, "name": "KPI_4", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                            Str7 = '"KPI'+RowNumber+'_KPI_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                 String StrMeasure = ',\\"labelkpi'+k+'\\":\\"#'+RowNumber+'MeasureLabel'+k+'#\\",\\"expression'+k+'\\":\\"#'+RowNumber+'MeasureExpression'+k+'#\\",\\"cfkpi'+k+'\\":[\\"#'+RowNumber+'CompactMeasureAPI'+k+'#\\"],\\"aliaskpi'+k+'\\":\\"#'+RowNumber+'MeasureAlias'+k+'#\\"';                           
                                 SalesString =  SalesString.replace(StrMeasure,'');
                            }
                            if(k == 3){
                              Str3 = '"KPI'+RowNumber+'_KPI_3": { "parameters": { "compact": true, "exploreLink": true, "measureField": "#'+RowNumber+'measurealias3#", "numberColor": "#FFFFFF", "numberSize": 32, "step": "KPI'+RowNumber+'_KPIs", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                                 Str4 = '{ "colspan": 3, "column": 9, "name": "KPI_3", "row": 3, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                 Str5 = '{ "colspan": 2, "column": 2, "name": "KPI_3", "row": 7, "rowspan": 2, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                 Str6 = '{ "colspan": 1, "column": 2, "name": "KPI_3", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                Str7 = '"KPI'+RowNumber+'_KPI_3": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                 String StrMeasure = ',\\"labelkpi'+k+'\\":\\"#'+RowNumber+'MeasureLabel'+k+'#\\",\\"expression'+k+'\\":\\"#'+RowNumber+'MeasureExpression'+k+'#\\",\\"cfkpi'+k+'\\":[\\"#'+RowNumber+'CompactMeasureAPI'+k+'#\\"],\\"aliaskpi'+k+'\\":\\"#'+RowNumber+'MeasureAlias'+k+'#\\"';                           
                                 SalesString =  SalesString.replace(StrMeasure,'');
                                
                            }
                            if(k == 2){
                              Str3 = '"KPI'+RowNumber+'_KPI_2": { "parameters": { "compact": true, "exploreLink": true, "measureField": "#'+RowNumber+'measurealias2#", "numberColor": "#FFFFFF", "numberSize": 32, "step": "KPI'+RowNumber+'_KPIs", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                                 Str4 = '{ "colspan": 3, "column": 6, "name": "KPI_2", "row": 3, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                 Str5 = '{ "colspan": 2, "column": 4, "name": "KPI_2", "row": 4, "rowspan": 2, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                 Str6 = '{ "colspan": 1, "column": 1, "name": "KPI_2", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                Str7 = '"KPI'+RowNumber+'_KPI_2": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                 String StrMeasure = ',\\"labelkpi'+k+'\\":\\"#'+RowNumber+'MeasureLabel'+k+'#\\",\\"expression'+k+'\\":\\"#'+RowNumber+'MeasureExpression'+k+'#\\",\\"cfkpi'+k+'\\":[\\"#'+RowNumber+'CompactMeasureAPI'+k+'#\\"],\\"aliaskpi'+k+'\\":\\"#'+RowNumber+'MeasureAlias'+k+'#\\"';                           
                                 SalesString =  SalesString.replace(StrMeasure,'');
                            }
                            if(k == 1){
                              Str3 = '"KPI'+RowNumber+'_KPI_1": { "parameters": { "compact": true, "exploreLink": true, "measureField": "#'+RowNumber+'measurealias2#", "numberColor": "#FFFFFF", "numberSize": 32, "step": "KPI'+RowNumber+'_KPIs", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                              Str7 = '"KPI'+RowNumber+'_KPI_1": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                String StrMeasure = '\\"labelkpi'+k+'\\":\\"#'+RowNumber+'MeasureLabel'+k+'#\\",\\"expression'+k+'\\":\\"#'+RowNumber+'MeasureExpression'+k+'#\\",\\"cfkpi'+k+'\\":[\\"#'+RowNumber+'CompactMeasureAPI'+k+'#\\"],\\"aliaskpi'+k+'\\":\\"#'+RowNumber+'MeasureAlias'+k+'#\\"';                           
                                 SalesString =  SalesString.replace(StrMeasure,'');
                            }
                            String StrMeasure = ',\\"labelkpi'+k+'\\": \\"#'+RowNumber+'MeasureLabel'+k+'#\\",\\"expression'+k+'\\": \\"#'+RowNumber+'MeasureExpression'+k+'#\\",\\"cfkpi'+k+'\\": [\\"#'+RowNumber+'CompactMeasureAPI'+k+'#\\"],\\"aliaskpi'+k+'\\": \\"#'+RowNumber+'MeasureAlias'+k+'#\\"';                           
                          String StrMeaure1 = ',\\"{{cell(KPI'+RowNumber+'_Static_KPI.selection,0, \\\\\\"cfkpi'+k+'\\\\\\").asObject()}}\\"';
                          String StrMeasure2 = ',{{row(KPI'+RowNumber+'_Static_KPI.selection, [], [\\\\\\"expression'+k+'\\\\\\",\\\\\\"aliaskpi'+k+'\\\\\\"]).asProjection()}}';
                          SalesString =  SalesString.replace(Str2,'').replace(StrMeasure,'').replace(StrMeaure1,'').replace(StrMeasure2,'');
                          if(K != 5){
                          SalesString =  SalesString.replace(Str3,Str7).replace(Str4,'').replace(Str5,'').replace(Str6,'').replace(Str1,'');
                          }
                        } 
                           
                    }
                    else{                     
                    
                    }
                    
                    if(DatasetRec.Filter_Logics__c != null && DatasetRec.Filter_Logics__c != ''){ 
                        String[] FilterList = DatasetRec.Filter_Logics__c.split(';');
                        String[] Filtervalu = DatasetRec.FilterName__c.Split(';');
                        if(FilterList.size() > 0){
                            integer i = 1;
                            integer M = 0;
                            integer j = 5;
                            for(String Dim : FilterList){
                                integer k = i-1;
                                SalesString =  SalesString.replace('#'+RowNumber+'FilterLabel'+ i+'#',Filtervalu[M]).replace('#'+RowNumber+'Filter'+ i+'#',Dim); 
                                i = i+1;
                                M = M+1;
                            }
                            String Str3;
                            for(Integer L=i;J >= L;L++){
                                integer k = L;
                                if(K == 5){ 
                                       Str3 = ', "{\\"display\\": \\"#'+RowNumber+'FilterLabel'+k+'#\\",\\"value\\": \\"#'+RowNumber+'Filter'+k+'#\\"}"';
                                   }
                                else{
                                    Str3 = ', "{\\"display\\": \\"#'+RowNumber+'FilterLabel'+k+'#\\",\\"value\\": \\"#'+RowNumber+'Filter'+k+'#\\"}"' ;
                                   }
                                SalesString =  SalesString.replace(Str3,'');  
                            } 
                        }
                       
                            
                    }
                    else{
                      if(DimensionApi != Null){
                        if(DimensionApi.size() > 0)
                          SalesString =  SalesString.replace('#'+RowNumber+'FilterLabel1#','All').replace('#'+RowNumber+'Filter1#','\''+DimensionApi[0]+'\' in all');
                      }
                        integer j = 5;
                         String Str3;
                        for(Integer L=2;J >= L;L++){
                                integer k = L;
                                if(K == 5){ 
                                 Str3 = ', "{\\"display\\": \\"#'+RowNumber+'FilterLabel'+k+'#\\",\\"value\\": \\"#'+RowNumber+'Filter'+k+'#\\"}"';
                            }
                                else{
                                Str3 = ', "{\\"display\\": \\"#'+RowNumber+'FilterLabel'+k+'#\\",\\"value\\": \\"#'+RowNumber+'Filter'+k+'#\\"}"' ;
                              }
                              SalesString =  SalesString.replace(Str3,''); 
                            }
                    }
                  
                   if(FolderId[1] != Null && FolderId[1] != ''){
                        if(Salesval == 'Market'){
                              SalesString = SalesString.replace('Marketing Insights',FolderId[1]); 
                         }
                         else  if(Salesval == 'Success'){
                              SalesString = SalesString.replace('Success Insights',FolderId[1]); 
                         }
                         else{
                                SalesString = SalesString.replace('Sales Insights',FolderId[1]); 
                         }
                  
                   }
                    if(DashboardId != Null && DashboardId != '')
                        SalesString =  SalesString.replace('Multi-KPI Success (NEW)',DashboardId);  
                    if(FolderId[0] != Null && FolderId[0] != '')
                        SalesString =  SalesString.replace('00l36000000jQsyAAE',FolderId[0]);
                        
                    if(DatasetRec.Dataset_Id__c != NUll){
                        SalesString =  SalesString.replace('#'+RowNumber+'DatasetAlias#',DatasetRec.Dataset_Name__c).replace('#'+RowNumber+'DatasetId#',DatasetRec.Dataset_Id__c);
                    }     
                }
                }
            }
            else{
                
                        if(Salesval == 'Market'){
                            RowNumber = Integer.valueof(RowNumberlist) -10;
                        }
                        else if(Salesval == 'Success'){
                            RowNumber = Integer.valueof(RowNumberlist) -5;
                        }
                        else{
                            RowNumber = Integer.valueof(RowNumberlist);   
                        }
                
                  
                     set<String> NewSet = new set<String>();
                    list<String> Newlist = new list<String>();
                    Map<String,String> NewMap= new Map<String,String>();
                    
                   
                     String Numbers = String.valueof(RowNumber); 
                   
                    SalesString = SalesString.replaceAll('\\s+\\s+','#testcode#').replaceAll('#testcode#',' '); 
                        integer N = 8;
                        
                        for(Integer L=1;N >= L;L++){
                             integer k = L;
                             if(K == 8){
                                 String Dimens = ', "{\\"display\\": \\"#'+RowNumber+'label'+k+'#\\",\\"value\\": \\"#'+RowNumber+'alias'+k+'#\\",\\"expression\\": \\"\'#'+RowNumber+'alias'+k+'#\'\\",\\"alias\\": \\"#'+RowNumber+'alias'+k+'#\\"}"';
                                 SalesString =  SalesString.replace(Dimens,'');
                             }
                            else{
                                 String Dimens = ', "{\\"display\\": \\"#'+RowNumber+'label'+k+'#\\",\\"value\\": \\"#'+RowNumber+'alias'+k+'#\\",\\"expression\\": \\"\'#'+RowNumber+'alias'+k+'#\'\\",\\"alias\\": \\"#'+RowNumber+'alias'+k+'#\\"}"';
                                 SalesString =  SalesString.replace(Dimens,'');
                            }
                            String Dimen = 'q = filter q by {{column(KPI'+RowNumber+'_Filter_'+k+'.selection, [\\\\\\"#'+RowNumber+'alias'+k+'#\\\\\\"]).asEquality(\\\\\\"#'+RowNumber+'alias'+k+'#\\\\\\")}};';
                            String DimenGrp = 'q = filter q by {{column(KPI'+RowNumber+'_Grouping_'+k+'.selection, [\\\\\\"#'+RowNumber+'alias'+k+'#\\\\\\"]).asEquality(\\\\\\"#'+RowNumber+'alias'+k+'#\\\\\\")}};';
                            String Dimens1 = '"KPI'+RowNumber+'_Filter_'+K+'": { "datasets": [{ "id": "#'+RowNumber+'DatasetId#", "name": "#'+RowNumber+'DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"measures\\":[[\\"count\\",\\"*\\"]],\\"groups\\":[\\"{{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0,\\\\\\"alias'+K+'\\\\\\").asObject()}}\\"]}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": false, "visualizationParameters": {} },';
                            String Dimensionval = ',\\"value'+k+'\\": \\"\'#'+RowNumber+'alias'+k+'#\'\\",\\"alias'+k+'\\": \\"#'+RowNumber+'alias'+k+'#\\",\\"label'+k+'\\": \\"#'+RowNumber+'label'+k+'#\\"';     
                            
                            SalesString =  SalesString.replace(Dimen,'').replace(DimenGrp,'').replace(Dimens1,'').replace(Dimensionval,'');
                            
                            String DimenVal;
                            String DimenFil1;
                            String DimenFil2;
                            String DimenFil3;
                            String DimenFil4;
                            String DimenVal5;
                            String DimenFil6;
                            String DimenFil7;
                            String DimenFil8;
                            String DimenFil9;
                            String DimenFil10;
                            String DimenFil11;
                            String DimenFil12;
                            String StrNew = '';
                            String StrNew1 = '';
                            String StrNew2 = '';
                            String Strs = '';
                            if(k==8){
                              DimenVal = '"KPI'+RowNumber+'_Filter_8": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "KPI'+RowNumber+'_Filter_8", "title": "#'+RowNumber+'label8#" }, "type": "listselector" },';  
                                DimenFil1 = '{ "colspan": 2, "column": 1, "name": "Filter_8", "row": 14, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(230, 236, 242, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil2 = '{ "colspan": 1, "column": 1, "name": "Filter_8", "row": 8, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil3 = '{ "colspan": 1, "column": 3, "name": "Filter_8", "row": 5, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                
                               // DimenVal5 = '"KPI'+RowNumber+'_Chart_8": { "parameters": { "autoFitMode": "none", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "visualizationType": "hbar", "exploreLink": true, "title": { "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "referenceLine": null }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "referenceLine": null }, "step": "Grouping_8", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "" } }, "type": "chart" },';
                                DimenVal5 = '"KPI'+RowNumber+'_Chart_8": { "parameters": { "autoFitMode": "none", "totalValue": "computeTotal", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "tooltip": { "showBinLabel": true, "measures": "", "showPercentage": true, "showDimensions": true, "showMeasures": true, "customizeTooltip": false, "dimensions": "" }, "visualizationType": "hbar", "exploreLink": true, "title": { "fontSize": 14, "subtitleFontSize": 11, "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "size": [100, 100], "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "totalLabel": "", "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "step": "KPI'+RowNumber+'_KPI'+RowNumber+'_Grouping_8", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "", "icons": { "useIcons": false, "iconProps": { "fit": "cover", "column": "", "type": "round" } } } }, "type": "chart" },';
                               // DimenVal5 = '"KPI'+RowNumber+'_Chart_8": { "parameters": { "autoFitMode": "none", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "visualizationType": "hbar", "exploreLink": true, "title": { "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "referenceLine": null }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "referenceLine": null }, "step": "KPI'+RowNumber+'_KPI'+RowNumber+'_Grouping_8", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "" } }, "type": "chart" },';
                                DimenFil9  = '"KPI'+RowNumber+'_Chart_Title_8": { "parameters": { "fontSize": 20, "text": "{{ cell(KPI'+RowNumber+'_Static_Dimensions.selection, 0, \\"label8\\").asString()}}", "textAlignment": "center", "textColor": "#091A3E" }, "type": "text" },';
                               
                                DimenFil7 = '{ "colspan": 3, "column": 12, "name": "KPI'+RowNumber+'_Chart_Title_8", "row": 14, "rowspan": 1, "widgetStyle": { "backgroundColor": "#F2F6FA", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil8 = '{ "colspan": 3, "column": 3, "name": "KPI'+RowNumber+'_Chart_Title_8", "row": 26, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil6 = '{ "colspan": 4, "column": 0, "name": "KPI'+RowNumber+'_Chart_Title_8", "row": 46, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                
                                DimenFil10 = '{ "colspan": 3, "column": 12, "name": "KPI'+RowNumber+'_Chart_8", "row": 15, "rowspan": 6, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil11 = '{ "colspan": 3, "column": 3, "name": "KPI'+RowNumber+'_Chart_8", "row": 27, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil12 = '{ "colspan": 4, "column": 0, "name": "KPI'+RowNumber+'_Chart_8", "row": 47, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil4 = '"KPI'+RowNumber+'_KPI'+RowNumber+'_Grouping_8": { "datasets": [{ "id": "#'+RowNumber+'DatasetId#", "name": "#'+RowNumber+'DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#'+RowNumber+'DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI'+RowNumber+'_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0,\\\\\\"alias8\\\\\\").asGrouping()}}; q = foreach q generate {{row(KPI'+RowNumber+'_Static_Dimensions.selection, [0], [\\\\\\"value8\\\\\\", \\\\\\"alias8\\\\\\"]).asProjection()}}, {{row(KPI'+RowNumber+'_Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\\\n; q = order q by {{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"alias\\\\\\"]).asGrouping()}} {{column(KPI'+RowNumber+'_Static_Order.selection, [\\\\\\"value\\\\\\"]).asObject()}};\\",\\"measures\\":\\"{{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\":true,\\"groups\\":[\\"{{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0, \\\\\\"alias8\\\\\\").asObject()}}\\"]}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                               // DimenFil4 = '';
                               
                                StrNew = '"KPI'+RowNumber+'_Chart_Title_8": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew1 = '"KPI'+RowNumber+'_Chart_8": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew2 = '"KPI'+RowNumber+'_Filter_8": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                Strs='\\"#'+RowNumber+'alias8#\\"';
                            }
                            if(k==7){  
                                DimenVal = '"KPI'+RowNumber+'_Filter_7": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "KPI'+RowNumber+'_Filter_7", "title": "#'+RowNumber+'label7#" }, "type": "listselector" },';  
                                DimenFil1 = '{ "colspan": 2, "column": 1, "name": "Filter_7", "row": 13, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(230, 236, 242, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil2 = '{ "colspan": 1, "column": 0, "name": "Filter_7", "row": 8, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil3 = '{ "colspan": 1, "column": 2, "name": "Filter_7", "row": 5, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil4  = '"KPI'+RowNumber+'_Grouping_7": { "datasets": [{ "id": "#'+RowNumber+'DatasetId#", "name": "#'+RowNumber+'DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#'+RowNumber+'DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI'+RowNumber+'_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0,\\\\\\"alias7\\\\\\").asGrouping()}}; q = foreach q generate {{row(KPI'+RowNumber+'_Static_Dimensions.selection, [0], [\\\\\\"value7\\\\\\", \\\\\\"alias7\\\\\\"]).asProjection()}}, {{row(KPI'+RowNumber+'_Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\\\n; q = order q by {{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"alias\\\\\\"]).asGrouping()}} {{column(KPI'+RowNumber+'_Static_Order.selection, [\\\\\\"value\\\\\\"]).asObject()}};\\",\\"measures\\":\\"{{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\":true,\\"groups\\":[\\"{{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0, \\\\\\"alias7\\\\\\").asObject()}}\\"]}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                                
                                DimenVal5  = '"KPI'+RowNumber+'_Chart_7": { "parameters": { "autoFitMode": "none", "totalValue": "computeTotal", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "tooltip": { "showBinLabel": true, "measures": "", "showPercentage": true, "showDimensions": true, "showMeasures": true, "customizeTooltip": false, "dimensions": "" }, "visualizationType": "hbar", "exploreLink": true, "title": { "fontSize": 14, "subtitleFontSize": 11, "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "size": [100, 100], "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "totalLabel": "", "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "step": "KPI'+RowNumber+'_Grouping_7", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "", "icons": { "useIcons": false, "iconProps": { "fit": "cover", "column": "", "type": "round" } } } }, "type": "chart" },';
                                //DimenVal5 = '"KPI'+RowNumber+'_Chart_7": { "parameters": { "autoFitMode": "none", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "visualizationType": "hbar", "exploreLink": true, "title": { "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "referenceLine": null }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "referenceLine": null }, "step": "KPI'+RowNumber+'_Grouping_7", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "" } }, "type": "chart" },';
                                
                                DimenFil7 = '{ "colspan": 3, "column": 9, "name": "KPI'+RowNumber+'_Chart_7", "row": 15, "rowspan": 6, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil8 = '{ "colspan": 3, "column": 0, "name": "KPI'+RowNumber+'_Chart_7", "row": 27, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil6  = '{ "colspan": 4, "column": 0, "name": "KPI'+RowNumber+'_Chart_7", "row": 42, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                
                                DimenFil10 = '{ "colspan": 3, "column": 9, "name": "KPI'+RowNumber+'_Chart_Title_7", "row": 14, "rowspan": 1, "widgetStyle": { "backgroundColor": "#F2F6FA", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil11 = '{ "colspan": 3, "column": 0, "name": "KPI'+RowNumber+'_Chart_Title_7", "row": 26, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil12 = '{ "colspan": 4, "column": 0, "name": "KPI'+RowNumber+'_Chart_Title_7", "row": 41, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil9 = '"KPI'+RowNumber+'_Chart_Title_7": { "parameters": { "fontSize": 20, "text": "{{ cell(KPI'+RowNumber+'_Static_Dimensions.selection, 0, \\"label7\\").asString()}}", "textAlignment": "center", "textColor": "#091A3E" }, "type": "text" },';
                               
                                StrNew = '"KPI'+RowNumber+'_Chart_Title_7": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew1 = '"KPI'+RowNumber+'_Chart_7": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew2 = '"KPI'+RowNumber+'_Filter_7": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                 Strs='\\"#'+RowNumber+'alias'+k+'#\\",';
                                
                            }
                            if(k==6){
                                DimenVal = '"KPI'+RowNumber+'_Filter_6": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "KPI'+RowNumber+'_Filter_6", "title": "#'+RowNumber+'label6#" }, "type": "listselector" },';  
                                DimenFil1 = '{ "colspan": 2, "column": 1, "name": "Filter_6", "row": 12, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(230, 236, 242, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil2 = '{ "colspan": 1, "column": 1, "name": "Filter_6", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil3 = '{ "colspan": 1, "column": 1, "name": "Filter_6", "row": 5, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil12='{ "colspan": 4, "column": 0, "name": "Chart_Title_6", "row": 36, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil11 ='{ "colspan": 3, "column": 3, "name": "Chart_Title_6", "row": 21, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil6='{ "colspan": 3, "column": 6, "name": "Chart_Title_6", "row": 14, "rowspan": 1, "widgetStyle": { "backgroundColor": "#F2F6FA", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                               DimenFil9 ='"KPI'+RowNumber+'_Chart_Title_6": { "parameters": { "fontSize": 20, "text": "{{ cell(KPI'+RowNumber+'_Static_Dimensions.selection, 0, \\"label6\\").asString()}}", "textAlignment": "center", "textColor": "#091A3E" }, "type": "text" },';
                                DimenFil8='{ "colspan": 4, "column": 0, "name": "Chart_6", "row": 37, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil7='{ "colspan": 3, "column": 3, "name": "Chart_6", "row": 22, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil10='{ "colspan": 3, "column": 6, "name": "Chart_6", "row": 15, "rowspan": 6, "widgetStyle": { "borderEdges": [] } },';
                                DimenVal5  = '"KPI'+RowNumber+'_Chart_6": { "parameters": { "autoFitMode": "none", "totalValue": "computeTotal", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "tooltip": { "showBinLabel": true, "measures": "", "showPercentage": true, "showDimensions": true, "showMeasures": true, "customizeTooltip": false, "dimensions": "" }, "visualizationType": "hbar", "exploreLink": true, "title": { "fontSize": 14, "subtitleFontSize": 11, "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "size": [100, 100], "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "totalLabel": "", "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "step": "KPI'+RowNumber+'_Grouping_6", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "", "icons": { "useIcons": false, "iconProps": { "fit": "cover", "column": "", "type": "round" } } } }, "type": "chart" },';
                                DimenFil4  = '"KPI'+RowNumber+'_Grouping_6": { "datasets": [{ "id": "#'+RowNumber+'DatasetId#", "name": "#'+RowNumber+'DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#'+RowNumber+'DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI'+RowNumber+'_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0,\\\\\\"alias6\\\\\\").asGrouping()}}; q = foreach q generate {{row(KPI'+RowNumber+'_Static_Dimensions.selection, [0], [\\\\\\"value6\\\\\\", \\\\\\"alias6\\\\\\"]).asProjection()}}, {{row(KPI'+RowNumber+'_Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\\\n; q = order q by {{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"alias\\\\\\"]).asGrouping()}} {{column(KPI'+RowNumber+'_Static_Order.selection, [\\\\\\"value\\\\\\"]).asObject()}};\\",\\"measures\\":\\"{{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\":true,\\"groups\\":[\\"{{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0, \\\\\\"alias6\\\\\\").asObject()}}\\"]}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                                
                                StrNew = '"KPI'+RowNumber+'_Chart_Title_6": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew1 = '"KPI'+RowNumber+'_Chart_6": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew2 = '"KPI'+RowNumber+'_Filter_6": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                 Strs='\\"#'+RowNumber+'alias'+k+'#\\",';
                                
                            }
                            if(k==5){
                                DimenVal = '"KPI'+RowNumber+'_Filter_5": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "KPI'+RowNumber+'_Filter_5", "title": "#'+RowNumber+'label5#" }, "type": "listselector" },';
                                DimenFil1 = '{ "colspan": 2, "column": 1, "name": "Filter_5", "row": 11, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(230, 236, 242, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil2 = '{ "colspan": 1, "column": 0, "name": "Filter_5", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil3 = '{ "colspan": 1, "column": 0, "name": "Filter_5", "row": 5, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil11='{ "colspan": 3, "column": 3, "name": "Chart_Title_5", "row": 14, "rowspan": 1, "widgetStyle": { "backgroundColor": "#F2F6FA", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil12  ='{ "colspan": 3, "column": 0, "name": "Chart_Title_5", "row": 21, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil6='{ "colspan": 4, "column": 0, "name": "Chart_Title_5", "row": 31, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil9 ='"KPI'+RowNumber+'_Chart_Title_5": { "parameters": { "fontSize": 20, "text": "{{ cell(KPI'+RowNumber+'_Static_Dimensions.selection, 0, \\"label5\\").asString()}}", "textAlignment": "center", "textColor": "#091A3E" }, "type": "text" },';
                                DimenFil8='{ "colspan": 3, "column": 3, "name": "Chart_5", "row": 15, "rowspan": 6, "widgetStyle": { "backgroundColor": "#FFFFFF", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                DimenFil7='{ "colspan": 3, "column": 0, "name": "Chart_5", "row": 22, "rowspan": 4, "widgetStyle": { "backgroundColor": "#FFFFFF", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                DimenFil10='{ "colspan": 4, "column": 0, "name": "Chart_5", "row": 32, "rowspan": 4, "widgetStyle": { "backgroundColor": "#FFFFFF", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                DimenVal5  = '"KPI'+RowNumber+'_Chart_5": { "parameters": { "autoFitMode": "none", "totalValue": "computeTotal", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "tooltip": { "showBinLabel": true, "measures": "", "showPercentage": true, "showDimensions": true, "showMeasures": true, "customizeTooltip": false, "dimensions": "" }, "visualizationType": "hbar", "exploreLink": true, "title": { "fontSize": 14, "subtitleFontSize": 11, "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "size": [100, 100], "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "totalLabel": "", "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "step": "KPI'+RowNumber+'_Grouping_5", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "", "icons": { "useIcons": false, "iconProps": { "fit": "cover", "column": "", "type": "round" } } } }, "type": "chart" },';
                                DimenFil4  = '"KPI'+RowNumber+'_Grouping_5": { "datasets": [{ "id": "#'+RowNumber+'DatasetId#", "name": "#'+RowNumber+'DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#'+RowNumber+'DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI'+RowNumber+'_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0,\\\\\\"alias5\\\\\\").asGrouping()}}; q = foreach q generate {{row(KPI'+RowNumber+'_Static_Dimensions.selection, [0], [\\\\\\"value5\\\\\\", \\\\\\"alias5\\\\\\"]).asProjection()}}, {{row(KPI'+RowNumber+'_Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\\\n; q = order q by {{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"alias\\\\\\"]).asGrouping()}} {{column(KPI'+RowNumber+'_Static_Order.selection, [\\\\\\"value\\\\\\"]).asObject()}};\\",\\"measures\\":\\"{{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\":true,\\"groups\\":[\\"{{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0, \\\\\\"alias5\\\\\\").asObject()}}\\"]}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                            
                                StrNew = '"KPI'+RowNumber+'_Chart_Title_5": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew1 = '"KPI'+RowNumber+'_Chart_5": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew2 = '"KPI'+RowNumber+'_Filter_5": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                 Strs='\\"#'+RowNumber+'alias'+k+'#\\",';
                                
                            }
                            if(k==4){
                                DimenVal = '"KPI'+RowNumber+'_Filter_4": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "KPI'+RowNumber+'_Filter_4", "title": "#'+RowNumber+'label4#" }, "type": "listselector" },';   
                                DimenFil1 = '{ "colspan": 2, "column": 1, "name": "Filter_4", "row": 10, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(230, 236, 242, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil2 = '{ "colspan": 1, "column": 1, "name": "Filter_4", "row": 6, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil3 = '{ "colspan": 1, "column": 3, "name": "Filter_4", "row": 4, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil4  = '"KPI'+RowNumber+'_Grouping_4": { "datasets": [{ "id": "#'+RowNumber+'DatasetId#", "name": "#'+RowNumber+'DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#'+RowNumber+'DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI'+RowNumber+'_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0,\\\\\\"alias4\\\\\\").asGrouping()}}; q = foreach q generate {{row(KPI'+RowNumber+'_Static_Dimensions.selection, [0], [\\\\\\"value4\\\\\\", \\\\\\"alias4\\\\\\"]).asProjection()}}, {{row(KPI'+RowNumber+'_Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\\\n; q = order q by {{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"alias\\\\\\"]).asGrouping()}} {{column(KPI'+RowNumber+'_Static_Order.selection, [\\\\\\"value\\\\\\"]).asObject()}};\\",\\"measures\\":\\"{{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\":true,\\"groups\\":[\\"{{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0, \\\\\\"alias4\\\\\\").asObject()}}\\"]}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                                DimenVal5  = '"KPI'+RowNumber+'_Chart_4": { "parameters": { "autoFitMode": "none", "totalValue": "computeTotal", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "tooltip": { "showBinLabel": true, "measures": "", "showPercentage": true, "showDimensions": true, "showMeasures": true, "customizeTooltip": false, "dimensions": "" }, "visualizationType": "hbar", "exploreLink": true, "title": { "fontSize": 14, "subtitleFontSize": 11, "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "size": [100, 100], "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "totalLabel": "", "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "step": "KPI'+RowNumber+'_Grouping_4", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "", "icons": { "useIcons": false, "iconProps": { "fit": "cover", "column": "", "type": "round" } } } }, "type": "chart" },';
                                DimenFil6='{ "colspan": 3, "column": 12, "name": "Chart_4", "row": 8, "rowspan": 6, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil7='{ "colspan": 3, "column": 3, "name": "Chart_4", "row": 17, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil8='{ "colspan": 4, "column": 0, "name": "Chart_4", "row": 27, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil9 ='"KPI'+RowNumber+'_Chart_Title_4": { "parameters": { "fontSize": 20, "text": "{{ cell(KPI'+RowNumber+'_Static_Dimensions.selection, 0, \\"label4\\").asString()}}", "textAlignment": "center", "textColor": "#091A3E" }, "type": "text" },';
                                DimenFil10='{ "colspan": 3, "column": 12, "name": "Chart_Title_4", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#F2F6FA", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil11='{ "colspan": 3, "column": 3, "name": "Chart_Title_4", "row": 16, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil12='{ "colspan": 4, "column": 0, "name": "Chart_Title_4", "row": 26, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                
                                StrNew = '"KPI'+RowNumber+'_Chart_Title_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew1 = '"KPI'+RowNumber+'_Chart_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew2 = '"KPI'+RowNumber+'_Filter_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                 Strs='\\"#'+RowNumber+'alias'+k+'#\\",';
                                
                            }
                            if(k==3){
                                DimenVal = '"KPI'+RowNumber+'_Filter_3": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "KPI'+RowNumber+'_Filter_3", "title": "#'+RowNumber+'label3#" }, "type": "listselector" },';
                                DimenFil1 = '{ "colspan": 2, "column": 1, "name": "Filter_3", "row": 9, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(230, 236, 242, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil2 = '{ "colspan": 1, "column": 0, "name": "Filter_3", "row": 6, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil3 = '{ "colspan": 1, "column": 2, "name": "Filter_3", "row": 4, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil11='{ "colspan": 4, "column": 0, "name": "Chart_Title_3", "row": 21, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil12='{ "colspan": 3, "column": 0, "name": "Chart_Title_3", "row": 16, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil6='{ "colspan": 3, "column": 9, "name": "Chart_Title_3", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#F2F6FA", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil9 ='"KPI'+RowNumber+'_Chart_Title_3": { "parameters": { "fontSize": 20, "text": "{{ cell(KPI'+RowNumber+'_Static_Dimensions.selection, 0, \\"label3\\").asString()}}", "textAlignment": "center", "textColor": "#091A3E" }, "type": "text" },';
                                DimenFil8='{ "colspan": 3, "column": 9, "name": "Chart_3", "row": 8, "rowspan": 6, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil7='{ "colspan": 3, "column": 0, "name": "Chart_3", "row": 17, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil10='{ "colspan": 4, "column": 0, "name": "Chart_3", "row": 22, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenVal5  = '"KPI'+RowNumber+'_Chart_3": { "parameters": { "autoFitMode": "none", "totalValue": "computeTotal", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "tooltip": { "showBinLabel": true, "measures": "", "showPercentage": true, "showDimensions": true, "showMeasures": true, "customizeTooltip": false, "dimensions": "" }, "visualizationType": "hbar", "exploreLink": true, "title": { "fontSize": 14, "subtitleFontSize": 11, "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "size": [100, 100], "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "totalLabel": "", "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "step": "KPI'+RowNumber+'_Grouping_3", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "", "icons": { "useIcons": false, "iconProps": { "fit": "cover", "column": "", "type": "round" } } } }, "type": "chart" },';
                                DimenFil4  = '"KPI'+RowNumber+'_Grouping_3": { "datasets": [{ "id": "#'+RowNumber+'DatasetId#", "name": "#'+RowNumber+'DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#'+RowNumber+'DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI'+RowNumber+'_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0,\\\\\\"alias3\\\\\\").asGrouping()}}; q = foreach q generate {{row(KPI'+RowNumber+'_Static_Dimensions.selection, [0], [\\\\\\"value3\\\\\\", \\\\\\"alias3\\\\\\"]).asProjection()}}, {{row(KPI'+RowNumber+'_Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\\\n; q = order q by {{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"alias\\\\\\"]).asGrouping()}} {{column(KPI'+RowNumber+'_Static_Order.selection, [\\\\\\"value\\\\\\"]).asObject()}};\\",\\"measures\\":\\"{{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\":true,\\"groups\\":[\\"{{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0, \\\\\\"alias3\\\\\\").asObject()}}\\"]}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                            
                                StrNew = '"KPI'+RowNumber+'_Chart_Title_3": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew1 = '"KPI'+RowNumber+'_Chart_3": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew2 = '"KPI'+RowNumber+'_Filter_3": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                 Strs='\\"#'+RowNumber+'alias'+k+'#\\",';
                            }
                            if(k==2){
                                DimenVal = '"KPI'+RowNumber+'_Filter_2": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "KPI'+RowNumber+'_Filter_2", "title": "#'+RowNumber+'label2#" }, "type": "listselector" },';  
                                DimenFil1 = '{ "colspan": 2, "column": 1, "name": "Filter_2", "row": 8, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(230, 236, 242, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil2 = '{ "colspan": 1, "column": 1, "name": "Filter_2", "row": 5, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil3 = '{ "colspan": 1, "column": 1, "name": "Filter_2", "row": 4, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil4  = '"KPI'+RowNumber+'_Grouping_2": { "datasets": [{ "id": "#'+RowNumber+'DatasetId#", "name": "#'+RowNumber+'DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#'+RowNumber+'DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI'+RowNumber+'_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0,\\\\\\"alias2\\\\\\").asGrouping()}}; q = foreach q generate {{row(KPI'+RowNumber+'_Static_Dimensions.selection, [0], [\\\\\\"value2\\\\\\", \\\\\\"alias2\\\\\\"]).asProjection()}}, {{row(KPI'+RowNumber+'_Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\\\n; q = order q by {{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"alias\\\\\\"]).asGrouping()}} {{column(KPI'+RowNumber+'_Static_Order.selection, [\\\\\\"value\\\\\\"]).asObject()}};\\",\\"measures\\":\\"{{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\":true,\\"groups\\":[\\"{{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0, \\\\\\"alias2\\\\\\").asObject()}}\\"]}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                                DimenVal5  = '"KPI'+RowNumber+'_Chart_2": { "parameters": { "autoFitMode": "none", "totalValue": "computeTotal", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "tooltip": { "showBinLabel": true, "measures": "", "showPercentage": true, "showDimensions": true, "showMeasures": true, "customizeTooltip": false, "dimensions": "" }, "visualizationType": "hbar", "exploreLink": true, "title": { "fontSize": 14, "subtitleFontSize": 11, "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "size": [100, 100], "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "totalLabel": "", "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "step": "KPI'+RowNumber+'_Grouping_2", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "", "icons": { "useIcons": false, "iconProps": { "fit": "cover", "column": "", "type": "round" } } } }, "type": "chart" },';
                                DimenFil6='{ "colspan": 3, "column": 3, "name": "Chart_2", "row": 12, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil7='{ "colspan": 3, "column": 6, "name": "Chart_2", "row": 8, "rowspan": 6, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil8='{ "colspan": 4, "column": 0, "name": "Chart_2", "row": 17, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil9 ='"KPI'+RowNumber+'_Chart_Title_2": { "parameters": { "fontSize": 20, "text": "{{ cell(KPI'+RowNumber+'_Static_Dimensions.selection, 0, \\"label2\\").asString()}}", "textAlignment": "center", "textColor": "#091A3E" }, "type": "text" },';   
                                DimenFil10='{ "colspan": 3, "column": 6, "name": "Chart_Title_2", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#F2F6FA", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil11='{ "colspan": 3, "column": 3, "name": "Chart_Title_2", "row": 11, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil12='{ "colspan": 4, "column": 0, "name": "Chart_Title_2", "row": 16, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                StrNew = '"KPI'+RowNumber+'_Chart_Title_2": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew1 = '"KPI'+RowNumber+'_Chart_2": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew2 = '"KPI'+RowNumber+'_Filter_2": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                 Strs='\\"#'+RowNumber+'alias'+k+'#\\",';
                            }
                            if(k==1){    
                             
                              DimenVal = '"KPI'+RowNumber+'_Filter_1": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "KPI'+RowNumber+'_Filter_1", "title": "#'+RowNumber+'label1#" }, "type": "listselector" },'; 
                              DimenFil1 = '{ "colspan": 2, "column": 1, "name": "Filter_2", "row": 8, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(230, 236, 242, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil2 = '{ "colspan": 1, "column": 1, "name": "Filter_2", "row": 5, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil3 = '{ "colspan": 1, "column": 1, "name": "Filter_2", "row": 4, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 4, "borderWidth": 4 } },';
                                
                               DimenFil6='{ "colspan": 3, "column": 3, "name": "Chart_2", "row": 12, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil7='{ "colspan": 3, "column": 6, "name": "Chart_2", "row": 8, "rowspan": 6, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil8='{ "colspan": 4, "column": 0, "name": "Chart_2", "row": 17, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                               
                              DimenFil9 ='"KPI'+RowNumber+'_Chart_Title_1": { "parameters": { "fontSize": 20, "text": "{{ cell(KPI'+RowNumber+'_Static_Dimensions.selection, 0, \\"label2\\").asString()}}", "textAlignment": "center", "textColor": "#091A3E" }, "type": "text" },';
                              DimenFil4  = '"KPI'+RowNumber+'_Grouping_1": { "datasets": [{ "id": "#'+RowNumber+'DatasetId#", "name": "#'+RowNumber+'DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#'+RowNumber+'DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI'+RowNumber+'_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0,\\\\\\"alias1\\\\\\").asGrouping()}}; q = foreach q generate {{row(KPI'+RowNumber+'_Static_Dimensions.selection, [0], [\\\\\\"value1\\\\\\", \\\\\\"alias1\\\\\\"]).asProjection()}}, {{row(KPI'+RowNumber+'_Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\\\n; q = order q by {{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"alias\\\\\\"]).asGrouping()}} {{column(KPI'+RowNumber+'_Static_Order.selection, [\\\\\\"value\\\\\\"]).asObject()}};\\",\\"measures\\":\\"{{column(KPI'+RowNumber+'_Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\":true,\\"groups\\":[\\"{{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0, \\\\\\"alias1\\\\\\").asObject()}}\\"]}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';  
                              DimenFil10='{ "colspan": 3, "column": 6, "name": "Chart_Title_2", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#F2F6FA", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil11='{ "colspan": 3, "column": 3, "name": "Chart_Title_2", "row": 11, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil12='{ "colspan": 4, "column": 0, "name": "Chart_Title_2", "row": 16, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                              
                                DimenVal5  = '"KPI'+RowNumber+'_Chart_1": { "parameters": { "autoFitMode": "none", "totalValue": "computeTotal", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "tooltip": { "showBinLabel": true, "measures": "", "showPercentage": true, "showDimensions": true, "showMeasures": true, "customizeTooltip": false, "dimensions": "" }, "visualizationType": "hbar", "exploreLink": true, "title": { "fontSize": 14, "subtitleFontSize": 11, "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "size": [100, 100], "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "totalLabel": "", "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "step": "KPI'+RowNumber+'_Grouping_1", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "", "icons": { "useIcons": false, "iconProps": { "fit": "cover", "column": "", "type": "round" } } } }, "type": "chart" },';
                            
                                 StrNew = '"KPI'+RowNumber+'_Chart_Title_1": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew1 = '"KPI'+RowNumber+'_Chart_1": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew2 = '"KPI'+RowNumber+'_Filter_1": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                Strs='\\"#'+RowNumber+'alias'+k+'#\\",';
                                
                            }
                            String Strs1;
                            if(K== 8){
                              Strs1='\"#'+RowNumber+'alias8#\"';
                            }
                            else{
                              Strs1='\"#'+RowNumber+'alias'+k+'#\",';
                            }
                            
                            SalesString =  SalesString.replace(DimenVal,StrNew2).replace(DimenFil1,'').replace(DimenFil2,'').replace(DimenFil3,'').replace(Strs,'');
                            SalesString =  SalesString.replace(DimenFil4,'').replace(DimenVal5,StrNew1).replace(DimenFil6,'').replace(DimenFil7,'').replace(Strs1,'');
                            SalesString =  SalesString.replace(DimenFil8,'').replace(DimenFil9,StrNew).replace(DimenFil10,'').replace(DimenFil11,'').replace(DimenFil12,'');
                             
                        }
                    
                         String DimenAll = '"Static_Group": { "datasets": [], "dimensions": [], "groups": [], "isFacet": false, "isGlobal": false, "numbers": [], "selectMode": "singlerequired", "strings": [], "type": "staticflex", "useGlobal": false, "values": [ "{\\"display\\": \\"#label1\\",\\"value\\": \\"#alias1#\\",\\"expression\\": \\"\'#alias1#\'\\",\\"alias\\": \\"#alias1#\\"}", "{\\"display\\": \\"#label2#\\",\\"value\\": \\"#alias2#\\",\\"expression\\": \\"\'#alias2#\'\\",\\"alias\\": \\"#alias2#\\"}", "{\\"display\\": \\"#label3#\\",\\"value\\": \\"#alias3#\\",\\"expression\\": \\"\'#alias3#\'\\",\\"alias\\": \\"#alias3#\\"}", "{\\"display\\": \\"#label4#\\",\\"value\\": \\"#alias4#\\",\\"expression\\": \\"\'#alias4#\'\\",\\"alias\\": \\"#alias4#\\"}", "{\\"display\\": \\"#label5#\\",\\"value\\": \\"#alias5#\\",\\"expression\\": \\"\'#alias5#\'\\",\\"alias\\": \\"#alias5#\\"}", "{\\"display\\": \\"#label6#\\",\\"value\\": \\"#alias6#\\",\\"expression\\": \\"\'#alias6#\'\\",\\"alias\\": \\"#alias6#\\"}", "{\\"display\\": \\"#label7#\\",\\"value\\": \\"#alias7#\\",\\"expression\\": \\"\'#alias7#\'\\",\\"alias\\": \\"#alias7#\\"}", "{\\"display\\": \\"#label8#\\",\\"value\\": \\"#alias8#\\",\\"expression\\": \\"\'#alias8#\'\\",\\"alias\\": \\"#alias8#\\"}" ] },';
                      SalesString =  SalesString.replace(DimenAll,'');
                      
                      String DimensLabel = '"Additional_Feature_List_2": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "step": "Static_Group", "title": "Choose Grouping" }, "type": "listselector" },';
                      SalesString =  SalesString.replace(DimensLabel,'');
                      
                      String DimensLabel1 = '{ "colspan": 3, "column": 12, "name": "Additional_Feature_List_2", "row": 23, "rowspan": 1, "widgetStyle": { "borderEdges": [] } },';
                      SalesString =  SalesString.replace(DimensLabel1,'');
                      
                      String DimensLabel2 = '{ "colspan": 2, "column": 2, "name": "Additional_Feature_List_2", "row": 58, "rowspan": 1, "widgetStyle": { "borderEdges": [] } },';
                      SalesString =  SalesString.replace(DimensLabel2,'');
                      
                      String DimensLabel3 = '{ "colspan": 1, "column": 5, "name": "Additional_Feature_List_2", "row": 32, "rowspan": 1, "widgetStyle": { "borderEdges": [] } },';
                      SalesString =  SalesString.replace(DimensLabel3,'');

                        for(Integer L=1;3 >= L;L++){
                            String Str;
                            String Str1;
                            String Str2;
                            String Str3;
                            String Str4;
                            String Str5;
                            String Str6;
                            String StrNew;
                            integer k = L;
                                if(K == 3){                                 
                                    Str = ', "{\\\"display\\":\\"#'+RowNumber+'datelabel3# (Quarter)\\",\\"alias1\\":\\"#'+RowNumber+'datealias3#_Year\\",\\"expression1\\":\\"\'#'+RowNumber+'datealias3#_Year\'\\",\\"alias2\\":\\"#'+RowNumber+'datealias3#_Quarter\\",\\"expression2\\":\\"\'#'+RowNumber+'datealias3#_Quarter\'\\",\\"value\\":[\\"#'+RowNumber+'datealias3#_Quarter\\",\\"#'+RowNumber+'datealias3#_Year\\"],\\"filter\\":[\\"#'+RowNumber+'datealias3#_Year\\",\\"#'+RowNumber+'datealias3#_Month\\",\\"#'+RowNumber+'datealias3#_Day\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel3# (Month)\\",\\"alias1\\":\\"#'+RowNumber+'datealias3#_Year\\",\\"expression1\\":\\"\'#'+RowNumber+'datealias3#_Year\'\\",\\"alias2\\":\\"#'+RowNumber+'datealias3#_Month\\",\\"expression2\\":\\"\'#'+RowNumber+'datealias3#_Month\'\\",\\"value\\":[\\"#'+RowNumber+'datealias3#_Month\\",\\"#'+RowNumber+'datealias3#_Year\\"],\\"filter\\":[\\"#'+RowNumber+'datealias3#_Year\\",\\"#'+RowNumber+'datealias3#_Month\\",\\"#'+RowNumber+'datealias3#_Day\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel3# (Week)\\",\\"alias1\\":\\"#'+RowNumber+'datealias3#_Year\\",\\"expression1\\":\\"\'#'+RowNumber+'datealias3#_Year\'\\",\\"alias2\\":\\"#'+RowNumber+'datealias3#_Week\\",\\"expression2\\":\\"\'#'+RowNumber+'datealias3#_Week\'\\",\\"value\\":[\\"#'+RowNumber+'datealias3#_Week\\",\\"#'+RowNumber+'datealias3#_Year\\"],\\"filter\\":[\\"#'+RowNumber+'datealias3#_Year\\",\\"#'+RowNumber+'datealias3#_Month\\",\\"#'+RowNumber+'datealias3#_Day\\"]}"';                                   
                                    Str1 = ', "{\\"display\\":\\"#'+RowNumber+'datelabel3# (Quarter)\\",\\"alias\\":\\"#'+RowNumber+'datealias3#_Year~~~#'+RowNumber+'datealias3#_Quarter\\",\\"expression\\":\\"\'#'+RowNumber+'datealias3#_Year\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias3#_Quarter\'\\",\\"value\\":[\\"#'+RowNumber+'datealias3#_Year\\",\\"#'+RowNumber+'datealias3#_Quarter\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel3# (Month)\\",\\"alias\\":\\"#'+RowNumber+'datealias3#_Year~~~#'+RowNumber+'datealias3#_Month\\",\\"expression\\":\\"\'#'+RowNumber+'datealias3#_Year\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias3#_Month\'\\",\\"value\\":[\\"#'+RowNumber+'datealias3#_Year\\",\\"#'+RowNumber+'datealias3#_Month\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel3# (Week)\\",\\"alias\\":\\"#'+RowNumber+'datealias3#_Year~~~#'+RowNumber+'datealias3#_Week\\",\\"expression\\":\\"\'#'+RowNumber+'datealias3#_Year\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias3#_Week\'\\",\\"value\\":[\\"#'+RowNumber+'datealias3#_Year\\",\\"#'+RowNumber+'datealias3#_Week\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel3# (Day)\\",\\"alias\\":\\"#'+RowNumber+'datealias3#_Year~~~#'+RowNumber+'datealias3#_Month~~~#'+RowNumber+'datealias3#_Day\\",\\"expression\\":\\"\'#'+RowNumber+'datealias3#_Year\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias3#_Month\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias3#_Day\'\\",\\"value\\":[\\"#'+RowNumber+'datealias3#_Year\\",\\"#'+RowNumber+'datealias3#_Month\\",\\"#'+RowNumber+'datealias3#_Day\\"]}"';
                                   Str2 = '"KPI'+RowNumber+'_Date_3": { "datasets": [{ "id": "#'+RowNumber+'DatasetId#", "name": "#'+RowNumber+'DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"measures\\":[[\\"count\\",\\"*\\"]],\\"groups\\":[\\"{{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0,\\\\\\"datealias3\\\\\\").asObject()}}\\"]}", "version": -1.0 }, "selectMode": "single", "type": "aggregateflex", "useGlobal": false, "visualizationParameters": {} },';
                                   Str3 = '"KPI'+RowNumber+'_dateselector_2": { "parameters": { "calendarTypeSwitchingAllowed": false, "defaultAbsoluteMode": true, "defaultFiscalMode": false, "instant": false, "modeSwitchingAllowed": true, "step": "KPI'+RowNumber+'_Date_3", "title": "#'+RowNumber+'datelabel3#" }, "type": "dateselector" },';
                                    StrNew = '"KPI'+RowNumber+'_dateselector_2": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                }
                                if(K== 2){
                                  Str = ', "{\\\"display\\":\\"#'+RowNumber+'datelabel2# (Quarter)\\",\\"alias1\\":\\"#'+RowNumber+'datealias2#_Year\\",\\"expression1\\":\\"\'#'+RowNumber+'datealias2#_Year\'\\",\\"alias2\\":\\"#'+RowNumber+'datealias2#_Quarter\\",\\"expression2\\":\\"\'#'+RowNumber+'datealias2#_Quarter\'\\",\\"value\\":[\\"#'+RowNumber+'datealias2#_Quarter\\",\\"#'+RowNumber+'datealias2#_Year\\"],\\"filter\\":[\\"#'+RowNumber+'datealias2#_Year\\",\\"#'+RowNumber+'datealias2#_Month\\",\\"#'+RowNumber+'datealias2#_Day\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel2# (Month)\\",\\"alias1\\":\\"#'+RowNumber+'datealias2#_Year\\",\\"expression1\\":\\"\'#'+RowNumber+'datealias2#_Year\'\\",\\"alias2\\":\\"#'+RowNumber+'datealias2#_Month\\",\\"expression2\\":\\"\'#'+RowNumber+'datealias2#_Month\'\\",\\"value\\":[\\"#'+RowNumber+'datealias2#_Month\\",\\"#'+RowNumber+'datealias2#_Year\\"],\\"filter\\":[\\"#'+RowNumber+'datealias2#_Year\\",\\"#'+RowNumber+'datealias2#_Month\\",\\"#'+RowNumber+'datealias2#_Day\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel2# (Week)\\",\\"alias1\\":\\"#'+RowNumber+'datealias2#_Year\\",\\"expression1\\":\\"\'#'+RowNumber+'datealias2#_Year\'\\",\\"alias2\\":\\"#'+RowNumber+'datealias2#_Week\\",\\"expression2\\":\\"\'#'+RowNumber+'datealias2#_Week\'\\",\\"value\\":[\\"#'+RowNumber+'datealias2#_Week\\",\\"#'+RowNumber+'datealias2#_Year\\"],\\"filter\\":[\\"#'+RowNumber+'datealias2#_Year\\",\\"#'+RowNumber+'datealias2#_Month\\",\\"#'+RowNumber+'datealias2#_Day\\"]}"';                                   
                                    Str1 = ', "{\\"display\\":\\"#'+RowNumber+'datelabel2# (Quarter)\\",\\"alias\\":\\"#'+RowNumber+'datealias2#_Year~~~#'+RowNumber+'datealias2#_Quarter\\",\\"expression\\":\\"\'#'+RowNumber+'datealias2#_Year\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias2#_Quarter\'\\",\\"value\\":[\\"#'+RowNumber+'datealias2#_Year\\",\\"#'+RowNumber+'datealias2#_Quarter\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel2# (Month)\\",\\"alias\\":\\"#'+RowNumber+'datealias2#_Year~~~#'+RowNumber+'datealias2#_Month\\",\\"expression\\":\\"\'#'+RowNumber+'datealias2#_Year\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias2#_Month\'\\",\\"value\\":[\\"#'+RowNumber+'datealias2#_Year\\",\\"#'+RowNumber+'datealias2#_Month\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel2# (Week)\\",\\"alias\\":\\"#'+RowNumber+'datealias2#_Year~~~#'+RowNumber+'datealias2#_Week\\",\\"expression\\":\\"\'#'+RowNumber+'datealias2#_Year\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias2#_Week\'\\",\\"value\\":[\\"#'+RowNumber+'datealias2#_Year\\",\\"#'+RowNumber+'datealias2#_Week\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel2# (Day)\\",\\"alias\\":\\"#'+RowNumber+'datealias2#_Year~~~#'+RowNumber+'datealias2#_Month~~~#'+RowNumber+'datealias2#_Day\\",\\"expression\\":\\"\'#'+RowNumber+'datealias2#_Year\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias2#_Month\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias2#_Day\'\\",\\"value\\":[\\"#'+RowNumber+'datealias2#_Year\\",\\"#'+RowNumber+'datealias2#_Month\\",\\"#'+RowNumber+'datealias2#_Day\\"]}"';
                                     Str2 = '"KPI'+RowNumber+'_Date_2": { "datasets": [{ "id": "#'+RowNumber+'DatasetId#", "name": "#'+RowNumber+'DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"measures\\":[[\\"count\\",\\"*\\"]],\\"groups\\":[\\"{{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0,\\\\\\"datealias2\\\\\\").asObject()}}\\"]}", "version": -1.0 }, "selectMode": "single", "type": "aggregateflex", "useGlobal": false, "visualizationParameters": {} },';
                                   Str3 = '"KPI'+RowNumber+'_dateselector_1": { "parameters": { "calendarTypeSwitchingAllowed": false, "defaultAbsoluteMode": true, "defaultFiscalMode": false, "instant": false, "modeSwitchingAllowed": true, "step": "KPI'+RowNumber+'_Date_2", "title": "#'+RowNumber+'datelabel2#" }, "type": "dateselector" },';
                                    StrNew = '"KPI'+RowNumber+'_dateselector_1": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                }    
                                if(K== 1){
                                   Str = ', "{\\\"display\\":\\"#'+RowNumber+'datelabel1# (Quarter)\\",\\"alias1\\":\\"#'+RowNumber+'datealias1#_Year\\",\\"expression1\\":\\"\'#'+RowNumber+'datealias1#_Year\'\\",\\"alias2\\":\\"#'+RowNumber+'datealias1#_Quarter\\",\\"expression2\\":\\"\'#'+RowNumber+'datealias1#_Quarter\'\\",\\"value\\":[\\"#'+RowNumber+'datealias1#_Quarter\\",\\"#'+RowNumber+'datealias1#_Year\\"],\\"filter\\":[\\"#'+RowNumber+'datealias1#_Year\\",\\"#'+RowNumber+'datealias1#_Month\\",\\"#'+RowNumber+'datealias1#_Day\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel1# (Month)\\",\\"alias1\\":\\"#'+RowNumber+'datealias1#_Year\\",\\"expression1\\":\\"\'#'+RowNumber+'datealias1#_Year\'\\",\\"alias2\\":\\"#'+RowNumber+'datealias1#_Month\\",\\"expression2\\":\\"\'#'+RowNumber+'datealias1#_Month\'\\",\\"value\\":[\\"#'+RowNumber+'datealias1#_Month\\",\\"#'+RowNumber+'datealias1#_Year\\"],\\"filter\\":[\\"#'+RowNumber+'datealias1#_Year\\",\\"#'+RowNumber+'datealias1#_Month\\",\\"#'+RowNumber+'datealias1#_Day\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel1# (Week)\\",\\"alias1\\":\\"#'+RowNumber+'datealias1#_Year\\",\\"expression1\\":\\"\'#'+RowNumber+'datealias1#_Year\'\\",\\"alias2\\":\\"#'+RowNumber+'datealias1#_Week\\",\\"expression2\\":\\"\'#'+RowNumber+'datealias1#_Week\'\\",\\"value\\":[\\"#'+RowNumber+'datealias1#_Week\\",\\"#'+RowNumber+'datealias1#_Year\\"],\\"filter\\":[\\"#'+RowNumber+'datealias1#_Year\\",\\"#'+RowNumber+'datealias1#_Month\\",\\"#'+RowNumber+'datealias1#_Day\\"]}"';                                   
                                    Str1 = ', "{\\"display\\":\\"#'+RowNumber+'datelabel1# (Quarter)\\",\\"alias\\":\\"#'+RowNumber+'datealias1#_Year~~~#'+RowNumber+'datealias1#_Quarter\\",\\"expression\\":\\"\'#'+RowNumber+'datealias1#_Year\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias1#_Quarter\'\\",\\"value\\":[\\"#'+RowNumber+'datealias1#_Year\\",\\"#'+RowNumber+'datealias1#_Quarter\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel1# (Month)\\",\\"alias\\":\\"#'+RowNumber+'datealias1#_Year~~~#'+RowNumber+'datealias1#_Month\\",\\"expression\\":\\"\'#'+RowNumber+'datealias1#_Year\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias1#_Month\'\\",\\"value\\":[\\"#'+RowNumber+'datealias1#_Year\\",\\"#'+RowNumber+'datealias1#_Month\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel1# (Week)\\",\\"alias\\":\\"#'+RowNumber+'datealias1#_Year~~~#'+RowNumber+'datealias1#_Week\\",\\"expression\\":\\"\'#'+RowNumber+'datealias1#_Year\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias1#_Week\'\\",\\"value\\":[\\"#'+RowNumber+'datealias1#_Year\\",\\"#'+RowNumber+'datealias1#_Week\\"]}", "{\\"display\\":\\"#'+RowNumber+'datelabel1# (Day)\\",\\"alias\\":\\"#'+RowNumber+'datealias1#_Year~~~#'+RowNumber+'datealias1#_Month~~~#'+RowNumber+'datealias1#_Day\\",\\"expression\\":\\"\'#'+RowNumber+'datealias1#_Year\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias1#_Month\' + \\\\\\"~~~\\\\\\" + \'#'+RowNumber+'datealias1#_Day\'\\",\\"value\\":[\\"#'+RowNumber+'datealias1#_Year\\",\\"#'+RowNumber+'datealias1#_Month\\",\\"#'+RowNumber+'datealias1#_Day\\"]}"';
                                   Str2 = '"KPI'+RowNumber+'_Date_1": { "datasets": [{ "id": "#'+RowNumber+'DatasetId#", "name": "#'+RowNumber+'DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"measures\\":[[\\"count\\",\\"*\\"]],\\"groups\\":[\\"{{cell(KPI'+RowNumber+'_Static_Dimensions.selection,0, \\\\\\"datealias1\\\\\\").asObject()}}\\"]}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": false, "visualizationParameters": {} },';
                                      Str3 = '"Date_KPI'+RowNumber+'_Filter_1": { "parameters": { "calendarTypeSwitchingAllowed": false, "defaultAbsoluteMode": true, "defaultFiscalMode": false, "instant": false, "modeSwitchingAllowed": true, "step": "KPI'+RowNumber+'_Date_1", "title": "#'+RowNumber+'datelabel1#" }, "type": "dateselector" },';
                                    StrNew = '"Date_KPI'+RowNumber+'_Filter_1": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                }
                                
                                String DateString = ',\\"datevalue'+k+'\\": \\"\'#'+RowNumber+'datealias'+k+'#\'\\",\\"datealias'+k+'\\": \\"#'+RowNumber+'datealias'+k+'#\\",\\"datelabel'+k+'\\": \\"#'+RowNumber+'datelabel'+k+'#\\"';  
                                SalesString =  SalesString.replace(Str,'').replace(Str1,'').replace(DateString,''); 
                                SalesString =  SalesString.replace(Str3,StrNew).replace(Str2,'');
                            }
                        integer j = 5;
                       
                        for(Integer L=1;J >= L;L++){   
                            integer k = L;
                            String Str1;
                            String Str2;
                            String Str3;
                            String Str4;
                            String Str5;
                            String Str6;
                            String Str7 = '';
                            if(K == 5){
                              Str1 = ', "{\\"display\\": \\"#'+RowNumber+'label'+k+'#\\",\\"value\\": \\"#'+RowNumber+'alias'+k+'#\\",\\"expression\\": \\"\'#'+RowNumber+'alias'+k+'#\'\\",\\"alias\\": \\"#'+RowNumber+'alias'+k+'#\\"}"';
                                 Str2 = ', "{\\"display\\": \\"#'+RowNumber+'MeasureLabel5#\\",\\"cf\\": [\\"#'+RowNumber+'CompactMeasureAPI5#\\"],\\"expression\\": \\"#'+RowNumber+'ExpressionMeasureAPI5#\\",\\"alias\\": \\"#'+RowNumber+'MeasureAlias5#\\"}" ';
                               
                            }
                            else{
                              Str1 = ', "{\\"display\\": \\"#'+RowNumber+'label'+k+'#\\",\\"value\\": \\"#'+RowNumber+'alias'+k+'#\\",\\"expression\\": \\"\'#'+RowNumber+'alias'+k+'#\'\\",\\"alias\\": \\"#'+RowNumber+'alias'+k+'#\\"}"';
                                 Str2 = ', "{\\"display\\": \\"#'+RowNumber+'MeasureLabel'+k+'#\\",\\"cf\\": [\\"#'+RowNumber+'CompactMeasureAPI'+k+'#\\"],\\"expression\\": \\"#'+RowNumber+'ExpressionMeasureAPI'+k+'#\\",\\"alias\\": \\"#'+RowNumber+'MeasureAlias'+k+'#\\"}"';
                              
                            }
                            if(k == 4){
                              Str3 = '"KPI'+RowNumber+'_KPI_4": { "parameters": { "compact": true, "exploreLink": true, "measureField": "#'+RowNumber+'measurealias4#", "numberColor": "#FFFFFF", "numberSize": 32, "step": "KPI'+RowNumber+'_KPIs", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                                 Str4 = '{ "colspan": 3, "column": 12, "name": "KPI_4", "row": 3, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                 Str5 = '{ "colspan": 2, "column": 4, "name": "KPI_4", "row": 7, "rowspan": 2, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                 Str6 = '{ "colspan": 1, "column": 3, "name": "KPI_4", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                            Str7 = '"KPI'+RowNumber+'_KPI_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                 String StrMeasure = ',\\"labelkpi'+k+'\\":\\"#'+RowNumber+'MeasureLabel'+k+'#\\",\\"expression'+k+'\\":\\"#'+RowNumber+'MeasureExpression'+k+'#\\",\\"cfkpi'+k+'\\":[\\"#'+RowNumber+'CompactMeasureAPI'+k+'#\\"],\\"aliaskpi'+k+'\\":\\"#'+RowNumber+'MeasureAlias'+k+'#\\"';                           
                                 SalesString =  SalesString.replace(StrMeasure,'');
                            }
                            if(k == 3){
                              Str3 = '"KPI'+RowNumber+'_KPI_3": { "parameters": { "compact": true, "exploreLink": true, "measureField": "#'+RowNumber+'measurealias3#", "numberColor": "#FFFFFF", "numberSize": 32, "step": "KPI'+RowNumber+'_KPIs", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                                 Str4 = '{ "colspan": 3, "column": 9, "name": "KPI_3", "row": 3, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                 Str5 = '{ "colspan": 2, "column": 2, "name": "KPI_3", "row": 7, "rowspan": 2, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                 Str6 = '{ "colspan": 1, "column": 2, "name": "KPI_3", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                Str7 = '"KPI'+RowNumber+'_KPI_3": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                 String StrMeasure = ',\\"labelkpi'+k+'\\":\\"#'+RowNumber+'MeasureLabel'+k+'#\\",\\"expression'+k+'\\":\\"#'+RowNumber+'MeasureExpression'+k+'#\\",\\"cfkpi'+k+'\\":[\\"#'+RowNumber+'CompactMeasureAPI'+k+'#\\"],\\"aliaskpi'+k+'\\":\\"#'+RowNumber+'MeasureAlias'+k+'#\\"';                           
                                 SalesString =  SalesString.replace(StrMeasure,'');
                                
                            }
                            if(k == 2){
                              Str3 = '"KPI'+RowNumber+'_KPI_2": { "parameters": { "compact": true, "exploreLink": true, "measureField": "#'+RowNumber+'measurealias2#", "numberColor": "#FFFFFF", "numberSize": 32, "step": "KPI'+RowNumber+'_KPIs", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                                 Str4 = '{ "colspan": 3, "column": 6, "name": "KPI_2", "row": 3, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                 Str5 = '{ "colspan": 2, "column": 4, "name": "KPI_2", "row": 4, "rowspan": 2, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                 Str6 = '{ "colspan": 1, "column": 1, "name": "KPI_2", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                Str7 = '"KPI'+RowNumber+'_KPI_2": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                 String StrMeasure = ',\\"labelkpi'+k+'\\":\\"#'+RowNumber+'MeasureLabel'+k+'#\\",\\"expression'+k+'\\":\\"#'+RowNumber+'MeasureExpression'+k+'#\\",\\"cfkpi'+k+'\\":[\\"#'+RowNumber+'CompactMeasureAPI'+k+'#\\"],\\"aliaskpi'+k+'\\":\\"#'+RowNumber+'MeasureAlias'+k+'#\\"';                           
                                 SalesString =  SalesString.replace(StrMeasure,'');
                            }
                            if(k == 1){
                              Str3 = '"KPI'+RowNumber+'_KPI_1": { "parameters": { "compact": true, "exploreLink": true, "measureField": "#'+RowNumber+'measurealias1#", "numberColor": "#FFFFFF", "numberSize": 32, "step": "KPI'+RowNumber+'_KPIs", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                                 Str4 = '{ "colspan": 3, "column": 6, "name": "KPI_2", "row": 3, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                 Str5 = '{ "colspan": 2, "column": 4, "name": "KPI_2", "row": 4, "rowspan": 2, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                 Str6 = '{ "colspan": 1, "column": 1, "name": "KPI_2", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                Str7 = '"KPI'+RowNumber+'_KPI_1": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                String StrMeasure = '\\"labelkpi'+k+'\\":\\"#'+RowNumber+'MeasureLabel'+k+'#\\",\\"expression'+k+'\\":\\"#'+RowNumber+'MeasureExpression'+k+'#\\",\\"cfkpi'+k+'\\":[\\"#'+RowNumber+'CompactMeasureAPI'+k+'#\\"],\\"aliaskpi'+k+'\\":\\"#'+RowNumber+'MeasureAlias'+k+'#\\"';                           
                                 SalesString =  SalesString.replace(StrMeasure,'');
                            }
                            String StrMeasure = ',\\"labelkpi'+k+'\\": \\"#'+RowNumber+'MeasureLabel'+k+'#\\",\\"expression'+k+'\\": \\"#'+RowNumber+'MeasureExpression'+k+'#\\",\\"cfkpi'+k+'\\": [\\"#'+RowNumber+'CompactMeasureAPI'+k+'#\\"],\\"aliaskpi'+k+'\\": \\"#'+RowNumber+'MeasureAlias'+k+'#\\"';                           
                          String StrMeaure1 = ',\\"{{cell(KPI'+RowNumber+'_Static_KPI.selection,0, \\\\\\"cfkpi'+k+'\\\\\\").asObject()}}\\"';
                          String StrMeasure2 = ',{{row(KPI'+RowNumber+'_Static_KPI.selection, [], [\\\\\\"expression'+k+'\\\\\\",\\\\\\"aliaskpi'+k+'\\\\\\"]).asProjection()}}';
                          SalesString =  SalesString.replace(Str2,'').replace(StrMeasure,'').replace(StrMeaure1,'').replace(StrMeasure2,'');
                          if(K != 5){
                          SalesString =  SalesString.replace(Str3,Str7).replace(Str4,'').replace(Str5,'').replace(Str6,'').replace(Str1,'');
                          }
                        } 
                           
                        integer M = 5;
                         String Str3;
                        for(Integer L=1;M >= L;L++){
                            integer k = L;
                            if(K == 5){ 
                                 Str3 = ', "{\\"display\\": \\"#'+RowNumber+'FilterLabel'+k+'#\\",\\"value\\": \\"#'+RowNumber+'Filter'+k+'#\\"}"';
                            }
                            else if(k==1){
                                Str3 = '"{\\"display\\": \\"#'+RowNumber+'FilterLabel'+k+'#\\",\\"value\\": \\"#'+RowNumber+'Filter'+k+'#\\"}"' ;
                            }
                            else{
                                 Str3 = ', "{\\"display\\": \\"#'+RowNumber+'FilterLabel'+k+'#\\",\\"value\\": \\"#'+RowNumber+'Filter'+k+'#\\"}"' ;
                            
                            }
                              SalesString =  SalesString.replace(Str3,''); 
                            }
                    
                    if(RowNumber == 5){
                    String Strlink1 = '"KPI1_link_5": { "parameters": { "destinationLink": { "name": "Desktop-Page-5" }, "destinationType": "page", "fontSize": 12, "includeState": false, "text": "KPI 5", "textAlignment": "center", "textColor": "#44A2F5" }, "type": "link" },';
                    String Strlink2 = '"KPI2_link_5": { "parameters": { "destinationLink": { "name": "Desktop-Page-5" }, "destinationType": "page", "fontSize": 12, "includeState": false, "text": "KPI 5", "textAlignment": "center", "textColor": "#44A2F5" }, "type": "link" },';
                    String Strlink3 = '"KPI3_link_5": { "parameters": { "destinationLink": { "name": "Desktop-Page-5" }, "destinationType": "page", "fontSize": 12, "includeState": false, "text": "KPI 5", "textAlignment": "center", "textColor": "#44A2F5" }, "type": "link" },';
                    String Strlink4 = '"KPI4_link_5": { "parameters": { "destinationLink": { "name": "Desktop-Page-5" }, "destinationType": "page", "fontSize": 12, "includeState": false, "text": "KPI 5", "textAlignment": "center", "textColor": "#44A2F5" }, "type": "link" },';
                    String Strlink5 = '"KPI5_link_16": { "parameters": { "destinationLink": { "name": "Desktop-Page-5" }, "destinationType": "page", "fontSize": 16, "includeState": false, "text": "KPI 5", "textAlignment": "center", "textColor": "#091A3E" }, "type": "link" },';
                    String Strlink6 = '"KPI5_KPIs": { "datasets": [{ "id": "#5DatasetId#", "name": "#5DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#5DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI5_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by all; q = foreach q generate {{row(KPI5_Static_KPI.selection, [], [\\\\\\"expression1\\\\\\",\\\\\\"aliaskpi1\\\\\\"]).asProjection()}};\\\\n;\\",\\"measures\\":[\\"{{cell(KPI5_Static_KPI.selection,0, \\\\\\"cfkpi1\\\\\\").asObject()}}\\"],\\"autoFilter\\":true}", "version": -1.0 }, "selectMode": "single", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                    String Strlink7 = '"KPI5_Timeline_Grouping": { "datasets": [{ "id": "#5DatasetId#", "name": "#5DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#5DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI5_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{concat(flatten(column(KPI5_Static_Timeline.selection, [\\\\\\"value\\\\\\"])),column(KPI5_Static_Group.selection, [\\\\\\"value\\\\\\"])).asGrouping()}}; q = foreach q generate {{row(KPI5_Static_Timeline.selection,[], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}},{{row(KPI5_Static_Group.selection,[], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}}, {{row(KPI5_Static_Measures.selection, [0], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\",\\"measures\\":\\"{{column(KPI5_Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\":true,\\"groups\\":[\\"{{flatten(column(KPI5_Static_Timeline.selection, [\\\\\\"value\\\\\\"])).asObject()}}\\",\\"{{column(KPI5_Static_Group.selection, [\\\\\\"value\\\\\\"]).asObject()}}\\"]}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                    String Strlink8= '"KPI5_Yoy": { "datasets": [{ "id": "#5DatasetId#", "name": "#5DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#5DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI5_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = filter q by {{column(KPI5_KPI5_Grouping_8.selection, [\\\\\\"#5alias8#\\\\\\"]).asEquality(\\\\\\"#5alias8#\\\\\\")}}; q = filter q by date{{flatten(column(KPI5_Static_KPI5_Yoy_Timeline.selection, [\\\\\\"filter\\\\\\"])).asGrouping()}} in [\\\\\\"1 year ago\\\\\\"..\\\\\\"current year\\\\\\"]; q = group q by {{flatten(column(KPI5_Static_KPI5_Yoy_Timeline.selection, [\\\\\\"value\\\\\\"])).asGrouping()}}; q = foreach q generate {{row(KPI5_Static_KPI5_Yoy_Timeline.selection, [],[\\\\\\"expression1\\\\\\",\\\\\\"alias1\\\\\\"]).asProjection()}},{{row(KPI5_Static_KPI5_Yoy_Timeline.selection, [],[\\\\\\"expression2\\\\\\",\\\\\\"alias2\\\\\\"]).asProjection()}}, {{row(KPI5_Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}}; \\",\\"measures\\":\\"{{column(KPI5_Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"groups\\":\\"{{flatten(column(KPI5_Static_KPI5_Yoy_Timeline.selection, [\\\\\\"value\\\\\\"])).asObject()}}\\"}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                    String Strlink9 = '"KPI5_Raw_Data": { "datasets": [{ "id": "#5DatasetId#", "name": "#5DatasetAlias#" }], "isFacet": true, "isGlobal": false, "query": { "query": "{\\"values\\": []}", "version": -1.0 }, "type": "grain", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "valuestable" } },';
                    String Strlink10 = '"KPI5_Additional_Feature_Chart_2": { "parameters": { "totalValue": "computeTotal", "showPoints": true, "legend": { "showHeader": true, "show": true, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "tooltip": { "showBinLabel": true, "measures": "", "showPercentage": true, "showDimensions": true, "showMeasures": true, "customizeTooltip": false, "dimensions": "" }, "visualizationType": "time", "missingValue": "connect", "dashLine": { "measures": "", "showDashLine": false }, "exploreLink": false, "timeAxis": { "showTitle": true, "showAxis": true, "title": "" }, "title": { "fontSize": 14, "subtitleFontSize": 11, "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "size": [100, 100], "enable": false, "type": "x", "chartsPerLine": 4 }, "totalLabel": "", "fillArea": true, "showZero": true, "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "valueType": "none", "step": "KPI5_Timeline_Grouping", "theme": "wave", "drawArea": { "measure": "", "showDrawArea": false, "bounding1": "", "bounding2": "" } }, "type": "chart" },';
                    String Strlink11 = '"KPI5_Additional_Feature_Chart_1": { "parameters": { "totalValue": "computeTotal", "showPoints": true, "legend": { "showHeader": true, "show": true, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "tooltip": { "showBinLabel": true, "measures": "", "showPercentage": true, "showDimensions": true, "showMeasures": true, "customizeTooltip": false, "dimensions": "" }, "visualizationType": "time", "missingValue": "connect", "dashLine": { "measures": "", "showDashLine": false }, "exploreLink": false, "timeAxis": { "showTitle": true, "showAxis": true, "title": "" }, "title": { "fontSize": 14, "subtitleFontSize": 11, "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "size": [100, 100], "enable": false, "type": "x", "chartsPerLine": 4 }, "totalLabel": "", "fillArea": true, "showZero": true, "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "valueType": "none", "step": "KPI5_Yoy", "theme": "wave", "drawArea": { "measure": "", "showDrawArea": false, "bounding1": "", "bounding2": "" } }, "type": "chart" },';
                    if(SalesString.contains('"KPI5_Raw_Details_Chart":')){
                        String[] Strlink13 = SalesString.split('"KPI5_Raw_Details_Chart":');
                        String[] Strlink14 = Strlink13[1].split('"type": "table"');
                        String Newvalue = '"KPI5_Raw_Details_Chart":'+Strlink14[0]+'"type": "table" },';
                        String StrNew13 = '"KPI5_Raw_Details_Chart": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                        SalesString =  SalesString.replace(Newvalue,StrNew13);
                    }
                    String StrNew1 = '"KPI1_link_5": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew2 = '"KPI2_link_5": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew3 = '"KPI3_link_5": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew4 = '"KPI4_link_5": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew5 = '"KPI5_link_16": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew7 = '"KPI5_Timeline_Grouping": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew8 = '"KPI5_Yoy": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew10 = '"KPI5_Additional_Feature_Chart_2": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                     String StrNew11 = '"KPI5_Additional_Feature_Chart_1": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                     SalesString =  SalesString.replace(Strlink1,StrNew1).replace(Strlink2,StrNew2).replace(Strlink3,StrNew3);   
                     SalesString =  SalesString.replace(Strlink4,StrNew4).replace(Strlink5,StrNew5).replace(Strlink9,'').replace(Strlink11,StrNew11); 
                     SalesString =  SalesString.replace(Strlink6,'').replace(Strlink7,'').replace(Strlink8,'').replace(Strlink10,StrNew10);
                    }
                    if(RowNumber == 4){
                    String Strlink1 = '"KPI1_link_4": { "parameters": { "destinationLink": { "name": "Desktop-Page-4" }, "destinationType": "page", "fontSize": 12, "includeState": false, "text": "KPI 4", "textAlignment": "center", "textColor": "#44A2F5" }, "type": "link" },';
                    String Strlink2 = '"KPI2_link_4": { "parameters": { "destinationLink": { "name": "Desktop-Page-4" }, "destinationType": "page", "fontSize": 12, "includeState": false, "text": "KPI 4", "textAlignment": "center", "textColor": "#44A2F5" }, "type": "link" },';
                    String Strlink3 = '"KPI3_link_4": { "parameters": { "destinationLink": { "name": "Desktop-Page-4" }, "destinationType": "page", "fontSize": 12, "includeState": false, "text": "KPI 4", "textAlignment": "center", "textColor": "#44A2F5" }, "type": "link" },';
                    String Strlink4 = '"KPI4_link_13": { "parameters": { "destinationLink": { "name": "Desktop-Page-4" }, "destinationType": "page", "fontSize": 12, "includeState": false, "text": "KPI 4", "textAlignment": "center", "textColor": "#44A2F5" }, "type": "link" },';
                    String Strlink5 = '"KPI5_link_4": { "parameters": { "destinationLink": { "name": "Desktop-Page-4" }, "destinationType": "page", "fontSize": 16, "includeState": false, "text": "KPI 4", "textAlignment": "center", "textColor": "#091A3E" }, "type": "link" },';
                    String Strlink6 = '"KPI4_KPIs": { "datasets": [{ "id": "#4DatasetId#", "name": "#4DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#4DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI4_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by all; q = foreach q generate {{row(KPI4_Static_KPI.selection, [], [\\\\\\"expression1\\\\\\",\\\\\\"aliaskpi1\\\\\\"]).asProjection()}};\\\\n;\\",\\"measures\\":[\\"{{cell(KPI4_Static_KPI.selection,0, \\\\\\"cfkpi1\\\\\\").asObject()}}\\"],\\"autoFilter\\":true}", "version": -1.0 }, "selectMode": "single", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                    String Strlink7 = '"KPI4_Timeline_Grouping": { "datasets": [{ "id": "#4DatasetId#", "name": "#4DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#4DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI4_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{concat(flatten(column(KPI4_Static_Timeline.selection, [\\\\\\"value\\\\\\"])),column(KPI4_Static_Group.selection, [\\\\\\"value\\\\\\"])).asGrouping()}}; q = foreach q generate {{row(KPI4_Static_Timeline.selection,[], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}},{{row(KPI4_Static_Group.selection,[], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}}, {{row(KPI4_Static_Measures.selection, [0], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\",\\"measures\\":\\"{{column(KPI4_Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\":true,\\"groups\\":[\\"{{flatten(column(KPI4_Static_Timeline.selection, [\\\\\\"value\\\\\\"])).asObject()}}\\",\\"{{column(KPI4_Static_Group.selection, [\\\\\\"value\\\\\\"]).asObject()}}\\"]}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                    String Strlink8= '"KPI4_Yoy": { "datasets": [{ "id": "#4DatasetId#", "name": "#4DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#4DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI4_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = filter q by {{column(KPI4_KPI4_Grouping_8.selection, [\\\\\\"#4alias8#\\\\\\"]).asEquality(\\\\\\"#4alias8#\\\\\\")}}; q = filter q by date{{flatten(column(KPI4_Static_KPI4_Yoy_Timeline.selection, [\\\\\\"filter\\\\\\"])).asGrouping()}} in [\\\\\\"1 year ago\\\\\\"..\\\\\\"current year\\\\\\"]; q = group q by {{flatten(column(KPI4_Static_KPI4_Yoy_Timeline.selection, [\\\\\\"value\\\\\\"])).asGrouping()}}; q = foreach q generate {{row(KPI4_Static_KPI4_Yoy_Timeline.selection, [],[\\\\\\"expression1\\\\\\",\\\\\\"alias1\\\\\\"]).asProjection()}},{{row(KPI4_Static_KPI4_Yoy_Timeline.selection, [],[\\\\\\"expression2\\\\\\",\\\\\\"alias2\\\\\\"]).asProjection()}}, {{row(KPI4_Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}}; \\",\\"measures\\":\\"{{column(KPI4_Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"groups\\":\\"{{flatten(column(KPI4_Static_KPI4_Yoy_Timeline.selection, [\\\\\\"value\\\\\\"])).asObject()}}\\"}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                    String Strlink9 = '"KPI4_Raw_Data": { "datasets": [{ "id": "#4DatasetId#", "name": "#4DatasetAlias#" }], "isFacet": true, "isGlobal": false, "query": { "query": "{\\"values\\": []}", "version": -1.0 }, "type": "grain", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "valuestable" } },';
                    String Strlink10 = '"KPI4_Additional_Feature_Chart_2": { "parameters": { "totalValue": "computeTotal", "showPoints": true, "legend": { "showHeader": true, "show": true, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "tooltip": { "showBinLabel": true, "measures": "", "showPercentage": true, "showDimensions": true, "showMeasures": true, "customizeTooltip": false, "dimensions": "" }, "visualizationType": "time", "missingValue": "connect", "dashLine": { "measures": "", "showDashLine": false }, "exploreLink": false, "timeAxis": { "showTitle": true, "showAxis": true, "title": "" }, "title": { "fontSize": 14, "subtitleFontSize": 11, "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "size": [100, 100], "enable": false, "type": "x", "chartsPerLine": 4 }, "totalLabel": "", "fillArea": true, "showZero": true, "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "valueType": "none", "step": "KPI4_Timeline_Grouping", "theme": "wave", "drawArea": { "measure": "", "showDrawArea": false, "bounding1": "", "bounding2": "" } }, "type": "chart" },';
                    String Strlink11 = '"KPI4_Additional_Feature_Chart_1": { "parameters": { "totalValue": "computeTotal", "showPoints": true, "legend": { "showHeader": true, "show": true, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "tooltip": { "showBinLabel": true, "measures": "", "showPercentage": true, "showDimensions": true, "showMeasures": true, "customizeTooltip": false, "dimensions": "" }, "visualizationType": "time", "missingValue": "connect", "dashLine": { "measures": "", "showDashLine": false }, "exploreLink": false, "timeAxis": { "showTitle": true, "showAxis": true, "title": "" }, "title": { "fontSize": 14, "subtitleFontSize": 11, "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "size": [100, 100], "enable": false, "type": "x", "chartsPerLine": 4 }, "totalLabel": "", "fillArea": true, "showZero": true, "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "valueType": "none", "step": "KPI4_Yoy", "theme": "wave", "drawArea": { "measure": "", "showDrawArea": false, "bounding1": "", "bounding2": "" } }, "type": "chart" },';
                    if(SalesString.contains('"KPI4_Raw_Details_Chart":')){
                        String[] Strlink13 = SalesString.split('"KPI4_Raw_Details_Chart":');
                        String[] Strlink14 = Strlink13[1].split('"type": "table"');
                        String Newvalue = '"KPI4_Raw_Details_Chart":'+Strlink14[0]+'"type": "table" },';
                        String StrNew13 = '"KPI4_Raw_Details_Chart": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                        SalesString =  SalesString.replace(Newvalue,StrNew13);
                    }
                    String StrNew1 = '"KPI1_link_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew2 = '"KPI2_link_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew3 = '"KPI3_link_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew4 = '"KPI4_link_13": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew5 = '"KPI5_link_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew7 = '"KPI4_Timeline_Grouping": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew8 = '"KPI4_Yoy": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew10 = '"KPI4_Additional_Feature_Chart_2": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                     String StrNew11 = '"KPI4_Additional_Feature_Chart_1": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },'; SalesString =  SalesString.replace(Strlink1,StrNew1).replace(Strlink2,StrNew2).replace(Strlink3,StrNew3);   
                     SalesString =  SalesString.replace(Strlink4,StrNew4).replace(Strlink5,StrNew5).replace(Strlink9,'').replace(Strlink11,StrNew11); 
                     SalesString =  SalesString.replace(Strlink6,'').replace(Strlink7,'').replace(Strlink8,'').replace(Strlink10,StrNew10);
                    }
                    if(RowNumber == 3){
                    String Strlink1 = '"KPI1_link_3": { "parameters": { "destinationLink": { "name": "Desktop-Page-3" }, "destinationType": "page", "fontSize": 12, "includeState": false, "text": "KPI 3", "textAlignment": "center", "textColor": "#44A2F5" }, "type": "link" },';
                    String Strlink2 = '"KPI2_link_3": { "parameters": { "destinationLink": { "name": "Desktop-Page-3" }, "destinationType": "page", "fontSize": 12, "includeState": false, "text": "KPI 3", "textAlignment": "center", "textColor": "#44A2F5" }, "type": "link" },';
                    String Strlink3 = '"KPI3_link_12": { "parameters": { "destinationLink": { "name": "Desktop-Page-3" }, "destinationType": "page", "fontSize": 12, "includeState": false, "text": "KPI 3", "textAlignment": "center", "textColor": "#44A2F5" }, "type": "link" },';
                    String Strlink4 = '"KPI4_link_3": { "parameters": { "destinationLink": { "name": "Desktop-Page-3" }, "destinationType": "page", "fontSize": 12, "includeState": false, "text": "KPI 3", "textAlignment": "center", "textColor": "#44A2F5" }, "type": "link" },';
                    String Strlink5 = '"KPI5_link_3": { "parameters": { "destinationLink": { "name": "Desktop-Page-3" }, "destinationType": "page", "fontSize": 16, "includeState": false, "text": "KPI 3", "textAlignment": "center", "textColor": "#091A3E" }, "type": "link" },';
                    String Strlink6 = '"KPI3_KPIs": { "datasets": [{ "id": "#3DatasetId#", "name": "#3DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#3DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI3_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by all; q = foreach q generate {{row(KPI3_Static_KPI.selection, [], [\\\\\\"expression1\\\\\\",\\\\\\"aliaskpi1\\\\\\"]).asProjection()}};\\\\n;\\",\\"measures\\":[\\"{{cell(KPI3_Static_KPI.selection,0, \\\\\\"cfkpi1\\\\\\").asObject()}}\\"],\\"autoFilter\\":true}", "version": -1.0 }, "selectMode": "single", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                    String Strlink7 = '"KPI3_Timeline_Grouping": { "datasets": [{ "id": "#3DatasetId#", "name": "#3DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#3DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI3_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{concat(flatten(column(KPI3_Static_Timeline.selection, [\\\\\\"value\\\\\\"])),column(KPI3_Static_Group.selection, [\\\\\\"value\\\\\\"])).asGrouping()}}; q = foreach q generate {{row(KPI3_Static_Timeline.selection,[], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}},{{row(KPI3_Static_Group.selection,[], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}}, {{row(KPI3_Static_Measures.selection, [0], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\",\\"measures\\":\\"{{column(KPI3_Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\":true,\\"groups\\":[\\"{{flatten(column(KPI3_Static_Timeline.selection, [\\\\\\"value\\\\\\"])).asObject()}}\\",\\"{{column(KPI3_Static_Group.selection, [\\\\\\"value\\\\\\"]).asObject()}}\\"]}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                    String Strlink8= '"KPI3_Yoy": { "datasets": [{ "id": "#3DatasetId#", "name": "#3DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#3DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI3_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = filter q by {{column(KPI3_KPI3_Grouping_8.selection, [\\\\\\"#3alias8#\\\\\\"]).asEquality(\\\\\\"#3alias8#\\\\\\")}}; q = filter q by date{{flatten(column(KPI3_Static_KPI3_Yoy_Timeline.selection, [\\\\\\"filter\\\\\\"])).asGrouping()}} in [\\\\\\"1 year ago\\\\\\"..\\\\\\"current year\\\\\\"]; q = group q by {{flatten(column(KPI3_Static_KPI3_Yoy_Timeline.selection, [\\\\\\"value\\\\\\"])).asGrouping()}}; q = foreach q generate {{row(KPI3_Static_KPI3_Yoy_Timeline.selection, [],[\\\\\\"expression1\\\\\\",\\\\\\"alias1\\\\\\"]).asProjection()}},{{row(KPI3_Static_KPI3_Yoy_Timeline.selection, [],[\\\\\\"expression2\\\\\\",\\\\\\"alias2\\\\\\"]).asProjection()}}, {{row(KPI3_Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}}; \\",\\"measures\\":\\"{{column(KPI3_Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"groups\\":\\"{{flatten(column(KPI3_Static_KPI3_Yoy_Timeline.selection, [\\\\\\"value\\\\\\"])).asObject()}}\\"}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                    String Strlink9 = '"KPI3_Raw_Data": { "datasets": [{ "id": "#3DatasetId#", "name": "#3DatasetAlias#" }], "isFacet": true, "isGlobal": false, "query": { "query": "{\\"values\\": []}", "version": -1.0 }, "type": "grain", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "valuestable" } },';
                    String Strlink10 = '"KPI3_Additional_Feature_Chart_2": { "parameters": { "totalValue": "computeTotal", "showPoints": true, "legend": { "showHeader": true, "show": true, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "tooltip": { "showBinLabel": true, "measures": "", "showPercentage": true, "showDimensions": true, "showMeasures": true, "customizeTooltip": false, "dimensions": "" }, "visualizationType": "time", "missingValue": "connect", "dashLine": { "measures": "", "showDashLine": false }, "exploreLink": false, "timeAxis": { "showTitle": true, "showAxis": true, "title": "" }, "title": { "fontSize": 14, "subtitleFontSize": 11, "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "size": [100, 100], "enable": false, "type": "x", "chartsPerLine": 4 }, "totalLabel": "", "fillArea": true, "showZero": true, "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "valueType": "none", "step": "KPI3_Timeline_Grouping", "theme": "wave", "drawArea": { "measure": "", "showDrawArea": false, "bounding1": "", "bounding2": "" } }, "type": "chart" },';
                    String Strlink11 = '"KPI3_Additional_Feature_Chart_1": { "parameters": { "totalValue": "computeTotal", "showPoints": true, "legend": { "showHeader": true, "show": true, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "tooltip": { "showBinLabel": true, "measures": "", "showPercentage": true, "showDimensions": true, "showMeasures": true, "customizeTooltip": false, "dimensions": "" }, "visualizationType": "time", "missingValue": "connect", "dashLine": { "measures": "", "showDashLine": false }, "exploreLink": false, "timeAxis": { "showTitle": true, "showAxis": true, "title": "" }, "title": { "fontSize": 14, "subtitleFontSize": 11, "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "size": [100, 100], "enable": false, "type": "x", "chartsPerLine": 4 }, "totalLabel": "", "fillArea": true, "showZero": true, "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "valueType": "none", "step": "KPI3_Yoy", "theme": "wave", "drawArea": { "measure": "", "showDrawArea": false, "bounding1": "", "bounding2": "" } }, "type": "chart" },';
                    if(SalesString.contains('"KPI3_Raw_Details_Chart":')){
                        String[] Strlink13 = SalesString.split('"KPI3_Raw_Details_Chart":');
                        String[] Strlink14 = Strlink13[1].split('"type": "table"');
                        String Newvalue = '"KPI3_Raw_Details_Chart":'+Strlink14[0]+'"type": "table" },';
                        String StrNew13 = '"KPI3_Raw_Details_Chart": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                        SalesString =  SalesString.replace(Newvalue,StrNew13);
                    }
                    String StrNew1 = '"KPI1_link_3": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew2 = '"KPI2_link_3": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew3 = '"KPI3_link_12": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew4 = '"KPI4_link_3": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew5 = '"KPI5_link_3": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew7 = '"KPI3_Timeline_Grouping": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew8 = '"KPI3_Yoy": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew10 = '"KPI3_Additional_Feature_Chart_2": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                     String StrNew11 = '"KPI3_Additional_Feature_Chart_1": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                     SalesString =  SalesString.replace(Strlink1,StrNew1).replace(Strlink2,StrNew2).replace(Strlink3,StrNew3);   
                     SalesString =  SalesString.replace(Strlink4,StrNew4).replace(Strlink5,StrNew5).replace(Strlink9,'').replace(Strlink11,StrNew11); 
                     SalesString =  SalesString.replace(Strlink6,'').replace(Strlink7,'').replace(Strlink8,'').replace(Strlink10,StrNew10);
                    }
                     if(RowNumber == 2){
                    String Strlink1 = '"KPI1_link_1": { "parameters": { "destinationLink": { "name": "Desktop-Page-2" }, "destinationType": "page", "fontSize": 12, "includeState": false, "text": "KPI 2", "textAlignment": "center", "textColor": "#44A2F5" }, "type": "link" },';
                    String Strlink2 = '"KPI2_link_9": { "parameters": { "destinationLink": { "name": "Desktop-Page-2" }, "destinationType": "page", "fontSize": 12, "includeState": false, "text": "KPI 2", "textAlignment": "center", "textColor": "#44A2F5" }, "type": "link" },';
                    String Strlink3 = '"KPI3_link_1": { "parameters": { "destinationLink": { "name": "Desktop-Page-2" }, "destinationType": "page", "fontSize": 12, "includeState": false, "text": "KPI 2", "textAlignment": "center", "textColor": "#44A2F5" }, "type": "link" },';
                    String Strlink4 = '"KPI4_link_1": { "parameters": { "destinationLink": { "name": "Desktop-Page-2" }, "destinationType": "page", "fontSize": 12, "includeState": false, "text": "KPI 2", "textAlignment": "center", "textColor": "#44A2F5" }, "type": "link" },';
                    String Strlink5 = '"KPI5_link_1": { "parameters": { "destinationLink": { "name": "Desktop-Page-2" }, "destinationType": "page", "fontSize": 16, "includeState": false, "text": "KPI 2", "textAlignment": "center", "textColor": "#091A3E" }, "type": "link" },';
                    String Strlink6 = '"KPI2_KPIs": { "datasets": [{ "id": "#2DatasetId#", "name": "#2DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#2DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI2_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by all; q = foreach q generate {{row(KPI2_Static_KPI.selection, [], [\\\\\\"expression1\\\\\\",\\\\\\"aliaskpi1\\\\\\"]).asProjection()}};\\\\n;\\",\\"measures\\":[\\"{{cell(KPI2_Static_KPI.selection,0, \\\\\\"cfkpi1\\\\\\").asObject()}}\\"],\\"autoFilter\\":true}", "version": -1.0 }, "selectMode": "single", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                    String Strlink7 = '"KPI2_Timeline_Grouping": { "datasets": [{ "id": "#2DatasetId#", "name": "#2DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#2DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI2_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{concat(flatten(column(KPI2_Static_Timeline.selection, [\\\\\\"value\\\\\\"])),column(KPI2_Static_Group.selection, [\\\\\\"value\\\\\\"])).asGrouping()}}; q = foreach q generate {{row(KPI2_Static_Timeline.selection,[], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}},{{row(KPI2_Static_Group.selection,[], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}}, {{row(KPI2_Static_Measures.selection, [0], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\",\\"measures\\":\\"{{column(KPI2_Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\":true,\\"groups\\":[\\"{{flatten(column(KPI2_Static_Timeline.selection, [\\\\\\"value\\\\\\"])).asObject()}}\\",\\"{{column(KPI2_Static_Group.selection, [\\\\\\"value\\\\\\"]).asObject()}}\\"]}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                    String Strlink8= '"KPI2_Yoy": { "datasets": [{ "id": "#2DatasetId#", "name": "#2DatasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"pigql\\":\\"q = load \\\\\\"#2DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_KPI2_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = filter q by {{column(KPI2_KPI2_Grouping_8.selection, [\\\\\\"#2alias8#\\\\\\"]).asEquality(\\\\\\"#2alias8#\\\\\\")}}; q = filter q by date{{flatten(column(KPI2_Static_KPI2_Yoy_Timeline.selection, [\\\\\\"filter\\\\\\"])).asGrouping()}} in [\\\\\\"1 year ago\\\\\\"..\\\\\\"current year\\\\\\"]; q = group q by {{flatten(column(KPI2_Static_KPI2_Yoy_Timeline.selection, [\\\\\\"value\\\\\\"])).asGrouping()}}; q = foreach q generate {{row(KPI2_Static_KPI2_Yoy_Timeline.selection, [],[\\\\\\"expression1\\\\\\",\\\\\\"alias1\\\\\\"]).asProjection()}},{{row(KPI2_Static_KPI2_Yoy_Timeline.selection, [],[\\\\\\"expression2\\\\\\",\\\\\\"alias2\\\\\\"]).asProjection()}}, {{row(KPI2_Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}}; \\",\\"measures\\":\\"{{column(KPI2_Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"groups\\":\\"{{flatten(column(KPI2_Static_KPI2_Yoy_Timeline.selection, [\\\\\\"value\\\\\\"])).asObject()}}\\"}", "version": -1.0 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "hbar" } },';
                    String Strlink9 = '"KPI2_Raw_Data": { "datasets": [{ "id": "#2DatasetId#", "name": "#2DatasetAlias#" }], "isFacet": true, "isGlobal": false, "query": { "query": "{\\"values\\": []}", "version": -1.0 }, "type": "grain", "useGlobal": true, "visualizationParameters": { "options": {}, "visualizationType": "valuestable" } },';
                    String Strlink10 = '"KPI2_Additional_Feature_Chart_2": { "parameters": { "totalValue": "computeTotal", "showPoints": true, "legend": { "showHeader": true, "show": true, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "tooltip": { "showBinLabel": true, "measures": "", "showPercentage": true, "showDimensions": true, "showMeasures": true, "customizeTooltip": false, "dimensions": "" }, "visualizationType": "time", "missingValue": "connect", "dashLine": { "measures": "", "showDashLine": false }, "exploreLink": false, "timeAxis": { "showTitle": true, "showAxis": true, "title": "" }, "title": { "fontSize": 14, "subtitleFontSize": 11, "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "size": [100, 100], "enable": false, "type": "x", "chartsPerLine": 4 }, "totalLabel": "", "fillArea": true, "showZero": true, "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "valueType": "none", "step": "KPI2_Timeline_Grouping", "theme": "wave", "drawArea": { "measure": "", "showDrawArea": false, "bounding1": "", "bounding2": "" } }, "type": "chart" },';
                    String Strlink11 = '"KPI2_Additional_Feature_Chart_1": { "parameters": { "totalValue": "computeTotal", "showPoints": true, "legend": { "showHeader": true, "show": true, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "tooltip": { "showBinLabel": true, "measures": "", "showPercentage": true, "showDimensions": true, "showMeasures": true, "customizeTooltip": false, "dimensions": "" }, "visualizationType": "time", "missingValue": "connect", "dashLine": { "measures": "", "showDashLine": false }, "exploreLink": false, "timeAxis": { "showTitle": true, "showAxis": true, "title": "" }, "title": { "fontSize": 14, "subtitleFontSize": 11, "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "size": [100, 100], "enable": false, "type": "x", "chartsPerLine": 4 }, "totalLabel": "", "fillArea": true, "showZero": true, "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "valueType": "none", "step": "KPI2_Yoy", "theme": "wave", "drawArea": { "measure": "", "showDrawArea": false, "bounding1": "", "bounding2": "" } }, "type": "chart" },';
                    if(SalesString.contains('"KPI2_Raw_Details_Chart":')){
                        String[] Strlink13 = SalesString.split('"KPI2_Raw_Details_Chart":');
                        String[] Strlink14 = Strlink13[1].split('"type": "table"');
                        String Newvalue = '"KPI2_Raw_Details_Chart":'+Strlink14[0]+'"type": "table" },';
                        String StrNew13 = '"KPI2_Raw_Details_Chart": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                        SalesString =  SalesString.replace(Newvalue,StrNew13);
                    }
                    String StrNew1 = '"KPI1_link_1": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew2 = '"KPI2_link_9": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew3 = '"KPI3_link_1": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew4 = '"KPI4_link_1": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew5 = '"KPI5_link_1": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew7 = '"KPI2_Timeline_Grouping": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew8 = '"KPI2_Yoy": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                    String StrNew10 = '"KPI2_Additional_Feature_Chart_2": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                     String StrNew11 = '"KPI2_Additional_Feature_Chart_1": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                     SalesString =  SalesString.replace(Strlink1,StrNew1).replace(Strlink2,StrNew2).replace(Strlink3,StrNew3);   
                     SalesString =  SalesString.replace(Strlink4,StrNew4).replace(Strlink5,StrNew5).replace(Strlink9,'').replace(Strlink11,StrNew11); 
                     SalesString =  SalesString.replace(Strlink6,'').replace(Strlink7,'').replace(Strlink8,'').replace(Strlink10,StrNew10);
                    }
                }
            }
        SalesString =  SalesString.replace('"columnProperties": {},',''); 
        system.debug('SalesString ********'+SalesString);
        return SalesString;
    }    
}