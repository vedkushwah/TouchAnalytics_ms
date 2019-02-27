public with sharing class Json_Overview_String {
     public static  string jsonMethod(String DashboardId,list<String> FolderId,String SalesNames) { 
     	
        boolean Rownumberone = false;
        boolean Rownumbertwo = false ;
        boolean RowNumberthree = false;  
        Json_class__c JsonRec =  [select id,Json1__c,Json_String__c,Json_Pillbox__c,Json_String_Toggle__c,Json_Full_pillbox__c,Json_Pillbox_comma__c,Json_Pillbox1__c,Json_Pillbox2__c,Json_Section1__c,Json_Section2__c,Json_section3__c,
                                            Json_Measure__c,Json_listselector__c,Json_ListSelector1__c,Json_Selector_Date__c,Json_listselector_Date2__c,Json_KPI__c,Json_Number__c,Json_Number1__c,   Json_list_Measure__c,
                                            Json_List_Selector2__c,Json_Selector3__c,Json_MeasureLabel_Delete__c,Success_Filter1__c,Success_Filter2__c,Success_Filter3__c,Success_Filter4__c,Success_Filter5__c,
                                            Json_Measure_List__c,Json_FilterLabel_Delete__c,Sales_Filter1__c,Sales_Filter2__c,Sales_Filter3__c,Sales_Filter4__c,Sales_Filter5__c,
                                            Json_Pillbox5__c,Json_KPI_1__c,Market__c,Market_Filter1__c,Market_Filter2__c,Market_Filter3__c,Market_Filter4__c,
                                            Json_Selector38__c,Filter5_deleted__c,Chart_Delete_marketing__c,Chart_Delete_marketing1__c,Json_Static_Measure__c,List_Selector35__c,Chart_Delete_Success__c,Chart_Delete_Success1__c,
                                            Json2__c,Json_KPI_2__c,Chart_Delete_Row__c,Json3__c,Success_KPI_1__c,Success_Timeline__c,Json4__c,Success_KPI_2__c,Sales_Timeline__c,Json_Del__c,Success_KPI_3__c,Marketing_Timeline__c,Json_Filter__c,Success_KPI_4__c,Json_Last_Dataset__c,Success_KPI_5__c,
                                            Json_Filter_Remove__c,Chart_Delete__c
                                            from Json_class__c where Id = :SalesNames limit 1];
                                            
                                            
        list<Dataset__c> DatsetList = [select id,Data_API__c,RowNumber__c,Dataset_Id__c, Date_Label__c, Filter_Logics__c,Measure_API__c,Measure_Name__c,Dataset_Name__c,FilterName__c,
                                              Dimension_Api__c,Dimension_Name__c,AliasMeasure_API__c,CompactMeasure_API__c,New_Dimension_Name__c,New_Dimension_API__c
                                              from Dataset__c where Session_Id__c =: FolderId[4] order by RowNumber__c]; 
                                            
       //  system.debug('DatsetList *********'+ DatsetList);  
       //  system.debug(' FolderId[4] *********'+  FolderId[4]);  
        //String JsonMethod =  JsonRec.Json1__c + JsonRec.Json2__c + JsonRec.Json3__c; 
        
        integer RowNumber = 1;
        integer RowNumber1 = 1;
        set<String> NewSet = new set<String>();
        list<String> Newlist = new list<String>();
        Map<String,String> NewMap= new Map<String,String>();  
        
        set<String> AllRownumbers = new set<String>();
        for(Dataset__c DatasetRec : DatsetList){
            AllRownumbers.add(String.valueof(DatasetRec.Rownumber__c));
        }
        
        
       
        String JsonMethod =  JsonRec.Json_String__c + JsonRec.Json1__c + JsonRec.Json2__c + JsonRec.Json3__c;
        
        //system.debug('@@@@@@@@@@@@@@@'+JsonMethod);
        if(DashboardId != Null && DashboardId != '')
        JsonMethod =  JsonMethod.replace('New Multi-KPI Dashboard Overview',DashboardId);
        if(FolderId[0] != Null && FolderId[0] != '')
        JsonMethod =  JsonMethod.replace('00l36000000PcfKAAS',FolderId[0]);
        if(FolderId[1] != Null && FolderId[1] != '')
        JsonMethod =  JsonMethod.replace('Sales Insights',FolderId[1]);
        JsonMethod =  JsonMethod.replace('Command Overview Drill-in #1',FolderId[1]);
        
        
        if(FolderId[2] != Null && FolderId[2] != ''){
            JsonMethod =  JsonMethod.replace('Success Insights',FolderId[2]);
            JsonMethod =  JsonMethod.replace('Command Overview Drill-in #1',FolderId[2]);
        }
        else{
          JsonMethod =  JsonMethod.replace('Success Insights','Dashboard 2');  
        }
        if(FolderId[3] != Null && FolderId[3] != ''){
            JsonMethod =  JsonMethod.replace('Marketing Insights',FolderId[3]);
            JsonMethod =  JsonMethod.replace('Command Overview Drill-in #1',FolderId[3]);
        }
        else{
          JsonMethod =  JsonMethod.replace('Marketing Insights','Dashboard 3');  
        }
        
        system.debug('FolderId @@@@@@@@@@@@@@@'+FolderId);
        if(FolderId.size() >5){
            if(FolderId[5] != Null && FolderId[5] != ''){
                JsonMethod =  JsonMethod.replace('0FK36000000UlKpGAK',FolderId[5]);
            }
        }
        if(FolderId.size() >6){
            if(FolderId[6] != Null && FolderId[6] != ''){
                JsonMethod =  JsonMethod.replace('0FK36000000UlJmGAK',FolderId[6]);
            }
        }
        if(FolderId.size() >7){
            if(FolderId[7] != Null && FolderId[7] != ''){
                JsonMethod =  JsonMethod.replace('0FK36000000UlJrGAK',FolderId[7]);
            }
        }
        
        for(integer RowNumberlist=1;RowNumberlist<=15;RowNumberlist++){
         if(AllRownumbers.contains(String.valueof(RowNumberlist))){     
         for(Dataset__c DatasetRec : DatsetList){           
            RowNumber = Integer.valueof(DatasetRec.Rownumber__c);
                String[] DimensionApi;
                String[] Dimensions;
                if(DatasetRec.Dimension_Name__c != null && DatasetRec.Dimension_Name__c != ''){             
                     Dimensions = DatasetRec.Dimension_Name__c.Split(',');
                     DimensionApi = DatasetRec.Dimension_Api__c.Split(',');
                }
                else{
                    Dimensions = DatasetRec.New_Dimension_Name__c.Split(',');
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
                Map<String,String> DimensionLabel = new Map<String,String>();
                if(DatasetRec.Dataset_Id__c != null && DatasetRec.Dataset_Id__c != '') {  
                                            
                    JsonMethod =  JsonMethod.replace('#'+RowNumber+'datasetId#',DatasetRec.Dataset_Id__c);
                
                }
                
                if(DatasetRec.Dataset_Name__c != null && DatasetRec.Dataset_Name__c != '') {
                    JsonMethod =  JsonMethod.replace('#'+RowNumber+'datasetAlias#',DatasetRec.Dataset_Name__c);
                    if(DatasetRec.RowNumber__c == 1){
                    	JsonMethod =  JsonMethod.replace('#1datasetAlias#',DatasetRec.Dataset_Name__c);	
                    }
                    else if(DatasetRec.RowNumber__c == 6){
                    	JsonMethod =  JsonMethod.replace('#1datasetAlias#',DatasetRec.Dataset_Name__c);	
                    }
                    else if(DatasetRec.RowNumber__c == 11){
                    	JsonMethod =  JsonMethod.replace('#1datasetAlias#',DatasetRec.Dataset_Name__c);	   
                    }
                } 
                
                if(Datelabel.size() > 0){
                    integer i = 1;
                    integer j = 3;
                    for(String Datelab : DateLabel){
                        integer k = i-1;            
                        JsonMethod =  JsonMethod.replace('#'+RowNumber+'DateLabel'+ i +'#',Datelab);
                        JsonMethod =  JsonMethod.replace('#'+RowNumber+'DateAPI'+ i+'#',DateApi[k]); 
                        if(DatasetRec.RowNumber__c == 1){
                        	JsonMethod =  JsonMethod.replace('#1DateLabelEdit1#',DateApi[0]);
                        }
                        else if(DatasetRec.RowNumber__c == 6){
                        	JsonMethod =  JsonMethod.replace('#1DateLabelEdit1#',DateApi[0]);
                        }
                        else if(DatasetRec.RowNumber__c == 11){
                        	JsonMethod =  JsonMethod.replace('#1DateLabelEdit1#',DateApi[0]);
                        }
                       
                        i = i+1;
                    }
                    for(Integer L=i;J >= L;L++){
                        integer k = L;
                        if(K == 3){
                                JsonRec.Json_Section2__c = JsonRec.Json_Section2__c.Replace('DateLabel',RowNumber+'DateLabel'+k).replace('}",','}"').Replace('DateAPI',RowNumber+'DateAPI'+k);
                                 JsonMethod =  JsonMethod.replace(JsonRec.Json_Section2__c,''); 
                                JsonRec.Json_Section2__c = JsonRec.Json_Section2__c.Replace(RowNumber+'DateLabel'+k,'DateLabel').replace('}"','}",').Replace(RowNumber+'DateAPI'+k,'DateAPI');
                            
                        }
                        else{
                                JsonRec.Json_Section2__c = JsonRec.Json_Section2__c.Replace('DateLabel',RowNumber+'DateLabel'+k).Replace('DateAPI',RowNumber+'DateAPI'+k);
                                 JsonMethod =  JsonMethod.replace(JsonRec.Json_Section2__c,''); 
                                JsonRec.Json_Section2__c = JsonRec.Json_Section2__c.Replace(RowNumber+'DateLabel'+k,'DateLabel').Replace(RowNumber+'DateAPI'+k,'DateAPI');                           
                        }                   
                    }
                }
                
                if(measureLabel.size() > 0){                                        
                    integer i = 1;
                    integer j = 5;
                    for(String Dim : measureLabel){
                            integer k = i-1;
                            String Str = '\\"#'+RowNumber+'CompactMeasureAPI'+ i+'#\\"';
                            JsonMethod =  JsonMethod.replace('#'+RowNumber+'MeasureLabel'+ i+'#',Dim);
                            JsonMethod =  JsonMethod.replace('#'+RowNumber+'ExpressionMeasureAPI'+ i+'#',MeasureAPI[k]); 
                            JsonMethod =  JsonMethod.replace('#'+RowNumber+'AliasMeasureAPI'+ i+'#',AliasMeasureAPI[k]); 
                            JsonMethod =  JsonMethod.replace(Str,CompactMeasureAPI[k]);     
                            i = i+1;     
                        
                    }   
                    for(Integer L=i;J >= L;L++){
                        integer k = L;
                        if(K == 5){
                            jsonRec.Json_MeasureLabel_Delete__c = jsonRec.Json_MeasureLabel_Delete__c.replace('MeasureLabel',RowNumber+'MeasureLabel'+k).replace('}",','}"').replace('ExpressionMeasureAPI',RowNumber+'ExpressionMeasureAPI'+k).replace('AliasMeasureAPI',RowNumber+'AliasMeasureAPI'+k).replace('CompactMeasureAPI',RowNumber+'CompactMeasureAPI'+k);
                            jsonMethod =  jsonMethod.replace(jsonRec.Json_MeasureLabel_Delete__c,'');
                            jsonRec.Json_MeasureLabel_Delete__c = jsonRec.Json_MeasureLabel_Delete__c.replace(RowNumber+'MeasureLabel'+k,'MeasureLabel').replace('}"','}",').replace(RowNumber+'ExpressionMeasureAPI'+k,'ExpressionMeasureAPI').replace(RowNumber+'AliasMeasureAPI'+k,'AliasMeasureAPI').replace(RowNumber+'CompactMeasureAPI'+k,'CompactMeasureAPI');
                        }
                        else{
                            jsonRec.Json_MeasureLabel_Delete__c = jsonRec.Json_MeasureLabel_Delete__c.replace('MeasureLabel',RowNumber+'MeasureLabel'+k).replace('ExpressionMeasureAPI',RowNumber+'ExpressionMeasureAPI'+k).replace('AliasMeasureAPI',RowNumber+'AliasMeasureAPI'+k).replace('CompactMeasureAPI',RowNumber+'CompactMeasureAPI'+k);
                            jsonMethod =  jsonMethod.replace(jsonRec.Json_MeasureLabel_Delete__c,'');
                            jsonRec.Json_MeasureLabel_Delete__c = jsonRec.Json_MeasureLabel_Delete__c.replace(RowNumber+'MeasureLabel'+k,'MeasureLabel').replace(RowNumber+'ExpressionMeasureAPI'+k,'ExpressionMeasureAPI').replace(RowNumber+'AliasMeasureAPI'+k,'AliasMeasureAPI').replace(RowNumber+'CompactMeasureAPI'+k,'CompactMeasureAPI');
                        }
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
                            JsonMethod =  JsonMethod.replace('#'+RowNumber+'queryFiltersLabel'+ i+'#',Filtervalues[M]);
                            JsonMethod =  JsonMethod.replace('#'+RowNumber+'queryFiltersString'+ i+'#',Dim);    
                            i = i+1;
                            M = M+1;
                        }
                        for(Integer L=i;J >= L;L++){  
                            integer k = L;
                            if(K == 5){
                                JsonRec.Json_FilterLabel_Delete__c = JsonRec.Json_FilterLabel_Delete__c.replace('queryFiltersLabel',RowNumber+'queryFiltersLabel'+k).replace('}",','}"').replace('queryFiltersString',RowNumber+'queryFiltersString'+k);
                                JsonMethod =  JsonMethod.replace(JsonRec.Json_FilterLabel_Delete__c,'');
                                JsonRec.Json_FilterLabel_Delete__c = JsonRec.Json_FilterLabel_Delete__c.replace(RowNumber+'queryFiltersLabel'+k,'queryFiltersLabel').replace('}"','}",').replace(RowNumber+'queryFiltersString'+k,'queryFiltersString');
                            }
                            else{
                                JsonRec.Json_FilterLabel_Delete__c = JsonRec.Json_FilterLabel_Delete__c.replace('queryFiltersLabel',RowNumber+'queryFiltersLabel'+k).replace('queryFiltersString',RowNumber+'queryFiltersString'+k);
                                JsonMethod =  JsonMethod.replace(JsonRec.Json_FilterLabel_Delete__c,'');
                                JsonRec.Json_FilterLabel_Delete__c = JsonRec.Json_FilterLabel_Delete__c.replace(RowNumber+'queryFiltersLabel'+k,'queryFiltersLabel').replace(RowNumber+'queryFiltersString'+k,'queryFiltersString');
                            }
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
                        if(K == 5){
                            JsonRec.Json_FilterLabel_Delete__c = JsonRec.Json_FilterLabel_Delete__c.replace('queryFiltersLabel',RowNumber+'queryFiltersLabel'+k).replace('}",','}"').replace('queryFiltersString',RowNumber+'queryFiltersString'+k);
                            JsonMethod =  JsonMethod.replace(JsonRec.Json_FilterLabel_Delete__c,'');
                            JsonRec.Json_FilterLabel_Delete__c = JsonRec.Json_FilterLabel_Delete__c.replace(RowNumber+'queryFiltersLabel'+k,'queryFiltersLabel').replace('}"','}",').replace(RowNumber+'queryFiltersString'+k,'queryFiltersString');
                        }
                        else{
                            JsonRec.Json_FilterLabel_Delete__c = JsonRec.Json_FilterLabel_Delete__c.replace('queryFiltersLabel',RowNumber+'queryFiltersLabel'+k).replace('queryFiltersString',RowNumber+'queryFiltersString'+k);
                            JsonMethod =  JsonMethod.replace(JsonRec.Json_FilterLabel_Delete__c,'');
                            JsonRec.Json_FilterLabel_Delete__c = JsonRec.Json_FilterLabel_Delete__c.replace(RowNumber+'queryFiltersLabel'+k,'queryFiltersLabel').replace(RowNumber+'queryFiltersString'+k,'queryFiltersString');
                        }
                    } 	
                }        
            }
         }    
            else{
                         RowNumber = RowNumberlist;
                         if(RowNumber == 11){
                            JsonMethod =  JsonMethod.remove(JsonRec.Marketing_Timeline__c);
                            JsonMethod =  JsonMethod.remove(JsonRec.Chart_Delete_marketing__c);
                            JsonMethod =  JsonMethod.remove(JsonRec.Chart_Delete_marketing1__c);
                         }
                         if(RowNumber == 6){
                            JsonMethod =  JsonMethod.remove(JsonRec.Success_Timeline__c);
                            JsonMethod =  JsonMethod.remove(JsonRec.Chart_Delete_Success__c);
                            JsonMethod =  JsonMethod.remove(JsonRec.Chart_Delete_Success1__c);
                         }
                            if(RowNumber == 1){
                            JsonMethod =  JsonMethod.remove(JsonRec.Sales_Timeline__c);
                            }
                            if(RowNumber == 1 || RowNumber == 2 || RowNumber == 3 ||  RowNumber == 4 || RowNumber == 5){                       
                            jsonRec.Json_Measure__c = JsonRec.Json_Measure__c.Replace('#sectionName#','Static_Sales_Timeline_'+ RowNumber);
                            jsonRec.Json_Measure__c = JsonRec.Json_Measure__c.Replace('%RowNumber%#DateLabel1#','#'+RowNumber+'DateLabel1#').Replace('%RowNumber%#DateAPI1#','#'+RowNumber+'DateAPI1#').Replace('%RowNumber%#DateLabel2#','#'+RowNumber+'DateLabel2#').Replace('%RowNumber%#DateAPI2#','#'+RowNumber+'DateAPI2#').Replace('%RowNumber%#DateLabel3#','#'+RowNumber+'DateLabel3#').Replace('%RowNumber%#DateAPI3#','#'+RowNumber+'DateAPI3#');
                            JsonMethod =  JsonMethod.Remove(jsonRec.Json_Measure__c);  
                            jsonRec.Json_Measure__c = JsonRec.Json_Measure__c.Replace('Static_Sales_Timeline_'+ RowNumber,'#sectionName#');
                            jsonRec.Json_Measure__c = JsonRec.Json_Measure__c.Replace('#'+RowNumber+'DateLabel1#','%RowNumber%#DateLabel1#').Replace('#'+RowNumber+'DateAPI1#','%RowNumber%#DateAPI1#').Replace('#'+RowNumber+'DateLabel2#','%RowNumber%#DateLabel2#').Replace('#'+RowNumber+'DateAPI2#','%RowNumber%#DateAPI2#').Replace('#'+RowNumber+'DateLabel3#','%RowNumber%#DateLabel3#').Replace('#'+RowNumber+'DateAPI3#','%RowNumber%#DateAPI3#'); 
                            String Numbers;
                            if(RowNumber == 1){
                              Numbers = String.valueof(RowNumber + 49);
                            }                            
                            if(RowNumber == 2){
                              Numbers = String.valueof(RowNumber + 47);
                            }
                            if(RowNumber == 3 || RowNumber == 4 || RowNumber == 5){
                              Numbers = String.valueof(RowNumber + 48);
                            }
                            
                            String RowNubers = String.valueof(RowNumber);    
                            String Row = String.valueof(RowNumber + 4);
                            JsonRec.Json_Selector_Date__c  = JsonRec.Json_Selector_Date__c.Replace('#Selector#','listselector_'+ Numbers).Replace('"row": #RowNumber#','"row": '+Row) ;
                          JsonMethod =  JsonMethod.Remove(JsonRec.Json_Selector_Date__c);
                          JsonRec.Json_Selector_Date__c  = JsonRec.Json_Selector_Date__c.Replace('listselector_'+ Numbers,'#Selector#').Replace('"row": '+Row,'"row": #RowNumber#') ;
                          JsonRec.Json_listselector_Date2__c  = JsonRec.Json_listselector_Date2__c.Replace('#Selector#','listselector_'+ Numbers).Replace('#Timelines#','Static_Sales_Timeline_'+ RowNubers) ;
                          String pillStrNewd = '"listselector_'+Numbers+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                          JsonMethod =  JsonMethod.replace(JsonRec.Json_listselector_Date2__c,pillStrNewd);
                          JsonRec.Json_listselector_Date2__c  = JsonRec.Json_listselector_Date2__c.Replace('listselector_'+ Numbers,'#Selector#').Replace('Static_Sales_Timeline_'+RowNubers,'#Timelines#') ;  
                            
                                                           
                    }
                    if(RowNumber == 6 || RowNumber == 7 || RowNumber == 8 ||  RowNumber == 9 || RowNumber == 10){                     
                            String Numbers = String.valueof(RowNumber-5);
                            jsonRec.Json_Measure__c = JsonRec.Json_Measure__c.Replace('#sectionName#','Static_Success_Timeline_'+ Numbers).Replace('%RowNumber%#DateLabel1#','#'+RowNumber+'DateLabel1#').Replace('%RowNumber%#DateAPI1#','#'+RowNumber+'DateAPI1#').Replace('%RowNumber%#DateLabel2#','#'+RowNumber+'DateLabel2#').Replace('%RowNumber%#DateAPI2#','#'+RowNumber+'DateAPI2#').Replace('%RowNumber%#DateLabel3#','#'+RowNumber+'DateLabel3#').Replace('%RowNumber%#DateAPI3#','#'+RowNumber+'DateAPI3#');
                            JsonMethod =  JsonMethod.Remove(jsonRec.Json_Measure__c); 
                            jsonRec.Json_Measure__c = JsonRec.Json_Measure__c.Replace('Static_Success_Timeline_'+ Numbers,'#sectionName#').Replace('#'+RowNumber+'DateLabel1#','%RowNumber%#DateLabel1#').Replace('#'+RowNumber+'DateAPI1#','%RowNumber%#DateAPI1#').Replace('#'+RowNumber+'DateLabel2#','%RowNumber%#DateLabel2#').Replace('#'+RowNumber+'DateAPI2#','%RowNumber%#DateAPI2#').Replace('#'+RowNumber+'DateLabel3#','%RowNumber%#DateLabel3#').Replace('#'+RowNumber+'DateAPI3#','%RowNumber%#DateAPI3#');
                               
                            String NumbervalSucc = String.valueof(RowNumber + 48);    
                            String RowNubers = String.valueof(RowNumber - 5);
                            String Row = String.valueof(RowNumber + 6);
                          /*  JsonRec.Json_Selector_Date__c  = JsonRec.Json_Selector_Date__c.Replace('#Selector#','listselector_'+ NumbervalSucc) ;
                            JsonRec.Json_Selector_Date__c  = JsonRec.Json_Selector_Date__c.Replace('"row": #RowNumber#','"row": '+Row) ;
                            
                          JsonMethod =  JsonMethod.Remove(JsonRec.Json_Selector_Date__c);
                          JsonRec.Json_Selector_Date__c  = JsonRec.Json_Selector_Date__c.Replace('listselector_'+ NumbervalSucc,'#Selector#') ;
                          JsonRec.Json_Selector_Date__c  = JsonRec.Json_Selector_Date__c.Replace('"row": '+Row,'"row": #RowNumber#') ; */
                          
                          JsonRec.Json_listselector_Date2__c  = JsonRec.Json_listselector_Date2__c.Replace('#Selector#','listselector_'+ NumbervalSucc) ;
                          JsonRec.Json_listselector_Date2__c  = JsonRec.Json_listselector_Date2__c.Replace('#Timelines#','Static_Success_Timeline_'+ RowNubers) ;
                           String pillStrNewd = '"listselector_'+NumbervalSucc+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                          
                          JsonMethod =  JsonMethod.replace(JsonRec.Json_listselector_Date2__c,pillStrNewd);
                          JsonRec.Json_listselector_Date2__c  = JsonRec.Json_listselector_Date2__c.Replace('listselector_'+ NumbervalSucc,'#Selector#') ;
                          JsonRec.Json_listselector_Date2__c  = JsonRec.Json_listselector_Date2__c.Replace('Static_Success_Timeline_'+RowNubers,'#Timelines#') ;                       
                    }
                    if(RowNumber == 11 || RowNumber == 12 || RowNumber == 13 ||  RowNumber == 14 || RowNumber == 15){                      
                            String Numbers = String.valueof(RowNumber-10);
                            jsonRec.Json_Measure__c = JsonRec.Json_Measure__c.Replace('#sectionName#','Static_Marketing_Timeline_'+ Numbers).Replace('%RowNumber%#DateLabel1#','#'+RowNumber+'DateLabel1#');
                            jsonRec.Json_Measure__c = JsonRec.Json_Measure__c.Replace('%RowNumber%#DateAPI1#','#'+RowNumber+'DateAPI1#').Replace('%RowNumber%#DateLabel2#','#'+RowNumber+'DateLabel2#').Replace('%RowNumber%#DateAPI2#','#'+RowNumber+'DateAPI2#');
                            jsonRec.Json_Measure__c = JsonRec.Json_Measure__c.Replace('%RowNumber%#DateLabel3#','#'+RowNumber+'DateLabel3#').Replace('%RowNumber%#DateAPI3#','#'+RowNumber+'DateAPI3#');
                            JsonMethod =  JsonMethod.Remove(jsonRec.Json_Measure__c);
                            jsonRec.Json_Measure__c = JsonRec.Json_Measure__c.Replace('Static_Marketing_Timeline_'+ Numbers,'#sectionName#').Replace('#'+RowNumber+'DateLabel1#','%RowNumber%#DateLabel1#').Replace('#'+RowNumber+'DateAPI1#','%RowNumber%#DateAPI1#');
                            jsonRec.Json_Measure__c = JsonRec.Json_Measure__c.Replace('#'+RowNumber+'DateLabel2#','%RowNumber%#DateLabel2#').Replace('#'+RowNumber+'DateAPI2#','%RowNumber%#DateAPI2#');
                            jsonRec.Json_Measure__c = JsonRec.Json_Measure__c.Replace('#'+RowNumber+'DateLabel3#','%RowNumber%#DateLabel3#').Replace('#'+RowNumber+'DateAPI3#','%RowNumber%#DateAPI3#'); 
                            
                            String NumbersvalMar = String.valueof(RowNumber + 48);
                            String RowNubers = String.valueof(RowNumber - 10);
                            String Row = String.valueof(RowNumber + 8);
                            
                          /*  JsonRec.Json_Selector_Date__c  = JsonRec.Json_Selector_Date__c.Replace('#Selector#','listselector_'+ NumbersvalMar) ;
                            JsonRec.Json_Selector_Date__c  = JsonRec.Json_Selector_Date__c.Replace('"row": #RowNumber#','"row": '+Row) ;
                          JsonMethod =  JsonMethod.Remove(JsonRec.Json_Selector_Date__c);
                          JsonRec.Json_Selector_Date__c  = JsonRec.Json_Selector_Date__c.Replace('listselector_'+ NumbersvalMar,'#Selector#') ;
                          JsonRec.Json_Selector_Date__c  = JsonRec.Json_Selector_Date__c.Replace('"row": '+Row,'"row": #RowNumber#') ; */
                          
                          JsonRec.Json_listselector_Date2__c  = JsonRec.Json_listselector_Date2__c.Replace('#Selector#','listselector_'+ NumbersvalMar) ;
                          JsonRec.Json_listselector_Date2__c  = JsonRec.Json_listselector_Date2__c.Replace('#Timelines#','Static_Marketing_Timeline_'+ RowNubers) ;
                          String StrNew = '"listselector_'+NumbersvalMar+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                
                          JsonMethod =  JsonMethod.replace(JsonRec.Json_listselector_Date2__c,StrNew);
                          JsonRec.Json_listselector_Date2__c  = JsonRec.Json_listselector_Date2__c.Replace('listselector_'+ NumbersvalMar,'#Selector#') ;
                          JsonRec.Json_listselector_Date2__c  = JsonRec.Json_listselector_Date2__c.Replace('Static_Marketing_Timeline_'+RowNubers,'#Timelines#') ;                       
                    }  

                       if(RowNumber == 1 || RowNumber == 2 || RowNumber == 3 || RowNumber == 4 || RowNumber == 5){
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace('#Measurename#','Static_Sales_Measure_'+RowNumber); 
                    String NumbersvalMar;
                    if(RowNumber == 1 || RowNumber == 2 || RowNumber == 3 ){
                      NumbersvalMar = String.valueof(RowNumber + 9);
                    }
                    if( RowNumber == 4 || RowNumber == 5){
                      NumbersvalMar = String.valueof(RowNumber + 10);
                    }
                        
                      String RowNubers = String.valueof(RowNumber);
                      String Row = String.valueof(RowNumber + 4);
                   /*   JsonRec.Json_List_Selector2__c  = JsonRec.Json_List_Selector2__c.Replace('#Selector#','listselector_'+ NumbersvalMar) ;
                      JsonRec.Json_List_Selector2__c  = JsonRec.Json_List_Selector2__c.Replace('"row": #RowNumber#','"row": '+Row) ;
                    JsonMethod =  JsonMethod.Remove(JsonRec.Json_List_Selector2__c);
                    JsonRec.Json_List_Selector2__c  = JsonRec.Json_List_Selector2__c.Replace('listselector_'+ NumbersvalMar,'#Selector#') ;
                    JsonRec.Json_List_Selector2__c  = JsonRec.Json_List_Selector2__c.Replace('"row": '+Row,'"row": #RowNumber#') ; 
                    
                    JsonRec.Json_Static_Measure__c  = JsonRec.Json_Static_Measure__c.Replace('#Selector#','listselector_'+ NumbersvalMar) ;
                      JsonRec.Json_Static_Measure__c  = JsonRec.Json_Static_Measure__c.Replace('"row": #RowNumber#','"row": '+RowNubers) ;
                    JsonMethod =  JsonMethod.Remove(JsonRec.Json_Static_Measure__c);
                    JsonRec.Json_Static_Measure__c  = JsonRec.Json_Static_Measure__c.Replace('listselector_'+ NumbersvalMar,'#Selector#') ;
                    JsonRec.Json_Static_Measure__c  = JsonRec.Json_Static_Measure__c.Replace('"row": '+RowNubers,'"row": #RowNumber#') ;
                    
                    JsonRec.Json_Selector3__c  = JsonRec.Json_Selector3__c.Replace('#Selector#','listselector_'+ NumbersvalMar) ;
                      JsonRec.Json_Selector3__c  = JsonRec.Json_Selector3__c.Replace('"row": #RowNumber#','"row": '+RowNubers) ;
                    JsonMethod =  JsonMethod.Remove(JsonRec.Json_Selector3__c);
                    JsonRec.Json_Selector3__c  = JsonRec.Json_Selector3__c.Replace('listselector_'+ NumbersvalMar,'#Selector#') ;
                    JsonRec.Json_Selector3__c  = JsonRec.Json_Selector3__c.Replace('"row": '+RowNubers,'"row": #RowNumber#') ; */
                    
                    JsonRec.Json_list_Measure__c  = JsonRec.Json_list_Measure__c.Replace('#Selector#','listselector_'+ NumbersvalMar).Replace('#Timelines#','Static_Sales_Measure_'+ RowNubers) ;
                     String StrNew = '"listselector_'+NumbersvalMar+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                          
                    JsonMethod =  JsonMethod.replace(JsonRec.Json_list_Measure__c,StrNew);
                    JsonRec.Json_list_Measure__c  = JsonRec.Json_list_Measure__c.Replace('listselector_'+ NumbersvalMar,'#Selector#').Replace('Static_Sales_Measure_'+RowNubers,'#Timelines#') ;  
                    
                  } 
                  if(RowNumber == 6 || RowNumber == 7 || RowNumber == 8 || RowNumber == 9 || RowNumber == 10){
                    String Numbervalue = String.valueof(RowNumber - 5);
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace('#Measurename#','Static_Success_Measure_'+Numbervalue); 
                    
                    String NumbersvalMar;
                    NumbersvalMar = String.valueof(RowNumber + 10);
                    String RowNubers = String.valueof(RowNumber - 5);
                      String Row = String.valueof(RowNumber + 6);
                      JsonRec.Json_List_Selector2__c  = JsonRec.Json_List_Selector2__c.Replace('#Selector#','listselector_'+ NumbersvalMar).Replace('"row": #RowNumber#','"row": '+Row) ;
                    JsonMethod =  JsonMethod.Remove(JsonRec.Json_List_Selector2__c);
                    JsonRec.Json_List_Selector2__c  = JsonRec.Json_List_Selector2__c.Replace('listselector_'+ NumbersvalMar,'#Selector#').Replace('"row": '+Row,'"row": #RowNumber#') ;
                    
                    JsonRec.Json_Static_Measure__c  = JsonRec.Json_Static_Measure__c.Replace('#Selector#','listselector_'+ NumbersvalMar).Replace('"row": #RowNumber#','"row": '+RowNubers) ;
                    JsonMethod =  JsonMethod.Remove(JsonRec.Json_Static_Measure__c);
                    JsonRec.Json_Static_Measure__c  = JsonRec.Json_Static_Measure__c.Replace('listselector_'+ NumbersvalMar,'#Selector#').Replace('"row": '+RowNubers,'"row": #RowNumber#') ;
                    
                    JsonRec.Json_Selector3__c  = JsonRec.Json_Selector3__c.Replace('#Selector#','listselector_'+ NumbersvalMar).Replace('"row": #RowNumber#','"row": '+RowNubers) ;
                    JsonMethod =  JsonMethod.Remove(JsonRec.Json_Selector3__c);
                    JsonRec.Json_Selector3__c  = JsonRec.Json_Selector3__c.Replace('listselector_'+ NumbersvalMar,'#Selector#').Replace('"row": '+RowNubers,'"row": #RowNumber#') ;
                    
                    JsonRec.Json_list_Measure__c  = JsonRec.Json_list_Measure__c.Replace('#Selector#','listselector_'+ NumbersvalMar).Replace('#Timelines#','Static_Success_Measure_'+ RowNubers) ;
                    String StrNew = '"listselector_'+NumbersvalMar+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                     
                    JsonMethod =  JsonMethod.replace(JsonRec.Json_list_Measure__c,StrNew);
                    JsonRec.Json_list_Measure__c  = JsonRec.Json_list_Measure__c.Replace('listselector_'+ NumbersvalMar,'#Selector#').Replace('Static_Success_Measure_'+RowNubers,'#Timelines#') ;  
                  } 
                  if(RowNumber == 11 || RowNumber == 12 || RowNumber == 13 || RowNumber == 14 || RowNumber == 15){
                    String Numbervalue = String.valueof(RowNumber - 10);
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace('#Measurename#','Static_Marketing_Measure_'+NUmbervalue);
                    String NumbersvalMar;
                    NumbersvalMar = String.valueof(RowNumber + 10);
                    String RowNubers = String.valueof(RowNumber - 10);
                      String Row = String.valueof(RowNumber + 8);
                      JsonRec.Json_List_Selector2__c  = JsonRec.Json_List_Selector2__c.Replace('#Selector#','listselector_'+ NumbersvalMar).Replace('"row": #RowNumber#','"row": '+Row) ;
                    JsonMethod =  JsonMethod.Remove(JsonRec.Json_List_Selector2__c);
                    JsonRec.Json_List_Selector2__c  = JsonRec.Json_List_Selector2__c.Replace('listselector_'+ NumbersvalMar,'#Selector#').Replace('"row": '+Row,'"row": #RowNumber#') ;
                    
                    JsonRec.Json_Static_Measure__c  = JsonRec.Json_Static_Measure__c.Replace('#Selector#','listselector_'+ NumbersvalMar).Replace('"row": #RowNumber#','"row": '+RowNubers) ;
                    JsonMethod =  JsonMethod.Remove(JsonRec.Json_Static_Measure__c);
                    JsonRec.Json_Static_Measure__c  = JsonRec.Json_Static_Measure__c.Replace('listselector_'+ NumbersvalMar,'#Selector#').Replace('"row": '+RowNubers,'"row": #RowNumber#') ;
                    
                    JsonRec.Json_Selector3__c  = JsonRec.Json_Selector3__c.Replace('#Selector#','listselector_'+ NumbersvalMar).Replace('"row": #RowNumber#','"row": '+RowNubers) ;
                    JsonMethod =  JsonMethod.Remove(JsonRec.Json_Selector3__c);
                    JsonRec.Json_Selector3__c  = JsonRec.Json_Selector3__c.Replace('listselector_'+ NumbersvalMar,'#Selector#').Replace('"row": '+RowNubers,'"row": #RowNumber#') ;
                    
                    JsonRec.Json_list_Measure__c  = JsonRec.Json_list_Measure__c.Replace('#Selector#','listselector_'+ NumbersvalMar).Replace('#Timelines#','Static_Marketing_Measure_'+ RowNubers) ;
                    String StrNew = '"listselector_'+NumbersvalMar+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                                
                    JsonMethod =  JsonMethod.replace(JsonRec.Json_list_Measure__c,StrNew);
                    
                    JsonRec.Json_list_Measure__c  = JsonRec.Json_list_Measure__c.Replace('listselector_'+ NumbersvalMar,'#Selector#').Replace('Static_Marketing_Measure_'+RowNubers,'#Timelines#') ; 
                  }             
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace('%RowNumber%MeasureLabel1',RowNumber+'MeasureLabel1').Replace('%RowNumber%ExpressionMeasureAPI1',RowNumber+'ExpressionMeasureAPI1');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace('%RowNumber%AliasMeasureAPI1',RowNumber+'AliasMeasureAPI1');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace('%RowNumber%CompactMeasureAPI1',RowNumber+'CompactMeasureAPI1');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace('%RowNumber%MeasureLabel2',RowNumber+'MeasureLabel2');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace('%RowNumber%ExpressionMeasureAPI2',RowNumber+'ExpressionMeasureAPI2');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace('%RowNumber%AliasMeasureAPI2',RowNumber+'AliasMeasureAPI2');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace('%RowNumber%CompactMeasureAPI2',RowNumber+'CompactMeasureAPI2');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace('%RowNumber%MeasureLabel3',RowNumber+'MeasureLabel3').Replace('%RowNumber%ExpressionMeasureAPI3',RowNumber+'ExpressionMeasureAPI3').Replace('%RowNumber%AliasMeasureAPI3',RowNumber+'AliasMeasureAPI3').Replace('%RowNumber%CompactMeasureAPI3',RowNumber+'CompactMeasureAPI3').Replace('%RowNumber%MeasureLabel4',RowNumber+'MeasureLabel4').Replace('%RowNumber%ExpressionMeasureAPI4',RowNumber+'ExpressionMeasureAPI4').Replace('%RowNumber%AliasMeasureAPI4',RowNumber+'AliasMeasureAPI4').Replace('%RowNumber%CompactMeasureAPI4',RowNumber+'CompactMeasureAPI4').Replace('%RowNumber%MeasureLabel5',RowNumber+'MeasureLabel5').Replace('%RowNumber%ExpressionMeasureAPI5',RowNumber+'ExpressionMeasureAPI5').Replace('%RowNumber%AliasMeasureAPI5',RowNumber+'AliasMeasureAPI5').Replace('%RowNumber%CompactMeasureAPI5',RowNumber+'CompactMeasureAPI5');                    
                    JsonMethod =  JsonMethod.Remove(JsonRec.Json_Measure_List__c);
                      JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace(RowNumber+'MeasureLabel1','%RowNumber%MeasureLabel1');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace(RowNumber+'ExpressionMeasureAPI1','%RowNumber%ExpressionMeasureAPI1');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace(RowNumber+'AliasMeasureAPI1','%RowNumber%AliasMeasureAPI1');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace(RowNumber+'CompactMeasureAPI1','%RowNumber%CompactMeasureAPI1');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace(RowNumber+'MeasureLabel2','%RowNumber%MeasureLabel2');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace(RowNumber+'ExpressionMeasureAPI2','%RowNumber%ExpressionMeasureAPI2');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace(RowNumber+'AliasMeasureAPI2','%RowNumber%AliasMeasureAPI2');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace(RowNumber+'CompactMeasureAPI2','%RowNumber%CompactMeasureAPI2');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace(RowNumber+'MeasureLabel3','%RowNumber%MeasureLabel3');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace(RowNumber+'ExpressionMeasureAPI3','%RowNumber%ExpressionMeasureAPI3');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace(RowNumber+'AliasMeasureAPI3','%RowNumber%AliasMeasureAPI3');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace(RowNumber+'CompactMeasureAPI3','%RowNumber%CompactMeasureAPI3');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace(RowNumber+'MeasureLabel4','%RowNumber%MeasureLabel4');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace(RowNumber+'ExpressionMeasureAPI4','%RowNumber%ExpressionMeasureAPI4');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace(RowNumber+'AliasMeasureAPI4','%RowNumber%AliasMeasureAPI4');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace(RowNumber+'CompactMeasureAPI4','%RowNumber%CompactMeasureAPI4');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace(RowNumber+'MeasureLabel5','%RowNumber%MeasureLabel5');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace(RowNumber+'ExpressionMeasureAPI5','%RowNumber%ExpressionMeasureAPI5');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace(RowNumber+'AliasMeasureAPI5','%RowNumber%AliasMeasureAPI5');
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace(RowNumber+'CompactMeasureAPI5','%RowNumber%CompactMeasureAPI5');
                  if(RowNumber == 1 || RowNumber == 2 || RowNumber == 3 || RowNumber == 4 || RowNumber == 5){
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace('Static_Sales_Measure_'+RowNumber,'#Measurename#'); 
                    
                  } 
                  if(RowNumber == 6 || RowNumber == 7 || RowNumber == 8 || RowNumber == 9 || RowNumber == 10){
                    String Numbervalue = String.valueof(RowNumber - 5);
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace('Static_Success_Measure_'+Numbervalue,'#Measurename#'); 
                  } 
                  if(RowNumber == 11 || RowNumber == 12 || RowNumber == 13 || RowNumber == 14 || RowNumber == 15){
                    String Numbervalue = String.valueof(RowNumber -10);
                    JsonRec.Json_Measure_List__c = JsonRec.Json_Measure_List__c.Replace('Static_Marketing_Measure_'+Numbervalue,'#Measurename#'); 
                  }     

                     String JsonString;
                     String JsonString1;
                     String JsonString2;
                     if(RowNumber != 12){                 
                      JsonString = ',{{cell(Static_Marketing_Toggle_KPI_'+String.valueof(RowNumber-10)+'.selection,0,\\\\\\"value\\\\\\").asString()}}';
                     }
                     else{
                        JsonString = 'prefinal=union {{cell(Static_Marketing_Toggle_KPI_1.selection,0,\\\\\\"value\\\\\\").asString()}},{{cell(Static_Marketing_Toggle_KPI_2.selection,0,\\\\\\"value\\\\\\").asString()}},{{cell(Static_Marketing_Toggle_KPI_3.selection,0,\\\\\\"value\\\\\\").asString()}},{{cell(Static_Marketing_Toggle_KPI_4.selection,0,\\\\\\"value\\\\\\").asString()}},{{cell(Static_Marketing_Toggle_KPI_5.selection,0,\\\\\\"value\\\\\\").asString()}};';
                        JsonMethod = JsonMethod.remove('none= filter q1 by \'Type\'==\\\\\\"No_Possible_Value\\\\\\";none= group none by \'Type\';none1= foreach none generate \'Type\'as\'Type\';none2= foreach none generate \'Type\'as\'Type\';none3= foreach none generate \'Type\'as\'Type\'; none4= foreach none generate \'Type\'as\'Type\';none5= foreach none generate \'Type\'as\'Type\';');
	                	 }
                     
                     if(RowNumber != 2 ){
                        JsonString1 = ',{{cell(Static_Sales_Toggle_KPI_'+String.valueof(RowNumber)+'.selection,0,\\\\\\"value\\\\\\").asString()}}';
                         }
                     else{
                        JsonString1 = 'prefinal=union {{cell(Static_Sales_Toggle_KPI_1.selection,0,\\\\\\"value\\\\\\").asString()}},{{cell(Static_Sales_Toggle_KPI_2.selection,0,\\\\\\"value\\\\\\").asString()}},{{cell(Static_Sales_Toggle_KPI_3.selection,0,\\\\\\"value\\\\\\").asString()}},{{cell(Static_Sales_Toggle_KPI_4.selection,0,\\\\\\"value\\\\\\").asString()}},{{cell(Static_Sales_Toggle_KPI_5.selection,0,\\\\\\"value\\\\\\").asString()}};';
                       
                        String JsonStrings = 'none= filter q1 by \'Type\'==\\\\\\"No_Possible_Value\\\\\\"; none= group none by \'Type\'; none1= foreach none generate \'Type\'as\'Type\';none2= foreach none generate \'Type\'as\'Type\';none3= foreach none generate \'Type\'as\'Type\';none4= foreach none generate \'Type\'as\'Type\';none5= foreach none generate \'Type\'as\'Type\';';
	                	JsonMethod = JsonMethod.remove(JsonStrings);       
	                	 }
                     if(RowNumber != 7 ){   
                         JsonString2 = ',{{cell(Static_Success_Toggle_KPI_'+String.valueof(RowNumber-5)+'.selection,0,\\\\\\"value\\\\\\").asString()}}';
                        
                     }
                     else{
                        JsonString2 = 'prefinal=union {{cell(Static_Success_Toggle_KPI_1.selection,0,\\\\\\"value\\\\\\").asString()}},{{cell(Static_Success_Toggle_KPI_2.selection,0,\\\\\\"value\\\\\\").asString()}},{{cell(Static_Success_Toggle_KPI_3.selection,0,\\\\\\"value\\\\\\").asString()}},{{cell(Static_Success_Toggle_KPI_4.selection,0,\\\\\\"value\\\\\\").asString()}},{{cell(Static_Success_Toggle_KPI_5.selection,0,\\\\\\"value\\\\\\").asString()}};';
                        JsonMethod = JsonMethod.remove('none= filter q1 by \'Type\'==\\\\\\"No_Possible_Value\\\\\\";none= group none by \'Type\';none1= foreach none generate \'Type\'as\'Type\'; none2= foreach none generate \'Type\'as\'Type\';none3= foreach none generate \'Type\'as\'Type\';none4= foreach none generate \'Type\'as\'Type\';none5= foreach none generate \'Type\'as\'Type\';');
	                	 }
                    JsonMethod =  JsonMethod.remove(JsonString);     
                    JsonMethod =  JsonMethod.remove(JsonString1); 
                    JsonMethod =  JsonMethod.remove(JsonString2);    
                    String NewFilterString = ''; 
                                                           
                     if(RowNumber == 15){
                        
                        
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#%RowNumber%datasetAlias#','#15datasetAlias#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber-10)).Replace('#Timelines#','Static_Marketing__KPI_5_Filter');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#MeasureRowNumbers#','Static_Marketing_Measure_5');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#KPIRowNumbers#','Static_Marketing__KPI_5');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#StaticMarket#','Static_Marketing_Timeline_5'); 
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#StaticMarkets#','Static_Marketing_Timeline');                           
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter__c);  
                              JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#15datasetAlias#','#%RowNumber%datasetAlias#');   
                          
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Marketing_Measure_5','#MeasureRowNumbers#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Marketing__KPI_5','#KPIRowNumbers#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Marketing_Timeline_5','#StaticMarket#'); 
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Marketing_Timeline','#StaticMarkets#'); 
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('q'+ String.valueof(RowNumber-10),'#RowNumbers#').Replace('Static_Marketing__KPI_5_Filter','#Timelines#');
                             
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber-10));
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#TimeLine#','Static_Marketing_Timeline');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#MeasureRowNumbers#','Static_Marketing_Measure_5');
                            JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter_Remove__c);
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('q'+ String.valueof(RowNumber-10),'#RowNumbers#');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('Static_Marketing_Timeline','#TimeLine#');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('Static_Marketing_Measure_5','#MeasureRowNumbers#');
                            
                            
                           //  JsonRec.Json_Pillbox_comma__c =  JsonRec.Json_Pillbox_comma__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_17');
                           //  JsonRec.Json_Pillbox_comma__c =  JsonRec.Json_Pillbox_comma__c.Replace('"row": #RowNumbers#','"row": ' + String.valueof(RowNumber-10));                                                                        
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_17');
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": #RowNumbers#','"row": ' +String.valueof(RowNumber-10));                                                       
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_17');
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": #RowNumbersPill#','"row": ' +String.valueof(RowNumber+8));                                                        
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('"pillbox_#pillbox#"','"pillbox_17"');                         
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('#RowNumbers#','Static_Marketing_Toggle_KPI_'+String.valueof(RowNumber-10));
                          //   JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox_comma__c);
                             String StrNewpill = '"pillbox_17": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox1__c);
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox2__c);   
                             JsonMethod =  JsonMethod.replace(JsonRec.Json_Full_pillbox__c,StrNewpill);
                             //   JsonRec.Json_Pillbox_comma__c =  JsonRec.Json_Pillbox_comma__c.Replace('"name": "pillbox_17','"name": "pillbox_#pillbox#');
                          //  JsonRec.Json_Pillbox_comma__c =  JsonRec.Json_Pillbox_comma__c.Replace('"row": ' + String.valueof(RowNumber-10),'"row": #RowNumbers#');
                            JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_17','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": ' +String.valueof(RowNumber-10),'"row": #RowNumbers#');   
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_17','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": ' +String.valueof(RowNumber+8),'"row": #RowNumbersPill#');
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('"pillbox_17"','"pillbox_#pillbox#"');                         
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('Static_Marketing_Toggle_KPI_'+String.valueof(RowNumber-10),'#RowNumbers#');                           
                             
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowKPISection#','Static_Marketing_Toggle_KPI_5');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowNumbers#','q5');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowNone#','none5');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_String_Toggle__c);
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('Static_Marketing_Toggle_KPI_5','#RowKPISection#');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('q5','#RowNumbers#');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('none5','#RowNone#');
                             
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('%SectionNames%','Static_Marketing__KPI_5_Filter');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#%RowNumber%queryFiltersLabel','#15queryFiltersLabel');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#%RowNumber%queryFiltersString','#15queryFiltersString');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_section3__c);
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('Static_Marketing__KPI_5_Filter','%SectionNames%');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#15queryFiltersLabel','#%RowNumber%queryFiltersLabel');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#15queryFiltersString','#%RowNumber%queryFiltersString');                            
                  
                            
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Selector#','listselector_44') ;
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Timelines#','Static_Marketing__KPI_5_Filter') ;
                          String StrNew2 = '"listselector_44": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                          JsonMethod =  JsonMethod.replace(JsonRec.Json_ListSelector1__c,StrNew2);
                         // JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('listselector_44','listselector_48') ;
                         // JsonMethod =  JsonMethod.Remove(JsonRec.Json_ListSelector1__c);
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('listselector_44','#Selector#') ;
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('Static_Marketing__KPI_3_Filter','#Timelines#') ;
                            JsonMethod =  JsonMethod.Remove(JsonRec.Market_Filter4__c); 
                            
                            JsonRec.Json_Selector_Date__c  = JsonRec.Json_Selector_Date__c.Replace('#Selector#','listselector_48') ;
                            JsonRec.Json_Selector_Date__c  = JsonRec.Json_Selector_Date__c.Replace('"row": #RowNumber#','"row": 5') ;
                          JsonMethod =  JsonMethod.Remove(JsonRec.Json_Selector_Date__c);
                          JsonRec.Json_Selector_Date__c  = JsonRec.Json_Selector_Date__c.Replace('listselector_48','#Selector#') ;
                          JsonRec.Json_Selector_Date__c  = JsonRec.Json_Selector_Date__c.Replace('"row": 5','"row": #RowNumber#') ; 
                          
                          JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('#Selector#','listselector_48').Replace('"row": #RowNumber#','"row": 5');
                            JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('"colspan": #colspanval#','"colspan": 1').Replace('"column": #columnval#','"column": 1');
                                JsonMethod =  JsonMethod.Remove(JsonRec.Json_listselector__c);
                                   JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('"colspan": 1','"colspan": #colspanval#').Replace('"column": 1','"column": #columnval#');
                            JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('listselector_48','#Selector#').Replace('"row": 5','"row": #RowNumber#');
                          
                     }
                     if(RowNumber == 14){  
                        
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#%RowNumber%datasetAlias#','#14datasetAlias#');
                    
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber-10)).Replace('#Timelines#','Static_Marketing__KPI_4_Filter');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#MeasureRowNumbers#','Static_Marketing_Measure_4');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#KPIRowNumbers#','Static_Marketing__KPI_4');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#StaticMarket#','Static_Marketing_Timeline_4'); 
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#StaticMarkets#','Static_Marketing_Timeline');                           
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter__c);
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#14datasetAlias#','#%RowNumber%datasetAlias#');                                                      
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Marketing_Measure_4','#MeasureRowNumbers#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Marketing__KPI_4','#KPIRowNumbers#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Marketing_Timeline_4','#StaticMarket#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Marketing_Timeline','#StaticMarkets#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('q'+ String.valueof(RowNumber-10),'#RowNumbers#').Replace('Static_Marketing__KPI_4_Filter','#Timelines#');
                             
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber-10));
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#TimeLine#','Static_Marketing_Timeline');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#MeasureRowNumbers#','Static_Marketing_Measure_4');
                            JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter_Remove__c);
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('q'+ String.valueof(RowNumber-10),'#RowNumbers#');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('Static_Marketing_Timeline','#TimeLine#');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('Static_Marketing_Measure_4','#MeasureRowNumbers#');
                             
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_16');
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"row": #RowNumbers#','"row": ' + String.valueof(RowNumber-10));                                                                    
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_16');
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": #RowNumbers#','"row": ' +String.valueof(RowNumber-10));                                                       
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_16');
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": #RowNumbersPill#','"row": ' +String.valueof(RowNumber+8));                                                        
                              JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('pillbox_#pillbox#','pillbox_16');                        
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('#RowNumbers#','Static_Marketing_Toggle_KPI_'+String.valueof(RowNumber-10));
                             String pillStrNew = '"pillbox_16": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox__c);
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox1__c);
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox2__c);
                             JsonMethod =  JsonMethod.replace(JsonRec.Json_Full_pillbox__c,pillStrNew);
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"name": "pillbox_16','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"row": ' + String.valueof(RowNumber-10),'"row": #RowNumbers#');
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_16','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": ' +String.valueof(RowNumber-10),'"row": #RowNumbers#');   
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_16','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": ' +String.valueof(RowNumber+8),'"row": #RowNumbersPill#');
                              JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('pillbox_16','pillbox_#pillbox#');                        
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('Static_Marketing_Toggle_KPI_'+String.valueof(RowNumber-10),'#RowNumbers#');
                            
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowKPISection#','Static_Marketing_Toggle_KPI_4');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowNumbers#','q4');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowNone#','none4');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_String_Toggle__c);
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('Static_Marketing_Toggle_KPI_4','#RowKPISection#');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('q4','#RowNumbers#');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('none4','#RowNone#');
                             
                            JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('%SectionNames%','Static_Marketing__KPI_4_Filter');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#%RowNumber%queryFiltersLabel','#14queryFiltersLabel');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#%RowNumber%queryFiltersString','#14queryFiltersString');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_section3__c);
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('Static_Marketing__KPI_4_Filter','%SectionNames%');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#14queryFiltersLabel','#%RowNumber%queryFiltersLabel');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#14queryFiltersString','#%RowNumber%queryFiltersString'); 
                             
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Selector#','listselector_43') ;
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Timelines#','Static_Marketing__KPI_4_Filter') ;
                          String listStrNew = '"listselector_43": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                          JsonMethod =  JsonMethod.replace(JsonRec.Json_ListSelector1__c,listStrNew);
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('listselector_43','listselector_47') ;
                           JsonMethod =  JsonMethod.Remove(JsonRec.Json_ListSelector1__c);
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('listselector_47','#Selector#') ;
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('Static_Marketing__KPI_4_Filter','#Timelines#') ;
                          
                           JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('#Selector#','listselector_47').Replace('"row": #RowNumber#','"row": 4');
                            JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('"colspan": #colspanval#','"colspan": 2').Replace('"column": #columnval#','"column": 2');
                                JsonMethod =  JsonMethod.Remove(JsonRec.Json_listselector__c);
                            JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('"row": 4','"row": 4');
                            JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('"colspan": 2','"colspan": 1').Replace('"column": 2','"column": 1');   
                                JsonMethod =  JsonMethod.Remove(JsonRec.Json_listselector__c);
                            JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('"colspan": 1','"colspan": #colspanval#').Replace('"column": 1','"column": #columnval#');
                            JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('listselector_47','#Selector#').Replace('"row": 4','"row": #RowNumber#');
                           JsonMethod =  JsonMethod.Remove(JsonRec.Market_Filter3__c); 
                     }
                      if(RowNumber == 13){  
                        
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#%RowNumber%datasetAlias#','#13datasetAlias#');
                    
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber-10)).Replace('#Timelines#','Static_Marketing__KPI_3_Filter');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#MeasureRowNumbers#','Static_Marketing_Measure_3');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#KPIRowNumbers#','Static_Marketing__KPI_3');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#StaticMarket#','Static_Marketing_Timeline_3');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#StaticMarkets#','Static_Marketing_Timeline');                           
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter__c);
                             
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#13datasetAlias#','#%RowNumber%datasetAlias#');
                             
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Marketing_Measure_3','#MeasureRowNumbers#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Marketing__KPI_3','#KPIRowNumbers#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Marketing_Timeline_3','#StaticMarket#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Marketing_Timeline','#StaticMarkets#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('q'+ String.valueof(RowNumber-10),'#RowNumbers#').Replace('Static_Marketing__KPI_3_Filter','#Timelines#');
                             
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber-10));
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#TimeLine#','Static_Marketing_Timeline');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#MeasureRowNumbers#','Static_Marketing_Measure_3');
                            JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter_Remove__c);
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('q'+ String.valueof(RowNumber-10),'#RowNumbers#');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('Static_Marketing_Timeline','#TimeLine#');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('Static_Marketing_Measure_3','#MeasureRowNumbers#');
                             
                         JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_15');
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"row": #RowNumbers#','"row": ' + String.valueof(RowNumber-10));                            
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_15');
                            JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": #RowNumbers#','"row": ' +String.valueof(RowNumber-10));                                                        
                              JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_15');
                              JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": #RowNumbersPill#','"row": ' +String.valueof(RowNumber+8));                                                       
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('pillbox_#pillbox#','pillbox_15');                         
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('#RowNumbers#','Static_Marketing_Toggle_KPI_'+String.valueof(RowNumber-10));
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox__c);
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox1__c);
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox2__c);
                             String pillStrNew = '"pillbox_15": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                             JsonMethod =  JsonMethod.replace(JsonRec.Json_Full_pillbox__c,pillStrNew);    
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"name": "pillbox_15','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"row": ' + String.valueof(RowNumber-10),'"row": #RowNumbers#');
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_15','"name": "pillbox_#pillbox#');
                            JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": ' +String.valueof(RowNumber-10),'"row": #RowNumbers#');    
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_15','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": ' +String.valueof(RowNumber+8),'"row": #RowNumbersPill#');
                              JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('pillbox_15','pillbox_#pillbox#');                        
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('Static_Marketing_Toggle_KPI_'+String.valueof(RowNumber-10),'#RowNumbers#');
                             
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowKPISection#','Static_Marketing_Toggle_KPI_3');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowNumbers#','q3');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowNone#','none3');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_String_Toggle__c);
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('Static_Marketing_Toggle_KPI_3','#RowKPISection#');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('q3','#RowNumbers#');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('none3','#RowNone#');
                             
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('%SectionNames%','Static_Marketing__KPI_3_Filter');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#%RowNumber%queryFiltersLabel','#13queryFiltersLabel');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#%RowNumber%queryFiltersString','#13queryFiltersString');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_section3__c);
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('Static_Marketing__KPI_3_Filter','%SectionNames%');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#13queryFiltersLabel','#%RowNumber%queryFiltersLabel');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#13queryFiltersString','#%RowNumber%queryFiltersString'); 
                           
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Selector#','listselector_41') ;
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Timelines#','Static_Marketing__KPI_3_Filter') ;
                          String pillStrNews = '"listselector_41": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                          JsonMethod =  JsonMethod.replace(JsonRec.Json_ListSelector1__c,pillStrNews);
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('listselector_41','listselector_46') ;
                          JsonMethod =  JsonMethod.Remove(JsonRec.Json_ListSelector1__c);
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('listselector_46','#Selector#') ;
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('Static_Marketing__KPI_3_Filter','#Timelines#') ;
                          
                          JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('#Selector#','listselector_46').Replace('"row": #RowNumber#','"row": 3');
                            JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('"colspan": #colspanval#','"colspan": 2').Replace('"column": #columnval#','"column": 2');
                                JsonMethod =  JsonMethod.Remove(JsonRec.Json_listselector__c);
                            JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('"row": 3','"row": 3');
                            JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('"colspan": 2','"colspan": 1').Replace('"column": 2','"column": 1');   
                                JsonMethod =  JsonMethod.Remove(JsonRec.Json_listselector__c);
                            JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('"colspan": 1','"colspan": #colspanval#').Replace('"column": 1','"column": #columnval#');
                            JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('listselector_46','#Selector#').Replace('"row": 3','"row": #RowNumber#');
                           
                           
                           JsonMethod =  JsonMethod.Remove(JsonRec.Market_Filter2__c);
                           
                      }
                      
                      if(RowNumber == 12){
                      
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#%RowNumber%datasetAlias#','#12datasetAlias#');
                        
                          
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber-10)).Replace('#Timelines#','Static_Marketing__KPI_2_Filter');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#MeasureRowNumbers#','Static_Marketing_Measure_2');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#KPIRowNumbers#','Static_Marketing__KPI_2');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#StaticMarket#','Static_Marketing_Timeline_2'); 
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#StaticMarkets#','Static_Marketing_Timeline');                           
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter__c);
                             
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#12datasetAlias#','#%RowNumber%datasetAlias#');
                              JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Marketing_Measure_2','#MeasureRowNumbers#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Marketing__KPI_2','#KPIRowNumbers#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Marketing_Timeline_2','#StaticMarket#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Marketing_Timeline','#StaticMarkets#');                           
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('q'+ String.valueof(RowNumber-10),'#RowNumbers#').Replace('Static_Marketing__KPI_2_Filter','#Timelines#');
                             
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber-10));
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#TimeLine#','Static_Marketing_Timeline');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#MeasureRowNumbers#','Static_Marketing_Measure_2');
                            JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter_Remove__c);
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('q'+ String.valueof(RowNumber-10),'#RowNumbers#');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('Static_Marketing_Timeline','#TimeLine#');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('Static_Marketing_Measure_2','#MeasureRowNumbers#');
                             
                            JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_14');
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"row": #RowNumbers#','"row": ' + String.valueof(RowNumber-10));                            
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_14');
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": #RowNumbers#','"row": ' +String.valueof(RowNumber-10));                                                       
                              JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_14');
                              JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": #RowNumbersPill#','"row": ' +String.valueof(RowNumber+8));                                                       
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('pillbox_#pillbox#','pillbox_14');                         
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('#RowNumbers#','Static_Marketing_Toggle_KPI_'+String.valueof(RowNumber-10));
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox__c);
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox1__c);
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox2__c);
                             String pillStrNew = '"pillbox_14": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                             JsonMethod =  JsonMethod.replace(JsonRec.Json_Full_pillbox__c,pillStrNew);    
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"name": "pillbox_14','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"row": ' + String.valueof(RowNumber-10),'"row": #RowNumbers#');
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_14','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": ' +String.valueof(RowNumber-10),'"row": #RowNumbers#');   
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_14','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": ' +String.valueof(RowNumber+8),'"row": #RowNumbersPill#');
                              JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('pillbox_14','pillbox_#pillbox#');                        
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('Static_Marketing_Toggle_KPI_'+String.valueof(RowNumber-10),'#RowNumbers#');
                            
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowKPISection#','Static_Marketing_Toggle_KPI_2');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowNumbers#','q2');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowNone#','none2');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_String_Toggle__c);
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('Static_Marketing_Toggle_KPI_2','#RowKPISection#');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('q2','#RowNumbers#');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('none2','#RowNone#');
                             
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('%SectionNames%','Static_Marketing__KPI_2_Filter');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#%RowNumber%queryFiltersLabel','#12queryFiltersLabel');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#%RowNumber%queryFiltersString','#12queryFiltersString');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_section3__c);
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('Static_Marketing__KPI_2_Filter','%SectionNames%');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#12queryFiltersLabel','#%RowNumber%queryFiltersLabel');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#12queryFiltersString','#%RowNumber%queryFiltersString'); 
                         
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Selector#','listselector_40') ;
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Timelines#','Static_Marketing__KPI_2_Filter') ;
                          String pillStrNews = '"listselector_40": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                             
                          JsonMethod =  JsonMethod.replace(JsonRec.Json_ListSelector1__c,pillStrNews);
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('listselector_40','#Selector#') ;
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('Static_Marketing__KPI_2_Filter','#Timelines#') ;
                          
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Selector#','listselector_45') ;
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Timelines#','Static_Marketing__KPI_2_Filter') ;
                          JsonMethod =  JsonMethod.Remove(JsonRec.Json_ListSelector1__c);
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('listselector_45','#Selector#') ;
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('Static_Marketing__KPI_2_Filter','#Timelines#') ;
                          
                          JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('#Selector#','listselector_45').Replace('"row": #RowNumber#','"row": 2');
                            JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('"colspan": #colspanval#','"colspan": 2').Replace('"column": #columnval#','"column": 2');
                                JsonMethod =  JsonMethod.Remove(JsonRec.Json_listselector__c);
                            JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('"row": 2','"row": 2');
                            JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('"colspan": 2','"colspan": 1').Replace('"column": 2','"column": 1');   
                                JsonMethod =  JsonMethod.Remove(JsonRec.Json_listselector__c);
                            JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('"colspan": 1','"colspan": #colspanval#').Replace('"column": 1','"column": #columnval#');
                            JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('listselector_45','#Selector#').Replace('"row": 2','"row": #RowNumber#');
                          
                           JsonMethod =  JsonMethod.Remove(JsonRec.Market__c);
                          
                      } 
                      if(RowNumber == 11){
                             
                             
                             
                              JsonRec.Chart_Delete__c  = JsonRec.Chart_Delete__c.Replace('#chart#','chart_4') ;
                            JsonRec.Chart_Delete__c  = JsonRec.Chart_Delete__c.Replace('#Markets#','Marketing_Timeline') ;
                            String pillStrNew = '"chart_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            JsonMethod =  JsonMethod.replace(JsonRec.Chart_Delete__c,pillStrNew);
                          JsonRec.Chart_Delete__c  = JsonRec.Chart_Delete__c.Replace('chart_4','#chart#') ;
                            JsonRec.Chart_Delete__c  = JsonRec.Chart_Delete__c.Replace('Marketing_Timeline','#Markets#') ;
                            
                             JsonRec.Chart_Delete_Row__c = JsonRec.Chart_Delete_Row__c.replace('"colspan": #ColSpan#','"colspan": 13').replace('"column": #ColS#','"column": 11');
                             JsonRec.Chart_Delete_Row__c = JsonRec.Chart_Delete_Row__c.replace('"row": #rows#','"row": 19').replace('#charts#','chart_4').replace('"rowspan": #rowspan#','"rowspan": 5');
                             JsonMethod =  JsonMethod.Remove(JsonRec.Chart_Delete_Row__c); 
                            JsonRec.Chart_Delete_Row__c = JsonRec.Chart_Delete_Row__c.replace('"colspan": 13','"colspan": 8').replace('"column": 11','"column": 0');
                             JsonRec.Chart_Delete_Row__c = JsonRec.Chart_Delete_Row__c.replace('"row": 19','"row": 7');
                             JsonMethod =  JsonMethod.Remove(JsonRec.Json_Number1__c); 
                             JsonRec.Chart_Delete_Row__c = JsonRec.Chart_Delete_Row__c.replace('"colspan": 8','"colspan": 4').replace('"column": 0','"column": 0');
                             JsonRec.Chart_Delete_Row__c = JsonRec.Chart_Delete_Row__c.replace('"row": 7','"row": 7');
                             JsonMethod =  JsonMethod.Remove(JsonRec.Json_Number1__c);
                             JsonRec.Chart_Delete_Row__c = JsonRec.Chart_Delete_Row__c.replace('"colspan": 4','"colspan": #ColSpan#').replace('"column": 0','"column": #ColS#');
                             JsonRec.Chart_Delete_Row__c = JsonRec.Chart_Delete_Row__c.replace('"row": 7','"row": #rows#').replace('chart_4','#charts#').replace('"rowspan": 5','"rowspan": #rowspan#'); 
                        
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#%RowNumber%datasetAlias#','#11datasetAlias#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber-10)).Replace('#Timelines#','Static_Marketing__KPI_1_Filter');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#MeasureRowNumbers#','Static_Marketing_Measure_1');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#KPIRowNumbers#','Static_Marketing__KPI_1');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#StaticMarket#','Static_Marketing_Timeline_1');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#StaticMarkets#','Static_Marketing_Timeline');                           
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter__c);
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#11datasetAlias#','#%RowNumber%datasetAlias#');                        
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Marketing_Measure_1','#MeasureRowNumbers#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Marketing__KPI_1','#KPIRowNumbers#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Marketing_Timeline_1','#StaticMarket#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Marketing_Timeline','#StaticMarkets#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('q'+ String.valueof(RowNumber-10),'#RowNumbers#').Replace('Static_Marketing__KPI_1_Filter','#Timelines#');
                             
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber-10));
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#TimeLine#','Static_Marketing_Timeline');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#MeasureRowNumbers#','Static_Marketing_Measure_1');
                            JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter_Remove__c);
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('q'+ String.valueof(RowNumber-10),'#RowNumbers#');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('Static_Marketing_Timeline','#TimeLine#');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('Static_Marketing_Measure_1','#MeasureRowNumbers#');
                        
                         JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_13');
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"row": #RowNumbers#','"row": ' + String.valueof(RowNumber-10));                            
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_13');
                            JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": #RowNumbers#','"row": ' +String.valueof(RowNumber-10));                                                        
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_13');
                              JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": #RowNumbersPill#','"row": ' +String.valueof(RowNumber+8));                                                       
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('pillbox_#pillbox#','pillbox_13');                         
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('#RowNumbers#','Static_Marketing_Toggle_KPI_'+String.valueof(RowNumber-10));
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox__c);
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox1__c);
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox2__c);
                              String pillStrNews = '"pillbox_13": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                           
                             JsonMethod =  JsonMethod.replace(JsonRec.Json_Full_pillbox__c,pillStrNews);    
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"name": "pillbox_13','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"row": ' + String.valueof(RowNumber-10),'"row": #RowNumbers#');
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_13','"name": "pillbox_#pillbox#');
                            JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": ' +String.valueof(RowNumber-10),'"row": #RowNumbers#');    
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_13','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": ' +String.valueof(RowNumber+8),'"row": #RowNumbersPill#');
                              JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('pillbox_13','pillbox_#pillbox#');                        
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('Static_Marketing_Toggle_KPI_'+String.valueof(RowNumber-10),'#RowNumbers#');
                            
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowKPISection#','Static_Marketing_Toggle_KPI_1');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowNumbers#','q1');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowNone#','none1');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_String_Toggle__c);
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('Static_Marketing_Toggle_KPI_1','#RowKPISection#');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('q1','#RowNumbers#');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('none1','#RowNone#');
                             
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('%SectionNames%','Static_Marketing__KPI_1_Filter');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#%RowNumber%queryFiltersLabel','#11queryFiltersLabel');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#%RowNumber%queryFiltersString','#11queryFiltersString');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_section3__c);
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('Static_Marketing__KPI_1_Filter','%SectionNames%');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#11queryFiltersLabel','#%RowNumber%queryFiltersLabel');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#11queryFiltersString','#%RowNumber%queryFiltersString');
                             
                   
                          
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Selector#','listselector_39') ;
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Timelines#','Static_Marketing__KPI_1_Filter') ;
                           String pillStrNewss = '"listselector_39": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                           
                          JsonMethod =  JsonMethod.replace(JsonRec.Json_ListSelector1__c,pillStrNewss);
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('listselector_39','listselector_42') ;
                          JsonMethod =  JsonMethod.Remove(JsonRec.Json_ListSelector1__c);
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('listselector_42','#Selector#') ;
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('Static_Marketing__KPI_1_Filter','#Timelines#') ;
                          
                          JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('#Selector#','listselector_42').Replace('"row": #RowNumber#','"row": 1');
                            JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('"colspan": #colspanval#','"colspan": 2').Replace('"column": #columnval#','"column": 2');
                                JsonMethod =  JsonMethod.Remove(JsonRec.Json_listselector__c);
                            JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('"row": 1','"row": 1');
                            JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('"colspan": 2','"colspan": 1').Replace('"column": 2','"column": 1');   
                                JsonMethod =  JsonMethod.Remove(JsonRec.Json_listselector__c);
                            JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('"colspan": 1','"colspan": #colspanval#').Replace('"column": 1','"column": #columnval#');
                            JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('listselector_42','#Selector#').Replace('"row": 1','"row": #RowNumber#');
                          

                           JsonMethod =  JsonMethod.Remove(JsonRec.Market_Filter1__c);
                          
                                      
                      }
                      if(RowNumber == 1){    
                             JsonMethod =  JsonMethod.remove(JsonRec.Sales_Timeline__c);
                             
                             JsonRec.Chart_Delete__c  = JsonRec.Chart_Delete__c.Replace('#chart#','chart_1') ;
                            JsonRec.Chart_Delete__c  = JsonRec.Chart_Delete__c.Replace('#Markets#','Sales_Timeline') ;
                            String newChart_1 = '"chart_1": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            JsonMethod =  JsonMethod.replace(JsonRec.Chart_Delete__c,newChart_1);
                          JsonRec.Chart_Delete__c  = JsonRec.Chart_Delete__c.Replace('chart_1','#chart#') ;
                            JsonRec.Chart_Delete__c  = JsonRec.Chart_Delete__c.Replace('Sales_Timeline','#Markets#') ;
                            
                             JsonRec.Chart_Delete_Row__c = JsonRec.Chart_Delete_Row__c.replace('"colspan": #ColSpan#','"colspan": 13').replace('"column": #ColS#','"column": 11');
                             JsonRec.Chart_Delete_Row__c = JsonRec.Chart_Delete_Row__c.replace('"row": #rows#','"row": 5').replace('#charts#','chart_1').replace('"rowspan": #rowspan#','"rowspan": 5');
                             JsonMethod =  JsonMethod.Remove(JsonRec.Chart_Delete_Row__c); 
                             JsonRec.Chart_Delete_Row__c = JsonRec.Chart_Delete_Row__c.replace('"colspan": 13','"colspan": 8').replace('"column": 11','"column": 0');
                             JsonRec.Chart_Delete_Row__c = JsonRec.Chart_Delete_Row__c.replace('"row": 5','"row": 7');
                             JsonMethod =  JsonMethod.Remove(JsonRec.Chart_Delete_Row__c); 
                             JsonRec.Chart_Delete_Row__c = JsonRec.Chart_Delete_Row__c.replace('"colspan": 8','"colspan": 4').replace('"column": 0','"column": 0');
                             JsonRec.Chart_Delete_Row__c = JsonRec.Chart_Delete_Row__c.replace('"row": 7','"row": 7');
                             JsonMethod =  JsonMethod.Remove(JsonRec.Chart_Delete_Row__c);
                             JsonRec.Chart_Delete_Row__c = JsonRec.Chart_Delete_Row__c.replace('"colspan": 4','"colspan": #ColSpan#').replace('"column": 0','"column": #ColS#');
                             JsonRec.Chart_Delete_Row__c = JsonRec.Chart_Delete_Row__c.replace('"row": 7','"row": #rows#').replace('chart_1','#charts#').replace('"rowspan": 5','"rowspan": #rowspan#');
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#%RowNumber%datasetAlias#','#1datasetAlias#');
                        
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber)).Replace('#Timelines#','Static_Sales__KPI_1_Filter');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#MeasureRowNumbers#','Static_Sales_Measure_1');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#KPIRowNumbers#','Static_Sales__KPI_1');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#StaticMarket#','Static_Sales_Timeline_1'); 
                              JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#StaticMarkets#','Static_Sales_Timeline');                           
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter__c);
                            
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#1datasetAlias#','#%RowNumber%datasetAlias#');
                            
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Sales_Measure_1','#MeasureRowNumbers#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Sales__KPI_1','#KPIRowNumbers#');                         
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Sales_Timeline_1','#StaticMarket#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Sales_Timeline','#StaticMarkets#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('q'+ String.valueof(RowNumber),'#RowNumbers#').Replace('Static_Sales__KPI_1_Filter','#Timelines#');
                             
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber));
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#TimeLine#','Static_Sales_Timeline');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#MeasureRowNumbers#','Static_Sales_Measure_1');
                            JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter_Remove__c);
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('q'+ String.valueof(RowNumber),'#RowNumbers#');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('Static_Sales_Timeline','#TimeLine#');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('Static_Sales_Measure_1','#MeasureRowNumbers#');
                            
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_1');
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"row": #RowNumbers#','"row": ' + String.valueof(RowNumber));                           
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_1');
                            JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": #RowNumbers#','"row": ' +String.valueof(RowNumber));                                                       
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_1');
                              JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": #RowNumbersPill#','"row": ' +String.valueof(RowNumber+4));                                                       
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('"pillbox_#pillbox#"','"pillbox_1"');                      
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('#RowNumbers#','Static_Sales_Toggle_KPI_'+String.valueof(RowNumber));
                             String pillStrNew1 = '"pillbox_1": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox__c);
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox1__c);
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox2__c);
                             JsonMethod =  JsonMethod.replace(JsonRec.Json_Full_pillbox__c,pillStrNew1);    
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"name": "pillbox_1','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"row": ' + String.valueof(RowNumber),'"row": #RowNumbers#');
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_1','"name": "pillbox_#pillbox#');
                            JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": ' +String.valueof(RowNumber),'"row": #RowNumbers#');   
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_1','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": ' +String.valueof(RowNumber+4),'"row": #RowNumbersPill#');
                              JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('"pillbox_1"','"pillbox_#pillbox#"');                         
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('Static_Sales_Toggle_KPI_'+String.valueof(RowNumber),'#RowNumbers#');
                            
                              JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowKPISection#','Static_Sales_Toggle_KPI_1');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowNumbers#','q1');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowNone#','none1');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_String_Toggle__c);
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('Static_Sales_Toggle_KPI_1','#RowKPISection#');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('q1','#RowNumbers#');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('none1','#RowNone#');    
                             
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('%SectionNames%','Static_Sales__KPI_1_Filter');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#%RowNumber%queryFiltersLabel','#1queryFiltersLabel');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#%RowNumber%queryFiltersString','#1queryFiltersString');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_section3__c);
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('Static_Sales__KPI_1_Filter','%SectionNames%');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#1queryFiltersLabel','#%RowNumber%queryFiltersLabel');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#1queryFiltersString','#%RowNumber%queryFiltersString'); 
                             

                         
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Selector#','listselector_29') ;
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Timelines#','Static_Sales__KPI_1_Filter') ;
                          String pillStrNewlist29 = '"listselector_29": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                          JsonMethod =  JsonMethod.replace(JsonRec.Json_ListSelector1__c,pillStrNewlist29);
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('listselector_29','#Selector#') ;
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('Static_Sales__KPI_1_Filter','#Timelines#') ; 
                          JsonMethod =  JsonMethod.Remove(JsonRec.Sales_Filter1__c); 
                      } 
                      if(RowNumber == 2){
                             
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#%RowNumber%datasetAlias#','#2datasetAlias#');
                     
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber)).Replace('#Timelines#','Static_Sales__KPI_2_Filter');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#MeasureRowNumbers#','Static_Sales_Measure_2');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#KPIRowNumbers#','Static_Sales__KPI_2');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#StaticMarket#','Static_Sales_Timeline_2');  
                              JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#StaticMarkets#','Static_Sales_Timeline');                           
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter__c);
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#2datasetAlias#','#%RowNumber%datasetAlias#');
                             
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Sales_Measure_2','#MeasureRowNumbers#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Sales__KPI_2','#KPIRowNumbers#');                         
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Sales_Timeline_2','#StaticMarket#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Sales_Timeline','#StaticMarkets#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('q'+ String.valueof(RowNumber),'#RowNumbers#').Replace('Static_Sales__KPI_2_Filter','#Timelines#');
                        
                             JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber));
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#TimeLine#','Static_Sales_Timeline');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#MeasureRowNumbers#','Static_Sales_Measure_2');
                            JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter_Remove__c);
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('q'+ String.valueof(RowNumber),'#RowNumbers#');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('Static_Sales_Timeline','#TimeLine#');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('Static_Sales_Measure_2','#MeasureRowNumbers#');
                            
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_2');
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"row": #RowNumbers#','"row": ' + String.valueof(RowNumber));                           
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_2');
                            JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": #RowNumbers#','"row": ' +String.valueof(RowNumber));                                                       
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_2');
                              JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": #RowNumbersPill#','"row": ' +String.valueof(RowNumber+4));                                                       
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('pillbox_#pillbox#','pillbox_2');                      
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('#RowNumbers#','Static_Sales_Toggle_KPI_'+String.valueof(RowNumber));
                             String pillStrNew2 = '"pillbox_2": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox__c);
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox1__c);
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox2__c);
                             JsonMethod =  JsonMethod.replace(JsonRec.Json_Full_pillbox__c,pillStrNew2);    
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"name": "pillbox_2','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"row": ' + String.valueof(RowNumber),'"row": #RowNumbers#');
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_2','"name": "pillbox_#pillbox#');
                            JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": ' +String.valueof(RowNumber),'"row": #RowNumbers#');   
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_2','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": ' +String.valueof(RowNumber+4),'"row": #RowNumbersPill#');
                              JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('pillbox_2','pillbox_#pillbox#');                         
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('Static_Sales_Toggle_KPI_'+String.valueof(RowNumber),'#RowNumbers#');
                            
                              JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowKPISection#','Static_Sales_Toggle_KPI_2');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowNumbers#','q2');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowNone#','none2');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_String_Toggle__c);
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('Static_Sales_Toggle_KPI_2','#RowKPISection#');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('q2','#RowNumbers#');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('none2','#RowNone#');
                             
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('%SectionNames%','Static_Sales__KPI_2_Filter');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#%RowNumber%queryFiltersLabel','#2queryFiltersLabel');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#%RowNumber%queryFiltersString','#2queryFiltersString');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_section3__c);
                              JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('Static_Sales__KPI_2_Filter','%SectionNames%');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#2queryFiltersLabel','#%RowNumber%queryFiltersLabel');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#2queryFiltersString','#%RowNumber%queryFiltersString');   
                             
                         
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Selector#','listselector_30') ;
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Timelines#','Static_Sales__KPI_2_Filter') ;
                          String pillStrNewlist30 = '"listselector_30": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                          JsonMethod =  JsonMethod.replace(JsonRec.Json_ListSelector1__c,pillStrNewlist30);
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('listselector_30','#Selector#') ;
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('Static_Sales__KPI_2_Filter','#Timelines#') ; 
                          JsonMethod =  JsonMethod.Remove(JsonRec.Sales_Filter2__c); 
                      }    
                      
                       if(RowNumber == 3){
                       
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#%RowNumber%datasetAlias#','#3datasetAlias#');
                        
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber)).Replace('#Timelines#','Static_Sales__KPI_3_Filter');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#MeasureRowNumbers#','Static_Sales_Measure_3');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#KPIRowNumbers#','Static_Sales__KPI_3');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#StaticMarket#','Static_Sales_Timeline_3'); 
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#StaticMarkets#','Static_Sales_Timeline');                           
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter__c);
                            
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#3datasetAlias#','#%RowNumber%datasetAlias#');
                          
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Sales_Measure_3','#MeasureRowNumbers#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Sales__KPI_3','#KPIRowNumbers#');                         
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Sales_Timeline','#StaticMarkets#');
                               JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Sales_Timeline_3','#StaticMarket#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('q'+ String.valueof(RowNumber),'#RowNumbers#').Replace('Static_Sales__KPI_3_Filter','#Timelines#');
                             
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber));
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#TimeLine#','Static_Sales_Timeline');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#MeasureRowNumbers#','Static_Sales_Measure_3');
                            JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter_Remove__c);
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('q'+ String.valueof(RowNumber),'#RowNumbers#');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('Static_Sales_Timeline','#TimeLine#');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('Static_Sales_Measure_3','#MeasureRowNumbers#');
                            
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_3');
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"row": #RowNumbers#','"row": ' + String.valueof(RowNumber));                           
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_3');
                            JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": #RowNumbers#','"row": ' +String.valueof(RowNumber));                                                       
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_3');
                              JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": #RowNumbersPill#','"row": ' +String.valueof(RowNumber+4));                                                       
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('pillbox_#pillbox#','pillbox_3');                      
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('#RowNumbers#','Static_Sales_Toggle_KPI_'+String.valueof(RowNumber));
                             String pillStrNew3 = '"pillbox_3": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox__c);
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox1__c);
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox2__c);
                             JsonMethod =  JsonMethod.replace(JsonRec.Json_Full_pillbox__c,pillStrNew3);    
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"name": "pillbox_3','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"row": ' + String.valueof(RowNumber),'"row": #RowNumbers#');
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_3','"name": "pillbox_#pillbox#');
                            JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": ' +String.valueof(RowNumber),'"row": #RowNumbers#');   
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_3','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": ' +String.valueof(RowNumber+4),'"row": #RowNumbersPill#');
                              JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('pillbox_3','pillbox_#pillbox#');                         
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('Static_Sales_Toggle_KPI_'+String.valueof(RowNumber),'#RowNumbers#');
                            
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowKPISection#','Static_Sales_Toggle_KPI_3');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowNumbers#','q3');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowNone#','none3');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_String_Toggle__c);
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('Static_Sales_Toggle_KPI_3','#RowKPISection#');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('q3','#RowNumbers#');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('none3','#RowNone#');
                             
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('%SectionNames%','Static_Sales__KPI_3_Filter');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#%RowNumber%queryFiltersLabel','#3queryFiltersLabel');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#%RowNumber%queryFiltersString','#3queryFiltersString');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_section3__c);
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('Static_Sales__KPI_3_Filter','%SectionNames%');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#3queryFiltersLabel','#%RowNumber%queryFiltersLabel');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#3queryFiltersString','#%RowNumber%queryFiltersString'); 
                             
                         
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Selector#','listselector_31') ;
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Timelines#','Static_Sales__KPI_3_Filter') ;
                          String pillStrNewlist31 = '"listselector_31": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                          JsonMethod =  JsonMethod.replace(JsonRec.Json_ListSelector1__c,pillStrNewlist31);
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('listselector_31','#Selector#') ;
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('Static_Sales__KPI_3_Filter','#Timelines#') ; 
                          JsonMethod =  JsonMethod.Remove(JsonRec.Sales_Filter3__c);
                             
                      } 
                       if(RowNumber == 4){
                            
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#%RowNumber%datasetAlias#','#4datasetAlias#');
                           JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber)).Replace('#Timelines#','Static_Sales__KPI_4_Filter');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#MeasureRowNumbers#','Static_Sales_Measure_4');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#KPIRowNumbers#','Static_Sales__KPI_4');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#StaticMarket#','Static_Sales_Timeline_4');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#StaticMarkets#','Static_Sales_Timeline');                           
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter__c);
                             
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#4datasetAlias#','#%RowNumber%datasetAlias#');
                         
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Sales_Measure_4','#MeasureRowNumbers#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Sales__KPI_4','#KPIRowNumbers#');                         
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Sales_Timeline_4','#StaticMarket#');
                              JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Sales_Timeline','#StaticMarkets#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('q'+ String.valueof(RowNumber),'#RowNumbers#').Replace('Static_Sales__KPI_4_Filter','#Timelines#');
                             
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber));
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#TimeLine#','Static_Sales_Timeline');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#MeasureRowNumbers#','Static_Sales_Measure_4');
                            JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter_Remove__c);
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('q'+ String.valueof(RowNumber),'#RowNumbers#');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('Static_Sales_Timeline','#TimeLine#');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('Static_Sales_Measure_4','#MeasureRowNumbers#');
                            
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_4');
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"row": #RowNumbers#','"row": ' + String.valueof(RowNumber));                           
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_4');
                            JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": #RowNumbers#','"row": ' +String.valueof(RowNumber));                                                       
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_4');
                              JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": #RowNumbersPill#','"row": ' +String.valueof(RowNumber+4));                                                       
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('pillbox_#pillbox#','pillbox_4');                      
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('#RowNumbers#','Static_Sales_Toggle_KPI_'+String.valueof(RowNumber));
                             String pillStrNew4 = '"pillbox_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox__c);
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox1__c);
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox2__c);
                             JsonMethod =  JsonMethod.replace(JsonRec.Json_Full_pillbox__c,pillStrNew4);    
                          //  System.debug('&&&&&&&&&&&&&&&&&&&&JsonRec.Json_Full_pillbox__c' + JsonRec.Json_Full_pillbox__c);
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"name": "pillbox_4','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"row": ' + String.valueof(RowNumber),'"row": #RowNumbers#');
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_4','"name": "pillbox_#pillbox#');
                            JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": ' +String.valueof(RowNumber),'"row": #RowNumbers#');   
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_4','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": ' +String.valueof(RowNumber+4),'"row": #RowNumbersPill#');
                              JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('pillbox_4','pillbox_#pillbox#');                         
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('Static_Sales_Toggle_KPI_'+String.valueof(RowNumber),'#RowNumbers#');
                            
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowKPISection#','Static_Sales_Toggle_KPI_4');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowNumbers#','q4');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowNone#','none4');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_String_Toggle__c);
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('Static_Sales_Toggle_KPI_4','#RowKPISection#');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('q4','#RowNumbers#');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('none4','#RowNone#');
                             
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('%SectionNames%','Static_Sales__KPI_4_Filter');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#%RowNumber%queryFiltersLabel','#4queryFiltersLabel');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#%RowNumber%queryFiltersString','#4queryFiltersString');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_section3__c);
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('Static_Sales__KPI_4_Filter','%SectionNames%');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#4queryFiltersLabel','#%RowNumber%queryFiltersLabel');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#4queryFiltersString','#%RowNumber%queryFiltersString'); 
                             
                          
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Selector#','listselector_32') ;
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Timelines#','Static_Sales__KPI_4_Filter') ;
                          String pillStrNewlist32 = '"listselector_32": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                          JsonMethod =  JsonMethod.replace(JsonRec.Json_ListSelector1__c,pillStrNewlist32);
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('listselector_32','#Selector#') ;
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('Static_Sales__KPI_4_Filter','#Timelines#') ; 
                          JsonMethod =  JsonMethod.Remove(JsonRec.Sales_Filter4__c);     
                      } 
                       if(RowNumber == 5){
                    
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#%RowNumber%datasetAlias#','#5datasetAlias#');
                        
                            JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber)).Replace('#Timelines#','Static_Sales__KPI_5_Filter');
                            JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#MeasureRowNumbers#','Static_Sales_Measure_5');
                            JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#KPIRowNumbers#','Static_Sales__KPI_5');
                            JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#StaticMarkets#','Static_Sales_Timeline');
                            JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#StaticMarket#','Static_Sales_Timeline_5');                           
                            JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter__c);
                            
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#5datasetAlias#','#%RowNumber%datasetAlias#');
                           
                            JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Sales_Measure_5','#MeasureRowNumbers#');
                            JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Sales__KPI_5','#KPIRowNumbers#');                         
                            JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Sales_Timeline','#StaticMarkets#');
                            JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Sales_Timeline_5','#StaticMarket#');
                            JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('q'+ String.valueof(RowNumber),'#RowNumbers#').Replace('Static_Sales__KPI_5_Filter','#Timelines#');
                            
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber));
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#TimeLine#','Static_Sales_Timeline');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#MeasureRowNumbers#','Static_Sales_Measure_5');
                            JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter_Remove__c);
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('q'+ String.valueof(RowNumber),'#RowNumbers#');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('Static_Sales_Timeline','#TimeLine#');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('Static_Sales_Measure_5','#MeasureRowNumbers#');
                            
                            //JsonRec.Json_Pillbox_comma__c =  JsonRec.Json_Pillbox_comma__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_5');
                            //JsonRec.Json_Pillbox_comma__c =  JsonRec.Json_Pillbox_comma__c.Replace('"row": #RowNumbers#','"row": ' + String.valueof(RowNumber));                           
                            JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_5');
                            JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": #RowNumbers#','"row": ' +String.valueof(RowNumber));                                                       
                            JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_5');
                            JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": #RowNumbersPill#','"row": ' +String.valueof(RowNumber+4));                                                       
                            
                            JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('"pillbox_#pillbox#"','"pillbox_5"');                      
                            JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('#RowNumbers#','Static_Sales_Toggle_KPI_'+String.valueof(RowNumber));
                            String pillStrNew5 = '"pillbox_5": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            //JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox_comma__c);
                            JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox1__c);
                            JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox2__c);
                            JsonMethod =  JsonMethod.replace(JsonRec.Json_Full_pillbox__c,pillStrNew5);    
                         //   System.debug('&&&&&&&&&&&&&&&&&&&&JsonRec.Json_Full_pillbox__c' + JsonRec.Json_Full_pillbox__c);
                            //JsonRec.Json_Pillbox_comma__c =  JsonRec.Json_Pillbox_comma__c.Replace('"name": "pillbox_5','"name": "pillbox_#pillbox#');
                            //JsonRec.Json_Pillbox_comma__c =  JsonRec.Json_Pillbox_comma__c.Replace('"row": ' + String.valueof(RowNumber),'"row": #RowNumbers#');
                            JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_5','"name": "pillbox_#pillbox#');
                            JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": ' +String.valueof(RowNumber),'"row": #RowNumbers#');   
                            JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_5','"name": "pillbox_#pillbox#');
                            JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": ' +String.valueof(RowNumber+4),'"row": #RowNumbersPill#');
                            JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('"pillbox_5"','"pillbox_#pillbox#"');                         
                            JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('Static_Sales_Toggle_KPI_'+String.valueof(RowNumber),'#RowNumbers#');
                            
                            JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowKPISection#','Static_Sales_Toggle_KPI_5');
                            JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowNumbers#','q5');
                            JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowNone#','none5');
                            JsonMethod =  JsonMethod.remove(JsonRec.Json_String_Toggle__c);
                            JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('Static_Sales_Toggle_KPI_5','#RowKPISection#');
                            JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('q5','#RowNumbers#');
                            JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('none5','#RowNone#');    
                            
                            JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('%SectionNames%','Static_Sales__KPI_5_Filter');
                            JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#%RowNumber%queryFiltersLabel','#1queryFiltersLabel');
                            JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#%RowNumber%queryFiltersString','#1queryFiltersString');
                            JsonMethod =  JsonMethod.remove(JsonRec.Json_section3__c);
                            JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('Static_Sales__KPI_5_Filter','%SectionNames%');
                            JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#1queryFiltersLabel','#%RowNumber%queryFiltersLabel');
                            JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#1queryFiltersString','#%RowNumber%queryFiltersString'); 
                            
                            JsonMethod =  JsonMethod.remove(JsonRec.Filter5_deleted__c);
                            
                            JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Selector#','listselector_33') ;
                            JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Timelines#','Static_Sales__KPI_5_Filter') ;
                            String pillStrNewlist33 = '"listselector_33": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            JsonMethod =  JsonMethod.replace(JsonRec.Json_ListSelector1__c,pillStrNewlist33);
                            JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('listselector_33','#Selector#') ;
                            JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('Static_Sales__KPI_5_Filter','#Timelines#') ;
                            
                            JsonMethod =  JsonMethod.Remove(JsonRec.Json_Pillbox5__c);
                            
                            JsonMethod =  JsonMethod.Remove(JsonRec.Sales_Filter5__c);
                      } 
                      
                       if(RowNumber == 6){
                              JsonMethod =  JsonMethod.remove(JsonRec.Success_Timeline__c);
                                JsonRec.Chart_Delete__c  = JsonRec.Chart_Delete__c.Replace('#chart#','chart_3') ;
                            JsonRec.Chart_Delete__c  = JsonRec.Chart_Delete__c.Replace('#Markets#','Success_Timeline') ;
                            String chartNew = '"chart_3": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            JsonMethod =  JsonMethod.replace(JsonRec.Chart_Delete__c,chartNew);
                          JsonRec.Chart_Delete__c  = JsonRec.Chart_Delete__c.Replace('chart_3','#chart#') ;
                            JsonRec.Chart_Delete__c  = JsonRec.Chart_Delete__c.Replace('Success_Timeline','#Markets#') ;
                            
                        //      JsonRec.Chart_Delete_Row__c = JsonRec.Chart_Delete_Row__c.replace('"colspan": #ColSpan#','"colspan": 13').replace('"column": #ColS#','"column": 11');
                        //      JsonRec.Chart_Delete_Row__c = JsonRec.Chart_Delete_Row__c.replace('"row": #rows#','"row": 12').replace('#charts#','chart_3').replace('"rowspan": #rowspan#','"rowspan": 5');
                        //      JsonMethod =  JsonMethod.Remove(JsonRec.Chart_Delete_Row__c); 
                        //   //  System.debug('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!' + JsonRec.Chart_Delete_Row__c);
                        //      JsonRec.Chart_Delete_Row__c = JsonRec.Chart_Delete_Row__c.replace('"colspan": 13','"colspan": 8').replace('"column": 11','"column": 0');
                        //      JsonRec.Chart_Delete_Row__c = JsonRec.Chart_Delete_Row__c.replace('"row": 12','"row": 7');
                        //      JsonMethod =  JsonMethod.Remove(JsonRec.Json_Number1__c); 
                        //   //  System.debug('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!@@@' + JsonRec.Chart_Delete_Row__c);
                        //      JsonRec.Chart_Delete_Row__c = JsonRec.Chart_Delete_Row__c.replace('"colspan": 8','"colspan": 4').replace('"column": 0','"column": 0');
                        //      JsonRec.Chart_Delete_Row__c = JsonRec.Chart_Delete_Row__c.replace('"row": 7','"row": 7');
                        //      JsonMethod =  JsonMethod.Remove(JsonRec.Json_Number1__c);
                        //   //  System.debug('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!$$$$' + JsonRec.Chart_Delete_Row__c);
                        //      JsonRec.Chart_Delete_Row__c = JsonRec.Chart_Delete_Row__c.replace('"colspan": 4','"colspan": #ColSpan#').replace('"column": 0','"column": #ColS#');
                        //      JsonRec.Chart_Delete_Row__c = JsonRec.Chart_Delete_Row__c.replace('"row": 7','"row": #rows#').replace('chart_3','#charts#').replace('"rowspan": 5','"rowspan": #rowspan#');
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#%RowNumber%datasetAlias#','#6datasetAlias#');
                     
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber-5)).Replace('#Timelines#','Static_Success__KPI_1_Filter');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#MeasureRowNumbers#','Static_Success_Measure_1');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#KPIRowNumbers#','Static_Success__KPI_1');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#StaticMarket#','Static_Success_Timeline_1');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#StaticMarkets#','Static_Success_Timeline');                         
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter__c);
                            
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#6datasetAlias#','#%RowNumber%datasetAlias#');
                           
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Success_Measure_1','#MeasureRowNumbers#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Success__KPI_1','#KPIRowNumbers#');                           
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Success_Timeline_1','#StaticMarket#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Success_Timeline','#StaticMarkets#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('q'+ String.valueof(RowNumber-5),'#RowNumbers#').Replace('Static_Success__KPI_1_Filter','#Timelines#');
                             
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber-5));
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#TimeLine#','Static_Success_Timeline');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#MeasureRowNumbers#','Static_Success_Measure_1');
                            JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter_Remove__c);
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('q'+ String.valueof(RowNumber-5),'#RowNumbers#');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('Static_Success_Timeline','#TimeLine#');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('Static_Success_Measure_1','#MeasureRowNumbers#');
                              
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_7');
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"row": #RowNumbers#','"row": ' + String.valueof(RowNumber-5));                         
                            
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_7');
                            JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": #RowNumbers#','"row": ' +String.valueof(RowNumber-5));                                                     
                             
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_7');
                              JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": #RowNumbersPill#','"row": ' +String.valueof(RowNumber+6));                                                       
                            
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('pillbox_#pillbox#','pillbox_7');                      
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('#RowNumbers#','Static_Success_Toggle_KPI_'+String.valueof(RowNumber-5));
                             String pillStrNew7 = '"pillbox_7": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox__c);
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox1__c);
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox2__c);
                             JsonMethod =  JsonMethod.replace(JsonRec.Json_Full_pillbox__c,pillStrNew7);    
                             
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"name": "pillbox_7','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"row": ' + String.valueof(RowNumber-5),'"row": #RowNumbers#');
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_7','"name": "pillbox_#pillbox#');
                            JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": ' +String.valueof(RowNumber-5),'"row": #RowNumbers#'); 
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_7','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": ' +String.valueof(RowNumber+6),'"row": #RowNumbersPill#');
                              JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('pillbox_7','pillbox_#pillbox#');                         
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('Static_Success_Toggle_KPI_'+String.valueof(RowNumber-5),'#RowNumbers#');
                             
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowKPISection#','Static_Success_Toggle_KPI_1').Replace('#RowNumbers#','q1').Replace('#RowNone#','none1');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_String_Toggle__c);
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('Static_Success_Toggle_KPI_1','#RowKPISection#').Replace('q1','#RowNumbers#').Replace('none1','#RowNone#');    
                             
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('%SectionNames%','Static_Success__KPI_1_Filter').Replace('#%RowNumber%queryFiltersLabel','#6queryFiltersLabel').Replace('#%RowNumber%queryFiltersString','#6queryFiltersString');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_section3__c);
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('Static_Success__KPI_1_Filter','%SectionNames%').Replace('#6queryFiltersLabel','#%RowNumber%queryFiltersLabel').Replace('#6queryFiltersString','#%RowNumber%queryFiltersString'); 
                            
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Selector#','listselector_34').Replace('#Timelines#','Static_Success__KPI_1_Filter') ;
                          String pillStrNewlist34 = '"listselector_34": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                          JsonMethod =  JsonMethod.replace(JsonRec.Json_ListSelector1__c,pillStrNewlist34);
                         JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('listselector_34','#Selector#').Replace('Static_Success__KPI_1_Filter','#Timelines#') ;
                          JsonMethod =  JsonMethod.Remove(JsonRec.Success_KPI_1__c);
                          JsonMethod =  JsonMethod.Remove(JsonRec.Success_Filter1__c);
                             
                      } 
                       if(RowNumber == 7){
                        
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#%RowNumber%datasetAlias#','#7datasetAlias#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber-5)).Replace('#Timelines#','Static_Success__KPI_2_Filter');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#MeasureRowNumbers#','Static_Success_Measure_2').Replace('#KPIRowNumbers#','Static_Success__KPI_2').Replace('#StaticMarket#','Static_Success_Timeline_2').Replace('#StaticMarkets#','Static_Success_Timeline');                         
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter__c);
                            
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#7datasetAlias#','#%RowNumber%datasetAlias#');
                            
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Success_Measure_2','#MeasureRowNumbers#').Replace('Static_Success__KPI_2','#KPIRowNumbers#').Replace('Static_Success_Timeline_2','#StaticMarket#').Replace('Static_Success_Timeline','#StaticMarkets#').Replace('q'+ String.valueof(RowNumber-5),'#RowNumbers#').Replace('Static_Success__KPI_2_Filter','#Timelines#');
                             
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber-5)).Replace('#TimeLine#','Static_Success_Timeline').Replace('#MeasureRowNumbers#','Static_Success_Measure_2');
                            JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter_Remove__c);
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('q'+ String.valueof(RowNumber-5),'#RowNumbers#').Replace('Static_Success_Timeline','#TimeLine#').Replace('Static_Success_Measure_2','#MeasureRowNumbers#');
                             
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_8').Replace('"row": #RowNumbers#','"row": ' + String.valueof(RowNumber-5));                         
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_8').Replace('"row": #RowNumbers#','"row": ' +String.valueof(RowNumber-5));                                                     
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_8').Replace('"row": #RowNumbersPill#','"row": ' +String.valueof(RowNumber+6));                                                       
                             
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('pillbox_#pillbox#','pillbox_8');                      
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('#RowNumbers#','Static_Success_Toggle_KPI_'+String.valueof(RowNumber-5));
                             String pillStrNew8 = '"pillbox_8": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox__c).remove(JsonRec.Json_Pillbox1__c).remove(JsonRec.Json_Pillbox2__c).replace(JsonRec.Json_Full_pillbox__c,pillStrNew8);    
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"name": "pillbox_8','"name": "pillbox_#pillbox#').Replace('"row": ' + String.valueof(RowNumber-5),'"row": #RowNumbers#');
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_8','"name": "pillbox_#pillbox#').Replace('"row": ' +String.valueof(RowNumber-5),'"row": #RowNumbers#'); 
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_8','"name": "pillbox_#pillbox#').Replace('"row": ' +String.valueof(RowNumber+6),'"row": #RowNumbersPill#');
                             
                              JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('pillbox_8','pillbox_#pillbox#').Replace('Static_Success_Toggle_KPI_'+String.valueof(RowNumber-5),'#RowNumbers#');
                             
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowKPISection#','Static_Success_Toggle_KPI_2').Replace('#RowNumbers#','q2').Replace('#RowNone#','none2');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_String_Toggle__c);
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('Static_Success_Toggle_KPI_2','#RowKPISection#').Replace('q2','#RowNumbers#').Replace('none2','#RowNone#');
                             
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('%SectionNames%','Static_Success__KPI_2_Filter').Replace('#%RowNumber%queryFiltersLabel','#7queryFiltersLabel').Replace('#%RowNumber%queryFiltersString','#7queryFiltersString');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_section3__c);   
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('Static_Success__KPI_2_Filter','%SectionNames%').Replace('#7queryFiltersLabel','#%RowNumber%queryFiltersLabel').Replace('#7queryFiltersString','#%RowNumber%queryFiltersString');     
                             
                          
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Selector#','listselector_35').Replace('},','}') ;
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Timelines#','Static_Success__KPI_2_Filter') ;
                          String pillStrNewlist35 = '"listselector_35": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                          JsonMethod =  JsonMethod.replace(JsonRec.List_Selector35__c,pillStrNewlist35);
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('listselector_35','#Selector#').Replace('}','},') ;
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('Static_Success__KPI_2_Filter','#Timelines#') ;  
                          JsonMethod =  JsonMethod.Remove(JsonRec.Success_KPI_2__c);
                          JsonMethod =  JsonMethod.Remove(JsonRec.Success_Filter2__c);
                          
                      } 
                       if(RowNumber == 8){
                        
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#%RowNumber%datasetAlias#','#8datasetAlias#');
                        
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber-5)).Replace('#Timelines#','Static_Success__KPI_3_Filter');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#MeasureRowNumbers#','Static_Success_Measure_3');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#KPIRowNumbers#','Static_Success__KPI_3');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#StaticMarkets#','Static_Success_Timeline'); 
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#StaticMarket#','Static_Success_Timeline_3');                         
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter__c);
                             
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#8datasetAlias#','#%RowNumber%datasetAlias#');
                           
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Success_Measure_3','#MeasureRowNumbers#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Success__KPI_3','#KPIRowNumbers#');                           
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Success_Timeline_3','#StaticMarket#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Success_Timeline','#StaticMarkets#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('q'+ String.valueof(RowNumber-5),'#RowNumbers#').Replace('Static_Success__KPI_3_Filter','#Timelines#');
                             
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber-5));
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#TimeLine#','Static_Success_Timeline');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#MeasureRowNumbers#','Static_Success_Measure_3');
                            JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter_Remove__c);
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('q'+ String.valueof(RowNumber-5),'#RowNumbers#');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('Static_Success_Timeline','#TimeLine#');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('Static_Success_Measure_3','#MeasureRowNumbers#');
                            
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_9');
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"row": #RowNumbers#','"row": ' + String.valueof(RowNumber-5));                         
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_9');
                            JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": #RowNumbers#','"row": ' +String.valueof(RowNumber-5));                                                     
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_9');
                              JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": #RowNumbersPill#','"row": ' +String.valueof(RowNumber+6));                                                       
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('pillbox_#pillbox#','pillbox_9');                      
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('#RowNumbers#','Static_Success_Toggle_KPI_'+String.valueof(RowNumber-5));
                             String pillStrNew9 = '"pillbox_9": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox__c);
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox1__c);
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox2__c);
                             JsonMethod =  JsonMethod.replace(JsonRec.Json_Full_pillbox__c,pillStrNew9);    
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"name": "pillbox_9','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"row": ' + String.valueof(RowNumber-5),'"row": #RowNumbers#');
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_9','"name": "pillbox_#pillbox#');
                            JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": ' +String.valueof(RowNumber-5),'"row": #RowNumbers#'); 
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_9','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": ' +String.valueof(RowNumber+6),'"row": #RowNumbersPill#');
                              JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('pillbox_9','pillbox_#pillbox#');                         
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('Static_Success_Toggle_KPI_'+String.valueof(RowNumber-5),'#RowNumbers#');
                            
                              JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowKPISection#','Static_Success_Toggle_KPI_3');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowNumbers#','q3').Replace('#RowNone#','none3');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_String_Toggle__c);
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('Static_Success_Toggle_KPI_3','#RowKPISection#');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('q3','#RowNumbers#').Replace('none3','#RowNone#');
                             
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('%SectionNames%','Static_Success__KPI_3_Filter').Replace('#%RowNumber%queryFiltersLabel','#8queryFiltersLabel').Replace('#%RowNumber%queryFiltersString','#8queryFiltersString');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_section3__c);
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('Static_Success__KPI_3_Filter','%SectionNames%').Replace('#8queryFiltersLabel','#%RowNumber%queryFiltersLabel').Replace('#8queryFiltersString','#%RowNumber%queryFiltersString');  
                             
                          
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Selector#','listselector_36').Replace('#Timelines#','Static_Success__KPI_3_Filter') ;
                          String pillStrNewlist36 = '"listselector_36": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                          JsonMethod =  JsonMethod.replace(JsonRec.Json_ListSelector1__c,pillStrNewlist36);
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('listselector_36','#Selector#').Replace('Static_Success__KPI_3_Filter','#Timelines#') ;  
                          JsonMethod =  JsonMethod.Remove(JsonRec.Success_KPI_3__c);
                          JsonMethod =  JsonMethod.Remove(JsonRec.Success_Filter3__c);
                      } 
                       if(RowNumber == 9){
                        
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#%RowNumber%datasetAlias#','#9datasetAlias#');
                        
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber-5)).Replace('#MeasureRowNumbers#','Static_Success_Measure_4').Replace('#KPIRowNumbers#','Static_Success__KPI_4').Replace('#StaticMarkets#','Static_Success_Timeline').Replace('#StaticMarket#','Static_Success_Timeline_4').Replace('#Timelines#','Static_Success__KPI_4_Filter');                         
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter__c);
                            
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#9datasetAlias#','#%RowNumber%datasetAlias#');
                           
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Success_Measure_4','#MeasureRowNumbers#').Replace('Static_Success__KPI_4','#KPIRowNumbers#').Replace('Static_Success_Timeline','#StaticMarkets#').Replace('Static_Success_Timeline_4','#StaticMarket#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('q'+ String.valueof(RowNumber-5),'#RowNumbers#').Replace('Static_Success__KPI_4_Filter','#Timelines#');
                             
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber-5)).Replace('#TimeLine#','Static_Success_Timeline').Replace('#MeasureRowNumbers#','Static_Success_Measure_4');
                            JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter_Remove__c);
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('q'+ String.valueof(RowNumber-5),'#RowNumbers#').Replace('Static_Success_Timeline','#TimeLine#').Replace('Static_Success_Measure_4','#MeasureRowNumbers#');
                            
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_11');
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"row": #RowNumbers#','"row": ' + String.valueof(RowNumber-5));                         
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_11');
                            JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": #RowNumbers#','"row": ' +String.valueof(RowNumber-5));                                                     
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_11');
                              JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": #RowNumbersPill#','"row": ' +String.valueof(RowNumber+6));                                                       
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('pillbox_#pillbox#','pillbox_11');                         
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('#RowNumbers#','Static_Success_Toggle_KPI_'+String.valueof(RowNumber-5));
                             String pillStrNew11 = '"pillbox_11": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox__c);
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox1__c);
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox2__c);
                             JsonMethod =  JsonMethod.replace(JsonRec.Json_Full_pillbox__c,pillStrNew11);        
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"name": "pillbox_11','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox__c =  JsonRec.Json_Pillbox__c.Replace('"row": ' + String.valueof(RowNumber-5),'"row": #RowNumbers#');
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_11','"name": "pillbox_#pillbox#');
                            JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": ' +String.valueof(RowNumber-5),'"row": #RowNumbers#'); 
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_11','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": ' +String.valueof(RowNumber+6),'"row": #RowNumbersPill#');
                              JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('pillbox_11','pillbox_#pillbox#');                        
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('Static_Success_Toggle_KPI_'+String.valueof(RowNumber-5),'#RowNumbers#');
                             
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowKPISection#','Static_Success_Toggle_KPI_4');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowNumbers#','q4').Replace('#RowNone#','none4');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_String_Toggle__c);
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('Static_Success_Toggle_KPI_4','#RowKPISection#');
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('q4','#RowNumbers#').Replace('none4','#RowNone#');
                             
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('%SectionNames%','Static_Success__KPI_4_Filter');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#%RowNumber%queryFiltersLabel','#9queryFiltersLabel').Replace('#%RowNumber%queryFiltersString','#9queryFiltersString');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_section3__c);
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('Static_Success__KPI_4_Filter','%SectionNames%');
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('#9queryFiltersLabel','#%RowNumber%queryFiltersLabel').Replace('#9queryFiltersString','#%RowNumber%queryFiltersString');
                         
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Selector#','listselector_37').Replace('#Timelines#','Static_Success__KPI_4_Filter') ;
                           String pillStrNewlist37 = '"listselector_37": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                          JsonMethod =  JsonMethod.replace(JsonRec.Json_ListSelector1__c,pillStrNewlist37);
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('listselector_37','#Selector#').Replace('Static_Success__KPI_4_Filter','#Timelines#') ; 
                          
                          JsonMethod =  JsonMethod.Remove(JsonRec.Success_KPI_4__c);
                          JsonMethod =  JsonMethod.Remove(JsonRec.Success_Filter4__c);
                      } 
                       if(RowNumber == 10){
                             
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#%RowNumber%datasetAlias#','#10datasetAlias#');
                        
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber-5)).Replace('#MeasureRowNumbers#','Static_Success_Measure_5').Replace('#Timelines#','Static_Success__KPI_5_Filter');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('#KPIRowNumbers#','Static_Success__KPI_5').Replace('#StaticMarket#','Static_Success_Timeline_5').Replace('#StaticMarkets#','Static_Success_Timeline');                         
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter__c);
                             
                             JsonRec.Json_Filter__c = JsonRec.Json_Filter__c.Replace('#10datasetAlias#','#%RowNumber%datasetAlias#');
                          
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('Static_Success_Measure_5','#MeasureRowNumbers#').Replace('Static_Success__KPI_5','#KPIRowNumbers#').Replace('Static_Success_Timeline_5','#StaticMarket#').Replace('Static_Success_Timeline','#StaticMarkets#');
                             JsonRec.Json_Filter__c  =  JsonRec.Json_Filter__c.Replace('q'+String.valueof(RowNumber-5),'#RowNumbers#').Replace('Static_Success__KPI_5_Filter','#Timelines#');
                             
                             JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#RowNumbers#','q'+ String.valueof(RowNumber-5));
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('#TimeLine#','Static_Success_Timeline').Replace('#MeasureRowNumbers#','Static_Success_Measure_5');
                            JsonMethod =  JsonMethod.remove(JsonRec.Json_Filter_Remove__c);
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('q'+ String.valueof(RowNumber-5),'#RowNumbers#');
                            JsonRec.Json_Filter_Remove__c = JsonRec.Json_Filter_Remove__c.Replace('Static_Success_Timeline','#TimeLine#').Replace('Static_Success_Measure_5','#MeasureRowNumbers#');
                             
                           //  JsonRec.Json_Pillbox_comma__c =  JsonRec.Json_Pillbox_comma__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_12');
                           //  JsonRec.Json_Pillbox_comma__c =  JsonRec.Json_Pillbox_comma__c.Replace('"row": #RowNumbers#','"row": ' + String.valueof(RowNumber-5));                         
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_12');
                            JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": #RowNumbers#','"row": ' +String.valueof(RowNumber-5));                                                     
                             
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_12');
                              JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": #RowNumbersPill#','"row": ' +String.valueof(RowNumber+6));  
                                                                                   
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('pillbox_#pillbox#','pillbox_12');                         
                             JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('#RowNumbers#','Static_Success_Toggle_KPI_'+String.valueof(RowNumber-5));
                          //   JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox_comma__c);
                          String pillStrNew12 = '"pillbox_12": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_Pillbox1__c).remove(JsonRec.Json_Pillbox2__c).replace(JsonRec.Json_Full_pillbox__c,pillStrNew12);             
                            // JsonRec.Json_Pillbox_comma__c =  JsonRec.Json_Pillbox_comma__c.Replace('"name": "pillbox_12','"name": "pillbox_#pillbox#');
                            // JsonRec.Json_Pillbox_comma__c =  JsonRec.Json_Pillbox_comma__c.Replace('"row": ' + String.valueof(RowNumber-5),'"row": #RowNumbers#');
                             JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"name": "pillbox_12','"name": "pillbox_#pillbox#');
                            JsonRec.Json_Pillbox1__c =  JsonRec.Json_Pillbox1__c.Replace('"row": ' +String.valueof(RowNumber-5),'"row": #RowNumbers#'); 
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"name": "pillbox_12','"name": "pillbox_#pillbox#');
                             JsonRec.Json_Pillbox2__c =  JsonRec.Json_Pillbox2__c.Replace('"row": ' +String.valueof(RowNumber+6),'"row": #RowNumbersPill#');
                              JsonRec.Json_Full_pillbox__c =  JsonRec.Json_Full_pillbox__c.Replace('pillbox_12','pillbox_#pillbox#').Replace('Static_Success_Toggle_KPI_'+String.valueof(RowNumber-5),'#RowNumbers#');
                            
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('#RowKPISection#','Static_Success_Toggle_KPI_5').Replace('#RowNumbers#','q5').Replace('#RowNone#','none5');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_String_Toggle__c);
                             JsonRec.Json_String_Toggle__c = JsonRec.Json_String_Toggle__c.Replace('Static_Success_Toggle_KPI_5','#RowKPISection#').Replace('q5','#RowNumbers#').Replace('none5','#RowNone#');
                             
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('%SectionNames%','Static_Success__KPI_5_Filter').Replace('#%RowNumber%queryFiltersLabel','#10queryFiltersLabel').Replace('#%RowNumber%queryFiltersString','#10queryFiltersString');
                             JsonMethod =  JsonMethod.remove(JsonRec.Json_section3__c);
                             JsonRec.Json_section3__c = JsonRec.Json_section3__c.Replace('Static_Success__KPI_5_Filter','%SectionNames%').Replace('#10queryFiltersLabel','#%RowNumber%queryFiltersLabel').Replace('#10queryFiltersString','#%RowNumber%queryFiltersString');                         
                          
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('#Selector#','listselector_38').Replace('#Timelines#','Static_Success__KPI_5_Filter') ;
                          String pillStrNewa = '"listselector_38": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                          JsonMethod =  JsonMethod.replace(JsonRec.Json_ListSelector1__c,pillStrNewa);
                          JsonRec.Json_ListSelector1__c  = JsonRec.Json_ListSelector1__c.Replace('listselector_38','#Selector#').Replace('Static_Success__KPI_5_Filter','#Timelines#') ;  
                          //Json.stringify(Json.parse(JsonMethod));
                          JsonMethod =  JsonMethod.Remove(JsonRec.Success_KPI_5__c);   
                          JsonMethod =  JsonMethod.Remove(JsonRec.Success_Filter5__c);
                          
                          JsonMethod =  JsonMethod.Remove(JsonRec.Json_Selector38__c);
                      }
                      String ListSel;
                            String Marketval ;
                            String MarketRow;
                            String Pillbox;
                            if(RowNumber >= 11){
                                if(RowNumber == 11 || RowNumber == 12 || RowNumber == 13){
                                     ListSel = String.valueof(RowNumber+ 28);        
                                }
                                if(RowNumber == 14 || RowNumber == 15){ 
                                     pillbox = String.valueof(RowNumber+ 2);  
                                     ListSel = String.valueof(RowNumber+ 29);
                                }
                                Marketval = String.valueof(RowNumber + 8);
                                MarketRow = String.valueof(RowNumber -10);
                            }
                            if(RowNumber >= 6 && RowNumber <= 10){  
                                     if(RowNumber == 10){
                                        Pillbox = '12';
                                        
                                     }
                                     ListSel = String.valueof(RowNumber+ 28);        
                                    Marketval = String.valueof(RowNumber + 6);
                                    MarketRow = String.valueof(RowNumber -5);
                            }
                            if(RowNumber <= 5){
                                    if(RowNumber == 5){
                                        Pillbox = '5';
                                    }  
                                    ListSel = String.valueof(RowNumber + 28);        
                                    Marketval = String.valueof(RowNumber + 4);
                                    MarketRow = String.valueof(RowNumber);
                            }
                             
                             JsonRec.Json_Pillbox5__c =  JsonRec.Json_Pillbox5__c.Replace('"name": "pillbox_#pillbox#','"name": "pillbox_'+pillbox).Replace('"row": #RowNumbers#','"row": ' + MarketRow).Replace('"colspan": #Colspannum#','"colspan": 1').Replace('"column": #colnum#','"column": 3');     
                             //Json.stringify(Json.parse(JsonMethod));
                             JsonMethod =  JsonMethod.Remove(JsonRec.Json_Pillbox5__c);
                             JsonRec.Json_Pillbox5__c =  JsonRec.Json_Pillbox5__c.Replace('"name": "pillbox_'+pillbox,'"name": "pillbox_'+pillbox).Replace('"row": ' + MarketRow,'"row": ' + MarketRow).Replace('"colspan": 1','"colspan": 2').Replace('"column": 3','"column": 6'); 
                             // Json.stringify(Json.parse(JsonMethod));
                             JsonMethod =  JsonMethod.Remove(JsonRec.Json_Pillbox5__c);   
                             JsonRec.Json_Pillbox5__c =  JsonRec.Json_Pillbox5__c.Replace('"name": "pillbox_'+pillbox,'"name": "pillbox_#pillbox#').Replace('"row": ' + MarketRow,'"row": #RowNumbers#').Replace('"colspan": 2','"colspan": #Colspannum#').Replace('"column": 6','"column": #colnum#');
                                                     
                            JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('#Selector#','listselector_'+ListSel).Replace('"row": #RowNumber#','"row": '+Marketval).Replace('"colspan": #colspanval#','"colspan": 2').Replace('"column": #columnval#','"column": 4');
                             
                                JsonMethod =  JsonMethod.Remove(JsonRec.Json_listselector__c);
                            JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('"row": '+Marketval,'"row": '+MarketRow).Replace('"colspan": 2','"colspan": 2').Replace('"column": 4','"column": 2');  
                                JsonMethod =  JsonMethod.Remove(JsonRec.Json_listselector__c);
                            JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('"row": '+MarketRow,'"row": '+MarketRow).Replace('"colspan": 2','"colspan": 1').Replace('"column": 2','"column": 1');
                                JsonMethod =  JsonMethod.Remove(JsonRec.Json_listselector__c);
                             JsonRec.Json_listselector__c  = JsonRec.Json_listselector__c.Replace('"colspan": 1','"colspan": #colspanval#').Replace('"column": 1','"column": #columnval#').Replace('listselector_'+ListSel,'#Selector#').Replace('"row": '+MarketRow,'"row": #RowNumber#');
                             JsonMethod =  JsonMethod.Remove(JsonRec.Json_Pillbox5__c); 
                                                                                 
                    String RowNumbers ;
                    if(RowNumber >= 11){
                        RowNumbers = String.valueof(RowNumber);
                    }
                    if(RowNumber >= 7 && RowNumber <= 10){
                        RowNumbers = String.valueof(RowNumber);
                    }
                    if(RowNumber == 6){ 
                        RowNumbers = String.valueof(RowNumber - 1);
                    }
                    if(RowNumber <= 4){
                        RowNumbers = String.valueof(RowNumber);
                    }
                    if(RowNumber == 5){
                        RowNumbers = String.valueof(RowNumber+1);   
                    }
                        if(RowNumber >= 11 ){
                            String Numbers = String.valueof(RowNumber - 10);
                            JsonRec.Json_Number__c = JsonRec.Json_Number__c.replace('#Number#','number_'+ RowNumbers).replace('#KPIs#','Marketing_KPI_'+ Numbers);
                            String StrNew2 = '"number_'+RowNumbers+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                            
                            JsonMethod =  JsonMethod.Replace(JsonRec.Json_Number__c,StrNew2); 
                            JsonRec.Json_Number__c = JsonRec.Json_Number__c.replace('number_'+ RowNumbers,'#Number#').replace('Marketing_KPI_'+ Numbers,'#KPIs#');   
                            
                            
                            
                            JsonRec.Json_KPI__c = JsonRec.Json_KPI__c.replace('#KPIS#','Marketing_KPI_'+ Numbers).Replace('#datasetAlias#','#'+RowNumber+'datasetAlias#').replace('#StaticFilter#','Static_Marketing__KPI_'+Numbers + '_Filter').replace('#StaticTimeline#','Static_Marketing_Timeline_'+Numbers).replace('#StaticMeasure#','Static_Marketing_Measure_'+ Numbers);
                            JsonMethod =  JsonMethod.Remove(JsonRec.Json_KPI__c);
                            JsonRec.Json_KPI__c = JsonRec.Json_KPI__c.replace('Marketing_KPI_'+ Numbers,'#KPIS#').replace('#'+RowNumber+'datasetAlias#','#datasetAlias#');
                        
                            JsonRec.Json_KPI__c = JsonRec.Json_KPI__c.replace('Static_Marketing__KPI_'+Numbers + '_Filter','#StaticFilter#').replace('Static_Marketing_Measure_'+ Numbers,'#StaticMeasure#').replace('Static_Marketing_Timeline_'+Numbers,'#StaticTimeline#');                          
                             if(RowNumber== 15){
                                JsonMethod =  JsonMethod.Remove(JsonRec.Json_KPI_2__c);
                             }
                        }
                        if(RowNumber >= 6 &&  RowNumber <= 10){
                            String Numbers = String.valueof(RowNumber - 5);
                            JsonRec.Json_Number__c = JsonRec.Json_Number__c.replace('#Number#','number_'+ RowNumbers).replace('#KPIs#','Success_KPI_'+ Numbers);
                            String StrNew2 = '"number_'+RowNumbers+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                           
                            JsonMethod =  JsonMethod.Replace(JsonRec.Json_Number__c,StrNew2); 
                             JsonRec.Json_Number__c = JsonRec.Json_Number__c.replace('number_'+ RowNumbers,'#Number#').replace('Success_KPI_'+ Numbers,'#KPIs#');  
                            
                            JsonRec.Json_KPI__c = JsonRec.Json_KPI__c.replace('#KPIS#','Success_KPI_'+ Numbers).Replace('#datasetAlias#','#'+RowNumber+'datasetAlias#');
                            
                            JsonRec.Json_KPI__c = JsonRec.Json_KPI__c.replace('#StaticFilter#','Static_Success__KPI_'+Numbers + '_Filter').replace('#StaticTimeline#','Static_Success_Timeline_'+Numbers).replace('#StaticMeasure#','Static_Success_Measure_'+ Numbers);
                            JsonMethod =  JsonMethod.Remove(JsonRec.Json_KPI__c);
                            JsonRec.Json_KPI__c = JsonRec.Json_KPI__c.replace('Success_KPI_'+ Numbers,'#KPIS#');
                            
                                JsonRec.Json_KPI__c = JsonRec.Json_KPI__c.replace('#'+RowNumber+'datasetAlias#','#datasetAlias#');
                            //Json_KPI_1__c
                              
                        
                            JsonRec.Json_KPI__c = JsonRec.Json_KPI__c.replace('Static_Success__KPI_'+Numbers + '_Filter','#StaticFilter#').replace('Static_Success_Measure_'+ Numbers,'#StaticMeasure#').replace('Static_Success_Timeline_'+Numbers,'#StaticTimeline#');                        
                             
                             if(RowNumber== 10){
                                JsonMethod =  JsonMethod.Remove(JsonRec.Json_KPI_1__c);
                                JsonMethod =  JsonMethod.Remove(JsonRec.Success_KPI_5__c);
                             }
                             
                             if(RowNumber == 6){
                                JsonMethod =  JsonMethod.Remove(JsonRec.Success_KPI_1__c);
                             }
                             if(RowNumber == 7){
                                JsonMethod =  JsonMethod.Remove(JsonRec.Success_KPI_2__c);
                             }
                             if(RowNumber == 8){
                                JsonMethod =  JsonMethod.Remove(JsonRec.Success_KPI_3__c);
                             }
                             if(RowNumber == 9){
                                JsonMethod =  JsonMethod.Remove(JsonRec.Success_KPI_4__c);
                             }
                        }
                    
                        if(RowNumber <= 5 ){
                            
                            String Numbers = String.valueof(RowNumber);
                            JsonRec.Json_Number__c = JsonRec.Json_Number__c.replace('#Number#','number_'+ RowNumbers).replace('#KPIs#','Sales_KPI_'+ Numbers);
                            String StrNew2 = '"number_'+RowNumbers+'": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
                               
                            JsonMethod =  JsonMethod.replace(JsonRec.Json_Number__c,StrNew2);
                            JsonRec.Json_Number__c = JsonRec.Json_Number__c.replace('number_'+ RowNumbers,'#Number#').replace('Sales_KPI_'+ Numbers,'#KPIs#'); 
                            
                            JsonRec.Json_KPI__c = JsonRec.Json_KPI__c.replace('#KPIS#','Sales_KPI_'+ Numbers).Replace('#datasetAlias#','#'+RowNumber+'datasetAlias#').replace('#StaticFilter#','Static_Sales__KPI_'+Numbers + '_Filter').replace('#StaticMeasure#','Static_Sales_Measure_'+ Numbers).replace('#StaticTimeline#','Static_Sales_Timeline_'+Numbers);
                            JsonMethod =  JsonMethod.Remove(JsonRec.Json_KPI__c);
                            JsonRec.Json_KPI__c = JsonRec.Json_KPI__c.replace('Sales_KPI_'+ Numbers,'#KPIS#').replace('#'+RowNumber+'datasetAlias#','#datasetAlias#').replace('Static_Sales__KPI_'+Numbers + '_Filter','#StaticFilter#').replace('Static_Sales_Measure_'+ Numbers,'#StaticMeasure#').replace('Static_Sales_Timeline_'+Numbers,'#StaticTimeline#');                      
                               
                            //JsonMethod =  JsonMethod.Remove(JsonRec.Json_KPI__c);
                        } 
                        String Numbervalues;  
                        String Rows ; 
                        if(RowNumber ==11){
                            RowNumberthree = true;
                            Numbervalues = String.valueof(RowNumber + 8);
                            Rows = String.valueof(RowNumber - 10);
                        }
                        if(RowNumber ==12){
                            Numbervalues = String.valueof(RowNumber + 8);
                            Rows = String.valueof(RowNumber - 10);
                        }
                        if(RowNumber ==13){
                            Numbervalues = String.valueof(RowNumber + 8);
                            Rows = String.valueof(RowNumber - 9);
                        }
                        if(RowNumber ==14){
                            Numbervalues = String.valueof(RowNumber + 8);
                            Rows = String.valueof(RowNumber - 9);
                        }
                        if(RowNumber ==15){
                            Numbervalues = String.valueof(RowNumber + 8);
                            Rows = String.valueof(RowNumber - 12);
                        }
                        if(RowNumber == 6){
                            RowNumbertwo = true;
                        }
                        if(RowNumber >=6 && RowNumber <=10){
                            Numbervalues = String.valueof(RowNumber + 6);
                            Rows = String.valueof(RowNumber - 5);
                        }
                        if(RowNumber <= 5 ){
                            Numbervalues = String.valueof(RowNumber + 4);
                            Rows = String.valueof(RowNumber);
                        }
                        String Values;
                        if(RowNumber == 1){
                            RowNumberone = true;
                            Values = String.valueof(RowNumber + 1);
                        }
                        if(RowNumber == 2){
                            Values = String.valueof(RowNumber - 1);
                        }
                        //  JsonRec.Json_Number1__c = JsonRec.Json_Number1__c.replace('"colspan": #ColSpanNum#','"colspan": 1').replace('"column": #ColNum#','"column": 2').replace('"row": #Rows#','"row": '+Rows).replace('#Numbers#','number_'+ RowNumbers);
                        //  JsonMethod =  JsonMethod.Remove(JsonRec.Json_Number1__c); 
                        //  JsonRec.Json_Number1__c = JsonRec.Json_Number1__c.replace('"colspan": 1','"colspan": 2').replace('"column": 2','"column": 6').replace('"row": '+Rows,'"row": '+ Numbervalues).replace('number_'+RowNumbers,'number_'+RowNumbers);
                        //  JsonMethod =  JsonMethod.Remove(JsonRec.Json_Number1__c); 
                        //  JsonRec.Json_Number1__c = JsonRec.Json_Number1__c.replace('"colspan": 2','"colspan": 2').replace('"column": 6','"column": 4').replace('"row": '+Numbervalues,'"row": '+Rows).replace('number_'+RowNumbers,'number_'+RowNumbers);
                        //  JsonMethod =  JsonMethod.Remove(JsonRec.Json_Number1__c);
                        //  JsonRec.Json_Number1__c = JsonRec.Json_Number1__c.replace('"colspan": 2','"colspan": #ColSpanNum#').replace('"column": 4','"column": #ColNum#').replace('"row": '+Rows,'"row": #Rows#').replace('number_'+RowNumbers,'#Numbers#');  
                         
                        //     JsonRec.Json_Number1__c = JsonRec.Json_Number1__c.replace('"colspan": #ColSpanNum#','"colspan": 1').replace('"column": #ColNum#','"column": 2').replace('"row": #Rows#','"row": '+Values).replace('#Numbers#','number_'+ RowNumbers);
                        //     JsonMethod =  JsonMethod.Remove(JsonRec.Json_Number1__c);
                            // JsonRec.Json_Number1__c = JsonRec.Json_Number1__c.replace('"colspan": 1','"colspan": 2').replace('"column": 2','"column": 4').replace('"row": '+Values,'"row": '+Values).replace('number_'+RowNumbers,'number_'+RowNumbers);
                            // JsonMethod =  JsonMethod.Remove(JsonRec.Json_Number1__c);
                            //  JsonRec.Json_Number1__c = JsonRec.Json_Number1__c.replace('"colspan": 2','"colspan": #ColSpanNum#').replace('"column": 4','"column": #ColNum#').replace('"row": '+Values,'"row": #Rows#').replace('number_'+RowNumbers,'#Numbers#');                           
                                                                                                    
            }
        }
          
          
        JsonMethod =  JsonMethod.replaceAll('\n','');
        JsonMethod = JsonMethod.replaceAll('\\s+\\s+','#testcode#');    
        JsonMethod = JsonMethod.replaceAll('#testcode#','');
        if(Rownumberone == true){
            String text6 = '"text_6": {"parameters": {"fontSize": 14,"text": "Choose a Measure","textAlignment": "center","textColor": "#FFFFFF"},"type": "text"},'; 
            String NewText6 = '"text_6": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
            String text9 = '"text_9": {"parameters": {"fontSize": 14,"text": "Choose a Filter","textAlignment": "center","textColor": "#FFFFFF"},"type": "text"},';
            String NewText9 = '"text_9": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
            String text10 = '"text_8": {"parameters": {"fontSize": 14,"text": "Choose a Date","textAlignment": "center","textColor": "#FFFFFF"},"type": "text"},';                  
            String NewText8 = '"text_8": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
            String texts = '{"colspan": 2,"column": 0,"name": "text_6","row": 4,"rowspan": 1,"widgetStyle": {"backgroundColor": "rgba(255, 255, 255, 0)","borderColor": "#E6ECF2","borderEdges": [],"borderRadius": 0,"borderWidth": 1}},';
            String texts2 = '{"colspan": 2,"column": 2,"name": "text_8","row": 4,"rowspan": 1,"widgetStyle": {"backgroundColor": "rgba(255, 255, 255, 0)","borderColor": "#E6ECF2","borderEdges": [],"borderRadius": 0,"borderWidth": 1}},';
            String text3 = '{"colspan": 2,"column": 4,"name": "text_9","row": 4,"rowspan": 1,"widgetStyle": {"backgroundColor": "rgba(255, 255, 255, 0)","borderColor": "#E6ECF2","borderEdges": [],"borderRadius": 0,"borderWidth": 1}},';    
            String Charts = '"chart_1": {"parameters": {"fillArea": true,"showPoints": true,"legend": {"showHeader": true,"show": true,"position": "top-center","inside": false},"measureAxis1": {"showZero": false,"showTitle": false,"showAxis": true,"title": ""},"visualizationType": "time","missingValue": "connect","step": "Sales_Timeline","theme": "wave","exploreLink": false,"timeAxis": {"showTitle": false,"showAxis": true,"title": ""},"title": {"label": "","align": "center","subtitleLabel": ""},"trellis": {"enable": false,"type": "x","chartsPerLine": 4}},"type": "chart"},';
            String NewCharts_1 = '"chart_1": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
            String text7 = '"text_7": {"parameters": {"fontSize": 24,"text": "Sales Insights","textAlignment": "center","textColor": "#FFFFFF"},"type": "text"},';
          //  String text77 = '{"colspan": 2,"column": 0,"name": "text_7","row": 0,"rowspan": 1,"widgetStyle": {"backgroundColor": "rgba(255, 255, 255, 0)","borderColor": "#E6ECF2","borderEdges": [],"borderRadius": 0,"borderWidth": 1}},';
          //  String text88 = '{"colspan": 3,"column": 0,"name": "text_7","row": 0,"rowspan": 1,"widgetStyle": {"backgroundColor": "rgba(255, 255, 255, 0)","borderColor": "#E6ECF2","borderEdges": [],"borderRadius": 0,"borderWidth": 1}},';
            String text99 = '{"colspan": 8,"column": 8,"name": "text_7","row": 4,"rowspan": 1,"widgetStyle": {"backgroundColor": "rgba(255, 255, 255, 0)","borderColor": "#E6ECF2","borderEdges": [],"borderRadius": 0,"borderWidth": 1}},';
             String Container5 = '"container_5": {"parameters": {"alignmentX": "left","alignmentY": "top","documentId": "","fit": "original"},"type": "container"},';
             String NewContainer5 = '"container_5": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
            String Containertext1 = '{"colspan": 24,"column": 0,"name": "container_5","row": 4,"rowspan": 1,"widgetStyle": {"backgroundColor": "#7EC2BA","borderColor": "#E6ECF2","borderEdges": [],"borderRadius": 0,"borderWidth": 1}},';
          //  String Containertext2 = '{"colspan": 8,"column": 0,"name": "container_5","row": 0,"rowspan": 1,"widgetStyle": {"backgroundColor": "#2EC2BA","borderColor": "#E6ECF2","borderEdges": [],"borderRadius": 0,"borderWidth": 1}},';
          //  String Containertext3 = '{"colspan": 4,"column": 0,"name": "container_5","row": 0,"rowspan": 1,"widgetStyle": {"backgroundColor": "#2EC2BA","borderColor": "#E6ECF2","borderEdges": [],"borderRadius": 0,"borderWidth": 1}},';
            String listSelect27 = '"listselector_27": {"parameters": {"compact": false,"expanded": true,"exploreLink": false,"instant": true,"step": "Static_Sales_Timeline","title": ""},"type": "listselector"},';
            String pillStrNewlist27 = '"listselector_27": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
          //  String listSelecttext1 = '{"colspan": 2,"column": 1,"name": "listselector_27","row": 6,"rowspan": 1,"widgetStyle": {"backgroundColor": "rgba(255, 255, 255, 0)","borderColor": "#E6ECF2","borderEdges": [],"borderRadius": 0,"borderWidth": 1}},';
          //  String listSelecttext2 = '{"colspan": 2,"column": 3,"name": "listselector_27","row": 6,"rowspan": 1,"widgetStyle": {"backgroundColor": "rgba(255, 255, 255, 0)","borderColor": "#E6ECF2","borderEdges": [],"borderRadius": 0,"borderWidth": 1}},';
            String listSelecttext3 = '{"colspan": 2,"column": 17,"name": "listselector_27","row": 4,"rowspan": 1,"widgetStyle": {"backgroundColor": "rgba(255, 255, 255, 0)","borderColor": "#E6ECF2","borderEdges": [],"borderRadius": 0,"borderWidth": 1}},';
            
            JsonMethod =  JsonMethod.replace(Container5,NewContainer5).replace(Containertext1,'');
            JsonMethod =  JsonMethod.replace(listSelect27,pillStrNewlist27).replace(listSelecttext3,'');
           
            JsonMethod =  JsonMethod.replace(text6,NewText6).replace(text9,NewText9).replace(text10,NewText8).replace(texts,'').replace(texts2,'').replace(text3,'').replace(Charts,NewCharts_1).replace(text7,'').replace(text99,'');
            //.replace(text77,'').replace(text88,'')..replace(Containertext2,'').replace(Containertext3,'')..replace(listSelecttext1,'').replace(listSelecttext2,'')
       
        
        }
        if(Rownumbertwo == true){
            String text010 = '"text_10": {"parameters": {"fontSize": 14,"text": "Choose a Measure","textAlignment": "center","textColor": "#FFFFFF"},"type": "text"},'; 
            String NewText6 = '"text_10": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
            String text09 = '"text_12": {"parameters": {"fontSize": 14,"text": "Choose a Filter","textAlignment": "center","textColor": "#FFFFFF"},"type": "text"},';
            String NewText9 = '"text_12": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
            String text011 = '"text_11": {"parameters": {"fontSize": 14,"text": "Choose a Date","textAlignment": "center","textColor": "#FFFFFF"},"type": "text"},';                  
            String NewText8 = '"text_11": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
            String text6 = '\"listselector_28\": {\"parameters\": {\"compact\": false,\"expanded\": true,\"exploreLink\": false,\"instant\": true,\"step\": \"Static_Success_Timeline\",\"title\": \"\"},\"type\": \"listselector\"},'; 
           // String text9 = '{\"colspan\": 2,\"column\": 1,\"name\": \"listselector_28\",\"row\": 6,\"rowspan\": 1,\"widgetStyle\": {\"backgroundColor\": \"rgba(255, 255, 255, 0)\",\"borderColor\": \"#E6ECF2\",\"borderEdges\": [],\"borderRadius\": 0,\"borderWidth\": 1}},';
            String text10 = '{\"colspan\": 2,\"column\": 17,\"name\": \"listselector_28\",\"row\": 11,\"rowspan\": 1,\"widgetStyle\": {\"backgroundColor\": \"rgba(255, 255, 255, 0)\",\"borderColor\": \"#E6ECF2\",\"borderEdges\": [],\"borderRadius\": 0,\"borderWidth\": 1}},';                    
          //  String texts = '{\"colspan\": 2,\"column\": 3,\"name\": \"listselector_28\",\"row\": 6,\"rowspan\": 1,\"widgetStyle\": {\"backgroundColor\": \"rgba(255, 255, 255, 0)\",\"borderColor\": \"#E6ECF2\",\"borderEdges\": [],\"borderRadius\": 0,\"borderWidth\": 1}},';
            
            String texts2 = '\"container_6\": {\"parameters\": {\"alignmentX\": \"left\",\"alignmentY\": \"top\",\"documentId\": \"\",\"fit\": \"original\"},\"type\": \"container\"},';
            String text3 = '{\"colspan\": 24,\"column\": 0,\"name\": \"container_6\",\"row\": 11,\"rowspan\": 1,\"widgetStyle\": {\"backgroundColor\": \"#9271E8\",\"borderColor\": \"#E6ECF2\",\"borderEdges\": [],\"borderRadius\": 0,\"borderWidth\": 1}},';   
            text3 = text3.replace('"name": "container_6",','"name":"container_6",');
            String[] Strvalues = text3.split('"name":"container_6",');
            String StrvaluesNew = Strvalues[1].replace(',','nnnnnnnnn').replace('{','nnnnnnnnn');
            String[] NewValuesSplit = StrvaluesNew.split('nnnnnnnnn');
            String AllBack = NewValuesSplit[3]+',';
           // system.debug('@@@@@@@@@@@@@@Pavan'+AllBack );
            AllBack = AllBack.replace(' ','' );
            JsonMethod = JsonMethod.replace(AllBack,'');
            String containerNew = '"container_6": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
            String pillStrNewlist28 = '"listselector_28": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
          //  String texts4 = '{\"colspan\": 4,\"column\": 0,\"name\": \"container_6\",\"row\": 0,\"rowspan\": 1,\"widgetStyle\": {\"backgroundColor\": \"#9271E8\",\"borderColor\": \"#E6ECF2\",\"borderEdges\": [],\"borderRadius\": 0,\"borderWidth\": 1}},';
          //  String text5 = '{\"colspan\": 8,\"column\": 0,\"name\": \"container_6\",\"row\": 0,\"rowspan\": 1,\"widgetStyle\": {\"backgroundColor\": \"#9271E8\",\"borderColor\": \"#E6ECF2\",\"borderEdges\": [],\"borderRadius\": 0,\"borderWidth\": 1}},';  
          
            JsonMethod =  JsonMethod.replace(text6,pillStrNewlist28).replace(text10,'').replace(texts2,containerNew).replace(text3,'').replace(text010,NewText6).replace(text09,NewText9).replace(text011,NewText8);
            //.replace(text9,'').replace(texts,'').replace(texts4,'').replace(text5,'')
             JsonMethod = JsonMethod.replace('"type": "text"','"type":"text"').replace('"type": "text" }','"type":"text"}');
            JsonMethod = JsonMethod.replace('"type":"text" }','"type":"text"}');
             String[] text021 = JsonMethod.split('"text_16":');
             if(text021.size()>1){
                 String[] text022 = text021[1].split('"type":"text"');
                 String text023 = '"text_16":' + text022[0] + '"type":"text"}';
                 String NewText021 = '"text_16": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" }';
              
                 JsonMethod = jsonMethod.replace(text023,NewText021);
             }
        }
        if(Rownumberthree == true){
            String text013 = '"text_13": {"parameters": {"fontSize": 14,"text": "Choose a Measure","textAlignment": "center","textColor": "#FFFFFF"},"type": "text"},'; 
            String NewText013 = '"text_13": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
            String text015 = '"text_15": {"parameters": {"fontSize": 14,"text": "Choose a Filter","textAlignment": "center","textColor": "#FFFFFF"},"type": "text"},';
            String NewText015 = '"text_15": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
            String text014 = '"text_14": {"parameters": {"fontSize": 14,"text": "Choose a Date","textAlignment": "center","textColor": "#FFFFFF"},"type": "text"},';                  
            String NewText014 = '"text_14": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
            String text6 = '\"listselector_26\": {\"parameters\": {\"compact\": false,\"expanded\": true,\"exploreLink\": false,\"instant\": true,\"step\": \"Static_Marketing_Timeline\",\"title\": \"\"},\"type\": \"listselector\"},'; 
            String text9 = '{\"colspan\": 2,\"column\": 17,\"name\": \"listselector_26\",\"row\": 18,\"rowspan\": 1,\"widgetStyle\": {\"backgroundColor\": \"rgba(255, 255, 255, 0)\",\"borderColor\": \"#E6ECF2\",\"borderEdges\": [],\"borderRadius\": 0,\"borderWidth\": 1}},';
          //  String text10 = '{\"colspan\": 2,\"column\": 1,\"name\": \"listselector_26\",\"row\": 6,\"rowspan\": 1,\"widgetStyle\": {\"backgroundColor\": \"rgba(255, 255, 255, 0)\",\"borderColor\": \"#E6ECF2\",\"borderEdges\": [],\"borderRadius\": 0,\"borderWidth\": 1}},';                  
          //  String texts = '{\"colspan\": 2,\"column\": 3,\"name\": \"listselector_26\",\"row\": 6,\"rowspan\": 1,\"widgetStyle\": {\"backgroundColor\": \"rgba(255, 255, 255, 0)\",\"borderColor\": \"#E6ECF2\",\"borderEdges\": [],\"borderRadius\": 0,\"borderWidth\": 1}},';
            String texts2 = '\"container_4\": {\"parameters\": {\"alignmentX\": \"left\",\"alignmentY\": \"top\",\"documentId\": \"\",\"fit\": \"original\"},\"type\": \"container\"},';
            String pillStrNew = '"container_4": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
            String listselector_26 = '"listselector_26": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" },';
            
           
             
            String text3 = '{\"colspan\": 24,\"column\": 0,\"name\": \"container_4\",\"row\": 18,\"rowspan\": 1,\"widgetStyle\": {\"backgroundColor\": \"#44A2F5\",\"borderColor\": \"#E6ECF2\",\"borderEdges\": [],\"borderRadius\": 0,\"borderWidth\": 1}},';    
            text3 = text3.replace('"name": "container_4",','"name":"container_4",');
            String[] Strvalues = text3.split('"name":"container_4",');
            String StrvaluesNew = Strvalues[1].replace(',','nnnnnnnnn').replace('{','nnnnnnnnn');
            String[] NewValuesSplit = StrvaluesNew.split('nnnnnnnnn');
            String AllBack = NewValuesSplit[3]+',';
           // system.debug('@@@@@@@@@@@@@@Pavan'+AllBack );
            AllBack = AllBack.replace(' ','' );
            JsonMethod = JsonMethod.replace(AllBack,'');
            ///System.debug('*********************** Text3'+ Text3);
           //  String texts4 = '{\"colspan\": 4,\"column\": 0,\"name\": \"container_4\",\"row\": 0,\"rowspan\": 1,\"widgetStyle\": {\"backgroundColor\": \"#44A2F5\",\"borderColor\": \"#E6ECF2\",\"borderEdges\": [],\"borderRadius\": 0,\"borderWidth\": 1}},';
         //   String text5 = '{\"colspan\": 8,\"column\": 0,\"name\": \"container_4\",\"row\": 0,\"rowspan\": 1,\"widgetStyle\": {\"backgroundColor\": \"#44A2F5\",\"borderColor\": \"#E6ECF2\",\"borderEdges\": [],\"borderRadius\": 0,\"borderWidth\": 1}},';  
            JsonMethod =  JsonMethod.replace(text6,listselector_26).replace(text9,'').replace(texts2,pillStrNew).replace(text3,'').replace(text013,NewText013).replace(text015,NewText015).replace(text014,NewText014);
            //.replace(text10,'').replace(texts,'').replace(texts4,'').replace(text5,'')
             JsonMethod = JsonMethod.replace('"type": "text"','"type":"text"').replace('"type": "text" }','"type":"text"}');
            JsonMethod = JsonMethod.replace('"type":"text" }','"type":"text"}');
             
             String[] text021 = JsonMethod.split('"text_21":');
             if(text021.size()>1){
             String[] text022 = text021[1].split('"type":"text"');
             String text023 = '"text_21":' + text022[0] + '"type":"text"}';
               String NewText021 = '"text_21": { "parameters": { "fontSize": 20, "text": "", "textAlignment": "center", "textColor": "#fff" }, "type": "text" }';
          
             JsonMethod = jsonMethod.replace(text023,NewText021);
             }
            
        }
        JsonMethod = JsonMethod.replaceAll('},\\s+,','},');
        JsonMethod = JsonMethod.replace('}, ,','},').replace('}, ,','},').replace('}, ,','},').replace('}, ,','},').replace('}, ,','},');
        JsonMethod = JsonMethod.replace('}, ,','},').replace('}, ,','},').replace('}, ,','},').replace('}, ,','},').replace('}, ,','},').replace('}, ,','},');   
        JsonMethod = JsonMethod.replace('}, ,','},').replace('}, ,','},').replace('}, ,','},').replace('}, ,','},').replace('}, ,','},').replace('}, ,','},');
        JsonMethod = JsonMethod.replaceAll('\\s+\\s+','#testcode#');    
        JsonMethod = JsonMethod.replaceAll('#testcode#',' ');  
        JsonMethod = JsonMethod.replace('}, ]','}]').replace('},]','}]').replace('},  ]','}]').replace('},   ]','}]').replace('},     ]','}]').replace('},       ]','}]');           
        JsonMethod = JsonMethod.replace('},]','}]');
        JsonMethod = JsonMethod.replace('}", ]','}"]').replace('}, }','} }').replace('},}','}}');
        JsonMethod = JsonMethod.replace('}, , , , ,','},').replace('}, , , , ,','},').replace('},,,,,','},').replace('}, , , ,','},').replace('}, , ,','},').replace('},\\s+,','},');
        JsonMethod = JsonMethod.replace('}", , , , , ]','}"]').replace('}", , , , ]','}"]').replace('}", , , ]','}"]').replace('}", , ]','}"]');
         JsonMethod = JsonMethod.replace('}"}]','}",');
         JsonMethod = JsonMethod.replace('}",]','}"]').replace('}", ]','}"]').replace('}",  ]','}"]');
         JsonMethod = JsonMethod.replace('}, } }','} } }').replace('},}}','}}}');
         JsonMethod = JsonMethod.replace('}, } }','} } }').replace('},}}','}}}');   
         JsonMethod = JsonMethod.replace('},, , , , , , , , , ,','},');
         
         JsonMethod = JsonMethod.replace('}}, ,,','}},');
         JsonMethod = JsonMethod.replace('},, , , , ,' ,'},');
         JsonMethod = JsonMethod.replace('"type": "container"},"type": "container"},','"type": "container"},');
         JsonMethod = JsonMethod.replace('"type": "container" },"type": "container"},','"type": "container"},');
         JsonMethod = JsonMethod.replace('"type": "container" },"type":"container"},','"type": "container"},');
         
         JsonMethod = JsonMethod.replace('"type": "chart"},"type": "text"},','"type": "chart"},');
