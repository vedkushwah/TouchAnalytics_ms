public with sharing class SnapshotKPI_JsonString {
    
     public static  string jsonMethod(list<Dataset__c> DatasetReclist,String DashboardName,String DashboardTitle,String DashboardDesc,String FolderId,string datevalue,String salesname) {   
        Sales_Insight__c Sales = [select id,Name,Sales_insight_String1__c,Sales_Insight_String2__c,Sales_Insight_String3__c from Sales_Insight__c where id= :salesname limit 1];                    
        String SalesString = Sales.Sales_insight_String1__c + Sales.Sales_Insight_String2__c + Sales.Sales_Insight_String3__c;
        system.debug('@@@@@@@@@@Pavan'+SalesString);
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
                     SalesString = SalesString.replace('#datelistlabel1#',datevalue).replace('#datelistalias1#',datevalue);
                     SalesString = SalesString.replace('#datelistlabel2#',datevalue).replace('#datelistalias2#',datevalue);
                     SalesString = SalesString.replace('#NewTitle#',DashboardName);
                    if(DatasetRec.Dataset_Id__c != NUll){
                        
                        SalesString =  SalesString.replace('#1DatasetAlias#',DatasetRec.Dataset_Name__c).replace('#1DatasetId#',DatasetRec.Dataset_Id__c);
                    }
                    SalesString = SalesString.replaceAll('\\s+\\s+','#testcode#'); 
					SalesString = SalesString.replaceAll('#testcode#',' ');
                 
                    if(Dimensions.Size() > 0){               
                        integer i = 1;  
                        integer j = 12;
                        for(String Dim : Dimensions){
                            integer k = i-1;
                           SalesString =  SalesString.replace('#label'+ i +'#',Dim).replace('#alias'+ i+'#',DimensionApi[k]);             
                           i = i+1;
                        }
                        for(Integer L=i;J >= L;L++){
                             integer k = L;
                             if(K == 12){
                                 String Dimens = ', "{\\"display\\":\\"#label'+k+'#\\",\\"value\\":\\"#alias'+k+'#\\",\\"expression\\":\\"\'#alias'+k+'#\'\\",\\"expression2\\":\\"coalesce(q1.\'#alias'+k+'#\',q2.\'#alias'+k+'#\') \\"}"';
                                  SalesString =  SalesString.replace(Dimens,'');
                                  
                                  
                            }
                            else{
                                  String Dimens = ', "{\\"display\\":\\"#label'+k+'#\\",\\"value\\":\\"#alias'+k+'#\\",\\"expression\\":\\"\'#alias'+k+'#\'\\",\\"expression2\\":\\"coalesce(q1.\'#alias'+k+'#\',q2.\'#alias'+k+'#\') \\"}"';
                                 
                                 SalesString =  SalesString.replace(Dimens,'');
                                 }
                            if(K == 2){
                                 String Dimens = ', "{\\"display\\":\\"#label'+k+'#\\",\\"value\\":\\"#alias'+k+'#\\",\\"expression\\":\\"\'#alias'+k+'#\'\\",\\"expression2\\":\\"coalesce(q1.\'#alias'+k+'#\',q2.\'#alias'+k+'#\')\\"}"';
                                 
                                 SalesString =  SalesString.replace(Dimens,'');
                            }
                            String Dims =  ', \'#alias'+k+'#\' as \'#label'+k+'#\'';
                            SalesString =  SalesString.replace(Dims,'');
                            String Dimen = 'q = filter q by {{column(Filter_'+k+'.selection, [\\\\\\"#alias'+k+'#\\\\\\"]).asEquality(\\\\\\"#alias'+k+'#\\\\\\")}};';
                            String DimenGrp = 'q = filter q by {{column(Grouping_'+k+'.selection, [\\\\\\"#alias'+k+'#\\\\\\"]).asEquality(\\\\\\"#alias'+k+'#\\\\\\")}};';
                            String Dimens1 = '"Filter_'+K+'": { "datasets": [{ "id": "#1DatasetId#", "name": "#1DatasetAlias#" }], "isFacet": true, "isGlobal": false, "query": { "query": "{\\"measures\\":[[\\"count\\",\\"*\\"]],\\"groups\\":[\\"{{cell(Static_Dimensions.selection,0,\\\\\\"alias'+K+'\\\\\\").asObject()}}\\"]}", "version": -1 }, "selectMode": "multi", "type": "aggregateflex", "useGlobal": false, "visualizationParameters": { "options": {} } },';
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
                            String StrNew;
                             if(k==12){
                                 Dimenval = '{ "colspan": 4, "column": 12, "name": "listselector_12", "row": 3, "rowspan": 1, "widgetStyle": { "borderEdges": [] } },';
                                 DimenFil1 = '"listselector_12": { "parameters": { "compact": false, "exploreLink": false, "instant": true, "measureField": "count", "step": "Filter_12", "title": "{{cell(Static_Dimensions.selection,0, \\"label12\\").asObject()}}" }, "type": "listselector" },';
                                 StrNew = '"listselector_12": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                
                                 } 
                              if(k==11){
                                 Dimenval = '{ "colspan": 4, "column": 8, "name": "listselector_10", "row": 3, "rowspan": 1, "widgetStyle": { "borderEdges": [] } },';
                                 DimenFil1 = '"listselector_10": { "parameters": { "compact": false, "exploreLink": false, "instant": true, "measureField": "count", "step": "Filter_11", "title": "{{cell(Static_Dimensions.selection,0, \\"label11\\").asObject()}}" }, "type": "listselector" },';
                                 StrNew = '"listselector_10": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                  System.debug('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$4'+DimenFil1);
                             } 
                              if(k==10){
                                 Dimenval = '{ "colspan": 4, "column": 4, "name": "listselector_7", "row": 3, "rowspan": 1, "widgetStyle": { "borderEdges": [] } },';
                                 DimenFil1 = '"listselector_7": { "parameters": { "compact": false, "exploreLink": false, "instant": true, "measureField": "count", "step": "Filter_10", "title": "{{cell(Static_Dimensions.selection,0, \\"label10\\").asObject()}}" }, "type": "listselector" },';
                                 StrNew = '"listselector_7": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                 System.debug('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$4'+DimenFil1);
                             }
                              if(k==9){
                                 Dimenval = '{ "colspan": 4, "column": 0, "name": "listselector_11", "row": 3, "rowspan": 1, "widgetStyle": { "borderEdges": [] } },';
                                 DimenFil1 = '"listselector_11": { "parameters": { "compact": false, "exploreLink": false, "instant": true, "measureField": "count", "step": "Filter_9", "title": "{{cell(Static_Dimensions.selection,0, \\"label9\\").asObject()}}" }, "type": "listselector" },';
                                 StrNew = '"listselector_11": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                             }  
                            if(k==8){
                            	DimenVal = '{ "colspan": 4, "column": 28, "name": "listselector_16", "row": 2, "rowspan": 1, "widgetStyle": { "borderEdges": [] } },';	
                                DimenFil1 = '"listselector_16": { "parameters": { "compact": false, "exploreLink": false, "instant": true, "measureField": "count", "step": "Filter_8", "title": "{{cell(Static_Dimensions.selection,0, \\"label8\\").asObject()}}" }, "type": "listselector" },';
                               StrNew = '"listselector_16": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            }
                            if(k==7){  
                            	DimenVal = '{ "colspan": 4, "column": 24, "name": "listselector_18", "row": 2, "rowspan": 1, "widgetStyle": { "borderEdges": [] } },';	
                            	DimenFil1 = '"listselector_18": { "parameters": { "compact": false, "exploreLink": false, "instant": true, "measureField": "count", "step": "Filter_7", "title": "{{cell(Static_Dimensions.selection,0, \\"label7\\").asObject()}}" }, "type": "listselector" },';
                                StrNew = '"listselector_18": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                }
                            if(k==6){
                            	DimenVal = '{ "colspan": 4, "column": 20, "name": "listselector_13", "row": 2, "rowspan": 1, "widgetStyle": { "borderEdges": [] } },';	
                            	DimenFil1 = '"listselector_13": { "parameters": { "compact": false, "exploreLink": false, "instant": true, "measureField": "count", "step": "Filter_6", "title": "{{cell(Static_Dimensions.selection,0, \\"label6\\").asObject()}}" }, "type": "listselector" },';
                                 StrNew = '"listselector_13": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                 }
                            if(k==5){
                            	DimenVal = '{ "colspan": 4, "column": 16, "name": "listselector_9", "row": 2, "rowspan": 1, "widgetStyle": { "borderEdges": [] } },';	
                            	DimenFil1 = '"listselector_9": { "parameters": { "compact": false, "exploreLink": false, "instant": true, "measureField": "count", "step": "Filter_5", "title": "{{cell(Static_Dimensions.selection,0, \\"label5\\").asObject()}}" }, "type": "listselector" },';
                                 StrNew = '"listselector_9": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                 }
                            if(k==4){
                            	DimenVal = '{ "colspan": 4, "column": 12, "name": "listselector_8", "row": 2, "rowspan": 1, "widgetStyle": { "borderEdges": [] } },';	
                            	DimenFil1 = '"listselector_8": { "parameters": { "compact": false, "exploreLink": false, "instant": true, "measureField": "count", "step": "Filter_4", "title": "{{cell(Static_Dimensions.selection,0, \\"label4\\").asObject()}}" }, "type": "listselector" },';
                                StrNew = '"listselector_8": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                }
                            if(k==3){
                            	DimenVal = '{ "colspan": 4, "column": 8, "name": "listselector_15", "row": 2, "rowspan": 1, "widgetStyle": { "borderEdges": [] } },';	
                            	DimenFil1 = '"listselector_15": { "parameters": { "compact": false, "exploreLink": false, "instant": true, "measureField": "count", "step": "Filter_3", "title": "{{cell(Static_Dimensions.selection,0, \\"label3\\").asObject()}}" }, "type": "listselector" },';
                                StrNew = '"listselector_15": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                }
                            if(k==2){
                            	DimenVal = '{ "colspan": 4, "column": 4, "name": "listselector_6", "row": 2, "rowspan": 1, "widgetStyle": { "borderEdges": [] } },';	
                            	DimenFil1 = '"listselector_6": { "parameters": { "compact": false, "exploreLink": false, "instant": true, "measureField": "count", "step": "Filter_2", "title": "{{cell(Static_Dimensions.selection,0, \\"label2\\").asObject()}}" }, "type": "listselector" },';
                               StrNew = '"listselector_6": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               }
                            if(k==1){    
                            	DimenVal = '"Filter_1": { "parameters": { "compact": false, "expanded": true, "exploreLink": false, "instant": true, "measureField": "count", "step": "Filter_1", "title": "#label1#" }, "type": "listselector" },';	
                            }
                            SalesString =  SalesString.replace(DimenVal,'').replace(DimenFil1,StrNew);
                        //    SalesString =  SalesString.replace(DimenFil4,'').replace(DimenVal5,'').replace(DimenFil6,'').replace(DimenFil7,'').replace(DimenFil2,'').replace(DimenFil3,'');
                        //    SalesString =  SalesString.replace(DimenFil8,'').replace(DimenFil9,'').replace(DimenFil10,'').replace(DimenFil11,'').replace(DimenFil12,'');
                            
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
                                	Str = '"dateselector_3": { "parameters": { "calendarTypeSwitchingAllowed": false, "defaultAbsoluteMode": true, "defaultFiscalMode": false, "instant": false, "modeSwitchingAllowed": true, "step": "Date_Filter_3", "title": "{{cell(Static_Dimensions.selection,0, \\"datelabel3\\").asObject()}}" }, "type": "dateselector" },';                                   
                                    Str1= '{ "colspan": 4, "column": 28, "name": "dateselector_3", "row": 3, "rowspan": 1, "widgetStyle": { "borderEdges": [] } },';
                                    StrNew = '"dateselector_3": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                }
                                if(K== 2){
                                	Str = '"dateselector_2": { "parameters": { "calendarTypeSwitchingAllowed": false, "defaultAbsoluteMode": true, "defaultFiscalMode": false, "instant": false, "modeSwitchingAllowed": true, "step": "Date_Filter_2", "title": "{{cell(Static_Dimensions.selection,0, \\"datelabel2\\").asObject()}}" }, "type": "dateselector" },';
                                	Str1= '{ "colspan": 4, "column": 24, "name": "dateselector_2", "row": 3, "rowspan": 1, "widgetStyle": { "borderEdges": [] } },';
                                    StrNew = '"dateselector_2": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                }
                                if(K== 1){
                                	Str = '"dateselector_1": { "parameters": { "calendarTypeSwitchingAllowed": false, "defaultAbsoluteMode": true, "defaultFiscalMode": false, "instant": false, "modeSwitchingAllowed": true, "step": "Date_Filter_1", "title": "{{cell(Static_Dimensions.selection,0, \\"datelabel1\\").asObject()}}" }, "type": "dateselector" },';
                                    Str1= '{ "colspan": 4, "column": 20, "name": "dateselector_1", "row": 3, "rowspan": 1, "widgetStyle": { "borderEdges": [] } },';
                                
                                }
                                
                             String DateString = ',\\"datevalue'+k+'\\": \\"\'#datealias'+k+'#\'\\",\\"datealias'+k+'\\": \\"#datealias'+k+'#\\",\\"datelabel'+k+'\\": \\"#datelabel'+k+'#\\"';  
                             SalesString =  SalesString.replace(Str,StrNew); 
                             SalesString =  SalesString.replace(Str1,'');
                            // System.debug('*************************************************** Date'+ Str3 +'&&&&'+Str4+'^^^^^'+Str5+'%%%%'+Str6);
                            // SalesString =  SalesString.replace(Str3,'').replace(Str4,'').replace(Str5,'').replace(Str6,'').replace(DateString,'');                                                            
                        }
                    }
                    else{                   
                       
                    }
                    
                     if(measureLabel.size() > 0){               
                      
                        integer i = 1;
                         integer j = 5;
                         
                         for(String Dim : measureLabel){ 
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
                            String NewValuesm;
                            String Str7;
                            if(K == 5){
                            	Str1 = ', "{\\"display\\": \\"#label'+k+'#\\",\\"value\\": \\"#alias'+k+'#\\",\\"expression\\": \\"\'#alias'+k+'#\'\\",\\"alias\\": \\"#alias'+k+'#\\"}"';
                               	Str2 = ', "{\\"display\\": \\"#1MeasureLabel5#\\",\\"cf\\": [\\"#1CompactMeasureAPI5#\\"],\\"expression\\": \\"#1ExpressionMeasureAPI5#\\",\\"alias\\": \\"#1MeasureAlias5#\\"}" ';
                                Newvaluesm = ', "{\\"display\\":\\"#1MeasureLabel5#\\",\\"cf\\":[\\"#1CompactMeasureAPI5#\\"],\\"expression\\":\\"coalesce(#1ExpressionMeasureAPI5#,0)\\",\\"expression2\\":\\"coalesce(#ExpressionqtwoAPI5#,0) - coalesce(#ExpressionqoneAPI5#,0)\\",\\"expression3\\":\\"coalesce(100*(coalesce(#ExpressionqtwoAPI5#,0) - coalesce(#ExpressionqoneAPI5#,0))/#ExpressionqoneAPI5#,0)\\",\\"alias\\":\\"#1MeasureAlias5#\\"}"';
                            
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
                            
                                Newvaluesm = ', "{\\"display\\":\\"#1MeasureLabel4#\\",\\"cf\\":[\\"#1CompactMeasureAPI3#\\"],\\"expression\\":\\"coalesce(#1ExpressionMeasureAPI3#,0)\\",\\"expression2\\":\\"coalesce(#ExpressionqtwoAPI4#,0) - coalesce(#ExpressionqoneAPI4#,0)\\",\\"expression3\\":\\"coalesce(100*(coalesce(#ExpressionqtwoAPI4#,0) - coalesce(#ExpressionqoneAPI4#,0))/ #ExpressionqoneAPI4#,0)\\",\\"alias\\":\\"#1MeasureAlias4#\\"}"';
                                Str7 = '"KPI_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            }
                            if(k == 3){
                            	Str3 = '"KPI_3": { "parameters": { "compact": true, "exploreLink": true, "measureField": "#measurealias3#", "numberColor": "#FFFFFF", "numberSize": 32, "step": "KPIs", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                               	Str4 = '{ "colspan": 3, "column": 9, "name": "KPI_3", "row": 3, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                               	Str5 = '{ "colspan": 2, "column": 2, "name": "KPI_3", "row": 7, "rowspan": 2, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                               	Str6 = '{ "colspan": 1, "column": 2, "name": "KPI_3", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                Newvaluesm = ', "{\\"display\\":\\"#1MeasureLabel3#\\",\\"cf\\":[\\"#1CompactMeasureAPI3#\\"],\\"expression\\":\\"coalesce(#1ExpressionMeasureAPI3#,0)\\",\\"expression2\\":\\"coalesce(#ExpressionqtwoAPI3#,0) - coalesce(#ExpressionqoneAPI3#,0)\\",\\"expression3\\":\\"coalesce(100*(coalesce(#ExpressionqtwoAPI3#,0) - coalesce(#ExpressionqoneAPI3#,0))/#ExpressionqoneAPI3#,0)\\",\\"alias\\":\\"#1MeasureAlias3#\\"}"';
                                Str7 = '"KPI_3": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            }
                            if(k == 2){
                            	Str3 = '"KPI_2": { "parameters": { "compact": true, "exploreLink": true, "measureField": "#measurealias2#", "numberColor": "#FFFFFF", "numberSize": 32, "step": "KPIs", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                               	Str4 = '{ "colspan": 3, "column": 6, "name": "KPI_2", "row": 3, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                               	Str5 = '{ "colspan": 2, "column": 4, "name": "KPI_2", "row": 4, "rowspan": 2, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                               	Str6 = '{ "colspan": 1, "column": 1, "name": "KPI_2", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                                Newvaluesm = ', "{\\"display\\":\\"#1MeasureLabel2#\\",\\"cf\\":[\\"#1CompactMeasureAPI2#\\"],\\"expression\\":\\"coalesce(#1ExpressionMeasureAPI2#,0)\\",\\"expression2\\":\\"coalesce(#ExpressionqtwoAPI2#,0) - coalesce(#ExpressionqoneAPI2#,0)\\",\\"expression3\\":\\"coalesce(100*(coalesce(#ExpressionqtwoAPI2#,0) - coalesce(#ExpressionqoneAPI2#,0))/#ExpressionqoneAPI2#,0)\\",\\"alias\\":\\"#1MeasureAlias2#\\"}"';
                                Str7 = '"KPI_2": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            }
                            String StrMeasure = ',\\"labelkpi'+k+'\\": \\"#1MeasureLabel'+k+'#\\",\\"expression'+k+'\\": \\"#1MeasureExpression'+k+'#\\",\\"cfkpi'+k+'\\": [\\"#1CompactMeasureAPI'+k+'#\\"],\\"aliaskpi'+k+'\\": \\"#1MeasureAlias'+k+'#\\"';                           
                        	String StrMeaure1 = ',\\"{{cell(Static_KPI.selection,0, \\\\\\"cfkpi'+k+'\\\\\\").asObject()}}\\"';
                        	String StrMeasure2 = ',{{row(Static_KPI.selection, [], [\\\\\\"expression'+k+'\\\\\\",\\\\\\"aliaskpi'+k+'\\\\\\"]).asProjection()}}';
                        		SalesString =  SalesString.replace(Newvaluesm,'');
                        	SalesString =  SalesString.replace(Str2,'').replace(StrMeasure,'').replace(StrMeaure1,'').replace(StrMeasure2,'');
                        	if(K != 5){
                        	SalesString =  SalesString.replace(Str3,Str7).replace(Str4,'').replace(Str5,'').replace(Str6,'').replace(Str1,'');
                        	}
                        
                          }
                         
                     }
                    
                    if(measureLabel.size() > 0){               
                      
                        integer i = 1;
                        integer j = 5;
                        for(String Dim : measureLabel){    
                            integer k = i-1;
                            String Str = '[\\"#1CompactMeasureAPI'+ i+'#\\"]';
                            String Meas = '#1ExpressionMeasureAPI4#';
                            String NewMeasure2 ;
                            String NewMeasure3 ;
                            String Newlabel;
                            String[] Newvarialbes = new String[]{};
                            if(MeasureAPI[k] == 'count()'){
                                Newlabel = Dim;
                                NewMeasure2 = 'count(q2)';
                                NewMeasure3 = 'count(q1)';
                                
                            }
                            else{
                                Newlabel = Dim;
                                NewMeasure2 = MeasureAPI[k].replace('(\'','(q2.\'');
                                NewMeasure3 = MeasureAPI[k].replace('(\'','(q1.\'');
                            }
                            
                            SalesString =  SalesString.replace('#1MeasureLabel'+ i+'#',Newlabel).replace('#1MeasureExpression'+ i+'#',MeasureAPI[k]).replace('#1MeasureAlias'+ i+'#',AliasMeasureAPI[k]).replace(Str,CompactMeasureAPI[k]).replace('#measurealias'+i+'#',AliasMeasureAPI[k]);  
                            SalesString =  SalesString.replace('#1ExpressionMeasureAPI'+i+'#',MeasureAPI[k]);
                            Salesstring = SalesString.replace('#ExpressionqoneAPI'+i+'#',NewMeasure3);
                            Salesstring = SalesString.replace('#ExpressionqtwoAPI'+i+'#',NewMeasure2);
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
                            String NewValuesm;
                           String Str7;
                            String Str8;
                            String Str9;
                            String Str10;
                            String Str11;
                            String Str12;
                             String Str13;
                            String Str14;
                            String Str15;
                            String Str16;
                            String StrChan;
                            String StrChan1;
                            String StrChan2;
                            String valeNew = ',\\"{{cell(Static_Measure_List.selection,0, \\\\\\"cfkpi'+k+'\\\\\\").asObject()}}\\"';
                            String valeNew1 = ', {{row(Static_Measure_List.selection, [], [\\\\\\"expression'+k+'\\\\\\",\\\\\\"aliaskpi'+k+'\\\\\\"]).asProjection()}}';
                            SalesString =  SalesString.replace(valeNew,'').replace(valeNew1,'');
                            if(K == 5){
                            	Str1 = ', "{\\"display\\": \\"#label'+k+'#\\",\\"value\\": \\"#alias'+k+'#\\",\\"expression\\": \\"\'#alias'+k+'#\'\\",\\"alias\\": \\"#alias'+k+'#\\"}"';
                               	Str2 = ', "{\\"display\\": \\"#1MeasureLabel5#\\",\\"cf\\": [\\"#1CompactMeasureAPI5#\\"],\\"expression\\": \\"#1ExpressionMeasureAPI5#\\",\\"alias\\": \\"#1MeasureAlias5#\\"}" ';
                               Newvaluesm = ', "{\\"display\\":\\"#1MeasureLabel5#\\",\\"cf\\":[\\"#1CompactMeasureAPI5#\\"],\\"expression\\":\\"coalesce(#1ExpressionMeasureAPI5#,0)\\",\\"expression2\\":\\"coalesce(coalesce(#ExpressionqtwoAPI1#,0)/#ExpressionqtwoAPI2#,0) - coalesce(coalesce(#ExpressionqoneAPI1#,0)/#ExpressionqoneAPI2#,0)\\",\\"expression3\\":\\"coalesce(100*(coalesce(coalesce(#ExpressionqtwoAPI1#,0)/#ExpressionqtwoAPI2#,0) - coalesce(coalesce(#ExpressionqoneAPI1#,0)/#ExpressionqoneAPI2#,0))/ coalesce(coalesce(#ExpressionqoneAPI1#,0)/#ExpressionqoneAPI2#,0),0)\\",\\"alias\\":\\"#1MeasureAlias5#\\"}"';
                               
                               Str7 = '({{coalesce(cell(Measure_2.result,0,\\\\\\"#1MeasureAlias5#\\\\\\"),0).asString()}} - {{coalesce(cell(Measure_1.result,0,\\\\\\"#1MeasureAlias5#\\\\\\"),0).asString()}}) as \'#1MeasureAlias5#\'';
                               Str8 = '100*({{coalesce(cell(Measure_2.result,0,\\\\\\"#1MeasureAlias5#\\\\\\"),0).asString()}} - {{coalesce(cell(Measure_1.result,0,\\\\\\"#1MeasureAlias5#\\\\\\"),0).asString()}})/{{coalesce(cell(Measure_1.result,0,\\\\\\"#1MeasureAlias5#\\\\\\"),1).asString()}} as \'#1MeasureAlias5#\'';
                               Str9 = ',[\\"#1CompactMeasureAPI5#\\"]';
                               Str10= '"number_13": { "parameters": { "compact": true, "exploreLink": true, "measureField": "#1MeasureAlias5#", "numberColor": "#335779", "numberSize": 24, "step": "Measure_1", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';  
                                Str11= '{ "colspan": 9, "column": 5, "name": "number_13", "row": 17, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(255, 255, 255, 0)", "borderColor": "#E6ECF2", "borderEdges": ["top"], "borderRadius": 0, "borderWidth": 1 } },';
                                Str12= '"number_14": { "parameters": { "compact": true, "exploreLink": true, "measureField": "#1MeasureAlias5#", "numberColor": "#335779", "numberSize": 24, "step": "Measure_2", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                                Str13= '{ "colspan": 9, "column": 14, "name": "number_14", "row": 17, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(255, 255, 255, 0)", "borderColor": "#E6ECF2", "borderEdges": ["top"], "borderRadius": 0, "borderWidth": 1 } },';
                                Str14= '"number_15": { "parameters": { "compact": false, "exploreLink": true, "measureField": "#1MeasureAlias5#", "numberColor": "#335779", "numberSize": 24, "step": "Measure_3", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                                Str15= '{ "colspan": 9, "column": 23, "name": "number_15", "row": 17, "rowspan": 1, "widgetStyle": { "backgroundColor": "rgba(255, 255, 255, 0)", "borderColor": "#E6ECF2", "borderEdges": ["top"], "borderRadius": 0, "borderWidth": 1 } },';
                                Str16= ',\\"labelkpi5\\":\\"#1MeasureLabel5#\\",\\"expression5\\":\\"coalesce(#1ExpressionMeasureAPI5#,0)\\",\\"cfkpi5\\":[\\"#1CompactMeasureAPI5#\\"],\\"aliaskpi5\\":\\"#1MeasureAlias5#\\"';
                                StrChan = '"number_13": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrChan1 = '"number_14": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrChan2 = '"number_15": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                          
                                
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
                            
                                Newvaluesm = ', "{\\"display\\":\\"#1MeasureLabel4#\\",\\"cf\\":[\\"#1CompactMeasureAPI4#\\"],\\"expression\\":\\"coalesce(#1ExpressionMeasureAPI4#,0)\\",\\"expression2\\":\\"coalesce(#ExpressionqtwoAPI4#,0) - coalesce(#ExpressionqoneAPI4#,0)\\",\\"expression3\\":\\"coalesce(100*(coalesce(#ExpressionqtwoAPI4#,0) - coalesce(#ExpressionqoneAPI4#,0))/ #ExpressionqoneAPI4#,0)\\",\\"alias\\":\\"#1MeasureAlias4#\\"}"';
                                Str7 = '{{coalesce(cell(Measure_2.result,0,\\\\\\"#1MeasureAlias4#\\\\\\"),0).asString()}} - {{coalesce(cell(Measure_1.result,0,\\\\\\"#1MeasureAlias4#\\\\\\"),0).asString()}} as \'#1MeasureAlias4#\',';
                                Str8 = '100*({{coalesce(cell(Measure_2.result,0,\\\\\\"#1MeasureAlias4#\\\\\\"),0).asString()}} - {{coalesce(cell(Measure_1.result,0,\\\\\\"#1MeasureAlias4#\\\\\\"),0).asString()}})/{{coalesce(cell(Measure_1.result,0,\\\\\\"#1MeasureAlias4#\\\\\\"),1).asString()}} as \'#1MeasureAlias4#\',';
                                Str9 = ',[\\"#1CompactMeasureAPI4#\\"]';
                                Str10= '"number_6": { "parameters": { "compact": true, "exploreLink": false, "measureField": "#1MeasureAlias4#", "numberColor": "#335779", "numberSize": 24, "step": "Measure_1", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                                Str11= '{ "colspan": 9, "column": 5, "name": "number_6", "row": 16, "rowspan": 1, "widgetStyle": { "borderEdges": ["top"] } },';
                                Str12= '"number_8": { "parameters": { "compact": true, "exploreLink": false, "measureField": "#1MeasureAlias4#", "numberColor": "#335779", "numberSize": 24, "step": "Measure_2", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                                Str13= '{ "colspan": 9, "column": 14, "name": "number_8", "row": 16, "rowspan": 1, "widgetStyle": { "borderEdges": ["top"] } },';
                                Str14= '"number_12": { "parameters": { "compact": true, "exploreLink": true, "measureField": "#1MeasureAlias4#", "numberColor": "#335779", "numberSize": 24, "step": "Measure_3", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                                Str15= '{ "colspan": 9, "column": 23, "name": "number_12", "row": 16, "rowspan": 1, "widgetStyle": { "borderEdges": ["top"] } },';
                                Str16= ',\\"labelkpi4\\":\\"#1MeasureLabel4#\\",\\"expression4\\":\\"coalesce(#1ExpressionMeasureAPI4#,0)\\",\\"cfkpi4\\":[\\"#1CompactMeasureAPI4#\\"],\\"aliaskpi4\\":\\"#1MeasureAlias4#\\"';
                               StrChan = '"number_6": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrChan1 = '"number_8": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrChan2 = '"number_12": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                           
                            }
                            if(k == 3){
                            	Str3 = '"KPI_3": { "parameters": { "compact": true, "exploreLink": true, "measureField": "#measurealias3#", "numberColor": "#FFFFFF", "numberSize": 32, "step": "KPIs", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                               	Str4 = '{ "colspan": 3, "column": 9, "name": "KPI_3", "row": 3, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                               	Str5 = '{ "colspan": 2, "column": 2, "name": "KPI_3", "row": 7, "rowspan": 2, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                               	Str6 = '{ "colspan": 1, "column": 2, "name": "KPI_3", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                            Newvaluesm = ', "{\\"display\\":\\"#1MeasureLabel3#\\",\\"cf\\":[\\"#1CompactMeasureAPI3#\\"],\\"expression\\":\\"coalesce(#1ExpressionMeasureAPI3#,0)-coalesce(#1ExpressionMeasureAPI2#,0)\\",\\"expression2\\":\\"(coalesce('+MeasureAPI[0].replace('(\'','(q1.\'')+',0)-coalesce(#ExpressionqtwoAPI2#,0)) - (coalesce('+MeasureAPI[0].replace('(\'','(q1.\'')+',0)-coalesce(#ExpressionqoneAPI2#,0))\\",\\"expression3\\":\\"coalesce(100*(((coalesce('+MeasureAPI[0].replace('(\'','(q1.\'')+',0)-coalesce(#ExpressionqtwoAPI2#,0)) - (coalesce('+MeasureAPI[0].replace('(\'','(q1.\'')+',0)-coalesce(#ExpressionqoneAPI2#,0)))/(coalesce('+MeasureAPI[0].replace('(\'','(q1.\'')+',0)-coalesce(#ExpressionqoneAPI2#,0))),0)\\",\\"alias\\":\\"#1MeasureAlias3#\\"}"';
                               Str7 = '{{coalesce(cell(Measure_2.result,0,\\\\\\"#1MeasureAlias3#\\\\\\"),0).asString()}} - {{coalesce(cell(Measure_1.result,0,\\\\\\"#1MeasureAlias3#\\\\\\"),0).asString()}} as \'#1MeasureAlias3#\',';
                               Str8 = '100*({{coalesce(cell(Measure_2.result,0,\\\\\\"#1MeasureAlias3#\\\\\\"),0).asString()}} - {{coalesce(cell(Measure_1.result,0,\\\\\\"#1MeasureAlias3#\\\\\\"),0).asString()}})/{{coalesce(cell(Measure_1.result,0,\\\\\\"#1MeasureAlias3#\\\\\\"),1).asString()}} as \'#1MeasureAlias3#\',';
                               Str9 = ',[\\"#1CompactMeasureAPI3#\\"]';
                               Str10= '"number_2": { "parameters": { "compact": true, "exploreLink": false, "measureField": "#1MeasureAlias3#", "numberColor": "#335779", "numberSize": 24, "step": "Measure_1", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                                Str11= '{ "colspan": 9, "column": 5, "name": "number_2", "row": 15, "rowspan": 1, "widgetStyle": { "borderEdges": ["top"] } },';
                                Str12= '"number_4": { "parameters": { "compact": true, "exploreLink": false, "measureField": "#1MeasureAlias3#", "numberColor": "#335779", "numberSize": 24, "step": "Measure_2", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                                Str13= '{ "colspan": 9, "column": 14, "name": "number_4", "row": 15, "rowspan": 1, "widgetStyle": { "borderEdges": ["top"] } },';
                                Str14= '"number_11": { "parameters": { "compact": true, "exploreLink": true, "measureField": "#1MeasureAlias3#", "numberColor": "#335779", "numberSize": 24, "step": "Measure_3", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                                Str15= '{ "colspan": 9, "column": 23, "name": "number_11", "row": 15, "rowspan": 1, "widgetStyle": { "borderEdges": ["top"] } },';
                                Str16= ',\\"labelkpi3\\":\\"#1MeasureLabel3#\\",\\"expression3\\":\\"coalesce(#1ExpressionMeasureAPI3#,0)\\",\\"cfkpi3\\":[\\"#1CompactMeasureAPI3#\\"],\\"aliaskpi3\\":\\"#1MeasureAlias3#\\"';
                                 StrChan = '"number_2": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrChan1 = '"number_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrChan2 = '"number_11": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                           
                            }
                            if(k == 2){
                            	Str3 = '"KPI_2": { "parameters": { "compact": true, "exploreLink": true, "measureField": "#measurealias2#", "numberColor": "#FFFFFF", "numberSize": 32, "step": "KPIs", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                               	Str4 = '{ "colspan": 3, "column": 6, "name": "KPI_2", "row": 3, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                               	Str5 = '{ "colspan": 2, "column": 4, "name": "KPI_2", "row": 4, "rowspan": 2, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                               	Str6 = '{ "colspan": 1, "column": 1, "name": "KPI_2", "row": 7, "rowspan": 1, "widgetStyle": { "backgroundColor": "#335779", "borderColor": "#E6ECF2", "borderEdges": [], "borderRadius": 0, "borderWidth": 1 } },';
                            Newvaluesm = ', "{\\"display\\":\\"#1MeasureLabel2#\\",\\"cf\\":[\\"#1CompactMeasureAPI2#\\"],\\"expression\\":\\"coalesce(#1ExpressionMeasureAPI2#,0)\\",\\"expression2\\":\\"coalesce(#ExpressionqtwoAPI2#,0) - coalesce(#ExpressionqoneAPI2#,0)\\",\\"expression3\\":\\"coalesce(100*(coalesce(#ExpressionqtwoAPI2#,0) - coalesce(#ExpressionqoneAPI2#,0))/#ExpressionqoneAPI2#,0)\\",\\"alias\\":\\"#1MeasureAlias2#\\"}"';
                             Str7 = '{{coalesce(cell(Measure_2.result,0,\\\\\\"#1MeasureAlias2#\\\\\\"),0).asString()}} - {{coalesce(cell(Measure_1.result,0,\\\\\\"#1MeasureAlias2#\\\\\\"),0).asString()}} as \'#1MeasureAlias2#\',';
                             Str8 = '100*({{coalesce(cell(Measure_2.result,0,\\\\\\"#1MeasureAlias2#\\\\\\"),0).asString()}} - {{coalesce(cell(Measure_1.result,0,\\\\\\"#1MeasureAlias2#\\\\\\"),0).asString()}})/{{coalesce(cell(Measure_1.result,0,\\\\\\"#1MeasureAlias2#\\\\\\"),1).asString()}} as \'#1MeasureAlias2#\',';
                             Str9 = ',[\\"#1CompactMeasureAPI2#\\"]';
                                Str10= '"number_5": { "parameters": { "compact": true, "exploreLink": false, "measureField": "#1MeasureAlias2#", "numberColor": "#335779", "numberSize": 24, "step": "Measure_1", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                                Str11= '{ "colspan": 9, "column": 5, "name": "number_5", "row": 14, "rowspan": 1, "widgetStyle": { "borderEdges": ["top"] } },';
                                Str12= '"number_7": { "parameters": { "compact": true, "exploreLink": false, "measureField": "#1MeasureAlias2#", "numberColor": "#335779", "numberSize": 24, "step": "Measure_2", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                                Str13='{ "colspan": 9, "column": 14, "name": "number_7", "row": 14, "rowspan": 1, "widgetStyle": { "borderEdges": ["top"] } },';
                                Str14='"number_10": { "parameters": { "compact": true, "exploreLink": true, "measureField": "#1MeasureAlias2#", "numberColor": "#335779", "numberSize": 24, "step": "Measure_3", "textAlignment": "center", "title": "", "titleColor": "#335779", "titleSize": 16 }, "type": "number" },';
                                Str15='{ "colspan": 9, "column": 23, "name": "number_10", "row": 14, "rowspan": 1, "widgetStyle": { "borderEdges": ["top"] } },';
                                Str16=',\\"labelkpi2\\":\\"#1MeasureLabel2#\\",\\"expression2\\":\\"coalesce(#1ExpressionMeasureAPI2#,0)\\",\\"cfkpi2\\":[\\"#1CompactMeasureAPI2#\\"],\\"aliaskpi2\\":\\"#1MeasureAlias2#\\"';
                                StrChan = '"number_5": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrChan1 = '"number_7": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                StrChan2 = '"number_10": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                           
                                
                            }
                            String StrMeasure = ',\\"labelkpi'+k+'\\": \\"#1MeasureLabel'+k+'#\\",\\"expression'+k+'\\": \\"#1MeasureExpression'+k+'#\\",\\"cfkpi'+k+'\\": [\\"#1CompactMeasureAPI'+k+'#\\"],\\"aliaskpi'+k+'\\": \\"#1MeasureAlias'+k+'#\\"';                           
                        	String StrMeaure1 = ',\\"{{cell(Static_KPI.selection,0, \\\\\\"cfkpi'+k+'\\\\\\").asObject()}}\\"';
                        	String StrMeasure2 = ',{{row(Static_KPI.selection, [], [\\\\\\"expression'+k+'\\\\\\",\\\\\\"aliaskpi'+k+'\\\\\\"]).asProjection()}}';
                        	SalesString =  SalesString.replace(Str2,'').replace(StrMeasure,'').replace(StrMeaure1,'').replace(StrMeasure2,'');
                        	if(K != 5){
                        	SalesString =  SalesString.replace(Str3,'').replace(Str4,'').replace(Str5,'').replace(Str6,'').replace(Str1,'');
                        	}
                        	SalesString =  SalesString.replace(Newvaluesm,'').replace(Str7,'').replace(Str8,'').replace(Str9,'');
                        	SalesString =  SalesString.replace(Str10,StrChan).replace(Str11,'').replace(Str12,StrChan1).replace(Str13,'').replace(Str14,StrChan2).replace(Str15,'').replace(Str16,'');
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
                    
                    
                    
                    if(DashboardDesc != Null && DashboardDesc != '')
                    SalesString =  SalesString.replace('Dashboard Description',DashboardDesc); 
                    if(DashboardTitle != Null && DashboardTitle != '')
                    SalesString =  SalesString.replace('Dashboard Title',DashboardName); 
                    if(DashboardDesc != Null && DashboardDesc != '')
                    SalesString =  SalesString.replace('Snapshot Trendingtwo',DashboardName);  
                    if(FolderId != Null && FolderId != '')
                     SalesString =  SalesString.replace('#NewFolderId#',FolderId);                        
     }
        SalesString = SalesString.replace('}",   ]','}"]').replace('}",     ]','}"]');
        SalesString = SalesString.replace('}",  ]','}"]').replace('}", ]','}"]').replace('}",]','}"]');
        SalesString = SalesString.replace(', ;',';').replace(',  ;',';').replace(',   ;',';').replace(',    ;',';').replace(',     ;',';');
		SalesString = SalesString.replace('null','');
		SalesString = SalesString.replace('"mode": "variable"','"mode": "fittocontainer"');
		SalesString = SalesString.replace('"mode":"variable"','"mode": "fittocontainer"');
		SalesString = SalesString.replace('"maxColumnWidth": 300,','');
		
		SalesString = SalesString.replace('"minColumnWidth": 40,','');
        SalesString = SalesString.replace('"'+Sales.Name+'"','"'+DashboardName+'"');
		System.debug('^^^^^^^6688888888888888888' + SalesString);
		
		return SalesString;
     }
     
}