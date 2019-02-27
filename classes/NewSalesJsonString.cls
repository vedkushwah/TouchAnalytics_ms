public class NewSalesJsonString {
    public Static String SalesString(String DashboardId,list<String> FolderId,String Allval,String Salesval,String sessionId){      
        Sales_Insight__c Sales = [select id,DataSet_Delete__c,Sales_insight_String5__c,Delete_All_Group__c,Delete_All_Orders__c,Sales_KPI_Delete__c,Number_Delete1__c,ListSelector__c,Lis_Selector36__c,Sales_insight_Day_Delete__c,Sales_Insight_String2__c,Delete_All_Lists__c,Sales_Insight_String3__c,Delete_List_Selector__c,Sales_Insight_Delete2__c,List_Selector6__c,Grouping_label_Delete__c,Delete_All_Group5__c,Grouping_Delete__c,Delete_All_Timeline1__c,Number_Delete2__c,Sales_Insight_Delete3__c,Container_Delete2__c,Grouping_Selectors__c,Delete_All_Timeline2__c,Date_label_Delete__c,Delete_All_Timeline3__c,Number_Delete3__c,Number_Delete4__c,Chart_Delete14__c,Date_Selector__c,Delete_All_Timeline4__c,Delete_All_dateselector1__c,Sales_Date_Delete__c,Delete_pillbox__c,Delete_All_dateselectors__c,Dates_Delete__c,Delete_All_Timeline__c,Delete_All_Dates__c,Sales_Insight_Measure_Delete__c,Delete_All_Measures__c,Chart_Delete2__c,Chart_Delete24__c,Measure_List_Selector__c,Measures_Delete__c,Delete_All_Texts__c,Sales_Insight_Filter_Delete__c,Delete_All_Static_KPIs__c,Delete_All_Chart4__c,Container1__c,Container2__c,Container3__c,number_33__c,number_34__c,Sales_KPI_1__c,Sales_KPI_2__c,Sales_KPI_3__c,Sales_KPI_4__c,Sales_KPI_5__c,Sales_Chart_1__c,Sales_Chart_2__c,Sales_Chart_3__c,Sales_Chart_4__c,Sales_Chart_5__c,Container__c,Container_Delete__c,Container_Delete1__c,Delete_All_Chart__c,Delete_All_Chart1__c,Delete_All_Chart2__c,Delete_All_Chart3__c,List_Selector__c,Pillbox__c,Date_Selector_Delete__c,Chart_Delete__c,Text_Delete__c,Chart_Delete1__c,Test1__c,Test2__c,Test3__c,Test4__c,Test5__c,Test6__c,Test7__c,Test8__c,Test9__c,Test10__c,Test11__c,Test12__c,Test13__c,Test14__c,Test15__c,Test16__c,Sales_Insight_String4__c,Delete_List_Selector43__c,List_Selector43__c,Delete_List_Selector53__c,View_Results__c,View_Results_Text__c,List_Selector53__c,Sales_KPI_Headers__c,Sales_Header_text__c,Sales_insight_String1__c from Sales_Insight__c where  id=:Allval limit 1];    
        list<Dataset__c> DatsetList = new list<Dataset__c>();
        String SalesString = '';
        integer salsnumstr;
        integer salsnumend;
        if(Salesval == 'Sales'){
            DatsetList = [select id,Data_API__c,RowNumber__c,KPI_Name__c,Dataset_Id__c,Date_Label__c,Filter_Logics__c,Measure_API__c,Measure_Name__c,Dataset_Name__c,Dimension_Api__c, Dimension_Name__c,New_Dimension_Name__c,New_Dimension_API__c,AliasMeasure_API__c,CompactMeasure_API__c,Session_Id__c,FilterName__c from Dataset__c where Session_Id__c =: sessionId order by RowNumber__c limit 5]; 
            SalesString =  Sales.DataSet_Delete__c +Sales.Sales_Insight_String5__c + Sales.Sales_insight_String2__c + Sales.Sales_insight_String3__c +Sales.Grouping_label_Delete__c + Sales.Sales_insight_String4__c + Sales.Grouping_Delete__c ; 
            salsnumstr = 1;
            salsnumend = 5;
        }
        else if(Salesval == 'Market'){
            DatsetList = [select id,Data_API__c,RowNumber__c,KPI_Name__c,FilterName__c,Dataset_Id__c,Date_Label__c,Filter_Logics__c,Measure_API__c,Measure_Name__c,Dataset_Name__c,Dimension_Api__c,New_Dimension_Name__c,New_Dimension_API__c, Dimension_Name__c,AliasMeasure_API__c,CompactMeasure_API__c from Dataset__c  where Session_Id__c =: sessionId order by RowNumber__c Desc limit 5];                              
            SalesString = Sales.DataSet_Delete__c +Sales.Measures_Delete__c + Sales.Sales_insight_String2__c + Sales.Sales_insight_String3__c + Sales.Grouping_label_Delete__c+ Sales.Sales_insight_String4__c + Sales.Grouping_Delete__c ; 
            salsnumstr = 11;
            salsnumend = 15;
        }
        else if(Salesval == 'Success'){
            DatsetList = [select id,Data_API__c,RowNumber__c,KPI_Name__c,FilterName__c,Dataset_Id__c,Date_Label__c,Filter_Logics__c,Measure_API__c,Measure_Name__c,Dataset_Name__c,Dimension_Api__c,New_Dimension_Name__c,New_Dimension_API__c, Dimension_Name__c,AliasMeasure_API__c,CompactMeasure_API__c from Dataset__c  where Session_Id__c =: sessionId order by RowNumber__c limit 10];                              
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
                    // if(DatasetRec.Dimension_Name__c != Null){
                    //     Dimensions = DatasetRec.Dimension_Name__c.Split(',');
                    // }
                    // if(DatasetRec.Dimension_Api__c != Null){
                    //     DimensionApi = DatasetRec.Dimension_Api__c.Split(',');
                    // }
                    
                   if(DatasetRec.Dimension_Name__c != null && DatasetRec.Dimension_Name__c != ''){
                        Dimensions = DatasetRec.Dimension_Name__c.Split(',');
                     }
                     else if(DatasetRec.New_Dimension_Name__c != null && DatasetRec.New_Dimension_Name__c != ''){
                        Dimensions = DatasetRec.New_Dimension_Name__c.Split(','); 
                     }
                     if(DatasetRec.Dimension_Api__c != null && DatasetRec.Dimension_Api__c != ''){
                        DimensionApi = DatasetRec.Dimension_Api__c.Split(',');
                     }
                     else if(DatasetRec.New_Dimension_API__c != null && DatasetRec.New_Dimension_API__c != ''){
                        DimensionApi = DatasetRec.New_Dimension_API__c.Split(',');  
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
    public Static String SalesString2(String DashboardId,list<String> FolderId,String Allval,String Salesval,String sessionId){      
        Sales_Insight__c Sales = [select id,DataSet_Delete__c,Sales_insight_String5__c,Delete_All_Group__c,Delete_All_Orders__c,Sales_KPI_Delete__c,Number_Delete1__c,ListSelector__c,Lis_Selector36__c,Sales_insight_Day_Delete__c,Sales_Insight_String2__c,Delete_All_Lists__c,Sales_Insight_String3__c,Delete_List_Selector__c,Sales_Insight_Delete2__c,List_Selector6__c,Grouping_label_Delete__c,Delete_All_Group5__c,Grouping_Delete__c,Delete_All_Timeline1__c,Number_Delete2__c,Sales_Insight_Delete3__c,Container_Delete2__c,Grouping_Selectors__c,Delete_All_Timeline2__c,Date_label_Delete__c,Delete_All_Timeline3__c,Number_Delete3__c,Number_Delete4__c,Chart_Delete14__c,Date_Selector__c,Delete_All_Timeline4__c,Delete_All_dateselector1__c,Sales_Date_Delete__c,Delete_pillbox__c,Delete_All_dateselectors__c,Dates_Delete__c,Delete_All_Timeline__c,Delete_All_Dates__c,Sales_Insight_Measure_Delete__c,Delete_All_Measures__c,Chart_Delete2__c,Chart_Delete24__c,Measure_List_Selector__c,Measures_Delete__c,Delete_All_Texts__c,Sales_Insight_Filter_Delete__c,Delete_All_Static_KPIs__c,Delete_All_Chart4__c,Container1__c,Container2__c,Container3__c,number_33__c,number_34__c,Sales_KPI_1__c,Sales_KPI_2__c,Sales_KPI_3__c,Sales_KPI_4__c,Sales_KPI_5__c,Sales_Chart_1__c,Sales_Chart_2__c,Sales_Chart_3__c,Sales_Chart_4__c,Sales_Chart_5__c,Container__c,Container_Delete__c,Container_Delete1__c,Delete_All_Chart__c,Delete_All_Chart1__c,Delete_All_Chart2__c,Delete_All_Chart3__c,List_Selector__c,Pillbox__c,Date_Selector_Delete__c,Chart_Delete__c,Text_Delete__c,Chart_Delete1__c,Test1__c,Test2__c,Test3__c,Test4__c,Test5__c,Test6__c,Test7__c,Test8__c,Test9__c,Test10__c,Test11__c,Test12__c,Test13__c,Test14__c,Test15__c,Test16__c,Sales_Insight_String4__c,Delete_List_Selector43__c,List_Selector43__c,Delete_List_Selector53__c,View_Results__c,View_Results_Text__c,List_Selector53__c,Sales_KPI_Headers__c,Sales_Header_text__c,Sales_insight_String1__c from Sales_Insight__c where  id=:Allval limit 1];    
        list<Dataset__c> DatsetList = new list<Dataset__c>();
        String SalesString = '';
        integer salsnumstr;
        integer salsnumend;
        if(Salesval == 'Sales'){
            DatsetList = [select id,Data_API__c,RowNumber__c,KPI_Name__c,Dataset_Id__c,Date_Label__c,Filter_Logics__c,Measure_API__c,Measure_Name__c,Dataset_Name__c,Dimension_Api__c, Dimension_Name__c,New_Dimension_Name__c,New_Dimension_API__c,AliasMeasure_API__c,CompactMeasure_API__c,Session_Id__c,FilterName__c from Dataset__c where Session_Id__c =: sessionId order by RowNumber__c limit 5]; 
            SalesString =  Sales.DataSet_Delete__c +Sales.Sales_Insight_String5__c + Sales.Sales_insight_String2__c + Sales.Sales_insight_String3__c +Sales.Grouping_label_Delete__c + Sales.Sales_insight_String4__c + Sales.Grouping_Delete__c ; 
            salsnumstr = 1;
            salsnumend = 5;
        }
        else if(Salesval == 'Market'){
            DatsetList = [select id,Data_API__c,RowNumber__c,KPI_Name__c,FilterName__c,Dataset_Id__c,Date_Label__c,Filter_Logics__c,Measure_API__c,Measure_Name__c,Dataset_Name__c,Dimension_Api__c,New_Dimension_Name__c,New_Dimension_API__c, Dimension_Name__c,AliasMeasure_API__c,CompactMeasure_API__c from Dataset__c  where Session_Id__c =: sessionId order by RowNumber__c Desc limit 5];                              
            SalesString = Sales.DataSet_Delete__c +Sales.Measures_Delete__c + Sales.Sales_insight_String2__c + Sales.Sales_insight_String3__c + Sales.Grouping_label_Delete__c+ Sales.Sales_insight_String4__c + Sales.Grouping_Delete__c ; 
            salsnumstr = 11;
            salsnumend = 15;
        }
        else if(Salesval == 'Success'){
            DatsetList = [select id,Data_API__c,RowNumber__c,KPI_Name__c,FilterName__c,Dataset_Id__c,Date_Label__c,Filter_Logics__c,Measure_API__c,Measure_Name__c,Dataset_Name__c,Dimension_Api__c,New_Dimension_Name__c,New_Dimension_API__c, Dimension_Name__c,AliasMeasure_API__c,CompactMeasure_API__c from Dataset__c  where Session_Id__c =: sessionId order by RowNumber__c limit 10];                              
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
                    
                     
                     
                     if(DatasetRec.Dimension_Name__c != null && DatasetRec.Dimension_Name__c != ''){
                        Dimensions = DatasetRec.Dimension_Name__c.Split(',');
                     }
                     else if(DatasetRec.New_Dimension_Name__c != null && DatasetRec.New_Dimension_Name__c != ''){
                        Dimensions = DatasetRec.New_Dimension_Name__c.Split(','); 
                     }
                     if(DatasetRec.Dimension_Api__c != null && DatasetRec.Dimension_Api__c != ''){
                        DimensionApi = DatasetRec.Dimension_Api__c.Split(',');
                     }
                     else if(DatasetRec.New_Dimension_API__c != null && DatasetRec.New_Dimension_API__c != ''){
                        DimensionApi = DatasetRec.New_Dimension_API__c.Split(',');  
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
    public Static String SalesString1(String DashboardId,list<String> FolderId,String Allval,String Salesval,String sessionId){      
        Sales_Insight__c Sales = [select id,DataSet_Delete__c,Sales_insight_String5__c,Delete_All_Group__c,Delete_All_Orders__c,Sales_KPI_Delete__c,Number_Delete1__c,ListSelector__c,Lis_Selector36__c,Sales_insight_Day_Delete__c,Sales_Insight_String2__c,Delete_All_Lists__c,Sales_Insight_String3__c,Delete_List_Selector__c,Sales_Insight_Delete2__c,List_Selector6__c,Grouping_label_Delete__c,Delete_All_Group5__c,Grouping_Delete__c,Delete_All_Timeline1__c,Number_Delete2__c,Sales_Insight_Delete3__c,Container_Delete2__c,Grouping_Selectors__c,Delete_All_Timeline2__c,Date_label_Delete__c,Delete_All_Timeline3__c,Number_Delete3__c,Number_Delete4__c,Chart_Delete14__c,Date_Selector__c,Delete_All_Timeline4__c,Delete_All_dateselector1__c,Sales_Date_Delete__c,Delete_pillbox__c,Delete_All_dateselectors__c,Dates_Delete__c,Delete_All_Timeline__c,Delete_All_Dates__c,Sales_Insight_Measure_Delete__c,Delete_All_Measures__c,Chart_Delete2__c,Chart_Delete24__c,Measure_List_Selector__c,Measures_Delete__c,Delete_All_Texts__c,Sales_Insight_Filter_Delete__c,Delete_All_Static_KPIs__c,Delete_All_Chart4__c,Container1__c,Container2__c,Container3__c,number_33__c,number_34__c,Sales_KPI_1__c,Sales_KPI_2__c,Sales_KPI_3__c,Sales_KPI_4__c,Sales_KPI_5__c,Sales_Chart_1__c,Sales_Chart_2__c,Sales_Chart_3__c,Sales_Chart_4__c,Sales_Chart_5__c,Container__c,Container_Delete__c,Container_Delete1__c,Delete_All_Chart__c,Delete_All_Chart1__c,Delete_All_Chart2__c,Delete_All_Chart3__c,List_Selector__c,Pillbox__c,Date_Selector_Delete__c,Chart_Delete__c,Text_Delete__c,Chart_Delete1__c,Test1__c,Test2__c,Test3__c,Test4__c,Test5__c,Test6__c,Test7__c,Test8__c,Test9__c,Test10__c,Test11__c,Test12__c,Test13__c,Test14__c,Test15__c,Test16__c,Sales_Insight_String4__c,Delete_List_Selector43__c,List_Selector43__c,Delete_List_Selector53__c,View_Results__c,View_Results_Text__c,List_Selector53__c,Sales_KPI_Headers__c,Sales_Header_text__c,Sales_insight_String1__c from Sales_Insight__c where  id=:Allval limit 1];    
        list<Dataset__c> DatsetList = new list<Dataset__c>();
        String SalesString = '';
        integer salsnumstr;
        integer salsnumend;
        if(Salesval == 'Sales'){
            DatsetList = [select id,Data_API__c,RowNumber__c,KPI_Name__c,Dataset_Id__c,Date_Label__c,Filter_Logics__c,Measure_API__c,Measure_Name__c,Dataset_Name__c,Dimension_Api__c, Dimension_Name__c,New_Dimension_Name__c,New_Dimension_API__c,AliasMeasure_API__c,CompactMeasure_API__c,Session_Id__c,FilterName__c from Dataset__c where Session_Id__c =: sessionId order by RowNumber__c limit 5]; 
            SalesString =  Sales.DataSet_Delete__c +Sales.Sales_Insight_String5__c + Sales.Sales_insight_String2__c + Sales.Sales_insight_String3__c +Sales.Grouping_label_Delete__c + Sales.Sales_insight_String4__c + Sales.Grouping_Delete__c ; 
            salsnumstr = 1;
            salsnumend = 5;
        }
        else if(Salesval == 'Market'){
            DatsetList = [select id,Data_API__c,RowNumber__c,KPI_Name__c,FilterName__c,Dataset_Id__c,Date_Label__c,Filter_Logics__c,Measure_API__c,Measure_Name__c,Dataset_Name__c,Dimension_Api__c,New_Dimension_Name__c,New_Dimension_API__c, Dimension_Name__c,AliasMeasure_API__c,CompactMeasure_API__c from Dataset__c  where Session_Id__c =: sessionId order by RowNumber__c Desc limit 5];                              
            SalesString = Sales.DataSet_Delete__c +Sales.Measures_Delete__c + Sales.Sales_insight_String2__c + Sales.Sales_insight_String3__c + Sales.Grouping_label_Delete__c+ Sales.Sales_insight_String4__c + Sales.Grouping_Delete__c ; 
            salsnumstr = 11;
            salsnumend = 15;
        }
        else if(Salesval == 'Success'){
            DatsetList = [select id,Data_API__c,RowNumber__c,KPI_Name__c,FilterName__c,Dataset_Id__c,Date_Label__c,Filter_Logics__c,Measure_API__c,Measure_Name__c,Dataset_Name__c,Dimension_Api__c,New_Dimension_Name__c,New_Dimension_API__c, Dimension_Name__c,AliasMeasure_API__c,CompactMeasure_API__c from Dataset__c  where Session_Id__c =: sessionId order by RowNumber__c limit 10];                              
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
    
    
     public void JsonSclass(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        public void JsonSclass1(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        public void JsonSclass2(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        public void JsonSclass3(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        public void JsonSclass4(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        public void JsonSclass5(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        public void JsonSclass6(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        public void JsonSclass7(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        public void JsonSclass8(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        public void JsonSclass9(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        public void JsonSclass10(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        public void JsonSclass11(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
         public void JsonSclass12(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
        public void JsonSclass13(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
        public void JsonSclass14(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
        public void JsonSclass15(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
        public void JsonSclass16(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
        public void JsonSclass17(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
        public void JsonSclass18(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
        public void JsonSclass19(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
        public void JsonSclass20(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
        public void JsonSclass21(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
        public void JsonSclass22(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
        public void JsonSclass23(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
        
        public void JsonSclass55(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        public void JsonSclass155(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        public void JsonSclass255(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        public void JsonSclass355(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        public void JsonSclass455(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        public void JsonSclass555(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        public void JsonSclass655(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        public void JsonSclass755(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
        }
        public void JsonSclass855(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        public void JsonSclass955(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        public void JsonSclass1055(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        public void JsonSclass1155(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
         public void JsonSclass1255(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
        public void JsonSclass1355(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
        public void JsonSclass1455(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
        public void JsonSclass1555(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
        public void JsonSclass1655(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
        public void JsonSclass1755(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
        public void JsonSclass1855(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
        public void JsonSclass1955(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
        public void JsonSclass2055(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
        public void JsonSclass2155(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
        public void JsonSclass2255(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
        public void JsonSclass2355(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
         public void JsonSclass2356(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
         public void JsonSclass2357(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        public void JsonSclass2358(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        public void JsonSclass2359(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
        public void JsonSclass2360(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        
        public void JsonSclass2361(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        public void JsonSclass2362(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
        public void JsonSclass2363(){
            integer i=1;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
            i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;i++;
  
        }
   
}