JsonMethod = JsonMethod.replace('"type": "chart" },"type": "text"},','"type": "chart"},');
JsonMethod = JsonMethod.replace('"type": "chart" },"type":"text"},','"type": "chart"},');

JsonMethod = JsonMethod.replace('"type": "pillbox"},"type": "text"},','"type": "pillbox"},');
JsonMethod = JsonMethod.replace('"type": "pillbox" },"type": "text"},','"type": "pillbox"},');
JsonMethod = JsonMethod.replace('"type": "pillbox" },"type":"text"},','"type": "pillbox"},');

JsonMethod = JsonMethod.replace('"type": "dateselector"},"type": "text"},','"type": "dateselector"},');
JsonMethod = JsonMethod.replace('"type": "dateselector" },"type": "text"},','"type": "dateselector"},');
JsonMethod = JsonMethod.replace('"type": "dateselector" },"type":"text"},','"type": "dateselector"},');

JsonMethod = JsonMethod.replace('"type": "listselector"},"type": "text"},','"type": "listselector"},');
JsonMethod = JsonMethod.replace('"type": "listselector" },"type": "text"},','"type": "listselector"},');
JsonMethod = JsonMethod.replace('"type": "listselector" },"type":"text"},','"type": "listselector"},');

JsonMethod = JsonMethod.replace('"type": "text"},"type": "text"},','"type": "text"},');
JsonMethod = JsonMethod.replace('"type": "text" },"type": "text"},','"type": "text"},');
JsonMethod = JsonMethod.replace('"type": "text" },"type":"text"},','"type": "text"},');

