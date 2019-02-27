public class Dashboard_Automation_BatchClass implements Database.AllowsCallouts, Database.Batchable<String> {
    public list<String> AllStrings ;
    public String SessionIds;
    public String Allvals = '';
    public String FolderIds;
    public String Allvaluestrue = '';
    public String Allvaluesfalse = '';
    public integer Allnumbers = 0;
    public String DashboardName = '';
    public String Allvalues = '';
    public Dashboard_Automation_BatchClass(set<String> dashboardId,String SessionId,String DashboardNameAuto,String Allval,String FolderId,String Allva) {
        AllStrings = new list<String>();
        for(String Ds :dashboardId){
            AllStrings.add(Ds);
        }
        SessionIds = SessionId;
        Allvals = Allval;
        FolderIds = FolderId;
        DashboardName = DashboardNameAuto;
        Allvalues = Allva;
    }
    public void execute(Database.BatchableContext BC, List<String> DashId) {
        String CurrentverId='';
        list<string> SetListDim = new list<string>();
        list<string> SetListDate = new list<string>();
        list<string> SetListMeas = new list<string>();
        map<string,string> datasetmap = new map<string,string>();
         map<string,string> dateFieldsMap = new map<string,string>();
         map<string,string> DimensionFieldsMap = new map<string,string>();
         map<string,integer> MeasureStringMap = new map<string,integer>();
        DatasetFromJson  payTypes = new DatasetFromJson();
       // SingleKPI_Class Sing = new SingleKPI_Class();
        String Datesetvalues = getDatasets();
        if(Datesetvalues != null && Datesetvalues != ''){ 
        	payTypes = DatasetFromJson.parse(Datesetvalues);
        } 
        if(payTypes.datasets !=null){
        	for(DatasetFromJson.cls_datasets Rep : payTypes.datasets){ 
        	    if(Rep.Id == DashId[0]){
        	        CurrentverId = Rep.currentVersionId;
        	        datasetmap.put(Rep.Id,Rep.Name);
        	        
        	    }
        	} 
        }
        						
        DatasetDimensionFromJson  DimensionTypes = new DatasetDimensionFromJson();
        string DimensionsReturnValue = Dimensions(DashId[0],CurrentverId);
        if(DimensionsReturnValue != null && DimensionsReturnValue != ''){
        	DimensionTypes = DatasetDimensionFromJson.parse(DimensionsReturnValue);
        	
        	
        }
        if(DimensionTypes.dimensions !=null){
        	for(DatasetDimensionFromJson.cls_dimensions Dim : DimensionTypes.dimensions){ 
        	    if(Dim.showInExplorer == true) { 
        	        if(Dim.origin != '' && Dim.origin != null){
            		    SetListDim.add(Dim.Field);
            		    DimensionFieldsMap.put(Dim.Field,Dim.label);
        	        }
        	    }
        		
        		
        	}
        }
        if(DimensionTypes.measures !=null){
        	for(DatasetDimensionFromJson.cls_measures Dim : DimensionTypes.measures){
        	    if(Dim.origin != '' && Dim.origin != null){
        			SetListMeas.add(Dim.Field); 
        	    }
        	} 
        }
        
        if(DimensionTypes.dates !=null){
        	for(DatasetDimensionFromJson.cls_dates Dim : DimensionTypes.dates){ 
        	      if(Dim.showInExplorer == true){
        			SetListDate.add(Dim.fields.fullField); 
        			dateFieldsMap.put(Dim.fields.fullField,Dim.label);
        			
        	      }
        	     
        	} 
        }
        
        String AvailableDateField = '';
        String DateFieldApi = '';
        integer Datei= 1;
        for(String dtS : SetListDate){
            if(Datei <= 3){
                if(AvailableDateField == ''){
                    AvailableDateField = dateFieldsMap.get(dts);
                    DateFieldApi = dts;
                }
                else{
                    AvailableDateField = AvailableDateField + ','+dateFieldsMap.get(dts);
                    DateFieldApi = DateFieldApi +','+dts;
                }
            }
            Datei++;  
        }
        
                String varssdim = '{"query" : "q = load \\"'+DashId[0]+'/'+CurrentverId+'\\";q = group q by all;q = foreach q generate ';
                 integer i=1;
                 for(String Str : SetListDim){
                    
                        if(SetListDim.size() <= i){
                            varssdim += 'unique(\''+Str+'\') as \''+Str+'\''; 
                        }
                        else{
                           varssdim += 'unique(\''+Str+'\') as \''+Str+'\',';  
                        }
                    // }  
                        i++;
                    }
                 varssdim += ';q = limit q 2000;"}';
                varssdim = varssdim.replace(',;',';');
                
                system.debug('vars*************'+varssdim);
                
                httpResponse Res1;
                map<String,integer> Mapvalues = new map<string,integer>();
                if(!Test.isRunningTest()){
                Res1 =  KPI_DashboardService.Dim_createDashboardss(varssdim,SessionIds);
                
                
                if(Res1.getStatus() == 'OK'){
                    DimensionMeasurefromJSON  payTypesss = new DimensionMeasurefromJSON();
                    payTypesss = DimensionMeasurefromJSON.parse(Res1.getBody());
                    for(DimensionMeasurefromJSON.cls_columns Rep : payTypesss.results.metadata[0].columns){
                        Map<String,Object> m1 = (Map<String,Object>) JSON.deserializeUntyped(res1.getBody());
                        Map<String,Object> posts = (Map<String,Object>)m1.get('results');
     
                        list<Object> replies = (list<Object>)posts.get('records');
                        for( Object o1 : replies) {
                            Map<String, Object> newCast = (Map<String, Object>)o1;
                            integer con = (integer)newCast.get(Rep.name);
                            System.debug('con *************'+ con + 'Rep.Name************* '+Rep.name);
                            if(con > 0){
                                values.add(new InnerClass(Rep.name,con));
                                Mapvalues.put(Rep.name,con);
                            }
                      }
                    }
                     values.sort();
                     System.debug('values *************'+ values);
                }
                }
                
                
                
                 String vars = '{"query" : "q = load \\"'+DashId[0]+'/'+CurrentverId+'\\";';
                
                integer m=1;
                for(InnerClass Str : values){
                    if(Str.value > 0){
                    vars+= 'q'+m+' = group q by \''+Str.Name+'\';q'+m+' = foreach q'+m+' generate \''+Str.Name+'\' as \''+Str.Name+'\', count() as \'numberone\';q'+m+' = foreach q'+m+' generate sum(\'numberone\') as \'numberone\';';
                        m++;
                    }
                }
                vars+= 'final = group q by \'all\'';
                
                integer k=1;
                 for(InnerClass Str : values){
                    if(Str.value > 0){ 
                        vars+= ', q'+k+' by \'all\'';
                        k++;
                    }
                }
                vars+= ';final = foreach final generate ';
                integer l=1;
                 for(InnerClass Str : values){
                    if(Str.value > 0){
                        if(SetListDim.size() <= l){
                            vars+= '(sum(q'+l+'.\'numberone\') / count(\'q\')) * 100 as \''+Str.Name+'\'';
                        }
                        else{
                           vars+= '(sum(q'+l+'.\'numberone\') / count(\'q\')) * 100 as \''+Str.Name+'\','; 
                        }
                        l++;
                    }
                }
                vars+= ';"}';
                vars = vars.replace(',;',';');
                
                system.debug('vars ***********'+ vars);
                
                httpResponse Res = new httpResponse();
                if(!Test.isRunningTest())
                 Res =  KPI_DashboardService.Dim_createDashboards(vars,SessionIds);
                system.debug('Status************ '+Res.getBody());
                if(Res.getStatus() == 'OK'){
                    DimensionMeasurefromJSON  NumpayTypesss = new DimensionMeasurefromJSON();
                    NumpayTypesss = DimensionMeasurefromJSON.parse(Res.getBody());
                    for(DimensionMeasurefromJSON.cls_columns Reps : NumpayTypesss.results.metadata[0].columns){
                        Map<String,Object> m2 = (Map<String,Object>) JSON.deserializeUntyped(Res.getBody());
                        Map<String,Object> posts1 = (Map<String,Object>)m2.get('results');
     
                        list<Object> replies = (list<Object>)posts1.get('records');
                        for( Object o11 : replies) {
                            Map<String, Object> newCasts = (Map<String, Object>)o11;
                            integer con = (integer)integer.valueof(newCasts.get(Reps.name));
                            System.debug('conssss *************'+ con +' Mapvalues '+mapvalues.get(Reps.name));
                            
                            InnerClassResultList.add(new InnerClassResult(Reps.name,mapvalues.get(Reps.name),con));
                      }
                    }
                }
                 InnerClassResultList.sort();
                 system.debug('Size *************'+ InnerClassResultList.size());
                 system.debug('InnerClassResultList *************'+ InnerClassResultList);
                 
                 for(InnerClassResult Inn :InnerClassResultList){
                    system.debug('InnerClassResultList *************'+ Inn);   
                 }
                 
                 
                    String AvailableDimension = '';
                    String DimensionApi = '';
                    String FilterDimensions = '';
                    //integer Datei= 1;
                    list<Dashboard_Automation__c> Autdatlst = [select Cardinality_Greater_than__c,
                                                Cardinality_Less_Than__c,
                                                Max_of_Fields__c,
                                                Utilization__c 
                                                from Dashboard_Automation__c limit 1000];
                    set<String> Newlist = new set<string>();
                    for(Dashboard_Automation__c dtSl : Autdatlst){
                        integer lm = 1;
                        for(InnerClassResult Inn :InnerClassResultList){
                            system.debug('Inn.newvalue *************'+ Inn.newvalue + ' dtSl '+ dtSl.Max_of_Fields__c + ' Inn.value '+Inn.value );
                            if(Inn.value > dtSl.Cardinality_Greater_than__c && Inn.value < dtSl.Cardinality_Less_Than__c  && Inn.values > dtSl.Utilization__c && dtSl.Max_of_Fields__c >= lm && !Newlist.contains(DimensionFieldsMap.get(Inn.Name)) && Newlist.size() <= 7){
                                if(AvailableDimension == ''){
                                    AvailableDimension = DimensionFieldsMap.get(Inn.Name);
                                    DimensionApi = Inn.Name;
                                    system.debug('DimensionAPI@@@@@@@@@@ '+DimensionApi);
                                    FilterDimensions = Inn.name;
                                }
                                else{
                                    AvailableDimension = AvailableDimension + ','+DimensionFieldsMap.get(Inn.Name);
                                    DimensionApi = DimensionApi +','+Inn.Name;
                                    system.debug('DimensionAPI******** '+DimensionApi);
                                }
                                Newlist.add(DimensionFieldsMap.get(Inn.Name));
                                lm = lm+1;
                            }
                        } 
                    }
                    
                 integer j=1;
                 String varss = '{"query" : "q = load \\"'+DashId[0]+'/'+CurrentverId+'\\";q = group q by all;q = foreach q generate ';
                 for(String St:SetListMeas){
                        if(!St.contains('epoch')){
                            System.debug('SetListMeas.size()'+ SetListMeas.size() + ' '+ j);
                            if(SetListMeas.size() <= j){
                               varss += 'unique(\''+St+'\') as \''+St+'\'';  
                            }
                            else{
                               varss += 'unique(\''+St+'\') as \''+St+'\',';   
                            }
                            
                        }
                        j++;
                    }
                 
                    varss += ';q = limit q 2000;"}';
                    varss = varss.replace(',;',';');
                    
                    
                     integer n=1;
                 /*String varssmin = '{"query" : "q = load \\"'+DashId[0]+'/'+CurrentverId+'\\";q = group q by all;q = foreach q generate ';
                 for(String St:SetListMeas){
                        if(!St.contains('epoch')){
                            System.debug('SetListMeas.size()'+ SetListMeas.size() + ' '+ n);
                            if(SetListMeas.size() <= n){
                               varssmin += 'min(\''+St+'\') as \''+St+'\'';  
                            }
                            else{
                               varssmin += 'min(\''+St+'\') as \''+St+'\',';   
                            }
                            
                        }
                        n++;
                    }
                    
                
                 
                    varssmin += ';q = limit q 2000;"}';
                    varssmin = varssmin.replace(',;',';');*/
                       httpResponse ResMes = new httpResponse();
                       
                       if(!Test.isRunningTest())
                       ResMes = KPI_DashboardService.Meas_createDashboardss(varss,SessionIds);
                
                
                if(ResMes.getStatus() == 'OK'){
                    
                    DimensionMeasurefromJSON  payTypess = new DimensionMeasurefromJSON();
                    payTypess = DimensionMeasurefromJSON.parse(ResMes.getBody());
                    
                    for(DimensionMeasurefromJSON.cls_columns Rep : payTypess.results.metadata[0].columns){
                        Map<String,Object> m2 = (Map<String,Object>) JSON.deserializeUntyped(ResMes.getBody());
                        Map<String,Object> posts1 = (Map<String,Object>)m2.get('results');
                      
                        list<Object> replies = (list<Object>)posts1.get('records');
                        for( Object o11 : replies) {
                            Map<String, Object> newCasts = (Map<String, Object>)o11;
                            integer con = (integer)integer.valueof(newCasts.get(Rep.name));
                            MeasureStringMap.put(Rep.name,con);
                            System.debug('conssssNew *************'+ con);
                              MeasInnerClassResultList.add(new MeasInnerClassResult(Rep.name,con,con));
                            
                        }
                    }
                  // for(DimensionMeasurefromJSON.cls_records Rep : payTypess.results.records){
                   // Map<String, Object> m1 = (Map<String, Object>)JSON.deserializeUntyped(String.valueOf(payTypess.results.records[0]));
                   // System.debug('Summary is'+m1.get('Amount'));
                       // system.debug('Rep *************'+ payTypess.results.records[0].get('Amount'));
                  //  }
                  //httpResponse ResMess   = new httpResponse();
                  
                  //if(!Test.isRunningTest())
                  //ResMess =KPI_DashboardService.Meas_createDashboardss(varssmin,SessionIds);
                
                
                /*if(ResMess.getStatus() == 'OK'){
                    
                    DimensionMeasurefromJSON  payTypessMess = new DimensionMeasurefromJSON();
                    payTypessMess = DimensionMeasurefromJSON.parse(ResMess.getBody());
                    
                    for(DimensionMeasurefromJSON.cls_columns Rep : payTypessMess.results.metadata[0].columns){
                          Map<String,Object> m2 = (Map<String,Object>) JSON.deserializeUntyped(ResMess.getBody());
                        Map<String,Object> posts1 = (Map<String,Object>)m2.get('results');
                      
                        list<Object> replies = (list<Object>)posts1.get('records');
                        for( Object o11 : replies) {
                            Map<String, Object> newCasts = (Map<String, Object>)o11;
                            integer con = (integer)integer.valueof(newCasts.get(Rep.name));
                            MeasInnerClassResultList.add(new MeasInnerClassResult(Rep.name,MeasureStringMap.get(Rep.name),con));
                            system.debug('MeasInnerClassResultList@@@@@@@@@@@@@ '+MeasInnerClassResultList);
                        }
                        
                    }
                    
                  // for(DimensionMeasurefromJSON.cls_records Rep : payTypess.results.records){
                   // Map<String, Object> m1 = (Map<String, Object>)JSON.deserializeUntyped(String.valueOf(payTypess.results.records[0]));
                   // System.debug('Summary is'+m1.get('Amount'));
                       // system.debug('Rep *************'+ payTypess.results.records[0].get('Amount'));
                  //  }
                }*/
                }
                
                 Dashboard_Automation__c Autdatlsts = [select  Id,Cardinality_Measure__c,
                                                                    Utilization_Measure__c 
                                                                    from Dashboard_Automation__c where Measure_Number__c = 2 limit 1];
                                                                    
                 
                                                                    
                system.debug('Autdatlsts *************** '+Autdatlsts);
                list<MeasInnerClassResult> MeasInnerClassResultListone = new list<MeasInnerClassResult>();
                for(MeasInnerClassResult Mes :MeasInnerClassResultList ){
                    system.debug('Mes.value size one '+Mes.value); 
                    if(Mes.value > Autdatlsts.Cardinality_Measure__c /*&& Mes.values > Autdatlsts.Utilization_Measure__c*/){
                        system.debug('Mes.value size '+Mes.value);
                        MeasInnerClassResultListone.add(new MeasInnerClassResult(Mes.Name,Mes.value,Mes.values));
                        system.debug('MeasInnerClassResultListone ***********'+ MeasInnerClassResultListone);
                    }
                }
                integer vals = MeasInnerClassResultListone.size();
                system.debug('vals size '+vals);
                
                                String AvailableMeasure = '';
                String MeasureAPI = '';
                String AliasMeasureAPIN = '';
                String CompactMeasureAPIN = '';
               
                list<Measure_Requirements__c> Measdatlst= new list<Measure_Requirements__c>();
                list<Measure_Requirements__c> MeasdatlstsDup= new list<Measure_Requirements__c>();
                MeasdatlstsDup = [select  id,operator__c,Measure_Number__c from Measure_Requirements__c where Dashboard_Automation__c=: Autdatlsts.Id];
                system.debug('Autdatlsts.Id@@@@@@@@ '+Autdatlsts.Id);
                system.debug('MeasdatlstsDup@@@@@@@@ '+MeasdatlstsDup); 
               String MeasIds = '';
               for(Measure_Requirements__c Meas :MeasdatlstsDup){
                   if(Measids == ''){
                       system.debug('Meas.operator__c@@@@@@@ '+Meas.operator__c+'Meas.Measure_Number__c@@@@@@@ '+Meas.Measure_Number__c);
                       if(Meas.operator__c == 'equals to' && Meas.Measure_Number__c == vals){
                           MeasIds = Meas.Id;
                       }
                       else if(Meas.operator__c == 'less than' && Meas.Measure_Number__c == vals){
                           MeasIds = Meas.Id;
                       }
                       else if(Meas.operator__c == 'greater than' && Meas.Measure_Number__c == vals){
                           MeasIds = Meas.Id;
                       }
                       else if(Meas.operator__c == 'less than equals to' && vals <= Meas.Measure_Number__c  ){
                           MeasIds = Meas.Id;
                       }
                       else if(Meas.operator__c == 'greater than equals to'  && vals >= Meas.Measure_Number__c){
                           MeasIds = Meas.Id;
                       }
                   }
               }
               system.debug('MeasIds@@@@@@@@@@ '+MeasIds);
               Measdatlst = [select  Field_1__c,Field_2__c,Field_3__c,Field_4__c,Field_5__c,
                                                              Value_1__c,Value_2__c,Value_3__c,Value_4__c,Value_5__c
                                                              from Measure_Requirements__c where id =: Measids limit 1];
                 

               
                if(MeasInnerClassResultListone.size() <= 0 || Measdatlst.size() <= 0){
                    
                            AvailableMeasure =  'count(Rows)';
                            AliasMeasureAPIN = 'count';
                            MeasureAPI = 'count()';
                            CompactMeasureAPIN = '[\\"count\\",\\"*\\"]';    
                      
                } 
                else if(MeasInnerClassResultListone.size() > 0 && Measdatlst.size() > 0){
				
					for(integer w=0;w<=MeasInnerClassResultListone.size();w++){  
                             j= w-1;
							if(Measdatlst[0].Value_1__c == String.valueof(w) && Measdatlst[0].Field_1__c != 'none' && Measdatlst[0].Field_1__c != ''){
							    if(Measdatlst[0].Value_1__c !=  '0'){
    								AvailableMeasure +=  Measdatlst[0].Field_1__c+'('+MeasInnerClassResultListone[j].Name+'),';
    								AliasMeasureAPIN +=  Measdatlst[0].Field_1__c+'_'+MeasInnerClassResultListone[j].Name+',';
    								MeasureAPI += Measdatlst[0].Field_1__c+'(\''+MeasInnerClassResultListone[j].Name+'\'),';
    								CompactMeasureAPIN += '[\\"'+Measdatlst[0].Field_1__c + '\\",\\"'+ MeasInnerClassResultListone[j].Name + '\\"],';
							    }
							    else{
							        AvailableMeasure +=  'count(Rows),';
								    AliasMeasureAPIN +=  'count,';
								    MeasureAPI += 'count(),';
								    CompactMeasureAPIN += '[\\"count\\",\\"*\\"],';
							    }
                      
							}
							
					}
					for(integer w=0;w<=MeasInnerClassResultListone.size();w++){ 	
					     j=w-1;
						if(Measdatlst[0].Value_2__c == String.valueof(w) && Measdatlst[0].Field_2__c != 'none' && Measdatlst[0].Field_2__c != ''){
						    if(Measdatlst[0].Value_2__c !=  '0'){
								AvailableMeasure +=  Measdatlst[0].Field_2__c+'('+MeasInnerClassResultListone[j].Name+'),';
								AliasMeasureAPIN +=  Measdatlst[0].Field_2__c+'_'+MeasInnerClassResultListone[j].Name+',';
								MeasureAPI += Measdatlst[0].Field_2__c+'(\''+MeasInnerClassResultListone[j].Name+'\'),';
								CompactMeasureAPIN += '[\\"'+Measdatlst[0].Field_2__c + '\\",\\"'+ MeasInnerClassResultListone[j].Name + '\\"],';
						    }
						    else{
						        AvailableMeasure +=  'count(Rows),';
							    AliasMeasureAPIN +=  'count,';
							    MeasureAPI += 'count(),';
							    CompactMeasureAPIN += '[\\"count\\",\\"*\\"],';
						    }
                  
						}
					}
					
					for(integer w=0;w<=MeasInnerClassResultListone.size();w++){ 
					    j=w-1;
						if(Measdatlst[0].Value_3__c == String.valueof(w) && Measdatlst[0].Field_3__c != 'none' && Measdatlst[0].Field_3__c != ''){
							if(Measdatlst[0].Value_3__c !=  '0'){
								AvailableMeasure +=  Measdatlst[0].Field_3__c+'('+MeasInnerClassResultListone[j].Name+'),';
								AliasMeasureAPIN +=  Measdatlst[0].Field_3__c+'_'+MeasInnerClassResultListone[j].Name+',';
								MeasureAPI += Measdatlst[0].Field_3__c+'(\''+MeasInnerClassResultListone[j].Name+'\'),';
								CompactMeasureAPIN += '[\\"'+Measdatlst[0].Field_3__c + '\\",\\"'+ MeasInnerClassResultListone[j].Name + '\\"],';
						    }
                            else{
						        AvailableMeasure +=  'count(Rows),';
							    AliasMeasureAPIN +=  'count,';
							    MeasureAPI += 'count(),';
							    CompactMeasureAPIN += '[\\"count\\",\\"*\\"],';
						    }
						}
					}
					
					for(integer w=0;w<=MeasInnerClassResultListone.size();w++){ 
						j=w-1;
						if(Measdatlst[0].Value_4__c == String.valueof(w) && Measdatlst[0].Field_4__c != 'none' && Measdatlst[0].Field_4__c != ''){
						    if(Measdatlst[0].Value_4__c !=  '0' ){
								AvailableMeasure +=  Measdatlst[0].Field_4__c+'('+MeasInnerClassResultListone[j].Name+'),';
								AliasMeasureAPIN +=  Measdatlst[0].Field_4__c+'_'+MeasInnerClassResultListone[j].Name+',';
								MeasureAPI += Measdatlst[0].Field_4__c+'(\''+MeasInnerClassResultListone[j].Name+'\'),';
								CompactMeasureAPIN += '[\\"'+Measdatlst[0].Field_4__c + '\\",\\"'+ MeasInnerClassResultListone[j].Name + '\\"],';
						    }
                            else{
						        AvailableMeasure +=  'count(Rows),';
							    AliasMeasureAPIN +=  'count,';
							    MeasureAPI += 'count(),';
							    CompactMeasureAPIN += '[\\"count\\",\\"*\\"],';
						    }
						}
					}
					for(integer w=0;w<=MeasInnerClassResultListone.size();w++){ 
					    j=w-1;
						if(Measdatlst[0].Value_5__c == String.valueof(w) && Measdatlst[0].Field_5__c != 'none' && Measdatlst[0].Field_5__c != ''){
						    if(Measdatlst[0].Value_5__c !=  '0'){
							    AvailableMeasure +=  Measdatlst[0].Field_5__c+'('+MeasInnerClassResultListone[j].Name+'),';
								AliasMeasureAPIN +=  Measdatlst[0].Field_5__c+'_'+MeasInnerClassResultListone[j].Name+',';
								MeasureAPI += Measdatlst[0].Field_5__c+'(\''+MeasInnerClassResultListone[j].Name+'\'),';
								CompactMeasureAPIN += '[\\"'+Measdatlst[0].Field_5__c + '\\",\\"'+ MeasInnerClassResultListone[j].Name + '\\"],';
						    }
						    else{
						        AvailableMeasure +=  'count(Rows),';
							    AliasMeasureAPIN +=  'count,';
							    MeasureAPI += 'count(),';
							    CompactMeasureAPIN += '[\\"count\\",\\"*\\"],';
						    }
						    
						}
				}
					
						
						
						
					
						
						
							
                }
                
                	AvailableMeasure = AvailableMeasure.removeEnd(',');
					AliasMeasureAPIN = AliasMeasureAPIN.removeEnd(',');
					MeasureAPI = MeasureAPI.removeEnd(',');
					CompactMeasureAPIN = CompactMeasureAPIN.removeEnd(',');
               
                list<Measure_Requirements__c> Measdatlsts= [select  id,Field_3__c,Measure_Number__c,Field_4__c
                                                              from Measure_Requirements__c where Field_5__c =: 'Batch job' and Field_3__c =: SessionIds];
                 
                 
                 Measure_Requirements__c Measdatlsta= new Measure_Requirements__c();
               
               Dataset__c DatasetRec = new Dataset__c();
                if(Allvalues != 'SaveandCancel'){
                 
           
                list<Dataset__c> DatasetReclist = new list<Dataset__c>();
                
                DatasetRec.RowNumber__c = 1; 
                DatasetRec.Dataset_Name__c = datasetmap.get(DashId[0]); 
                DatasetRec.Dataset_Id__c = DashId[0]; 
                DatasetRec.Date_Label__c = AvailableDateField; 
                DatasetRec.Data_API__c = DateFieldApi; 
                
                DatasetRec.New_Dimension_Name__c = AvailableDimension; 
                DatasetRec.New_Dimension_API__c = DimensionApi; 
                
                DatasetRec.Measure_Name__c = AvailableMeasure; 
                DatasetRec.Measure_API__c = MeasureAPI; 
                DatasetRec.AliasMeasure_API__c = AliasMeasureAPIN;
                DatasetRec.CompactMeasure_API__c = CompactMeasureAPIN; 
                DatasetReclist.add(DatasetRec);
                
               // list<Sales_Insight__c> Saless = [select id from Sales_Insight__c where Name ='Default SingleKPI Theme' and Dashboard_Id__c = null and Dashboard_Id__c = '' order by createddate asc limit 1]; 
               // String AllTheme = Saless[0].Id;
                httpResponse SingleRes =  new httpResponse();
                
                if(!Test.isRunningTest())
                SingleRes = SingleKPI_DashboardService.m_createSingleDashboard(DatasetReclist,DashboardName+'_'+DatasetRec.Dataset_Name__c,DatasetRec.Dataset_Name__c,DatasetRec.Dataset_Name__c,FolderIds,Allvals,SessionIds);
               
                if(SingleRes.getStatus() == 'Created'){
              	
                 
                 Allvaluestrue = 'true';
                 
                 Measdatlsta.Field_2__c = Allvaluestrue;
                 if(Measdatlsts.size() <= 0){
                    
                    Measdatlsta.Measure_Number__c = 1;
                 }
                 if(Measdatlsts.size()> 0){
                     Measdatlsta.Measure_Number__c = Measdatlsts[0].Measure_Number__c + 1;
                 }
                }
                 
                
                 //system.debug('Final Response'+finalResponse);
                 
                 
              } 
              else{
                  Allvaluesfalse = 'true';
                    Measdatlsta.Field_1__c = Allvaluesfalse;
                    if(Measdatlsts.size() <= 0){
                        Measdatlsta.Field_4__c = '1';
                    }
                    if(Measdatlsts.size()> 0){
                         Measdatlsta.Field_4__c = String.valueof(integer.valueof(Measdatlsts[0].Field_4__c) + 1);
                    }
              }
              
               
           
             
              
              Measdatlsta.Field_5__c = 'Batch job';
             if(Measdatlsts.size() <= 0){
                 if(Schema.sObjectType.Measure_Requirements__c.fields.Measure_Number__c.isCreateable() && Schema.sObjectType.Measure_Requirements__c.fields.Field_2__c .isCreateable()
                    && Schema.sObjectType.Measure_Requirements__c.fields.Field_1__c .isCreateable() && Schema.sObjectType.Measure_Requirements__c.fields.Field_4__c  .isCreateable()
                    && Schema.sObjectType.Measure_Requirements__c.fields.Field_3__c .isCreateable() && Schema.sObjectType.Measure_Requirements__c.fields.Field_5__c .isCreateable()  ){
                    Measdatlsta.Field_3__c = SessionIds;
                    insert Measdatlsta;
                 }
             }
             if(Measdatlsts.size()> 0){
                 if(Schema.sObjectType.Measure_Requirements__c.fields.Measure_Number__c.isUpdateable() && Schema.sObjectType.Measure_Requirements__c.fields.Field_2__c .isUpdateable()
                    && Schema.sObjectType.Measure_Requirements__c.fields.Field_1__c .isUpdateable() && Schema.sObjectType.Measure_Requirements__c.fields.Field_4__c  .isUpdateable()
                    && Schema.sObjectType.Measure_Requirements__c.fields.Field_3__c .isUpdateable() && Schema.sObjectType.Measure_Requirements__c.fields.Field_5__c .isUpdateable() 
                    && Schema.sObjectType.Measure_Requirements__c.fields.id.isUpdateable()){ 
                     Measdatlsta.Id = Measdatlsts[0].id;
                     Measdatlsta.Field_3__c = Measdatlsts[0].Field_3__c;
                     update Measdatlsta;
                    }
             }
        //}
             
             
             
             
             
                  
             
              DB_Template__c DatasetRecs = new DB_Template__c();
              if(Schema.sObjectType.DB_Template__c.fields.DB_Name__c.isCreateable() && Schema.sObjectType.DB_Template__c.fields.Type__c .isCreateable()){
                        DatasetRecs.DB_Name__c = dashboardName+'_'+datasetmap.get(DashId[0]);
                        DatasetRecs.Type__c = 'Single KPI';
                        insert  DatasetRecs;
                        system.debug('Dashboard Name @Pavan '+DatasetRecs.DB_Name__c);
                        
             }    
             
             
             
                        KPIs__c KPIs = new KPIs__c();
            if(Schema.sObjectType.KPIs__c.fields.RowNumber__c.isCreateable() && Schema.sObjectType.KPIs__c.fields.Dataset_Name__c .isCreateable() 
              && Schema.sObjectType.KPIs__c.fields.Dataset_Id__c.isCreateable() && Schema.sObjectType.KPIs__c.fields.Dimension_Name__c.isCreateable()
             && Schema.sObjectType.KPIs__c.fields.Measure_Label__c.isCreateable() && Schema.sObjectType.KPIs__c.fields.Filter_Logics__c.isCreateable()
             && Schema.sObjectType.KPIs__c.fields.Filter_Name__c.isCreateable() && Schema.sObjectType.KPIs__c.fields.User_Logic__c.isCreateable()
              && Schema.sObjectType.KPIs__c.fields.DB_Template__c.isCreateable() && Schema.sObjectType.KPIs__c.fields.AliasMeasure_API__c.isCreateable()
             && Schema.sObjectType.KPIs__c.fields.CompactMeasure_API__c.isCreateable() && Schema.sObjectType.KPIs__c.fields.Dimension_API_Name__c.isCreateable()
             && Schema.sObjectType.KPIs__c.fields.Measure_API__c.isCreateable() && Schema.sObjectType.KPIs__c.fields.Date_API__c.isCreateable()
             && Schema.sObjectType.KPIs__c.fields.Date_Label__c.isCreateable()){
                        KPIs.RowNumber__c = 1; 
                        KPIs.Dataset_Name__c = datasetmap.get(DashId[0]);  
                        KPIs.Dataset_Id__c = DashId[0]; 
                        KPIs.Dimension_Name__c = AvailableDimension;  
                        KPIs.Date_Label__c = AvailableDateField; 
                        KPIs.Measure_Label__c = AvailableMeasure; 
                        KPIs.Filter_Logics__c = '\''+FilterDimensions+ '\' in all';
                        KPIs.Filter_Name__c = 'All';
                        KPIs.User_Logic__c = '1';
                        KPIs.DB_Template__c = DatasetRecs.Id;
                        KPIs.AliasMeasure_API__c = AliasMeasureAPIN;
                        KPIs.CompactMeasure_API__c = CompactMeasureAPIN;
                        KPIs.Dimension_API_Name__c = DimensionApi;
                        KPIs.Measure_API__c = MeasureAPI; 
                        KPIs.Date_API__c = DateFieldApi;  
                        //KPIs.Filter_Code__c = Filtercode;
                        insert KPIs;
            
             }
                
       
        
        System.debug('DashId***************** '+DashId+' curr '+CurrentverId + ' ');
      
        
    }
    public void finish(Database.BatchableContext BC) {
            
    }
    public Iterable<String> start(Database.BatchableContext BC) {
        return AllStrings;
    }
    
    
    public String Dimensions(String Dropvalue,String CurrentverId){
            String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v39.0';
            String datasetId = Dropvalue;
            String versionId = CurrentverId;
            String endpoint;
            endpoint = sfdcInstance + '/wave/datasets/'+ datasetId +'/versions/' + versionId +'/xmds/main';                 
            Http http = new Http();
            HttpRequest req = new HttpRequest();
            req.setEndpoint(endpoint);   
            req.setMethod('GET');
            req.setHeader('Authorization', 'OAuth ' + SessionIds);
            req.setHeader('content-type', 'application/json');         
            HttpResponse res;
           if(!Test.isRunningTest()){
            res = http.send(req);          
            return res.getBody();  
        	}
        	else{
                return null;
            } 
    }                         
     public String getDatasets() {
        String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v39.0';
        String endpoint;
        endpoint = sfdcInstance + '/wave/datasets?pageSize=200';         
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);   
        req.setMethod('GET');
        req.setHeader('Authorization', 'OAuth ' + SessionIds);
        req.setHeader('content-type', 'application/json');         
        HttpResponse res;
        
        if(!Test.isRunningTest()){
            res = http.send(req);            
            return res.getBody();  
        }
        else{
                return null;
            } 
    }
    
    public list<innerClass> values = new list<innerClass>();
    public class InnerClass implements Comparable{
        public String Name;
        public integer value;
        public innerclass(String Name,integer value){
            this.Name = Name;
            this.value = value;
        }
        
        public Integer compareTo(Object ObjToCompare) {
             innerclass compareToEmp = (innerclass)ObjToCompare;
            if (value == compareToEmp.value) return 0;
            if (value > compareToEmp.value) return 1;
            return -1;        
            }
    }
    
     public list<InnerClassResult> InnerClassResultList = new list<InnerClassResult>();
    public class InnerClassResult implements Comparable{
        public String Name;
        public integer value;
        public integer values;
        public integer newvalue = 0;
        public InnerClassResult(String Name,integer value,integer values){
            this.Name = Name;
            this.value = value;
            this.values = values;
        }
        
         public Integer compareTo(Object ObjToCompare) {
             InnerClassResult compareToEmp = (InnerClassResult)ObjToCompare;
            if (Integer.valueof(values) == Integer.valueof(compareToEmp.values)) return 0;
            if (Integer.valueof(values) < Integer.valueof(compareToEmp.values)) return 1;
            return -1;        
            }
    }
    
    public list<MeasInnerClassResult> MeasInnerClassResultList = new list<MeasInnerClassResult>();
    public class MeasInnerClassResult{
        public String Name;
        public integer value;
        public integer values;
        public MeasInnerClassResult(String Name,integer value,integer values){
            this.Name = Name;
            this.value = value;
            this.values = values; 
        }
    }
}