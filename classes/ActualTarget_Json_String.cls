public with sharing class ActualTarget_Json_String {
     public static  string jsonMethod(list<Dataset__c> DatsetList,String DashboardName,String FolderId,String datevalue,String datevalueact,String SalesNames) { 
     	
        boolean Rownumberone = false;
        boolean Rownumbertwo = false ;
        boolean RowNumberthree = false;  
                                     
        Sales_Insight__c JsonRec = [select id,Sales_insight_String1__c,Sales_insight_String2__c,Sales_insight_String3__c from Sales_Insight__c where Id = :SalesNames limit 1];                    
       
        integer RowNumber = 1;
        integer RowNumber1 = 1;
        set<String> NewSet = new set<String>();
        list<String> Newlist = new list<String>();
        Map<String,String> NewMap= new Map<String,String>();  
        set<String> Duplicatevalues = new set<string>();
        set<String> AllRownumbers = new set<String>();
        for(Dataset__c DatasetRec : DatsetList){
            AllRownumbers.add(String.valueof(DatasetRec.Rownumber__c));
        }
        
        
       String JsonMethod = JsonRec.Sales_Insight_String1__c + JsonRec.Sales_insight_String2__c + JsonRec.Sales_insight_String3__c;
        JsonMethod = JsonMethod.replaceAll('\\s+\\s+','#testcode#'); 
					JsonMethod = JsonMethod.replaceAll('#testcode#',' ');
        if(DashboardName != Null && DashboardName != '')
        JsonMethod =  JsonMethod.replace('#Actionlayout_Mahesh#',DashboardName);
        JsonMethod =  JsonMethod.replace('#Datevalues#',datevalue);
        JsonMethod =  JsonMethod.replace('#1dateAlias1#',datevalueact);
         JsonMethod =  JsonMethod.replace('#2dateAlias1#',datevalue);
          JsonMethod =  JsonMethod.replace('#1datelabel1#',datevalueact);
         JsonMethod =  JsonMethod.replace('#2datelabel1#',datevalue);
        System.debug('datevalueact*****************'+datevalueact);
        JsonMethod =  JsonMethod.replace('#Datevaluesact#',datevalueact);
        if(FolderId != Null && FolderId != '')
        JsonMethod =  JsonMethod.replace('#00l36000000PcfKAAS#',FolderId);
        for(integer RowNumberlist=1;RowNumberlist<=2;RowNumberlist++){
         if(AllRownumbers.contains(String.valueof(RowNumberlist))){     
         for(Dataset__c DatasetRec : DatsetList){           
            RowNumber = Integer.valueof(DatasetRec.Rownumber__c);
                String[] DimensionApi = new String[]{};
                String[] Dimensions = new String[]{};
                //if(DatasetRec.Dimension_Name__c != null && DatasetRec.Dimension_Name__c != ''){             
                     if(DatasetRec.Dimension_Name__c != null && DatasetRec.Dimension_Name__c != ''){
                        Dimensions = DatasetRec.Dimension_Name__c.Split(',');
                     }
                     else if( DatasetRec.New_Dimension_Name__c != null &&  DatasetRec.New_Dimension_Name__c != ''){
                        Dimensions = DatasetRec.New_Dimension_Name__c.Split(','); 
                     }
                     if(DatasetRec.Dimension_Api__c != null && DatasetRec.Dimension_Api__c != ''){
                        DimensionApi = DatasetRec.Dimension_Api__c.Split(',');
                     }
                     else if( DatasetRec.New_Dimension_API__c != null &&  DatasetRec.New_Dimension_API__c != ''){
                        DimensionApi = DatasetRec.New_Dimension_API__c.Split(',');  
                     }
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
                
                if(Dimensions.size() >0){
                    integer i = 1;  
                    integer j = 6;
                    for(String Dim : Dimensions){
                       i = i+1;
                    }
                    for(Integer L=i;J >= L;L++){
                         integer k = L;
                            String Newvar =', { "fields": [{ "dataSourceName": "#1datasetAlias#", "dataSourceType": "saql", "fieldName": "#1dimensionAPI'+k+'#" }, { "dataSourceName": "#2datasetAlias#", "dataSourceType": "saql", "fieldName": "#2dimensionAPI'+k+'#" }], "label": "#1dimensionlabel'+k+'#", "name": "Link_18'+k+'" }';
                            JsonMethod =  JsonMethod.replace(Newvar,'');
                             System.debug('Newvarsssssss*********************************'+Newvar);
                        
                    }
                            
                }
                
                if(Datelabel.size() > 0){
                    integer i = 1;  
                    integer j = 2;
                    for(String Dim : Datelabel){
                       i = i+1;
                    }
                    for(Integer L=i;J >= L;L++){
                         integer k = L;
                            String Newvar =', { "fields": [{ "dataSourceName": "#1datasetAlias#", "dataSourceType": "saql", "fieldName": "#1dateAlias2#" }, { "dataSourceName": "#2datasetAlias#", "dataSourceType": "saql", "fieldName": "#2dateAlias2#" }], "label": "#1datelabel2#", "name": "Link_188" }';
                            System.debug('Newvar*********************************'+Newvar);
                            JsonMethod =  JsonMethod.replace(Newvar,'');
                        
                    }
                            
                }
                if(DatasetRec.Measure_Name__c != null){
                    measureLabel = DatasetRec.Measure_Name__c.Split(',');
                    MeasureAPI = DatasetRec.Measure_API__c.Split(',');
                    AliasMeasureAPI = DatasetRec.AliasMeasure_API__c.Split(',');
                    DatasetRec.CompactMeasure_API__c = DatasetRec.CompactMeasure_API__c.replace('],[','];[');               
                    CompactMeasureAPI = DatasetRec.CompactMeasure_API__c.Split(';');
                }
                Map<String,String> DimensionLabel = new Map<String,String>();
                if(DatasetRec.Dataset_Id__c != null && DatasetRec.Dataset_Id__c != '') {  
                                            
                    JsonMethod =  JsonMethod.replace('#'+RowNumber+'datasetId#',DatasetRec.Dataset_Id__c);
                
                }
                
                if(DatasetRec.Dataset_Name__c != null && DatasetRec.Dataset_Name__c != '') {
                    
                    if(DatasetRec.RowNumber__c == 1){
                    	JsonMethod =  JsonMethod.replace('#1datasetAlias#',DatasetRec.Dataset_Name__c);	
                    }
                    else if(DatasetRec.RowNumber__c == 2){
                    	JsonMethod =  JsonMethod.replace('#2datasetAlias#',DatasetRec.Dataset_Name__c);	
                    }
                }
                 
                if(Dimensions.Size() > 0){ 
                         if(Dimensions.Size() == 2 || Dimensions.Size() == 1){
                            String Dims = '"Sub_Graph_3_1": { "datasets": [], "dimensions": [], "groups": [], "isFacet": false, "isGlobal": false, "label": "Sub graph 3", "numbers": [], "selectMode": "singlerequired", "start": "{\\"display\\":[\\"#1dimensionlabel3#\\"]}", "strings": [], "type": "staticflex", "useGlobal": false, "values": ["{\\"display\\":\\"#1dimensionlabel1#\\",\\"targetvalue\\":[\\"#2dimensionAPI1#\\"],\\"actualvalue\\":[\\"#1dimensionAPI1#\\"],\\"expression\\":\\"coalesce(actual.\'#1dimensionAPI1#\',target.\'#2dimensionAPI1#\')\\",\\"commentforbelow\\":\\"use the alias of \'actual\' dataset\\",\\"alias\\":\\"#1dimensionAPI1#\\"}", "{\\"display\\":\\"#1dimensionlabel2#\\",\\"targetvalue\\":[\\"#2dimensionAPI2#\\"],\\"actualvalue\\":[\\"#1dimensionAPI2#\\"],\\"expression\\":\\"coalesce(actual.\'#1dimensionAPI2#\',target.\'#2dimensionAPI2#\')\\",\\"commentforbelow\\":\\"use the alias of \'actual\' dataset\\",\\"alias\\":\\"#1dimensionAPI2#\\"}", "{\\"display\\":\\"#1dimensionlabel3#\\",\\"targetvalue\\":[\\"#2dimensionAPI3#\\"],\\"actualvalue\\":[\\"#1dimensionAPI3#\\"],\\"expression\\":\\"coalesce(actual.\'#1dimensionAPI3#\',target.\'#2dimensionAPI3#\')\\",\\"commentforbelow\\":\\"use the alias of \'actual\' dataset\\",\\"alias\\":\\"#1dimensionAPI3#\\"}", "{\\"display\\":\\"#1dimensionlabel4#\\",\\"targetvalue\\":[\\"#2dimensionAPI4#\\"],\\"actualvalue\\":[\\"#1dimensionAPI4#\\"],\\"expression\\":\\"coalesce(actual.\'#1dimensionAPI4#\',target.\'#2dimensionAPI4#\')\\",\\"commentforbelow\\":\\"use the alias of \'actual\' dataset\\",\\"alias\\":\\"#1dimensionAPI4#\\"}", "{\\"display\\":\\"#1dimensionlabel5#\\",\\"targetvalue\\":[\\"#2dimensionAPI5#\\"],\\"actualvalue\\":[\\"#1dimensionAPI5#\\"],\\"expression\\":\\"coalesce(actual.\'#1dimensionAPI5#\',target.\'#2dimensionAPI5#\')\\",\\"commentforbelow\\":\\"use the alias of \'actual\' dataset\\",\\"alias\\":\\"#1dimensionAPI5#\\"}"] },';
                            String NewDims = '"listselector_7": { "parameters": { "compact": false, "exploreLink": false, "instant": true, "step": "Sub_Graph_3_1", "title": "Choose a Grouping" }, "type": "listselector" },';
                            string NewDimslist  = '{ "colspan": 3, "column": 9, "name": "listselector_7", "row": 10, "rowspan": 1, "widgetStyle": { "backgroundColor": "#FFFFFF", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                            string charts = '"chart_4": { "parameters": { "autoFitMode": "keepLabels", "showValues": true, "showPoints": true, "legend": { "showHeader": false, "show": true, "customSize": "auto", "position": "bottom-center", "inside": false }, "axisMode": "sync", "visualizationType": "combo", "missingValue": "connect", "exploreLink": false, "title": { "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "enable": false, "type": "x", "chartsPerLine": 4 }, "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "theme": "wave", "step": "Target_Actual_3", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "", "icons": { "useIcons": false, "iconProps": { "fit": "cover", "column": "", "type": "round" } } } }, "type": "chart" },';
                            String Chartslis = '{ "colspan": 3, "column": 9, "name": "chart_4", "row": 11, "rowspan": 4, "widgetStyle": { "borderEdges": ["left", "right"] } },';
                            String  StrNew = '"listselector_7": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            String  StrNew1 = '"chart_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                              
                            JsonMethod =  JsonMethod.replace(Dims,'').replace(NewDims,StrNew).replace(NewDimslist,'').replace(charts,StrNew1).replace(Chartslis,'');	
                         
                             
                         }
                         if(Dimensions.Size() == 1){
                             String Dims = '"Sub_Graph_2_1": { "datasets": [], "dimensions": [], "groups": [], "isFacet": false, "isGlobal": false, "label": "Sub graph 2", "numbers": [], "selectMode": "singlerequired", "start": "{\\"display\\":[\\"#1dimensionlabel2#\\"]}", "strings": [], "type": "staticflex", "useGlobal": false, "values": ["{\\"display\\":\\"#1dimensionlabel1#\\",\\"targetvalue\\":[\\"#2dimensionAPI1#\\"],\\"actualvalue\\":[\\"#1dimensionAPI1#\\"],\\"expression\\":\\"coalesce(actual.\'#1dimensionAPI1#\',target.\'#2dimensionAPI1#\')\\",\\"commentforbelow\\":\\"use the alias of \'actual\' dataset\\",\\"alias\\":\\"#1dimensionAPI1#\\"}", "{\\"display\\":\\"#1dimensionlabel2#\\",\\"targetvalue\\":[\\"#2dimensionAPI2#\\"],\\"actualvalue\\":[\\"#1dimensionAPI2#\\"],\\"expression\\":\\"coalesce(actual.\'#1dimensionAPI2#\',target.\'#2dimensionAPI2#\')\\",\\"commentforbelow\\":\\"use the alias of \'actual\' dataset\\",\\"alias\\":\\"#1dimensionAPI2#\\"}", "{\\"display\\":\\"#1dimensionlabel3#\\",\\"targetvalue\\":[\\"#2dimensionAPI3#\\"],\\"actualvalue\\":[\\"#1dimensionAPI3#\\"],\\"expression\\":\\"coalesce(actual.\'#1dimensionAPI3#\',target.\'#2dimensionAPI3#\')\\",\\"commentforbelow\\":\\"use the alias of \'actual\' dataset\\",\\"alias\\":\\"#1dimensionAPI3#\\"}", "{\\"display\\":\\"#1dimensionlabel4#\\",\\"targetvalue\\":[\\"#2dimensionAPI4#\\"],\\"actualvalue\\":[\\"#1dimensionAPI4#\\"],\\"expression\\":\\"coalesce(actual.\'#1dimensionAPI4#\',target.\'#2dimensionAPI4#\')\\",\\"commentforbelow\\":\\"use the alias of \'actual\' dataset\\",\\"alias\\":\\"#1dimensionAPI4#\\"}", "{\\"display\\":\\"#1dimensionlabel5#\\",\\"targetvalue\\":[\\"#2dimensionAPI5#\\"],\\"actualvalue\\":[\\"#1dimensionAPI5#\\"],\\"expression\\":\\"coalesce(actual.\'#1dimensionAPI5#\',target.\'#2dimensionAPI5#\')\\",\\"commentforbelow\\":\\"use the alias of \'actual\' dataset\\",\\"alias\\":\\"#1dimensionAPI5#\\"}"] },';
                            String NewDims = '"listselector_4": { "parameters": { "compact": false, "exploreLink": false, "instant": true, "step": "Sub_Graph_2_1", "title": "Choose a Grouping" }, "type": "listselector" },';
                            string NewDimslist  = '{ "colspan": 3, "column": 6, "name": "listselector_4", "row": 10, "rowspan": 1, "widgetStyle": { "backgroundColor": "#FFFFFF", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                            string charts = '"chart_3": { "parameters": { "autoFitMode": "keepLabels", "showValues": true, "showPoints": true, "legend": { "showHeader": false, "show": true, "customSize": "auto", "position": "bottom-center", "inside": false }, "axisMode": "sync", "visualizationType": "combo", "missingValue": "connect", "exploreLink": false, "title": { "label": "", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "enable": false, "type": "x", "chartsPerLine": 4 }, "measureAxis2": { "sqrtScale": false, "showTitle": true, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "measureAxis1": { "sqrtScale": false, "showTitle": false, "showAxis": true, "title": "", "customDomain": { "showDomain": false } }, "theme": "wave", "step": "Target_Actual_2", "dimensionAxis": { "showTitle": false, "customSize": "auto", "showAxis": true, "title": "", "icons": { "useIcons": false, "iconProps": { "fit": "cover", "column": "", "type": "round" } } } }, "type": "chart" },';
                            String Chartslis = '{ "colspan": 3, "column": 6, "name": "chart_3", "row": 11, "rowspan": 4, "widgetStyle": { "borderEdges": ["right", "left"] } },';
                            String  StrNew = '"listselector_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            String  StrNew1 = '"chart_3": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                              
                          
                            JsonMethod =  JsonMethod.replace(Dims,'').replace(NewDims,StrNew).replace(NewDimslist,'').replace(charts,StrNew1).replace(Chartslis,'');
                             
                         }
                        integer i = 1;  
                        integer j = 6;
                        for(String Dim : Dimensions){
                            integer k = i-1;
                           JsonMethod =  JsonMethod.replace('#'+RowNumber+'dimensionlabel'+ i +'#',Dim).replace('#'+RowNumber+'dimensionAPI'+ i+'#',DimensionApi[k]);             
                            Duplicatevalues.add(DimensionApi[k]);
                           i = i+1;
                           
                        }
                        for(Integer L=i;J >= L;L++){
                             integer k = L;
                             if(K == 6){
                                 String Dimens = ', "{\\"display\\": \\"#'+RowNumber+'dimensionlabel'+k+'#\\",\\"value\\": \\"#'+RowNumber+'dimensionAPI'+k+'#\\",\\"expression\\": \\"\'#'+RowNumber+'dimensionAPI'+k+'#\'\\",\\"alias\\": \\"#'+RowNumber+'dimensionAPI'+k+'#\\"}"';
                                 JsonMethod =  JsonMethod.replace(Dimens,'');
                                
                                   }
                            else{
                                 String Dimens = ', "{\\"display\\": \\"#'+RowNumber+'dimensionlabel'+k+'#\\",\\"value\\": \\"#'+RowNumber+'dimensionAPI'+k+'#\\",\\"expression\\": \\"\'#'+RowNumber+'dimensionAPI'+k+'#\'\\",\\"alias\\": \\"#'+RowNumber+'dimensionAPI'+k+'#\\"}"';
                                 
                                 JsonMethod =  JsonMethod.replace(Dimens,'');
                                 
                            }
                            String Dimen = 'q = filter q by {{column(Filter_'+k+'.selection, [\\\\\\"#'+RowNumber+'dimensionAPI'+k+'#\\\\\\"]).asEquality(\\\\\\"#'+RowNumber+'dimensionAPI'+k+'#\\\\\\")}};';
                            String DimenGrp = 'q = filter q by {{column(Grouping_'+k+'.selection, [\\\\\\"#'+RowNumber+'dimensionAPI'+k+'#\\\\\\"]).asEquality(\\\\\\"#'+RowNumber+'dimensionAPI'+k+'#\\\\\\")}};';
                            String Dimens1 = '"Filter_'+K+'": { "datasets": [{ "id": "#1DatasetId#", "name": "#1DatasetAlias#" }], "isFacet": true, "isGlobal": false, "query": { "query": "{\\"measures\\":[[\\"count\\",\\"*\\"]],\\"groups\\":[\\"{{cell(Static_Dimensions.selection,0,\\\\\\"alias'+K+'\\\\\\").asGrouping()}}\\"]}", "version": -1 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": false, "visualizationParameters": { "options": {} } },';
                            String Dimensionval = ',\\"value'+k+'\\": \\"\'#alias'+k+'#\'\\",\\"alias'+k+'\\": \\"#alias'+k+'#\\",\\"label'+k+'\\": \\"#label'+k+'#\\"';     
                            
                            JsonMethod =  JsonMethod.replace(Dimen,'').replace(DimenGrp,'').replace(Dimens1,'').replace(Dimensionval,'');
                            
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
                             String  StrNew;
                            if(k==6){
                               DimenVal = '"listselector_9": { "parameters": { "compact": false, "exploreLink": false, "instant": true, "measureField": "count", "step": "Manager_2", "title": "#1dimensionlabel6#" }, "type": "listselector" },';
                                  DimenFil1 = '"Manager_2": { "broadcastFacet": true, "datasets": [{ "id": "#2datasetId#", "name": "#2datasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"measures\\":[[\\"count\\",\\"*\\"]],\\"groups\\":[\\"#2dimensionAPI6#\\"]}", "version": -1.0 }, "receiveFacet": true, "selectMode": "multi", "type": "aggregateflex", "useGlobal": false, "visualizationParameters": {} },';
                                  DimenFil2 = '{ "colspan": 3, "column": 0, "name": "listselector_9", "row": 35, "rowspan": 3, "widgetStyle": { "backgroundColor": "#FFFFFF", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                  DimenFil3 = ', "{\\"display\\":\\"#1dimensionlabel6#\\",\\"targetvalue\\":[\\"#2dimensionAPI6#\\"],\\"actualvalue\\":[\\"#1dimensionAPI6#\\"],\\"expression\\":\\"coalesce(actual.\'#1dimensionAPI6#\',target.\'#2dimensionAPI6#\')\\",\\"commentforbelow\\":\\"use the alias of \'actual\' dataset\\",\\"alias\\":\\"#1dimensionAPI6#\\"}"';
                                    StrNew = '"listselector_9": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                          
                            }
                           
                              
                            if(k==5){
                            	DimenFil2  = '"Region_2": { "broadcastFacet": true, "datasets": [{ "id": "#2datasetId#", "name": "#2datasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"measures\\":[[\\"count\\",\\"*\\"]],\\"groups\\":[\\"#2dimensionAPI5#\\"]}", "version": -1.0 }, "receiveFacet": true, "selectMode": "multi", "type": "aggregateflex", "useGlobal": false, "visualizationParameters": {} },';	
                            	DimenFil1 = '{ "colspan": 3, "column": 0, "name": "listselector_10", "row": 31, "rowspan": 3, "widgetStyle": { "backgroundColor": "#FFFFFF", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                DimenVal = '"listselector_10": { "parameters": { "compact": false, "exploreLink": false, "instant": true, "measureField": "count", "step": "Region_2", "title": "#1dimensionlabel5#" }, "type": "listselector" }';
                                DimenFil3 = ', "{\\"display\\":\\"#1dimensionlabel5#\\",\\"targetvalue\\":[\\"#2dimensionAPI5#\\"],\\"actualvalue\\":[\\"#1dimensionAPI5#\\"],\\"expression\\":\\"coalesce(actual.\'#1dimensionAPI5#\',target.\'#2dimensionAPI5#\')\\",\\"commentforbelow\\":\\"use the alias of \'actual\' dataset\\",\\"alias\\":\\"#1dimensionAPI5#\\"}"';
                                  StrNew = '"listselector_10": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                          
                            }
                            if(k==4){
                            	DimenVal = '"listselector_11": { "parameters": { "compact": false, "exploreLink": false, "instant": false, "measureField": "count", "step": "Geo_2", "title": "#1dimensionlabel4#" }, "type": "listselector" },';	
                            	DimenFil1 = '"Geo_2": { "broadcastFacet": true, "datasets": [{ "id": "#2datasetId#", "name": "#2datasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"measures\\":[[\\"count\\",\\"*\\"]],\\"groups\\":[\\"#2dimensionAPI4#\\"]}", "version": -1.0 }, "receiveFacet": true, "selectMode": "multi", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": {} },';
                                DimenFil2 = '{ "colspan": 3, "column": 0, "name": "listselector_11", "row": 27, "rowspan": 3, "widgetStyle": { "backgroundColor": "#FFFFFF", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                DimenFil3 = ', "{\\"display\\":\\"#1dimensionlabel4#\\",\\"targetvalue\\":[\\"#2dimensionAPI4#\\"],\\"actualvalue\\":[\\"#1dimensionAPI4#\\"],\\"expression\\":\\"coalesce(actual.\'#1dimensionAPI4#\',target.\'#2dimensionAPI4#\')\\",\\"commentforbelow\\":\\"use the alias of \'actual\' dataset\\",\\"alias\\":\\"#1dimensionAPI4#\\"}"';
                                StrNew = '"listselector_11": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                          
                                 }
                            if(k==3){
                            	DimenVal = '"listselector_3": { "parameters": { "compact": false, "exploreLink": false, "instant": true, "measureField": "count", "step": "Manager_1", "title": "#1dimensionlabel3#" }, "type": "listselector" },';	
                            	DimenFil1 = '"Manager_1": { "broadcastFacet": true, "datasets": [{ "id": "#2datasetId#", "name": "#2datasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"measures\\":[[\\"count\\",\\"*\\"]],\\"groups\\":[\\"#2dimensionAPI3#\\"]}", "version": -1.0 }, "receiveFacet": true, "selectMode": "multi", "type": "aggregateflex", "useGlobal": false, "visualizationParameters": {} },';
                                DimenFil2 = '{ "colspan": 3, "column": 0, "name": "listselector_3", "row": 23, "rowspan": 3, "widgetStyle": { "borderEdges": [] } },';
                               DimenFil3 = ', "{\\"display\\":\\"#1dimensionlabel3#\\",\\"targetvalue\\":[\\"#2dimensionAPI3#\\"],\\"actualvalue\\":[\\"#1dimensionAPI3#\\"],\\"expression\\":\\"coalesce(actual.\'#1dimensionAPI3#\',target.\'#2dimensionAPI3#\')\\",\\"commentforbelow\\":\\"use the alias of \'actual\' dataset\\",\\"alias\\":\\"#1dimensionAPI3#\\"}"';
                               StrNew = '"listselector_3": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                          
                                }
                            if(k==2){
                            	DimenVal = '"listselector_2": { "parameters": { "compact": false, "exploreLink": false, "instant": true, "measureField": "count", "step": "Region_1", "title": "#1dimensionlabel2#" }, "type": "listselector" },';	
                            	DimenFil1 = '"Region_1": { "broadcastFacet": true, "datasets": [{ "id": "#2datasetId#", "name": "#2datasetAlias#" }], "isGlobal": false, "query": { "query": "{\\"measures\\":[[\\"count\\",\\"*\\"]],\\"groups\\":[\\"#2dimensionAPI2#\\"]}", "version": -1.0 }, "receiveFacet": true, "selectMode": "multi", "type": "aggregateflex", "useGlobal": false, "visualizationParameters": {} },';
                                DimenFil2 = '{ "colspan": 3, "column": 0, "name": "listselector_2", "row": 19, "rowspan": 3, "widgetStyle": { "borderEdges": [] } },';
                              DimenFil3 = ', "{\\"display\\":\\"#1dimensionlabel2#\\",\\"targetvalue\\":[\\"#2dimensionAPI2#\\"],\\"actualvalue\\":[\\"#1dimensionAPI2#\\"],\\"expression\\":\\"coalesce(actual.\'#1dimensionAPI2#\',target.\'#2dimensionAPI2#\')\\",\\"commentforbelow\\":\\"use the alias of \'actual\' dataset\\",\\"alias\\":\\"#1dimensionAPI2#\\"}"';
                               
                                StrNew = '"listselector_2": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                          
                            }
                            if(k==1){    
                            	DimenVal = '"Filter_1": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "Filter_1", "title": "#label1#" }, "type": "listselector" },';	
                            }
                            String Strs;
                            if(K== 6){
                            	Strs=',\\"#1dimensionAPI6#\\"';
                            }
                            else{
                            	Strs =',\\"#1dimensionAPI'+k+'#\\"';
                            }
                            JsonMethod =  JsonMethod.replace(DimenVal,StrNew).replace(DimenFil1,'').replace(DimenFil2,'').replace(DimenFil3,'');
                            JsonMethod =  JsonMethod.replace(Strs,'');
                        }
                    }
                    else{
                       	String DimenAll = '"Static_Group": { "datasets": [], "dimensions": [], "groups": [], "isFacet": false, "isGlobal": false, "numbers": [], "selectMode": "singlerequired", "strings": [], "type": "staticflex", "useGlobal": false, "values": [ "{\\"display\\": \\"#label1\\",\\"value\\": \\"#alias1#\\",\\"expression\\": \\"\'#alias1#\'\\",\\"alias\\": \\"#alias1#\\"}", "{\\"display\\": \\"#label2#\\",\\"value\\": \\"#alias2#\\",\\"expression\\": \\"\'#alias2#\'\\",\\"alias\\": \\"#alias2#\\"}", "{\\"display\\": \\"#label3#\\",\\"value\\": \\"#alias3#\\",\\"expression\\": \\"\'#alias3#\'\\",\\"alias\\": \\"#alias3#\\"}", "{\\"display\\": \\"#label4#\\",\\"value\\": \\"#alias4#\\",\\"expression\\": \\"\'#alias4#\'\\",\\"alias\\": \\"#alias4#\\"}", "{\\"display\\": \\"#label5#\\",\\"value\\": \\"#alias5#\\",\\"expression\\": \\"\'#alias5#\'\\",\\"alias\\": \\"#alias5#\\"}", "{\\"display\\": \\"#label6#\\",\\"value\\": \\"#alias6#\\",\\"expression\\": \\"\'#alias6#\'\\",\\"alias\\": \\"#alias6#\\"}", "{\\"display\\": \\"#label7#\\",\\"value\\": \\"#alias7#\\",\\"expression\\": \\"\'#alias7#\'\\",\\"alias\\": \\"#alias7#\\"}", "{\\"display\\": \\"#label8#\\",\\"value\\": \\"#alias8#\\",\\"expression\\": \\"\'#alias8#\'\\",\\"alias\\": \\"#alias8#\\"}" ] },';
                    	JsonMethod =  JsonMethod.replace(DimenAll,'');
                    	
                    	String DimensLabel = '"Additional_Feature_List_2": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "step": "Static_Group", "title": "Choose Grouping" }, "type": "listselector" },';
                    	JsonMethod =  JsonMethod.replace(DimensLabel,'');
                    	
                    	String DimensLabel1 = '{ "colspan": 3, "column": 12, "name": "Additional_Feature_List_2", "row": 23, "rowspan": 1, "widgetStyle": { "borderEdges": [] } },';
                    	JsonMethod =  JsonMethod.replace(DimensLabel1,'');
                    	
                    	String DimensLabel2 = '{ "colspan": 2, "column": 2, "name": "Additional_Feature_List_2", "row": 58, "rowspan": 1, "widgetStyle": { "borderEdges": [] } },';
                    	JsonMethod =  JsonMethod.replace(DimensLabel2,'');
                    	
                    	String DimensLabel3 = '{ "colspan": 1, "column": 5, "name": "Additional_Feature_List_2", "row": 32, "rowspan": 1, "widgetStyle": { "borderEdges": [] } },';
                    	JsonMethod =  JsonMethod.replace(DimensLabel3,'');
                    } 				
                if(Datelabel.size() > 0){
                    integer i = 1;
                    integer j = 2;
                    for(String Datelab : DateLabel){
                        integer k = i-1;            
                        JsonMethod =  JsonMethod.replace('#1dateAlias1#',datevalueact);
                         JsonMethod =  JsonMethod.replace('#2dateAlias1#',datevalue);
                          JsonMethod =  JsonMethod.replace('#1datelabel1#',datevalueact);
                         JsonMethod =  JsonMethod.replace('#2datelabel1#',datevalue);
                        i = i+1;
                    }
                    for(Integer L=i;J >= L;L++){
                             integer k = L;
                             if(k== 2){
                                 String NewDate = '"dateselector_2": { "parameters": { "calendarTypeSwitchingAllowed": false, "defaultAbsoluteMode": true, "defaultFiscalMode": false, "instant": false, "modeSwitchingAllowed": true, "step": "StartDate_2", "title": "#2datelabel2#" }, "type": "dateselector" },';
                                 String NewDates = '{ "colspan": 1, "column": 9, "name": "dateselector_2", "row": 2, "rowspan": 1, "widgetStyle": { "borderEdges": [] } },';
                                 String Newlists = '"StartDate_2": { "datasets": [{ "id": "#2datasetId#", "name": "#2datasetAlias#" }], "isFacet": true, "isGlobal": false, "query": { "query": "{\\"measures\\":[[\\"count\\",\\"*\\"]],\\"groups\\":[\\"#2dateAlias2#\\"]}", "version": -1.0 }, "selectMode": "single", "type": "aggregateflex", "useGlobal": false, "visualizationParameters": {} },';
                                 JsonMethod =  JsonMethod.replace(NewDate,'').replace(NewDates,'').replace(Newlists,'');
                                 
                             }
                    }
                    
                }
                
                if(measureLabel.size() > 0){ 
                    
                   if(measureLabel.size() == 1){
                           String Meas1 = '"{\\"display\\":\\"#1MeasureLabel2#\\",\\"cf\\":[\\"#1ExpressionMeasureAPI2#actual\\",\\"#2ExpressionMeasureAPI2#target\\"],\\"expression\\":\\"coalesce(#1MeasureAPI2#,0) as \'#1ExpressionMeasureAPI2#actual\', coalesce(#2MeasureAPI2#,0) as \'#2ExpressionMeasureAPI2#target\'\\"}",';
                           String Meas2 = '"Target_QuotaAmount_Q_2": { "datasets": [{ "id": "'+DatasetRec.Dataset_Id__c+'", "name": "'+DatasetRec.Dataset_Name__c+'" }], "isFacet": true, "isGlobal": false, "label": "#1MeasureLabel2#", "query": { "query": "{\\"measures\\":[\\"#1CompactMeasureAPI2#\\"]}", "version": -1.0 }, "selectMode": "single", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "parameters": { "customBulkActions": [], "maxColumnWidth": 300, "minColumnWidth": 40, "mode": "variable", "totals": true }, "type": "table" } },';
                               String Meas3 = '"Target_amount_step_2": { "groups": [], "isFacet": true, "numbers": [], "query": "q = load \\"analyticscc__#2datasetAlias#\\";q = group q by \'all\';q = foreach q generate #2AliasMeasureAPI2#*\\"#2queryFiltersLabel1#\\" as \'max\',#2AliasMeasureAPI2#*\\"#2queryFiltersLabel2#\\" as \'high\',#2AliasMeasureAPI2#*\\"#2queryFiltersLabel3#\\" as \'mid\';q = limit q 2000;", "selectMode": "single", "strings": [], "type": "saql", "useGlobal": true, "visualizationParameters": { "parameters": { "customBulkActions": [], "maxColumnWidth": 300, "minColumnWidth": 40, "mode": "variable" }, "type": "table" } },';
                           String Meas6 = '"Target_amount_step_2": { "groups": [], "isFacet": true, "numbers": [], "query": "q = load \\"#2datasetAlias#\\";q = group q by \'all\';q = foreach q generate #2AliasMeasureAPI2#*\\"#2queryFiltersLabel1#\\" as \'max\',#2AliasMeasureAPI2#*\\"#2queryFiltersLabel2#\\" as \'high\',#2AliasMeasureAPI2#*\\"#2queryFiltersLabel3#\\" as \'mid\';q = limit q 2000;", "selectMode": "single", "strings": [], "type": "saql", "useGlobal": true, "visualizationParameters": { "parameters": { "customBulkActions": [], "maxColumnWidth": 300, "minColumnWidth": 40, "mode": "variable" }, "type": "table" } },';
                           String Meas4 = '{ "colspan": 3, "column": 0, "name": "chart_6", "row": 11, "rowspan": 4, "widgetStyle": { "backgroundColor": "#FFFFFF", "borderColor": "#2EC2BA", "borderEdges": ["bottom"], "borderRadius": 0, "borderWidth": 2 } },';
                           String Meas5 = '"chart_6": { "parameters": { "max": "{{cell(Target_amount_step_2.result,0,\\"max\\").asString()}}", "showPercentage": true, "legend": { "showHeader": true, "show": false, "position": "right-top", "inside": false }, "visualizationType": "gauge", "exploreLink": true, "medium": "{{cell(Target_amount_step_2.result,0,\\"mid\\").asString()}}", "title": { "label": "#1MeasureLabel2#", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "enable": false, "type": "x", "chartsPerLine": 4 }, "bands": { "high": { "color": "#008000", "label": "High" }, "low": { "color": "#B22222", "label": "Low" }, "medium": { "color": "#ffa500", "label": "Medium" } }, "showRange": false, "showLabel": false, "high": "{{cell(Target_amount_step_2.result,0,\\"high\\").asString()}}", "showValue": true, "min": 0, "angle": 240, "theme": "wave", "step": "Target_QuotaAmount_Q_2" }, "type": "chart" },';
                           String Strs = ',\\"#1MeasureAPIs2#\\"';
                           JsonMethod =  JsonMethod.replace(Meas1,'').replace(Meas2,'').replace(Meas3,'').replace(Meas4,'').replace(Meas5,'').replace(Meas6,'');
                           JsonMethod =  JsonMethod.replace(Strs,'');
                           System.debug('Meas3 &&'+Meas5) ;
                   }
                   if(measureLabel.size() == 2 || measureLabel.size() == 1){
                        String Meas1 = '"{\\"display\\":\\"#1MeasureLabel3#\\",\\"cf\\":[\\"#1ExpressionMeasureAPI3#actual\\",\\"#2ExpressionMeasureAPI3#target\\"],\\"expression\\":\\"coalesce(#1MeasureAPI3#,0) as \'#1ExpressionMeasureAPI3#actual\', coalesce(#2MeasureAPI3#,0) as \'#2ExpressionMeasureAPI3#target\'\\"}"';
                           String Meas2 = '"Target_QuotaAmount_Q_3": { "datasets": [{ "id": "'+DatasetRec.Dataset_Id__c+'", "name": "'+DatasetRec.Dataset_Name__c+'" }], "isFacet": true, "isGlobal": false, "label": "#1MeasureLabel3#", "query": { "query": "{\\"measures\\":[\\"#1CompactMeasureAPI3#\\"]}", "version": -1.0 }, "selectMode": "single", "type": "aggregateflex", "useGlobal": true, "visualizationParameters": { "parameters": { "customBulkActions": [], "maxColumnWidth": 300, "minColumnWidth": 40, "mode": "variable", "totals": true }, "type": "table" } },';
                           String Meas3 = '"Target_amount_step_3": { "groups": [], "isFacet": true, "numbers": [], "query": "q = load \\"analyticscc__#2datasetAlias#\\";q = group q by \'all\';q = foreach q generate #2AliasMeasureAPI3#*\\"#3queryFiltersLabel1#\\" as \'max\',#2AliasMeasureAPI3#*\\"#3queryFiltersLabel2#\\" as \'high\',#2AliasMeasureAPI3#*\\"#3queryFiltersLabel3#\\" as \'mid\';q = limit q 2000;", "selectMode": "single", "strings": [], "type": "saql", "useGlobal": true, "visualizationParameters": { "parameters": { "customBulkActions": [], "maxColumnWidth": 300, "minColumnWidth": 40, "mode": "variable" }, "type": "table" } },';
                           String Meas6 = '"Target_amount_step_3": { "groups": [], "isFacet": true, "numbers": [], "query": "q = load \\"#2datasetAlias#\\";q = group q by \'all\';q = foreach q generate #2AliasMeasureAPI3#*\\"#3queryFiltersLabel1#\\" as \'max\',#2AliasMeasureAPI3#*\\"#3queryFiltersLabel2#\\" as \'high\',#2AliasMeasureAPI3#*\\"#3queryFiltersLabel3#\\" as \'mid\';q = limit q 2000;", "selectMode": "single", "strings": [], "type": "saql", "useGlobal": true, "visualizationParameters": { "parameters": { "customBulkActions": [], "maxColumnWidth": 300, "minColumnWidth": 40, "mode": "variable" }, "type": "table" } },';
                           String Meas4 = '{ "colspan": 3, "column": 0, "name": "chart_7", "row": 7, "rowspan": 4, "widgetStyle": { "backgroundColor": "#FFFFFF", "borderColor": "#2EC2BA", "borderEdges": ["bottom"], "borderRadius": 0, "borderWidth": 2 } },';
                           String Meas5 = '"chart_7": { "parameters": { "max": "{{cell(Target_amount_step_3.result,0,\\"max\\").asString()}}", "showPercentage": true, "legend": { "showHeader": true, "show": false, "position": "right-top", "inside": false }, "visualizationType": "gauge", "exploreLink": true, "medium": "{{cell(Target_amount_step_3.result,0,\\"mid\\").asString()}}", "title": { "label": "#1MeasureLabel3#", "align": "center", "subtitleLabel": "" }, "trellis": { "flipLabels": false, "showGridLines": true, "enable": false, "type": "x", "chartsPerLine": 4 }, "bands": { "high": { "color": "#008000", "label": "High" }, "low": { "color": "#B22222", "label": "Low" }, "medium": { "color": "#ffa500", "label": "Medium" } }, "showRange": false, "showLabel": false, "high": "{{cell(Target_amount_step_3.result,0,\\"high\\").asString()}}", "showValue": true, "min": 0, "angle": 240, "theme": "wave", "step": "Target_QuotaAmount_Q_3" }, "type": "chart" },';
                            String Strs = ',\\"#1MeasureAPIs3#\\"';
                           JsonMethod =  JsonMethod.replace(Meas1,'').replace(Meas2,'').replace(Meas3,'').replace(Meas4,'').replace(Meas5,'').replace(Meas6,'');
                           JsonMethod =  JsonMethod.replace(Strs,'');
                            System.debug('Meas3 &&'+Meas5) ;
                   }
                    integer i = 1;
                    integer j = 3;
                    String Newlabel;
                    String NewMeasure2;
                    String NewMeasure3;
                   String NewMeasure4 = '';
                    
                    for(String Dim : measureLabel){
                            integer k = i-1;
                            String Str = '\\"#'+RowNumber+'CompactMeasureAPI'+ i+'#\\"';
                            JsonMethod =  JsonMethod.replace('#'+RowNumber+'MeasureLabel'+ i+'#',Dim);
                            JsonMethod =  JsonMethod.replace('#'+RowNumber+'ExpressionMeasureAPI'+ i+'#',AliasMeasureAPI[k]); 
                            JsonMethod =  JsonMethod.replace('#'+RowNumber+'AliasMeasureAPI'+ i+'#',MeasureAPI[k]); 
                            JsonMethod =  JsonMethod.replace(Str,CompactMeasureAPI[k]);     
                           
                             if(MeasureAPI[k] == 'count()'){
                                Newlabel = Dim;
                                if(RowNumber == 1){
                                    NewMeasure2 = 'count(actual)';
                                    NewMeasure4 = DimensionApi[0];
                                    
                                }
                                if(RowNumber == 2)
                                NewMeasure3 = 'count(target)';
                                
                            } 
							else{
                                Newlabel = Dim;
                                if(RowNumber == 1){
                                   if(MeasureAPI[k] != 'count()'){
                                         NewMeasure2 = MeasureAPI[k].replace('(\'','(actual.\'');
                                       
                                          NewMeasure2 = MeasureAPI[k].replace('(\'','(actual.\'');
                                          NewMeasure4 = MeasureAPI[k].replace('(\'',';');
                                          String[] Newslist = NewMeasure4.split(';');
                                          if(Newslist.size()>1)
                                          NewMeasure4 = Newslist[1].replace('(\'','').replace('\')','');
                                          System.debug('NewNewMeasure4All*****************'+NewMeasure4);
                                   }
                                   
                                }
                                 if(RowNumber == 2)
                                  if(MeasureAPI[k] != 'count()'){
                                      NewMeasure3 = MeasureAPI[k].replace('(\'','(target.\'');
                                  }
                                       
                                 
                                  
                            }
                            
                            if(RowNumber == 1){
                            JsonMethod = JsonMethod.replace('#1MeasureAPI'+i+'#',NewMeasure2);
                                if(MeasureAPI[k] != 'count()'){
                                    System.debug('NewNewMeasure4*****************'+NewMeasure4);
                                    if(!Duplicatevalues.contains(NewMeasure4)){
                                        JsonMethod = JsonMethod.replace('#'+RowNumber+'MeasureAPIs'+i+'#',NewMeasure4);
                                        Duplicatevalues.add(NewMeasure4);
                                      
                                        
                                    }
                                    else{
                                        System.debug('NewNewMeasure4Contains*****************'+NewMeasure4 + ' '+i);
                                        String Strs1 = ',\\"#1MeasureAPIs2#\\"';
                                        String Strs2 = ',\\"#1MeasureAPIs3#\\"';
                                        
                                        if(i == 2){
                                            JsonMethod = JsonMethod.replace(Strs1,'');
                                        }
                                        if(i==3){
                                            JsonMethod = JsonMethod.replace(Strs2,'');
                                        }
                                    }
                                }
                            }
                            if(RowNumber == 2){
                            JsonMethod = JsonMethod.replace('#'+RowNumber+'MeasureAPI'+i+'#',NewMeasure3);
                            }
                            
                             i = i+1; 
                        
                    }   
                    for(Integer L=i;J >= L;L++){
                        integer k = L;
                        if(K==2){
                           }
                       if(k==3){
                         }
                    }                   
                }
                
                
                if(DatasetRec.FilterLogic__c != null){ 
                    String[] FilterList = DatasetRec.FilterLogic__c.split(';');
                    System.debug('FilterList$$$$$$$$$$$ '+FilterList);
                    if(FilterList.size() > 0){
                        integer i = 1;
                        integer M = 0;
                        integer j = 3;
                        if(RowNumber == 1){
                            for(String Dim : FilterList){
                                integer k = i-1;
                                String[] newFilterlist = Dim.split(',');
                                  integer l = 1;
                                  System.debug('newFilterlist$$$$$$$$$$$ '+newFilterlist);
                                  for(String Str:newFilterlist){
                                        System.debug('Str$$$$$$$$$$$ "'+Str+'"');
                                        if(Str != null && Str != ''){
                                        decimal vars = decimal.valueof(Str.replace(' ',''))/100;
                                            System.debug('vars$$$$$$$$$$$ "'+vars+'"');
                                        JsonMethod =  JsonMethod.replace('\\"#'+i+'queryFiltersLabel'+ l+'#\\"',string.valueof(vars)); 
                                        }
                                        l=l+1;
                                  }
                                i = i+1;
                                M = M+1;
                            }
                        }
                        for(Integer L=i;J >= L;L++){  
                            integer k = L;
                           
                        } 
                    }                  
                } 
                else{
                	if(DimensionApi != Null){
                		if(DimensionApi.size() > 0)    
                    	JsonMethod =  JsonMethod.replace('#'+RowNumber+'queryFiltersLabel1#','All').replace('#'+RowNumber+'queryFiltersString1'+'#','\''+DimensionApi[0]+'\' in all');
                	}
                    integer j = 5;
                    for(Integer L=2;J >= L;L++){  
                        integer k = L;
                       
                    } 	
                }        
            }
         }    
        }
        String Strs = ',\\"#1MeasureAPIs1#\\"';
        String Strs1 = ',\\"#1MeasureAPIs2#\\"';
        String Strs2 = ',\\"#1MeasureAPIs3#\\"';
        JsonMethod = JsonMethod.replace(Strs,'').replace(Strs1,'').replace(Strs2,'');
        JsonMethod = JsonMethod.replace('}",   ]','}"]').replace('}",     ]','}"]');
        JsonMethod = JsonMethod.replace('}",  ]','}"]').replace('}", ]','}"]').replace('}",]','}"]');
        JsonMethod = JsonMethod.replace(', ;',';').replace(',  ;',';').replace(',   ;',';').replace(',    ;',';').replace(',     ;',';');
        JsonMethod = JsonMethod.replace('},  } } }','} } } }');
        JsonMethod = JsonMethod.replace('}, } } }','} } } }').replace('},} } }','} } } }').replace('},   } } }','} } } }');
        
		System.debug('^^^^^^^6688888888888888888' + JsonMethod);
		return JsonMethod;
     }
}