JsonMethod = JsonMethod.replace('"type": "number"},"type": "text"},','"type": "number"},');
JsonMethod = JsonMethod.replace('"type": "number" },"type": "text"},','"type": "number"},');
JsonMethod = JsonMethod.replace('"type": "number" },"type":"text"},','"type": "number"},');

JsonMethod = JsonMethod.replace('"type": "text"},"type": "text"},','"type": "text"},');
JsonMethod = JsonMethod.replace('"type": "text" },"type": "text"},','"type": "text"},');
JsonMethod = JsonMethod.replace('"type": "text" },"type":"text"},','"type": "text"},');

JsonMethod = JsonMethod.replace('"type": "chart"},"type": "container"},','"type": "chart"},');
JsonMethod = JsonMethod.replace('"type": "chart" },"type": "container"},','"type": "chart"},');
JsonMethod = JsonMethod.replace('"type": "chart" },"type":"container"},','"type": "chart"},');

JsonMethod = JsonMethod.replace('"type": "pillbox"},"type": "container"},','"type": "pillbox"},');
JsonMethod = JsonMethod.replace('"type": "pillbox" },"type": "container"},','"type": "pillbox"},');
JsonMethod = JsonMethod.replace('"type": "pillbox" },"type":"container"},','"type": "pillbox"},');

