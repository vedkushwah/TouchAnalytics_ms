public class Dashboard_Backup_Sales_container_AC {
   // public string  NewWrap;
    // public Sales_Insight__c NewDashboardSingle2(String Allval){
    //       System.debug('Allval *************'+Allval);
         
    //     list<Sales_Insight__c> NewSaleslist = [select id,Name,Dashboard_Id__c,Dashboard_Type__c,Sales_Insight_String1__c,Sales_Insight_String2__c,Sales_Insight_String3__c from Sales_Insight__c where  id =: Allval limit 1];
    //     String Str = userInfo.getSessionId();
    //     Sales_Insight__c Sales = new Sales_Insight__c();
    //       System.debug('NewSaleslist *************'+NewSaleslist.size());
    //     if(NewSaleslist.size() > 0){
    //         for(Sales_Insight__c Newsales : NewSaleslist){
                
    //             HttpResponse hRes = new HttpResponse();
                
    //             //if(!Test.isRunningTest());
    //             hRes = SingleKPI_DashboardService.retriveDashboardFile(Newsales.Name, Str);
                
                
    //             String responseBody;
                
    //             if(!Test.isRunningTest()){
    //                 responseBody= hRes.getBody();
    //             }
    //             else{
    //                 list<Sales_Insight__c> Saleslist = [select id,Name,Sales_Insight_String2__c,Sales_Insight_String3__c,Sales_Insight_String4__c,Sales_insight_String1__c from Sales_Insight__c where Name = 'Theme For NewSalesSight' limit 1];
    //                 responseBody= Saleslist[0].Sales_Insight_String1__c + Saleslist[0].Sales_insight_String2__c + Saleslist[0].Sales_Insight_String3__c;
    //             }
                
    //             if(hRes.getStatus() == 'OK' || Test.isRunningTest()){
    //                  String[] responseBodylist = responseBody.split('"layouts":');
    //             String Res = responseBodylist[0];
    //              String[] Reslst = Res.split('"gridLayouts":');
    //              String Rs = '"gridLayouts": ' + Reslst[1];
    //              Rs = Rs.replace('"name":"49aec73a-4cfc-4256-93d7-98d922372c8a",','');
    //              Rs = Rs.replace('"name":"c0194d25-02cd-47ee-9569-aa3b0b159ad5",','');
    //              Rs = Rs.replace('"name":"62975578-cd05-4a7c-919e-83ab5fd866dd",','');
    //             // Rs = Rs.replace('"name":"03942376-0b77-4993-875d-3521ff42e2a8",','');
    //              Rs = Rs.replace('"label":"Untitled",','');
    //             String Newwrap='';
    //                 //   Newsales.Sales_Insight_String1__c = Rs; 
    //                 //   Newsales.Sales_Insight_String5__c = Rs; 
    //                 //   Newsales.Measures_Delete__c = Rs; 
    //                  NewWrap = Newsales.Sales_Insight_String3__c;
    //                   String NewDBS = '';
    //                     for(integer i=1;i<=50;i++){
    //                         String[] FilKPIresponsesImg = responseBody.split('"image_'+i+'":');
    //                         if(FilKPIresponsesImg.size() > 1 && !NewWrap.contains('"image_'+i+'":')){
    //                             String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"image"');
    //                             if(NewDBS == null || NewDBS == ''){
    //                                 NewDBS = '"image_'+i+'":' +FilKPINewDescllistImg[0]+'"type": "image" },';
    //                             }
    //                             else{
    //                                 NewDBS += '"image_'+i+'":' +FilKPINewDescllistImg[0]+'"type": "image" },'; 
    //                             }
    //                         }
    //                         if(NewWrap.contains('"image_'+i+'":') && FilKPIresponsesImg.size() > 1){
    //                                 String[] objresponsescon = NewWrap.split('"image_'+i+'":');
    //                                 objresponsescon[1] = objresponsescon[1].replace('"type": "image"','"type":"image"');
    //                                 String[] objNewDescllistcon = objresponsescon[1].split('"type":"image"');
    //                                 String objNewDesccon = '"image_'+i+'":' +objNewDescllistcon[0]+'"type": "image" },';
                                   
    //                                 String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"image"');
    //                                 String NewDBScon = '"image_'+i+'":' +FilKPINewDescllistImg[0]+'"type": "image" },';
    //                                 NewWrap = NewWrap.replace(objNewDesccon,NewDBScon);
    //                         }
    //                         if(NewWrap.contains('"image_'+i+'":') && !responseBody.contains('"image_'+i+'":')){
    //                             String[] objresponsescon = NewWrap.split('"image_'+i+'":');
    //                                 objresponsescon[1] = objresponsescon[1].replace('"type": "image"','"type":"image"');
    //                                 String[] objNewDescllistcon = objresponsescon[1].split('"type":"image"');
    //                                 String objNewDesccon = '"image_'+i+'":' +objNewDescllistcon[0]+'"type": "image" },';
    //                                 NewWrap = NewWrap.replace(objNewDesccon,'');
    //                         }
                        
    //                     }
                        
    //                      for(integer i=1;i<=50;i++){
    //                         String[] FilKPIresponsesImg = responseBody.split('"container_'+i+'":');
    //                         if(FilKPIresponsesImg.size() > 1 && !NewWrap.contains('"container_'+i+'":')){
    //                             String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"container"');
    //                             if(NewDBS == null || NewDBS == ''){
    //                                 NewDBS = '"container_'+i+'":' +FilKPINewDescllistImg[0]+'"type": "container" },';
    //                             }
    //                             else{
    //                                 NewDBS += '"container_'+i+'":' +FilKPINewDescllistImg[0]+'"type": "container" },'; 
    //                             }
    //                         }
    //                         if(NewWrap.contains('"container_'+i+'":') && FilKPIresponsesImg.size() > 1){
    //                                 String[] objresponsescon = NewWrap.split('"container_'+i+'":');
    //                                 objresponsescon[1] = objresponsescon[1].replace('"type": "container"','"type":"container"');
    //                                 String[] objNewDescllistcon = objresponsescon[1].split('"type":"container"');
    //                                 String objNewDesccon = '"container_'+i+'":' +objNewDescllistcon[0]+'"type": "container" },';
                                    
                                    
    //                                 String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"container"');
    //                                 String NewDBScon = '"container_'+i+'":' +FilKPINewDescllistImg[0]+'"type": "container" },';
                                    
    //                               NewWrap = NewWrap.replace(objNewDesccon,NewDBScon);
    //                         }
    //                         if(NewWrap.contains('"container_'+i+'":') && !responseBody.contains('"container_'+i+'":')){
    //                             String[] objresponsescon = NewWrap.split('"container_'+i+'":');
    //                                 objresponsescon[1] = objresponsescon[1].replace('"type": "container"','"type":"container"');
    //                                 String[] objNewDescllistcon = objresponsescon[1].split('"type":"container"');
    //                                 String objNewDesccon = '"container_'+i+'":' +objNewDescllistcon[0]+'"type": "container" },';
    //                                 NewWrap = NewWrap.replace(objNewDesccon,'');
    //                         }
                        
    //                     }
    //                     NewWrap = NewWrap.replace('"widgets":{','"widgets": {');
    //                     NewWrap = NewWrap.replace('"widgets": {','"widgets": {'+NewDBS);
    //                     NewSales.Sales_Insight_String3__c = NewWrap;
                        
                        
    //                     Sales.id = NewSales.Id;
    //                     Sales.Sales_Insight_String3__c = NewWrap;
    //                       Sales.Sales_Insight_String1__c = Rs; 
    //                   Sales.Sales_Insight_String5__c = Rs; 
    //                   Sales.Measures_Delete__c = Rs; 
                        
    //                 System.debug('NewSales.Sales_Insight_String3__c *************'+NewSales.Sales_Insight_String3__c);
                         
    //                 }
                    
    //             }
    //         return Sales;
    //     }
    //     return null;
    // }
    
  
}