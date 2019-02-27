global class PostInstallClass implements InstallHandler {
    global void onInstall(InstallContext context) {  
           String singlejson = '{ "description": "CDB", "label": "Winter Release Test New Dashboard", "folder": { "id": "00536000002nLlRAAU" }, "state": { "dataSourceLinks": [],';
           //String snapshotjson = '{"description": "Compare metrics side-by-side, across a single dimension_ Filter both columns of information using the filter sidebar_", "folder": { "id": "#NewFolderId#" }, "label": "Snapshot Trendingtwo", "state": { "dataSourceLinks": [],';
           String MultiJson = '{"label": "New Multi-KPI Dashboard Overview", "folder": { "id": "00l36000000PcfKAAS" }, "state": {';
           // try{

            list<analyticscc__Json_class__c> JsonClass = [select id from analyticscc__Json_class__c where Name='Default MultiKPI Theme'];
            list<analyticscc__Sales_Insight__c> KPIClass = [select id from analyticscc__Sales_Insight__c where Name='Default SingleKPI Theme'];
            list<analyticscc__Sales_Insight__c> SalesInsight = [select id from analyticscc__Sales_Insight__c where Name='Default Sales Insight'];
            list<analyticscc__Sales_Insight__c> SnapshotKPI = [select id from analyticscc__Sales_Insight__c where Name='Default SnapshotKPI Theme'];
            list<analyticscc__Sales_Insight__c> ActTar = [select id from analyticscc__Sales_Insight__c where Name='Default Actual Target Theme'];
            list<analyticscc__Sales_Insight__c> NewSalesInsight = [select id from analyticscc__Sales_Insight__c where Name='New Default Sales Insight'];
            list<analyticscc__Sales_Insight__c> NewSalesInsightTheme = [select id from analyticscc__Sales_Insight__c where Name='Theme For NewSalesSight'];
            //Delete [select id from analyticscc__Remote_Site_Settings__c];
            List<analyticscc__Dashboard_Automation__c> dashAutoList = [select Id,analyticscc__Cardinality_Measure__c,analyticscc__Utilization_Measure__c from analyticscc__Dashboard_Automation__c where analyticscc__Measure_Number__c = 2 limit 1];
            if(dashAutoList.size() > 0){
               if(analyticscc__Dashboard_Automation__c.sObjectType.getDescribe().isDeletable()){
                   delete dashAutoList;
               } 
            }
            //if(dashAutoList.size() <= 0){
                
                    analyticscc__Dashboard_Automation__c dashAuto0 = new analyticscc__Dashboard_Automation__c();
                    if(Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Cardinality_Measure__c.isCreateable() && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Utilization_Measure__c.isCreateable()
                      && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Measure_Number__c.isCreateable()){
                        dashAuto0.analyticscc__Cardinality_Measure__c = 2;
                        dashAuto0.analyticscc__Utilization_Measure__c = 70;
                        dashAuto0.analyticscc__Measure_Number__c = 2;
                        insert dashAuto0;
                      }    
                
                analyticscc__Measure_Requirements__c mesReq0 = new analyticscc__Measure_Requirements__c();
                if(Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Measure_Number__c.isCreateable() && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Value_1__c.isCreateable()
                   && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Value_2__c.isCreateable() && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Value_3__c.isCreateable()
                   && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Value_4__c.isCreateable() && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Value_5__c.isCreateable()
                   && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Dashboard_Automation__c.isCreateable() && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Field_1__c.isCreateable()
                   && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Field_2__c.isCreateable() && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Field_3__c.isCreateable()
                   && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Field_4__c.isCreateable() && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Field_5__c.isCreateable()
                   && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Operator__c.isCreateable()){
                    mesReq0.analyticscc__Measure_Number__c = 1;
                    mesReq0.analyticscc__Value_1__c = '1';
                    mesReq0.analyticscc__Value_2__c = '1';
                    mesReq0.analyticscc__Value_3__c = '1';
                    mesReq0.analyticscc__Value_4__c = '1';
                    mesReq0.analyticscc__Value_5__c = '0';
                    mesReq0.analyticscc__Dashboard_Automation__c = dashAuto0.Id;
                    mesReq0.analyticscc__Field_1__c = 'sum';
                    mesReq0.analyticscc__Field_2__c = 'avg';
                    mesReq0.analyticscc__Field_3__c = 'max';
                    mesReq0.analyticscc__Field_4__c = 'min';
                    mesReq0.analyticscc__Field_5__c = 'count';
                    mesReq0.analyticscc__Operator__c = 'equals to';
                    
                    insert mesReq0;
                  }
                
                analyticscc__Measure_Requirements__c mesReq01 = new analyticscc__Measure_Requirements__c();
                if(Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Measure_Number__c.isCreateable() && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Value_1__c.isCreateable()
                   && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Value_2__c.isCreateable() && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Value_3__c.isCreateable()
                   && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Value_4__c.isCreateable() && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Value_5__c.isCreateable()
                   && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Dashboard_Automation__c.isCreateable() && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Field_1__c.isCreateable()
                   && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Field_2__c.isCreateable() && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Field_3__c.isCreateable()
                   && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Field_4__c.isCreateable() && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Field_5__c.isCreateable()
                   && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Operator__c.isCreateable()){
                    
                    mesReq01.analyticscc__Measure_Number__c = 2;
                    mesReq01.analyticscc__Value_1__c = '1';
                    mesReq01.analyticscc__Value_2__c = '1';
                    mesReq01.analyticscc__Value_3__c = '2';
                    mesReq01.analyticscc__Value_4__c = '2';
                    mesReq01.analyticscc__Value_5__c = '0';
                    mesReq01.analyticscc__Dashboard_Automation__c = dashAuto0.Id;
                    mesReq01.analyticscc__Field_1__c = 'sum';
                    mesReq01.analyticscc__Field_2__c = 'avg';
                    mesReq01.analyticscc__Field_3__c = 'sum';
                    mesReq01.analyticscc__Field_4__c = 'avg';
                    mesReq01.analyticscc__Field_5__c = 'count';
                    mesReq01.analyticscc__Operator__c = 'equals to';
                    insert mesReq01;
                   }
                   
                analyticscc__Measure_Requirements__c mesReq02 = new analyticscc__Measure_Requirements__c();
                if(Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Measure_Number__c.isCreateable() && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Value_1__c.isCreateable()
                   && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Value_2__c.isCreateable() && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Value_3__c.isCreateable()
                   && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Value_4__c.isCreateable() && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Value_5__c.isCreateable()
                   && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Dashboard_Automation__c.isCreateable() && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Field_1__c.isCreateable()
                   && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Field_2__c.isCreateable() && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Field_3__c.isCreateable()
                   && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Field_4__c.isCreateable() && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Field_5__c.isCreateable()
                   && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Operator__c.isCreateable()){
                    
                    mesReq02.analyticscc__Measure_Number__c = 3;
                    mesReq02.analyticscc__Value_1__c = '1';
                    mesReq02.analyticscc__Value_2__c = '2';
                    mesReq02.analyticscc__Value_3__c = '3';
                    mesReq02.analyticscc__Value_4__c = '0';
                    mesReq02.analyticscc__Value_5__c = 'None';
                    mesReq02.analyticscc__Dashboard_Automation__c = dashAuto0.Id;
                    mesReq02.analyticscc__Field_1__c = 'sum';
                    mesReq02.analyticscc__Field_2__c = 'avg';
                    mesReq02.analyticscc__Field_3__c = 'sum';
                    mesReq02.analyticscc__Field_4__c = 'avg';
                    mesReq02.analyticscc__Field_5__c = 'count';
                    mesReq02.analyticscc__Operator__c = 'equals to';
                    insert mesReq02;
                   }    
                
                analyticscc__Measure_Requirements__c mesReq03 = new analyticscc__Measure_Requirements__c();
                if(Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Measure_Number__c.isCreateable() && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Value_1__c.isCreateable()
                   && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Value_2__c.isCreateable() && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Value_3__c.isCreateable()
                   && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Value_4__c.isCreateable() && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Value_5__c.isCreateable()
                   && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Dashboard_Automation__c.isCreateable() && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Field_1__c.isCreateable()
                   && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Field_2__c.isCreateable() && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Field_3__c.isCreateable()
                   && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Field_4__c.isCreateable() && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Field_5__c.isCreateable()
                   && Schema.sObjectType.analyticscc__Measure_Requirements__c.fields.analyticscc__Operator__c.isCreateable()){
                    mesReq03.analyticscc__Measure_Number__c = 4;
                    mesReq03.analyticscc__Value_1__c = '1';
                    mesReq03.analyticscc__Value_2__c = '2';
                    mesReq03.analyticscc__Value_3__c = '3';
                    mesReq03.analyticscc__Value_4__c = '4';
                    mesReq03.analyticscc__Value_5__c = '0';
                    mesReq03.analyticscc__Dashboard_Automation__c = dashAuto0.Id;
                    mesReq03.analyticscc__Field_1__c = 'sum';
                    mesReq03.analyticscc__Field_2__c = 'sum';
                    mesReq03.analyticscc__Field_3__c = 'sum';
                    mesReq03.analyticscc__Field_4__c = 'sum';
                    mesReq03.analyticscc__Field_5__c = 'count';
                    mesReq03.analyticscc__Operator__c = 'greater than equals to';
                    insert mesReq03;
                   }    
                
                analyticscc__Dashboard_Automation__c dashAuto = new analyticscc__Dashboard_Automation__c();
                if(Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Cardinality_Greater_than__c.isCreateable() && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Cardinality_Less_Than__c.isCreateable()
                  && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Utilization__c.isCreateable() && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Max_of_Fields__c.isCreateable()
                  && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Measure_Number__c.isCreateable()){
                    
                    dashAuto.analyticscc__Cardinality_Greater_than__c = 2;
                    dashAuto.analyticscc__Cardinality_Less_Than__c = 6;
                    dashAuto.analyticscc__Utilization__c = 70;
                    dashAuto.analyticscc__Max_of_Fields__c = 2;
                    dashAuto.analyticscc__Measure_Number__c = 1;
                    insert dashAuto;
                  }
                
                analyticscc__Dashboard_Automation__c dashAuto1 = new analyticscc__Dashboard_Automation__c();
                 if(Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Cardinality_Greater_than__c.isCreateable() && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Cardinality_Less_Than__c.isCreateable()
                  && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Utilization__c.isCreateable() && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Max_of_Fields__c.isCreateable()
                  && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Measure_Number__c.isCreateable()){
                    
                    dashAuto1.analyticscc__Cardinality_Greater_than__c = 5;
                    dashAuto1.analyticscc__Cardinality_Less_Than__c = 11;
                    dashAuto1.analyticscc__Utilization__c = 70;
                    dashAuto1.analyticscc__Max_of_Fields__c = 2;
                    dashAuto1.analyticscc__Measure_Number__c = 1;
                    insert dashAuto1;
                  }
                  
                analyticscc__Dashboard_Automation__c dashAuto2 = new analyticscc__Dashboard_Automation__c();
                 if(Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Cardinality_Greater_than__c.isCreateable() && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Cardinality_Less_Than__c.isCreateable()
                  && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Utilization__c.isCreateable() && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Max_of_Fields__c.isCreateable()
                  && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Measure_Number__c.isCreateable()){
                    
                    dashAuto2.analyticscc__Cardinality_Greater_than__c = 10;
                    dashAuto2.analyticscc__Cardinality_Less_Than__c = 25;
                    dashAuto2.analyticscc__Utilization__c = 70;
                    dashAuto2.analyticscc__Max_of_Fields__c = 2;
                    dashAuto2.analyticscc__Measure_Number__c = 1;
                    insert dashAuto2;
                  }
                  
                analyticscc__Dashboard_Automation__c dashAuto3 = new analyticscc__Dashboard_Automation__c();
                 if(Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Cardinality_Greater_than__c.isCreateable() && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Cardinality_Less_Than__c.isCreateable()
                  && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Utilization__c.isCreateable() && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Max_of_Fields__c.isCreateable()
                  && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Measure_Number__c.isCreateable()){
                    
                    dashAuto3.analyticscc__Cardinality_Greater_than__c = 24;
                    dashAuto3.analyticscc__Cardinality_Less_Than__c = 100;
                    dashAuto3.analyticscc__Utilization__c = 70;
                    dashAuto3.analyticscc__Max_of_Fields__c = 2;
                    dashAuto3.analyticscc__Measure_Number__c = 1;
                    insert dashAuto3;
                  }
                  
                
                analyticscc__Dashboard_Automation__c dashAuto4 = new analyticscc__Dashboard_Automation__c();
                 if(Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Cardinality_Greater_than__c.isCreateable() && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Cardinality_Less_Than__c.isCreateable()
                  && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Utilization__c.isCreateable() && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Max_of_Fields__c.isCreateable()
                  && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Measure_Number__c.isCreateable()){
                    
                    dashAuto4.analyticscc__Cardinality_Greater_than__c = 99;
                    dashAuto4.analyticscc__Cardinality_Less_Than__c = 2000;
                    dashAuto4.analyticscc__Utilization__c = 70;
                    dashAuto4.analyticscc__Max_of_Fields__c = 2;
                    dashAuto4.analyticscc__Measure_Number__c = 1;
                    insert dashAuto4;
                  }
                  
                analyticscc__Dashboard_Automation__c dashAuto5 = new analyticscc__Dashboard_Automation__c();
                 if(Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Cardinality_Greater_than__c.isCreateable() && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Cardinality_Less_Than__c.isCreateable()
                  && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Utilization__c.isCreateable() && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Max_of_Fields__c.isCreateable()
                  && Schema.sObjectType.analyticscc__Dashboard_Automation__c.fields.analyticscc__Measure_Number__c.isCreateable()){
                    
                    dashAuto5.analyticscc__Cardinality_Greater_than__c = 1;
                    dashAuto5.analyticscc__Cardinality_Less_Than__c = 999999999;
                    dashAuto5.analyticscc__Utilization__c = 0;
                    dashAuto5.analyticscc__Max_of_Fields__c = 8;
                    dashAuto5.analyticscc__Measure_Number__c = 1;
                    insert dashAuto5;
                  }    
                
            //}
            List<analyticscc__Remote_Site_Settings__c> remoteList = [select id, Name from analyticscc__Remote_Site_Settings__c limit 1];
            if(remoteList.size()> 0){
                //if(analyticscc__Remote_Site_Settings__c.sObjectType.getDescribe().isDeletable()){
                    Delete remoteList;
                //}
                 /*if(Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.Name.isUpdateable() && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.Password__c.isUpdateable()
                  && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.analyticscc__Security_Token__c.isUpdateable() && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.analyticscc__Session_Id__c.isUpdateable()
                   && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.analyticscc__Username__c.isUpdateable() && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.analyticscc__Base_URL__c.isUpdateable()
                   && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.analyticscc__Notification__c.isUpdateable() && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.analyticscc__Time__c.isUpdateable()
                   && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.analyticscc__User_Email__c.isUpdateable() && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.analyticscc__No_of_backups__c.isUpdateable()
                   && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.analyticscc__Key__c.isUpdateable() && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.analyticscc__Schedule_Job__c.isUpdateable()
                   && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.analyticscc__Password__c.isUpdateable() && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.analyticscc__Remote_Settings__c.isUpdateable()){
                        
                        analyticscc__Remote_Site_Settings__c bs = new analyticscc__Remote_Site_Settings__c();
                        bs.Name = remoteList[0].Name;
                        bs.analyticscc__Base_URL__c = remoteList[0].analyticscc__Base_URL__c;
                        bs.analyticscc__Remote_Settings__c = remoteList[0].analyticscc__Remote_Settings__c; 
                        bs.analyticscc__Password__c= remoteList[0].analyticscc__Password__c;
                        bs.analyticscc__Security_Token__c= remoteList[0].analyticscc__Security_Token__c;
                        bs.analyticscc__Session_Id__c= remoteList[0].analyticscc__Session_Id__c;
                        bs.analyticscc__Username__c= remoteList[0].analyticscc__Username__c;
                        bs.analyticscc__Notification__c = remoteList[0].analyticscc__Notification__c;
                        bs.analyticscc__Time__c = remoteList[0].analyticscc__Time__c;
                        bs.analyticscc__User_Email__c = remoteList[0].analyticscc__User_Email__c;
                        bs.analyticscc__Key__c = remoteList[0].analyticscc__Key__c;
                        bs.analyticscc__No_of_backups__c = remoteList[0].analyticscc__No_of_backups__c;
                        bs.analyticscc__Schedule_Job__c = remoteList[0].analyticscc__Schedule_Job__c;
                        
                        update bs;
                
                   }  */
            }
                Integer len = 16;
                Blob blobKey = crypto.generateAesKey(128);
                String key = EncodingUtil.convertToHex(blobKey);
                String autoGeneratedKey = key.substring(0,len);
              // if(remoteList.size() == 0){
                    if(Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.Name.isCreateable() && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.Password__c.isCreateable()
               && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.analyticscc__Security_Token__c.isCreateable() && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.analyticscc__Session_Id__c.isCreateable()
               && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.analyticscc__Username__c.isCreateable() && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.analyticscc__Base_URL__c.isCreateable()
               && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.analyticscc__Notification__c.isCreateable() && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.analyticscc__Time__c.isCreateable()
               && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.analyticscc__User_Email__c.isCreateable() && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.analyticscc__No_of_backups__c.isCreateable()
               && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.analyticscc__Key__c.isCreateable() && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.analyticscc__Schedule_Job__c.isCreateable()
               && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.analyticscc__Password__c.isCreateable() && Schema.sObjectType.analyticscc__Remote_Site_Settings__c.fields.analyticscc__Remote_Settings__c.isCreateable()){
                    
                    analyticscc__Remote_Site_Settings__c bs = new analyticscc__Remote_Site_Settings__c();
                    bs.Name = 'Touch Analytics';
                    bs.analyticscc__Base_URL__c = URL.getSalesforceBaseUrl().toExternalForm();
                    bs.analyticscc__Remote_Settings__c = false; 
                    bs.analyticscc__Password__c= '';
                    bs.analyticscc__Security_Token__c= '';
                    bs.analyticscc__Session_Id__c= '';
                    bs.analyticscc__Username__c= '';
                    bs.analyticscc__Notification__c = false;
                    bs.analyticscc__Time__c = null;
                    bs.analyticscc__User_Email__c = '';
                    bs.analyticscc__Key__c = autoGeneratedKey;
                    bs.analyticscc__No_of_backups__c = null;
                    //bs.analyticscc__Schedule_Job__c = false;
                    
                    
                    List<CronTrigger> ct = [SELECT Id, CronJobDetail.Id, CronJobDetail.Name, CronJobDetail.JobType FROM CronTrigger WHERE CronJobDetail.Name = 'Schedule No of Backups'];
                    if(ct.size() > 0){
                        bs.analyticscc__Schedule_Job__c = true;
                    }else{
                        bs.analyticscc__Schedule_Job__c = false;
                    }    
                    insert bs;
            
               }  
      // }     
            
            
            if(JsonClass.size()> 0){
                if(analyticscc__Json_class__c.sObjectType.getDescribe().isDeletable()){
                   Delete JsonClass; 
                }
            }
            
            if(KPIClass.size()> 0){
                if(analyticscc__Sales_Insight__c.sObjectType.getDescribe().isDeletable()){
                    Delete KPIClass;
                }
            }
            
            if(SalesInsight.size()> 0){
                if(analyticscc__Sales_Insight__c.sObjectType.getDescribe().isDeletable()){
                   Delete SalesInsight; 
                }
            }
            
            if(SnapshotKPI.size()>0){
                if(analyticscc__Sales_Insight__c.sObjectType.getDescribe().isDeletable()){
                    Delete SnapshotKPI;
                }
            }
            
            
            if(ActTar.size()>0){
                if(analyticscc__Sales_Insight__c.sObjectType.getDescribe().isDeletable()){
                    Delete ActTar;
                }
            }
            
            
            if(NewSalesInsight.size()>0){
                if(analyticscc__Sales_Insight__c.sObjectType.getDescribe().isDeletable()){
                    Delete NewSalesInsight;
                }
            }
            
            
            if(NewSalesInsightTheme.size()>0){
                if(analyticscc__Sales_Insight__c.sObjectType.getDescribe().isDeletable()){
                   Delete NewSalesInsightTheme; 
                }
            }
            
            
            string strBody1,strJson22,strJson33,strJson371,strJson381,strJson44,strJson55,strJson66,strJson391,strJson401,strJson411,strJson421,strJson431,strJson701,strJson451,strJson461,strJson471,strJson481,strJson491,strJson501,strJson511,strJson521,strJson531,strJson541,strJson711,strJson561,strJson571,strJson77,strJson581,strJson591,strJson601,strJson611,strJson88,strJson99,strJson621,strJson101,strJson121,strJson131,strJson141,strJson151,strJson161,strJson171,strJson181,strJson191,strJson201,strJson211,strJson231,strJson241,strJson251,strJson261,strJson271,strJson281,strJson291,strJson301,strJson311,strJson631,strJson321,strJson341,strJson351,strJson361,strJson641,strJson651,strJson671,strJson681,strJson691,strJson801,strJson811,strJson821,strJson831,strJson841,strJson851,strJson861,strJson871,strJson981,strJson901,strJson911,strJson921,strJson931,strJson941,strJson1941,strJson2941,strJson3941;
            string strBodySingle1,strBodySingle2;
            Folder fld = [select Id, Name from Folder where name = 'MultiKPI Folder']; 
            List<Document> D = [select id, Name,body from document where FolderId = :fld.Id];
            for(Document doc:D){
            if(doc.Name == 'MultiThemeOne')
            {
            String strBody = EncodingUtil.base64Encode( doc.body );
            strBody1=EncodingUtil.base64Decode(strBody).Tostring();
            }
            if(doc.Name == 'MultiThemeTwo')
            {
            String strJson2 = EncodingUtil.base64Encode( doc.body );
            strJson22=EncodingUtil.base64Decode(strJson2).Tostring();
            }     
            if(doc.Name == 'MultiThemeThree')
            {
             String strJson3 = EncodingUtil.base64Encode( doc.body );
             strJson33=EncodingUtil.base64Decode(strJson3).Tostring();
            }
            if(doc.Name == 'JsonDel')
            {
             String strJson37 = EncodingUtil.base64Encode( doc.body );
             strJson371=EncodingUtil.base64Decode(strJson37).Tostring();
            }
            if(doc.Name == 'JsonLastDataset')
            {
            String strJson38 = EncodingUtil.base64Encode( doc.body );
            strJson381=EncodingUtil.base64Decode(strJson38).Tostring(); 
            }
            if(doc.Name == 'Json4New')
            {
             String strJson4 = EncodingUtil.base64Encode( doc.body );
             strJson44=EncodingUtil.base64Decode(strJson4).Tostring();
            }
            if(doc.Name == 'JsonFilterNew')
            {
             String strJson5 = EncodingUtil.base64Encode( doc.body );
             strJson55=EncodingUtil.base64Decode(strJson5).Tostring();
            }
            if(doc.Name == 'JsonFilterRemoveNew')
            {
              String strJson6 = EncodingUtil.base64Encode( doc.body );
              strJson66=EncodingUtil.base64Decode(strJson6).Tostring();
            }
            if(doc.Name == 'JsonPillbox')
            {
                String strJson39 = EncodingUtil.base64Encode( doc.body );
                strJson391=EncodingUtil.base64Decode(strJson39).Tostring();       
           }
           if(doc.Name == 'JsonPillbox1')
           {
                String strJson40 = EncodingUtil.base64Encode( doc.body );
                strJson401=EncodingUtil.base64Decode(strJson40).Tostring();
           }
           if(doc.Name == 'JsonPillbox2')
           {
             String strJson41 = EncodingUtil.base64Encode( doc.body );
           strJson411=EncodingUtil.base64Decode(strJson41).Tostring();
           }
           if(doc.Name == 'JsonFullpillbox')
           {
             String strJson42 = EncodingUtil.base64Encode( doc.body );
           strJson421=EncodingUtil.base64Decode(strJson42).Tostring();
        
           }
           if(doc.Name == 'JsonPillboxcomma')
           {
               String strJson43 = EncodingUtil.base64Encode( doc.body );
          strJson431=EncodingUtil.base64Decode(strJson43).Tostring();
       
           }
           if(doc.Name == 'JsonStringToggle')
           {
             String strJson70 = EncodingUtil.base64Encode( doc.body );
          strJson701=EncodingUtil.base64Decode(strJson70).Tostring();
        
           }
           if(doc.Name == 'JsonSection1')
           {
              String strJson45 = EncodingUtil.base64Encode( doc.body );
         strJson451=EncodingUtil.base64Decode(strJson45).Tostring();
        
           }
           if(doc.Name == 'JsonDateNew')
           {
              String strJson46 = EncodingUtil.base64Encode( doc.body );
        strJson461=EncodingUtil.base64Decode(strJson46).Tostring();
       
           }
           if(doc.Name == 'JsonFiltersNew')
           {
              String strJson47 = EncodingUtil.base64Encode( doc.body );
         strJson471=EncodingUtil.base64Decode(strJson47).Tostring();

           }
           if(doc.Name == 'JsonMeasure')
           {
               String strJson48 = EncodingUtil.base64Encode( doc.body );
        strJson481=EncodingUtil.base64Decode(strJson48).Tostring();
           }
           if(doc.Name == 'JsonListSelector')
           {
              String strJson49 = EncodingUtil.base64Encode( doc.body );
         strJson491=EncodingUtil.base64Decode(strJson49).Tostring();
        
           }
           if(doc.Name == 'JsonListSelector1')
           {
              String strJson50 = EncodingUtil.base64Encode( doc.body );
        strJson501=EncodingUtil.base64Decode(strJson50).Tostring();
        
           }
           if(doc.Name == 'JsonSelectorDate')
           {
              String strJson51 = EncodingUtil.base64Encode( doc.body );
         strJson511=EncodingUtil.base64Decode(strJson51).Tostring();
        
           }
           if(doc.Name == 'JsonListSelectorDate2')
           {
             String strJson52 = EncodingUtil.base64Encode( doc.body );
         strJson521=EncodingUtil.base64Decode(strJson52).Tostring();
        
           }
           if(doc.Name == 'JsonlistMeasure')
           {
              String strJson53 = EncodingUtil.base64Encode( doc.body );
         strJson531=EncodingUtil.base64Decode(strJson53).Tostring();
        
           }
           if(doc.Name == 'JsonListSelector2')
           {
              String strJson54 = EncodingUtil.base64Encode( doc.body );
         strJson541=EncodingUtil.base64Decode(strJson54).Tostring();
        
           }
           if(doc.Name == 'JsonStaticMeasure')
           {
             String strJson71 = EncodingUtil.base64Encode( doc.body );
            strJson711=EncodingUtil.base64Decode(strJson71).Tostring();
         
           }
           if(doc.Name == 'JsonMeasureList')
           {
             String strJson56 = EncodingUtil.base64Encode( doc.body );
        strJson561=EncodingUtil.base64Decode(strJson56).Tostring();
        
           }
           if(doc.Name == 'JsonSelector3')
           {
              String strJson57 = EncodingUtil.base64Encode( doc.body );
        strJson571=EncodingUtil.base64Decode(strJson57).Tostring();
        
           }
           if(doc.Name == 'JsonKPINew')
           {
             String strJson7 = EncodingUtil.base64Encode( doc.body );
        strJson77=EncodingUtil.base64Decode(strJson7).Tostring();
        
           }
           if(doc.Name == 'JsonNumber')
           {
             String strJson58 = EncodingUtil.base64Encode( doc.body );
         strJson581=EncodingUtil.base64Decode(strJson58).Tostring();
        
           }
           if(doc.Name == 'JsonNumber1')
           {
              String strJson59 = EncodingUtil.base64Encode( doc.body );
        strJson591=EncodingUtil.base64Decode(strJson59).Tostring();
        
           }
           if(doc.Name == 'JsonPillbox5')
           {
              String strJson60 = EncodingUtil.base64Encode( doc.body );
         strJson601=EncodingUtil.base64Decode(strJson60).Tostring();
        
           }
           if(doc.Name == 'JsonSelector38')
           {
              String strJson61 = EncodingUtil.base64Encode( doc.body );
           strJson611=EncodingUtil.base64Decode(strJson61).Tostring();
        
           }
           if(doc.Name == 'JsonKPI1New')
           {
               String strJson8 = EncodingUtil.base64Encode( doc.body );
         strJson88=EncodingUtil.base64Decode(strJson8).Tostring();
        
           }
           if(doc.Name == 'JsonKPI2New')
           {
              String strJson9 = EncodingUtil.base64Encode( doc.body );
        strJson99=EncodingUtil.base64Decode(strJson9).Tostring();
        
           }
           if(doc.Name == 'Filter5deletedNew')
           {
               String strJson62 = EncodingUtil.base64Encode( doc.body );
         strJson621=EncodingUtil.base64Decode(strJson62).Tostring();
        
           }
           if(doc.Name == 'SuccessKPI1New')
           {
              String strJson10 = EncodingUtil.base64Encode( doc.body );
           strJson101=EncodingUtil.base64Decode(strJson10).Tostring();
        
           }
           if(doc.Name == 'SuccessKPI2New')
           {
              String strJson12 = EncodingUtil.base64Encode( doc.body );
         strJson121=EncodingUtil.base64Decode(strJson12).Tostring();
        
           }
          
           if(doc.Name == 'SuccessKPI3New')
           {
               String strJson13 = EncodingUtil.base64Encode( doc.body );
          strJson131=EncodingUtil.base64Decode(strJson13).Tostring();
           }
           if(doc.Name == 'SuccessKPI4New')
           {
               String strJson14 = EncodingUtil.base64Encode( doc.body );
          strJson141=EncodingUtil.base64Decode(strJson14).Tostring();
        
           }

           if(doc.Name == 'SuccessKPI5New')
           {
               String strJson15 = EncodingUtil.base64Encode( doc.body );
         strJson151=EncodingUtil.base64Decode(strJson15).Tostring();
           }
           if(doc.Name == 'MarketFilter1New')
           {
               String strJson16 = EncodingUtil.base64Encode( doc.body );
        strJson161=EncodingUtil.base64Decode(strJson16).Tostring();
        
           }
           if(doc.Name == 'MarketNew')
           {
               String strJson17 = EncodingUtil.base64Encode( doc.body );
         strJson171=EncodingUtil.base64Decode(strJson17).Tostring();
        
           }
           if(doc.Name == 'MarketFilter2New')
           {
              String strJson18 = EncodingUtil.base64Encode( doc.body );
         strJson181=EncodingUtil.base64Decode(strJson18).Tostring();
           }
           if(doc.Name == 'MarketFilter3New')
           {
              String strJson19 = EncodingUtil.base64Encode( doc.body );
         strJson191=EncodingUtil.base64Decode(strJson19).Tostring();
           }
           if(doc.Name == 'MarketFilter4New')
           {
              String strJson20 = EncodingUtil.base64Encode( doc.body );
         strJson201=EncodingUtil.base64Decode(strJson20).Tostring();
        
           }
           if(doc.Name == 'SuccessFilter1New')
           {
              String strJson21 = EncodingUtil.base64Encode( doc.body );
         strJson211=EncodingUtil.base64Decode(strJson21).Tostring();
        
           }
           if(doc.Name == 'SuccessFilter2New')
           {
              String strJson23 = EncodingUtil.base64Encode( doc.body );
         strJson231=EncodingUtil.base64Decode(strJson23).Tostring();
        
           }
           if(doc.Name == 'SuccessFilter3New')
           {
              String strJson24 = EncodingUtil.base64Encode( doc.body );
        strJson241=EncodingUtil.base64Decode(strJson24).Tostring();
        
           }
           if(doc.Name == 'SuccessFilter4New')
           {
              String strJson25 = EncodingUtil.base64Encode( doc.body );
         strJson251=EncodingUtil.base64Decode(strJson25).Tostring();

           }
           if(doc.Name == 'SuccessFilter5New')
           {
              String strJson26 = EncodingUtil.base64Encode( doc.body );
         strJson261=EncodingUtil.base64Decode(strJson26).Tostring();

           }
           if(doc.Name == 'SalesFilter1New')
           {
              String strJson27 = EncodingUtil.base64Encode( doc.body );
         strJson271=EncodingUtil.base64Decode(strJson27).Tostring();

           }
           if(doc.Name == 'SalesFilter2New')
           {
              String strJson28 = EncodingUtil.base64Encode( doc.body );
         strJson281=EncodingUtil.base64Decode(strJson28).Tostring();

           }
           if(doc.Name == 'SalesFilter3New')
           {
               String strJson29 = EncodingUtil.base64Encode( doc.body );
         strJson291=EncodingUtil.base64Decode(strJson29).Tostring();

           }
            if(doc.Name == 'SalesFilter5New')
           {
              String strJson30 = EncodingUtil.base64Encode( doc.body );
         strJson301=EncodingUtil.base64Decode(strJson30).Tostring();
        
           }
            if(doc.Name == 'SalesFilter4New')
           {
              String strJson31 = EncodingUtil.base64Encode( doc.body );
         strJson311=EncodingUtil.base64Decode(strJson31).Tostring(); 
        
           }
            if(doc.Name == 'ListSelector35')
           {
              String strJson63 = EncodingUtil.base64Encode( doc.body );
         strJson631=EncodingUtil.base64Decode(strJson63).Tostring();
        
           }
            if(doc.Name == 'MarketingTimelineNew')
           {
              String strJson32 = EncodingUtil.base64Encode( doc.body );
         strJson321=EncodingUtil.base64Decode(strJson32).Tostring();
        
           }
            if(doc.Name == 'SuccessTimelineNew')
           {
              String strJson34 = EncodingUtil.base64Encode( doc.body );
         strJson341=EncodingUtil.base64Decode(strJson34).Tostring();
           }
            if(doc.Name == 'SalesTimelineNew')
           {
              String strJson35 = EncodingUtil.base64Encode( doc.body );
         strJson351=EncodingUtil.base64Decode(strJson35).Tostring();
        
           }
            if(doc.Name == 'ChartDeleteNew')
           {
              String strJson36 = EncodingUtil.base64Encode( doc.body );
         strJson361=EncodingUtil.base64Decode(strJson36).Tostring();
        
           }
            if(doc.Name == 'ChartDeleteRow')
           {
             String strJson64 = EncodingUtil.base64Encode( doc.body );
         strJson641=EncodingUtil.base64Decode(strJson64).Tostring();
        
           }
            if(doc.Name == 'ChartDeletemarketing')
           {
              String strJson65 = EncodingUtil.base64Encode( doc.body );
         strJson651=EncodingUtil.base64Decode(strJson65).Tostring();
        
           }
            if(doc.Name == 'ChartDeletemarketing1')
           { 
              String strJson67 = EncodingUtil.base64Encode( doc.body );
         strJson671=EncodingUtil.base64Decode(strJson67).Tostring();
        
           }
            if(doc.Name == 'ChartDeleteSuccess')
           {
                String strJson68 = EncodingUtil.base64Encode( doc.body );
         strJson681=EncodingUtil.base64Decode(strJson68).Tostring();
        
           }
            if(doc.Name == 'ChartDeleteSuccess1')
           {
              String strJson69 = EncodingUtil.base64Encode( doc.body );
         strJson691=EncodingUtil.base64Decode(strJson69).Tostring();

           } 
           
            if(doc.Name == 'New_Default_Sales_Insights_String_One')
           {
              String strJson80 = EncodingUtil.base64Encode( doc.body );
         strJson801=EncodingUtil.base64Decode(strJson80).Tostring();

           } 
           
           if(doc.Name == 'New_Default_Sales_Insights_String_Two')
           {
              String strJson81 = EncodingUtil.base64Encode( doc.body );
         strJson811=EncodingUtil.base64Decode(strJson81).Tostring();

           } 
           
           if(doc.Name == 'New_Default_Sales_Insights_String_Three')
           {
              String strJson82 = EncodingUtil.base64Encode( doc.body );
         strJson821=EncodingUtil.base64Decode(strJson82).Tostring();

           } 
        
           if(doc.Name == 'New_Default_Sales_Insights_String_Four')
           {
              String strJson83 = EncodingUtil.base64Encode( doc.body );
         strJson831=EncodingUtil.base64Decode(strJson83).Tostring();

           } 
           
           if(doc.Name == 'New_Default_Sales_Insights_String_Five')
           {
              String strJson84 = EncodingUtil.base64Encode( doc.body );
         strJson841=EncodingUtil.base64Decode(strJson84).Tostring();

           }
           
           if(doc.Name == 'New_Default_Sales_Insights_String_Six')
           {
              String strJson85 = EncodingUtil.base64Encode( doc.body );
         strJson851=EncodingUtil.base64Decode(strJson85).Tostring();

           }
           
           if(doc.Name == 'New_Default_Sales_Insights_String_Seven')
           {
              String strJson86 = EncodingUtil.base64Encode( doc.body );
         strJson861=EncodingUtil.base64Decode(strJson86).Tostring();

           }
           
           if(doc.Name == 'New_Default_Sales_Insights_String_Eight')
           {
              String strJson87 = EncodingUtil.base64Encode( doc.body );
         strJson871=EncodingUtil.base64Decode(strJson87).Tostring();

           }
           
           if(doc.Name == 'New_Default_Sales_Insights_String_Nine')
           {
              String strJson98 = EncodingUtil.base64Encode( doc.body );
         strJson981=EncodingUtil.base64Decode(strJson98).Tostring();

           }
           
           if(doc.Name == 'New_Manage_Themes_One')
           {
              String strJson90 = EncodingUtil.base64Encode( doc.body );
         strJson901=EncodingUtil.base64Decode(strJson90).Tostring();

           }
           
           if(doc.Name == 'New_Manage_Themes_Two')
           {
              String strJson91 = EncodingUtil.base64Encode( doc.body );
         strJson911=EncodingUtil.base64Decode(strJson91).Tostring();

           }
           
           if(doc.Name == 'New_Manage_Themes_Three')
           {
              String strJson92 = EncodingUtil.base64Encode( doc.body );
         strJson921=EncodingUtil.base64Decode(strJson92).Tostring();

           }
           
           if(doc.Name == 'New_Manage_Themes_Four')
           {
              String strJson93 = EncodingUtil.base64Encode( doc.body );
         strJson931=EncodingUtil.base64Decode(strJson93).Tostring();

           }
           
           if(doc.Name == 'New_Manage_Themes_Five')
           {
              String strJson94 = EncodingUtil.base64Encode( doc.body );
         strJson941=EncodingUtil.base64Decode(strJson94).Tostring();

           }
           
           if(doc.Name == 'New_Default_MultiKPI_String_One')
           {
              String strJson1940 = EncodingUtil.base64Encode( doc.body );
         strJson1941=EncodingUtil.base64Decode(strJson1940).Tostring();

           }
           
           if(doc.Name == 'New_Default_MultiKPI_String_Two')
           {
              String strJson2940 = EncodingUtil.base64Encode( doc.body );
         strJson2941=EncodingUtil.base64Decode(strJson2940).Tostring();

           }
           
           if(doc.Name == 'New_Default_MultiKPI_String_Three')
           {
              String strJson3940 = EncodingUtil.base64Encode( doc.body );
         strJson3941=EncodingUtil.base64Decode(strJson3940).Tostring();

           }

        }
        
      //  if(JsonClass.Size() == 0){
        if(Schema.sObjectType.analyticscc__Json_class__c.fields.Name.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json1__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json2__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json3__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_Del__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_Last_Dataset__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json4__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_Filter__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_Filter_Remove__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_Pillbox__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_Pillbox1__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_Pillbox2__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_Full_pillbox__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_Pillbox_comma__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_String_Toggle__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_Section1__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_section2__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_section3__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_Measure__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_ListSelector__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_ListSelector1__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_Selector_Date__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_ListSelector_Date2__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_list_Measure__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_Static_Measure__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_List_Selector2__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_Measure_List__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_Selector3__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_KPI__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_Selector_Date__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_Number1__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_Number__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_Selector38__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_Pillbox5__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_FilterLabel_Delete__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_MeasureLabel_Delete__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_KPI_2__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_KPI_1__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Success_KPI_1__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Filter5_deleted__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Success_KPI_3__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Success_KPI_2__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Success_KPI_5__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Success_KPI_4__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Market_Filter1__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Market__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Market_Filter2__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Market_Filter3__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Market_Filter4__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Success_Filter1__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Success_Filter2__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Success_Filter3__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Success_Filter4__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Success_Filter5__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Sales_Filter1__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Sales_Filter2__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Sales_Filter3__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Sales_Filter5__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Sales_Filter4__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__List_Selector35__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Marketing_Timeline__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Success_Timeline__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Sales_Timeline__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Chart_Delete__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Chart_Delete_Row__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Chart_Delete_marketing__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Chart_Delete_marketing1__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Chart_Delete_Success__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Chart_Delete_Success1__c.isCreateable() && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Json_String__c.isCreateable()
           && Schema.sObjectType.analyticscc__Json_class__c.fields.analyticscc__Dashboard_Type__c.isCreateable()){
        
        analyticscc__Json_class__c jc = new analyticscc__Json_class__c();        
       
         jc.Name = 'Default MultiKPI Theme';
         jc.analyticscc__Json1__c=strBody1;
        jc.analyticscc__Json2__c=strJson1941;
        jc.analyticscc__Json3__c=strJson2941;
        jc.analyticscc__Json_String__c=MultiJson;
        jc.analyticscc__Json_Del__c=strJson371;
        jc.analyticscc__Json_Last_Dataset__c=strJson381;
        jc.analyticscc__Json4__c=strJson44;
        jc.analyticscc__Json_Filter__c=strJson55;
        jc.analyticscc__Json_Filter_Remove__c=strJson66;
        jc.analyticscc__Json_Pillbox__c=strJson391;
        jc.analyticscc__Json_Pillbox1__c=strJson401;
        jc.analyticscc__Json_Pillbox2__c=strJson411;
        jc.analyticscc__Json_Full_pillbox__c=strJson421;
        jc.analyticscc__Json_Pillbox_comma__c=strJson431;
        jc.analyticscc__Json_String_Toggle__c=strJson701;
        jc.analyticscc__Json_Section1__c=strJson451;
        jc.analyticscc__Json_section2__c=strJson461;
        jc.analyticscc__Json_section3__c=strJson471;
        
        jc.analyticscc__Json_Measure__c=strJson481;
        jc.analyticscc__Json_ListSelector__c=strJson491;
        jc.analyticscc__Json_ListSelector1__c=strJson501;
        jc.analyticscc__Json_Selector_Date__c=strJson511;
        jc.analyticscc__Json_ListSelector_Date2__c=strJson521;
        jc.analyticscc__Json_list_Measure__c=strJson531;
        jc.analyticscc__Json_List_Selector2__c=strJson541;
        jc.analyticscc__Json_Static_Measure__c=strJson711;
        jc.analyticscc__Json_Measure_List__c=strJson561;
        jc.analyticscc__Json_Selector3__c=strJson571;
        jc.analyticscc__Json_KPI__c=strJson77;
        //jc.analyticscc__Json_KPI__c='"#KPIS#": {"datasets": [{"name": "#datasetAlias#"}],"isFacet": true,"isGlobal": false,"query": {"query": "{\"pigql\":\"q = load \\\"#datasetAlias#\\\";\\nq = filter q by date{{flatten(column(#StaticTimeline#.selection, [\\\"value\\\"])).asGrouping()}}{{row(Master_Filter_Date.selection, [0], [\\\"min\\\", \\\"max\\\"]).asDateRange(\\\"\\\")}}; \\nq = filter q by {{cell(#StaticFilter#.selection,0, \\\"value\\\").asString()}};\\nq = group q by all;\\nq = foreach q generate {{cell(#StaticMeasure#.selection, 0,\\\"expression\\\").asString()}} as 'count';\\nq = limit q 2000;\",\"measures\":[[\"count\",\"*\",\"count\"]],\"measuresMap\":{},\"groups\":[]}","version": -1},"type": "aggregateflex","useGlobal": true,"visualizationParameters": {"options": {}}},';
        jc.analyticscc__Json_Number__c=strJson581;
        jc.analyticscc__Json_Number1__c=strJson591;
        jc.analyticscc__Json_Pillbox5__c=strJson601;
        jc.analyticscc__Json_Selector38__c=strJson611;
        jc.analyticscc__Json_MeasureLabel_Delete__c='"{\\"display\\":\\"#MeasureLabel#\\",\\"cf\\":\\"#CompactMeasureAPI#\\",\\"expression\\":\\"#ExpressionMeasureAPI#\\",\\"alias\\":\\"#AliasMeasureAPI#\\",\\"timeline_expression\\":\\"sum(sum_value)\\",\\"timeline_alias\\":\\"sum_value\\"}",';
        jc.analyticscc__Json_FilterLabel_Delete__c='"{\\"display\\":\\"#queryFiltersLabel#\\",\\"value\\":\\"#queryFiltersString#\\"}",';
        jc.analyticscc__Json_KPI_1__c=strJson88;
       // jc.analyticscc__Json_KPI_1__c='"Success_KPI_5": {"datasets": [{"name": "#10datasetAlias#"}],"isFacet": true,"isGlobal": false,"query": {"query": "{\"pigql\":\"q = load \\\"#10datasetAlias#\\\";\\nq = filter q by date{{flatten(column(Static_Success_Timeline_5.selection, [\\\"value2\\\"])).asGrouping()}}{{row(Master_Filter_Date.selection, [0], [\\\"min\\\", \\\"max\\\"]).asDateRange(\\\"\\\")}}; \\nq = filter q by {{cell(Static_Success_KPI_5_Filter.selection,0, \\\"value\\\").asString()}};\\nq = group q by all;\\nq = foreach q generate {{cell(Static_Success_Measure_5.selection, 0,\\\"expression\\\").asString()}} as 'count';\\nq = limit q 2000;\",\"measures\":[[\"count\",\"*\",\"count\"]],\"measuresMap\":{},\"groups\":[]}","version": -1},"selectMode": "single","type": "aggregateflex","useGlobal": true,"visualizationParameters": {"options": {}}},';
        jc.analyticscc__Json_KPI_2__c=strJson99;
        jc.analyticscc__Filter5_deleted__c=strJson621;
        //jc.analyticscc__Success_KPI_1__c='"Success_KPI_1": {"datasets": [{"name": "#6datasetAlias#"}],"isFacet": true,"isGlobal": false,"query": {"query": "{\"pigql\":\"q = load \\\"#6datasetAlias#\\\";\\nq = filter q by date{{flatten(column(Static_Success_Timeline_1.selection, [\\\"value\\\"])).asGrouping()}}{{row(Master_Filter_Date.selection, [0], [\\\"min\\\", \\\"max\\\"]).asDateRange(\\\"\\\")}}; \\nq = filter q by {{cell(Static_Success_KPI_1_Filter.selection,0, \\\"value\\\").asString()}};\\nq = group q by all;\\nq = foreach q generate {{cell(Static_Success_Measure_5.selection, 0,\\\"expression\\\").asString()}} as 'count';\\nq = limit q 2000;\",\"measures\":[[\"count\",\"*\",\"count\"]],\"measuresMap\":{},\"groups\":[]}","version": -1},"type": "aggregateflex","useGlobal": true,"visualizationParameters": {"options": {}}},';
        jc.analyticscc__Success_KPI_1__c=strJson101;
        jc.analyticscc__Success_KPI_2__c=strJson121;
        jc.analyticscc__Success_KPI_3__c=strJson131;
        jc.analyticscc__Success_KPI_4__c=strJson141;
        jc.analyticscc__Success_KPI_5__c=strJson151;
        jc.analyticscc__Market_Filter1__c=strJson161;
        jc.analyticscc__Market__c=strJson171;
        jc.analyticscc__Market_Filter2__c=strJson181;
        JC.analyticscc__Market_Filter3__c=strJson191;
        JC.analyticscc__Market_Filter4__c=strJson201;
        JC.analyticscc__Success_Filter1__c=strJson211;
        JC.analyticscc__Success_Filter2__c=strJson231;
        JC.analyticscc__Success_Filter3__c=strJson241;
        JC.analyticscc__Success_Filter4__c=strJson251;
        JC.analyticscc__Success_Filter5__c=strJson261;
        JC.analyticscc__Sales_Filter1__c=strJson271;
        JC.analyticscc__Sales_Filter2__c=strJson281;
        JC.analyticscc__Sales_Filter3__c=strJson291;
        JC.analyticscc__Sales_Filter5__c=strJson301;
        JC.analyticscc__Sales_Filter4__c=strJson311;
        JC.analyticscc__List_Selector35__c=strJson631;
        JC.analyticscc__Marketing_Timeline__c=strJson321;
        JC.analyticscc__Success_Timeline__c=strJson341;
        JC.analyticscc__Sales_Timeline__c=strJson351;
        JC.analyticscc__Chart_Delete__c=strJson3941;
        JC.analyticscc__Chart_Delete_Row__c=strJson641;
        JC.analyticscc__Chart_Delete_marketing__c=strJson651;
        JC.analyticscc__Chart_Delete_marketing1__c=strJson671;
        JC.analyticscc__Chart_Delete_Success__c=strJson681;
        JC.analyticscc__Chart_Delete_Success1__c=strJson691;
        Jc.analyticscc__Dashboard_Type__c='Command';
        insert jc;
    }    
       // }   
        // Sales insight
        
        
        
        
        
        
        
        
        // string stringBody11,stringBody22,stringBody33,stringBody44,stringBody401,stringBody55,stringBody66,stringBody77,stringBody88,stringBody99,stringBody411,stringBody101,stringBody421,stringBody121,stringBody431,stringBody451,stringBody131,stringBody461,stringBody141,stringBody471,stringBody151,stringBody161,stringBody171,stringBody181,stringBody191,stringBody201,stringBody211,stringBody481,stringBody231,stringBody491,stringBody501,stringBody511,stringBody521,stringBody531,stringBody241,stringBody251,stringBody261,stringBody271,stringBody281,stringBody541,stringBody291,stringBody301,stringBody311,stringBody321,stringBody341,stringBody351,stringBody361,stringBody371,stringBody381,stringBody391,stringBody561,stringBody571,stringBody581,stringBody591,stringBody601,stringBody611,stringBody621,stringBody631,stringBody641,stringBody651,stringBody671,stringBody681,stringBody691,stringBody701,stringBody711,stringBody721,stringBody731,stringBody741,stringBody751,stringBody761,stringBody781,stringBody791,stringBody801,stringBody811,stringBody821,stringBody831,stringBody841,stringBody851,stringBody861,stringBody871,stringBody891,stringBody901,stringBody911,stringBody921,stringBody931,stringBody941,stringBody951,stringBody961,stringBody971,stringBody981,stringBody1001,stringBody1011,stringBody1021,stringBody1031,stringBody1041,stringBody1051,stringBody1061,stringBody1071,stringBody1081,stringBody1091,stringBody1101,stringBody1111;
        
        for(Document dc:D){
     /*     if(dc.Name == 'SalesinsightString1New')
          {
             String stringBody1 = EncodingUtil.base64Encode( dc.body );
        stringBody11=EncodingUtil.base64Decode(stringBody1).Tostring();
        
          }
          if(dc.Name == 'SalesInsightString2New')
          {
          String stringBody2 = EncodingUtil.base64Encode( dc.body );
         stringBody22=EncodingUtil.base64Decode(stringBody2).Tostring();
          }
          if(dc.Name == 'SalesInsightString3New')
          {
             String stringBody3 = EncodingUtil.base64Encode( dc.body );
         stringBody33=EncodingUtil.base64Decode(stringBody3).Tostring();
        
          }
          if(dc.Name == 'SalesInsightString4New')
          {
             String stringBody4 = EncodingUtil.base64Encode( dc.body );
         stringBody44=EncodingUtil.base64Decode(stringBody4).Tostring();
        
          }
          
          if(dc.Name == 'DataSetDelete')
          {
            String stringBody40 = EncodingUtil.base64Encode( dc.body );
         stringBody401=EncodingUtil.base64Decode(stringBody40).Tostring(); 
          }
          
           if(dc.Name == 'GroupinglabelDeleteNew')
           {
               String stringBody5 = EncodingUtil.base64Encode( dc.body );
         stringBody55=EncodingUtil.base64Decode(stringBody5).Tostring();
        
           }
           if(dc.Name == 'GroupingDeleteNew')
           {
             String stringBody6 = EncodingUtil.base64Encode( dc.body );
         stringBody66=EncodingUtil.base64Decode(stringBody6).Tostring();
        
           }
           if(dc.Name == 'DatelabelDeleteNew')
           {
             String stringBody7 = EncodingUtil.base64Encode( dc.body );
         stringBody77=EncodingUtil.base64Decode(stringBody7).Tostring();
        
           }
           if(dc.Name == 'SalesinsightDayDeleteNew')
           {
             String stringBody8 = EncodingUtil.base64Encode( dc.body );
         stringBody88=EncodingUtil.base64Decode(stringBody8).Tostring();
        
           }
           if(dc.Name == 'SalesInsightMeasureDeleteNew')
           {
           String stringBody9 = EncodingUtil.base64Encode( dc.body );
         stringBody99=EncodingUtil.base64Decode(stringBody9).Tostring();
        
           }
           if(dc.Name == 'SalesInsightFilterDelete')
           {
             String stringBody41 = EncodingUtil.base64Encode( dc.body );
         stringBody411=EncodingUtil.base64Decode(stringBody41).Tostring();
           }
           if(dc.Name == 'SalesinsightString5New')
           {
           String stringBody10 = EncodingUtil.base64Encode( dc.body );
         stringBody101=EncodingUtil.base64Decode(stringBody10).Tostring();
        
           }
           if(dc.Name == 'GroupingSelectors')
           {
            String stringBody42 = EncodingUtil.base64Encode( dc.body );
           stringBody421=EncodingUtil.base64Decode(stringBody42).Tostring();
           }
           if(dc.Name == 'DatesDeleteNew')
           {
             String stringBody12 = EncodingUtil.base64Encode( dc.body );
         stringBody121=EncodingUtil.base64Decode(stringBody12).Tostring();
        
           }
           if(dc.Name == 'SalesDateDeleteNew')
           {
              String stringBody43 = EncodingUtil.base64Encode( dc.body );
           stringBody431=EncodingUtil.base64Decode(stringBody43).Tostring();
           }
           if(dc.Name == 'DateSelectorNew')
           {
             String stringBody45 = EncodingUtil.base64Encode( dc.body );
           stringBody451=EncodingUtil.base64Decode(stringBody45).Tostring();
           }
           if(dc.Name == 'MeasuresDeleteNew')
           {
             String stringBody13 = EncodingUtil.base64Encode( dc.body );
         stringBody131=EncodingUtil.base64Decode(stringBody13).Tostring();
        
           }
           if(dc.Name == 'MeasureListSelectorNew')
           {
             String stringBody46 = EncodingUtil.base64Encode( dc.body );
           stringBody461=EncodingUtil.base64Decode(stringBody46).Tostring();
           
           }
           if(dc.Name == 'DeleteAllGroupNew')
           {
              String stringBody14 = EncodingUtil.base64Encode( dc.body );
          stringBody141=EncodingUtil.base64Decode(stringBody14).Tostring();
        
           }
           if(dc.Name == 'DeleteListSelectorNew')
           {
            String stringBody47 = EncodingUtil.base64Encode( dc.body );
           stringBody471=EncodingUtil.base64Decode(stringBody47).Tostring();
           }
           if(dc.Name == 'DeleteAllGroup5New')
           {
             String stringBody15 = EncodingUtil.base64Encode( dc.body );
         stringBody151=EncodingUtil.base64Decode(stringBody15).Tostring();
        
           }
           if(dc.Name == 'DeleteAllTimelineNew')
           {
              String stringBody16 = EncodingUtil.base64Encode( dc.body );
         stringBody161=EncodingUtil.base64Decode(stringBody16).Tostring();
        
           }
           if(dc.Name == 'DeleteAllTimeline1New')
           {
              String stringBody17 = EncodingUtil.base64Encode( dc.body );
           stringBody171=EncodingUtil.base64Decode(stringBody17).Tostring();
        
           }
           if(dc.Name == 'DeleteAllTimeline2New')
           {
             String stringBody18 = EncodingUtil.base64Encode( dc.body );
            stringBody181=EncodingUtil.base64Decode(stringBody18).Tostring();
        
           }
           
           if(dc.Name == 'DeleteAllTimeline3New')
           {
               String stringBody19 = EncodingUtil.base64Encode( dc.body );
         stringBody191=EncodingUtil.base64Decode(stringBody19).Tostring();
        
           }
           if(dc.Name == 'DeleteAllTimeline4New')
           {
               String stringBody20 = EncodingUtil.base64Encode( dc.body );
          stringBody201=EncodingUtil.base64Decode(stringBody20).Tostring();
        
           }
           if(dc.Name == 'DeleteAllOrdersNew')
           {
               String stringBody21 = EncodingUtil.base64Encode( dc.body );
         stringBody211=EncodingUtil.base64Decode(stringBody21).Tostring();
        
           }
           if(dc.Name == 'Deletepillbox')
           {
           String stringBody48 = EncodingUtil.base64Encode( dc.body );
            stringBody481=EncodingUtil.base64Decode(stringBody48).Tostring();
           }
           if(dc.Name == 'DeleteAllMeasuresNew')
           {
              String stringBody23 = EncodingUtil.base64Encode( dc.body );
         stringBody231=EncodingUtil.base64Decode(stringBody23).Tostring();
        
           }
           if(dc.Name == 'DeleteAllStaticKPIsNew')
           {
             String stringBody49 = EncodingUtil.base64Encode( dc.body );
         stringBody491=EncodingUtil.base64Decode(stringBody49).Tostring();
        
           }
           if(dc.Name == 'DeleteAllTexts')
           {
             String stringBody50 = EncodingUtil.base64Encode( dc.body );
         stringBody501=EncodingUtil.base64Decode(stringBody50).Tostring();
       
           }
           if(dc.Name == 'DeleteAllDates')
           {
             String stringBody51 = EncodingUtil.base64Encode( dc.body );
         stringBody511=EncodingUtil.base64Decode(stringBody51).Tostring();
       
           }
           if(dc.Name == 'DeleteAlldateselectors')
           {
              String stringBody52 = EncodingUtil.base64Encode( dc.body );
         stringBody521=EncodingUtil.base64Decode(stringBody52).Tostring();
       
           }
           if(dc.Name == 'DeleteAlldateselector1')
           {
              String stringBody53 = EncodingUtil.base64Encode( dc.body );
         stringBody531=EncodingUtil.base64Decode(stringBody53).Tostring();
       
           }
           if(dc.Name == 'SalesKPI1New')
           {
             String stringBody24 = EncodingUtil.base64Encode( dc.body );
         stringBody241=EncodingUtil.base64Decode(stringBody24).Tostring();
        
           }
           if(dc.Name == 'SalesKPI2New')
           {
             String stringBody25 = EncodingUtil.base64Encode( dc.body );
         stringBody251=EncodingUtil.base64Decode(stringBody25).Tostring();
        
           }
           if(dc.Name == 'SalesKPI3New')
           {
             String stringBody26 = EncodingUtil.base64Encode( dc.body );
         stringBody261=EncodingUtil.base64Decode(stringBody26).Tostring();
        
           }
           if(dc.Name == 'SalesKPI4New')
           {
              String stringBody27 = EncodingUtil.base64Encode( dc.body );
           stringBody271=EncodingUtil.base64Decode(stringBody27).Tostring();
        
           }
           if(dc.Name == 'SalesKPI5New')
           {
             String stringBody28 = EncodingUtil.base64Encode( dc.body );
         stringBody281=EncodingUtil.base64Decode(stringBody28).Tostring();
        
           }
           if(dc.Name == 'SalesKPIDelete')
           {
             String stringBody54 = EncodingUtil.base64Encode( dc.body );
         stringBody541=EncodingUtil.base64Decode(stringBody54).Tostring();
        
           }
           if(dc.Name == 'SalesChart1New')
           {
             String stringBody29 = EncodingUtil.base64Encode( dc.body );
         stringBody291=EncodingUtil.base64Decode(stringBody29).Tostring();
        
           }
           if(dc.Name == 'SalesChart2New')
           {
             String stringBody30 = EncodingUtil.base64Encode( dc.body );
           stringBody301=EncodingUtil.base64Decode(stringBody30).Tostring();
        
           }
           if(dc.Name == 'SalesChart3New')
           {
              String stringBody31 = EncodingUtil.base64Encode( dc.body );
          stringBody311=EncodingUtil.base64Decode(stringBody31).Tostring();
        
           }
           if(dc.Name == 'SalesChart4New')
           {
              String stringBody32 = EncodingUtil.base64Encode( dc.body );
         stringBody321=EncodingUtil.base64Decode(stringBody32).Tostring();
        
           }
           if(dc.Name == 'SalesChart5New')
           {
              String stringBody34 = EncodingUtil.base64Encode( dc.body );
         stringBody341=EncodingUtil.base64Decode(stringBody34).Tostring();
        
           }
           if(dc.Name == 'DeleteAllChartNew')
           {
              String stringBody35 = EncodingUtil.base64Encode( dc.body );
        stringBody351=EncodingUtil.base64Decode(stringBody35).Tostring();
        
           }
           if(dc.Name == 'DeleteAllChart1New')
           {
               String stringBody36 = EncodingUtil.base64Encode( dc.body );
          stringBody361=EncodingUtil.base64Decode(stringBody36).Tostring(); 
        
           }
           if(dc.Name == 'DeleteAllChart2New')
           {
              String stringBody37 = EncodingUtil.base64Encode( dc.body );
          stringBody371=EncodingUtil.base64Decode(stringBody37).Tostring(); 
        
           }
           if(dc.Name == 'DeleteAllChart3New')
           {
              String stringBody38 = EncodingUtil.base64Encode( dc.body );
          stringBody381=EncodingUtil.base64Decode(stringBody38).Tostring(); 
        
           }
           if(dc.Name == 'DeleteAllChart4New')
           {
              String stringBody39 = EncodingUtil.base64Encode( dc.body );
          stringBody391=EncodingUtil.base64Decode(stringBody39).Tostring(); 
        
           }
           if(dc.Name == 'ListSelector')
           {
             String stringBody56 = EncodingUtil.base64Encode( dc.body );
          stringBody561=EncodingUtil.base64Decode(stringBody56).Tostring(); 
        
           }
           if(dc.Name == 'Pillbox')
           {
             String stringBody57 = EncodingUtil.base64Encode( dc.body );
          stringBody571=EncodingUtil.base64Decode(stringBody57).Tostring(); 
        
           }
           if(dc.Name == 'DateSelectorDelete')
           {
             String stringBody58 = EncodingUtil.base64Encode( dc.body );
          stringBody581=EncodingUtil.base64Decode(stringBody58).Tostring(); 
        
           }
           if(dc.Name == 'TextDelete')
           {
             String stringBody59 = EncodingUtil.base64Encode( dc.body );
          stringBody591=EncodingUtil.base64Decode(stringBody59).Tostring(); 
        
           }
           if(dc.Name == 'ChartDeleteNew1')
           {
           String stringBody60 = EncodingUtil.base64Encode( dc.body );
          stringBody601=EncodingUtil.base64Decode(stringBody60).Tostring(); 
        
           }
           if(dc.Name == 'ChartDelete1')
           {
           String stringBody61 = EncodingUtil.base64Encode( dc.body );
          stringBody611=EncodingUtil.base64Decode(stringBody61).Tostring(); 
        
           }
           if(dc.Name == 'NumberDelete1')
           {
           String stringBody62 = EncodingUtil.base64Encode( dc.body );
          stringBody621=EncodingUtil.base64Decode(stringBody62).Tostring(); 
        
           }
           if(dc.Name == 'NumberDelete2')
           {
           String stringBody63 = EncodingUtil.base64Encode( dc.body );
          stringBody631=EncodingUtil.base64Decode(stringBody63).Tostring(); 
        
           }
           if(dc.Name == 'Test1')
           {
           String stringBody64 = EncodingUtil.base64Encode( dc.body );
          stringBody641=EncodingUtil.base64Decode(stringBody64).Tostring(); 
        
           }
           if(dc.Name == 'Test2')
           {
           String stringBody65 = EncodingUtil.base64Encode( dc.body );
          stringBody651=EncodingUtil.base64Decode(stringBody65).Tostring(); 
        
           }
           if(dc.Name == 'Test3')
           {
           String stringBody67 = EncodingUtil.base64Encode( dc.body );
          stringBody671=EncodingUtil.base64Decode(stringBody67).Tostring(); 
        
           }
           if(dc.Name == 'Test4')
           {
           String stringBody68 = EncodingUtil.base64Encode( dc.body );
          stringBody681=EncodingUtil.base64Decode(stringBody68).Tostring(); 
        
           }
           if(dc.Name == 'Test5')
           {
           String stringBody69 = EncodingUtil.base64Encode( dc.body );
          stringBody691=EncodingUtil.base64Decode(stringBody69).Tostring(); 
        
           }
           if(dc.Name == 'Test6')
           {
           String stringBody70 = EncodingUtil.base64Encode( dc.body );
          stringBody701=EncodingUtil.base64Decode(stringBody70).Tostring(); 
        
           }
           if(dc.Name == 'Test7')
           {
           String stringBody71 = EncodingUtil.base64Encode( dc.body );
          stringBody711=EncodingUtil.base64Decode(stringBody71).Tostring(); 
        
           }
           if(dc.Name == 'Test8')
           {
             String stringBody72 = EncodingUtil.base64Encode( dc.body );
          stringBody721=EncodingUtil.base64Decode(stringBody72).Tostring(); 
        
           }
           if(dc.Name == 'Test9')
           {
            String stringBody73 = EncodingUtil.base64Encode( dc.body );
          stringBody731=EncodingUtil.base64Decode(stringBody73).Tostring(); 
        
           }
           if(dc.Name == 'Test10')
           {
            String stringBody74 = EncodingUtil.base64Encode( dc.body );
          stringBody741=EncodingUtil.base64Decode(stringBody74).Tostring(); 
        
           }
           if(dc.Name == 'Test11')
           {
            String stringBody75 = EncodingUtil.base64Encode( dc.body );
          stringBody751=EncodingUtil.base64Decode(stringBody75).Tostring(); 
        
           }
           if(dc.Name == 'Test12')
           {
            String stringBody76 = EncodingUtil.base64Encode( dc.body );
          stringBody761=EncodingUtil.base64Decode(stringBody76).Tostring(); 
        
           }
           if(dc.Name == 'Test13')
           {
           String stringBody78 = EncodingUtil.base64Encode( dc.body );
          stringBody781=EncodingUtil.base64Decode(stringBody78).Tostring(); 
        
           }
           if(dc.Name == 'Test14')
           {
            String stringBody79 = EncodingUtil.base64Encode( dc.body );
          stringBody791=EncodingUtil.base64Decode(stringBody79).Tostring(); 
        
           }
           if(dc.Name == 'Test15')
           {
            String stringBody80 = EncodingUtil.base64Encode( dc.body );
          stringBody801=EncodingUtil.base64Decode(stringBody80).Tostring(); 
        
           }
           if(dc.Name == 'Test16')
           {
            String stringBody81 = EncodingUtil.base64Encode( dc.body );
          stringBody811=EncodingUtil.base64Decode(stringBody81).Tostring(); 
        
           }
           if(dc.Name == 'NumberDelete3')
           {
            String stringBody82 = EncodingUtil.base64Encode( dc.body );
          stringBody821=EncodingUtil.base64Decode(stringBody82).Tostring(); 
        
           }
           if(dc.Name == 'NumberDelete4')
           {
           String stringBody83 = EncodingUtil.base64Encode( dc.body );
          stringBody831=EncodingUtil.base64Decode(stringBody83).Tostring(); 
        
           }
           if(dc.Name == 'SalesInsightDelete2')
           {
           String stringBody84 = EncodingUtil.base64Encode( dc.body );
          stringBody841=EncodingUtil.base64Decode(stringBody84).Tostring(); 
        
           }
           if(dc.Name == 'SalesInsightDelete3')
           {
           String stringBody85 = EncodingUtil.base64Encode( dc.body );
          stringBody851=EncodingUtil.base64Decode(stringBody85).Tostring(); 
        
           }
           if(dc.Name == 'ListSelectorNew')
           {
           String stringBody86 = EncodingUtil.base64Encode( dc.body );
          stringBody861=EncodingUtil.base64Decode(stringBody86).Tostring(); 
        
           }
           if(dc.Name == 'LisSelector36')
           {
           String stringBody87 = EncodingUtil.base64Encode( dc.body );
          stringBody871=EncodingUtil.base64Decode(stringBody87).Tostring(); 
        
           }
           if(dc.Name == 'ListSelector6')
           {
           String stringBody89 = EncodingUtil.base64Encode( dc.body );
          stringBody891=EncodingUtil.base64Decode(stringBody89).Tostring(); 
        
           }
           if(dc.Name == 'ChartDelete2')
           {
           String stringBody90 = EncodingUtil.base64Encode( dc.body );
          stringBody901=EncodingUtil.base64Decode(stringBody90).Tostring(); 
        
           }
           if(dc.Name == 'ChartDelete24')
           {
           String stringBody91 = EncodingUtil.base64Encode( dc.body );
          stringBody911=EncodingUtil.base64Decode(stringBody91).Tostring(); 
        
           }
           if(dc.Name == 'ChartDelete14')
           {
           String stringBody92 = EncodingUtil.base64Encode( dc.body );
          stringBody921=EncodingUtil.base64Decode(stringBody92).Tostring(); 
        
           }
           if(dc.Name == 'DeleteListSelector43')
           {
           String stringBody93 = EncodingUtil.base64Encode( dc.body );
          stringBody931=EncodingUtil.base64Decode(stringBody93).Tostring(); 
        
           }
           if(dc.Name == 'ListSelector43')
           {
            String stringBody94 = EncodingUtil.base64Encode( dc.body );
          stringBody941=EncodingUtil.base64Decode(stringBody94).Tostring(); 
        
           }
           if(dc.Name == 'DeleteListSelector53')
           {
            String stringBody95 = EncodingUtil.base64Encode( dc.body );
          stringBody951=EncodingUtil.base64Decode(stringBody95).Tostring(); 
        
           }
           if(dc.Name == 'ListSelector53')
           {
            String stringBody96 = EncodingUtil.base64Encode( dc.body );
          stringBody961=EncodingUtil.base64Decode(stringBody96).Tostring(); 
        
           }
           if(dc.Name == 'ViewResults')
           {
            String stringBody97 = EncodingUtil.base64Encode( dc.body );
          stringBody971=EncodingUtil.base64Decode(stringBody97).Tostring(); 
        
           }
           if(dc.Name == 'ViewResultsText')
           {
            String stringBody98 = EncodingUtil.base64Encode( dc.body );
          stringBody981=EncodingUtil.base64Decode(stringBody98).Tostring(); 
        
           }
           if(dc.Name == 'SalesKPIHeaders')
           {
            String stringBody100 = EncodingUtil.base64Encode( dc.body );
          stringBody1001=EncodingUtil.base64Decode(stringBody100).Tostring(); 
        
           }
           if(dc.Name == 'SalesHeadertext')
           {
            String stringBody111 = EncodingUtil.base64Encode( dc.body );
          stringBody1111=EncodingUtil.base64Decode(stringBody111).Tostring(); 
        
           }
           if(dc.Name == 'Container')
           {
            String stringBody102 = EncodingUtil.base64Encode( dc.body );
          stringBody1021=EncodingUtil.base64Decode(stringBody102).Tostring(); 
        
           }
           if(dc.Name == 'ContainerDelete')
           {
            String stringBody103 = EncodingUtil.base64Encode( dc.body );
          stringBody1031=EncodingUtil.base64Decode(stringBody103).Tostring(); 
        
           }
           if(dc.Name == 'ContainerDelete1')
           {
            String stringBody104 = EncodingUtil.base64Encode( dc.body );
          stringBody1041=EncodingUtil.base64Decode(stringBody104).Tostring(); 
        
           }
           if(dc.Name == 'ContainerDelete2')
           {
            String stringBody105 = EncodingUtil.base64Encode( dc.body );
          stringBody1051=EncodingUtil.base64Decode(stringBody105).Tostring(); 
        
           }
           if(dc.Name == 'Container1')
           {
            String stringBody106 = EncodingUtil.base64Encode( dc.body );
          stringBody1061=EncodingUtil.base64Decode(stringBody106).Tostring(); 
        
           }
           if(dc.Name == 'container2')
           {
            String stringBody107 = EncodingUtil.base64Encode( dc.body );
          stringBody1071=EncodingUtil.base64Decode(stringBody107).Tostring(); 
        
           }
           if(dc.Name == 'Container3')
           {
            String stringBody108 = EncodingUtil.base64Encode( dc.body );
          stringBody1081=EncodingUtil.base64Decode(stringBody108).Tostring(); 
        
           }
           if(dc.Name == 'number33')
           {
            String stringBody109 = EncodingUtil.base64Encode( dc.body );
          stringBody1091=EncodingUtil.base64Decode(stringBody109).Tostring(); 
        
           }
           if(dc.Name == 'Number34')
           {
            String stringBody110 = EncodingUtil.base64Encode( dc.body );
          stringBody1101=EncodingUtil.base64Decode(stringBody110).Tostring(); 
        
           }*/
          
             if(dc.Name == 'SingleStringThemeTwo')
        {
                String stringBody110 = EncodingUtil.base64Encode( dc.body );
                strBodySingle2=EncodingUtil.base64Decode(stringBody110).Tostring();
            }
            if(dc.Name == 'SingleStringThemeOne')
        {
                String stringBody110 = EncodingUtil.base64Encode( dc.body );
                strBodySingle1=EncodingUtil.base64Decode(stringBody110).Tostring();
            }
         
    }
        
        
    
        
         
         string salesstring11,salesstring21,salesstring31;
         
        
         for(Document dc:D){
          if(dc.Name == 'SnapshotNewThemeOne')
          {
             String salesstring1 = EncodingUtil.base64Encode( dc.body );
             salesstring11 =EncodingUtil.base64Decode(salesstring1).Tostring();
        
           }
           if(dc.Name == 'SnapshotNewThemeTwo')
          {
             String salesstring2 = EncodingUtil.base64Encode( dc.body );
             salesstring21 =EncodingUtil.base64Decode(salesstring2).Tostring();
        
           }
           if(dc.Name == 'SnapshotNewThemeThree')
          {
             String salesstring3 = EncodingUtil.base64Encode( dc.body );
             salesstring31 =EncodingUtil.base64Decode(salesstring3).Tostring();
        
           }
          }
          
          
           string ActualtarStringone,ActualtarStringtwo,ActualtarStringthree;
           string newActualtarStringone,NewActualtarStringtwo,NewActualtarStringthree,NewActualtarStringFour;
           
         
         for(Document dc:D){
          
           if(dc.Name == 'New_Actual_Target_Theme_String_One')
          {
             String salesstring3 = EncodingUtil.base64Encode( dc.body );
             newActualtarStringone =EncodingUtil.base64Decode(salesstring3).Tostring();
        
           }
           if(dc.Name == 'New_Actual_Target_Theme_String_Two')
          {
             String salesstring4 = EncodingUtil.base64Encode( dc.body );
             NewActualtarStringtwo =EncodingUtil.base64Decode(salesstring4).Tostring();
        
           }
           if(dc.Name == 'New_Actual_Target_Theme_String_Three')
          {
             String salesstring5 = EncodingUtil.base64Encode( dc.body );
             NewActualtarStringthree =EncodingUtil.base64Decode(salesstring5).Tostring();
        
           }
           
           
           if(dc.Name == 'New_Actual_Target_String_Modified')
          {
             String salesstring2018 = EncodingUtil.base64Encode( dc.body );
             NewActualtarStringFour =EncodingUtil.base64Decode(salesstring2018).Tostring();
        
           }
            
          }
          
          
          
          
          
          
       // }    
         
      //   if(KPIClass.Size() == 0){
        
        analyticscc__Sales_Insight__c as2 = new analyticscc__Sales_Insight__c();
             if(Schema.sObjectType.analyticscc__Sales_Insight__c.fields.Name.isCreateable() && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Sales_insight_String1__c.isCreateable()
               && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Sales_Insight_String2__c.isCreateable() && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Dashboard_Type__c.isCreateable() 
               && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Sales_Insight_String3__c.isCreateable()){
                 as2.Name = 'Default SingleKPI Theme';
                 as2.analyticscc__Sales_insight_String1__c=singlejson;
                 as2.analyticscc__Sales_Insight_String2__c=strBodySingle1;
                 as2.analyticscc__Sales_Insight_String3__c=strBodySingle2;
                 as2.analyticscc__Dashboard_Type__c='Insights';
                 insert as2;
             }
     //    }
     
        
        analyticscc__Sales_Insight__c as3 = new analyticscc__Sales_Insight__c();
            if(Schema.sObjectType.analyticscc__Sales_Insight__c.fields.Name.isCreateable() && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Sales_insight_String1__c.isCreateable()
               && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Sales_Insight_String2__c.isCreateable() && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Dashboard_Type__c.isCreateable() 
               && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Sales_Insight_String3__c.isCreateable()){
                 as3.Name = 'Default SnapshotKPI Theme';
                 as3.analyticscc__Sales_insight_String1__c=salesstring11;
                 as3.analyticscc__Sales_Insight_String2__c=salesstring21;
                 as3.analyticscc__Sales_Insight_String3__c=salesstring31;
                 as3.analyticscc__Dashboard_Type__c='Compare';
                 insert as3;
             }
     
        
        analyticscc__Sales_Insight__c as5 = new analyticscc__Sales_Insight__c();
            if(Schema.sObjectType.analyticscc__Sales_Insight__c.fields.Name.isCreateable() && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Sales_insight_String1__c.isCreateable()
               && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Sales_Insight_String2__c.isCreateable() 
               && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Dashboard_Type__c.isCreateable() 
               && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Sales_Insight_String3__c.isCreateable()){
                 as5.Name = 'Default Actual Target Theme';
                 as5.analyticscc__Sales_insight_String1__c=newActualtarStringone ;
                 as5.analyticscc__Sales_Insight_String2__c=NewActualtarStringtwo;
                 as5.analyticscc__Sales_Insight_String3__c=NewActualtarStringFour;
                 as5.analyticscc__Dashboard_Type__c='Contrast';
                 insert as5;
             }
         
          
        analyticscc__Sales_Insight__c as6 = new analyticscc__Sales_Insight__c();
            if(Schema.sObjectType.analyticscc__Sales_Insight__c.fields.Name.isCreateable() && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Sales_insight_String1__c.isCreateable()
              && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Sales_Insight_String2__c.isCreateable() && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Sales_Insight_String3__c.isCreateable()
              && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Sales_Insight_String4__c.isCreateable() && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Sales_Insight_String5__c.isCreateable()
              && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__DataSet_Delete__c.isCreateable() && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Grouping_label_Delete__c.isCreateable()
              && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Grouping_Delete__c.isCreateable() && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Measures_Delete__c.isCreateable()
              && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Dashboard_Type__c.isCreateable() ){
              
                 as6.Name = 'New Default Sales Insight';
                 as6.analyticscc__Sales_insight_String1__c=strJson801 ;
                 as6.analyticscc__Sales_Insight_String2__c=strJson811;
                 as6.analyticscc__Sales_Insight_String3__c=strJson821;
                 as6.analyticscc__Sales_Insight_String4__c=strJson831;
                 as6.analyticscc__DataSet_Delete__c=strJson841;
                 as6.analyticscc__Grouping_label_Delete__c=strJson851;
                 as6.analyticscc__Grouping_Delete__c=strJson861;
                 as6.analyticscc__Sales_insight_String5__c=strJson871;
                 as6.analyticscc__Measures_Delete__c=strJson981;
                 as6.analyticscc__Dashboard_Type__c='Sales Insights';
                 insert as6;
            }
         
         
        analyticscc__Sales_Insight__c as7 = new analyticscc__Sales_Insight__c();
             if(Schema.sObjectType.analyticscc__Sales_Insight__c.fields.Name.isCreateable() && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Sales_insight_String1__c.isCreateable()
                  && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Sales_Insight_String2__c.isCreateable() && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Sales_Insight_String3__c.isCreateable()
                  && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Sales_Insight_String4__c.isCreateable() && Schema.sObjectType.analyticscc__Sales_Insight__c.fields.analyticscc__Sales_Insight_String5__c.isCreateable()){
                     as7.Name = 'Theme For NewSalesSight';
                     as7.analyticscc__Sales_insight_String1__c=strJson901 ;
                     as7.analyticscc__Sales_Insight_String2__c=strJson911;
                     as7.analyticscc__Sales_Insight_String3__c=strJson921;
                     as7.analyticscc__Sales_Insight_String4__c=strJson931;
                     as7.analyticscc__Sales_insight_String5__c=strJson941;
                     insert as7;
                 }
//             }
//             catch(Exception ex) {
                
//          }
            
        }
     
  }