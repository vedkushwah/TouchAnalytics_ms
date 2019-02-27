@isTest  
public class ActualTarget_AC_test {
    private static testMethod void testsinglekpi() {
         Dataset__c ads = new Dataset__c ();
        ads.AliasMeasure_API__c ='sum_CloseDate_day_epoch,min_analyticscc__Date_2__c_day_epoch,avg_CloseDate_day_epoch,count,unique_AccountId';
       ads.CompactMeasure_API__c ='[\"sum\",\"LastModifiedDate_day_epoch\"],[\"min\",\"analyticscc__Date_2__c_day_epoch\"],[\"avg\",\"CloseDate_day_epoch\"],[\"count\",\"*\"],[\"count\",\"AccountId\"]';
        ads.Data_API__c ='LastModifiedDate,analyticscc__Date_2__c,CloseDate';
        ads.Dataset_Id__c ='0Fb36000000H8iHCAS';
         ads.Dataset_Name__c ='All_Opportunities';      
           ads.Date_Label__c = 'Last Modified Date,Date 2,Close Date';  
           ads.Dimension_Api__c ='AccountId.Name,LastModifiedDate,LastModifiedDate_Year';       
           ads.Dimension_Name__c ='AccountId.Name,LastModifiedDate,LastModifiedDate_Year';      
           ads.FilterLogic__c = '(\'AccountId.Name\' == \\\"cscsc\\\")';    
           ads.KPI_Name__c  ='Sales Insight';   
           ads.Measure_API__c   ='sum(\'LastModifiedDate_day_epoch\'), min(\'analyticscc__Date_2__c_day_epoch\'),avg(\'CloseDate_day_epoch\'),count(),count(\'AccountId\')';    
           ads.Measure_Name__c  ='sum(LastModifiedDate_day_epoch),min(analyticscc__Date_2__c_day_epoch),avg(CloseDate_day_epoch),count (),count(Account ID)';   
           ads.RowNumber__c=1; 
           ads.FilterName__c = 'test'; 
          insert ads;
        
        DB_Template__c DBTemplates = new DB_Template__c();
        DBTemplates.DB_Name__c = 'Sales KPI';
        insert DBTemplates;
        
        KPIs__c KPIs = new KPIs__c();
        KPIs.Dataset_Id__c = '0Fb36000000H8iHCAS';
        KPIs.Dataset_Name__c = 'All_Opportunities'; 
        KPIs.Dimension_Label__c = 'AccountId.Name,LastModifiedDate,LastModifiedDate_Year'; 
        KPIs.User_Logic__c = '1';
        KPIs.Filter_Logic__c = '(\'AccountId.Name\' == \\\"cscsc\\\")';  
        KPIs.Filter_Name__c = 'F1';
        KPIs.Filter_code__c = '1Amount 680 - 85795tyurewmeasuretyurew680tyurew85795tyurewBetweentyurew1AmounttyurewX1AmountqsytrX1CloseDate_day_epoch 1695 - 1762tyurewmeasuretyurew1695tyurew1762tyurewBetweentyurewX1CloseDate_day_epochtyurewX1CloseDate_day_epochqsytrmwsqy';
        KPIs.KPI_Name__c = 'Sales';
        KPIs.Measure_Label__c = 'sum(LastModifiedDate_day_epoch),min(analyticscc__Date_2__c_day_epoch),avg(CloseDate_day_epoch)';
        KPIs.RowNumber__c = 1;
        KPIs.AliasMeasure_API__c = 'sum_CloseDate_day_epoch,min_analyticscc__Date_2__c_day_epoch,avg_CloseDate_day_epoch';
        KPIs.CompactMeasure_API__c = '[\"sum\",\"LastModifiedDate_day_epoch\"],[\"min\",\"analyticscc__Date_2__c_day_epoch\"],[\"avg\",\"CloseDate_day_epoch\"]';
         KPIs.Dimension_API__c = 'AccountId.Name,LastModifiedDate,LastModifiedDate_Year'; 
        KPIs.Measure_API__c = 'sum(\'LastModifiedDate_day_epoch\'), min(\'analyticscc__Date_2__c_day_epoch\'),avg(\'CloseDate_day_epoch\')';
        KPIs.Date_API__c = 'LastModifiedDate,analyticscc__Date_2__c,CloseDate';
        KPIs.DB_Template__c = DBTemplates.Id;
        KPIs.Date_Label__c = 'Last Modified Date,Date 2,Close Date';
        KPIs.Filter_Logics__c = '25,30,45;25,30,45;25,30,45';
        insert KPIs;
        
        Sales_insight__c Sales= new Sales_Insight__c();
        Sales.Name = 'Default Actual Target Theme';
        insert Sales;
        System.currentPageReference().getParameters().put('tabid','1');
        System.currentPageReference().getParameters().put('hiddenKPI','1');
       
        System.currentPageReference().getParameters().put('KPIValue','1');
        
        
        
        
         apexpages.currentpage().getparameters().put('FilterNamesandVal','1Amount 680 - 85795tyurewmeasuretyurew680tyurew85795tyurewBetweentyurew1AmounttyurewX1AmountqsytrX1CloseDate_day_epoch 1695 - 1762tyurewmeasuretyurew1695tyurew1762tyurewBetweentyurewX1CloseDate_day_epochtyurewX1CloseDate_day_epochqsytrmwsqy');
       apexpages.currentpage().getparameters().put('DimhiddenKPI','1AmountDimsval1AmountDimsvalx1AmountNewDimension'); 
        apexpages.currentpage().getparameters().put('DimhiddenKPIs','1AmountDimsval1AmountDimsvalx1AmountNewDimension'); 
         apexpages.currentpage().getparameters().put('DatehiddenKPI','created dateDimsvalcreated dateDimsvalcreateddateNewDimension');
         apexpages.currentpage().getparameters().put('DatehiddenKPIs','created dateDimsvalcreated dateDimsvalcreateddateNewDimension');
         apexpages.currentpage().getParameters().put('Menuitemsval','<li 1Amountcntrws1Amountcntrwsx1Amountcntrws1Amountcntrws1Amountrwsallval1Amountcntrws1Amountcntrwsx1Amountcntrws1Amountcntrws1Amountrwsallval1Amountcntrws1Amountcntrwsx1Amountcntrws1Amountcntrws1Amount');
         
         apexpages.currentPage().getParameters().put('Menuitemsvaltar','<li 1Amountcntrws1Amountcntrwsx1Amountcntrws1Amountcntrws1Amountrwsallval');
        
        apexpages.currentPage().getParameters().put('Measureone','24');
        apexpages.currentPage().getParameters().put('Measurefour','34');
        apexpages.currentPage().getParameters().put('Measuresev','34');
        
        apexpages.currentPage().getParameters().put('Measuretwo','34');
        apexpages.currentPage().getParameters().put('Measurefive','34');
        apexpages.currentPage().getParameters().put('Measureeig','34');
        
        apexpages.currentPage().getParameters().put('Measurethree','34');
        apexpages.currentPage().getParameters().put('Measuresix','34');
        apexpages.currentPage().getParameters().put('Measurenine','34');
        
        apexpages.currentPage().getParameters().put('Measureones','<li 34');
        apexpages.currentPage().getParameters().put('Measureonestwo','<li 34');
        apexpages.currentPage().getParameters().put('Measureonesthree','<li 34');
		 
        Apexpages.currentpage().getParameters().put('RowNumberDel','1'); 
        Apexpages.currentpage().getParameters().put('hidrowcount','1');
        apexpages.currentpage().getparameters().put('KPIDimen','1');
        apexpages.currentpage().getparameters().put('counterWrap','1');
        apexpages.currentpage().getparameters().put('RowNumber','1');
        apexpages.currentpage().getparameters().put('KPIFilterName','1');
        apexpages.currentpage().getParameters().put('DeleteFil','1');
        apexpages.currentpage().getParameters().put('DeleteKPI','1');
        apexpages.currentpage().getParameters().put('RemoveFilter','1');
        apexpages.currentpage().getParameters().put('index','1');
        apexpages.currentpage().getparameters().put('SelectDimen','1');
        apexpages.currentpage().getparameters().put('SUM','sum');
        apexpages.currentpage().getparameters().put('Count','count');
        apexpages.currentpage().getparameters().put('SUMName','AccountId');
        apexpages.currentpage().getparameters().put('DimenCount','Count');
        apexpages.currentpage().getparameters().put('DimenName','AccountId');
        apexpages.currentpage().getparameters().put('Rowtrue','true');
        apexpages.currentpage().getparameters().put('Rowsumtrue','false');
        
       // apexpages.currentpage().getparameters().put('Rowsumtrue','true');

        apexpages.currentpage().getparameters().put('RowDimtrue','true');          
        apexpages.currentpage().getparameters().put('RowNumbers','1');
        apexpages.currentpage().getparameters().put('RowValues','1');
        apexpages.currentpage().getParameters().put('RowNumberCount','1');
        apexpages.currentpage().getParameters().put('RowNumberFilter','1');
        apexpages.currentpage().getParameters().put('AddFilName','1');
        apexpages.currentpage().getparameters().put('dimSelecteed','1');
        apexpages.currentpage().getparameters().put('dateSelecteed','1'); 
        System.currentPageReference().getParameters().put('EditDim','Accountid.Name');
        System.currentPageReference().getParameters().put('EditTopic','createddate');
        System.currentPageReference().getParameters().put('MeasTopic','AccountId');
         System.currentPageReference().getParameters().put('hiddenSingleName','Test');
        
         list<selectOption> DatasetValuesList = new list<selectOption>();
         DatasetValuesList.add(new selectOption('Rep.Id','Rep.Name'));
         DatasetValuesList.add(new selectOption('sepId','sep.Name'));
         DatasetValuesList.add(new selectOption('wep.Id','wep.Name'));
        ActualTarget_AC kc = new ActualTarget_AC();
       
       
       
       
        
         
       
        ActualTarget_AC.KPIClass kkp = new ActualTarget_AC.KPIClass('0Fb36000000H8iHCAS',1, kC.DatasetValuesList,true);
        ActualTarget_AC.KPIClass kkps= new ActualTarget_AC.KPIClass('0Fb36000000H8iHCAS',2, kC.DatasetValuesList,true);
        
        
         ActualTarget_AC.SelectedDateFieldWrapper ksf = new ActualTarget_AC.SelectedDateFieldWrapper('createddate',false,'createddate');
         kkp.SelectedDateFieldlist = new list<ActualTarget_AC.SelectedDateFieldWrapper>();
        list<ActualTarget_AC.SelectedDateFieldWrapper> ksflist = new list<ActualTarget_AC.SelectedDateFieldWrapper>();
         ksflist.add(ksf);
         kkp.SelectedDateFieldlist  =  ksflist;
      // kcf.FilterNames= kaflist1;
        
        
       
        
        
      
      
       
      
        
        
     //  ActualTarget_AC.DateFieldWrapper kdf = new ActualTarget_AC.DateFieldWrapper('Accountid.Name');
        
        ActualTarget_AC.availableDimesionWrapper  kaw = new  ActualTarget_AC.availableDimesionWrapper('date',true);
        kkp.availableDimesions = new List<ActualTarget_AC.availableDimesionWrapper>();
        ActualTarget_AC.SelectedDimesionWrapper ksw = new   ActualTarget_AC.SelectedDimesionWrapper('AccountId.Name',true,'AccountId.Name');
        List<ActualTarget_AC.SelectedDimesionWrapper> kswlist = new List<ActualTarget_AC.SelectedDimesionWrapper>();
        kkp.SelectedDimensions = new list<ActualTarget_AC.SelectedDimesionWrapper>();
        kswlist.add(ksw);
        List<ActualTarget_AC.availableDimesionWrapper> kawlist = new List<ActualTarget_AC.availableDimesionWrapper>();
        kawlist.add(kaw);
         kkp.availableDimesions = kawlist;
       //  kkp.SelectedDimensions = kswlist;
        kkp.availableDateFields = new List<ActualTarget_AC.DateFieldWrapper>();
        List<ActualTarget_AC.DateFieldWrapper> kdlist = new  List<ActualTarget_AC.DateFieldWrapper>();
       // kdlist.add(kdf);
        kkp.availableDateFields = kdlist;
        kkp.dataSet='test';
        ActualTarget_AC.KPIClass kkp1 = new ActualTarget_AC.KPIClass('test',2, kC.DatasetValuesList,true);
        
        ActualTarget_AC.Measureclass Measureoneslist = new ActualTarget_AC.Measureclass('sum1AccountId',integer.valueof('45'));
        ActualTarget_AC.Measureclass Measureonestwolist = new ActualTarget_AC.Measureclass('max1AccountId',integer.valueof('77'));
        ActualTarget_AC.Measureclass Measureonesthreelist = new ActualTarget_AC.Measureclass('min1AccountId',integer.valueof('88'));
     
              list<ActualTarget_AC.MeasureAngularclass> MeasureAngularclasses = new list<ActualTarget_AC.MeasureAngularclass>();
              ActualTarget_AC.MeasureAngularclass MeasureAngularclassa = new ActualTarget_AC.MeasureAngularclass('AccountId','Test','Test','Test','Test','1');         	    
        MeasureAngularclasses.add(MeasureAngularclassa);
        set<String> selectedMeasures = new  set<string>();
        selectedMeasures.add('Sum(AccountId)');
        selectedMeasures.add('sum(Probability )');
        selectedMeasures.add('avg(CloseDate_day_epoch)');
        selectedMeasures.add('count(Account ID)');
        selectedMeasures.add('count ()');
        
        kkp.selectedDateFields = new set<string>();
        kkp.selectedDateFields.add('Last Modified Date');
        kkp.selectedDateFields.add('Date 2');
        kkp.selectedDateFields.add('Close Date');
        
        
         KC.accountBalance = 1000;
        Kc.totalCost = 100;
        Kc.selectedDashboard = 'Insights (Single Auto)';
        Kc.couponcode = 'Free Single Auto';
         Kc.BuildCost = 1000;
     
        
        
        
         kkp1.selectedMeasures = new  set<string>();
         kkp1.selectedMeasures.add('min(analyticscc__Date_2__c_day_epoch)');
        kkp1.selectedMeasures.add('sum(Probability )');
        kkp1.selectedMeasures.add('avg(CloseDate_day_epoch)');
        kkp1.selectedMeasures.add('count(Account ID)');
        kkp1.selectedMeasures.add('count ()');
        
        kkp1.selectedDateFields = new set<string>();
        kkp1.selectedDateFields.add('Last Modified Date');
        kkp1.selectedDateFields.add('Date 2');
        kkp1.selectedDateFields.add('Close Date');
        
      
        
        list<ActualTarget_AC.KPIClass> kplist = new list<ActualTarget_AC.KPIClass>();
        kplist.add(kkps);
        
        kplist.add(kkp);
        
         ActualTarget_AC.MeasureWrapper kmw = new ActualTarget_AC.MeasureWrapper('LastModifiedDate');
       
        kc.KPIDetils=kplist; 
        kc.KPINameUI='test';
        kc.SaveKPI1();
        kc.FloderNames();
        //kc.getFloderList();
        //kc.CloseKPIUI();
        //kc.ActTabshide();
      
        kc.Previous();
  
        
    
     
       
        kc.EditLabelClass1();
        kc.MeasLabelClass1();
        kkp.SelectedDateFieldlist  =  ksflist;
        kc.SaveEditLabels();  
        KKP.NewMeasurevarlist = MeasureAngularclasses;
        KKP.selectedMeasures = selectedMeasures;
        kc.SaveMeasLabels();
        kc.EditDimClass1();
        kkp.SelectedDimensions = kswlist;
        kc.SaveDimLabels();
        kkp.SelectedDimensions = kswlist;

      
        
        Kc.FIlterNames= 'Sil';
       
        kc.submit();
        Kc.SaveandCloseopp();
        kc.Dimensions('11');
        kc.ReportList();
         kplist.add(kkp);
        kawlist.add(kaw);
         kkp.availableDimesions = kawlist;
      
      
        Kc.Save();
         kplist.add(kkp);
        kkp.dataSet='test';
        kc.DateFieldMethod();
      
         kc.MeasureMethod();
        
     
       Kc.sortSelectOptions(DatasetValuesList);
    
  
        KC.CloneFromPrevious(DbTemplates.Id); 
        
        kc.KPIDetils=kplist; 
         Kc.DimensionsNew();
         kc.KPIDetils=kplist; 
        Kc.DatesNew();
         kc.KPIDetils=kplist; 
        Kc.MeasureNew();
        
    /*    Kc.RemoveFilters();





 KKP.AddFilter = new list<ActualTarget_AC.Filterwrapper> ();                          
 KKP.AddFilter.add(new ActualTarget_AC.Filterwrapper('Account', '==','Test'  , 1));
 Kc.FilterMethod();
Kc.AddFilterNew();
Kc.AddFilterLogic();
Kc.verifyError(1,'Test');

 KKP.EditFilter = new list<ActualTarget_AC.Filterwrapper> ();                          
 KKP.EditFilter.add(new ActualTarget_AC.Filterwrapper('Account', '==','Test'  , 1));
 Kc.FilterMethodEdit();
Kc.updateFilterNew();
Kc.verifyErrorEdit(1,'Test');  */
/*Kc.NewDatasets();
        Kc.NewClone();
        Kc.DashboardCreate();*/
           Kc.booleanConnections();
 Kc.buildSelected();
 Kc.getCouponInformation();
 Kc.getBulidCost();
 Kc.connectToSFDC();
 Kc.verifyAccountDetails();
 Kc.verifyContactDetails();
 Kc.saveAndCancelDashboard(1);
 Kc.purchaseAndBuildDashboard('Failed',1);
 Kc.saveOpportunity(1);
Kc.saveOpportunityLineItem(1);
 Kc.ConnectSfdc();
 Kc.Goback();
       
        
        System.assertEquals('Sales Insight',ads.KPI_Name__c);
        
    }
    
}