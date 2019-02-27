public with sharing class SingleKPI_JsonString_AC {
     public static  string jsonMethod(list<Dataset__c> DatasetReclist,String DashboardName,String DashboardTitle,String DashboardDesc,String FolderId,String SalesName) {   
        Sales_Insight__c Sales = [select id,Sales_Insight_String2__c,Sales_Insight_String3__c,Sales_insight_String1__c,Sales_Insight_String4__c from Sales_Insight__c where id=: SalesName limit 1];                     
        String SalesString;

        
        if(Sales.Sales_Insight_String4__c != Null && Sales.Sales_Insight_String4__c != ''){
        SalesString = Sales.Sales_insight_String1__c + Sales.Sales_Insight_String2__c + Sales.Sales_Insight_String3__c + Sales.Sales_Insight_String4__c;
        }
        else{
           SalesString = Sales.Sales_insight_String1__c + Sales.Sales_Insight_String2__c + Sales.Sales_Insight_String3__c;
         
        }
        Integer RowNumber;
        for(Dataset__c DatasetRec : DatasetReclist){            
                   RowNumber = Integer.valueof(DatasetRec.Rownumber__c);            
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
                    // if(DatasetRec.Dimension_Name__c != Null){
                    //     Dimensions = DatasetRec.Dimension_Name__c.Split(',');
                    // }
                    // if(DatasetRec.Dimension_Api__c != Null){
                    //     DimensionApi = DatasetRec.Dimension_Api__c.Split(',');
                    // } 
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
                    if(DatasetRec.Dataset_Id__c != NUll){
                        if(FolderId == '00536000002nHMjAAM'){
                        
                            SalesString =  SalesString.replace('q = load \\\"#1DatasetAlias#','q = load \\\"analyticscc__' + DatasetRec.Dataset_Name__c);
                            }
                        SalesString =  SalesString.replace('#1DatasetAlias#',DatasetRec.Dataset_Name__c).replace('#1DatasetId#',DatasetRec.Dataset_Id__c);
                    }
                    SalesString = SalesString.replaceAll('\\s+\\s+','#testcode#').replaceAll('#testcode#',' '); 
                    if(Dimensions.Size() > 0){               
                        integer i = 1;  
                        integer j = 8;
                        for(String Dim : Dimensions){
                            integer k = i-1;
                           SalesString =  SalesString.replace('#label'+ i +'#',Dim).replace('#alias'+ i+'#',DimensionApi[k]);             
                           i = i+1;
                        }
                        for(Integer L=i;J >= L;L++){
                             integer k = L;
                             if(K == 8){
                                 String Dimens = ', "{\\"display\\": \\"#label'+k+'#\\",\\"value\\": \\"#alias'+k+'#\\",\\"expression\\": \\"\'#alias'+k+'#\'\\",\\"alias\\": \\"#alias'+k+'#\\"}"';
                                 SalesString =  SalesString.replace(Dimens,'');
                            }
                            else{
                                 String Dimens = ', "{\\"display\\": \\"#label'+k+'#\\",\\"value\\": \\"#alias'+k+'#\\",\\"expression\\": \\"\'#alias'+k+'#\'\\",\\"alias\\": \\"#alias'+k+'#\\"}"';
                                 SalesString =  SalesString.replace(Dimens,'');
                            }
                            String Dimen = 'q = filter q by {{column(Filter_'+k+'.selection, [\\\\\\"#alias'+k+'#\\\\\\"]).asEquality(\\\\\\"#alias'+k+'#\\\\\\")}};';
                            String DimenGrp = 'q = filter q by {{column(Grouping_'+k+'.selection, [\\\\\\"#alias'+k+'#\\\\\\"]).asEquality(\\\\\\"#alias'+k+'#\\\\\\")}};';
                            String Dimens1 = '"Filter_'+K+'": { "datasets": [{ "id": "#1DatasetId#", "name": "#1DatasetAlias#" }], "isFacet": true, "isGlobal": false, "query": { "query": "{\\"measures\\":[[\\"count\\",\\"*\\"]],\\"groups\\":[\\"{{cell(Static_Dimensions.selection,0,\\\\\\"alias'+K+'\\\\\\").asGrouping()}}\\"]}", "version": -1 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": false, "visualizationParameters": { "options": {} } },';
                            String Dimensionval = ',\\"value'+k+'\\": \\"\'#alias'+k+'#\'\\",\\"alias'+k+'\\": \\"#alias'+k+'#\\",\\"label'+k+'\\": \\"#label'+k+'#\\"';     
                            
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
                            if(k==8){
                              DimenVal = '"Filter_8": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "Filter_8", "title": "#label8#" }, "type": "listselector" },';  
                                DimenFil1 = '{ "colspan": 2, "column": 1, "name": "Filter_8", "row": 14, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(230, 236, 242, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil2 = '{ "colspan": 1, "column": 1, "name": "Filter_8", "row": 8, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil3 = '{ "colspan": 1, "column": 3, "name": "Filter_8", "row": 5, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                
                                DimenVal5 = '"Chart_8": { "parameters": { "autoFitMode": "none", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "visualizationType": "hbar", "exploreLink": true, "title": { "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "referenceLine": null }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "referenceLine": null }, "step": "Grouping_8", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "" } }, "type": "chart" },';
                                DimenFil9  = '"Chart_Title_8": { "parameters": { "fontSize": 20, "text": "{{ cell(Static_Dimensions.selection, 0, \\"label8\\").asString()}}", "textAlignment": "center", "textColor": "#091A3E" }, "type": "text" },';
                               
                                DimenFil7 = '{ "colspan": 3, "column": 12, "name": "Chart_Title_8", "row": 14, "rowspan": 1, "widgetStyle": { "backgroundColor": "#F2F6FA", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil8 = '{ "colspan": 3, "column": 3, "name": "Chart_Title_8", "row": 26, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil6 = '{ "colspan": 4, "column": 0, "name": "Chart_Title_8", "row": 46, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                
                                DimenFil10 = '{ "colspan": 3, "column": 12, "name": "Chart_8", "row": 15, "rowspan": 6, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil11 = '{ "colspan": 3, "column": 3, "name": "Chart_8", "row": 27, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil12 = '{ "colspan": 4, "column": 0, "name": "Chart_8", "row": 47, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil4 = '"Grouping_8": { "datasets": [{ "id": "#1DatasetId#", "name": "#1DatasetAlias#" }], "isFacet": true, "isGlobal": false, "query": { "query": "{\\"pigql\\": \\"q = load \\\\\\"#1DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{cell(Static_Dimensions.selection,0,\\\\\\"alias8\\\\\\").asGrouping()}}; q = foreach q generate {{row(Static_Dimensions.selection, [0], [\\\\\\"value8\\\\\\", \\\\\\"alias8\\\\\\"]).asProjection()}}, {{row(Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\n; q = order q by {{column(Static_Measures.selection, [\\\\\\"alias\\\\\\"])..asGrouping()}} {{column(Static_Order.selection, [\\\\\\"value\\\\\\"]).asObject()}};\\",\\"measures\\": \\"{{column(Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\": true,\\"groups\\": [\\"{{cell(Static_Dimensions.selection,0, \\\\\\"alias8\\\\\\").asGrouping()}}\\"]}", "version": -1 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "visualizationType": "hbar", "options": {} } },';
                               // DimenFil4 = '';
                               
                                StrNew = '"Chart_Title_8": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew1 = '"Chart_8": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew2 = '"Filter_8": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                            }
                            if(k==7){  
                                DimenVal = '"Filter_7": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "Filter_7", "title": "#label7#" }, "type": "listselector" },';  
                                DimenFil1 = '{ "colspan": 2, "column": 1, "name": "Filter_7", "row": 13, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(230, 236, 242, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil2 = '{ "colspan": 1, "column": 0, "name": "Filter_7", "row": 8, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil3 = '{ "colspan": 1, "column": 2, "name": "Filter_7", "row": 5, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil4  = '"Grouping_7": { "datasets": [{ "id": "#1DatasetId#", "name": "#1DatasetAlias#" }], "isFacet": true, "isGlobal": false, "query": { "query": "{\\"pigql\\": \\"q = load \\\\\\"#1DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{cell(Static_Dimensions.selection,0,\\\\\\"alias7\\\\\\").asGrouping()}}; q = foreach q generate {{row(Static_Dimensions.selection, [0], [\\\\\\"value7\\\\\\", \\\\\\"alias7\\\\\\"]).asProjection()}}, {{row(Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\n; q = order q by {{column(Static_Measures.selection, [\\\\\\"alias\\\\\\"]).asGrouping()}} {{column(Static_Order.selection, [\\\\\\"value\\\\\\"]).asObject()}};\\",\\"measures\\": \\"{{column(Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\": true,\\"groups\\": [\\"{{cell(Static_Dimensions.selection,0, \\\\\\"alias7\\\\\\").asGrouping()}}\\"]}", "version": -1 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "visualizationType": "hbar", "options": {} } },';
                                DimenVal5  = '"Chart_7": { "parameters": { "autoFitMode": "none", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "visualizationType": "hbar", "exploreLink": true, "title": { "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "referenceLine": null }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "referenceLine": null }, "step": "Grouping_7", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "" } }, "type": "chart" },';
                               
                                DimenFil7 = '{ "colspan": 3, "column": 9, "name": "Chart_7", "row": 15, "rowspan": 6, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil8 = '{ "colspan": 3, "column": 0, "name": "Chart_7", "row": 27, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil6  = '{ "colspan": 4, "column": 0, "name": "Chart_7", "row": 42, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                
                                DimenFil10 = '{ "colspan": 3, "column": 9, "name": "Chart_Title_7", "row": 14, "rowspan": 1, "widgetStyle": { "backgroundColor": "#F2F6FA", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil11 = '{ "colspan": 3, "column": 0, "name": "Chart_Title_7", "row": 26, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil12 = '{ "colspan": 4, "column": 0, "name": "Chart_Title_7", "row": 41, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil9 = '"Chart_Title_7": { "parameters": { "fontSize": 20, "text": "{{ cell(Static_Dimensions.selection, 0, \\"label7\\").asString()}}", "textAlignment": "center", "textColor": "#091A3E" }, "type": "text" },';
                                
                                StrNew = '"Chart_Title_7": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew1 = '"Chart_7": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew2 = '"Filter_7": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                                
                            }
                            if(k==6){
                                DimenVal = '"Filter_6": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "Filter_6", "title": "#label6#" }, "type": "listselector" },';  
                                DimenFil1 = '{ "colspan": 2, "column": 1, "name": "Filter_6", "row": 12, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(230, 236, 242, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil2 = '{ "colspan": 1, "column": 1, "name": "Filter_6", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil3 = '{ "colspan": 1, "column": 1, "name": "Filter_6", "row": 5, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil12='{ "colspan": 4, "column": 0, "name": "Chart_Title_6", "row": 36, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil11 ='{ "colspan": 3, "column": 3, "name": "Chart_Title_6", "row": 21, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil6='{ "colspan": 3, "column": 6, "name": "Chart_Title_6", "row": 14, "rowspan": 1, "widgetStyle": { "backgroundColor": "#F2F6FA", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil9 ='"Chart_Title_6": { "parameters": { "fontSize": 20, "text": "{{ cell(Static_Dimensions.selection, 0, \\"label6\\").asString()}}", "textAlignment": "center", "textColor": "#091A3E" }, "type": "text" },';
                                DimenFil8='{ "colspan": 4, "column": 0, "name": "Chart_6", "row": 37, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil7='{ "colspan": 3, "column": 3, "name": "Chart_6", "row": 22, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil10='{ "colspan": 3, "column": 6, "name": "Chart_6", "row": 15, "rowspan": 6, "widgetStyle": { "borderEdges": [] } },';
                                DimenVal5='"Chart_6": { "parameters": { "autoFitMode": "none", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "visualizationType": "hbar", "exploreLink": true, "title": { "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "referenceLine": null }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "referenceLine": null }, "step": "Grouping_6", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "" } }, "type": "chart" },';
                                DimenFil4 ='"Grouping_6": { "datasets": [{ "id": "#1DatasetId#", "name": "#1DatasetAlias#" }], "isFacet": true, "isGlobal": false, "query": { "query": "{\\"pigql\\": \\"q = load \\\\\\"#1DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{cell(Static_Dimensions.selection,0,\\\\\\"alias6\\\\\\").asGrouping()}}; q = foreach q generate {{row(Static_Dimensions.selection, [0], [\\\\\\"value6\\\\\\", \\\\\\"alias6\\\\\\"]).asProjection()}}, {{row(Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\n; q = order q by {{column(Static_Measures.selection, [\\\\\\"alias\\\\\\"]).asGrouping()}} {{column(Static_Order.selection, [\\\\\\"value\\\\\\"]).asObject()}};\\",\\"measures\\": \\"{{column(Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\": true,\\"groups\\": [\\"{{cell(Static_Dimensions.selection,0, \\\\\\"alias6\\\\\\").asGrouping()}}\\"]}", "version": -1 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "visualizationType": "hbar", "options": {} } },';
                                
                                StrNew = '"Chart_Title_6": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew1 = '"Chart_6": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew2 = '"Filter_6": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            }
                            if(k==5){
                                DimenVal = '"Filter_5": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "Filter_5", "title": "#label5#" }, "type": "listselector" },';  
                                DimenFil1 = '{ "colspan": 2, "column": 1, "name": "Filter_5", "row": 11, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(230, 236, 242, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil2 = '{ "colspan": 1, "column": 0, "name": "Filter_5", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil3 = '{ "colspan": 1, "column": 0, "name": "Filter_5", "row": 5, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil11='{ "colspan": 3, "column": 3, "name": "Chart_Title_5", "row": 14, "rowspan": 1, "widgetStyle": { "backgroundColor": "#F2F6FA", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil12  ='{ "colspan": 3, "column": 0, "name": "Chart_Title_5", "row": 21, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil6='{ "colspan": 4, "column": 0, "name": "Chart_Title_5", "row": 31, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil9  ='"Chart_Title_5": { "parameters": { "fontSize": 20, "text": "{{ cell(Static_Dimensions.selection, 0, \\"label5\\").asString()}}", "textAlignment": "center", "textColor": "#091A3E" }, "type": "text" },';
                                DimenFil8='{ "colspan": 3, "column": 3, "name": "Chart_5", "row": 15, "rowspan": 6, "widgetStyle": { "backgroundColor": "#FFFFFF", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                DimenFil7='{ "colspan": 3, "column": 0, "name": "Chart_5", "row": 22, "rowspan": 4, "widgetStyle": { "backgroundColor": "#FFFFFF", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                DimenFil10='{ "colspan": 4, "column": 0, "name": "Chart_5", "row": 32, "rowspan": 4, "widgetStyle": { "backgroundColor": "#FFFFFF", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                DimenVal5='"Chart_5": { "parameters": { "autoFitMode": "none", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "visualizationType": "hbar", "exploreLink": true, "title": { "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "referenceLine": null }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "referenceLine": null }, "step": "Grouping_5", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "" } }, "type": "chart" },';
                                DimenFil4='"Grouping_5": { "datasets": [{ "id": "#1DatasetId#", "name": "#1DatasetAlias#" }], "isFacet": true, "isGlobal": false, "query": { "query": "{\\"pigql\\": \\"q = load \\\\\\"#1DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{cell(Static_Dimensions.selection,0,\\\\\\"alias5\\\\\\").asGrouping()}}; q = foreach q generate {{row(Static_Dimensions.selection, [0], [\\\\\\"value5\\\\\\", \\\\\\"alias5\\\\\\"]).asProjection()}}, {{row(Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\n; q = order q by {{column(Static_Measures.selection, [\\\\\\"alias\\\\\\"]).asGrouping()}} {{column(Static_Order.selection, [\\\\\\"value\\\\\\"]).asObject()}};\\",\\"measures\\": \\"{{column(Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\": true,\\"groups\\": [\\"{{cell(Static_Dimensions.selection,0, \\\\\\"alias5\\\\\\").asGrouping()}}\\"]}", "version": -1 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "visualizationType": "hbar", "options": {} } },';
                            
                                StrNew = '"Chart_Title_5": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew1 = '"Chart_5": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew2 = '"Filter_5": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                             }
                            if(k==4){
                                DimenVal = '"Filter_4": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "Filter_4", "title": "#label4#" }, "type": "listselector" },';  
                                DimenFil1 = '{ "colspan": 2, "column": 1, "name": "Filter_4", "row": 10, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(230, 236, 242, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil2 = '{ "colspan": 1, "column": 1, "name": "Filter_4", "row": 6, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil3 = '{ "colspan": 1, "column": 3, "name": "Filter_4", "row": 4, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil4='"Grouping_4": { "datasets": [{ "id": "#1DatasetId#", "name": "#1DatasetAlias#" }], "isFacet": true, "isGlobal": false, "query": { "query": "{\\"pigql\\": \\"q = load \\\\\\"#1DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{cell(Static_Dimensions.selection,0,\\\\\\"alias4\\\\\\").asGrouping()}}; q = foreach q generate {{row(Static_Dimensions.selection, [0], [\\\\\\"value4\\\\\\", \\\\\\"alias4\\\\\\"]).asProjection()}}, {{row(Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\n; q = order q by {{column(Static_Measures.selection, [\\\\\\"alias\\\\\\"]).asGrouping()}} {{column(Static_Order.selection, [\\\\\\"value\\\\\\"]).asObject()}};\\",\\"measures\\": \\"{{column(Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\": true,\\"groups\\": [\\"{{cell(Static_Dimensions.selection,0, \\\\\\"alias4\\\\\\").asGrouping()}}\\"]}", "version": -1 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "visualizationType": "hbar", "options": {} } },';
                                DimenVal5='"Chart_4": { "parameters": { "autoFitMode": "none", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "visualizationType": "hbar", "exploreLink": true, "title": { "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "referenceLine": null }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "referenceLine": null }, "step": "Grouping_4", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "" } }, "type": "chart" },';
                                DimenFil6='{ "colspan": 3, "column": 12, "name": "Chart_4", "row": 8, "rowspan": 6, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil7='{ "colspan": 3, "column": 3, "name": "Chart_4", "row": 17, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil8='{ "colspan": 4, "column": 0, "name": "Chart_4", "row": 27, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil9='"Chart_Title_4": { "parameters": { "fontSize": 20, "text": "{{ cell(Static_Dimensions.selection, 0, \\"label4\\").asString()}}", "textAlignment": "center", "textColor": "#091A3E" }, "type": "text" },';
                                DimenFil10='{ "colspan": 3, "column": 12, "name": "Chart_Title_4", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#F2F6FA", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil11='{ "colspan": 3, "column": 3, "name": "Chart_Title_4", "row": 16, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil12='{ "colspan": 4, "column": 0, "name": "Chart_Title_4", "row": 26, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                
                                StrNew = '"Chart_Title_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew1 = '"Chart_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew2 = '"Filter_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                                
                            }
                            if(k==3){
                                DimenVal = '"Filter_3": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "Filter_3", "title": "#label3#" }, "type": "listselector" },';  
                                DimenFil1 = '{ "colspan": 2, "column": 1, "name": "Filter_3", "row": 9, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(230, 236, 242, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil2 = '{ "colspan": 1, "column": 0, "name": "Filter_3", "row": 6, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil3 = '{ "colspan": 1, "column": 2, "name": "Filter_3", "row": 4, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 4 } },';
                                DimenFil11='{ "colspan": 4, "column": 0, "name": "Chart_Title_3", "row": 21, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil12='{ "colspan": 3, "column": 0, "name": "Chart_Title_3", "row": 16, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil6='{ "colspan": 3, "column": 9, "name": "Chart_Title_3", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#F2F6FA", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil9='"Chart_Title_3": { "parameters": { "fontSize": 20, "text": "{{ cell(Static_Dimensions.selection, 0, \\"label3\\").asString()}}", "textAlignment": "center", "textColor": "#091A3E" }, "type": "text" },';
                                DimenFil8='{ "colspan": 3, "column": 9, "name": "Chart_3", "row": 8, "rowspan": 6, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil7='{ "colspan": 3, "column": 0, "name": "Chart_3", "row": 17, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil10='{ "colspan": 4, "column": 0, "name": "Chart_3", "row": 22, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenVal5='"Chart_3": { "parameters": { "autoFitMode": "none", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "visualizationType": "hbar", "exploreLink": true, "title": { "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "referenceLine": null }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "referenceLine": null }, "step": "Grouping_3", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "" } }, "type": "chart" },';
                                DimenFil4='"Grouping_3": { "datasets": [{ "id": "#1DatasetId#", "name": "#1DatasetAlias#" }], "isFacet": true, "isGlobal": false, "query": { "query": "{\\"pigql\\": \\"q = load \\\\\\"#1DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{cell(Static_Dimensions.selection,0,\\\\\\"alias3\\\\\\").asGrouping()}}; q = foreach q generate {{row(Static_Dimensions.selection, [0], [\\\\\\"value3\\\\\\", \\\\\\"alias3\\\\\\"]).asProjection()}}, {{row(Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\n; q = order q by {{column(Static_Measures.selection, [\\\\\\"alias\\\\\\"]).asGrouping()}} {{column(Static_Order.selection, [\\\\\\"value\\\\\\"]).asObject()}};\\",\\"measures\\": \\"{{column(Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\": true,\\"groups\\": [\\"{{cell(Static_Dimensions.selection,0, \\\\\\"alias3\\\\\\").asGrouping()}}\\"]}", "version": -1 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "visualizationType": "hbar", "options": {} } },';
                            
                                StrNew = '"Chart_Title_3": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew1 = '"Chart_3": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew2 = '"Filter_3": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                            }
                            if(k==2){
                                DimenVal = '"Filter_2": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "Filter_2", "title": "#label2#" }, "type": "listselector" },';  
                                DimenFil1 = '{ "colspan": 2, "column": 1, "name": "Filter_2", "row": 8, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(230, 236, 242, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil2 = '{ "colspan": 1, "column": 1, "name": "Filter_2", "row": 5, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil3 = '{ "colspan": 1, "column": 1, "name": "Filter_2", "row": 4, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil4='"Grouping_2": { "datasets": [{ "id": "#1DatasetId#", "name": "#1DatasetAlias#" }], "isFacet": true, "isGlobal": false, "query": { "query": "{\\"pigql\\": \\"q = load \\\\\\"#1DatasetAlias#\\\\\\"; q = filter q by {{cell(Static_Filter_1.selection,0, \\\\\\"value\\\\\\").asString()}}; q = group q by {{cell(Static_Dimensions.selection,0,\\\\\\"alias2\\\\\\").asGrouping()}}; q = foreach q generate {{row(Static_Dimensions.selection, [0], [\\\\\\"value2\\\\\\", \\\\\\"alias2\\\\\\"]).asProjection()}}, {{row(Static_Measures.selection, [], [\\\\\\"expression\\\\\\",\\\\\\"alias\\\\\\"]).asProjection()}};\\n; q = order q by {{column(Static_Measures.selection, [\\\\\\"alias\\\\\\"]).asGrouping()}} {{column(Static_Order.selection, [\\\\\\"value\\\\\\"]).asObject()}};\\",\\"measures\\": \\"{{column(Static_Measures.selection, [\\\\\\"cf\\\\\\"]).asObject()}}\\",\\"autoFilter\\": true,\\"groups\\": [\\"{{cell(Static_Dimensions.selection,0, \\\\\\"alias2\\\\\\").asGrouping()}}\\"]}", "version": -1 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "visualizationType": "hbar", "options": {} } },';
                                DimenVal5='"Chart_2": { "parameters": { "autoFitMode": "none", "showValues": true, "bins": { "breakpoints": { "high": 100, "low": 0 }, "bands": { "high": { "color": "#008000", "label": "" }, "low": { "color": "#B22222", "label": "" }, "medium": { "color": "#ffa500", "label": "" } } }, "legend": { "showHeader": true, "show": false, "customSize": "auto", "position": "right-top", "inside": false }, "axisMode": "multi", "visualizationType": "hbar", "exploreLink": true, "title": { "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "enable": false, "type": "x", "chartsPerLine": 4 }, "binValues": false, "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "referenceLine": null }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "referenceLine": null }, "step": "Grouping_2", "theme": "wave", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "" } }, "type": "chart" },';
                                DimenFil6='{ "colspan": 3, "column": 3, "name": "Chart_2", "row": 12, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil7='{ "colspan": 3, "column": 6, "name": "Chart_2", "row": 8, "rowspan": 6, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil8='{ "colspan": 4, "column": 0, "name": "Chart_2", "row": 17, "rowspan": 4, "widgetStyle": { "borderEdges": [] } },';
                                DimenFil9='"Chart_Title_2": { "parameters": { "fontSize": 20, "text": "{{ cell(Static_Dimensions.selection, 0, \\"label2\\").asString()}}", "textAlignment": "center", "textColor": "#091A3E" }, "type": "text" },';
                                DimenFil10='{ "colspan": 3, "column": 6, "name": "Chart_Title_2", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#F2F6FA", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil11='{ "colspan": 3, "column": 3, "name": "Chart_Title_2", "row": 11, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                DimenFil12='{ "colspan": 4, "column": 0, "name": "Chart_Title_2", "row": 16, "rowspan": 1, "widgetStyle": { "backgroundColor": "#E6ECF2", "borderColor": "#335779", "borderEdges": [ "bottom" ], "borderRadius": 4, "borderWidth": 4 } },';
                                StrNew = '"Chart_Title_2": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew1 = '"Chart_2": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrNew2 = '"Filter_2": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                            }
                            if(k==1){    
                              DimenVal = '"Filter_1": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "Filter_1", "title": "#label1#" }, "type": "listselector" },';  
                            }
                            String Strs;
                            if(K== 8){
                              Strs='\"#alias8#\"';
                            }
                            else{
                              Strs='\"#alias'+k+'#\",';
                            }
                            
                              
                            SalesString =  SalesString.replace(DimenVal,StrNew2).replace(DimenFil1,'').replace(DimenFil2,'').replace(DimenFil3,'').replace(Strs,'');
                            SalesString =  SalesString.replace(DimenFil4,'').replace(DimenVal5,StrNew1).replace(DimenFil6,'').replace(DimenFil7,'');
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
                            SalesString =  SalesString.replace('#datelabel'+ i +'#',Datelab).replace('#datealias'+ i+'#',DateApi[k]);  
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
                                    Str = ', "{\\"display\\": \\"#datelabel3# (Quarter)\\",\\"alias1\\": \\"#datealias3#_Year\\",\\"expression1\\": \\"\'#datealias3#_Year\'\\",\\"alias2\\": \\"#datealias3#_Quarter\\",\\"expression2\\": \\"\'#datealias3#_Quarter\'\\",\\"value\\": [\\"#datealias3#_Quarter\\",\\"#datealias3#_Year\\"],\\"filter\\": [\\"#datealias3#_Year\\",\\"#datealias3#_Month\\",\\"#datealias3#_Day\\"]}", "{\\"display\\": \\"#datelabel3# (Month)\\",\\"alias1\\": \\"#datealias3#_Year\\",\\"expression1\\": \\"\'#datealias3#_Year\'\\",\\"alias2\\": \\"#datealias3#_Month\\",\\"expression2\\": \\"\'#datealias3#_Month\'\\",\\"value\\": [\\"#datealias3#_Month\\",\\"#datealias3#_Year\\"],\\"filter\\": [\\"#datealias3#_Year\\",\\"#datealias3#_Month\\",\\"#datealias3#_Day\\"]}", "{\\"display\\": \\"#datelabel3# (Week)\\",\\"alias1\\": \\"#datealias3#_Year\\",\\"expression1\\": \\"\'#datealias3#_Year\'\\",\\"alias2\\": \\"#datealias3#_Week\\",\\"expression2\\": \\"\'#datealias3#_Week\'\\",\\"value\\": [\\"#datealias3#_Week\\",\\"#datealias3#_Year\\"],\\"filter\\": [\\"#datealias3#_Year\\",\\"#datealias3#_Month\\",\\"#datealias3#_Day\\"]}"';                                   
                                    Str1= ', "{\\"display\\": \\"#datelabel3# (Quarter)\\",\\"alias\\": \\"#datealias3#_Year~~~#datealias3#_Quarter\\",\\"expression\\": \\"\'#datealias3#_Year\' + \\\\\\"~~~\\\\\\" + \'#datealias3#_Quarter\'\\",\\"value\\": [\\"#datealias3#_Year\\",\\"#datealias3#_Quarter\\"]}", "{\\"display\\": \\"#datelabel3# (Month)\\",\\"alias\\": \\"#datealias3#_Year~~~#datealias3#_Month\\",\\"expression\\": \\"\'#datealias3#_Year\' + \\\\\\"~~~\\\\\\" + \'#datealias3#_Month\'\\",\\"value\\": [\\"#datealias3#_Year\\",\\"#datealias3#_Month\\"]}", "{\\"display\\": \\"#datelabel3# (Week)\\",\\"alias\\": \\"#datealias3#_Year~~~#datealias3#_Week\\",\\"expression\\": \\"\'#datealias3#_Year\' + \\\\\\"~~~\\\\\\" + \'#datealias3#_Week\'\\",\\"value\\": [\\"#datealias3#_Year\\",\\"#datealias3#_Week\\"]}", "{\\"display\\": \\"#datelabel3# (Day)\\",\\"alias\\": \\"#datealias3#_Year~~~#datealias3#_Month~~~#datealias3#_Day\\",\\"expression\\": \\"\'#datealias3#_Year\' + \\\\\\"~~~\\\\\\" + \'#datealias3#_Month\' + \\\\\\"~~~\\\\\\" + \'#datealias3#_Day\'\\",\\"value\\": [\\"#datealias3#_Year\\",\\"#datealias3#_Month\\",\\"#datealias3#_Day\\"]}"';
                                    Str2 = '"Date_3": { "type": "aggregateflex", "isFacet": true, "useGlobal": false, "isGlobal": false, "selectMode": "single", "query": { "query": "{\\"groups\\":[\\"{{cell(Static_Dimensions.selection,0,\\\\\\"datealias3\\\\\\").asObject()}}\\"],\\"measures\\":[[\\"count\\",\\"*\\"]]}", "version": -1 }, "datasets": [{ "id": "#1DatasetId#", "name": "#1DatasetAlias#" } ] },';
                                    Str3 = '"dateselector_2": { "type": "dateselector", "parameters": { "step": "Date_3", "instant": false, "defaultAbsoluteMode": true, "defaultFiscalMode": false, "modeSwitchingAllowed": true, "calendarTypeSwitchingAllowed": false, "title": "#datelabel3#" } },';
                                    StrNew = '"dateselector_2": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                    Str4 = '{ "colspan": 1, "column": 2, "name": "dateselector_2", "row": 3, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(255, 255, 255, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },'; 
                                    Str5 = '{ "colspan": 1, "column": 0, "name": "dateselector_2", "row": 4, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(255, 255, 255, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                    Str6 = '{ "colspan": 2, "column": 1, "name": "dateselector_2", "row": 5, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(255, 255, 255, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                }
                                if(K== 2){
                                    Str = ', "{\\"display\\": \\"#datelabel2# (Quarter)\\",\\"alias1\\": \\"#datealias2#_Year\\",\\"expression1\\": \\"\'#datealias2#_Year\'\\",\\"alias2\\": \\"#datealias2#_Quarter\\",\\"expression2\\": \\"\'#datealias2#_Quarter\'\\",\\"value\\": [\\"#datealias2#_Quarter\\",\\"#datealias2#_Year\\"],\\"filter\\": [\\"#datealias2#_Year\\",\\"#datealias2#_Month\\",\\"#datealias2#_Day\\"]}", "{\\"display\\": \\"#datelabel2# (Month)\\",\\"alias1\\": \\"#datealias2#_Year\\",\\"expression1\\": \\"\'#datealias2#_Year\'\\",\\"alias2\\": \\"#datealias2#_Month\\",\\"expression2\\": \\"\'#datealias2#_Month\'\\",\\"value\\": [\\"#datealias2#_Month\\",\\"#datealias2#_Year\\"],\\"filter\\": [\\"#datealias2#_Year\\",\\"#datealias2#_Month\\",\\"#datealias2#_Day\\"]}", "{\\"display\\": \\"#datelabel2# (Week)\\",\\"alias1\\": \\"#datealias2#_Year\\",\\"expression1\\": \\"\'#datealias2#_Year\'\\",\\"alias2\\": \\"#datealias2#_Week\\",\\"expression2\\": \\"\'#datealias2#_Week\'\\",\\"value\\": [\\"#datealias2#_Week\\",\\"#datealias2#_Year\\"],\\"filter\\": [\\"#datealias2#_Year\\",\\"#datealias2#_Month\\",\\"#datealias2#_Day\\"]}"';
                                    Str1= ', "{\\"display\\": \\"#datelabel2# (Quarter)\\",\\"alias\\": \\"#datealias2#_Year~~~#datealias2#_Quarter\\",\\"expression\\": \\"\'#datealias2#_Year\' + \\\\\\"~~~\\\\\\" + \'#datealias2#_Quarter\'\\",\\"value\\": [\\"#datealias2#_Year\\",\\"#datealias2#_Quarter\\"]}", "{\\"display\\": \\"#datelabel2# (Month)\\",\\"alias\\": \\"#datealias2#_Year~~~#datealias2#_Month\\",\\"expression\\": \\"\'#datealias2#_Year\' + \\\\\\"~~~\\\\\\" + \'#datealias2#_Month\'\\",\\"value\\": [\\"#datealias2#_Year\\",\\"#datealias2#_Month\\"]}", "{\\"display\\": \\"#datelabel2# (Week)\\",\\"alias\\": \\"#datealias2#_Year~~~#datealias2#_Week\\",\\"expression\\": \\"\'#datealias2#_Year\' + \\\\\\"~~~\\\\\\" + \'#datealias2#_Week\'\\",\\"value\\": [\\"#datealias2#_Year\\",\\"#datealias2#_Week\\"]}", "{\\"display\\": \\"#datelabel2# (Day)\\",\\"alias\\": \\"#datealias2#_Year~~~#datealias2#_Month~~~#datealias2#_Day\\",\\"expression\\": \\"\'#datealias2#_Year\' + \\\\\\"~~~\\\\\\" + \'#datealias2#_Month\' + \\\\\\"~~~\\\\\\" + \'#datealias2#_Day\'\\",\\"value\\": [\\"#datealias2#_Year\\",\\"#datealias2#_Month\\",\\"#datealias2#_Day\\"]}"';
                                    Str2 = '"Date_2": { "type": "aggregateflex", "isFacet": true, "useGlobal": false, "isGlobal": false, "selectMode": "single", "query": { "query": "{\\"groups\\":[\\"{{cell(Static_Dimensions.selection,0,\\\\\\"datealias2\\\\\\").asObject()}}\\"],\\"measures\\":[[\\"count\\",\\"*\\"]]}", "version": -1 }, "datasets": [{ "id": "#1DatasetId#", "name": "#1DatasetAlias#" }] },';
                                    Str3 = '"dateselector_1": { "type": "dateselector", "parameters": { "step": "Date_2", "instant": false, "defaultAbsoluteMode": true, "defaultFiscalMode": false, "modeSwitchingAllowed": true, "calendarTypeSwitchingAllowed": false, "title": "#datelabel2#" } },';
                                    StrNew = '"dateselector_1": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                    Str4 = '{ "colspan": 1, "column": 1, "name": "dateselector_1", "row": 3, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(255, 255, 255, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                    Str5 = '{ "colspan": 1, "column": 1, "name": "dateselector_1", "row": 3, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(255, 255, 255, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                    Str6 = '{ "colspan": 2, "column": 1, "name": "dateselector_1", "row": 4, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(255, 255, 255, 0)", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                }    
                                if(K== 1){
                                    Str = '"{\\"display\\": \\"#datelabel1# (Quarter)\\",\\"alias1\\": \\"#datealias1#_Year\\",\\"expression1\\": \\"\'#datealias1#_Year\'\\",\\"alias2\\": \\"#datealias1#_Quarter\\",\\"expression2\\": \\"\'#datealias1#_Quarter\'\\",\\"value\\": [\\"#datealias1#_Quarter\\",\\"#datealias1#_Year\\"],\\"filter\\": [\\"#datealias1#_Year\\",\\"#datealias1#_Month\\",\\"#datealias1#_Day\\"]}", "{\\"display\\": \\"#datelabel1# (Month)\\",\\"alias1\\": \\"#datealias1#_Year\\",\\"expression1\\": \\"\'#datealias1#_Year\'\\",\\"alias2\\": \\"#datealias1#_Month\\",\\"expression2\\": \\"\'#datealias1#_Month\'\\",\\"value\\": [\\"#datealias1#_Month\\",\\"#datealias1#_Year\\"],\\"filter\\": [\\"#datealias1#_Year\\",\\"#datealias1#_Month\\",\\"#datealias1#_Day\\"]}", "{\\"display\\": \\"#datelabel1# (Week)\\",\\"alias1\\": \\"#datealias1#_Year\\",\\"expression1\\": \\"\'#datealias1#_Year\'\\",\\"alias2\\": \\"#datealias1#_Week\\",\\"expression2\\": \\"\'#datealias1#_Week\'\\",\\"value\\": [\\"#datealias1#_Week\\",\\"#datealias1#_Year\\"],\\"filter\\": [\\"#datealias1#_Year\\",\\"#datealias1#_Month\\",\\"#datealias1#_Day\\"]}"';
                                    Str1= '"{\\"display\\": \\"#datelabel1# (Quarter)\\",\\"alias\\": \\"#datealias1#_Year~~~#datealias1#_Quarter\\",\\"expression\\": \\"\'#datealias1#_Year\' + \\\\\\"~~~\\\\\\" + \'#datealias1#_Quarter\'\\",\\"value\\": [\\"#datealias1#_Year\\",\\"#datealias1#_Quarter\\"]}", "{\\"display\\": \\"#datelabel1# (Month)\\",\\"alias\\": \\"#datealias1#_Year~~~#datealias1#_Month\\",\\"expression\\": \\"\'#datealias1#_Year\' + \\\\\\"~~~\\\\\\" + \'#datealias1#_Month\'\\",\\"value\\": [\\"#datealias1#_Year\\",\\"#datealias1#_Month\\"]}", "{\\"display\\": \\"#datelabel1# (Week)\\",\\"alias\\": \\"#datealias1#_Year~~~#datealias1#_Week\\",\\"expression\\": \\"\'#datealias1#_Year\' + \\\\\\"~~~\\\\\\" + \'#datealias1#_Week\'\\",\\"value\\": [\\"#datealias1#_Year\\",\\"#datealias1#_Week\\"]}", "{\\"display\\": \\"#datelabel1# (Day)\\",\\"alias\\": \\"#datealias1#_Year~~~#datealias1#_Month~~~#datealias1#_Day\\",\\"expression\\": \\"\'#datealias1#_Year\' + \\\\\\"~~~\\\\\\" + \'#datealias1#_Month\' + \\\\\\"~~~\\\\\\" + \'#datealias1#_Day\'\\",\\"value\\": [\\"#datealias1#_Year\\",\\"#datealias1#_Month\\",\\"#datealias1#_Day\\"]}"';
                                    Str2 = '"Date_1": { "datasets": [{ "id": "#1DatasetId#", "name": "#1DatasetAlias#" }], "isFacet": true, "isGlobal": false, "query": { "query": "{\\"measures\\": [[\\"count\\",\\"*\\"]],\\"groups\\": [\\"{{cell(Static_Dimensions.selection,0, \\\\\\"datealias1\\\\\\\").asObject()}}\\"]}", "version": -1 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": false, "visualizationParameters": { "options": {} } },';
                                }
                                
                                String DateString = ',\\"datevalue'+k+'\\": \\"\'#datealias'+k+'#\'\\",\\"datealias'+k+'\\": \\"#datealias'+k+'#\\",\\"datelabel'+k+'\\": \\"#datelabel'+k+'#\\"';  
                                SalesString =  SalesString.replace(Str,'').replace(Str1,'').replace(DateString,''); 
                                SalesString =  SalesString.replace(Str3,StrNew).replace(Str4,'').replace(Str5,'').replace(Str6,'');                                                            
                            }
                        }
                        else{                   
                           
                        }
                    
                    if(measureLabel.size() > 0){               
                      
                        integer i = 1;
                        integer j = 5;
                       
                        
                       
                        
                        
                        
                        
                        
                        System.debug('*************measureLabel '+measureLabel + ' MeasureAPI '+MeasureAPI + ' AliasMeasureAPI '+ AliasMeasureAPI + ' CompactMeasureAPI '+CompactMeasureAPI);
                        for(String Dim : measureLabel){    
                            integer k = i-1;
                            String Str = '[\\"#1CompactMeasureAPI'+ i+'#\\"]';
                            String Meas = '#1ExpressionMeasureAPI4#';
                            SalesString =  SalesString.replace('#1MeasureLabel'+ i+'#',Dim).replace('#1MeasureExpression'+ i+'#',MeasureAPI[k]).replace('#1MeasureAlias'+ i+'#',AliasMeasureAPI[k]).replace(Str,CompactMeasureAPI[k]).replace('#measurealias'+i+'#',AliasMeasureAPI[k]);  
                            SalesString =  SalesString.replace('#1ExpressionMeasureAPI'+i+'#',MeasureAPI[k]);
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
                              Str1 = ', "{\\"display\\": \\"#label'+k+'#\\",\\"value\\": \\"#alias'+k+'#\\",\\"expression\\": \\"\'#alias'+k+'#\'\\",\\"alias\\": \\"#alias'+k+'#\\"}"';
                                 Str2 = ', "{\\"display\\": \\"#1MeasureLabel5#\\",\\"cf\\": [\\"#1CompactMeasureAPI5#\\"],\\"expression\\": \\"#1ExpressionMeasureAPI5#\\",\\"alias\\": \\"#1MeasureAlias5#\\"}" ';
                               
                            }
                            else{
                              Str1 = ', "{\\"display\\": \\"#label'+k+'#\\",\\"value\\": \\"#alias'+k+'#\\",\\"expression\\": \\"\'#alias'+k+'#\'\\",\\"alias\\": \\"#alias'+k+'#\\"}"';
                                 Str2 = ', "{\\"display\\": \\"#1MeasureLabel'+k+'#\\",\\"cf\\": [\\"#1CompactMeasureAPI'+k+'#\\"],\\"expression\\": \\"#1ExpressionMeasureAPI'+k+'#\\",\\"alias\\": \\"#1MeasureAlias'+k+'#\\"}"';
                              
                            }
                            if(k == 4){
                              Str3 = '"KPI_4": { "parameters": { "compact": true, "exploreLink": true, "measureField": "#measurealias4#", "numberColor": "#FFFFFF", "numberSize": 32, "step": "KPIs", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                                 Str4 = '{ "colspan": 3, "column": 12, "name": "KPI_4", "row": 3, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                 Str5 = '{ "colspan": 2, "column": 4, "name": "KPI_4", "row": 7, "rowspan": 2, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                 Str6 = '{ "colspan": 1, "column": 3, "name": "KPI_4", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                            Str7 = '"KPI_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                
                            }
                            if(k == 3){
                              Str3 = '"KPI_3": { "parameters": { "compact": true, "exploreLink": true, "measureField": "#measurealias3#", "numberColor": "#FFFFFF", "numberSize": 32, "step": "KPIs", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                                 Str4 = '{ "colspan": 3, "column": 9, "name": "KPI_3", "row": 3, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                 Str5 = '{ "colspan": 2, "column": 2, "name": "KPI_3", "row": 7, "rowspan": 2, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                 Str6 = '{ "colspan": 1, "column": 2, "name": "KPI_3", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                Str7 = '"KPI_3": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            
                            }
                            if(k == 2){
                              Str3 = '"KPI_2": { "parameters": { "compact": true, "exploreLink": true, "measureField": "#measurealias2#", "numberColor": "#FFFFFF", "numberSize": 32, "step": "KPIs", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                                 Str4 = '{ "colspan": 3, "column": 6, "name": "KPI_2", "row": 3, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                 Str5 = '{ "colspan": 2, "column": 4, "name": "KPI_2", "row": 4, "rowspan": 2, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                 Str6 = '{ "colspan": 1, "column": 1, "name": "KPI_2", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                Str7 = '"KPI_2": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            
                            }
                            String StrMeasure = ',\\"labelkpi'+k+'\\": \\"#1MeasureLabel'+k+'#\\",\\"expression'+k+'\\": \\"#1MeasureExpression'+k+'#\\",\\"cfkpi'+k+'\\": [\\"#1CompactMeasureAPI'+k+'#\\"],\\"aliaskpi'+k+'\\": \\"#1MeasureAlias'+k+'#\\"';                           
                          String StrMeaure1 = ',\\"{{cell(Static_KPI.selection,0, \\\\\\"cfkpi'+k+'\\\\\\").asObject()}}\\"';
                          String StrMeasure2 = ',{{row(Static_KPI.selection, [], [\\\\\\"expression'+k+'\\\\\\",\\\\\\"aliaskpi'+k+'\\\\\\"]).asProjection()}}';
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
                                SalesString =  SalesString.replace('#1FilterLabel'+ i+'#',Filtervalu[M]).replace('#1Filter'+ i+'#',Dim); 
                                i = i+1;
                                M = M+1;
                            }
                            String Str3;
                            for(Integer L=i;J >= L;L++){
                                integer k = L;
                                if(K == 5){ 
                                       Str3 = ', "{\\"display\\": \\"#1FilterLabel'+k+'#\\",\\"value\\": \\"#1Filter'+k+'#\\"}"';
                                   }
                                else{
                                    Str3 = ', "{\\"display\\": \\"#1FilterLabel'+k+'#\\",\\"value\\": \\"#1Filter'+k+'#\\"}"' ;
                                   }
                                SalesString =  SalesString.replace(Str3,'');  
                            } 
                        }
                            
                    }
                    else{
                      if(DimensionApi != Null){
                        if(DimensionApi.size() > 0)
                          SalesString =  SalesString.replace('#1FilterLabel1#','All').replace('#1Filter1#','\''+DimensionApi[0]+'\' in all');
                      }
                        integer j = 5;
                         String Str3;
                        for(Integer L=2;J >= L;L++){
                                integer k = L;
                                if(K == 5){ 
                                 Str3 = ', "{\\"display\\": \\"#1FilterLabel'+k+'#\\",\\"value\\": \\"#1Filter'+k+'#\\"}"';
                            }
                                else{
                                Str3 = ', "{\\"display\\": \\"#1FilterLabel'+k+'#\\",\\"value\\": \\"#1Filter'+k+'#\\"}"' ;
                              }
                              SalesString =  SalesString.replace(Str3,''); 
                            }
                    }
                    
                    
                    if(Dimensions.Size() > 0){               
                        integer i = 1;  
                        integer j = 8;
                        for(String Dim : Dimensions){           
                           i = i+1;
                        }
                        String Strs;
                        for(Integer L=i;J >= L;L++){
                             integer k = L;
                             if(K== 8){
                              Strs='\\"#alias8#\\"';
                            }
                            else{
                              Strs='\\"#alias'+k+'#\\",';
                            }
                             SalesString =  SalesString.replace(Strs,''); 
                        }
                    
                    } 
                    
                    if(DashboardDesc != Null && DashboardDesc != '') {
                    SalesString =  SalesString.replace('Dashboard Description',DashboardDesc); 
                    SalesString =  SalesString.replace('#DashboardDescription#',DashboardDesc);
                    }
                    else {
                    SalesString =  SalesString.replace('Dashboard Description',''); 
                    SalesString =  SalesString.replace('#DashboardDescription#','');
                    }
                    if(DashboardTitle != Null && DashboardTitle != '') {
                    SalesString =  SalesString.replace('Dashboard Title',DashboardTitle); 
                    SalesString =  SalesString.replace('#DashboardTitle#',DashboardTitle); 
                    }
                    if(DashboardDesc != Null && DashboardName != '') {
                    SalesString =  SalesString.replace('Winter Release Test New Dashboard',DashboardName);
                    SalesString =  SalesString.replace('#DashboardName#',DashboardName);  
                    }
                    if(FolderId != Null && FolderId != '') {
                     SalesString =  SalesString.replace('00536000002nLlRAAU',FolderId); 
                     SalesString =  SalesString.replace('#NewFolderId#',FolderId);    
                    }  
                     
                     // Joseph - Added lines below
                     List<Sales_Insight__c> FindAndReplace = [select id, analyticscc__Dashboard_Type__c, analyticscc__IF_Variable__c, analyticscc__Replace_Type__c, analyticscc__Text_to_Find__c, analyticscc__Text_to_Replace__c
                                             from Sales_Insight__c 
                                             where
                                                 analyticscc__Dashboard_Type__c = 'Beta Insights' AND (
                                                 (analyticscc__IF_Variable__c =: measureLabel.Size() AND analyticscc__Replace_Type__c = 'Dimension') OR 
                                                 (analyticscc__IF_Variable__c =: measureLabel.Size() AND analyticscc__Replace_Type__c = 'Date') OR 
                                                 (analyticscc__IF_Variable__c =: measureLabel.Size() AND analyticscc__Replace_Type__c = 'Measure') OR 
                                                 (analyticscc__IF_Variable__c =: measureLabel.Size() AND analyticscc__Replace_Type__c = 'Filter')) ];                     
                    
                    for(Sales_Insight__c ins : FindAndReplace) {
                        SalesString = SalesString.replace(ins.analyticscc__Text_to_Find__c, ins.analyticscc__Text_to_Replace__c);
                    }
                    System.debug('value within FolderId ' + FolderId);
                    
                    // Joseph - stop new code                  
     }
             
        
        
        SalesString = SalesString.replace('}",   ]','}"]').replace('}",     ]','}"]');
        SalesString = SalesString.replace('}",  ]','}"]').replace('}", ]','}"]').replace('}",]','}"]');
        SalesString = SalesString.replace('"step": "Raw_Data"','"mode": "fittocontainer", "step": "Raw_Data"');
        SalesString = SalesString.replace('"step":"Raw_Data"','"mode": "fittocontainer", "step": "Raw_Data"');
    System.debug('Final String to be POST^^^^^^^' + SalesString);
    return SalesString;
     }
}