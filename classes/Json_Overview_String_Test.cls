@isTest
public class Json_Overview_String_Test {

    static testMethod void myUnitTest() {
        
        
        
        Json_class__c jc = new Json_class__c();
        jc.Name='json string'; 
        jc.analyticscc__Json1__c='strBody1';
        jc.analyticscc__Json2__c='strJson22';
        jc.analyticscc__Json3__c='strJson33';
        jc.analyticscc__Json_Del__c='{ "id": "%datsetId%", "name": "%datasetName%" },';
        jc.analyticscc__Json_Last_Dataset__c='{ "id": "%%datsetId%%", "name": "%%datasetName%%" }';
        jc.analyticscc__Json4__c='strJson44';
        jc.analyticscc__Json_Filter__c='strJson55';
        jc.analyticscc__Json_Filter_Remove__c='strJson66';
        jc.analyticscc__Json_Pillbox__c='{"colspan": 1,"column": 3,"name": "pillbox_#pillbox#","row": #RowNumbers#,"rowspan": 1,"widgetStyle": {"borderEdges": []}},';
        jc.analyticscc__Json_Pillbox1__c='{"colspan": 2,"column": 6,"name": "pillbox_#pillbox#","row": #RowNumbers#,"rowspan": 1,"widgetStyle": {"borderEdges": []}},';
        jc.analyticscc__Json_Pillbox2__c='{"colspan": 3,"column": 8,"name": "pillbox_#pillbox#","row": #RowNumbersPill#,"rowspan": 1,"widgetStyle": {"borderEdges": []}},';
        jc.analyticscc__Json_Full_pillbox__c='"pillbox_#pillbox#": {"parameters": {"compact": false,"exploreLink": false,"step": "#RowNumbers#"},"type": "pillbox"},';
        jc.analyticscc__Json_Pillbox_comma__c='{"colspan": #Colspannum#,"column": #colnum#,"name": "pillbox_#pillbox#","row": #RowNumbers#,"rowspan": 1,"widgetStyle": {"borderEdges": []}},';
        jc.analyticscc__Json_String_Toggle__c='"#RowKPISection#": {"datasets": [],"dimensions": [],"isFacet": true,"isGlobal": false,"selectMode": "singlerequired","type": "staticflex","useGlobal": true,"values": ["{\"display\":\"Show\",\"value\":\"#RowNumbers#\"}", "{\"display\":\"Hide\",\"value\":\"#RowNone#\"}"],"visualizationParameters": {"options": {}}},';
        jc.analyticscc__Json_Section1__c='';
        jc.analyticscc__Json_section2__c='"{\"display\": \"#DateLabel#\",\"value\": \"#DateAPI#_Year\",\"value2\": [\"#DateAPI#_Year\",\"#DateAPI#_Month\",\"#DateAPI#_Day\"]}"';
        jc.analyticscc__Json_section3__c='"%SectionNames%": {"datasets": [],"dimensions": [],"isFacet": false,"isGlobal": false,"selectMode": "singlerequired","type": "staticflex","useGlobal": false,"values": ["{\"display\":\"#%RowNumber%queryFiltersLabel1#\",\"value\":\"#%RowNumber%queryFiltersString1#\"}","{\"display\":\"#%RowNumber%queryFiltersLabel2#\",\"value\":\"#%RowNumber%queryFiltersString2#\"}","{\"display\":\"#%RowNumber%queryFiltersLabel3#\",\"value\":\"#%RowNumber%queryFiltersString3#\"}","{\"display\":\"#%RowNumber%queryFiltersLabel4#\",\"value\":\"#%RowNumber%queryFiltersString4#\"}","{\"display\":\"#%RowNumber%queryFiltersLabel5#\",\"value\":\"#%RowNumber%queryFiltersString5#\"}"],"visualizationParameters": {"options": {}}},';
        jc.analyticscc__Json_Measure__c='"#sectionName#": {"datasets": [],"dimensions": [],"isFacet": false,"isGlobal": false,"selectMode": "singlerequired","type": "staticflex","useGlobal": false,"values": ["{\"display\":\"%RowNumber%#DateLabel1#\",\"value\":\"%RowNumber%#DateAPI1#\",\"value\":[\"%RowNumber%#DateAPI1#_Year\",\"%RowNumber%#DateAPI1#_Month\",\"%RowNumber%#DateAPI1#_Day\"]}", "{\"display\":\"%RowNumber%#DateLabel2#\",\"value\":\"%RowNumber%#DateAPI2#\",\"value\":[\"%RowNumber%#DateAPI2#_Year\",\"%RowNumber%#DateAPI2#_Month\",\"%RowNumber%#DateAPI2#_Day\"]}", "{\"display\":\"%RowNumber%#DateLabel3#\",\"value\":\"%RowNumber%#DateAPI3#\",\"value\":[\"%RowNumber%#DateAPI3#_Year\",\"%RowNumber%#DateAPI3#_Month\",\"%RowNumber%#DateAPI3#_Day\"]}"],"visualizationParameters": {"options": {}}},';
        jc.analyticscc__Json_ListSelector__c='{"colspan": #colspanval#,"column": #columnval#,"name": "#Selector#","row": #RowNumber#,"rowspan": 1,"widgetStyle": {"borderEdges": []}},';
        jc.analyticscc__Json_ListSelector1__c='"#Selector#": {"parameters": {"compact": false,"expanded": true,"exploreLink": false,"instant": true,"step": "#Timelines#","title": ""},"type": "listselector"},';
        jc.analyticscc__Json_Selector_Date__c='{"colspan": 2,"column": 2,"name": "#Selector#","row": #RowNumber#,"rowspan": 1,"widgetStyle": {"borderEdges": []}}';
        jc.analyticscc__Json_ListSelector_Date2__c='"#Selector#": {"parameters": {"compact": false,"expanded": true,"exploreLink": false,"instant": true,"step": "#Timelines#","title": ""},"type": "listselector"},';
        jc.analyticscc__Json_list_Measure__c='"#Selector#": {"parameters": {"compact": false,"expanded": true,"exploreLink": false,"instant": true,"step": "#Timelines#","title": ""},"type": "listselector"},';
        jc.analyticscc__Json_List_Selector2__c='{"colspan": 2,"column": 0,"name": "#Selector#","row": #RowNumber#,"rowspan": 1,"widgetStyle": {"borderEdges": []}},';
        jc.analyticscc__Json_Static_Measure__c='{"colspan": 1,"column": 0,"name": "#Selector#","row": #RowNumber#,"rowspan": 1,"widgetStyle": {"borderEdges": []}},';
        jc.analyticscc__Json_Measure_List__c='"#Measurename#": {"datasets": [],"dimensions": [],"isFacet": true,"isGlobal": false,"selectMode": "singlerequired","type": "staticflex","useGlobal": true,"values": ["{\"display\":\"#%RowNumber%MeasureLabel1#\",\"cf\":\"#%RowNumber%CompactMeasureAPI1#\",\"expression\":\"#%RowNumber%ExpressionMeasureAPI1#\",\"alias\":\"#%RowNumber%AliasMeasureAPI1#\",\"timeline_expression\":\"sum(sum_value)\",\"timeline_alias\":\"sum_value\"}","{\"display\":\"#%RowNumber%MeasureLabel2#\",\"cf\":\"#%RowNumber%CompactMeasureAPI2#\",\"expression\":\"#%RowNumber%ExpressionMeasureAPI2#\",\"alias\":\"#%RowNumber%AliasMeasureAPI2#\",\"timeline_expression\":\"sum(sum_value)\",\"timeline_alias\":\"sum_value\"}","{\"display\":\"#%RowNumber%MeasureLabel3#\",\"cf\":\"#%RowNumber%CompactMeasureAPI3#\",\"expression\":\"#%RowNumber%ExpressionMeasureAPI3#\",\"alias\":\"#%RowNumber%AliasMeasureAPI3#\",\"timeline_expression\":\"sum(sum_value)\",\"timeline_alias\":\"sum_value\"}","{\"display\":\"#%RowNumber%MeasureLabel4#\",\"cf\":\"#%RowNumber%CompactMeasureAPI4#\",\"expression\":\"#%RowNumber%ExpressionMeasureAPI4#\",\"alias\":\"#%RowNumber%AliasMeasureAPI4#\",\"timeline_expression\":\"sum(sum_value)\",\"timeline_alias\":\"sum_value\"}","{\"display\":\"#%RowNumber%MeasureLabel5#\",\"cf\":\"#%RowNumber%CompactMeasureAPI5#\",\"expression\":\"#%RowNumber%ExpressionMeasureAPI5#\",\"alias\":\"#%RowNumber%AliasMeasureAPI5#\",\"timeline_expression\":\"sum(sum_value)\",\"timeline_alias\":\"sum_value\"}"],"visualizationParameters": {"options": {}}},';
        jc.analyticscc__Json_Selector3__c='{"colspan": 2,"column": 0,"name": "#Selector#","row": #RowNumber#,"rowspan": 1,"widgetStyle": {"borderEdges": []}},';
        jc.analyticscc__Json_KPI__c='strJson77';
        //jc.analyticscc__Json_KPI__c='"#KPIS#": {"datasets": [{"name": "#datasetAlias#"}],"isFacet": true,"isGlobal": false,"query": {"query": "{\"pigql\":\"q = load \\\"#datasetAlias#\\\";\\nq = filter q by date{{flatten(column(#StaticTimeline#.selection, [\\\"value\\\"])).asGrouping()}}{{row(Master_Filter_Date.selection, [0], [\\\"min\\\", \\\"max\\\"]).asDateRange(\\\"\\\")}}; \\nq = filter q by {{cell(#StaticFilter#.selection,0, \\\"value\\\").asString()}};\\nq = group q by all;\\nq = foreach q generate {{cell(#StaticMeasure#.selection, 0,\\\"expression\\\").asString()}} as 'count';\\nq = limit q 2000;\",\"measures\":[[\"count\",\"*\",\"count\"]],\"measuresMap\":{},\"groups\":[]}","version": -1},"type": "aggregateflex","useGlobal": true,"visualizationParameters": {"options": {}}},';
        jc.analyticscc__Json_Number__c='"#Number#": {"parameters": {"compact": true,"exploreLink": true,"measureField": "count","numberColor": "#335779","numberSize": 24,"step": "#KPIs#","textAlignment": "right","title": "","titleColor": "#335779","titleSize": 16},"type": "number"},';
        jc.analyticscc__Json_Number1__c='{"colspan": #ColSpanNum#,"column": #ColNum#,"name": "#Numbers#","row": #Rows#,"rowspan": 1,"widgetStyle": {"borderEdges": ["all"]}},';
        jc.analyticscc__Json_Pillbox5__c='{"colspan": #Colspannum#,"column": #colnum#,"name": "pillbox_#pillbox#","row": #RowNumbers#,"rowspan": 1,"widgetStyle": {"borderEdges": []}}';
        jc.analyticscc__Json_Selector38__c='{"colspan": 2,"column": 2,"name": "listselector_38","row": 5,"rowspan": 1,"widgetStyle": {"borderEdges": []}}';
        jc.analyticscc__Json_MeasureLabel_Delete__c='"{\"display\":\"#MeasureLabel#\",\"cf\":\"#CompactMeasureAPI#\",\"expression\":\"#ExpressionMeasureAPI#\",\"alias\":\"#AliasMeasureAPI#\",\"timeline_expression\":\"sum(sum_value)\",\"timeline_alias\":\"sum_value\"}",';
        jc.analyticscc__Json_FilterLabel_Delete__c='"{\"display\":\"#queryFiltersLabel#\",\"value\":\"#queryFiltersString#\"}",';
        jc.analyticscc__Json_KPI_1__c='strJson88';
       // jc.analyticscc__Json_KPI_1__c='"Success_KPI_5": {"datasets": [{"name": "#10datasetAlias#"}],"isFacet": true,"isGlobal": false,"query": {"query": "{\"pigql\":\"q = load \\\"#10datasetAlias#\\\";\\nq = filter q by date{{flatten(column(Static_Success_Timeline_5.selection, [\\\"value2\\\"])).asGrouping()}}{{row(Master_Filter_Date.selection, [0], [\\\"min\\\", \\\"max\\\"]).asDateRange(\\\"\\\")}}; \\nq = filter q by {{cell(Static_Success_KPI_5_Filter.selection,0, \\\"value\\\").asString()}};\\nq = group q by all;\\nq = foreach q generate {{cell(Static_Success_Measure_5.selection, 0,\\\"expression\\\").asString()}} as 'count';\\nq = limit q 2000;\",\"measures\":[[\"count\",\"*\",\"count\"]],\"measuresMap\":{},\"groups\":[]}","version": -1},"selectMode": "single","type": "aggregateflex","useGlobal": true,"visualizationParameters": {"options": {}}},';
        jc.analyticscc__Json_KPI_2__c='strJson99';
        jc.analyticscc__Filter5_deleted__c='"Static_Sales__KPI_5_Filter": {"datasets": [],"dimensions": [],"isFacet": false,"isGlobal": false,"selectMode": "singlerequired","type": "staticflex","useGlobal": false,"values": ["{\"display\":\"#5queryFiltersLabel1#\",\"value\":\"#5queryFiltersString1#\"}","{\"display\":\"#5queryFiltersLabel2#\",\"value\":\"#5queryFiltersString2#\"}","{\"display\":\"#5queryFiltersLabel3#\",\"value\":\"#5queryFiltersString3#\"}","{\"display\":\"#5queryFiltersLabel4#\",\"value\":\"#5queryFiltersString4#\"}","{\"display\":\"#5queryFiltersLabel5#\",\"value\":\"#5queryFiltersString5#\"}"],"visualizationParameters": {"options": {}}},';
        //jc.analyticscc__Success_KPI_1__c='"Success_KPI_1": {"datasets": [{"name": "#6datasetAlias#"}],"isFacet": true,"isGlobal": false,"query": {"query": "{\"pigql\":\"q = load \\\"#6datasetAlias#\\\";\\nq = filter q by date{{flatten(column(Static_Success_Timeline_1.selection, [\\\"value\\\"])).asGrouping()}}{{row(Master_Filter_Date.selection, [0], [\\\"min\\\", \\\"max\\\"]).asDateRange(\\\"\\\")}}; \\nq = filter q by {{cell(Static_Success_KPI_1_Filter.selection,0, \\\"value\\\").asString()}};\\nq = group q by all;\\nq = foreach q generate {{cell(Static_Success_Measure_5.selection, 0,\\\"expression\\\").asString()}} as 'count';\\nq = limit q 2000;\",\"measures\":[[\"count\",\"*\",\"count\"]],\"measuresMap\":{},\"groups\":[]}","version": -1},"type": "aggregateflex","useGlobal": true,"visualizationParameters": {"options": {}}},';
        jc.analyticscc__Success_KPI_1__c='strJson101';
        jc.analyticscc__Success_KPI_2__c='strJson121';
        jc.analyticscc__Success_KPI_3__c='strJson131';
        jc.analyticscc__Success_KPI_4__c='strJson141';
        jc.analyticscc__Success_KPI_5__c='strJson151';
        jc.analyticscc__Market_Filter1__c='strJson161';
        jc.analyticscc__Market__c='strJson171';
        jc.analyticscc__Market_Filter2__c='strJson181';
        JC.analyticscc__Market_Filter3__c='strJson191';
        JC.analyticscc__Market_Filter4__c='strJson201';
        JC.analyticscc__Success_Filter1__c='strJson211';
        JC.analyticscc__Success_Filter2__c='strJson231';
        JC.analyticscc__Success_Filter3__c='strJson241';
        JC.analyticscc__Success_Filter4__c='strJson251';
        JC.analyticscc__Success_Filter5__c='strJson261';
        JC.analyticscc__Sales_Filter1__c='strJson271';
        JC.analyticscc__Sales_Filter2__c='strJson281';
        JC.analyticscc__Sales_Filter3__c='strJson291';
        JC.analyticscc__Sales_Filter5__c='strJson301';
        JC.analyticscc__Sales_Filter4__c='strJson311';
        JC.analyticscc__List_Selector35__c='"listselector_35": {"parameters": {"compact": false,"expanded": true,"exploreLink": false,"instant": true,"step": "Static_Success__KPI_2_Filter","title": ""},"type": "listselector"}';
        JC.analyticscc__Marketing_Timeline__c='strJson321';
        JC.analyticscc__Success_Timeline__c='strJson341';
        JC.analyticscc__Sales_Timeline__c='strJson351';
        JC.analyticscc__Chart_Delete__c='strJson361';
        JC.analyticscc__Chart_Delete_Row__c='{"colspan": #ColSpan#,"column": #ColS#,"name": "#charts#","row": #rows#,"rowspan": #rowspan#,"widgetStyle": {"borderEdges": []}},';
        JC.analyticscc__Chart_Delete_marketing__c='{"colspan": 4,"column": 0,"name": "chart_4","row": 7,"rowspan": 5,"widgetStyle": {"borderEdges": []}},';
        JC.analyticscc__Chart_Delete_marketing1__c='{"colspan": 8,"column": 0,"name": "chart_4","row": 7,"rowspan": 5,"widgetStyle": {"borderEdges": []}},';
        JC.analyticscc__Chart_Delete_Success__c='{"colspan": 8,"column": 0,"name": "chart_3","row": 7,"rowspan": 5,"widgetStyle": {"borderEdges": []}},';
        JC.analyticscc__Chart_Delete_Success1__c='{"colspan": 4,"column": 0,"name": "chart_3","row": 7,"rowspan": 5,"widgetStyle": {"borderEdges": []}},';
        insert jc;
        
         
       
        
        
        list<Dataset__c> DatsetList = new list<Dataset__c> ();
        
        Json_Overview_String jos = new Json_Overview_String();
        list<String> values = new List<String>();
        values.add('1234');
        values.add('Success');
        values.add('Sales');
        values.add('Mar');
        values.add(UserInfo.getUserId());
        Json_Overview_String.jsonMethod('test',values,jc.Id);
        
       
        list<Dataset__c> DatsetLists = new list<Dataset__c> ();
       
        
         Dataset__c ads = new Dataset__c ();
        ads.AliasMeasure_API__c ='sum_CloseDate_day_epoch,min_analyticscc__Date_2__c_day_epoch,avg_CloseDate_day_epoch';
        ads.CompactMeasure_API__c ='[\"sum\",\"LastModifiedDate_day_epoch\"],[\"min\",\"analyticscc__Date_2__c_day_epoch\"],[\"avg\",\"CloseDate_day_epoch\"]';
        ads.Data_API__c ='LastModifiedDate';
        ads.Dataset_Id__c ='0Fb36000000H8iHCAS';
        ads.Dataset_Name__c ='All_Opportunities';       
        ads.Date_Label__c = 'Last Modified Date';  
        ads.Dimension_Api__c ='AccountId.Name,LastModifiedDate,LastModifiedDate_Year';      
        ads.Dimension_Name__c ='AccountId.Name,LastModifiedDate,LastModifiedDate_Year';     
        ads.FilterLogic__c = '(\'AccountId.Name\' == \\\"cscsc\\\")';  
         ads.Filter_Logics__c = '(\'AccountId.Name\' == \\\"cscsc\\\")'; 
        ads.KPI_Name__c ='Sales Insight';   
        ads.Measure_API__c  ='sum(\'LastModifiedDate_day_epoch\'), min(\'analyticscc__Date_2__c_day_epoch\'),avg(\'CloseDate_day_epoch\')';    
        ads.Measure_Name__c ='sum(LastModifiedDate_day_epoch),min(analyticscc__Date_2__c_day_epoch),avg(CloseDate_day_epoch)';   
        ads.RowNumber__c=1; 
        ads.session_Id__c = UserInfo.getUserId();
        ads.FilterName__c = 'test';
        ads.Filter_Logics__c = '(\'AccountId.Name\' == \\\"cscsc\\\")'; 
        insert ads;
         DatsetLists.add(ads);
        
        Json_Overview_String.jsonMethod('test',values,jc.Id);
        
        
         Dataset__c ads1 = new Dataset__c ();
        ads1.AliasMeasure_API__c ='sum_CloseDate_day_epoch,min_analyticscc__Date_2__c_day_epoch,avg_CloseDate_day_epoch';
        ads1.CompactMeasure_API__c ='[\"sum\",\"LastModifiedDate_day_epoch\"],[\"min\",\"analyticscc__Date_2__c_day_epoch\"],[\"avg\",\"CloseDate_day_epoch\"]';
        ads1.Data_API__c ='LastModifiedDate';
        ads1.Dataset_Id__c ='0Fb36000000H8iHCAS';
        ads1.Dataset_Name__c ='All_Opportunities';       
        ads1.Date_Label__c = 'Last Modified Date';  
        ads1.Dimension_Api__c ='AccountId.Name,LastModifiedDate,LastModifiedDate_Year';      
        ads1.Dimension_Name__c ='AccountId.Name,LastModifiedDate,LastModifiedDate_Year';     
        ads1.FilterLogic__c = '(\'AccountId.Name\' == \\\"cscsc\\\")';  
        // ads.Filter_Logics__c = ''; 
        ads1.KPI_Name__c ='Sales Insight';   
        ads1.Measure_API__c  ='sum(\'LastModifiedDate_day_epoch\'), min(\'analyticscc__Date_2__c_day_epoch\'),avg(\'CloseDate_day_epoch\')';    
        ads1.Measure_Name__c ='sum(LastModifiedDate_day_epoch),min(analyticscc__Date_2__c_day_epoch),avg(CloseDate_day_epoch)';   
        ads1.RowNumber__c=1; 
        ads1.session_Id__c = UserInfo.getUserId();
        ads1.FilterName__c = 'test';
        ads1.Filter_Logics__c = '(\'AccountId.Name\' == \\\"cscsc\\\")'; 
        insert ads1;
         DatsetLists.add(ads1);
        
         Json_Overview_String.jsonMethod('test',values,jc.Id);
         
          ads.RowNumber__c=0;
        update ads;
          Json_Overview_String.jsonMethod('test',values,jc.Id);
        
        
        System.assertEquals('strJson351',JC.analyticscc__Sales_Timeline__c);
    }
  
}