public with sharing class Json_Success_String {
    
     /****************** Success String **********************************/    
    public Static String SuccessString(String DashboardId,list<String> FolderId,String Allval){   
        Sales_Insight__c Sales = [select id,DataSet_Delete__c,Delete_All_Group__c,Delete_All_Orders__c,Sales_KPI_Delete__c,Number_Delete1__c,ListSelector__c,Lis_Selector36__c,Sales_insight_Day_Delete__c,Sales_Insight_String2__c,Delete_All_Lists__c,Sales_Insight_String3__c,Delete_List_Selector__c,Sales_Insight_Delete2__c,List_Selector6__c,Grouping_label_Delete__c,Delete_All_Group5__c,Grouping_Delete__c,Delete_All_Timeline1__c,Number_Delete2__c,Sales_Insight_Delete3__c,Container_Delete2__c,Grouping_Selectors__c,Delete_All_Timeline2__c,Date_label_Delete__c,Delete_All_Timeline3__c,Number_Delete3__c,Number_Delete4__c,Chart_Delete14__c,Date_Selector__c,Delete_All_Timeline4__c,Delete_All_dateselector1__c,Sales_Date_Delete__c,Delete_pillbox__c,Delete_All_dateselectors__c,Dates_Delete__c,Delete_All_Timeline__c,Delete_All_Dates__c,Sales_Insight_Measure_Delete__c,Delete_All_Measures__c,Chart_Delete2__c,Chart_Delete24__c,Measure_List_Selector__c,Measures_Delete__c,Delete_All_Texts__c,Sales_Insight_Filter_Delete__c,Delete_All_Static_KPIs__c,Delete_All_Chart4__c,Container1__c,Container2__c,Container3__c,number_33__c,number_34__c,Sales_KPI_1__c,Sales_KPI_2__c,Sales_KPI_3__c,Sales_KPI_4__c,Sales_KPI_5__c,Sales_Chart_1__c,Sales_Chart_2__c,Sales_Chart_3__c,Sales_Chart_4__c,Sales_Chart_5__c,Container__c,Container_Delete__c,Container_Delete1__c,Delete_All_Chart__c,Delete_All_Chart1__c,Delete_All_Chart2__c,Delete_All_Chart3__c,List_Selector__c,Pillbox__c,Date_Selector_Delete__c,Chart_Delete__c,Text_Delete__c,Chart_Delete1__c,Test1__c,Test2__c,Test3__c,Test4__c,Test5__c,Test6__c,Test7__c,Test8__c,Test9__c,Test10__c,Test11__c,Test12__c,Test13__c,Test14__c,Test15__c,Test16__c,Sales_Insight_String4__c,Delete_List_Selector43__c,List_Selector43__c,Delete_List_Selector53__c,View_Results__c,View_Results_Text__c,
                                        List_Selector53__c,Sales_KPI_Headers__c,Sales_Header_text__c,Sales_Insight_String5__c from Sales_Insight__c where id=: Allval limit 1];    
         list<Dataset__c> DatsetList = [select id,Data_API__c,RowNumber__c,FilterName__c,KPI_Name__c,Dataset_Id__c,Date_Label__c,Filter_Logics__c,Measure_API__c,Measure_Name__c,Dataset_Name__c,Dimension_Api__c, Dimension_Name__c,AliasMeasure_API__c,CompactMeasure_API__c from Dataset__c where Session_Id__c =: FolderId[2] order by RowNumber__c limit 10];                              
        String SuccessString = Sales.Sales_Insight_String5__c + Sales.Sales_insight_String2__c + Sales.Sales_insight_String3__c;  
        Integer RowNumber;
        String Datasetname;
        String DatasetId;
        set<String> AllRownumbers = new set<String>();
        for(Dataset__c DatasetRec : DatsetList){
            AllRownumbers.add(String.valueof(DatasetRec.Rownumber__c));
        }
        for(integer RowNumberlist=6;RowNumberlist<=10;RowNumberlist++){
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
                     String Numbers = String.valueof(RowNumber - 5);   
                    if(DatasetRec.Dataset_Id__c != NUll){
                        
                        SuccessString =  SuccessString.replace('#'+Numbers+'datasetId#',DatasetRec.Dataset_Id__c).replace('#'+Numbers+'datasetAlias#',DatasetRec.Dataset_Name__c);
                        Datasetname = DatasetRec.Dataset_Name__c;    
                        DatasetId = DatasetRec.Dataset_Id__c;
                    }
                    if(DatasetRec.KPI_Name__c != Null){
                    SuccessString =  SuccessString.replace('Sales KPI '+Numbers,DatasetRec.KPI_Name__c);
                    }
                    
                    if(DashboardId != Null && DashboardId != '')
                  SuccessString = SuccessString.replace('#InsightComplete#',DashboardId);
                  else
                  // SuccessString = SuccessString.replace('#InsightComplete#','Sales New Dashboard' );
                   
                  if(FolderId[1] != Null && FolderId[1] != '')
                  SuccessString = SuccessString.replace('Success Insights',FolderId[1]);
                  
                                  
                  if(Dimensions.Size() > 0){               
                        integer i = 1;  
                        integer j = 10;
                        for(String Dim : Dimensions){
                            integer k = i-1;
                          SuccessString =  SuccessString.replace('#'+Numbers+'GroupingLabel'+ i +'#',Dim).replace('#'+Numbers+'GroupingAPI'+ i+'#',DimensionApi[k]);  
                          i = i+1;
                        }
                        for(Integer L=i;J >= L;L++){
                             integer k = L;
                             if(K == 10){
                                 Sales.Grouping_label_Delete__c = Sales.Grouping_label_Delete__c.replace('GroupingLabel',Numbers+'GroupingLabel'+k).replace('}",','}"').replace('GroupingAPI',Numbers+'GroupingAPI'+k);
                                 SuccessString =  SuccessString.replace(Sales.Grouping_label_Delete__c,'');
                                 Sales.Grouping_label_Delete__c = Sales.Grouping_label_Delete__c.replace(Numbers+'GroupingLabel'+k,'GroupingLabel').replace('}"','}",').replace(Numbers+'GroupingAPI'+k,'GroupingAPI');
                             }
                             else{
                                 Sales.Grouping_label_Delete__c = Sales.Grouping_label_Delete__c.replace('GroupingLabel',Numbers+'GroupingLabel'+k).replace('GroupingAPI',Numbers+'GroupingAPI'+k);
                                 SuccessString =  SuccessString.replace(Sales.Grouping_label_Delete__c,'');
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
                             SuccessString =  SuccessString.remove(Sales.Grouping_Delete__c);
                            Sales.Grouping_Delete__c = Sales.Grouping_Delete__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'Static_Sales__KPI_%RowNumber%_Grouping_%Numbers%').replace('#'+Numbers+'GroupingLabel','%RowNumber%GroupingLabel').replace('#'+Numbers+'GroupingAPI','%RowNumber%GroupingAPI'); 
                            if(Numbers == '5'){
                                for(String Grp : Grouping5){
                                    Sales.Grouping_Selectors__c = Sales.Grouping_Selectors__c.replace('#listselectors#','listselector_'+Grp).replace('#GroupingNumbers#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i);
                                     SuccessString =  SuccessString.remove(Sales.Grouping_Selectors__c);
                                    Sales.Grouping_Selectors__c = Sales.Grouping_Selectors__c.replace('listselector_'+Grp,'#listselectors#').replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#GroupingNumbers#');
                                    if(Grp == '24'){
                                        Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": #Colspan#','"colspan": 3').replace('"column": #Column#','"column": 9').replace('#listselector#','listselector_'+Grp).replace('"row": #Row#','"row": 58');
                                        SuccessString =  SuccessString.remove(Sales.Sales_Date_Delete__c);
                                    //    Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 3','"colspan": 2').replace('"column": 9','"column": 2').replace('listselector_'+Grp,'listselector_'+Grp).replace('"row": 58','"row": 4');
                                    //    SuccessString =  SuccessString.remove(Sales.Sales_Date_Delete__c);
                                  //     Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 2','"colspan": 1').replace('"column": 2','"column": 1').replace('listselector_'+Grp,'listselector_'+Grp).replace('"row": 4','"row": 9');
                                  //     SuccessString =  SuccessString.remove(Sales.Sales_Date_Delete__c);
                                        Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 3','"colspan": #Colspan#').replace('"column": 9','"column": #Column#').replace('listselector_'+Grp,'#listselector#').replace('"row": 58','"row": #Row#');
                                    }
                                    
                                    if(Grp == '25'){
                                        Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": #Colspan#','"colspan": 3').replace('"column": #Column#','"column": 19').replace('#listselector#','listselector_'+Grp).replace('"row": #Row#','"row": 58');
                                        SuccessString =  SuccessString.remove(Sales.Sales_Date_Delete__c);
                                      // Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 1','"column": 19').replace('listselector_'+Grp,'listselector_'+Grp).replace('"row": 10','"row": 58');
                                      // SuccessString =  SuccessString.remove(Sales.Sales_Date_Delete__c);
                                      //  Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 3','"colspan": 2').replace('"column": 19','"column": 6').replace('listselector_'+Grp,'listselector_'+Grp).replace('"row": 58','"row": 4');
                                      //  SuccessString =  SuccessString.remove(Sales.Sales_Date_Delete__c);
                                        Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 3','"colspan": #Colspan#').replace('"column": 19','"column": #Column#').replace('listselector_'+Grp,'#listselector#').replace('"row": 58','"row": #Row#');
                                    }
                                    
                                    if(Grp == '35'){
                                        Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": #Colspan#','"colspan": 3').replace('"column": #Column#','"column": 2').replace('#listselector#','listselector_'+Grp).replace('"row": #Row#','"row": 58');
                                        SuccessString =  SuccessString.remove(Sales.Sales_Date_Delete__c);
                                      // Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 3','"colspan": 2').replace('"column": 2','"column": 0').replace('listselector_'+Grp,'listselector_'+Grp).replace('"row": 58','"row": 4');
                                      // SuccessString =  SuccessString.remove(Sales.Sales_Date_Delete__c);
                                      // Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 2','"colspan": 1').replace('"column": 0','"column": 0').replace('listselector_'+Grp,'listselector_'+Grp).replace('"row": 4','"row": 9');
                                      // SuccessString =  SuccessString.remove(Sales.Sales_Date_Delete__c);
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
                            SuccessString =  SuccessString.replace('#'+Numbers+'DateLabel'+ i +'#',Datelab).replace('#'+Numbers+'DateAPI'+ i+'#',DateApi[k]);  
                            i = i+1;
                        }
                        String[] StringList = new String[]{'Quarter','Month','Week','Day'}; 
                        for(Integer L=i;J >= L;L++){
                            integer k = L;
                           
                            for(String St : StringList){
                                
                                if(K == 3){
                                    String ChartDate = 'q = filter q by {{row(Sales__KPI_'+Numbers+'_Date_'+k+'.selection,[0],[\\\\\\"min\\\\\\",\\\\\\"max\\\\\\"]).asDateRange(\\\\\\"date(\'#'+Numbers+'DateAPI'+k+'#_Year\',\'#'+Numbers+'DateAPI'+k+'#_Month\',\'#'+Numbers+'DateAPI'+k+'#_Day\')\\\\\\")}};';
                                    String ChartDate1 = 'q = filter q by {{row(Sales__KPI_'+Numbers+'_Date_'+k+'.selection, [0],[\\\\\\"min\\\\\\",\\\\\\"max\\\\\\"]).asDateRange(\\\\\\"date(\'#'+Numbers+'DateAPI'+k+'#_Year\',\'#'+Numbers+'DateAPI'+k+'#_Month\',\'#'+Numbers+'DateAPI'+k+'#_Day\')\\\\\\")}};';
                                    SuccessString = SuccessString.replace(ChartDate,'').replace(ChartDate1,'');
                                    if(St == 'Day'){
                                        Sales.Sales_insight_Day_Delete__c = Sales.Sales_insight_Day_Delete__c.replace('DateLabel',Numbers+'DateLabel'+k).replace('#MonthDay#',St).replace('DateAPI',Numbers+'DateAPI'+k);
                                        SuccessString =  SuccessString.replace(Sales.Sales_insight_Day_Delete__c,'');   
                                        Sales.Sales_insight_Day_Delete__c = Sales.Sales_insight_Day_Delete__c.replace(Numbers+'DateLabel'+k,'DateLabel').replace(Numbers+'DateAPI'+k,'DateAPI').replace(St,'#MonthDay#');
                                    }
                                     else{
                                        Sales.Date_label_Delete__c = Sales.Date_label_Delete__c.replace('DateLabel',Numbers+'DateLabel'+k).replace('DateAPI',Numbers+'DateAPI'+k).replace('#MonthDay#',St);
                                        SuccessString =  SuccessString.replace(Sales.Date_label_Delete__c,'');
                                        Sales.Date_label_Delete__c = Sales.Date_label_Delete__c.replace(Numbers+'DateLabel'+k,'DateLabel').replace(Numbers+'DateAPI'+k,'DateAPI').replace(St,'#MonthDay#'); 
                                     }
                                     String Strs = '"step": "Sales__KPI_'+Numbers+'_Date_'+k+'",';
									  String Strss = '"title": "#'+Numbers+'DateLabel'+k+'#"';
									  SuccessString =  SuccessString.replace(Strs,'').replace(Strss,'');
									   Sales.Delete_All_Dates__c = Sales.Delete_All_Dates__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+k).replace('#Truewfalse#','false').replace('#datasetId#','#'+Numbers+'datasetId#').replace('#datasetAlias#','#'+Numbers+'datasetAlias#').replace('#DateAPI#','#'+Numbers+'DateAPI'+k+'#');
                            				SuccessString =  SuccessString.replace(Sales.Delete_All_Dates__c,'');
                            			Sales.Delete_All_Dates__c = Sales.Delete_All_Dates__c.replace('#'+Numbers+'DateAPI'+k+'#','#DateAPI#').replace('Sales__KPI_'+Numbers+'_Date_'+k,'SalesKPIDate').replace('#'+Numbers+'datasetAlias#','#datasetAlias#').replace('#'+Numbers+'datasetId#','#datasetId#').replace('false','#Truewfalse#'); 
                                     if(Numbers == '2'){
                                     	SuccessString =  SuccessString.replace(Sales.Sales_Insight_Delete3__c,'');
                                     }
                                     //SuccessString =  SuccessString.replace('#'+Numbers+'DateLabel'+ k +'#',DateLabel[0]).replace('#'+Numbers+'DateAPI'+ k+'#',DateApi[0]);
                                }
                                else{
                                	String ChartDate = 'q = filter q by {{row(Sales__KPI_'+Numbers+'_Date_'+k+'.selection,[0],[\\\\\\"min\\\\\\",\\\\\\"max\\\\\\"]).asDateRange(\\\\\\"date(\'#'+Numbers+'DateAPI'+k+'#_Year\',\'#'+Numbers+'DateAPI'+k+'#_Month\',\'#'+Numbers+'DateAPI'+k+'#_Day\')\\\\\\")}};';
                                	String ChartDate1 = 'q = filter q by {{row(Sales__KPI_'+Numbers+'_Date_'+k+'.selection, [0],[\\\\\\"min\\\\\\",\\\\\\"max\\\\\\"]).asDateRange(\\\\\\"date(\'#'+Numbers+'DateAPI'+k+'#_Year\',\'#'+Numbers+'DateAPI'+k+'#_Month\',\'#'+Numbers+'DateAPI'+k+'#_Day\')\\\\\\")}};';
                                    SuccessString = SuccessString.replace(ChartDate,'').replace(ChartDate1,'');
                                     if(St == 'Day'){
                                        Sales.Sales_insight_Day_Delete__c = Sales.Sales_insight_Day_Delete__c.replace('DateLabel',Numbers+'DateLabel'+k).replace('}"','}",').replace('#MonthDay#',St).replace('DateAPI',Numbers+'DateAPI'+k);
                                        SuccessString =  SuccessString.replace(Sales.Sales_insight_Day_Delete__c,'');   
                                        Sales.Sales_insight_Day_Delete__c = Sales.Sales_insight_Day_Delete__c.replace(Numbers+'DateLabel'+k,'DateLabel').replace('}",','}"').replace(Numbers+'DateAPI'+k,'DateAPI').replace(St,'#MonthDay#');
                                        
                                    }
                                    else{
                                         Sales.Date_label_Delete__c = Sales.Date_label_Delete__c.replace('DateLabel',Numbers+'DateLabel'+k).replace('DateAPI',Numbers+'DateAPI'+k).replace('#MonthDay#',St);
                                         SuccessString =  SuccessString.replace(Sales.Date_label_Delete__c,'');
                                         Sales.Date_label_Delete__c = Sales.Date_label_Delete__c.replace(Numbers+'DateLabel'+k,'DateLabel').replace(Numbers+'DateAPI'+k,'DateAPI').replace(St,'#MonthDay#');    
                                    } 
                                    String Strs = '"step": "Sales__KPI_'+Numbers+'_Date_'+k+'",';
									  String Strss = '"title": "#'+Numbers+'DateLabel'+k+'#"';
									  SuccessString =  SuccessString.replace(Strs,'').replace(Strss,''); 
									   Sales.Delete_All_Dates__c = Sales.Delete_All_Dates__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+k).replace('#Truewfalse#','false').replace('#datasetId#','#'+Numbers+'datasetId#').replace('#datasetAlias#','#'+Numbers+'datasetAlias#').replace('#DateAPI#','#'+Numbers+'DateAPI'+k+'#');
                            				SuccessString =  SuccessString.replace(Sales.Delete_All_Dates__c,'');
                            			Sales.Delete_All_Dates__c = Sales.Delete_All_Dates__c.replace('#'+Numbers+'DateAPI'+k+'#','#DateAPI#').replace('Sales__KPI_'+Numbers+'_Date_'+k,'SalesKPIDate').replace('#'+Numbers+'datasetAlias#','#datasetAlias#').replace('#'+Numbers+'datasetId#','#datasetId#').replace('false','#Truewfalse#'); 
                                     if(Numbers == '2' && K==2){
                                     	SuccessString =  SuccessString.replace(Sales.Sales_Insight_Delete2__c,'');
                                     }
                                     //SuccessString =  SuccessString.replace('#'+Numbers+'DateLabel'+ k +'#',DateLabel[0]).replace('#'+Numbers+'DateAPI'+ k+'#',DateApi[0]);      
                                }
                            }
                        }
                    }
                    else{                   
                        Sales.Dates_Delete__c = Sales.Dates_Delete__c.replace('#Timeline#','Static_Sales__KPI_'+Numbers+'_Timeline').replace('DateLabel',Numbers+'DateLabel').replace('DateAPI',Numbers+'DateAPI');
                        SuccessString =  SuccessString.replace(Sales.Dates_Delete__c,'');
                        Sales.Dates_Delete__c = Sales.Dates_Delete__c.replace('Static_Sales__KPI_'+Numbers+'_Timeline','#Timeline#').replace(Numbers+'DateLabel','DateLabel').replace(Numbers+'DateAPI','DateAPI');
                        if(Numbers == '5'){
                            Sales.Date_Selector__c = Sales.Date_Selector__c.replace('#listselector#','listselector_16').replace('#Timeline#"','Static_Sales__KPI_'+Numbers+'_Timeline');
                            SuccessString =  SuccessString.replace(Sales.Dates_Delete__c,'');
                            Sales.Date_Selector__c = Sales.Date_Selector__c.replace('listselector_16','#listselector#').replace('Static_Sales__KPI_'+Numbers+'_Timeline','#Timeline#'); 
                            
                            Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": #Colspan#','"colspan": 3').replace('"column": #Column#','"column": 16').replace('#listselector#','listselector_16').replace('"row": #Row#','"row": 58');
                            SuccessString =  SuccessString.remove(Sales.Sales_Date_Delete__c);
                            
                          // Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 1','"colspan": 2').replace('"column": 0','"column": 4').replace('"row": 10','"row": 4');
                          // SuccessString =  SuccessString.remove(Sales.Sales_Date_Delete__c);
                          //  Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 2','"colspan": 3').replace('"column": 4','"column": 16').replace('"row": 4','"row": 58');
                          //  SuccessString =  SuccessString.remove(Sales.Sales_Date_Delete__c);
                            Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 3','"colspan": #Colspan#').replace('"column": 16','"column": #Column#').replace('listselector_16','#listselector#').replace('"row": 58','"row": #Row#');
                            
                        }                       
                    }
                    if(measureLabel.size() > 0){               
                      
                        integer i = 1;
                        integer j = 5;
                        for(String Dim : measureLabel){
                            integer k = i-1;
                            String Str = '\\"#'+Numbers+'CompactMeasureAPI'+ i+'#\\"';
                            SuccessString =  SuccessString.replace('#'+Numbers+'MeasureLabel'+ i+'#',Dim).replace('#'+Numbers+'ExpressionMeasureAPI'+ i+'#',MeasureAPI[k]).replace('#'+Numbers+'AliasMeasureAPI'+ i+'#',AliasMeasureAPI[k]).replace(Str,CompactMeasureAPI[k]);  
                            i = i+1;
                        }
                        for(Integer L=i;J >= L;L++){
                            integer k = L;
                            if(K == 5){
                                Sales.Sales_Insight_Measure_Delete__c = Sales.Sales_Insight_Measure_Delete__c.replace('MeasureLabel','#'+Numbers+'MeasureLabel'+k+'#').replace('}",','}"').replace('ExpressionMeasureAPI',Numbers+'ExpressionMeasureAPI'+k).replace('AliasMeasureAPI',Numbers+'AliasMeasureAPI'+k).replace('CompactMeasureAPI',Numbers+'CompactMeasureAPI'+k);
                                SuccessString =  SuccessString.replace(Sales.Sales_Insight_Measure_Delete__c,'');
                                Sales.Sales_Insight_Measure_Delete__c = Sales.Sales_Insight_Measure_Delete__c.replace('#'+Numbers+'MeasureLabel'+k+'#','MeasureLabel').replace('}"','}",').replace(Numbers+'ExpressionMeasureAPI'+k,'ExpressionMeasureAPI').replace(Numbers+'AliasMeasureAPI'+k,'AliasMeasureAPI').replace(Numbers+'CompactMeasureAPI'+k,'CompactMeasureAPI');
                                String measure = '\\"label_'+k+ '\\":\\"#'+Numbers+'MeasureLabel'+k+'#\\"';
                                String alias = '\\"alias_'+k+ '\\":\\"#'+ Numbers+'AliasMeasureAPI'+k +'#\\",';
                                String expression = '\\"expression_'+k+ '\\":\\"#'+Numbers+'ExpressionMeasureAPI'+k+'#\\",';
                                String Compact = '\\"cf_'+k+ '\\":\\"#'+Numbers+'CompactMeasureAPI'+k +'#\\",';
                                
                                SuccessString =  SuccessString.replace(measure,'#TestCode1#').replace(expression,'').replace(Compact,'').replace(alias,'').replace(',#TestCode1#','').replace('#TestCode1#',''); 
                                
                                 
                            }
                            else{
                                String measure;
                                String alias = '\\"alias_'+k+ '\\":\\"#'+ Numbers+'AliasMeasureAPI'+k +'#\\",'; 
    
                                    measure = '\\"label_'+k+ '\\":\\"#'+Numbers+'MeasureLabel'+k+'#\\",';
                                    SuccessString =  SuccessString.replace(measure,'');  
                                
                                String expression = '\\"expression_'+k+ '\\":\\"#'+Numbers+'ExpressionMeasureAPI'+k+'#\\",';
                                String Compact = '\\"cf_'+k+ '\\":\\"#'+Numbers+'CompactMeasureAPI'+k +'#\\",';
                                SuccessString =  SuccessString.replace(alias,'').replace(Compact,'').replace(expression,'');
                                String Sales5 = ',column(Static_Sales_KPI_'+Numbers+'.selection,[\\\\\\"cf_'+k+'\\\\\\"])';
                                String Sales2;
                                if(Numbers== '4'){
                                  Sales2 = ',{{row(Static_Sales_KPI_'+Numbers+'.selection,[],[\\\\\\"expression_'+k+'\\\\\\",\\\\\\"alias_'+k+'\\\\\\"]).asProjection()}}';
                                }
                                else{
                                  Sales2 = ',{{row(Static_Sales_KPI_'+Numbers+'.selection,[],[\\\\\\"expression_'+k+'\\\\\\",\\\\\\"alias_'+k+'\\\\\\"]).asProjection()}}';
                                }
                                SuccessString =  SuccessString.replace(Sales2,'').replace(Sales5,'');
                                Sales.Sales_Insight_Measure_Delete__c = Sales.Sales_Insight_Measure_Delete__c.replace('MeasureLabel','#'+Numbers+'MeasureLabel'+k+'#').replace('ExpressionMeasureAPI',Numbers+'ExpressionMeasureAPI'+k).replace('AliasMeasureAPI',Numbers+'AliasMeasureAPI'+k).replace('CompactMeasureAPI',Numbers+'CompactMeasureAPI'+k);
                                SuccessString =  SuccessString.replace(Sales.Sales_Insight_Measure_Delete__c,'');
                                Sales.Sales_Insight_Measure_Delete__c = Sales.Sales_Insight_Measure_Delete__c.replace('#'+Numbers+'MeasureLabel'+k+'#','MeasureLabel').replace(Numbers+'ExpressionMeasureAPI'+k,'ExpressionMeasureAPI').replace(Numbers+'AliasMeasureAPI'+k,'AliasMeasureAPI').replace(Numbers+'CompactMeasureAPI'+k,'CompactMeasureAPI');                               
                            
                            }
                            String[] StNUmbers;
                                if(Numbers == '5'){
                                	StNUmbers = new String[]{'number_11','number_12','number_13','number_14'};
                                	 /*   if(K==2){
	                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_12').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 6').replace('"row": #rows#','"row": 56');
											SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');    
											Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 6','"column": #column#').replace('number_12','#charts#').replace('"row": 56','"row": #rows#');
	                                	} 
	                                    if(K==1){
	                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_11').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 56');
											SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');    
											Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('number_11','#charts#').replace('"row": 56','"row": #rows#');
	                                	} 
	                                    if(K==3){
	                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_13').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 12').replace('"row": #rows#','"row": 56');
											SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');    
											Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 12','"column": #column#').replace('number_13','#charts#').replace('"row": 56','"row": #rows#');
	                                	}    
	                                    if(K==4){
	                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_14').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 18').replace('"row": #rows#','"row": 56');
											SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');    
											Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 18','"column": #column#').replace('number_14','#charts#').replace('"row": 56','"row": #rows#');
	                                	}
	                                	*/
	                                	if(k<=4){
	                                	String[] Fields = new String[]{'#5AliasMeasureAPI1#','#5AliasMeasureAPI2#','#5AliasMeasureAPI3#','#5AliasMeasureAPI4#'};
                                            integer ll= 0;        
                                            for(String St : StNUmbers){                                     
                                            	Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Numbers#',St);
                                            	if(St == ''){
                                            	//	Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"exploreLink": #falses#','"exploreLink": false').replace('"compact": #trues#','"compact": true');
                                            	}
                                            	else{
                                            		Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"exploreLink": #falses#','"exploreLink": true').replace('"compact": #trues#','"compact": true');
                                            	}
                                            	Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Fields#',Fields[ll]).replace('#SalesKPIs#','Sales_KPI_5');
                                            	String Str7 = '"'+St+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                            //	System.debug('Str7*************'+Str7);
                                            	SuccessString =  SuccessString.replace(Sales.Sales_KPI_Delete__c,Str7);
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
											SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');    
											Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 6','"column": #column#').replace('number_20','#charts#').replace('"row": 43','"row": #rows#');
	                                	} 
	                                    if(K==1){
	                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_10').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 43');
											SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');    
											Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('number_10','#charts#').replace('"row": 43','"row": #rows#');
	                                	} 
	                                    if(K==3){
	                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_21').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 12').replace('"row": #rows#','"row": 43');
											SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');    
											Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 12','"column": #column#').replace('number_21','#charts#').replace('"row": 43','"row": #rows#');
	                                	}    
	                                    if(K==4){
	                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_22').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 18').replace('"row": #rows#','"row": 43');
											SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');    
											Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 18','"column": #column#').replace('number_22','#charts#').replace('"row": 43','"row": #rows#');
	                                	}  */
	                                	
	                                	if(k<=4){
	                                	 integer ll= 0;
                                        for(String St : StNUmbers){                                     
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Numbers#',St);
                                        
                                            Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"exploreLink": #falses#','"exploreLink": true').replace('"compact": #trues#','"compact": true');
                                     
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Fields#',Fields[ll]).replace('#SalesKPIs#','Sales_KPI_4');
                                        String StrNum48 = '"'+St+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.Sales_KPI_Delete__c,StrNum48);
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace(St,'#Numbers#').replace(Fields[ll],'#Fields#').replace('Sales_KPI_4','#SalesKPIs#');
                                        if(St == ''){
                                          // Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"compact": false','"compact": #trues#').replace('"exploreLink": true','"exploreLink": #falses#');
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
										SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');    
										Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 6','"column": #column#').replace('number_8','#charts#').replace('"row": 30','"row": #rows#');
                                	} 
                                    if(K==1){
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_7').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 30');
										SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');    
										Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('number_7','#charts#').replace('"row": 30','"row": #rows#');
                                	} 
                                    if(K==3){
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_9').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 12').replace('"row": #rows#','"row": 30');
										SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');    
										Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 12','"column": #column#').replace('number_9','#charts#').replace('"row": 30','"row": #rows#');
                                	}    
                                    if(K==4){
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_19').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 18').replace('"row": #rows#','"row": 30');
										SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');    
										Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 18','"column": #column#').replace('number_19','#charts#').replace('"row": 30','"row": #rows#');
                                	}  */
                                	if(k<=4){
                                	 integer ll= 0;
                                        for(String St : StNUmbers){                                     
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Numbers#',St);
                                            Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"exploreLink": #falses#','"exploreLink": true').replace('"compact": #trues#','"compact": true');
                                       
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Fields#',Fields[ll]).replace('#SalesKPIs#','Sales_KPI_3');
                                        String StrNumst = '"'+St+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.Sales_KPI_Delete__c,StrNumst);
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
										SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');    
										Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 6','"column": #column#').replace('number_5','#charts#').replace('"row": 17','"row": #rows#');
                                	} 
                                    if(K==1){
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_4').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 17');
										SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');    
										Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('number_4','#charts#').replace('"row": 17','"row": #rows#');
                                	} 
                                    if(K==3){
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_6').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 12').replace('"row": #rows#','"row": 17');
										SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');    
										Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 12','"column": #column#').replace('number_6','#charts#').replace('"row": 17','"row": #rows#');
                                	}    
                                    if(K==4){
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_18').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 18').replace('"row": #rows#','"row": 17');
										SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');    
										Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 18','"column": #column#').replace('number_18','#charts#').replace('"row": 17','"row": #rows#');
                                	} */
                                	
                                //	system.debug('Sales.Sales_KPI_Delete__ctwo************'+Sales.Sales_KPI_Delete__c);
                                	if(k<=4){
                                    integer ll= 0;
                                     String[] Fields = new String[]{'#2AliasMeasureAPI1#','#2AliasMeasureAPI2#','#2AliasMeasureAPI3#','#2AliasMeasureAPI4#'};
                                                                           
                                    for(String St : StNUmbers){                                     
                                    	Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Numbers#',St);
                                    	if(St == 'number_28'){                                           
                                    	//	Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"exploreLink": #falses#','"exploreLink": true').replace('"compact": #trues#','"compact": false'); 
                                    	}
                                    	else{
                                    		Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"exploreLink": #falses#','"exploreLink": true').replace('"compact": #trues#','"compact": true');
                                    	}
                                    	Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Fields#',Fields[ll]).replace('#SalesKPIs#','Sales_KPI_2');
                                    	String Strtnum44 = '"'+St+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                    
                                    	SuccessString =  SuccessString.replace(Sales.Sales_KPI_Delete__c,Strtnum44);
                                    	Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace(St,'#Numbers#').replace(Fields[ll],'#Fields#').replace('Sales_KPI_2','#SalesKPIs#');
                                    	if(St == 'number_28'){
                                    		//Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"compact": false','"compact": #trues#').replace('"exploreLink": true','"exploreLink": #falses#');
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
										SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');    
										Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 6','"column": #column#').replace('number_17','#charts#').replace('"row": 4','"row": #rows#');
                                	} 
                                    if(K==1){
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_24').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 4');
										SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');    
										Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('number_24','#charts#').replace('"row": 4','"row": #rows#');
                                	} 
                                    if(K==3){
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_24').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 12').replace('"row": #rows#','"row": 4');
										SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');    
										Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 12','"column": #column#').replace('number_24','#charts#').replace('"row": 4','"row": #rows#');
                                	}    
                                    if(K==4){
                                        Sales.Number_Delete2__c = Sales.Number_Delete2__c.replace('#charts#','number_26').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 18').replace('"row": #rows#','"row": 4');
										SuccessString =  SuccessString.replace(Sales.Number_Delete2__c,'');    
										Sales.Number_Delete2__c = Sales.Number_Delete2__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 18','"column": #column#').replace('number_26','#charts#').replace('"row": 4','"row": #rows#');
                                	} */
                                	
                                	    
                             //  system.debug('Sales.Sales_KPI_Delete__c************'+Sales.Sales_KPI_Delete__c);
                                String[] Fields = new String[]{'#1AliasMeasureAPI1#','#1AliasMeasureAPI2#','#1AliasMeasureAPI3#','#1AliasMeasureAPI4#'}; 
	                             integer Z=0;
	                             if(StNUmbers != null){
	                             for(String St : StNUmbers){ 
	                                Sales.Sales_KPI_Delete__c = '"#Numbers#": { "parameters": { "compact": #trues#, "exploreLink": #falses#, "measureField": "#Fields#", "numberColor": "#335779", "numberSize": 32, "step": "#SalesKPIs#", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
									Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Numbers#',St).replace('#Fields#',Fields[Z]).replace('#SalesKPIs#','Sales_KPI_1').replace('"exploreLink": #falses#','"exploreLink": true').replace('"compact": #trues#','"compact": true');
								//	system.debug('Sales.Sales_KPI_Delete__cvales************'+Sales.Sales_KPI_Delete__c);
									String Strtnum44 = '"'+St+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
	
									SuccessString =  SuccessString.replace(Sales.Sales_KPI_Delete__c,Strtnum44);
								 //   system.debug('SuccessString************'+SuccessString);	
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
                    SuccessString =  SuccessString.replace(Sales.Measure_List_Selector__c,'');
                    Sales.Measure_List_Selector__c = Sales.Measure_List_Selector__c.replace(Numbers+'MeasureLabel1','MeasureLabel1').replace(Numbers+'ExpressionMeasureAPI1','ExpressionMeasureAPI1').replace(Numbers+'AliasMeasureAPI1','AliasMeasureAPI1').replace(Numbers+'CompactMeasureAPI1','CompactMeasureAPI1').replace(Numbers+'MeasureLabel2','MeasureLabel2').replace(Numbers+'ExpressionMeasureAPI2','ExpressionMeasureAPI2').replace(Numbers+'AliasMeasureAPI2','AliasMeasureAPI2').replace(Numbers+'CompactMeasureAPI2','CompactMeasureAPI2').replace(Numbers+'MeasureLabel3','MeasureLabel3').replace(Numbers+'ExpressionMeasureAPI3','ExpressionMeasureAPI3').replace(Numbers+'AliasMeasureAPI3','AliasMeasureAPI3').replace(Numbers+'CompactMeasureAPI3','CompactMeasureAPI3').replace(Numbers+'MeasureLabel4','MeasureLabel4').replace(Numbers+'ExpressionMeasureAPI4','ExpressionMeasureAPI4').replace(Numbers+'AliasMeasureAPI4','AliasMeasureAPI4').replace(Numbers+'CompactMeasureAPI4','CompactMeasureAPI4').replace(Numbers+'MeasureLabel5','MeasureLabel5').replace(Numbers+'ExpressionMeasureAPI5','ExpressionMeasureAPI5').replace(Numbers+'AliasMeasureAPI5','AliasMeasureAPI5').replace(Numbers+'CompactMeasureAPI5','CompactMeasureAPI5');
                    
                        if(Numbers == '5'){
                            Sales.Measures_Delete__c = Sales.Measures_Delete__c.replace('#listselector#','listselector_23').replace('#Measure#','Static_Sales_Measure_5');
                            SuccessString =  SuccessString.replace(Sales.Measures_Delete__c,'');
                            Sales.Measures_Delete__c = Sales.Measures_Delete__c.replace('listselector_23','#listselector#').replace('Static_Sales_Measure_5','#Measure#');
                        
                            Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": #Colspan#','"colspan": 3').replace('"column": #Column#','"column": 18').replace('#listselector#','listselector_23').replace('"row": #Row#','"row": 55');
                            SuccessString =  SuccessString.remove(Sales.Sales_Date_Delete__c);
                          // Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 1','"colspan": 1').replace('"column": 1','"column": 6').replace('"row": 2','"row": 1');
                          //  SuccessString =  SuccessString.remove(Sales.Sales_Date_Delete__c);
                          //  Sales.Sales_Date_Delete__c = Sales.Sales_Date_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 6','"column": 18').replace('"row": 1','"row": 55');
                          //  SuccessString =  SuccessString.remove(Sales.Sales_Date_Delete__c);
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
                                SuccessString =  SuccessString.replace('#'+Numbers+'queryFiltersLabel'+ i+'#',Filtervalues[M]).replace('#'+Numbers+'queryFiltersString'+ i+'#',Dim);     
                                i = i+1;
                                M = M+1;
                            }
                            for(Integer L=i;J >= L;L++){
                                integer k = L;
                                if(K == 5){   
                                    Sales.Sales_Insight_Filter_Delete__c = Sales.Sales_Insight_Filter_Delete__c.replace('queryFiltersLabel','#'+Numbers+'queryFiltersLabel'+k+'#').replace('}",','}"').replace('queryFiltersString','#'+Numbers+'queryFiltersString'+k+'#');
                                    SuccessString =  SuccessString.replace(Sales.Sales_Insight_Filter_Delete__c,'');
                                    Sales.Sales_Insight_Filter_Delete__c = Sales.Sales_Insight_Filter_Delete__c.replace('#'+Numbers+'queryFiltersLabel'+k+'#','queryFiltersLabel').replace('}"','}",').replace('#'+Numbers+'queryFiltersString'+k+'#','queryFiltersString');
                                }
                                else{
                                    Sales.Sales_Insight_Filter_Delete__c = Sales.Sales_Insight_Filter_Delete__c.replace('queryFiltersLabel','#'+Numbers+'queryFiltersLabel'+k+'#').replace('queryFiltersString','#'+Numbers+'queryFiltersString'+k+'#');
                                    SuccessString =  SuccessString.replace(Sales.Sales_Insight_Filter_Delete__c,'');
                                    Sales.Sales_Insight_Filter_Delete__c = Sales.Sales_Insight_Filter_Delete__c.replace('#'+Numbers+'queryFiltersLabel'+k+'#','queryFiltersLabel').replace('#'+Numbers+'queryFiltersString'+k+'#','queryFiltersString');
                                }
                            } 
                        }
                            
                    }
                    else{
                    	if(DimensionApi != Null){
                    		if(DimensionApi.size() > 0)
                        	SuccessString =  SuccessString.replace('#'+Numbers+'queryFiltersLabel1#','All').replace('#'+Numbers+'queryFiltersString1'+'#','\''+DimensionApi[0]+'\' in all');
                    	}
                        integer j = 5;
                        for(Integer L=2;J >= L;L++){
                                integer k = L;
                                if(K == 5){   
                                    Sales.Sales_Insight_Filter_Delete__c = Sales.Sales_Insight_Filter_Delete__c.replace('queryFiltersLabel','#'+Numbers+'queryFiltersLabel'+k+'#').replace('}",','}"').replace('queryFiltersString','#'+Numbers+'queryFiltersString'+k+'#');
                                    SuccessString =  SuccessString.replace(Sales.Sales_Insight_Filter_Delete__c,'');
                                    Sales.Sales_Insight_Filter_Delete__c = Sales.Sales_Insight_Filter_Delete__c.replace('#'+Numbers+'queryFiltersLabel'+k+'#','queryFiltersLabel').replace('}"','}",').replace('#'+Numbers+'queryFiltersString'+k+'#','queryFiltersString');
                                }
                                else{
                                    Sales.Sales_Insight_Filter_Delete__c = Sales.Sales_Insight_Filter_Delete__c.replace('queryFiltersLabel','#'+Numbers+'queryFiltersLabel'+k+'#').replace('queryFiltersString','#'+Numbers+'queryFiltersString'+k+'#');
                                    SuccessString =  SuccessString.replace(Sales.Sales_Insight_Filter_Delete__c,'');
                                    Sales.Sales_Insight_Filter_Delete__c = Sales.Sales_Insight_Filter_Delete__c.replace('#'+Numbers+'queryFiltersLabel'+k+'#','queryFiltersLabel').replace('#'+Numbers+'queryFiltersString'+k+'#','queryFiltersString');
                                }
                            } 	
                    }                       
                }
        }
                else{
                        integer Numbers = RowNumberlist -5;
                        
                        for(integer i=1;i<=3;i++){
                            Sales.Delete_All_Group__c = Sales.Delete_All_Group__c.replace('#StaticSalesGrouping#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#GroupingLabel','#'+Numbers+'GroupingLabel').replace('#GroupingAPI','#'+Numbers+'GroupingAPI');
                            SuccessString =  SuccessString.replace(Sales.Delete_All_Group__c,'');
                            Sales.Delete_All_Group__c = Sales.Delete_All_Group__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSalesGrouping#').replace('#'+Numbers+'GroupingLabel','#GroupingLabel').replace('#'+Numbers+'GroupingAPI','#GroupingAPI');
                            
                            Sales.Delete_All_Dates__c = Sales.Delete_All_Dates__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#Truewfalse#','false'); 
                        
                            Sales.Delete_All_Dates__c = Sales.Delete_All_Dates__c.replace('#datasetId#','#'+Numbers+'datasetId#').replace('#datasetAlias#','#'+Numbers+'datasetAlias#').replace('#DateAPI#','#'+Numbers+'DateAPI'+i+'#');
                            SuccessString =  SuccessString.replace(Sales.Delete_All_Dates__c,'');
                            Sales.Delete_All_Dates__c = Sales.Delete_All_Dates__c.replace('#'+Numbers+'DateAPI'+i+'#','#DateAPI#').replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('#'+Numbers+'datasetAlias#','#datasetAlias#').replace('#'+Numbers+'datasetId#','#datasetId#').replace('false','#Truewfalse#'); 
                    
                            if(Numbers == 2 && i == 1){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#listselectors#','listselector_28');
                                String Strlst28 = '"listselector_28": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,Strlst28);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSales#').replace('listselector_28','#listselectors#');
                                
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#datasetselector#','dateselector_4').replace('#Dates#','#2DateLabel1#');
                                String Strds4 = '"dateselector_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_All_dateselectors__c,Strds4);
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('dateselector_4','#datasetselector#').replace('#2DateLabel1#','#Dates#');
                                
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('#Charts#','Sales_Chart_2_1').replace('#SalesCharts#','chart_4');
                                  String Str8 = '"chart_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                                SuccessString =  SuccessString.replace(Sales.Delete_All_Chart__c,Str8);
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('Sales_Chart_2_1','#Charts#').replace('chart_4','#SalesCharts#');
                                
                            }
                            if(Numbers == 2 && i == 2){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#listselectors#','listselector_13');
                                String Strlst13 = '"listselector_13": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,Strlst13);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSales#').replace('listselector_13','#listselectors#');
                                
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#datasetselector#','dateselector_11').replace('#Dates#','#2DateLabel2#');
                                String Strds11 = '"dateselector_11": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_All_dateselectors__c,Strds11);
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('dateselector_11','#datasetselector#').replace('#2DateLabel2#','#Dates#');
                               
                                
                                Sales.Delete_All_Dates__c = Sales.Delete_All_Dates__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#Truewfalse#','true').replace('#datasetId#','#'+Numbers+'datasetId#').replace('#datasetAlias#','#'+Numbers+'datasetAlias#').replace('#DateAPI#','#'+Numbers+'DateAPI'+i+'#');
                                SuccessString =  SuccessString.replace(Sales.Delete_All_Dates__c,'');
                                Sales.Delete_All_Dates__c = Sales.Delete_All_Dates__c.replace('#'+Numbers+'DateAPI'+i+'#','#DateAPI#').replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('#'+Numbers+'datasetAlias#','#datasetAlias#').replace('#'+Numbers+'datasetId#','#datasetId#').replace('true','#Truewfalse#'); 
                                
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('#Charts#','Sales_Chart_2_2').replace('#SalesCharts#','chart_5');
                                  String Str8 = '"chart_5": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                                SuccessString =  SuccessString.replace(Sales.Delete_All_Chart__c,Str8);
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('Sales_Chart_2_2','#Charts#').replace('chart_5','#SalesCharts#');
                                
                                SuccessString =  SuccessString.replace(Sales.Sales_Insight_Delete2__c,'');
                            }
                            if(Numbers == 2 && i == 3){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#listselectors#','listselector_14');
                                String Strlst14 = '"listselector_14": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,Strlst14);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSales#').replace('listselector_14','#listselectors#');
                                
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#datasetselector#','dateselector_10').replace('#Dates#','#2DateLabel3#');
                                String Strds10 = '"dateselector_10": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_All_dateselectors__c,Strds10);
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('dateselector_10','#datasetselector#').replace('#2DateLabel3#','#Dates#');
                                
                                Sales.Delete_All_Dates__c = Sales.Delete_All_Dates__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#Truewfalse#','true').replace('#datasetId#','#'+Numbers+'datasetId#').replace('#datasetAlias#','#'+Numbers+'datasetAlias#').replace('#DateAPI#','#'+Numbers+'DateAPI'+i+'#');
                                SuccessString =  SuccessString.replace(Sales.Delete_All_Dates__c,'');
                                Sales.Delete_All_Dates__c = Sales.Delete_All_Dates__c.replace('#'+Numbers+'DateAPI'+i+'#','#DateAPI#').replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('#'+Numbers+'datasetAlias#','#datasetAlias#').replace('#'+Numbers+'datasetId#','#datasetId#').replace('true','#Truewfalse#'); 
                                
                                Sales.Delete_All_Chart1__c = Sales.Delete_All_Chart1__c.replace('#Charts#','Sales_Chart_2_3').replace('#SalesCharts#','chart_22');
                                  String Str8 = '"chart_22": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                                SuccessString =  SuccessString.replace(Sales.Delete_All_Chart1__c,Str8);
                                Sales.Delete_All_Chart1__c = Sales.Delete_All_Chart1__c.replace('Sales_Chart_2_3','#Charts#').replace('chart_22','#SalesCharts#');
                                SuccessString =  SuccessString.replace(Sales.Sales_Insight_Delete3__c,'');
                            }
                            if(Numbers == 4 && i == 1){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#listselectors#','listselector_34');
                                String Strls34 = '"listselector_34": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,Strls34);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSales#').replace('listselector_34','#listselectors#');
                                
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#datasetselector#','dateselector_6').replace('#Dates#','#4DateLabel1#');
                                String Strds6 = '"dateselector_6": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_All_dateselectors__c,Strds6);
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('dateselector_6','#datasetselector#').replace('#4DateLabel1#','#Dates#');
                                
                                
                                    Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('#Charts#','Sales_Chart_4_1').replace('#SalesCharts#','chart_11');
                                  String Str8 = '"chart_11": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                                SuccessString =  SuccessString.replace(Sales.Delete_All_Chart__c,Str8);
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('Sales_Chart_4_1','#Charts#').replace('chart_11','#SalesCharts#');
                                
                            }
                            if(Numbers == 4 && i == 2){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#listselectors#','listselector_20');
                                String Strls20 = '"listselector_20": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,Strls20);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSales#').replace('listselector_20','#listselectors#');
                                
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#datasetselector#','dateselector_14').replace('#Dates#','#4DateLabel2#');
                                String Strds14 = '"dateselector_14": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_All_dateselectors__c,Strds14);
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('dateselector_14','#datasetselector#').replace('#4DateLabel2#','#Dates#');
                                
                                
                                    Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('#Charts#','Sales_Chart_4_2').replace('#SalesCharts#','chart_12');
                                      String Str8 = '"chart_12": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                                SuccessString =  SuccessString.replace(Sales.Delete_All_Chart__c,Str8);
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('Sales_Chart_4_2','#Charts#').replace('chart_12','#SalesCharts#');
                                
                            }
                            if(Numbers == 4 && i == 3){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#listselectors#','listselector_21');
                                String Strls27 = '"listselector_21": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,Strls27);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSales#').replace('listselector_21','#listselectors#');
                                
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#datasetselector#','dateselector_15').replace('#Dates#','#4DateLabel3#');
                                String Strds15 = '"dateselector_15": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_All_dateselectors__c,Strds15);
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('dateselector_15','#datasetselector#').replace('#4DateLabel3#','#Dates#');
                                
                                Sales.Delete_All_Chart1__c = Sales.Delete_All_Chart1__c.replace('#Charts#','Sales_Chart_4_3').replace('#SalesCharts#','chart_10');
                                  String Str8 = '"chart_10": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                                SuccessString =  SuccessString.replace(Sales.Delete_All_Chart1__c,Str8);
                                Sales.Delete_All_Chart1__c = Sales.Delete_All_Chart1__c.replace('Sales_Chart_4_3','#Charts#').replace('chart_10','#SalesCharts#');
                                SuccessString =  SuccessString.replace(Sales.Chart_Delete2__c,'');
                                
                            }
                            if(Numbers == 3 && i == 1){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#listselectors#','listselector_44');
                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('listselector_44','listselector_48');
                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('listselector_48','listselector_33');
                                String Strclst33 = '"listselector_33": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,Strclst33);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('listselector_33','#listselectors#').replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSales#');
                                
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#datasetselector#','dateselector_5').replace('#Dates#','#3DateLabel1#');
                                String Strds5 = '"dateselector_5": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                SuccessString =  SuccessString.replace(Sales.Delete_All_dateselectors__c,Strds5);
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('dateselector_5','#datasetselector#').replace('#3DateLabel1#','#Dates#');
                                
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('#Charts#','Sales_Chart_3_1').replace('#SalesCharts#','chart_7');
                                  String Str8 = '"chart_7": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                                SuccessString =  SuccessString.replace(Sales.Delete_All_Chart__c,str8);
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('Sales_Chart_3_1','#Charts#').replace('chart_7','#SalesCharts#');
                                
                            }
                            if(Numbers == 3 && i == 2){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#listselectors#','listselector_49');
                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('listselector_49','listselector_46');
                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('listselector_46','listselector_18');
                                String Strclst18 = '"listselector_18": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,Strclst18);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSales#').replace('listselector_18','#listselectors#');
                                
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#datasetselector#','dateselector_13').replace('#Dates#','#3DateLabel2#');
                                String Strds13 = '"dateselector_13": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_All_dateselectors__c,Strds13);
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('dateselector_13','#datasetselector#').replace('#3DateLabel2#','#Dates#');
                                
                                    Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('#Charts#','Sales_Chart_3_2').replace('#SalesCharts#','chart_8');
                                      String Str8 = '"chart_8": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                                SuccessString =  SuccessString.replace(Sales.Delete_All_Chart__c,str8);
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('Sales_Chart_3_2','#Charts#').replace('chart_8','#SalesCharts#');
                                
                            }
                            if(Numbers == 3 && i == 3){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#listselectors#','listselector_50');
                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('listselector_50','listselector_45');
                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('listselector_45','listselector_17');
                                String Strclst17 = '"listselector_17": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,Strclst17);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSales#').replace('listselector_17','#listselectors#');
                                
                                Sales.Delete_All_dateselector1__c = Sales.Delete_All_dateselector1__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#datasetselector#','dateselector_12').replace('#Dates#','#3DateLabel3#');
                                String Strds12 = '"dateselector_12": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                SuccessString =  SuccessString.replace(Sales.Delete_All_dateselector1__c,Strds12);
                                Sales.Delete_All_dateselector1__c = Sales.Delete_All_dateselector1__c.replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('dateselector_12','#datasetselector#').replace('#3DateLabel3#','#Dates#');
                                
                                Sales.Delete_All_Chart1__c = Sales.Delete_All_Chart1__c.replace('#Charts#','Sales_Chart_3_3').replace('#SalesCharts#','chart_18');
                                  String Str8 = '"chart_18": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                                SuccessString =  SuccessString.replace(Sales.Delete_All_Chart1__c,str8);
                                Sales.Delete_All_Chart1__c = Sales.Delete_All_Chart1__c.replace('Sales_Chart_3_3','#Charts#').replace('chart_18','#SalesCharts#');
                                SuccessString =  SuccessString.replace(Sales.Delete_All_Chart3__c,'');                  
                                
                            }
                            if(Numbers == 5 && i == 1){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#listselectors#','listselector_35');
                                String  Str5 = '"listselector_35": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            
                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,Str5);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSales#').replace('listselector_35','#listselectors#');
                                
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#datasetselector#','dateselector_7').replace('#Dates#','#5DateLabel1#');
                                String  Str6 = '"dateselector_7": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                                SuccessString =  SuccessString.replace(Sales.Delete_All_dateselectors__c,Str6);
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('dateselector_7','#datasetselector#').replace('#5DateLabel1#','#Dates#');
                                
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('#Charts#','Sales_Chart_5_1').replace('#SalesCharts#','chart_14');
                                 String Str8 = '"chart_14": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                                SuccessString =  SuccessString.replace(Sales.Delete_All_Chart__c,Str8);
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('Sales_Chart_5_1','#Charts#').replace('chart_14','#SalesCharts#');
                                
                                SuccessString =  SuccessString.replace(Sales.Chart_Delete14__c,'');
                            }
                            if(Numbers == 5 && i == 2){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#listselectors#','listselector_24');
                                 String  Str4 = '"listselector_24": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            
                               
                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,Str4);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSales#').replace('listselector_24','#listselectors#');
                                
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#datasetselector#','dateselector_17').replace('#Dates#','#5DateLabel2#');
                                 String  Str5 = '"dateselector_17": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            
                               
                                SuccessString =  SuccessString.replace(Sales.Delete_All_dateselectors__c,Str5);
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('dateselector_17','#datasetselector#').replace('#5DateLabel2#','#Dates#');
                                
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('#Charts#','Sales_Chart_5_2').replace('#SalesCharts#','chart_24');
                                  String Str7 = '"chart_24": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                      
                                SuccessString =  SuccessString.replace(Sales.Delete_All_Chart__c,Str7);                           
                                Sales.Delete_All_Chart__c = Sales.Delete_All_Chart__c.replace('Sales_Chart_5_2','#Charts#').replace('chart_24','#SalesCharts#');
                                 String Strch24 = '"chart_24": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                
                                SuccessString =  SuccessString.replace(Sales.Delete_All_Chart4__c,Strch24);
                                Sales.Delete_All_Chart2__c = Sales.Delete_All_Chart2__c.replace('#Charts#','Sales_Chart_5_2').replace('#SalesCharts#','chart_16');
                                  String Str8 = '"chart_16": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                
                                SuccessString =  SuccessString.replace(Sales.Delete_All_Chart2__c,Str8);                              
                                Sales.Delete_All_Chart2__c = Sales.Delete_All_Chart2__c.replace('Sales_Chart_5_2','#Charts#').replace('chart_16','#SalesCharts#');
                                
                                SuccessString =  SuccessString.replace(Sales.Chart_Delete24__c,'');
                                
                            }
                            if(Numbers == 5 && i == 3){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#listselectors#','listselector_25');
                                 String  Str4 = '"listselector_25": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            
                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,Str4);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSales#').replace('listselector_25','#listselectors#');
                                
                                Sales.Delete_All_Group5__c = Sales.Delete_All_Group5__c.replace('#StaticSalesGrouping#','Static_Sales__KPI_'+Numbers+'_Grouping_'+i).replace('#GroupingLabel','#'+Numbers+'GroupingLabel').replace('#GroupingAPI','#'+Numbers+'GroupingAPI');
                              
                                SuccessString =  SuccessString.replace(Sales.Delete_All_Group5__c,'');
                                Sales.Delete_All_Group5__c = Sales.Delete_All_Group5__c.replace('Static_Sales__KPI_'+Numbers+'_Grouping_'+i,'#StaticSalesGrouping#').replace('#'+Numbers+'GroupingLabel','#GroupingLabel').replace('#'+Numbers+'GroupingAPI','#GroupingAPI');
                                
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('SalesKPIDate','Sales__KPI_'+Numbers+'_Date_'+i).replace('#datasetselector#','dateselector_16').replace('#Dates#','#5DateLabel3#');
                                 String  Str6 = '"dateselector_16": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            
                                SuccessString =  SuccessString.replace(Sales.Delete_All_dateselectors__c,Str6);
                                Sales.Delete_All_dateselectors__c = Sales.Delete_All_dateselectors__c.replace('Sales__KPI_'+Numbers+'_Date_'+i,'SalesKPIDate').replace('dateselector_16','#datasetselector#').replace('#5DateLabel3#','#Dates#');
                                
                                Sales.Delete_All_Chart1__c = Sales.Delete_All_Chart1__c.replace('#Charts#','Sales_Chart_5_3').replace('#SalesCharts#','chart_20');
                                String  Str7 = '"chart_20": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            
                                SuccessString =  SuccessString.replace(Sales.Delete_All_Chart1__c,Str7);
                                Sales.Delete_All_Chart1__c = Sales.Delete_All_Chart1__c.replace('Sales_Chart_5_3','#Charts#').replace('chart_20','#SalesCharts#');
                                
                            }                                                       
                        } 
                            Sales.Delete_All_Timeline__c = Sales.Delete_All_Timeline__c.replace('#StaticSalesTimelines#','Static_Sales__KPI_'+Numbers+'_Timeline').replace('#DateLabel','#'+Numbers+'DateLabel').replace('#DateAPI','#'+Numbers+'DateAPI');
                            SuccessString =  SuccessString.replace(Sales.Delete_All_Timeline__c,'');
                            Sales.Delete_All_Timeline__c = Sales.Delete_All_Timeline__c.replace('Static_Sales__KPI_'+Numbers+'_Timeline','#StaticSalesTimelines#').replace('#'+Numbers+'DateLabel','#DateLabel').replace('#'+Numbers+'DateAPI','#DateAPI'); 
                            
                            Sales.Delete_All_Timeline4__c = Sales.Delete_All_Timeline4__c.replace('#StaticSalesFilter#','Static_Sales__KPI_'+Numbers +'_Filter').replace('#queryFiltersLabel','#'+Numbers+'queryFiltersLabel').replace('#queryFiltersString','#'+Numbers+'queryFiltersString');
                            SuccessString =  SuccessString.replace(Sales.Delete_All_Timeline4__c,'');
                            Sales.Delete_All_Timeline4__c = Sales.Delete_All_Timeline4__c.replace('Static_Sales__KPI_'+Numbers +'_Filter','#StaticSalesFilter#').replace('#'+Numbers+'queryFiltersLabel','#queryFiltersLabel').replace('#'+Numbers+'queryFiltersString','#queryFiltersString'); 
                            
                            Sales.Delete_All_Orders__c = Sales.Delete_All_Orders__c.replace('#StaticSalesOrder#','Static_Sales_Order_'+Numbers);
                            SuccessString =  SuccessString.replace(Sales.Delete_All_Orders__c,'');
                            Sales.Delete_All_Orders__c = Sales.Delete_All_Orders__c.replace('Static_Sales_Order_'+Numbers,'#StaticSalesOrder#'); 
                            
                            Sales.Delete_All_Measures__c = Sales.Delete_All_Measures__c.replace('#StaticSalesMeasure#','Static_Sales_Measure_'+Numbers ).replace('#MeasureLabel','#'+Numbers+'MeasureLabel').replace('#CompactMeasureAPI','#'+Numbers+'CompactMeasureAPI').replace('#ExpressionMeasureAPI','#'+Numbers+'ExpressionMeasureAPI').replace('#AliasMeasureAPI','#'+Numbers+'AliasMeasureAPI');
                            SuccessString =  SuccessString.replace(Sales.Delete_All_Measures__c,'');
                            Sales.Delete_All_Measures__c = Sales.Delete_All_Measures__c.replace('Static_Sales_Measure_'+Numbers,'#StaticSalesMeasure#').replace('#'+Numbers+'MeasureLabel','#MeasureLabel').replace('#'+Numbers+'CompactMeasureAPI','#CompactMeasureAPI').replace('#'+Numbers+'ExpressionMeasureAPI','#ExpressionMeasureAPI').replace('#'+Numbers+'AliasMeasureAPI','#AliasMeasureAPI');
                            
                            Sales.Delete_All_Static_KPIs__c = Sales.Delete_All_Static_KPIs__c.replace('#StaticSales#','Static_Sales_KPI_'+Numbers ).replace('#MeasureLabel','#'+Numbers+'MeasureLabel').replace('#CompactMeasureAPI','#'+Numbers+'CompactMeasureAPI').replace('#ExpressionMeasureAPI','#'+Numbers+'ExpressionMeasureAPI').replace('#AliasMeasureAPI','#'+Numbers+'AliasMeasureAPI');
                            SuccessString =  SuccessString.replace(Sales.Delete_All_Static_KPIs__c,'');
                            Sales.Delete_All_Static_KPIs__c = Sales.Delete_All_Static_KPIs__c.replace('Static_Sales_KPI_'+Numbers,'#StaticSales#').replace('#'+Numbers+'MeasureLabel','#MeasureLabel').replace('#'+Numbers+'CompactMeasureAPI','#CompactMeasureAPI').replace('#'+Numbers+'ExpressionMeasureAPI','#ExpressionMeasureAPI').replace('#'+Numbers+'AliasMeasureAPI','#AliasMeasureAPI');
                            
                            //SuccessString =  SuccessString.replace(Sales.Delete_All_Timeline4__c,'');
                                                        
                            if(Numbers == 5){
                                SuccessString =  SuccessString.replace(Sales.Delete_All_Timeline3__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales_Measure_'+Numbers).replace('#listselectors#','listselector_23').replace('Choose Groupings','Choose Measures');
                                String Str24 = '"listselector_23": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,Str24);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales_Measure_'+Numbers,'#StaticSales#').replace('listselector_23','#listselectors#').replace('Choose Measures','Choose Groupings');
                                
                                Sales.List_Selector__c = Sales.List_Selector__c.replace('#listselectors#','listselector_23').replace('"colspan": #Colspans#','"colspan": 3').replace('"column": #Cloumns#','"column": 18').replace('"row": #rows#','"row": 55');
                                SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_23','listselector_23').replace('"colspan": 3','"colspan": 1').replace('"column": 18','"column": 6').replace('"row": 55','"row": 1');
                                SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_23','listselector_23').replace('"colspan": 1','"colspan": 1').replace('"column": 6','"column": 1').replace('"row": 1','"row": 2');
                                SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_23','#listselectors#').replace('"colspan": 1','"colspan": #Colspans#').replace('"column": 1','"column": #Cloumns#').replace('"row": 2','"row": #rows#');
                                        
                                        
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Timeline').replace('#listselectors#','listselector_16').replace('Choose Groupings','Choose Date Format');
                                String Strlst = '"listselector_16": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,Strlst);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Timeline','#StaticSales#').replace('listselector_16','#listselectors#').replace('Choose Date Format','Choose Groupings');
                                
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers +'_Filter').replace('#listselectors#','listselector_41').replace('Choose Groupings','Choose Filters');
                                String Str41 = '"listselector_41": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,Str41);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('listselector_41','listselector_6');
                                 String Str6 = '"listselector_6": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,Str6);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers +'_Filter','#StaticSales#').replace('listselector_6','#listselectors#').replace('Choose Filters','Choose Groupings');
                                
                                Sales.Delete_pillbox__c = Sales.Delete_pillbox__c.replace('#StaticSalesOrder#','Static_Sales_Order_'+Numbers).replace('#pillboxs#','pillbox_7');
                                String Strpill = '"pillbox_7": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_pillbox__c,Strpill);
                                Sales.Delete_pillbox__c = Sales.Delete_pillbox__c.replace('Static_Sales_Order_'+Numbers,'#StaticSalesOrder#').replace('pillbox_7','#pillboxs#');                               
                                
                            } 
                            if(Numbers == 4){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales_Measure_'+Numbers).replace('#listselectors#','listselector_19').replace('Choose Groupings','Choose Measures');
                                String Strls19 = '"listselector_19": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,Strls19);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales_Measure_'+Numbers,'#StaticSales#').replace('listselector_19','#listselectors#').replace('Choose Measures','Choose Groupings');
                                
                                SuccessString =  SuccessString.replace(Sales.Delete_All_Timeline2__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Timeline').replace('#listselectors#','listselector_15').replace('Choose Groupings','Choose Date Format');
                                String Strls15 = '"listselector_15": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,Strls15);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Timeline','#StaticSales#').replace('listselector_15','#listselectors#').replace('Choose Date Format','Choose Groupings');
                                
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers +'_Filter').replace('#listselectors#','listselector_40').replace('Choose Groupings','Choose Filters');
                                String Strls40 = '"listselector_40": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,Strls40);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers +'_Filter','#StaticSales#').replace('listselector_40','#listselectors#').replace('Choose Filters','Choose Groupings');
                                
                                Sales.Delete_pillbox__c = Sales.Delete_pillbox__c.replace('#StaticSalesOrder#','Static_Sales_Order_'+Numbers).replace('#pillboxs#','pillbox_5');
                                String Strpill5 = '"pillbox_5": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_pillbox__c,Strpill5);
                                Sales.Delete_pillbox__c = Sales.Delete_pillbox__c.replace('Static_Sales_Order_'+Numbers,'#StaticSalesOrder#').replace('pillbox_5','#pillboxs#');    
                            } 
                            if(Numbers == 3){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales_Measure_'+Numbers).replace('#listselectors#','listselector_43').replace('Choose Groupings','Choose Measures');
                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('listselector_43','listselector_53');
                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('listselector_53','listselector_36');
                                String Strclst36 = '"listselector_36": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,Strclst36);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales_Measure_'+Numbers,'#StaticSales#').replace('listselector_36','#listselectors#').replace('Choose Measures','Choose Groupings');
                                
                                        SuccessString =  SuccessString.replace(Sales.Lis_Selector36__c,'').replace(Sales.List_Selector43__c,'').replace(Sales.Delete_List_Selector43__c,'').replace(Sales.List_Selector53__c,'').replace(Sales.Delete_List_Selector53__c,'');
                                SuccessString =  SuccessString.replace(Sales.Delete_All_Timeline1__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Timeline').replace('#listselectors#','listselector_37').replace('Choose Groupings','Choose Date Format');
                              String Strclst37 = '"listselector_37": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,Strclst37);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('listselector_37','listselector_47');
                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('listselector_47','listselector_51');
                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,'');
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Timeline','#StaticSales#').replace('listselector_51','#listselectors#').replace('Choose Date Format','Choose Groupings');
                                
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers +'_Filter').replace('#listselectors#','listselector_39').replace('Choose Groupings','Choose Filters');
                                String Strclst39 = '"listselector_39": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,Strclst39);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers +'_Filter','#StaticSales#').replace('listselector_39','#listselectors#').replace('Choose Filters','Choose Groupings');
                                
                                
                                
                                Sales.Delete_pillbox__c = Sales.Delete_pillbox__c.replace('#StaticSalesOrder#','Static_Sales_Order_'+Numbers).replace('#pillboxs#','pillbox_2');
                                SuccessString =  SuccessString.replace(Sales.Delete_pillbox__c,'');
                                Sales.Delete_pillbox__c = Sales.Delete_pillbox__c.replace('pillbox_2','pillbox_6');
                                SuccessString =  SuccessString.replace(Sales.Delete_pillbox__c,'');
                                Sales.Delete_pillbox__c = Sales.Delete_pillbox__c.replace('pillbox_6','pillbox_4');
                                String Strpill4 = '"pillbox_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_pillbox__c,Strpill4);
                                Sales.Delete_pillbox__c = Sales.Delete_pillbox__c.replace('Static_Sales_Order_'+Numbers,'#StaticSalesOrder#').replace('pillbox_4','#pillboxs#');
                            }
                            if(Numbers == 2){
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales_Measure_'+Numbers).replace('#listselectors#','listselector_12').replace('Choose Groupings','Choose Measures');
                                String Strlst12 = '"listselector_12": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,Strlst12);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales_Measure_'+Numbers,'#StaticSales#').replace('listselector_12','#listselectors#').replace('Choose Measures','Choose Groupings');
                                
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers+'_Timeline').replace('#listselectors#','listselector_22').replace('Choose Groupings','Choose Date Format');
                                String Strlst22 = '"listselector_22": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,Strlst22);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers+'_Timeline','#StaticSales#').replace('listselector_22','#listselectors#').replace('Choose Date Format','Choose Groupings');
                                
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('#StaticSales#','Static_Sales__KPI_'+Numbers +'_Filter').replace('#listselectors#','listselector_38').replace('Choose Groupings','Choose Filters');
                                String Strlst38 = '"listselector_38": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_List_Selector__c,Strlst38);
                                Sales.Delete_List_Selector__c = Sales.Delete_List_Selector__c.replace('Static_Sales__KPI_'+Numbers +'_Filter','#StaticSales#').replace('listselector_38','#listselectors#').replace('Choose Filters','Choose Groupings');
                                
                                Sales.Delete_pillbox__c = Sales.Delete_pillbox__c.replace('#StaticSalesOrder#','Static_Sales_Order_'+Numbers).replace('#pillboxs#','pillbox_3');
                                String Strpill3 = '"pillbox_3": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                SuccessString =  SuccessString.replace(Sales.Delete_pillbox__c,Strpill3);
                                Sales.Delete_pillbox__c = Sales.Delete_pillbox__c.replace('Static_Sales_Order_'+Numbers,'#StaticSalesOrder#').replace('pillbox_3','#pillboxs#');
                            } 
                       
                                    if(Numbers == 5 ){
                                        //  System.debug('Sales.Sales_KPI_Delete__c*************'+Sales.Sales_KPI_Delete__c);
                                        String[] StNUmbers = new String[]{'number_13','number_12','number_11','number_14'};
                                        String[] Fields = new String[]{'#5AliasMeasureAPI3#','#5AliasMeasureAPI2#','#5AliasMeasureAPI1#','#5AliasMeasureAPI4#'};
                                        SuccessString =  SuccessString.replace(Sales.List_Selector6__c,'').replace(Sales.Sales_Chart_5__c,'').replace(Sales.Sales_KPI_5__c,'').replace(Sales.number_33__c,'').replace(Sales.number_34__c,'');     
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('#texts#','text_31').replace('#StaticSales#','Static_Sales_KPI_'+ Numbers).replace('#labels#','label_1');
                                        String Str11 = '"text_31": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                        
                                        SuccessString =  SuccessString.replace(Sales.Delete_All_Texts__c,Str11);
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_31','text_32').replace('label_1','label_2');
                                        String Str8 = '"text_32": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                        
                                        SuccessString =  SuccessString.replace(Sales.Delete_All_Texts__c,Str8);
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_32','text_33').replace('label_2','label_3');
                                        String Str9 = '"text_33": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                        
                                        SuccessString =  SuccessString.replace(Sales.Delete_All_Texts__c,Str9);                                       
                                        
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_33','text_34').replace('label_3','label_4');                                        
                                        String Str10 = '"text_34": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                        
                                        SuccessString =  SuccessString.replace(Sales.Delete_All_Texts__c,Str10);                                       
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_34','#texts#').replace('label_4','#labels#').replace('Static_Sales_KPI_'+ Numbers,'#StaticSales#');
                                        
                                        integer i= 0;        
                                        for(String St : StNUmbers){                                     
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Numbers#',St);
                                        if(St == ''){
                                          // Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"exploreLink": #falses#','"exploreLink": false').replace('"compact": #trues#','"compact": true');
                                        }
                                        else{
                                            Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"exploreLink": #falses#','"exploreLink": true').replace('"compact": #trues#','"compact": true');
                                        }
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Fields#',Fields[i]).replace('#SalesKPIs#','Sales_KPI_5');
                                        
                                        String Str7 = '"'+St+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                      //  System.debug('Sales.Sales_KPI_Delete__c*************'+Sales.Sales_KPI_Delete__c);
                                     //   System.debug('Str7*************'+Str7);
                                        SuccessString =  SuccessString.replace(Sales.Sales_KPI_Delete__c,Str7);
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace(St,'#Numbers#').replace(Fields[i],'#Fields#').replace('Sales_KPI_5','#SalesKPIs#');
                                       
                                            Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"compact": true','"compact": #trues#').replace('"exploreLink": true','"exploreLink": #falses#');
                                        
                                        i++;
                                        }   
                                        
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('#listselectors#','listselector_16').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #Cloumns#','"column": 0').replace('"row": #rows#','"row": 10');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 0','"column": 4').replace('"row": 10','"row": 4');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 4','"column": 16').replace('"row": 4','"row": 58');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 16','"column": 0').replace('listselector_16','listselector_41').replace('"row": 58','"row": 2');
                                        
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_41','listselector_6').replace('"colspan": 1','"colspan": 1').replace('"column": 0','"column": 2').replace('"row": 2','"row": 1');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_6','listselector_41').replace('"colspan": 1','"colspan": 3').replace('"column": 2','"column": 6').replace('"row": 1','"row": 55');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 6','"column": 0').replace('listselector_41','listselector_35').replace('"row": 55','"row": 9');
                                        
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 0','"column": 0').replace('"row": 9','"row": 4');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 0','"column": 2').replace('"row": 4','"row": 58');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 2','"column": 1').replace('listselector_35','listselector_24').replace('"row": 58','"row": 9');
                                        
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 1','"column": 2').replace('"row": 9','"row": 4');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 2','"column": 9').replace('"row": 4','"row": 58');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 9','"column": 1').replace('listselector_24','listselector_25').replace('"row": 58','"row": 10');
                                        
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 1','"column": 6').replace('"row": 10','"row": 4');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 6','"column": 19').replace('"row": 4','"row": 58');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 19','"column": #Cloumns#').replace('listselector_25','#listselectors#').replace('"row": 58','"row": #rows#');
                                        
                                        Sales.Pillbox__c = Sales.Pillbox__c.replace('#pillboxs#','pillbox_7').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #Cloumns#','"column": 1').replace('"row": #rows#','"row": 4');
                                            SuccessString =  SuccessString.replace(Sales.Pillbox__c,'');
                                            Sales.Pillbox__c = Sales.Pillbox__c.replace('"colspan": 1','"colspan": 1').replace('"column": 1','"column": 7').replace('"row": 4','"row": 1');
                                            SuccessString =  SuccessString.replace(Sales.Pillbox__c,'');
                                            Sales.Pillbox__c = Sales.Pillbox__c.replace('"colspan": 1','"colspan": 3').replace('"column": 7','"column": 21').replace('"row": 1','"row": 55');
                                            SuccessString =  SuccessString.replace(Sales.Pillbox__c,'');                                                                            
                                            Sales.Pillbox__c = Sales.Pillbox__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 21','"column": #Cloumns#').replace('pillbox_7','#pillboxs#').replace('"row": 55','"row": #rows#');
                                            
                                            Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('#charts#','chart_20').replace('"colspan": #Colspans#','"colspan": 4').replace('"column": #Cloumns#','"column": 4').replace('"row": #rows#','"row": 5').replace('"rowspan": #rowspans#','"rowspan": 7');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');
                                            
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 4','"colspan": 10').replace('"column": 4','"column": 14').replace('"row": 5','"row": 59');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');  
                                                                                                                
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 10','"colspan": 2').replace('"column": 14','"column": 2').replace('chart_20','chart_16').replace('"row": 59','"row": 5').replace('"rowspan": 7','"rowspan": 7');
                                        
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');
                                            
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('chart_16','chart_24').replace('"colspan": 2','"colspan": 7').replace('"column": 2','"column": 7').replace('"row": 5','"row": 59');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');      
                                                                                                            
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 7','"colspan": 2').replace('"column": 7','"column": 0').replace('chart_24','chart_14').replace('"row": 59','"row": 5').replace('"rowspan": 7','"rowspan": 7');
                                        
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');
                                            
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 2','"colspan": 7').replace('"column": 0','"column": 0').replace('"row": 5','"row": 59');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');  
                                            
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 7','"colspan": 2').replace('"row": 59','"row": 11').replace('"rowspan": 7','"rowspan": 6');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');  
                                                                                                                
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 7','"colspan": #Colspans#').replace('"column": 0','"column": #Cloumns#').replace('chart_14','#charts#').replace('"row": 59','"row": #rows#').replace('"rowspan": 6','"rowspan": #rowspans#');
                                        
                                        Sales.Chart_Delete__c = Sales.Chart_Delete__c.replace('#charts#','chart_20').replace('"colspan": #Colspans#','"colspan": 2').replace('"column": #Cloumns#','"column": 0').replace('"row": #rows#','"row": 23').replace('"rowspan": #rowspans#','"rowspan": 6');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete__c,'');         
                                        Sales.Chart_Delete__c = Sales.Chart_Delete__c.replace('chart_20','chart_24').replace('"row": 23','"row": 17');      
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete__c,'');                                                                   
                                        Sales.Chart_Delete__c = Sales.Chart_Delete__c.replace('"colspan": 2','"colspan": #Colspans#').replace('"column": 0','"column": #Cloumns#').replace('chart_24','#charts#').replace('"row": 17','"row": #rows#').replace('"rowspan": 6','"rowspan": #rowspans#'); 
                                        
                                        String[] St1 = new String[]{'6','2','1'};
                                        String[] St2 = new String[]{'0','0','0'};
                                        String[] St3 = new String[]{'57','3','6'};
                                        String[] St5 = new String[]{'6','2','1'};
                                        integer j=0;
                                        for(String St : St1){
                                        Sales.Test1__c = Sales.Test1__c.replace('"colspan": #Cols#','"colspan": '+St).replace('"column": #colm#','"column": '+st2[j]).replace('"row": #rows#','"row": '+st3[j]);
                                        SuccessString =  SuccessString.replace(Sales.Test1__c,'');                                                                  
                                        Sales.Test1__c = Sales.Test1__c.replace('"colspan": '+St,'"colspan": #Cols#').replace('"column": '+st2[j],'"column": #colm#').replace('"row": '+st3[j],'"row": #rows#');
                                            j++;
                                        }
                                        
                                        
                                        integer k=0;
                                        for(String St : St1){
                                        Sales.Test2__c = Sales.Test2__c.replace('"colspan": #Cols#','"colspan": '+St).replace('"column": #colm#','"column": '+st5[k]).replace('"row": #rows#','"row": '+st3[k]);
                                        SuccessString =  SuccessString.replace(Sales.Test2__c,'');                                                                      
                                        Sales.Test2__c = Sales.Test2__c.replace('"colspan": '+St,'"colspan": #Cols#').replace('"column": '+st5[k],'"column": #colm#').replace('"row": '+st3[k],'"row": #rows#');
                                            k++;
                                        }
                                        
                                        String[] St8 = new String[]{'12','4','0'};
                                        String[] St9 = new String[]{'57','3','8'};                                      
                                        String[] St11 = new String[]{'18','6','1'};
                                        integer l=0;
                                        for(String St : St1){
                                        Sales.Test3__c = Sales.Test3__c.replace('"colspan": #Cols#','"colspan": '+St).replace('"column": #colm#','"column": '+st8[l]).replace('"row": #rows#','"row": '+St9[l]);
                                        SuccessString =  SuccessString.replace(Sales.Test3__c,'');                                                                  
                                        Sales.Test3__c = Sales.Test3__c.replace('"colspan": '+St,'"colspan": #Cols#').replace('"column": '+st8[l],'"column": #colm#').replace('"row": '+St9[l],'"row": #rows#');
                                            l++;
                                        }
                                        
                                        integer m=0;
                                        for(String St : St1){
                                        Sales.Test4__c = Sales.Test4__c.replace('"colspan": #Cols#','"colspan": '+St).replace('"column": #colm#','"column": '+st11[m]).replace('"row": #rows#','"row": '+st9[m]);
                                        SuccessString =  SuccessString.replace(Sales.Test4__c,'');                                                                  
                                        Sales.Test4__c = Sales.Test4__c.replace('"colspan": '+St,'"colspan": #Cols#').replace('"column": '+st11[m],'"column": #colm#').replace('"row": '+st9[m],'"row": #rows#');
                                            m++;
                                        }
                                        
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('#dateselector#','dateselector_7').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 3');
                                        //Sales.Chart_Delete__c = Sales.Chart_Delete__c.replace('"rowspan": #rowspans#','"rowspan": 6');
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');         
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 1').replace('"column": 0','"column": 3').replace('"row": 3','"row": 1');   
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 3','"column": 9').replace('"row": 1','"row": 55');  
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');                                                                   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 9','"column": #column#').replace('dateselector_7','#dateselector#').replace('"row": 55','"row": #rows#');  
                                        
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('#dateselector#','dateselector_17').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #column#','"column": 1').replace('"row": #rows#','"row": 3');
                                        //Sales.Chart_Delete__c = Sales.Chart_Delete__c.replace('"rowspan": #rowspans#','"rowspan": 6');
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');         
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 1').replace('"column": 1','"column": 4').replace('"row": 3','"row": 1');   
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 4','"column": 12').replace('"row": 1','"row": 55'); 
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');                                                                   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 12','"column": #column#').replace('dateselector_17','#dateselector#').replace('"row": 55','"row": #rows#');
                                        //Sales.Chart_Delete__c = Sales.Chart_Delete__c.replace('"rowspan": 6','"rowspan": #rowspans#');
                                        
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('#dateselector#','dateselector_16').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 4');
                                        //Sales.Chart_Delete__c = Sales.Chart_Delete__c.replace('"rowspan": #rowspans#','"rowspan": 6');
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');         
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 1').replace('"column": 0','"column": 5').replace('"row": 4','"row": 1');   
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 5','"column": 15').replace('"row": 1','"row": 55'); 
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');                                                                   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 15','"column": #column#').replace('dateselector_16','#dateselector#').replace('"row": 55','"row": #rows#');    
                                        
                                            Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_13').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 12').replace('"row": #rows#','"row": 56');
                                        SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');       
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_13','number_12').replace('"colspan": 6','"colspan": 6').replace('"column": 12','"column": 6').replace('"row": 56','"row": 56');   
                                        SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');  
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_12','number_11').replace('"colspan": 6','"colspan": 6').replace('"column": 6','"column": 0').replace('"row": 56','"row": 56');    
                                        SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,''); 
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_11','number_14').replace('"colspan": 6','"colspan": 6').replace('"column": 0','"column": 18').replace('"row": 56','"row": 56');   
                                        SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');                                                                 
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 18','"column": #column#').replace('number_14','#charts#').replace('"row": 56','"row": #rows#');
                                        
                                      
                                        Sales.View_Results__c = Sales.View_Results__c.replace('#texts#','text_30');
                                        String Strtex30 = '"text_30": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.View_Results__c,Strtex30);                                                                   
                                        Sales.View_Results__c = Sales.View_Results__c.replace('text_30','#texts#');
                                        
                                        Sales.View_Results_Text__c = Sales.View_Results_Text__c.replace('#texts#','text_30').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 55');
                                        SuccessString =  SuccessString.replace(Sales.View_Results_Text__c,'');  
                                        Sales.View_Results_Text__c = Sales.View_Results_Text__c.replace('text_30','text_30').replace('"colspan": 6','"colspan": 2').replace('"column": 0','"column": 0').replace('"row": 55','"row": 1');
                                        SuccessString =  SuccessString.replace(Sales.View_Results_Text__c,'');                                                                  
                                        Sales.View_Results_Text__c = Sales.View_Results_Text__c.replace('text_30','#texts#').replace('"colspan": 2','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 1','"row": #rows#');
                                        
                                        Sales.Sales_KPI_Headers__c = Sales.Sales_KPI_Headers__c.replace('#text#','text_29').replace('#SaleskPIs#','Sales KPI 5');
                                        String Strtex = '"text_29": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.Sales_KPI_Headers__c,Strtex);                                                                  
                                        Sales.Sales_KPI_Headers__c = Sales.Sales_KPI_Headers__c.replace('text_29','#text#').replace('Sales KPI 5','#SaleskPIs#');    
                                        
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('#texts#','text_29').replace('"colspan": #Colspans#','"colspan": 8').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 0');
                                        SuccessString =  SuccessString.replace(Sales.Sales_Header_text__c,'');
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('text_24','text_29').replace('"colspan": 8','"colspan": 2').replace('"column": 0','"column": 0').replace('"row": 0','"row": 0');
                                        SuccessString =  SuccessString.replace(Sales.Sales_Header_text__c,'');  
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('text_29','text_29').replace('"colspan": 2','"colspan": 24').replace('"column": 0','"column": 0').replace('"row": 0','"row": 54');
                                        SuccessString =  SuccessString.replace(Sales.Sales_Header_text__c,'');                                                                  
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('text_29','#texts#').replace('"colspan": 24','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 54','"row": #rows#');
                                       
                                        Sales.Container_Delete__c = Sales.Container_Delete__c.replace('#texts#','container_21').replace('"colspan": #Colspans#','"colspan": 24').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 56').replace('"rowspan": #rowspan#','"rowspan": 2');
                                        SuccessString =  SuccessString.replace(Sales.Container_Delete__c,'');                                                               
                                        Sales.Container_Delete__c = Sales.Container_Delete__c.replace('container_21','#texts#').replace('"colspan": 24','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 56','"row": #rows#').replace('"rowspan": 2','"rowspan": #rowspan#');
                                        
                                        Sales.Container_Delete1__c = Sales.Container_Delete1__c.replace('#texts#','container_21').replace('"colspan": #Colspans#','"colspan": 2').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 5').replace('"rowspan": #rowspan#','"rowspan": 4');
                                        SuccessString =  SuccessString.replace(Sales.Container_Delete1__c,''); 
                                        Sales.Container_Delete1__c = Sales.Container_Delete1__c.replace('container_21','container_21').replace('"colspan": 2','"colspan": 8').replace('"column": 0','"column": 0').replace('"row": 5','"row": 2').replace('"rowspan": 4','"rowspan": 2');
                                        SuccessString =  SuccessString.replace(Sales.Container_Delete1__c,'');                                                              
                                        Sales.Container_Delete1__c = Sales.Container_Delete1__c.replace('container_21','#texts#').replace('"colspan": 8','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 2','"row": #rows#').replace('"rowspan": 2','"rowspan": #rowspan#');
                                        
                                         String Strtexs = '"container_21": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                       
                                        SuccessString =  SuccessString.replace(Sales.container3__c,Strtexs);                                                                  
                                         
                                        
                                    }
                                    
                                    if(Numbers == 4){
                                        String[] StNUmbers = new String[]{'number_22','number_21','number_20','number_10'};
                                        String[] Fields = new String[]{'#4AliasMeasureAPI4#','#4AliasMeasureAPI3#','#4AliasMeasureAPI2#','#4AliasMeasureAPI1#'};
                                        SuccessString =  SuccessString.replace(Sales.Sales_Chart_4__c,'').replace(Sales.ListSelector__c,'').replace(Sales.Sales_KPI_4__c,'');
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('#texts#','text_26').replace('#StaticSales#','Static_Sales_KPI_'+ Numbers).replace('#labels#','label_1');
                                        String Strtx26 = '"text_26": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.Delete_All_Texts__c,Strtx26);
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_26','text_46').replace('label_1','label_2');
                                         String Strtx46 = '"text_46": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.Delete_All_Texts__c,Strtx46);
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_46','text_47').replace('label_2','label_3');
                                        String Strtx47 = '"text_47": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.Delete_All_Texts__c,Strtx47);                                       
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_47','text_48').replace('label_3','label_4');                                        
                                         String Strtx48 = '"text_48": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.Delete_All_Texts__c,Strtx48);                                       
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_48','#texts#').replace('label_4','#labels#').replace('Static_Sales_KPI_'+ Numbers,'#StaticSales#');
                                        
                                        integer i= 0;
                                        for(String St : StNUmbers){                                     
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Numbers#',St);
                                        
                                            Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"exploreLink": #falses#','"exploreLink": true').replace('"compact": #trues#','"compact": true');
                                     
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Fields#',Fields[i]).replace('#SalesKPIs#','Sales_KPI_4');
                                        String StrNum48 = '"'+St+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.Sales_KPI_Delete__c,StrNum48);
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
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_19','listselector_19').replace('"colspan": 3','"colspan": 1').replace('"column": 18','"column": 6').replace('"row": 42','"row": 1');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_19','listselector_19').replace('"colspan": 1','"colspan": 1').replace('"column": 6','"column": 1').replace('"row": 1','"row": 2');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_19','#listselectors#').replace('"colspan": 1','"colspan": #Colspans#').replace('"column": 1','"column": #Cloumns#').replace('"row": 2','"row": #rows#');
                                        
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('#listselectors#','listselector_15').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #Cloumns#','"column": 0').replace('"row": #rows#','"row": 10');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 0','"column": 4').replace('"row": 10','"row": 4');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 4','"column": 16').replace('"row": 4','"row": 45');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 16','"column": 0').replace('listselector_15','listselector_40').replace('"row": 45','"row": 2');  
                                        
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 1').replace('"column": 0','"column": 2').replace('"row": 2','"row": 1');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 3').replace('"column": 2','"column": 6').replace('"row": 1','"row": 42');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 6','"column": 0').replace('listselector_40','listselector_34').replace('"row": 42','"row": 9');
                                        
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 0','"column": 0').replace('"row": 9','"row": 4');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 0','"column": 2').replace('"row": 4','"row": 45');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 2','"column": 1').replace('listselector_34','listselector_20').replace('"row": 45','"row": 9');
                                        
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 1','"column": 2').replace('"row": 9','"row": 4');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 2','"column": 9').replace('"row": 4','"row": 45');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 9','"column": 1').replace('listselector_20','listselector_21').replace('"row": 45','"row": 10');
                                        
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 1','"column": 6').replace('"row": 10','"row": 4');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 6','"column": 19').replace('"row": 4','"row": 45');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 19','"column": #Cloumns#').replace('listselector_21','#listselectors#').replace('"row": 45','"row": #rows#');
                                        
                                        
                                            Sales.Pillbox__c = Sales.Pillbox__c.replace('#pillboxs#','pillbox_5').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #Cloumns#','"column": 1').replace('"row": #rows#','"row": 4');
                                            SuccessString =  SuccessString.replace(Sales.Pillbox__c,'');
                                            Sales.Pillbox__c = Sales.Pillbox__c.replace('"colspan": 1','"colspan": 1').replace('"column": 1','"column": 7').replace('"row": 4','"row": 1');
                                            SuccessString =  SuccessString.replace(Sales.Pillbox__c,'');
                                            Sales.Pillbox__c = Sales.Pillbox__c.replace('"colspan": 1','"colspan": 3').replace('"column": 7','"column": 21').replace('"row": 1','"row": 42');
                                            SuccessString =  SuccessString.replace(Sales.Pillbox__c,'');                                                                            
                                            Sales.Pillbox__c = Sales.Pillbox__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 21','"column": #Cloumns#').replace('pillbox_5','#pillboxs#').replace('"row": 42','"row": #rows#');
                                            
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('#charts#','chart_11').replace('"colspan": #Colspans#','"colspan": 2').replace('"column": #Cloumns#','"column": 0').replace('"row": #rows#','"row": 5').replace('"rowspan": #rowspans#','"rowspan": 7');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');  
                                                                    
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"row": 5','"row": 11').replace('"rowspan": 7','"rowspan": 6');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');  
                                        
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 2','"colspan": 7').replace('"rowspan": 6','"rowspan": 7').replace('"row": 11','"row": 46');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');  
                                                                                                                                                    
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 7','"colspan": 2').replace('"column": 0','"column": 2').replace('chart_11','chart_12').replace('"row": 46','"row": 5').replace('""rowspan": 7','"rowspan": 7');
                                        
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');
                                        
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 2','"colspan": 7').replace('"column": 2','"column": 7').replace('"row": 5','"row": 46');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');  
                                         
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"rowspan": 7','"rowspan": 6').replace('"colspan": 7','"colspan": 2').replace('"column": 7','"column": 0').replace('"row": 46','"row": 17');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');  
                                                                                                        
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 2','"colspan": 4').replace('"column": 0','"column": 4').replace('chart_12','chart_10').replace('"row": 17','"row": 5').replace('"rowspan": 6','"rowspan": 7');
                                        
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');
                                        
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 4','"colspan": 10').replace('"column": 4','"column": 14').replace('"row": 5','"row": 46');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');  
                                         
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"rowspan": 7','"rowspan": 6').replace('"colspan": 10','"colspan": 2').replace('"column": 14','"column": 0').replace('"row": 46','"row": 27');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');  
                                                                                                            
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 2','"colspan": #Colspans#').replace('"column": 0','"column": #Cloumns#').replace('chart_10','#charts#').replace('"row": 27','"row": #rows#').replace('"rowspan": 6','"rowspan": #rowspans#');
                                        
                                        String[] St1 = new String[]{'6','2','1'};
                                        String[] St2 = new String[]{'0','0','0'};
                                        String[] St3 = new String[]{'44','3','6'};
                                        
                                        String[] St5 = new String[]{'6','2','1'};
                                        integer j=0;
                                        for(String St : St1){
                                        Sales.Test5__c = Sales.Test5__c.replace('"colspan": #Cols#','"colspan": '+St).replace('"column": #colm#','"column": '+st2[j]).replace('"row": #rows#','"row": '+st3[j]);
                                        SuccessString =  SuccessString.replace(Sales.Test5__c,'');                                                                  
                                        Sales.Test5__c = Sales.Test5__c.replace('"colspan": '+St,'"colspan": #Cols#').replace('"column": '+st2[j],'"column": #colm#').replace('"row": '+st3[j],'"row": #rows#');
                                            j++;
                                        }
                                        
                                        
                                        integer k=0;
                                        for(String St : St1){
                                        Sales.Test6__c = Sales.Test6__c.replace('"colspan": #Cols#','"colspan": '+St).replace('"column": #colm#','"column": '+st5[k]).replace('"row": #rows#','"row": '+st3[k]);
                                        SuccessString =  SuccessString.replace(Sales.Test6__c,'');                                                                  
                                        Sales.Test6__c = Sales.Test6__c.replace('"colspan": '+St,'"colspan": #Cols#').replace('"column": '+st5[k],'"column": #colm#').replace('"row": '+st3[k],'"row": #rows#');
                                            k++;
                                        }
                                        
                                        String[] St8 = new String[]{'18','6','1'};
                                        String[] St9 = new String[]{'44','3','8'};                                      
                                        String[] St11 = new String[]{'12','4','0'};
                                        integer l=0;
                                        for(String St : St1){
                                        Sales.Test8__c = Sales.Test8__c.replace('"colspan": #Cols#','"colspan": '+St).replace('"column": #colm#','"column": '+st8[l]).replace('"row": #rows#','"row": '+St9[l]);
                                        SuccessString =  SuccessString.replace(Sales.Test8__c,'');                                                                  
                                        Sales.Test8__c = Sales.Test8__c.replace('"colspan": '+St,'"colspan": #Cols#').replace('"column": '+st8[l],'"column": #colm#').replace('"row": '+St9[l],'"row": #rows#');
                                            l++;
                                        }
                                        
                                        integer m=0;
                                        for(String St : St1){
                                        Sales.Test7__c = Sales.Test7__c.replace('"colspan": #Cols#','"colspan": '+St).replace('"column": #colm#','"column": '+st11[m]).replace('"row": #rows#','"row": '+st9[m]);
                                        SuccessString =  SuccessString.replace(Sales.Test7__c,'');                                                                  
                                        Sales.Test7__c = Sales.Test7__c.replace('"colspan": '+St,'"colspan": #Cols#').replace('"column": '+st11[m],'"column": #colm#').replace('"row": '+st9[m],'"row": #rows#');
                                            m++;
                                        }
                                        
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('#dateselector#','dateselector_14').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #column#','"column": 1').replace('"row": #rows#','"row": 3');
                                        //Sales.Chart_Delete__c = Sales.Chart_Delete__c.replace('"rowspan": #rowspans#','"rowspan": 6');
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');         
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 1').replace('"column": 1','"column": 4').replace('"row": 3','"row": 1');  
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 4','"column": 12').replace('"row": 1','"row": 42');    
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');                                                                   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 12','"column": #column#').replace('dateselector_14','#dateselector#').replace('"row": 42','"row": #rows#'); 
                                        
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('#dateselector#','dateselector_6').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 3');
                                        //Sales.Chart_Delete__c = Sales.Chart_Delete__c.replace('"rowspan": #rowspans#','"rowspan": 6');
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');         
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 1').replace('"column": 0','"column": 3').replace('"row": 3','"row": 1');  
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 3','"column": 9').replace('"row": 1','"row": 42'); 
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');                                                                   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 9','"column": #column#').replace('dateselector_6','#dateselector#').replace('"row": 42','"row": #rows#');
                                        //Sales.Chart_Delete__c = Sales.Chart_Delete__c.replace('"rowspan": 6','"rowspan": #rowspans#');
                                        
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('#dateselector#','dateselector_15').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 4');
                                        //Sales.Chart_Delete__c = Sales.Chart_Delete__c.replace('"rowspan": #rowspans#','"rowspan": 6');
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');         
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 1').replace('"column": 0','"column": 5').replace('"row": 4','"row": 1');  
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 5','"column": 15').replace('"row": 1','"row": 42');    
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');                                                                   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 15','"column": #column#').replace('dateselector_15','#dateselector#').replace('"row": 42','"row": #rows#'); 
                                        
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_22').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 18').replace('"row": #rows#','"row": 43');
                                        SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');                           
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_22','number_21').replace('"column": 18','"column": 12');    
                                        SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');                                     
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_21','number_20').replace('"column": 12','"column": 6'); 
                                        SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');                                         
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_20','number_10').replace('"column": 6','"column": 0'); 
                                        SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');                                                                                                         
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('number_10','#charts#').replace('"row": 43','"row": #rows#'); 
                                        
                                        
                                        Sales.View_Results__c = Sales.View_Results__c.replace('#texts#','text_25');
                                        String Strtx25 = '"text_25": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.View_Results__c,Strtx25);                                                                   
                                        Sales.View_Results__c = Sales.View_Results__c.replace('text_25','#texts#'); 
                                        
                                        Sales.View_Results_Text__c = Sales.View_Results_Text__c.replace('#texts#','text_25').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 42');
                                        SuccessString =  SuccessString.replace(Sales.View_Results_Text__c,'');  
                                        Sales.View_Results_Text__c = Sales.View_Results_Text__c.replace('text_25','text_25').replace('"colspan": 6','"colspan": 2').replace('"column": 0','"column": 0').replace('"row": 42','"row": 1');
                                        SuccessString =  SuccessString.replace(Sales.View_Results_Text__c,'');                                                                  
                                        Sales.View_Results_Text__c = Sales.View_Results_Text__c.replace('text_25','#texts#').replace('"colspan": 2','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 1','"row": #rows#');
                                        
                                        Sales.Sales_KPI_Headers__c = Sales.Sales_KPI_Headers__c.replace('#text#','text_24').replace('#SaleskPIs#','Sales KPI 4');
                                        String Strtx24 = '"text_24": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.Sales_KPI_Headers__c,Strtx24);                                                                  
                                        Sales.Sales_KPI_Headers__c = Sales.Sales_KPI_Headers__c.replace('text_24','#text#').replace('Sales KPI 4','#SaleskPIs#');  
                                        
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('#texts#','text_24').replace('"colspan": #Colspans#','"colspan": 8').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 0');
                                        SuccessString =  SuccessString.replace(Sales.Sales_Header_text__c,'');
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('text_24','text_24').replace('"colspan": 8','"colspan": 2').replace('"column": 0','"column": 0').replace('"row": 0','"row": 0');
                                        SuccessString =  SuccessString.replace(Sales.Sales_Header_text__c,'');  
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('text_24','text_24').replace('"colspan": 2','"colspan": 24').replace('"column": 0','"column": 0').replace('"row": 0','"row": 41');
                                        SuccessString =  SuccessString.replace(Sales.Sales_Header_text__c,'');                                                                  
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('text_24','#texts#').replace('"colspan": 24','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 41','"row": #rows#');
                                        
                                        Sales.Container__c = Sales.Container__c.replace('#container#','container_17');
                                        String Strcon27 = '"container_17": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.Container__c,Strcon27);                                                                  
                                        Sales.Container__c = Sales.Container__c.replace('container_17','#container#');  
                                        
                                        
                                        Sales.Container_Delete__c = Sales.Container_Delete__c.replace('#texts#','container_17').replace('"colspan": #Colspans#','"colspan": 24').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 43').replace('"rowspan": #rowspan#','"rowspan": 2');
                                        SuccessString =  SuccessString.replace(Sales.Container_Delete__c,'');  
                                        Sales.Container_Delete__c = Sales.Container_Delete__c.replace('container_17','container_17').replace('"colspan": 24','"colspan": 8').replace('"column": 0','"column": 0').replace('"row": 43','"row": 5').replace('"rowspan": 2','"rowspan": 2');
                                        SuccessString =  SuccessString.replace(Sales.Container_Delete__c,'');                                                               
                                        Sales.Container_Delete__c = Sales.Container_Delete__c.replace('container_17','#texts#').replace('"colspan": 8','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 5','"row": #rows#').replace('"rowspan": 2','"rowspan": #rowspan#');
                                        
                                        Sales.Container_Delete1__c = Sales.Container_Delete1__c.replace('#texts#','container_17').replace('"colspan": #Colspans#','"colspan": 2').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 5').replace('"rowspan": #rowspan#','"rowspan": 4');
                                        SuccessString =  SuccessString.replace(Sales.Container_Delete1__c,''); 
                                        Sales.Container_Delete1__c = Sales.Container_Delete1__c.replace('container_17','container_17').replace('"colspan": 2','"colspan": 8').replace('"column": 0','"column": 0').replace('"row": 5','"row": 5').replace('"rowspan": 4','"rowspan": 2');
                                        SuccessString =  SuccessString.replace(Sales.Container_Delete1__c,'');                                                              
                                        Sales.Container_Delete1__c = Sales.Container_Delete1__c.replace('container_17','#texts#').replace('"colspan": 8','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 5','"row": #rows#').replace('"rowspan": 2','"rowspan": #rowspan#');
                                        SuccessString =  SuccessString.replace(Sales.Container_Delete2__c,'').replace(Sales.Container1__c,Strcon27);     
                                        
                                    }
                                    
                                    if(Numbers == 3){
                                        
                                        String[] StNUmbers = new String[]{'number_19','number_9','number_8','number_7'};
                                        String[] Fields = new String[]{'#3AliasMeasureAPI4#','#3AliasMeasureAPI3#','#3AliasMeasureAPI2#','#3AliasMeasureAPI1#'};
                                        SuccessString =  SuccessString.replace(Sales.Sales_Chart_3__c,'').replace(Sales.Sales_KPI_3__c,'');
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('#texts#','text_19').replace('#StaticSales#','Static_Sales_KPI_'+ Numbers).replace('#labels#','label_1');
                                        String Strtx19 = '"text_19": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.Delete_All_Texts__c,Strtx19);
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_19','text_20').replace('label_1','label_2');
                                        String Strtx20 = '"text_20": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.Delete_All_Texts__c,Strtx20);
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_20','text_21').replace('label_2','label_3');
                                        String Strtx21 = '"text_21": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.Delete_All_Texts__c,Strtx21);                                       
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_21','text_45').replace('label_3','label_4');                                        
                                         String Strtx45 = '"text_45": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.Delete_All_Texts__c,Strtx45); 
                                        
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_45','#texts#').replace('label_4','#labels#').replace('Static_Sales_KPI_'+ Numbers,'#StaticSales#');
                                        
                                        integer i= 0;
                                        for(String St : StNUmbers){                                     
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Numbers#',St);
                                            Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"exploreLink": #falses#','"exploreLink": true').replace('"compact": #trues#','"compact": true');
                                       
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('#Fields#',Fields[i]).replace('#SalesKPIs#','Sales_KPI_3');
                                        String StrNumst = '"'+St+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.Sales_KPI_Delete__c,StrNumst);
                                        Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace(St,'#Numbers#').replace(Fields[i],'#Fields#').replace('Sales_KPI_3','#SalesKPIs#');
                                      
                                            Sales.Sales_KPI_Delete__c = Sales.Sales_KPI_Delete__c.replace('"compact": true','"compact": #trues#').replace('"exploreLink": true','"exploreLink": #falses#');
                                       
                                        i++;
                                        }   
                                        
                                        
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('#listselectors#','listselector_51').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #Cloumns#','"column": 0').replace('"row": #rows#','"row": 10');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 0','"column": 4').replace('"row": 10','"row": 4').replace('listselector_51','listselector_47');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 4','"column": 16').replace('"row": 4','"row": 32').replace('listselector_47','listselector_37');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 16','"column": 0').replace('listselector_37','listselector_39').replace('"row": 32','"row": 2');   
                                        
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 1').replace('"column": 0','"column": 2').replace('"row": 2','"row": 1');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 3').replace('"column": 2','"column": 6').replace('"row": 1','"row": 29');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 6','"column": 0').replace('listselector_39','listselector_48').replace('"row": 29','"row": 9');   
                                        
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_48','listselector_44').replace('"colspan": 1','"colspan": 2').replace('"column": 0','"column": 0').replace('"row": 9','"row": 4');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_44','listselector_33').replace('"colspan": 2','"colspan": 3').replace('"column": 0','"column": 2').replace('"row": 4','"row": 32');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 2','"column": 1').replace('listselector_33','listselector_49').replace('"row": 32','"row": 9');
                                        
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_49','listselector_46').replace('"colspan": 1','"colspan": 2').replace('"column": 1','"column": 2').replace('"row": 9','"row": 4');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_46','listselector_18').replace('"colspan": 2','"colspan": 3').replace('"column": 2','"column": 9').replace('"row": 4','"row": 32');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 9','"column": 1').replace('listselector_18','listselector_50').replace('"row": 32','"row": 10');
                                        
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_50','listselector_45').replace('"colspan": 1','"colspan": 2').replace('"column": 1','"column": 6').replace('"row": 10','"row": 4');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_45','listselector_17').replace('"colspan": 2','"colspan": 3').replace('"column": 6','"column": 19').replace('"row": 4','"row": 32');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');                                                                              
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 19','"column": #Cloumns#').replace('listselector_17','#listselectors#').replace('"row": 32','"row": #rows#');  
                                        
                                    
                                            Sales.Pillbox__c = Sales.Pillbox__c.replace('#pillboxs#','pillbox_2').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #Cloumns#','"column": 1').replace('"row": #rows#','"row": 4');
                                            SuccessString =  SuccessString.replace(Sales.Pillbox__c,'');
                                            Sales.Pillbox__c = Sales.Pillbox__c.replace('pillbox_2','pillbox_6').replace('"colspan": 1','"colspan": 1').replace('"column": 1','"column": 7').replace('"row": 4','"row": 1');
                                            SuccessString =  SuccessString.replace(Sales.Pillbox__c,'');
                                            Sales.Pillbox__c = Sales.Pillbox__c.replace('pillbox_6','pillbox_4').replace('"colspan": 1','"colspan": 3').replace('"column": 7','"column": 21').replace('"row": 1','"row": 29');
                                            SuccessString =  SuccessString.replace(Sales.Pillbox__c,'');                                                                            
                                            Sales.Pillbox__c = Sales.Pillbox__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 21','"column": #Cloumns#').replace('pillbox_4','#pillboxs#').replace('"row": 29','"row": #rows#');  
                                            
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('#charts#','chart_7').replace('"colspan": #Colspans#','"colspan": 7').replace('"column": #Cloumns#','"column": 0').replace('"row": #rows#','"row": 33').replace('"rowspan": #rowspans#','"rowspan": 7');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');                                                                                                              
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 7','"colspan": #Colspans#').replace('"column": 0','"column": #Cloumns#').replace('chart_7','#charts#').replace('"row": 33','"row": #rows#').replace('""rowspan": 7','"rowspan": #rowspans#');
                                        
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('#charts#','chart_8').replace('"colspan": #Colspans#','"colspan": 7').replace('"column": #Cloumns#','"column": 7').replace('"row": #rows#','"row": 33').replace('"rowspan": #rowspans#','"rowspan": 7');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');  
                                                                        
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"row": 33','"row": 46').replace('"rowspan": 7','"rowspan": 6');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');  
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 7','"colspan": 2').replace('"column": 7','"column": 0').replace('"row": 46','"row": 17');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');                                                                                              
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 2','"colspan": #Colspans#').replace('"column": 0','"column": #Cloumns#').replace('chart_8','#charts#').replace('"row": 17','"row": #rows#').replace('"rowspan": 6','"rowspan": #rowspans#');
                                        
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('#charts#','chart_9').replace('"colspan": #Colspans#','"colspan": 4').replace('"column": #Cloumns#','"column": 4').replace('"row": #rows#','"row": 5').replace('"rowspan": #rowspans#','"rowspan": 7');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');
                                        
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 4','"colspan": 2').replace('"column": 4','"column": 0').replace('"row": 5','"row": 23').replace('"rowspan": 7','"rowspan": 6');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');  
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('chart_9','chart_18').replace('"rowspan": 6','"rowspan": 7').replace('"colspan": 2','"colspan": 10').replace('"column": 0','"column": 14').replace('"row": 23','"row": 33');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');                                                                      
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 10','"colspan": #Colspans#').replace('"column": 14','"column": #Cloumns#').replace('chart_18','#charts#').replace('"row": 33','"row": #rows#').replace('""rowspan": 7','"rowspan": #rowspans#'); 
                                        
                                        SuccessString =  SuccessString.replace(Sales.Test9__c,'').replace(Sales.Test10__c,'').replace(Sales.Test11__c,'').replace(Sales.Test12__c,'');
                                        
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('#dateselector#','dateselector_5').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #column#','"column": 3').replace('"row": #rows#','"row": 1');
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');         
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 1').replace('"column": 3','"column": 0').replace('"row": 1','"row": 3');   
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 0','"column": 9').replace('"row": 3','"row": 29');  
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');                                                                   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 9','"column": #column#').replace('dateselector_5','#dateselector#').replace('"row": 29','"row": #rows#');  
                                        
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('#dateselector#','dateselector_13').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #column#','"column": 4').replace('"row": #rows#','"row": 1');
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');         
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 1').replace('"column": 4','"column": 1').replace('"row": 1','"row": 3');   
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 1','"column": 12').replace('"row": 3','"row": 29'); 
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');                                                                   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 12','"column": #column#').replace('dateselector_13','#dateselector#').replace('"row": 29','"row": #rows#');
                          
                                        
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('#dateselector#','dateselector_12').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #column#','"column": 5').replace('"row": #rows#','"row": 1');
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');         
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 1').replace('"column": 5','"column": 0').replace('"row": 1','"row": 4');   
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 0','"column": 15').replace('"row": 4','"row": 29'); 
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');                                                                   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 15','"column": #column#').replace('dateselector_12','#dateselector#').replace('"row": 29','"row": #rows#');    
                                                  
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_19').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 18').replace('"row": #rows#','"row": 30');
                                        SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');       
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_19','number_9').replace('"colspan": 6','"colspan": 6').replace('"column": 18','"column": 12').replace('"row": 30','"row": 30');   
                                        SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');  
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_9','number_8').replace('"colspan": 6','"colspan": 6').replace('"column": 12','"column": 6').replace('"row": 30','"row": 30'); 
                                        SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,''); 
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_8','number_7').replace('"colspan": 6','"colspan": 6').replace('"column": 6','"column": 0').replace('"row": 30','"row": 30');  
                                        SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,''); 
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_7','number_3').replace('"colspan": 6','"colspan": 2').replace('"column": 0','"column": 4').replace('"row": 30','"row": 2');   
                                        SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');                                                                 
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 2','"colspan": #Colspans#').replace('"column": 4','"column": #column#').replace('number_3','#charts#').replace('"row": 2','"row": #rows#');
                                        
                
                                         Sales.View_Results__c = Sales.View_Results__c.replace('#texts#','text_18');
                                         String Strtx18 = '"text_18": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.View_Results__c,Strtx18);                                                                   
                                        Sales.View_Results__c = Sales.View_Results__c.replace('text_18','#texts#'); 
                                        
                                        Sales.View_Results_Text__c = Sales.View_Results_Text__c.replace('#texts#','text_18').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 29');
                                        SuccessString =  SuccessString.replace(Sales.View_Results_Text__c,'');                                                                                                      
                                        Sales.View_Results_Text__c = Sales.View_Results_Text__c.replace('text_18','#texts#').replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 29','"row": #rows#');
                                        
                                     //   System.debug('text_17*******************'+ Sales.Sales_KPI_Headers__c);
                                        Sales.Sales_KPI_Headers__c = Sales.Sales_KPI_Headers__c.replace('#text#','text_11').replace('#SaleskPIs#','Sales KPI 3');
                                        String Strtx11 = '"text_11": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        
                                        SuccessString =  SuccessString.replace(Sales.Sales_KPI_Headers__c,Strtx11);  
                                        Sales.Sales_KPI_Headers__c = Sales.Sales_KPI_Headers__c.replace('text_11','text_17').replace('Sales KPI 3','Sales KPI 3');
                                        String Strtx17 = '"text_17": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.Sales_KPI_Headers__c,Strtx17);                                                                  
                                        Sales.Sales_KPI_Headers__c = Sales.Sales_KPI_Headers__c.replace('text_17','#text#').replace('Sales KPI 3','#SaleskPIs#');  
                                     //   System.debug('text_1711*******************'+ Sales.Sales_KPI_Headers__c);
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('#texts#','text_11').replace('"colspan": #Colspans#','"colspan": 8').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 0');
                                        SuccessString =  SuccessString.replace(Sales.Sales_Header_text__c,'');
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('text_11','text_11').replace('"colspan": 8','"colspan": 2').replace('"column": 0','"column": 0').replace('"row": 0','"row": 0');
                                        SuccessString =  SuccessString.replace(Sales.Sales_Header_text__c,'');
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('text_11','text_17').replace('"colspan": 2','"colspan": 24').replace('"column": 0','"column": 0').replace('"row": 0','"row": 28');
                                        SuccessString =  SuccessString.replace(Sales.Sales_Header_text__c,'');                                                                  
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('text_17','#texts#').replace('"colspan": 24','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 28','"row": #rows#');
                                            
                                        Sales.Container__c = Sales.Container__c.replace('#container#','container_13');
                                        String Strcon13 = '"container_13": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.Container__c,Strcon13);                                                                  
                                        Sales.Container__c = Sales.Container__c.replace('container_13','#container#');  
                                        
                                        Sales.Container_Delete__c = Sales.Container_Delete__c.replace('#texts#','container_13').replace('"colspan": #Colspans#','"colspan": 24').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 30').replace('"rowspan": #rowspan#','"rowspan": 2');
                                        SuccessString =  SuccessString.replace(Sales.Container_Delete__c,'');                                                               
                                        Sales.Container_Delete__c = Sales.Container_Delete__c.replace('container_13','#texts#').replace('"colspan": 24','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 30','"row": #rows#').replace('"rowspan": 2','"rowspan": #rowspan#');
                                         SuccessString =  SuccessString.replace(Sales.container2__c,Strcon13);    
                                    }
                                    
                                    if(Numbers == 2 ){
                                        
                                         Sales.View_Results__c = Sales.View_Results__c.replace('#texts#','text_12');
                                         String Strtxt12 = '"text_12": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                        SuccessString =  SuccessString.replace(Sales.View_Results__c,Strtxt12);                                                                   
                                        Sales.View_Results__c = Sales.View_Results__c.replace('text_12','#texts#');  
                                        
                                        Sales.View_Results_Text__c = Sales.View_Results_Text__c.replace('#texts#','text_12').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 16');
                                        SuccessString =  SuccessString.replace(Sales.View_Results_Text__c,'');   
                                        Sales.View_Results_Text__c = Sales.View_Results_Text__c.replace('text_12','text_12').replace('"colspan": 6','"colspan": 2').replace('"column": 0','"column": 0').replace('"row": 16','"row": 1');
                                        SuccessString =  SuccessString.replace(Sales.View_Results_Text__c,'');                                                                  
                                        Sales.View_Results_Text__c = Sales.View_Results_Text__c.replace('text_12','#texts#').replace('"colspan": 2','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 1','"row": #rows#');
                                                
                                                
                                                
                                        String[] StNUmbers = new String[]{'number_5','number_4','number_6','number_18'};
                                        String[] Fields = new String[]{'#2AliasMeasureAPI2#','#2AliasMeasureAPI1#','#2AliasMeasureAPI3#','#2AliasMeasureAPI4#'};
                                        SuccessString =  SuccessString.replace(Sales.Sales_KPI_2__c,'').replace(Sales.Sales_Chart_2__c,'');
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('#texts#','text_13').replace('#StaticSales#','Static_Sales_KPI_'+ Numbers).replace('#labels#','label_1');
                                        String Strtxt13 = '"text_13": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.Delete_All_Texts__c,Strtxt13);
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_13','text_4').replace('label_1','label_2');
                                        String Strtxt4 = '"text_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.Delete_All_Texts__c,Strtxt4);
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_4','text_15').replace('label_2','label_3');
                                        String Strtxt15 = '"text_15": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.Delete_All_Texts__c,Strtxt15);                                   
                                        Sales.Delete_All_Texts__c = Sales.Delete_All_Texts__c.replace('text_15','text_44').replace('label_3','label_4');                                        
                                        String Strtxt44 = '"text_44": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.Delete_All_Texts__c,Strtxt44);                                   
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

                                        SuccessString =  SuccessString.replace(Sales.Sales_KPI_Delete__c,Strtnum44);
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
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_12','listselector_12').replace('"colspan": 3','"colspan": 1').replace('"column": 18','"column": 6').replace('"row": 16','"row": 1');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_12','listselector_12').replace('"colspan": 1','"colspan": 1').replace('"column": 6','"column": 1').replace('"row": 1','"row": 2');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('listselector_12','#listselectors#').replace('"colspan": 1','"colspan": #Colspans#').replace('"column": 1','"column": #Cloumns#').replace('"row": 2','"row": #rows#');
                                        
                                        
                                        
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('#listselectors#','listselector_22').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #Cloumns#','"column": 0').replace('"row": #rows#','"row": 10');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 0','"column": 4').replace('"row": 10','"row": 4');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 4','"column": 16').replace('"row": 4','"row": 19');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 16','"column": 0').replace('listselector_22','listselector_38').replace('"row": 19','"row": 2');
                                        
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 1').replace('"column": 0','"column": 2').replace('"row": 2','"row": 1');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 3').replace('"column": 2','"column": 6').replace('"row": 1','"row": 16');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 6','"column": 0').replace('listselector_38','listselector_28').replace('"row": 16','"row": 9');   
                                                                        
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"row": #rows#','"row": 9');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 0','"column": 0').replace('"row": 9','"row": 4');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 0','"column": 2').replace('"row": 4','"row": 19');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 2','"column": 1').replace('listselector_28','listselector_13').replace('"row": 19','"row": 9');
                                        
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 1','"column": 2').replace('"row": 9','"row": 4');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 2','"column": 9').replace('"row": 4','"row": 19');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": 1').replace('"column": 9','"column": 1').replace('listselector_13','listselector_14').replace('"row": 19','"row": 10');
                                        
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 1','"colspan": 2').replace('"column": 1','"column": 6').replace('"row": 10','"row": 4');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 2','"colspan": 3').replace('"column": 6','"column": 19').replace('"row": 4','"row": 19');
                                        SuccessString =  SuccessString.replace(Sales.List_Selector__c,'');                                                                          
                                        Sales.List_Selector__c = Sales.List_Selector__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 19','"column": #Cloumns#').replace('listselector_14','#listselectors#').replace('"row": 19','"row": #rows#');
                                    
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('#charts#','chart_4').replace('"colspan": #Colspans#','"colspan": 2').replace('"column": #Cloumns#','"column": 0').replace('"row": #rows#','"row": 5').replace('"rowspan": #rowspans#','"rowspan": 7');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');                              
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"row": 5','"row": 11').replace('"rowspan": 7','"rowspan": 6');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 2','"colspan": 7').replace('"row": 11','"row": 20').replace('"rowspan": 6','"rowspan": 7');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');                                                                                                          
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 7','"colspan": 2').replace('"column": 0','"column": 2').replace('chart_4','chart_5').replace('"row": 20','"row": 5').replace('""rowspan": 7','"rowspan": 7');
                                        
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 2','"colspan": 2').replace('"column": 2','"column": 0').replace('"row": 5','"row": 17').replace('"rowspan": 7','"rowspan": 6');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');  
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 2','"colspan": 7').replace('"column": 0','"column": 7').replace('"row": 17','"row": 20').replace('"rowspan": 6','"rowspan": 7');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');                                                                                          
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 7','"colspan": 4').replace('"column": 7','"column": 4').replace('chart_5','chart_22').replace('"row": 20','"row": 5').replace('"rowspan": 7','"rowspan": 7');
                                        
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 4','"colspan": 2').replace('"column": 4','"column": 0').replace('"row": 5','"row": 23').replace('"rowspan": 7','"rowspan": 6');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');  
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('chart_9','chart_18').replace('"rowspan": 6','"rowspan": 7').replace('"colspan": 2','"colspan": 10').replace('"column": 0','"column": 14').replace('"row": 23','"row": 20');
                                        SuccessString =  SuccessString.replace(Sales.Chart_Delete1__c,'');                                                                      
                                        Sales.Chart_Delete1__c = Sales.Chart_Delete1__c.replace('"colspan": 10','"colspan": #Colspans#').replace('"column": 14','"column": #Cloumns#').replace('chart_22','#charts#').replace('"row": 20','"row": #rows#').replace('""rowspan": 7','"rowspan": #rowspans#'); 
                                        
                                         String[] St1 = new String[]{'6','2','1'};
                                        String[] St2 = new String[]{'0','0','0'};
                                        String[] St3 = new String[]{'18','3','6'};
                                        
                                        String[] St5 = new String[]{'6','2','1'};
                                        integer j=0;
                                        for(String St : St1){
                                        Sales.Test13__c = Sales.Test13__c.replace('"colspan": #Cols#','"colspan": '+St).replace('"column": #colm#','"column": '+st2[j]).replace('"row": #rows#','"row": '+st3[j]);
                                        SuccessString =  SuccessString.replace(Sales.Test13__c,'');                                                                 
                                        Sales.Test13__c = Sales.Test13__c.replace('"colspan": '+St,'"colspan": #Cols#').replace('"column": '+st2[j],'"column": #colm#').replace('"row": '+st3[j],'"row": #rows#');
                                            j++;
                                        }
                                        
                                        
                                        integer k=0;
                                        for(String St : St1){
                                        Sales.Test14__c = Sales.Test14__c.replace('"colspan": #Cols#','"colspan": '+St).replace('"column": #colm#','"column": '+st5[k]).replace('"row": #rows#','"row": '+st3[k]);
                                        SuccessString =  SuccessString.replace(Sales.Test14__c,'');                                                                 
                                        Sales.Test14__c = Sales.Test14__c.replace('"colspan": '+St,'"colspan": #Cols#').replace('"column": '+st5[k],'"column": #colm#').replace('"row": '+st3[k],'"row": #rows#');
                                            k++;
                                        }
                                        
                                        String[] St8 = new String[]{'18','6','1'};
                                        String[] St9 = new String[]{'18','3','8'};                                      
                                        String[] St11 = new String[]{'12','4','0'};
                                        integer l=0;
                                        for(String St : St1){
                                        Sales.Test16__c = Sales.Test16__c.replace('"colspan": #Cols#','"colspan": '+St).replace('"column": #colm#','"column": '+st8[l]).replace('"row": #rows#','"row": '+St9[l]);
                                        SuccessString =  SuccessString.replace(Sales.Test16__c,'');                                                             
                                        Sales.Test16__c = Sales.Test16__c.replace('"colspan": '+St,'"colspan": #Cols#').replace('"column": '+st8[l],'"column": #colm#').replace('"row": '+St9[l],'"row": #rows#');
                                            l++;
                                        }
                                        
                                        integer m=0;
                                        for(String St : St1){
                                        Sales.Test15__c = Sales.Test15__c.replace('"colspan": #Cols#','"colspan": '+St).replace('"column": #colm#','"column": '+st11[m]).replace('"row": #rows#','"row": '+st9[m]);
                                        SuccessString =  SuccessString.replace(Sales.Test15__c,'');                                                             
                                        Sales.Test15__c = Sales.Test15__c.replace('"colspan": '+St,'"colspan": #Cols#').replace('"column": '+st11[m],'"column": #colm#').replace('"row": '+st9[m],'"row": #rows#');
                                            m++;
                                        }
                                          
                                        Sales.Pillbox__c = Sales.Pillbox__c.replace('#pillboxs#','pillbox_3').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #Cloumns#','"column": 1').replace('"row": #rows#','"row": 4');
                                        SuccessString =  SuccessString.replace(Sales.Pillbox__c,'');
                                        Sales.Pillbox__c = Sales.Pillbox__c.replace('"colspan": 1','"colspan": 1').replace('"column": 1','"column": 7').replace('"row": 4','"row": 1');
                                        SuccessString =  SuccessString.replace(Sales.Pillbox__c,'');
                                        Sales.Pillbox__c = Sales.Pillbox__c.replace('"colspan": 1','"colspan": 3').replace('"column": 7','"column": 21').replace('"row": 1','"row": 16');
                                        SuccessString =  SuccessString.replace(Sales.Pillbox__c,'');                                                                            
                                        Sales.Pillbox__c = Sales.Pillbox__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 21','"column": #Cloumns#').replace('pillbox_3','#pillboxs#').replace('"row": 16','"row": #rows#');   
                                        
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('#dateselector#','dateselector_4').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 3');
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');         
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 0','"column": 9').replace('"row": 3','"row": 16');  
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 3','"colspan": 1').replace('"column": 9','"column": 3').replace('"row": 16','"row": 1');  
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');                                                                   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": #Colspans#').replace('"column": 3','"column": #column#').replace('dateselector_4','#dateselector#').replace('"row": 1','"row": #rows#');   
                                        
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('#dateselector#','dateselector_11').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #column#','"column": 1').replace('"row": #rows#','"row": 3');
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');         
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 1').replace('"column": 1','"column": 4').replace('"row": 3','"row": 1');   
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 4','"column": 12').replace('"row": 1','"row": 16');   
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');                                                                 
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 12','"column": #column#').replace('dateselector_11','#dateselector#').replace('"row": 16','"row": #rows#');
                                        
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('#dateselector#','dateselector_10').replace('"colspan": #Colspans#','"colspan": 1').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 4');                          
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');         
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 1').replace('"column": 0','"column": 5').replace('"row": 4','"row": 1');   
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,''); 
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 1','"colspan": 3').replace('"column": 5','"column": 15').replace('"row": 1','"row": 16');   
                                        SuccessString =  SuccessString.replace(Sales.Date_Selector_Delete__c,'');                                                                   
                                        Sales.Date_Selector_Delete__c = Sales.Date_Selector_Delete__c.replace('"colspan": 3','"colspan": #Colspans#').replace('"column": 15','"column": #column#').replace('dateselector_10','#dateselector#').replace('"row": 16','"row": #rows#');  
                                        
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('#charts#','number_4').replace('"colspan": #Colspans#','"colspan": 6').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 17');
                                        SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');       
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_4','number_5').replace('"colspan": 6','"colspan": 6').replace('"column": 0','"column": 6').replace('"row": 17','"row": 17');  
                                        SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');  
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_5','number_6').replace('"colspan": 6','"colspan": 6').replace('"column": 6','"column": 12').replace('"row": 17','"row": 17'); 
                                        SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,''); 
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('number_6','number_18').replace('"colspan": 6','"colspan": 6').replace('"column": 12','"column": 18').replace('"row": 17','"row": 17');   
                                        SuccessString =  SuccessString.replace(Sales.Number_Delete1__c,'');                                                                 
                                        Sales.Number_Delete1__c = Sales.Number_Delete1__c.replace('"colspan": 6','"colspan": #Colspans#').replace('"column": 12','"column": #column#').replace('number_18','#charts#').replace('"row": 17','"row": #rows#');
                                        
                                         //Sales_KPI_Headers__c,Sales_Header_text__c 
                                        // System.debug('text_17*******************'+ Sales.Sales_KPI_Headers__c);
                                        Sales.Sales_KPI_Headers__c = Sales.Sales_KPI_Headers__c.replace('#text#','text_10').replace('#SaleskPIs#','Sales KPI 2');
                                        String Strtxt10 = '"text_10": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.Sales_KPI_Headers__c,Strtxt10);                                                                  
                                        Sales.Sales_KPI_Headers__c = Sales.Sales_KPI_Headers__c.replace('text_10','#text#').replace('Sales KPI 2','#SaleskPIs#');  
                                        
                                      //  System.debug('text_17111*******************'+ Sales.Sales_KPI_Headers__c);
                                        
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('#texts#','text_10').replace('"colspan": #Colspans#','"colspan": 24').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 15');
                                        SuccessString =  SuccessString.replace(Sales.Sales_Header_text__c,'');                                                              
                                        Sales.Sales_Header_text__c = Sales.Sales_Header_text__c.replace('text_10','#texts#').replace('"colspan": 24','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 15','"row": #rows#');
                                        
                                        //Container__c,Container_Delete__c,Container_Delete1__c,
                                        Sales.Container__c = Sales.Container__c.replace('#container#','container_9');
                                        String Strcon9 = '"container_9": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';

                                        SuccessString =  SuccessString.replace(Sales.Container__c,Strcon9);                                                                  
                                        Sales.Container__c = Sales.Container__c.replace('container_9','#container#');  
                                        
                                        Sales.Container_Delete__c = Sales.Container_Delete__c.replace('#texts#','container_9').replace('"colspan": #Colspans#','"colspan": 24').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 17').replace('"rowspan": #rowspan#','"rowspan": 2');
                                        SuccessString =  SuccessString.replace(Sales.Container_Delete__c,'');                                                                  
                                        Sales.Container_Delete__c = Sales.Container_Delete__c.replace('container_9','#texts#').replace('"colspan": 24','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 17','"row": #rows#').replace('"rowspan": 2','"rowspan": #rowspan#');
                                        
                                        Sales.Container_Delete1__c = Sales.Container_Delete1__c.replace('#texts#','container_9').replace('"colspan": #Colspans#','"colspan": 2').replace('"column": #column#','"column": 0').replace('"row": #rows#','"row": 5').replace('"rowspan": #rowspan#','"rowspan": 4');
                                        SuccessString =  SuccessString.replace(Sales.Container_Delete1__c,'');                                                               
                                        Sales.Container_Delete1__c = Sales.Container_Delete1__c.replace('container_9','#texts#').replace('"colspan": 2','"colspan": #Colspans#').replace('"column": 0','"column": #column#').replace('"row": 5','"row": #rows#').replace('"rowspan": 4','"rowspan": #rowspan#');
                                               
                                    }
                                                                                                                                            
                }                   
            }
            
          SuccessString = SuccessString.replaceAll('\\s+\\s+','#testcode#'); 
            SuccessString = SuccessString.replaceAll('#testcode#',' ');         
          SuccessString = SuccessString.replace('}, ]','}]').replace('}, ,','},').replace('}, , ,','},').replace('}, , , ,','},');     
            SuccessString = SuccessString.replace('}", ]','}"]');
            SuccessString = SuccessString.replace('}, }','}}');
            SuccessString = SuccessString.replace('}, , ]','}]').replace('}, ]','} ]').replace('}, , , ]','} ]');
            SuccessString = SuccessString.replace('[ , ,','[');
            SuccessString = SuccessString.replace('[ ,','[').replace(', },','},');
              SuccessString = SuccessString.replace('"type": "container"},  "type": "container"},','"type": "container"},');
         SuccessString = SuccessString.replace('"type": "container" },"type": "container"},','"type": "container"},');
         SuccessString = SuccessString.replace('"type": "container" }, "type": "container" },','"type": "container"},');         
            SuccessString = SuccessString.replace(', #TestCodes#','');   
            System.debug('^^^^^^^' + SuccessString);
            return null;
        }
        /****************** Marketing String **********************************/     
}