JsonMethod = JsonMethod.replace('"type": "dateselector"},"type": "container"},','"type": "dateselector"},');
JsonMethod = JsonMethod.replace('"type": "dateselector" },"type": "container"},','"type": "dateselector"},');
JsonMethod = JsonMethod.replace('"type": "dateselector" },"type":"container"},','"type": "dateselector"},');

JsonMethod = JsonMethod.replace('"type": "listselector"},"type": "container"},','"type": "listselector"},');
JsonMethod = JsonMethod.replace('"type": "listselector" },"type": "container"},','"type": "listselector"},');
JsonMethod = JsonMethod.replace('"type": "listselector" },"type":"container"},','"type": "listselector"},');

JsonMethod = JsonMethod.replace('"type": "text"},"type": "container"},','"type": "text"},');
JsonMethod = JsonMethod.replace('"type": "text" },"type": "container"},','"type": "text"},');
JsonMethod = JsonMethod.replace('"type": "text" },"type":"container"},','"type": "text"},');

JsonMethod = JsonMethod.replace('"type": "number"},"type": "container"},','"type": "number"},');
JsonMethod = JsonMethod.replace('"type": "number" },"type": "container"},','"type": "number"},');
JsonMethod = JsonMethod.replace('"type": "number" },"type":"container"},','"type": "number"},');
JsonMethod = JsonMethod.replace('"line"', '"time"');
         System.debug('$$$$$$$$$$$$$$$Json String : ' + JsonMethod);  
         system.debug('FolderId @@@@@@@@@@@@@@@'+FolderId);
        return JsonMethod;
        
        
    }
    
     
    
}