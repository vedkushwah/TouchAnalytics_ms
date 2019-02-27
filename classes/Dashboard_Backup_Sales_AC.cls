public class Dashboard_Backup_Sales_AC {
    // private string  NewWrap;
    // public Sales_Insight__c NewDashboardSingle(String Allval){
    //       System.debug('Allval *********** ' + Allval);  
         
    //      list<Sales_Insight__c> NewSaleslist = [select id,Name,Dashboard_Id__c,Dashboard_Type__c,DataSet_Delete__c,Sales_insight_String5__c,Delete_All_Group__c,Delete_All_Orders__c,Sales_KPI_Delete__c,Number_Delete1__c,ListSelector__c,Lis_Selector36__c,Sales_insight_Day_Delete__c,Sales_Insight_String2__c,Sales_Insight_String3__c,Grouping_label_Delete__c,Grouping_Delete__c,Measures_Delete__c,Sales_Insight_String4__c,List_Selector53__c,Sales_insight_String1__c from Sales_Insight__c where  id =: Allval limit 1];
    //     String Str = userInfo.getSessionId();
    //       Sales_Insight__c Sales = new Sales_Insight__c();
    //     if(NewSaleslist.size() > 0){
    //         for(Sales_Insight__c slds : NewSaleslist){
    //             HttpResponse hRes = SingleKPI_DashboardService.retriveDashboardFile(slds.Name, Str);
    //             String responseBody;
                
    //             if(!Test.isRunningTest()){
    //                 responseBody= hRes.getBody();
    //             }
    //             else{
    //                 list<Sales_Insight__c> Saleslist = [select id,Name,Sales_Insight_String2__c,Sales_Insight_String3__c,Sales_Insight_String4__c,Sales_insight_String1__c from Sales_Insight__c where Name = 'Theme For NewSalesSight' limit 1];
    //               responseBody= Saleslist[0].Sales_Insight_String1__c + Saleslist[0].Sales_insight_String2__c + Saleslist[0].Sales_Insight_String3__c;
    //             }
    //             System.debug(hRes.getStatus()+ 'responseBody *********** ' + responseBody);
    //             if(hRes.getStatus() == 'OK' || Test.isRunningTest()){   
               
    //               String objNewDesc1='',objNewDesc3='',objNewDesc4='',objNewDescKPI2='',NewDescKPI2='';
    //               String objKPINewDesc1KPI5 = '';
    //               //String objKPINewDesc2KPI5 = '';
    //               String objKPINewDesc3KPI5 = '';
    //               String objKPINewDesc4KPI5 = '';
    //              String  objNewDescKPI3='';
    //              String objNewDesc2KPI2='';
    //              String objNewDesc3KPI3='',objNewDesc3KPI4='';
    //             String FilobjKPINewDesc3='',FilobjKPINewDesc4='',FilobjKPINewDesc5='',FilobjKPINewDesc6 = '',FilobjKPINewDesc7 = '';
    //             String FilobjKPINewDescMeas='',FilobjKPINewDescSort='';
    //             String NewDesc1='',NewDesc3='',NewDesc4='' ;
    //             String NewDesc2KPI2='';
    //             String NewDesc3KPI3='',NewDesc3KPI4='' ;
    //             String NewDescKPI3='';
    //             String KPINewDesc1KPI5='';
    //             String KPINewDesc2KPI5='';
    //             String KPINewDesc3KPI5='';
    //             String KPINewDesc4KPI5='';
    //             String FilNewDesc3='',FilNewDesc4='',FilNewDesc5='',FilNewDesc6='',FilNewDesc7='';
    //             String FilNewDescMeas= '',FilNewDescSort = '';
    //              Newwrap='';
                     
                      
    //                   NewWrap = Slds.Grouping_label_Delete__c.replaceAll('\\s+\\s+','#testcode#').replaceAll('#testcode#',' ');
    //                     String[] responses1 = responseBody.split('"Filters_Container":');
    //                     if(responses1.size()>1){
    //                     	String[] NewDescllist1 = responses1[1].split('"type":"container"');
    //                     	NewDesc1 = '"Filters_Container":' +NewDescllist1[0]+'"type": "container" },';
    //                     }
    //                     String[] objresponses1 = NewWrap.split('"Filters_Container":');
    //                     if(objresponses1.size()>1){
    //                     	objresponses1[1] = objresponses1[1].replace('"type": "container"','"type":"container"');
    //                     	String[] objNewDescllist1 = objresponses1[1].split('"type":"container"');
    //                     	objNewDesc1 = '"Filters_Container":' +objNewDescllist1[0]+'"type": "container" },';
    //                     }

    //                     String[] responses4 = responseBody.split('"Groupings_Container":');
    //                     if(responses4.size()>1){
    //                     String[] NewDescllist4 = responses4[1].split('"type":"container"');
    //                      NewDesc4 = '"Groupings_Container":' +NewDescllist4[0]+'"type": "container" },';
    //                     }
    //                     String[] objresponses4 = NewWrap.split('"Groupings_Container":');
    //                     if(objresponses4.size()>1){
    //                     objresponses4[1] = objresponses4[1].replace('"type": "container"','"type":"container"');
    //                     String[] objNewDescllist4 = objresponses4[1].split('"type":"container"');
    //                      objNewDesc4 = '"Groupings_Container":' +objNewDescllist4[0]+'"type": "container" },';
    //                     }


    //                     String[] FilKPIresponses6 = responseBody.split('"Dashboard_Title":');
    //                     if(FilKPIresponses6.size()>1){
    //                     String[] FilKPINewDescllist6 = FilKPIresponses6[1].split('"type":"text"');
    //                     String[] NewFilobj = FilKPINewDescllist6[0].split('"text":');
    //                      String[] StrNewFilobj = NewFilobj[1].split(',');
    //                      FilKPINewDescllist6[0] = FilKPINewDescllist6[0].replace(StrNewFilobj[0],'"Dashboard Title"');
    //                     FilNewDesc6 = '"Dashboard_Title":' +FilKPINewDescllist6[0]+'"type": "text" },';
    //                     } 						

    //                     String[] FilobjKPIresponses6 = NewWrap.split('"Dashboard_Title":');
    //                     if(FilobjKPIresponses6.size()>1){
    //                      FilobjKPIresponses6[1] = FilobjKPIresponses6[1].replace('"type": "text"','"type":"text"');
    //                     String[] FilobjKPINewDescllist6 = FilobjKPIresponses6[1].split('"type":"text"');
    //                      FilobjKPINewDesc6 = '"Dashboard_Title":' +FilobjKPINewDescllist6[0]+'"type": "text" },';
    //                     }	

    //                     String[] FilKPIresponsesMeas = responseBody.split('"Measure_Text":');
    //                     if(FilKPIresponsesMeas.size()>1){
    //                     String[] FilKPINewDescllistMeas = FilKPIresponsesMeas[1].split('"type":"text"');
    //                     FilNewDescMeas = '"Measure_Text":' +FilKPINewDescllistMeas[0]+'"type": "text" },';
    //                     }
 
    //                     String[] FilobjKPIresponsesMeas = NewWrap.split('"Measure_Text":');
    //                     if(FilobjKPIresponsesMeas.size()>1){
    //                      FilobjKPIresponsesMeas[1] = FilobjKPIresponsesMeas[1].replace('"type": "text"','"type":"text"');
    //                     String[] FilobjKPINewDescllistmeas = FilobjKPIresponsesMeas[1].split('"type":"text"');
    //                      FilobjKPINewDescMeas = '"Measure_Text":' +FilobjKPINewDescllistmeas[0]+'"type": "text" },';
    //                     }

				// 		String[] FilKPIresponsesSort = responseBody.split('"Sort_Results":');
    //                     if(FilKPIresponsesSort.size()>1){
    //                     String[] FilKPINewDescllistSort = FilKPIresponsesSort[1].split('"type":"text"');
    //                     FilNewDescSort = '"Sort_Results":' +FilKPINewDescllistSort[0]+'"type": "text" },';
    //                     }  

    //                     String[] FilobjKPIresponsesSort = NewWrap.split('"Sort_Results":');
    //                     if(FilobjKPIresponsesSort.size()>1){
    //                      FilobjKPIresponsesSort[1] = FilobjKPIresponsesSort[1].replace('"type": "text"','"type":"text"');
    //                     String[] FilobjKPINewDescllistSort = FilobjKPIresponsesSort[1].split('"type":"text"');
    //                      FilobjKPINewDescSort = '"Sort_Results":' +FilobjKPINewDescllistSort[0]+'"type": "text" },';
    //                     } 
                        
    //                     String[] objresponsesKPI2 = NewWrap.split('"KPI2_Description_Container":');
    //                 if(objresponsesKPI2.size()>1){
    //                 	objresponsesKPI2[1] = objresponsesKPI2[1].replace('"type": "container"','"type":"container"');
    //                 	String[] objNewDescllistKPI2 = objresponsesKPI2[1].split('"type":"container"');
    //                 	 objNewDescKPI2 = '"KPI2_Description_Container":' +objNewDescllistKPI2[0]+'"type": "container" },';
    //                 }
                         
    //                     String[] responsesKPI2 = responseBody.split('"KPI2_Description_Container":');
    //                     if(responsesKPI2.size()>1){
    //                     String[] NewDescllistKPI2 = responsesKPI2[1].split('"type":"container"');
    //                      NewDescKPI2 = '"KPI2_Description_Container":' +NewDescllistKPI2[0]+'"type": "container" },';
    //                     }
                        
                        
    //                     String[] responsesKPI3 = responseBody.split('"KPI3_Description_Container":');
    //                     if(responsesKPI3 .size()>1){
    //                     String[] NewDescllistKPI3  = responsesKPI3 [1].split('"type":"container"');
    //                      NewDescKPI3  = '"KPI3_Description_Container":' +NewDescllistKPI3 [0]+'"type": "container" },';
    //                     }
                         
    //                     String[] objresponsesKPI3  = NewWrap.split('"KPI3_Description_Container":');
    //                     if(objresponsesKPI3 .size()>1){
    //                     	objresponsesKPI3 [1] = objresponsesKPI3 [1].replace('"type": "container"','"type":"container"');
    //                     	String[] objNewDescllistKPI3  = objresponsesKPI3 [1].split('"type":"container"');
    //                     	objNewDescKPI3  = '"KPI3_Description_Container":' +objNewDescllistKPI3 [0]+'"type": "container" },';
    //                     }
                        
    //                      String[] responses3 = responseBody.split('"KPI1_Chart_Container":');
    //                         if(responses3.size()>1){
    //                         String[] NewDescllist3 = responses3[1].split('"type":"container"');
    //                          NewDesc3 = '"KPI1_Chart_Container":' +NewDescllist3[0]+'"type": "container" },';
    //                         }
                                            
    //                         String[] objresponses3 = NewWrap.split('"KPI1_Chart_Container":');
    //                         if(objresponses3.size()>1){
    //                         objresponses3[1] = objresponses3[1].replace('"type": "container"','"type":"container"');
    //                         String[] objNewDescllist3 = objresponses3[1].split('"type":"container"');
    //                          objNewDesc3 = '"KPI1_Chart_Container":' +objNewDescllist3[0]+'"type": "container" },';
    //                         }
                            
    //                          String[] responses3KPI3 = responseBody.split('"KPI3_Chart_Container":');
    //                         if(responses3KPI3.size()>1){
    //                         String[] NewDescllist3KPI3 = responses3KPI3[1].split('"type":"container"');
    //                          NewDesc3KPI3 = '"KPI3_Chart_Container":' +NewDescllist3KPI3[0]+'"type": "container" },';
    //                         }
                                            
    //                         String[] objresponses3KPI3 = NewWrap.split('"KPI3_Chart_Container":');
    //                         if(objresponses3KPI3.size()>1){
    //                         objresponses3KPI3[1] = objresponses3KPI3[1].replace('"type": "container"','"type":"container"');
    //                         String[] objNewDescllist3KPI3 = objresponses3KPI3[1].split('"type":"container"');
    //                          objNewDesc3KPI3 = '"KPI3_Chart_Container":' +objNewDescllist3KPI3[0]+'"type": "container" },';
    //                         }
                            
    //                          String[] responses3KPI4 = responseBody.split('"KPI4_Chart_Container":');
    //                         if(responses3KPI4.size()>1){
    //                         String[] NewDescllist3KPI4 = responses3KPI4[1].split('"type":"container"');
    //                          NewDesc3KPI4 = '"KPI4_Chart_Container":' +NewDescllist3KPI4[0]+'"type": "container" },';
    //                         }
                                            
    //                         String[] objresponses3KPI4 = NewWrap.split('"KPI4_Chart_Container":');
    //                         if(objresponses3KPI4.size()>1){
    //                         objresponses3KPI4[1] = objresponses3KPI4[1].replace('"type": "container"','"type":"container"');
    //                         String[] objNewDescllist3KPI4 = objresponses3KPI4[1].split('"type":"container"');
    //                          objNewDesc3KPI4 = '"KPI4_Chart_Container":' +objNewDescllist3KPI4[0]+'"type": "container" },';
    //                         }
                       
    //               // }
             
    //                       String KPINewDesc1KPI31 = ''; 
    //                 String KPINewDesc1KPI32 = '';
    //                 String KPINewDesc1KPI33 = ''; 
    //                 String KPINewDesc1KPI34 = ''; 
    //                 String KPINewDesc1KPI35 = '';  
                    
    //                 String objKPINewDesc4KPI31 = ''; 
    //                 String objKPINewDesc4KPI32 = '';
    //                 String objKPINewDesc4KPI33 = ''; 
    //                 String objKPINewDesc4KPI34 = ''; 
    //                 String objKPINewDesc4KPI35 = '';  
                    
                    
    //                 String[] KPIresponses1KPI31 = responseBody.split('"KPI1_Raw_Details_Title":');
    //                 if(KPIresponses1KPI31.size()>1){
    //                 String[] KPINewDescllist1KPI31 = KPIresponses1KPI31[1].split('"type":"text"');
    //                 KPINewDesc1KPI31 = '"KPI1_Raw_Details_Title":' +KPINewDescllist1KPI31[0]+'"type": "text" },';
    //                 }
                    
    //                 String[] KPIresponses1KPI32 = responseBody.split('"KPI2_Raw_Details_Title":');
    //                 if(KPIresponses1KPI32.size()>1){
    //                 String[] KPINewDescllist1KPI32 = KPIresponses1KPI32[1].split('"type":"text"');
    //                 KPINewDesc1KPI32 = '"KPI2_Raw_Details_Title":' +KPINewDescllist1KPI32[0]+'"type": "text" },';
    //                 }
                    
    //                 String[] KPIresponses1KPI33 = responseBody.split('"KPI3_Raw_Details_Title":');
    //                 if(KPIresponses1KPI33.size()>1){
    //                 String[] KPINewDescllist1KPI33 = KPIresponses1KPI33[1].split('"type":"text"');
    //                 KPINewDesc1KPI33 = '"KPI3_Raw_Details_Title":' +KPINewDescllist1KPI33[0]+'"type": "text" },';
    //                 }
                    
    //                 String[] KPIresponses1KPI34 = responseBody.split('"KPI4_Raw_Details_Title":');
    //                 if(KPIresponses1KPI34.size()>1){
    //                 String[] KPINewDescllist1KPI34 = KPIresponses1KPI34[1].split('"type":"text"');
    //                 KPINewDesc1KPI34 = '"KPI4_Raw_Details_Title":' +KPINewDescllist1KPI34[0]+'"type": "text" },';
    //                 }
                    
    //                 String[] KPIresponses1KPI35 = responseBody.split('"KPI5_Raw_Details_Title":');
    //                 if(KPIresponses1KPI35.size()>1){
    //                 String[] KPINewDescllist1KPI35 = KPIresponses1KPI35[1].split('"type":"text"');
    //                 KPINewDesc1KPI35 = '"KPI5_Raw_Details_Title":' +KPINewDescllist1KPI35[0]+'"type": "text" },';
    //                 }
                    
    //                 if(!Test.isRunningTest()){
    //                 String[] objKPIresponses4KPI31 = NewWrap.split('"KPI1_Raw_Details_Title":');
    //                 	 if(objKPIresponses4KPI31.size()>1){
    //                 	objKPIresponses4KPI31[1] = objKPIresponses4KPI31[1].replace('"type": "text"','"type":"text"');
    //                 	String[] objKPINewDescllist4KPI31 = objKPIresponses4KPI31[1].split('"type":"text"');
    //                 	 objKPINewDesc4KPI31 = '"KPI1_Raw_Details_Title":' +objKPINewDescllist4KPI31[0]+'"type": "text" },';
    //                 	 }
                    	 
    //                 	 String[] objKPIresponses4KPI32 = NewWrap.split('"KPI2_Raw_Details_Title":');
    //                 	 if(objKPIresponses4KPI32.size()>1){
    //                 	objKPIresponses4KPI32[1] = objKPIresponses4KPI32[1].replace('"type": "text"','"type":"text"');
    //                 	String[] objKPINewDescllist4KPI32 = objKPIresponses4KPI32[1].split('"type":"text"');
    //                 	 objKPINewDesc4KPI32 = '"KPI2_Raw_Details_Title":' +objKPINewDescllist4KPI32[0]+'"type": "text" },';
    //                 	 }
                    	 
    //                 	 String[] objKPIresponses4KPI33 = NewWrap.split('"KPI3_Raw_Details_Title":');
    //                 	 if(objKPIresponses4KPI33.size()>1){
    //                 	objKPIresponses4KPI33[1] = objKPIresponses4KPI33[1].replace('"type": "text"','"type":"text"');
    //                 	String[] objKPINewDescllist4KPI33 = objKPIresponses4KPI33[1].split('"type":"text"');
    //                 	 objKPINewDesc4KPI33 = '"KPI3_Raw_Details_Title":' +objKPINewDescllist4KPI33[0]+'"type": "text" },';
    //                 	 }
                    	 
    //                 	String[] objKPIresponses4KPI34 = NewWrap.split('"KPI4_Raw_Details_Title":');
    //                 	if(objKPIresponses4KPI34.size()>1){
    //                 	objKPIresponses4KPI34[1] = objKPIresponses4KPI34[1].replace('"type": "text"','"type":"text"');
    //                 	String[] objKPINewDescllist4KPI34 = objKPIresponses4KPI34[1].split('"type":"text"');
    //                 	 objKPINewDesc4KPI34 = '"KPI4_Raw_Details_Title":' +objKPINewDescllist4KPI34[0]+'"type": "text" },';
    //                 	 }
                    	 
    //                 	String[] objKPIresponses4KPI35 = NewWrap.split('"KPI5_Raw_Details_Title":');
    //                 	if(objKPIresponses4KPI35.size()>1){
    //                 	objKPIresponses4KPI35[1] = objKPIresponses4KPI35[1].replace('"type": "text"','"type":"text"');
    //                 	String[] objKPINewDescllist4KPI35 = objKPIresponses4KPI35[1].split('"type":"text"');
    //                 	 objKPINewDesc4KPI35 = '"KPI5_Raw_Details_Title":' +objKPINewDescllist4KPI35[0]+'"type": "text" },';
    //                 	 }
    //                 	 	NewWrap = NewWrap.replace(objKPINewDesc4KPI31,KPINewDesc1KPI31);
    //                 	NewWrap = NewWrap.replace(objKPINewDesc4KPI32,KPINewDesc1KPI32);
    //                 	NewWrap = NewWrap.replace(objKPINewDesc4KPI33,KPINewDesc1KPI33);
    //                 	NewWrap = NewWrap.replace(objKPINewDesc4KPI34,KPINewDesc1KPI34);
    //                 	NewWrap = NewWrap.replace(objKPINewDesc4KPI35,KPINewDesc1KPI35);
    //                 }
	 

             
    //           // } 
    //                     NewWrap = NewWrap.replace(objNewDesc3,NewDesc3);
    //                     NewWrap = NewWrap.replace(objNewDesc3KPI3,NewDesc3KPI3);
    //                     NewWrap = NewWrap.replace(objNewDesc3KPI4,NewDesc3KPI4);
                        
    //                     NewWrap = NewWrap.replace(objNewDesc1,NewDesc1);
    //                     NewWrap = NewWrap.replace(objNewDescKPI2,NewDescKPI2);
    //                     NewWrap = NewWrap.replace(objNewDescKPI3,NewDescKPI3);
    //                     NewWrap = NewWrap.replace(objNewDesc4,NewDesc4);
    //                     NewWrap = NewWrap.replace(FilobjKPINewDesc6,FilNewDesc6);
    //                     NewWrap = NewWrap.replace(FilobjKPINewDesc7,FilNewDesc7);
    //                     NewWrap = NewWrap.replace(FilobjKPINewDescMeas,FilNewDescMeas).replace(FilobjKPINewDescSort,FilNewDescSort); 
    //                     NewWrap = NewWrap.replace('"type":"text"','"type": "text"');
    //                     NewWrap  = Newwrap.replace('&quot;','\\"');
    //                     if(!Test.isRunningTest()){
    //                     Slds.Grouping_label_Delete__c = NewWrap;
                         
    //                     Sales.id = Slds.Id;
    //                     Sales.Grouping_label_Delete__c = Slds.Grouping_label_Delete__c;
    //                     }
                       
    //                 }
    //             }
    //         return Sales;
    //     }
    //     return null;
    // }
    
    // public Sales_Insight__c NewDashboardSingle3(String Allval){
    //       System.debug('Allval *********** ' + Allval);  
         
    //      list<Sales_Insight__c> NewSaleslist = [select id,Name,Dashboard_Id__c,Dashboard_Type__c,DataSet_Delete__c,Sales_insight_String5__c,Delete_All_Group__c,Delete_All_Orders__c,Sales_KPI_Delete__c,Number_Delete1__c,ListSelector__c,Lis_Selector36__c,Sales_insight_Day_Delete__c,Sales_Insight_String2__c,Sales_Insight_String3__c,Grouping_label_Delete__c,Grouping_Delete__c,Measures_Delete__c,Sales_Insight_String4__c,List_Selector53__c,Sales_insight_String1__c from Sales_Insight__c where  id =: Allval limit 1];
    //     String Str = userInfo.getSessionId();
    //       Sales_Insight__c Sales = new Sales_Insight__c();
    //     if(NewSaleslist.size() > 0){
    //         for(Sales_Insight__c slds : NewSaleslist){
    //             HttpResponse hRes = SingleKPI_DashboardService.retriveDashboardFile(slds.Name, Str);
    //             String responseBody;
                
    //             if(!Test.isRunningTest()){
    //                 responseBody= hRes.getBody();
    //             }
    //             else{
    //                   responseBody= NewSaleslist[0].DataSet_Delete__c +NewSaleslist[0].Sales_Insight_String5__c + NewSaleslist[0].Sales_insight_String2__c + NewSaleslist[0].Sales_insight_String3__c +NewSaleslist[0].Grouping_label_Delete__c + NewSaleslist[0].Sales_insight_String4__c + NewSaleslist[0].Grouping_Delete__c ;   
    //               //  }
    //               //responseBody= NewSaleslist[0].DataSet_Delete__c +NewSaleslist[0].Sales_Insight_String5__c + NewSaleslist[0].Sales_insight_String2__c + NewSaleslist[0].Sales_insight_String3__c +NewSaleslist[0].Grouping_label_Delete__c + NewSaleslist[0].Sales_insight_String4__c + NewSaleslist[0].Grouping_Delete__c ; 
    //             }
    //             System.debug(hRes.getStatus()+ 'responseBody *********** ' + responseBody);
    //             if(hRes.getStatus() == 'OK' || Test.isRunningTest()){   
               
    //              string KPINewDesc1 = '';
    //             string KPINewDesc2 = '';
    //             string KPINewDesc3 = '';
    //             string KPINewDesc4 = '';
    //             string objKPINewDesc1 = '';
    //             string objKPINewDesc2 = '';
    //             string objKPINewDesc3 = '';
    //             string objKPINewDesc4 = '';
    //             string FilobjKPINewDesc1 = '';
    //             string FilNewDesc1 = '';
    //             string FilobjKPINewDesc2 = '';
    //             string FilNewDesc2 = '';
    //             string NewDesc = '';
    //             string objNewDesc = '';
    //             string NewDescKPI4 = '';
    //             string objNewDescKPI4 = '';
    //             string NewDescKPI5 = '';
    //             string objNewDescKPI5 = '';
    //             string NewDesc2KPI2 = '';
    //             string objNewDesc2KPI2 = '';
    //             string NewDesc2KPI5 = '';
    //             string objNewDesc2KPI5 = '';
    //             string NewDesc3KPI2 = '';
    //             string objNewDesc3KPI2  = '';
    //             string NewDesc3KPI5 = '';
    //             string objNewDesc3KPI5 = '';
    //             string KPINewDesc1KPI2 = '';
    //             string KPINewDesc2KPI2 = '';
    //             string KPINewDesc3KPI2 = '';
    //             string KPINewDesc4KPI2 = '';
    //             string objKPINewDesc1KPI2 = '';
    //             string objKPINewDesc2KPI2 = '';
    //             string objKPINewDesc3KPI2 = '';
    //             string objKPINewDesc4KPI2 = '';
    //             string KPINewDesc1KPI4 = '';
    //             string KPINewDesc2KPI4 = '';
    //             string KPINewDesc3KPI4 = '';
    //             string KPINewDesc4KPI4 = '';
    //             string objKPINewDesc1KPI4 = '';
    //             string objKPINewDesc2KPI4 = '';
    //             string objKPINewDesc3KPI4 = '';
    //             string objKPINewDesc4KPI4 = '';
    //             string KPINewDesc1KPI5 = '';
    //             string KPINewDesc2KPI5 = '';
    //             string KPINewDesc3KPI5 = '';
    //             string KPINewDesc4KPI5 = '';
    //             string objKPINewDesc1KPI5 = '';
    //             string objKPINewDesc2KPI5 = '';
    //             string objKPINewDesc3KPI5 = '';
    //             string objKPINewDesc4KPI5 = '';
  
    //              string objNewDesc2KPI3 = '';
    //             string NewDesc2KPI3 = '';
    //             Newwrap='';
    //               Newwrap = Slds.Sales_Insight_String4__c.replaceAll('\\s+\\s+','#testcode#').replaceAll('#testcode#',' ');
                        
    //             String[] KPIresponses1 = responseBody.split('"KPI1_KPI_Title_4":');
				// 	 if(KPIresponses1.size()>1){
				// 	String[] KPINewDescllist1 = KPIresponses1[1].split('"type":"text"');
				// 	 KPINewDesc1 = '"KPI1_KPI_Title_4":' +KPINewDescllist1[0]+'"type": "text" },';
				// 	 }
					
				// 	String[] KPIresponses2 = responseBody.split('"KPI1_KPI_Title_3":');
				// 	if(KPIresponses2.size()>1){
				// 	String[] KPINewDescllist2 = KPIresponses2[1].split('"type":"text"');
				// 	 KPINewDesc2 = '"KPI1_KPI_Title_3":' +KPINewDescllist2[0]+'"type": "text" },';
				// 	}
					
				// 	String[] KPIresponses3 = responseBody.split('"KPI1_KPI_Title_2":');
				// 	if(KPIresponses3.size()>1){
				// 	String[] KPINewDescllist3 = KPIresponses3[1].split('"type":"text"');
				// 	 KPINewDesc3 = '"KPI1_KPI_Title_2":' +KPINewDescllist3[0]+'"type": "text" },';
				// 	}
					
				// 	String[] KPIresponses4 = responseBody.split('"KPI1_KPI_Title_1":');
				// 	if(KPIresponses4.size()>1){
				// 	String[] KPINewDescllist4 = KPIresponses4[1].split('"type":"text"');
				// 	 KPINewDesc4 = '"KPI1_KPI_Title_1":' +KPINewDescllist4[0]+'"type": "text" },';
				// 	}
					
					
				// 	String[] objKPIresponses1 = NewWrap.split('"KPI1_KPI_Title_4":');
				// 			if(objKPIresponses1.size()>1){
				// 			objKPIresponses1[1] = objKPIresponses1[1].replace('"type": "text"','"type":"text"');
				// 			String[] objKPINewDescllist1 = objKPIresponses1[1].split('"type":"text"');
				// 			 objKPINewDesc1 = '"KPI1_KPI_Title_4":' +objKPINewDescllist1[0]+'"type": "text" },';
				// 			}
							
				// 			String[] objKPIresponses2 = NewWrap.split('"KPI1_KPI_Title_3":');
				// 			if(objKPIresponses2.size()>1){
				// 			objKPIresponses2[1] = objKPIresponses2[1].replace('"type": "text"','"type":"text"');
				// 			String[] objKPINewDescllist2 = objKPIresponses2[1].split('"type":"text"');
				// 			 objKPINewDesc2 = '"KPI1_KPI_Title_3":' +objKPINewDescllist2[0]+'"type": "text" },';
				// 			}
							
				// 			String[] objKPIresponses3 = NewWrap.split('"KPI1_KPI_Title_2":');
				// 			if(objKPIresponses3.size()>1){
				// 			objKPIresponses3[1] = objKPIresponses3[1].replace('"type": "text"','"type":"text"');
				// 			String[] objKPINewDescllist3 = objKPIresponses3[1].split('"type":"text"');
				// 			 objKPINewDesc3 = '"KPI1_KPI_Title_2":' +objKPINewDescllist3[0]+'"type": "text" },';
				// 			}
							
				// 			String[] objKPIresponses4 = NewWrap.split('"KPI1_KPI_Title_1":');
				// 			 if(objKPIresponses4.size()>1){
				// 			objKPIresponses4[1] = objKPIresponses4[1].replace('"type": "text"','"type":"text"');
				// 			String[] objKPINewDescllist4 = objKPIresponses4[1].split('"type":"text"');
				// 			 objKPINewDesc4 = '"KPI1_KPI_Title_1":' +objKPINewDescllist4[0]+'"type": "text" },';
				// 			 }

    //                     String[] FilobjKPIresponses1 = NewWrap.split('"Filters_Title":');
    //                     if(FilobjKPIresponses1.size()>1){
    //                      FilobjKPIresponses1[1] = FilobjKPIresponses1[1].replace('"type": "text"','"type":"text"');
    //                     String[] FilobjKPINewDescllist1 = FilobjKPIresponses1[1].split('"type":"text"');
    //                      FilobjKPINewDesc1 = '"Filters_Title":' +FilobjKPINewDescllist1[0]+'"type": "text" },';
    //                     }
						
    //                     String[] FilKPIresponses1 = responseBody.split('"Filters_Title":');
    //                      if(FilKPIresponses1.size()>1){
    //                     String[] FilKPINewDescllist1 = FilKPIresponses1[1].split('"type":"text"');
    //                     FilNewDesc1 = '"Filters_Title":' +FilKPINewDescllist1[0]+'"type": "text" },';
    //                      }
                        				 
                        
    //                      String[] FilobjKPIresponses2 = NewWrap.split('"Overview_Title":');
    //                     if(FilobjKPIresponses2.size()>1){
    //                      FilobjKPIresponses2[1] = FilobjKPIresponses2[1].replace('"type": "text"','"type":"text"');
    //                     String[] FilobjKPINewDescllist2 = FilobjKPIresponses2[1].split('"type":"text"');
    //                      FilobjKPINewDesc2 = '"Overview_Title":' +FilobjKPINewDescllist2[0]+'"type": "text" },';
    //                     }
                        						
    //                     String[] FilKPIresponses2 = responseBody.split('"Overview_Title":');
    //                     if(FilKPIresponses2.size()>1){
    //                     String[] FilKPINewDescllist2 = FilKPIresponses2[1].split('"type":"text"');
    //                     FilNewDesc2 = '"Overview_Title":' +FilKPINewDescllist2[0]+'"type": "text" },';
    //                     }
                        
    //                      String[] responses = responseBody.split('"KPI1_Description_Container":');
    //                     if(responses.size()>1){
    //                     String[] NewDescllist = responses[1].split('"type":"container"');
    //                      NewDesc = '"KPI1_Description_Container":' +NewDescllist[0]+'"type": "container" },';
    //                     }
                         
    //                     String[] objresponses = NewWrap.split('"KPI1_Description_Container":');
    //                     if(objresponses.size()>1){
    //                     	objresponses[1] = objresponses[1].replace('"type": "container"','"type":"container"');
    //                     	String[] objNewDescllist = objresponses[1].split('"type":"container"');
    //                     	 objNewDesc = '"KPI1_Description_Container":' +objNewDescllist[0]+'"type": "container" },';
    //                     }


    //                         String[] responsesKPI4 = responseBody.split('"KPI4_Description_Container":');
    //                         if(responsesKPI4.size()>1){
    //                         String[] NewDescllistKPI4  = responsesKPI4 [1].split('"type":"container"');
    //                          NewDescKPI4  = '"KPI4_Description_Container":' +NewDescllistKPI4[0]+'"type": "container" },';
    //                         }
                             
    //                         String[] objresponsesKPI4  = NewWrap.split('"KPI4_Description_Container":');
    //                         if(objresponsesKPI4.size()>1){
    //                         	objresponsesKPI4 [1] = objresponsesKPI4[1].replace('"type": "container"','"type":"container"');
    //                         	String[] objNewDescllistKPI4  = objresponsesKPI4[1].split('"type":"container"');
    //                         	objNewDescKPI4  = '"KPI4_Description_Container":' +objNewDescllistKPI4[0]+'"type": "container" },';
    //                         }
                            
    //                         String[] responsesKPI5 = responseBody.split('"KPI5_Description_Container":');
    //                         if(responsesKPI5.size()>1){
    //                         String[] NewDescllistKPI5  = responsesKPI5[1].split('"type":"container"');
    //                          NewDescKPI5  = '"KPI5_Description_Container":' +NewDescllistKPI5[0]+'"type": "container" },';
    //                         }
                             
    //                         String[] objresponsesKPI5  = NewWrap.split('"KPI5_Description_Container":');
    //                         if(objresponsesKPI5.size()>1){
    //                         	objresponsesKPI5[1] = objresponsesKPI5[1].replace('"type": "container"','"type":"container"');
    //                         	String[] objNewDescllistKPI5  = objresponsesKPI5[1].split('"type":"container"');
    //                         	objNewDescKPI5  = '"KPI5_Description_Container":' +objNewDescllistKPI5[0]+'"type": "container" },';
    //                         }
                            
    //                         String[] responses2KPI2 = responseBody.split('"KPI2_Header_Container":');
    //                         if(responses2KPI2.size()>1){
    //                         String[] NewDescllist2KPI2 = responses2KPI2[1].split('"type":"container"');
    //                          NewDesc2KPI2 = '"KPI2_Header_Container":' +NewDescllist2KPI2[0]+'"type": "container" },';
    //                         }
                        				
    //                     String[] objresponses2KPI2 = NewWrap.split('"KPI2_Header_Container":');
    //                     if(objresponses2KPI2.size()>1){
    //                     objresponses2KPI2[1] = objresponses2KPI2[1].replace('"type": "container"','"type":"container"');
    //                     String[] objNewDescllist2KPI2 = objresponses2KPI2[1].split('"type":"container"');
    //                      objNewDesc2KPI2 = '"KPI2_Header_Container":' +objNewDescllist2KPI2[0]+'"type": "container" },';
    //                     }
                            
    //                       String[] responses2KPI5 = responseBody.split('"KPI5_Header_Container":');
    //                         if(responses2KPI5.size()>1){
    //                         String[] NewDescllist2KPI5 = responses2KPI5[1].split('"type":"container"');
    //                          NewDesc2KPI5 = '"KPI5_Header_Container":' +NewDescllist2KPI5[0]+'"type": "container" },';
    //                         }
				
    //                     String[] objresponses2KPI5 = NewWrap.split('"KPI5_Header_Container":');
    //                     if(objresponses2KPI5.size()>1){
    //                     objresponses2KPI5[1] = objresponses2KPI5[1].replace('"type": "container"','"type":"container"');
    //                     String[] objNewDescllist2KPI5 = objresponses2KPI5[1].split('"type":"container"');
    //                      objNewDesc2KPI5 = '"KPI5_Header_Container":' +objNewDescllist2KPI5[0]+'"type": "container" },';
    //                     }
                        
    //                     String[] responses3KPI2 = responseBody.split('"KPI2_Chart_Container":');
    //                     if(responses3KPI2.size()>1){
    //                     String[] NewDescllist3KPI2 = responses3KPI2[1].split('"type":"container"');
    //                      NewDesc3KPI2 = '"KPI2_Chart_Container":' +NewDescllist3KPI2[0]+'"type": "container" },';
    //                     }
                                        
    //                     String[] objresponses3KPI2 = NewWrap.split('"KPI2_Chart_Container":');
    //                     if(objresponses3KPI2.size()>1){
    //                     objresponses3KPI2[1] = objresponses3KPI2[1].replace('"type": "container"','"type":"container"');
    //                     String[] objNewDescllist3KPI2 = objresponses3KPI2[1].split('"type":"container"');
    //                      objNewDesc3KPI2 = '"KPI2_Chart_Container":' +objNewDescllist3KPI2[0]+'"type": "container" },';
    //                     }
                        
    //                     String[] responses3KPI5 = responseBody.split('"KPI5_Chart_Container":');
    //                     if(responses3KPI5.size()>1){
    //                     String[] NewDescllist3KPI5 = responses3KPI5[1].split('"type":"container"');
    //                      NewDesc3KPI5 = '"KPI5_Chart_Container":' +NewDescllist3KPI5[0]+'"type": "container" },';
    //                     }
                                        
    //                     String[] objresponses3KPI5 = NewWrap.split('"KPI5_Chart_Container":');
    //                     if(objresponses3KPI5.size()>1){
    //                     objresponses3KPI5[1] = objresponses3KPI5[1].replace('"type": "container"','"type":"container"');
    //                     String[] objNewDescllist3KPI5 = objresponses3KPI5[1].split('"type":"container"');
    //                      objNewDesc3KPI5 = '"KPI5_Chart_Container":' +objNewDescllist3KPI5[0]+'"type": "container" },';
    //                     }
                        
    //                     		 String[] KPIresponses1KPI2 = responseBody.split('"KPI2_KPI_Title_4":');
    //              if(KPIresponses1KPI2.size()>1){
    //             String[] KPINewDescllist1KPI2 = KPIresponses1KPI2[1].split('"type":"text"');
    //              KPINewDesc1KPI2 = '"KPI2_KPI_Title_4":' +KPINewDescllist1KPI2[0]+'"type": "text" },';
    //              }
                
    //             String[] KPIresponses2KPI2 = responseBody.split('"KPI2_KPI_Title_3":');
    //             if(KPIresponses2KPI2.size()>1){
    //             String[] KPINewDescllist2KPI2 = KPIresponses2KPI2[1].split('"type":"text"');
    //              KPINewDesc2KPI2 = '"KPI2_KPI_Title_3":' +KPINewDescllist2KPI2[0]+'"type": "text" },';
    //             }
                
    //             String[] KPIresponses3KPI2 = responseBody.split('"KPI2_KPI_Title_2":');
    //             if(KPIresponses3KPI2.size()>1){
    //             String[] KPINewDescllist3KPI2 = KPIresponses3KPI2[1].split('"type":"text"');
    //              KPINewDesc3KPI2 = '"KPI2_KPI_Title_2":' +KPINewDescllist3KPI2[0]+'"type": "text" },';
    //             }
                
    //             String[] KPIresponses4KPI2 = responseBody.split('"KPI2_KPI_Title_1":');
    //             if(KPIresponses4KPI2.size()>1){
    //             String[] KPINewDescllist4KPI2 = KPIresponses4KPI2[1].split('"type":"text"');
    //              KPINewDesc4KPI2 = '"KPI2_KPI_Title_1":' +KPINewDescllist4KPI2[0]+'"type": "text" },';
    //             }
				
				// if(!Test.isRunningTest()){
				// String[] objKPIresponses1KPI2 = NewWrap.split('"KPI2_KPI_Title_4":');
    //                     if(objKPIresponses1KPI2.size()>1){
    //                     objKPIresponses1KPI2[1] = objKPIresponses1KPI2[1].replace('"type": "text"','"type":"text"');
    //                     String[] objKPINewDescllist1KPI2 = objKPIresponses1KPI2[1].split('"type":"text"');
    //                      objKPINewDesc1KPI2 = '"KPI2_KPI_Title_4":' +objKPINewDescllist1KPI2[0]+'"type": "text" },';
    //                     }
                        
    //                     String[] objKPIresponses2KPI2 = NewWrap.split('"KPI2_KPI_Title_3":');
    //                     if(objKPIresponses2KPI2.size()>1){
    //                     objKPIresponses2KPI2[1] = objKPIresponses2KPI2[1].replace('"type": "text"','"type":"text"');
    //                     String[] objKPINewDescllist2KPI2 = objKPIresponses2KPI2[1].split('"type":"text"');
    //                      objKPINewDesc2KPI2 = '"KPI2_KPI_Title_3":' +objKPINewDescllist2KPI2[0]+'"type": "text" },';
    //                     }
                        
    //                     String[] objKPIresponses3KPI2 = NewWrap.split('"KPI2_KPI_Title_2":');
    //                     if(objKPIresponses3KPI2.size()>1){
    //                     objKPIresponses3KPI2[1] = objKPIresponses3KPI2[1].replace('"type": "text"','"type":"text"');
    //                     String[] objKPINewDescllist3KPI2 = objKPIresponses3KPI2[1].split('"type":"text"');
    //                      objKPINewDesc3KPI2 = '"KPI2_KPI_Title_2":' +objKPINewDescllist3KPI2[0]+'"type": "text" },';
    //                     }
                        
    //                     String[] objKPIresponses4KPI2 = NewWrap.split('"KPI2_KPI_Title_1":');
    //                      if(objKPIresponses4KPI2.size()>1){
    //                     objKPIresponses4KPI2[1] = objKPIresponses4KPI2[1].replace('"type": "text"','"type":"text"');
    //                     String[] objKPINewDescllist4KPI2 = objKPIresponses4KPI2[1].split('"type":"text"');
    //                      objKPINewDesc4KPI2 = '"KPI2_KPI_Title_1":' +objKPINewDescllist4KPI2[0]+'"type": "text" },';
    //                      }
                     
    //                     NewWrap = NewWrap.replace(objKPINewDesc1KPI2,KPINewDesc1KPI2);
    //                     NewWrap = NewWrap.replace(objKPINewDesc2KPI2,KPINewDesc2KPI2);
    //                     NewWrap = NewWrap.replace(objKPINewDesc3KPI2,KPINewDesc3KPI2);
    //                     NewWrap = NewWrap.replace(objKPINewDesc4KPI2,KPINewDesc4KPI2);    
				// }
                         
    //           String[] KPIresponses1KPI4 = responseBody.split('"KPI4_KPI_Title_4":');
    //              if(KPIresponses1KPI4.size()>1){
    //             String[] KPINewDescllist1KPI4 = KPIresponses1KPI4[1].split('"type":"text"');
    //              KPINewDesc1KPI4 = '"KPI4_KPI_Title_4":' +KPINewDescllist1KPI4[0]+'"type": "text" },';
    //              }
                
    //             String[] KPIresponses2KPI4 = responseBody.split('"KPI4_KPI_Title_3":');
    //             if(KPIresponses2KPI4.size()>1){
    //             String[] KPINewDescllist2KPI4 = KPIresponses2KPI4[1].split('"type":"text"');
    //              KPINewDesc2KPI4 = '"KPI4_KPI_Title_3":' +KPINewDescllist2KPI4[0]+'"type": "text" },';
    //             }
                
    //             String[] KPIresponses3KPI4 = responseBody.split('"KPI4_KPI_Title_2":');   
    //             if(KPIresponses3KPI4.size()>1){
    //             String[] KPINewDescllist3KPI4 = KPIresponses3KPI4[1].split('"type":"text"');
    //              KPINewDesc3KPI4 = '"KPI4_KPI_Title_2":' +KPINewDescllist3KPI4[0]+'"type": "text" },';
    //             }
                
    //             String[] KPIresponses4KPI4 = responseBody.split('"KPI4_KPI_Title_1":');
    //             if(KPIresponses4KPI4.size()>1){
    //             String[] KPINewDescllist4KPI4 = KPIresponses4KPI4[1].split('"type":"text"');
    //              KPINewDesc4KPI4 = '"KPI4_KPI_Title_1":' +KPINewDescllist4KPI4[0]+'"type": "text" },';
    //             }
				
				// if(!Test.isRunningTest()){
				// String[] objKPIresponses1KPI4 = NewWrap.split('"KPI4_KPI_Title_4":');
    //                     if(objKPIresponses1KPI4.size()>1){
    //                     objKPIresponses1KPI4[1] = objKPIresponses1KPI4[1].replace('"type": "text"','"type":"text"');
    //                     String[] objKPINewDescllist1KPI4 = objKPIresponses1KPI4[1].split('"type":"text"');
    //                      objKPINewDesc1KPI4 = '"KPI4_KPI_Title_4":' +objKPINewDescllist1KPI4[0]+'"type": "text" },';
    //                     }
                        
    //                     String[] objKPIresponses2KPI4 = NewWrap.split('"KPI4_KPI_Title_3":');
    //                     if(objKPIresponses2KPI4.size()>1){
    //                     objKPIresponses2KPI4[1] = objKPIresponses2KPI4[1].replace('"type": "text"','"type":"text"');
    //                     String[] objKPINewDescllist2KPI4 = objKPIresponses2KPI4[1].split('"type":"text"');
    //                      objKPINewDesc2KPI4 = '"KPI4_KPI_Title_3":' +objKPINewDescllist2KPI4[0]+'"type": "text" },';
    //                     }
                        
    //                     String[] objKPIresponses3KPI4 = NewWrap.split('"KPI4_KPI_Title_2":');
    //                     if(objKPIresponses3KPI4.size()>1){
    //                     objKPIresponses3KPI4[1] = objKPIresponses3KPI4[1].replace('"type": "text"','"type":"text"');
    //                     String[] objKPINewDescllist3KPI4 = objKPIresponses3KPI4[1].split('"type":"text"');
    //                      objKPINewDesc3KPI4 = '"KPI4_KPI_Title_2":' +objKPINewDescllist3KPI4[0]+'"type": "text" },';
    //                     }
                        
    //                     String[] objKPIresponses4KPI4 = NewWrap.split('"KPI4_KPI_Title_1":');
    //                      if(objKPIresponses4KPI4.size()>1){
    //                     objKPIresponses4KPI4[1] = objKPIresponses4KPI4[1].replace('"type": "text"','"type":"text"');
    //                     String[] objKPINewDescllist4KPI4 = objKPIresponses4KPI4[1].split('"type":"text"');
    //                      objKPINewDesc4KPI4 = '"KPI4_KPI_Title_1":' +objKPINewDescllist4KPI4[0]+'"type": "text" },';
    //                      }
                         
    //                      NewWrap = NewWrap.replace(objKPINewDesc1KPI4,KPINewDesc1KPI4);
    //                     NewWrap = NewWrap.replace(objKPINewDesc2KPI4,KPINewDesc2KPI4);
    //                     NewWrap = NewWrap.replace(objKPINewDesc3KPI4,KPINewDesc3KPI4);
    //                     NewWrap = NewWrap.replace(objKPINewDesc4KPI4,KPINewDesc4KPI4);
				// }
                         
    //                       String[] responses2KPI3 = responseBody.split('"KPI3_Header_Container":');
    //                     if(responses2KPI3.size()>1){
    //                     String[] NewDescllist2KPI3 = responses2KPI3[1].split('"type":"container"');
    //                      NewDesc2KPI3 = '"KPI3_Header_Container":' +NewDescllist2KPI3[0]+'"type": "container" },';
    //                     }
				
    //                     String[] objresponses2KPI3 = NewWrap.split('"KPI3_Header_Container":');
    //                     if(objresponses2KPI3.size()>1){
    //                     objresponses2KPI3[1] = objresponses2KPI3[1].replace('"type": "container"','"type":"container"');
    //                     String[] objNewDescllist2KPI3 = objresponses2KPI3[1].split('"type":"container"');
    //                      objNewDesc2KPI3 = '"KPI3_Header_Container":' +objNewDescllist2KPI3[0]+'"type": "container" },';
    //                     }
                        
    //                   String[] KPIresponses1KPI5 = responseBody.split('"KPI5_KPI_Title_4":');
    //                 if(KPIresponses1KPI5.size()>1){
    //                 String[] KPINewDescllist1KPI5 = KPIresponses1KPI5[1].split('"type":"text"');
    //                 KPINewDesc1KPI5 = '"KPI5_KPI_Title_4":' +KPINewDescllist1KPI5[0]+'"type": "text" },';
    //                 }
                    
    //                 String[] KPIresponses2KPI5 = responseBody.split('"KPI5_KPI_Title_3":');
    //                 if(KPIresponses2KPI5.size()>1){
    //                 String[] KPINewDescllist2KPI5 = KPIresponses2KPI5[1].split('"type":"text"');
    //                 KPINewDesc2KPI5 = '"KPI5_KPI_Title_3":' +KPINewDescllist2KPI5[0]+'"type": "text" },';
    //                 }
                    
    //                 String[] KPIresponses3KPI5 = responseBody.split('"KPI5_KPI_Title_2":');   
    //                 if(KPIresponses3KPI5.size()>1){
    //                 String[] KPINewDescllist3KPI5 = KPIresponses3KPI5[1].split('"type":"text"');
    //                 KPINewDesc3KPI5 = '"KPI5_KPI_Title_2":' +KPINewDescllist3KPI5[0]+'"type": "text" },';
    //                 }
                    
    //                 String[] KPIresponses4KPI5 = responseBody.split('"KPI5_KPI_Title_1":');
    //                 if(KPIresponses4KPI5.size()>1){
    //                 String[] KPINewDescllist4KPI5 = KPIresponses4KPI5[1].split('"type":"text"');
    //                 KPINewDesc4KPI5 = '"KPI5_KPI_Title_1":' +KPINewDescllist4KPI5[0]+'"type": "text" },';
    //                 }
                    
    //                 if(!Test.isRunningTest()){
    //                 String[] objKPIresponses1KPI5 = NewWrap.split('"KPI5_KPI_Title_4":');
    //                 	if(objKPIresponses1KPI5.size()>1){
    //                 	objKPIresponses1KPI5[1] = objKPIresponses1KPI5[1].replace('"type": "text"','"type":"text"');
    //                 	String[] objKPINewDescllist1KPI5 = objKPIresponses1KPI5[1].split('"type":"text"');
    //                 	 objKPINewDesc1KPI5 = '"KPI5_KPI_Title_4":' +objKPINewDescllist1KPI5[0]+'"type": "text" },';
    //                 	}
                    	
    //                 	String[] objKPIresponses2KPI5 = NewWrap.split('"KPI5_KPI_Title_3":');
    //                 	if(objKPIresponses2KPI5.size()>1){
    //                 	objKPIresponses2KPI5[1] = objKPIresponses2KPI5[1].replace('"type": "text"','"type":"text"');
    //                 	String[] objKPINewDescllist2KPI5 = objKPIresponses2KPI5[1].split('"type":"text"');
    //                 	 objKPINewDesc2KPI5 = '"KPI5_KPI_Title_3":' +objKPINewDescllist2KPI5[0]+'"type": "text" },';
    //                 	}
                    	
    //                 	String[] objKPIresponses3KPI5 = NewWrap.split('"KPI5_KPI_Title_2":');
    //                 	if(objKPIresponses3KPI5.size()>1){
    //                 	objKPIresponses3KPI5[1] = objKPIresponses3KPI5[1].replace('"type": "text"','"type":"text"');
    //                 	String[] objKPINewDescllist3KPI5 = objKPIresponses3KPI5[1].split('"type":"text"');
    //                 	 objKPINewDesc3KPI5 = '"KPI5_KPI_Title_2":' +objKPINewDescllist3KPI5[0]+'"type": "text" },';
    //                 	}
                    	
    //                 	String[] objKPIresponses4KPI5 = NewWrap.split('"KPI5_KPI_Title_1":');
    //                 	 if(objKPIresponses4KPI5.size()>1){
    //                 	objKPIresponses4KPI5[1] = objKPIresponses4KPI5[1].replace('"type": "text"','"type":"text"');
    //                 	String[] objKPINewDescllist4KPI5 = objKPIresponses4KPI5[1].split('"type":"text"');
    //                 	 objKPINewDesc4KPI5 = '"KPI5_KPI_Title_1":' +objKPINewDescllist4KPI5[0]+'"type": "text" },';
    //                 	 }
    //                 	NewWrap = NewWrap.replace(objKPINewDesc1KPI5,KPINewDesc1KPI5);
    //                 	NewWrap = NewWrap.replace(objKPINewDesc2KPI5,KPINewDesc2KPI5);
    //                 	NewWrap = NewWrap.replace(objKPINewDesc3KPI5,KPINewDesc3KPI5);
    //                 	NewWrap = NewWrap.replace(objKPINewDesc4KPI5,KPINewDesc4KPI5); 
    //                 }
                    	 
    //                 	 String KPINewDesc1KPI11 = ''; 
    //                 String KPINewDesc1KPI12 = '';
    //                 String KPINewDesc1KPI13 = ''; 
    //                 String KPINewDesc1KPI14 = ''; 
    //                 String KPINewDesc1KPI15 = '';  
                    
    //                 String objKPINewDesc4KPI11 = ''; 
    //                 String objKPINewDesc4KPI12 = '';
    //                 String objKPINewDesc4KPI13 = ''; 
    //                 String objKPINewDesc4KPI14 = ''; 
    //                 String objKPINewDesc4KPI15 = ''; 
                    
                    
    //                 String[] KPIresponses1KPI11 = responseBody.split('"KPI1_Additional_Feature_Title_1":');
    //                 if(KPIresponses1KPI11.size()>1){
    //                 String[] KPINewDescllist1KPI11 = KPIresponses1KPI11[1].split('"type":"text"');
    //                 KPINewDesc1KPI11 = '"KPI1_Additional_Feature_Title_1":' +KPINewDescllist1KPI11[0]+'"type": "text" },';
    //                 }
                    
    //                 String[] KPIresponses1KPI12 = responseBody.split('"KPI2_Additional_Feature_Title_1":');
    //                 if(KPIresponses1KPI12.size()>1){
    //                 String[] KPINewDescllist1KPI12 = KPIresponses1KPI12[1].split('"type":"text"');
    //                 KPINewDesc1KPI12 = '"KPI2_Additional_Feature_Title_1":' +KPINewDescllist1KPI12[0]+'"type": "text" },';
    //                 }
                    
    //                 String[] KPIresponses1KPI13 = responseBody.split('"KPI3_Additional_Feature_Title_1":');
    //                 if(KPIresponses1KPI13.size()>1){
    //                 String[] KPINewDescllist1KPI13 = KPIresponses1KPI13[1].split('"type":"text"');
    //                 KPINewDesc1KPI13 = '"KPI3_Additional_Feature_Title_1":' +KPINewDescllist1KPI13[0]+'"type": "text" },';
    //                 }
                    
    //                 String[] KPIresponses1KPI14 = responseBody.split('"KPI4_Additional_Feature_Title_1":');
    //                 if(KPIresponses1KPI14.size()>1){
    //                 String[] KPINewDescllist1KPI14 = KPIresponses1KPI14[1].split('"type":"text"');
    //                 KPINewDesc1KPI14 = '"KPI4_Additional_Feature_Title_1":' +KPINewDescllist1KPI14[0]+'"type": "text" },';
    //                 }
                    
    //                 String[] KPIresponses1KPI15 = responseBody.split('"KPI5_Additional_Feature_Title_1":');
    //                 if(KPIresponses1KPI15.size()>1){
    //                 String[] KPINewDescllist1KPI15 = KPIresponses1KPI15[1].split('"type":"text"');
    //                 KPINewDesc1KPI15 = '"KPI5_Additional_Feature_Title_1":' +KPINewDescllist1KPI15[0]+'"type": "text" },';
    //                 }
                    
    //                 if(!Test.isRunningTest()){
    //                 String[] objKPIresponses4KPI11 = NewWrap.split('"KPI1_Additional_Feature_Title_1":');
    //                 	 if(objKPIresponses4KPI11.size()>1){
    //                 	objKPIresponses4KPI11[1] = objKPIresponses4KPI11[1].replace('"type": "text"','"type":"text"');
    //                 	String[] objKPINewDescllist4KPI11 = objKPIresponses4KPI11[1].split('"type":"text"');
    //                 	 objKPINewDesc4KPI11 = '"KPI1_Additional_Feature_Title_1":' +objKPINewDescllist4KPI11[0]+'"type": "text" },';
    //                 	 }
                    	 
    //                 	 String[] objKPIresponses4KPI12 = NewWrap.split('"KPI2_Additional_Feature_Title_1":');
    //                 	 if(objKPIresponses4KPI12.size()>1){
    //                 	objKPIresponses4KPI12[1] = objKPIresponses4KPI12[1].replace('"type": "text"','"type":"text"');
    //                 	String[] objKPINewDescllist4KPI12 = objKPIresponses4KPI12[1].split('"type":"text"');
    //                 	 objKPINewDesc4KPI12 = '"KPI2_Additional_Feature_Title_1":' +objKPINewDescllist4KPI12[0]+'"type": "text" },';
    //                 	 }
                    	 
    //                 	 String[] objKPIresponses4KPI13 = NewWrap.split('"KPI3_Additional_Feature_Title_1":');
    //                 	 if(objKPIresponses4KPI13.size()>1){
    //                 	objKPIresponses4KPI13[1] = objKPIresponses4KPI13[1].replace('"type": "text"','"type":"text"');
    //                 	String[] objKPINewDescllist4KPI13 = objKPIresponses4KPI13[1].split('"type":"text"');
    //                 	 objKPINewDesc4KPI13 = '"KPI3_Additional_Feature_Title_1":' +objKPINewDescllist4KPI13[0]+'"type": "text" },';
    //                 	 }
                    	 
    //                 	String[] objKPIresponses4KPI14 = NewWrap.split('"KPI4_Additional_Feature_Title_1":');
    //                 	if(objKPIresponses4KPI14.size()>1){
    //                 	objKPIresponses4KPI14[1] = objKPIresponses4KPI14[1].replace('"type": "text"','"type":"text"');
    //                 	String[] objKPINewDescllist4KPI14 = objKPIresponses4KPI14[1].split('"type":"text"');
    //                 	 objKPINewDesc4KPI14 = '"KPI4_Additional_Feature_Title_1":' +objKPINewDescllist4KPI14[0]+'"type": "text" },';
    //                 	 }
                    	 
    //                 	String[] objKPIresponses4KPI15 = NewWrap.split('"KPI5_Additional_Feature_Title_1":');
    //                 	if(objKPIresponses4KPI15.size()>1){
    //                 	objKPIresponses4KPI15[1] = objKPIresponses4KPI15[1].replace('"type": "text"','"type":"text"');
    //                 	String[] objKPINewDescllist4KPI15 = objKPIresponses4KPI15[1].split('"type":"text"');
    //                 	 objKPINewDesc4KPI15 = '"KPI5_Additional_Feature_Title_1":' +objKPINewDescllist4KPI15[0]+'"type": "text" },';
    //                 	 }
                    	 
    //                 	 NewWrap = NewWrap.replace(objKPINewDesc4KPI11,KPINewDesc1KPI11);
    //                 	NewWrap = NewWrap.replace(objKPINewDesc4KPI12,KPINewDesc1KPI12);
    //                 	NewWrap = NewWrap.replace(objKPINewDesc4KPI13,KPINewDesc1KPI13);
    //                 	NewWrap = NewWrap.replace(objKPINewDesc4KPI14,KPINewDesc1KPI14);
    //                 	NewWrap = NewWrap.replace(objKPINewDesc4KPI15,KPINewDesc1KPI15);
                    	 
    //                 }
    //                 	 String KPINewDesc1KPI21 = ''; 
    //                 String KPINewDesc1KPI22 = '';
    //                 String KPINewDesc1KPI23 = ''; 
    //                 String KPINewDesc1KPI24 = ''; 
    //                 String KPINewDesc1KPI25 = '';  
                    
    //                 String objKPINewDesc4KPI21 = ''; 
    //                 String objKPINewDesc4KPI22 = '';
    //                 String objKPINewDesc4KPI23 = ''; 
    //                 String objKPINewDesc4KPI24 = ''; 
    //                 String objKPINewDesc4KPI25 = ''; 
                    
                    
    //                 String[] KPIresponses1KPI21 = responseBody.split('"KPI1_Additional_Feature_Title_2":');
    //                 if(KPIresponses1KPI21.size()>1){
    //                 String[] KPINewDescllist1KPI21 = KPIresponses1KPI21[1].split('"type":"text"');
    //                 KPINewDesc1KPI21 = '"KPI1_Additional_Feature_Title_2":' +KPINewDescllist1KPI21[0]+'"type": "text" },';
    //                 }
                    
    //                 String[] KPIresponses1KPI22 = responseBody.split('"KPI2_Additional_Feature_Title_2":');
    //                 if(KPIresponses1KPI22.size()>1){
    //                 String[] KPINewDescllist1KPI22 = KPIresponses1KPI22[1].split('"type":"text"');
    //                 KPINewDesc1KPI22 = '"KPI2_Additional_Feature_Title_2":' +KPINewDescllist1KPI22[0]+'"type": "text" },';
    //                 }
                    
    //                 String[] KPIresponses1KPI23 = responseBody.split('"KPI3_Additional_Feature_Title_2":');
    //                 if(KPIresponses1KPI23.size()>1){
    //                 String[] KPINewDescllist1KPI23 = KPIresponses1KPI23[1].split('"type":"text"');
    //                 KPINewDesc1KPI23 = '"KPI3_Additional_Feature_Title_2":' +KPINewDescllist1KPI23[0]+'"type": "text" },';
    //                 }
                    
    //                 String[] KPIresponses1KPI24 = responseBody.split('"KPI4_Additional_Feature_Title_2":');
    //                 if(KPIresponses1KPI24.size()>1){
    //                 String[] KPINewDescllist1KPI24 = KPIresponses1KPI24[1].split('"type":"text"');
    //                 KPINewDesc1KPI24 = '"KPI4_Additional_Feature_Title_2":' +KPINewDescllist1KPI24[0]+'"type": "text" },';
    //                 }
                    
    //                 String[] KPIresponses1KPI25 = responseBody.split('"KPI5_Additional_Feature_Title_2":');
    //                 if(KPIresponses1KPI25.size()>1){
    //                 String[] KPINewDescllist1KPI25 = KPIresponses1KPI25[1].split('"type":"text"');
    //                 KPINewDesc1KPI25 = '"KPI5_Additional_Feature_Title_2":' +KPINewDescllist1KPI25[0]+'"type": "text" },';
    //                 }
                    
    //                 String[] objKPIresponses4KPI21 = NewWrap.split('"KPI1_Additional_Feature_Title_2":');
    //                 	 if(objKPIresponses4KPI21.size()>1){
    //                 	objKPIresponses4KPI21[1] = objKPIresponses4KPI21[1].replace('"type": "text"','"type":"text"');
    //                 	String[] objKPINewDescllist4KPI21 = objKPIresponses4KPI21[1].split('"type":"text"');
    //                 	 objKPINewDesc4KPI21 = '"KPI1_Additional_Feature_Title_2":' +objKPINewDescllist4KPI21[0]+'"type": "text" },';
    //                 	 }
                    	 
    //                 	 String[] objKPIresponses4KPI22 = NewWrap.split('"KPI2_Additional_Feature_Title_2":');
    //                 	 if(objKPIresponses4KPI22.size()>1){
    //                 	objKPIresponses4KPI22[1] = objKPIresponses4KPI22[1].replace('"type": "text"','"type":"text"');
    //                 	String[] objKPINewDescllist4KPI22 = objKPIresponses4KPI22[1].split('"type":"text"');
    //                 	 objKPINewDesc4KPI22 = '"KPI2_Additional_Feature_Title_2":' +objKPINewDescllist4KPI22[0]+'"type": "text" },';
    //                 	 }
                    	 
    //                 	 String[] objKPIresponses4KPI23 = NewWrap.split('"KPI3_Additional_Feature_Title_2":');
    //                 	 if(objKPIresponses4KPI23.size()>1){
    //                 	objKPIresponses4KPI23[1] = objKPIresponses4KPI23[1].replace('"type": "text"','"type":"text"');
    //                 	String[] objKPINewDescllist4KPI23 = objKPIresponses4KPI23[1].split('"type":"text"');
    //                 	 objKPINewDesc4KPI23 = '"KPI3_Additional_Feature_Title_2":' +objKPINewDescllist4KPI23[0]+'"type": "text" },';
    //                 	 }
                    	 
    //                 	String[] objKPIresponses4KPI24 = NewWrap.split('"KPI4_Additional_Feature_Title_2":');
    //                 	if(objKPIresponses4KPI24.size()>1){
    //                 	objKPIresponses4KPI24[1] = objKPIresponses4KPI24[1].replace('"type": "text"','"type":"text"');
    //                 	String[] objKPINewDescllist4KPI24 = objKPIresponses4KPI24[1].split('"type":"text"');
    //                 	 objKPINewDesc4KPI24 = '"KPI4_Additional_Feature_Title_2":' +objKPINewDescllist4KPI24[0]+'"type": "text" },';
    //                 	 }
                    	 
    //                 	String[] objKPIresponses4KPI25 = NewWrap.split('"KPI5_Additional_Feature_Title_2":');
    //                 	if(objKPIresponses4KPI25.size()>1){
    //                 	objKPIresponses4KPI25[1] = objKPIresponses4KPI25[1].replace('"type": "text"','"type":"text"');
    //                 	String[] objKPINewDescllist4KPI25 = objKPIresponses4KPI25[1].split('"type":"text"');
    //                 	 objKPINewDesc4KPI25 = '"KPI5_Additional_Feature_Title_2":' +objKPINewDescllist4KPI25[0]+'"type": "text" },';
    //                 	 }
                    	 
    //                 	NewWrap = NewWrap.replace(objKPINewDesc4KPI21,KPINewDesc1KPI21);
    //                 	NewWrap = NewWrap.replace(objKPINewDesc4KPI22,KPINewDesc1KPI22);
    //                 	NewWrap = NewWrap.replace(objKPINewDesc4KPI23,KPINewDesc1KPI23);
    //                 	NewWrap = NewWrap.replace(objKPINewDesc4KPI24,KPINewDesc1KPI24);
    //                 	NewWrap = NewWrap.replace(objKPINewDesc4KPI25,KPINewDesc1KPI25);

    //                     NewWrap = NewWrap.replace(objNewDesc3KPI5,NewDesc3KPI5);
    //                     NewWrap = NewWrap.replace(objNewDesc3KPI2,NewDesc3KPI2);
    //                     NewWrap = NewWrap.replace(objNewDesc2KPI2,NewDesc2KPI2);
    //                     NewWrap = NewWrap.replace(objNewDesc2KPI5,NewDesc2KPI5);
    //                     NewWrap = NewWrap.replace(objNewDesc,NewDesc);
    //                     NewWrap = NewWrap.replace(objNewDescKPI4,NewDescKPI4);
    //                     NewWrap = NewWrap.replace(objNewDescKPI5,NewDescKPI5);
    //                     NewWrap = NewWrap.replace(FilobjKPINewDesc1,FilNewDesc1);
    //                     NewWrap = NewWrap.replace(FilobjKPINewDesc2,FilNewDesc2);
    //                     NewWrap = NewWrap.replace(objKPINewDesc1,KPINewDesc1);
    //                     NewWrap = NewWrap.replace(objKPINewDesc1,KPINewDesc1);
    //                     NewWrap = NewWrap.replace(objKPINewDesc2,KPINewDesc2);
    //                     NewWrap = NewWrap.replace(objKPINewDesc3,KPINewDesc3);
    //                     NewWrap = NewWrap.replace(objKPINewDesc4,KPINewDesc4);
    //                      NewWrap = NewWrap.replace(objNewDesc2KPI3,NewDesc2KPI3);
    //                      NewWrap  = Newwrap.replace('&quot;','\\"');
    //                      NewWrap = NewWrap.replace('"type":"text"','"type": "text"');
    //                      if(!Test.isRunningTest()){
    //                       Slds.Sales_Insight_String4__c = Newwrap;
    //                       Sales.id = Slds.Id;
    //                       Sales.Sales_Insight_String4__c = Slds.Sales_Insight_String4__c; 
    //                      }
                       
    //                 }
    //             }
    //         return Sales;
    //     }
    //     return null;
    // }
    
    // public Sales_Insight__c NewDashboardSingle4(String Allval){
    //       System.debug('Allval *********** ' + Allval);  
         
    //      list<Sales_Insight__c> NewSaleslist = [select id,Name,Dashboard_Id__c,Dashboard_Type__c,DataSet_Delete__c,Sales_insight_String5__c,Delete_All_Group__c,Delete_All_Orders__c,Sales_KPI_Delete__c,Number_Delete1__c,ListSelector__c,Lis_Selector36__c,Sales_insight_Day_Delete__c,Sales_Insight_String2__c,Sales_Insight_String3__c,Grouping_label_Delete__c,Grouping_Delete__c,Measures_Delete__c,Sales_Insight_String4__c,List_Selector53__c,Sales_insight_String1__c from Sales_Insight__c where  id =: Allval limit 1];
    //     String Str = userInfo.getSessionId();
    //       Sales_Insight__c Sales = new Sales_Insight__c();
    //     if(NewSaleslist.size() > 0){
    //         for(Sales_Insight__c slds : NewSaleslist){
    //             HttpResponse hRes = SingleKPI_DashboardService.retriveDashboardFile(slds.Name, Str);
    //             String responseBody;
                
    //             if(!Test.isRunningTest()){
    //                 responseBody= hRes.getBody();
    //             }
    //             else{
    //               responseBody= NewSaleslist[0].DataSet_Delete__c +NewSaleslist[0].Sales_Insight_String5__c + NewSaleslist[0].Sales_insight_String2__c + NewSaleslist[0].Sales_insight_String3__c +NewSaleslist[0].Grouping_label_Delete__c + NewSaleslist[0].Sales_insight_String4__c + NewSaleslist[0].Grouping_Delete__c ; 
    //             }
    //             System.debug(hRes.getStatus()+ 'responseBody *********** ' + responseBody);
    //             if(hRes.getStatus() == 'OK' || Test.isRunningTest()){    
               
    //              string objKPINewDesc1KPI3 = '';
    //             string KPINewDesc1KPI3 = '';
    //             string objKPINewDesc2KPI3 = '';
    //             string objKPINewDesc3KPI3 = '';
    //             string objKPINewDesc4KPI3 = '';
    //             string objNewDesc2 = '';
               
    //             string objNewDesc2KPI4 = '';
    //             string KPINewDesc2KPI3 = '';
    //             string KPINewDesc3KPI3 = '';
    //             string KPINewDesc4KPI3 = '';
    //             string NewDesc2 = '';
               
    //             string NewDesc2KPI4 = '';
    //              Newwrap='';
    //                 Newwrap = Slds.Grouping_Delete__c.replaceAll('\\s+\\s+','#testcode#').replaceAll('#testcode#',' ');
    //                       String[] responses2 = responseBody.split('"KPI1_Header_Container":');
    //                     if(responses2.size()>1){
    //                     String[] NewDescllist2 = responses2[1].split('"type":"container"');
    //                      NewDesc2 = '"KPI1_Header_Container":' +NewDescllist2[0]+'"type": "container" },';
    //                     }
				
    //                     String[] objresponses2 = NewWrap.split('"KPI1_Header_Container":');
    //                     if(objresponses2.size()>1){
    //                     objresponses2[1] = objresponses2[1].replace('"type": "container"','"type":"container"');
    //                     String[] objNewDescllist2 = objresponses2[1].split('"type":"container"');
    //                      objNewDesc2 = '"KPI1_Header_Container":' +objNewDescllist2[0]+'"type": "container" },';
    //                     }
                        
    //                     //  String[] responses2KPI3 = responseBody.split('"KPI3_Header_Container":');
    //                     // if(responses2KPI3.size()>1){
    //                     // String[] NewDescllist2KPI3 = responses2KPI3[1].split('"type":"container"');
    //                     //  NewDesc2KPI3 = '"KPI3_Header_Container":' +NewDescllist2KPI3[0]+'"type": "container" },';
    //                     // }
				
    //                     // String[] objresponses2KPI3 = NewWrap.split('"KPI3_Header_Container":');
    //                     // if(objresponses2KPI3.size()>1){
    //                     // objresponses2KPI3[1] = objresponses2KPI3[1].replace('"type": "container"','"type":"container"');
    //                     // String[] objNewDescllist2KPI3 = objresponses2KPI3[1].split('"type":"container"');
    //                     //  objNewDesc2KPI3 = '"KPI3_Header_Container":' +objNewDescllist2KPI3[0]+'"type": "container" },';
    //                     // }
						
						
    //                     String[] responses2KPI4 = responseBody.split('"KPI4_Header_Container":');
    //                     if(responses2KPI4.size()>1){
    //                     String[] NewDescllist2KPI4 = responses2KPI4[1].split('"type":"container"');
    //                      NewDesc2KPI4 = '"KPI4_Header_Container":' +NewDescllist2KPI4[0]+'"type": "container" },';
    //                     }
				
    //                     String[] objresponses2KPI4 = NewWrap.split('"KPI4_Header_Container":');
    //                     if(objresponses2KPI4.size()>1){
    //                     objresponses2KPI4[1] = objresponses2KPI4[1].replace('"type": "container"','"type":"container"');
    //                     String[] objNewDescllist2KPI4 = objresponses2KPI4[1].split('"type":"container"');
    //                      objNewDesc2KPI4 = '"KPI4_Header_Container":' +objNewDescllist2KPI4[0]+'"type": "container" },';
    //                     }
                        
    //                     						 String[] KPIresponses1KPI3 = responseBody.split('"KPI3_KPI_Title_4":');
    //              if(KPIresponses1KPI3.size()>1){
    //             String[] KPINewDescllist1KPI3 = KPIresponses1KPI3[1].split('"type":"text"');
    //              KPINewDesc1KPI3 = '"KPI3_KPI_Title_4":' +KPINewDescllist1KPI3[0]+'"type": "text" },';
    //              }
                
    //             String[] KPIresponses2KPI3 = responseBody.split('"KPI3_KPI_Title_3":');
    //             if(KPIresponses2KPI3.size()>1){
    //             String[] KPINewDescllist2KPI3 = KPIresponses2KPI3[1].split('"type":"text"');
    //              KPINewDesc2KPI3 = '"KPI3_KPI_Title_3":' +KPINewDescllist2KPI3[0]+'"type": "text" },';
    //             }
                
    //             String[] KPIresponses3KPI3 = responseBody.split('"KPI3_KPI_Title_2":');
    //             if(KPIresponses3KPI3.size()>1){
    //             String[] KPINewDescllist3KPI3 = KPIresponses3KPI3[1].split('"type":"text"');
    //              KPINewDesc3KPI3 = '"KPI3_KPI_Title_2":' +KPINewDescllist3KPI3[0]+'"type": "text" },';
    //             }
                
    //             String[] KPIresponses4KPI3 = responseBody.split('"KPI3_KPI_Title_1":');
    //             if(KPIresponses4KPI3.size()>1){
    //             String[] KPINewDescllist4KPI3 = KPIresponses4KPI3[1].split('"type":"text"');
    //              KPINewDesc4KPI3 = '"KPI3_KPI_Title_1":' +KPINewDescllist4KPI3[0]+'"type": "text" },';
    //             }
				
				
				// String[] objKPIresponses1KPI3 = NewWrap.split('"KPI3_KPI_Title_4":');
    //                     if(objKPIresponses1KPI3.size()>1){
    //                     objKPIresponses1KPI3[1] = objKPIresponses1KPI3[1].replace('"type": "text"','"type":"text"');
    //                     String[] objKPINewDescllist1KPI3 = objKPIresponses1KPI3[1].split('"type":"text"');
    //                      objKPINewDesc1KPI3 = '"KPI3_KPI_Title_4":' +objKPINewDescllist1KPI3[0]+'"type": "text" },';
    //                     }
                        
    //                     String[] objKPIresponses2KPI3 = NewWrap.split('"KPI3_KPI_Title_3":');
    //                     if(objKPIresponses2KPI3.size()>1){
    //                     objKPIresponses2KPI3[1] = objKPIresponses2KPI3[1].replace('"type": "text"','"type":"text"');
    //                     String[] objKPINewDescllist2KPI3 = objKPIresponses2KPI3[1].split('"type":"text"');
    //                      objKPINewDesc2KPI3 = '"KPI3_KPI_Title_3":' +objKPINewDescllist2KPI3[0]+'"type": "text" },';
    //                     }
                        
    //                     String[] objKPIresponses3KPI3 = NewWrap.split('"KPI3_KPI_Title_2":');
    //                     if(objKPIresponses3KPI3.size()>1){
    //                     objKPIresponses3KPI3[1] = objKPIresponses3KPI3[1].replace('"type": "text"','"type":"text"');
    //                     String[] objKPINewDescllist3KPI3 = objKPIresponses3KPI3[1].split('"type":"text"');
    //                      objKPINewDesc3KPI3 = '"KPI3_KPI_Title_2":' +objKPINewDescllist3KPI3[0]+'"type": "text" },';
    //                     }
                        
    //                     String[] objKPIresponses4KPI3 = NewWrap.split('"KPI3_KPI_Title_1":');
    //                      if(objKPIresponses4KPI3.size()>1){
    //                     objKPIresponses4KPI3[1] = objKPIresponses4KPI3[1].replace('"type": "text"','"type":"text"');
    //                     String[] objKPINewDescllist4KPI3 = objKPIresponses4KPI3[1].split('"type":"text"');
    //                      objKPINewDesc4KPI3 = '"KPI3_KPI_Title_1":' +objKPINewDescllist4KPI3[0]+'"type": "text" },';
    //                      }
                         
    //                      NewWrap = NewWrap.replace(objKPINewDesc1KPI3,KPINewDesc1KPI3);
    //                     NewWrap = NewWrap.replace(objKPINewDesc2KPI3,KPINewDesc2KPI3);
    //                     NewWrap = NewWrap.replace(objKPINewDesc3KPI3,KPINewDesc3KPI3);
    //                     NewWrap = NewWrap.replace(objKPINewDesc4KPI3,KPINewDesc4KPI3);
    //                      NewWrap = NewWrap.replace(objNewDesc2,NewDesc2);
                       
    //                     NewWrap = NewWrap.replace(objNewDesc2KPI4,NewDesc2KPI4);
    //                      NewWrap  = Newwrap.replace('&quot;','\\"');
    //                      NewWrap = NewWrap.replace('"type":"text"','"type": "text"');
    //                      if(!Test.isRunningTest()){
    //                      Slds.Grouping_Delete__c = Newwrap;
    //                             Sales.id = Slds.Id;
    //                         Sales.Grouping_Delete__c = Newwrap.replace('&quot;','\\"');
    //                      }
                       
    //                 }
    //             }
    //         return Sales;
    //     }
    //     return null;
    // }
    
}