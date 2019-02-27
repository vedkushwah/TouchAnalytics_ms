@isTest
private class SingleKPI_Class_Clone_TC {
 
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
        KPIs.Measure_Label__c = 'sum(LastModifiedDate_day_epoch),min(analyticscc__Date_2__c_day_epoch),avg(CloseDate_day_epoch),count (),count(Account ID)';
        KPIs.RowNumber__c = 1;
        KPIs.AliasMeasure_API__c = 'sum_CloseDate_day_epoch,min_analyticscc__Date_2__c_day_epoch,avg_CloseDate_day_epoch,count,unique_AccountId';
        KPIs.CompactMeasure_API__c = '[\"sum\",\"LastModifiedDate_day_epoch\"],[\"min\",\"analyticscc__Date_2__c_day_epoch\"],[\"avg\",\"CloseDate_day_epoch\"],[\"count\",\"*\"],[\"count\",\"AccountId\"]';
         KPIs.Dimension_API__c = 'AccountId.Name,LastModifiedDate,LastModifiedDate_Year'; 
        KPIs.Measure_API__c = 'sum(\'LastModifiedDate_day_epoch\'), min(\'analyticscc__Date_2__c_day_epoch\'),avg(\'CloseDate_day_epoch\'),count(),count(\'AccountId\')';
        KPIs.Date_API__c = 'LastModifiedDate,analyticscc__Date_2__c,CloseDate';
        KPIs.DB_Template__c = DBTemplates.Id;
        KPIs.Date_Label__c = 'Last Modified Date,Date 2,Close Date';
        insert KPIs;
        
         Sales_Insight__c sales = new Sales_Insight__c();
         sales.name = 'Sales Insight';
         insert sales;
        
        System.currentPageReference().getParameters().put('tabid','1');
        System.currentPageReference().getParameters().put('hiddenKPI','1');
        System.currentPageReference().getParameters().put('KPIValue','1');
        System.currentPageReference().getParameters().put('hiddenThemeId',Sales.Id);
         apexpages.currentpage().getparameters().put('FilterNamesandVal','1Amount 680 - 85795tyurewmeasuretyurew680tyurew85795tyurewBetweentyurew1AmounttyurewX1AmountqsytrX1CloseDate_day_epoch 1695 - 1762tyurewmeasuretyurew1695tyurew1762tyurewBetweentyurewX1CloseDate_day_epochtyurewX1CloseDate_day_epochqsytrmwsqy');
       apexpages.currentpage().getparameters().put('DimhiddenKPI','<liDimsvaldivDimsvaldivDimsval1AmountDimsval1AmountDimsvalx1AmountNewDimension'); 
         apexpages.currentpage().getparameters().put('DatehiddenKPI','<liDimsvaldivDimsvaldivDimsvalcreated dateDimsvalcreated dateDimsvalcreateddateNewDimension');
         apexpages.currentpage().getParameters().put('Menuitemsval','<licntrws1Amountcntrws1Amountcntrwsx1Amountcntrwssum(\'Amount\')cntrws1Amountrwsallval');
		 
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
        apexpages.currentpage().getParameters().put('RowNumberCount','1');
        apexpages.currentpage().getParameters().put('RowNumberFilter','1');
        apexpages.currentpage().getParameters().put('AddFilName','1');
        apexpages.currentpage().getparameters().put('dimSelecteed','1');
        apexpages.currentpage().getparameters().put('dateSelecteed','1'); 
        System.currentPageReference().getParameters().put('EditDim','Accountid.Name');
        System.currentPageReference().getParameters().put('EditTopic','createddate');
        System.currentPageReference().getParameters().put('MeasTopic','count ()');
         System.currentPageReference().getParameters().put('hiddenSingleName','Test');
        
         list<selectOption> DatasetValuesList = new list<selectOption>();
         DatasetValuesList.add(new selectOption('Rep.Id','Rep.Name'));
         DatasetValuesList.add(new selectOption('sepId','sep.Name'));
         DatasetValuesList.add(new selectOption('wep.Id','wep.Name'));
         SingleKPI_Class_Clone kc = new SingleKPI_Class_Clone();

        SingleKPI_Class_Clone.KPIClass kkp = new SingleKPI_Class_Clone.KPIClass('0Fb36000000H8iHCAS',1, kC.DatasetValuesList,true);
        SingleKPI_Class_Clone.Filterwrapper kcf = new SingleKPI_Class_Clone.Filterwrapper('Accountid.Name', '==','null',1);
        SingleKPI_Class_Clone.SelectedDateFieldWrapper ksf = new SingleKPI_Class_Clone.SelectedDateFieldWrapper('createddate',false,'createddate');
         kkp.SelectedDateFieldlist = new list<SingleKPI_Class_Clone.SelectedDateFieldWrapper>();
        list<SingleKPI_Class_Clone.SelectedDateFieldWrapper> ksflist = new list<SingleKPI_Class_Clone.SelectedDateFieldWrapper>();
         ksflist.add(ksf);
         kkp.SelectedDateFieldlist  =  ksflist;
        list<SingleKPI_Class_Clone.Filterwrapper> kaflist = new list<SingleKPI_Class_Clone.Filterwrapper>();
        list<SingleKPI_Class_Clone.Filterwrapper> kaflist1 = new list<SingleKPI_Class_Clone.Filterwrapper>();
        kcf.Counterwrap = 1;
        kcf.UserLogic='1';
        kcf.filterRowCount=1;
        kcf.FilterNames = new list<SingleKPI_Class_Clone.Filterwrapper> ();
        
        kkp.AddFilter = new list<SingleKPI_Class_Clone.Filterwrapper> ();
         kkp.EditFilter = new list<SingleKPI_Class_Clone.Filterwrapper> ();
        kaflist.add(kcf);
         kaflist1.add(kcf);
        kkp.AddFilter = kaflist;
        kkp.EditFilter = kaflist;
        kcf.FilterNames= kaflist1;
        
        
       
        
        
      
      
       
      
        
        
     //  SingleKPI_Class_Clone.DateFieldWrapper kdf = new SingleKPI_Class_Clone.DateFieldWrapper('Accountid.Name');
        
        SingleKPI_Class_Clone.availableDimesionWrapper  kaw = new  SingleKPI_Class_Clone.availableDimesionWrapper('date',true);
        kkp.availableDimesions = new List<SingleKPI_Class_Clone.availableDimesionWrapper>();
        SingleKPI_Class_Clone.SelectedDimesionWrapper ksw = new   SingleKPI_Class_Clone.SelectedDimesionWrapper('AccountId.Name',true,'AccountId.Name');
        List<SingleKPI_Class_Clone.SelectedDimesionWrapper> kswlist = new List<SingleKPI_Class_Clone.SelectedDimesionWrapper>();
        kkp.SelectedDimensions = new list<SingleKPI_Class_Clone.SelectedDimesionWrapper>();
        kswlist.add(ksw);
        List<SingleKPI_Class_Clone.availableDimesionWrapper> kawlist = new List<SingleKPI_Class_Clone.availableDimesionWrapper>();
        kawlist.add(kaw);
         kkp.availableDimesions = kawlist;
          kkp.availableDimesions = kawlist;
       //  kkp.SelectedDimensions = kswlist;
        kkp.availableDateFields = new List<SingleKPI_Class_Clone.DateFieldWrapper>();
        List<SingleKPI_Class_Clone.DateFieldWrapper> kdlist = new  List<SingleKPI_Class_Clone.DateFieldWrapper>();
       // kdlist.add(kdf);
        kkp.availableDateFields = kdlist;
        kkp.dataSet='test';
        SingleKPI_Class_Clone.KPIClass kkp1 = new SingleKPI_Class_Clone.KPIClass('test',2, kC.DatasetValuesList,true);
         kkp.selectedMeasures = new  set<string>();
         kkp.selectedMeasures.add('min(analyticscc__Date_2__c_day_epoch)');
        kkp.selectedMeasures.add('sum(Probability )');
        kkp.selectedMeasures.add('avg(CloseDate_day_epoch)');
        kkp.selectedMeasures.add('count(Account ID)');
        kkp.selectedMeasures.add('count ()');
        
        kkp.selectedDateFields = new set<string>();
        kkp.selectedDateFields.add('Last Modified Date');
        kkp.selectedDateFields.add('Date 2');
        kkp.selectedDateFields.add('Close Date');
        
        
        
        kkp.selectedDimension = new set<string>();
         kkp.selectedDimension.add('AccountId.Name');
        kkp.selectedDimension.add('LastModifiedDate');
        kkp.selectedDimension.add('LastModifiedDate_Year');
        
        
        
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
        
        kkp1.selectedDimension = new set<string>();
         kkp1.selectedDimension.add('AccountId.Name');
        kkp1.selectedDimension.add('LastModifiedDate');
        kkp1.selectedDimension.add('LastModifiedDate_Year');
        
        list<SingleKPI_Class_Clone.KPIClass> kplist = new list<SingleKPI_Class_Clone.KPIClass>();
        
        
        SingleKPI_Class_Clone.FilterInnerClass kfi = new SingleKPI_Class_Clone.FilterInnerClass('',1,'Accountid.Name','','==','test','');
        list< SingleKPI_Class_Clone.FilterInnerClass> InnerClasses = new list< SingleKPI_Class_Clone.FilterInnerClass>();
        SingleKPI_Class_Clone.FilterInnerClassEdit kfie = new  SingleKPI_Class_Clone.FilterInnerClassEdit( 'Betweens', 'typeofSelect','minval', 'maxVal','filterCon','selectedfield','Fieldname','FilterIds','FieldAPI','fromDate','toDate',1,1);
       SingleKPI_Class_Clone.MeasureWrapper kmw = new SingleKPI_Class_Clone.MeasureWrapper('LastModifiedDate');
        kkp.SelectedFilters =  new list<SingleKPI_Class_Clone.FilterInnerClass>(); 
         InnerClasses.add(kfi);
         kkp.SelectedFilters = InnerClasses;
        kplist.add(kkp);
        kplist.add(kkp1);
        
        kc.KPIDetils=kplist;
        for(SingleKPI_Class_Clone.KPIClass kck : kplist ) { 
            kck.SelectedFilters=InnerClasses;
        }     
        kc.KPIDetils=kplist; 
        kc.KPINameUI='test';
        //kc.SaveKPI1();
        kc.FloderNames();
        KC.accountBalance = 30000;
	    KC.TotalCost = 15000;
	    kc.BuildCost = 15000;
        KC.DateShowMethod();
        KC.DimensionShowMethod();
        
        //kc.getFloderList();
        //kc.CloseKPIUI();
        //kc.ActTabshide();
        kc.EditaddRow();
        kc.defaultTab1 = true;
        kc.defaultTab2 = false;
        kc.defaultTab3 = false;
        kc.defaultTab4 = false;
        kc.defaultTab5 = false;
        kc.ActTabs1();
        kc.Previous();
        kc.PreviousMeasure();
        kc.PreviousDates();
        kc.PreviousFields();
        kc.getOperatorValues();
         KKP.AddFilter = new list<SingleKPI_Class_Clone.Filterwrapper> ();                          
        KKP.AddFilter.add(new SingleKPI_Class_Clone.Filterwrapper('Account', '==','Test'  , 1));
        
        KKP.AddFilter[0].Userlogic = '1';
        kc.FilterMethod();
         Kc.AddFilterNew();
        //Kc.verifyError(1,'Test');
        
        
        kc.addRow();
        kc.EditLabelClass();
        kc.MeasLabelClass();
        kkp.SelectedDateFieldlist  =  ksflist;
        kc.SaveEditLabels();
        kc.SaveMeasLabels();
        kc.EditDimClass();
        kkp.SelectedDimensions = kswlist;
        kc.SaveDimLabels();
        kkp.SelectedDimensions = kswlist;

        kc.removingEditRow();
        //kc.RemoveMeasures();
        Kc.FIlterNames= 'Sil';
        kcf.FilterNames= kaflist;
        kc.AddFilter();
        kc.RemoveKPIS();
        kc.RemoveFilters();
        kc.removingRow();
        kkp.SelectedDimensions = kswlist;
        kkp.SelectedDateFieldlist  =  ksflist;
        kc.submit();
        kc.SaveandCloseopp();
        kc.Dimensions('11');
        kc.ReportList();
         kplist.add(kkp);
        kawlist.add(kaw);
         kkp.availableDimesions = kawlist;
        kc.DimensionNames();
        kc.SubmitResults();
        Kc.Save();
         kplist.add(kkp);
        kkp.dataSet='test';
        kc.DateFieldMethod();
         kc.DateFieldNames();
         kc.MeasureMethod();
         kc.DateNames();
       //  kc.NextMethod();
         KKP.EditFilter = new list<SingleKPI_Class_Clone.Filterwrapper> ();                          
        KKP.EditFilter.add(new SingleKPI_Class_Clone.Filterwrapper('Account', '==','test'  , 1));
        KKP.EditFilter[0].Userlogic = '1';
        kc.FilterMethodEdit(); 
        Kc.updateFilterNew();
          //Kc.verifyErrorEdit(1,'Test');
         
        
        // kc.EditaddRow(); 
          kc.RemoveDimensionNames();
          kc.RemoveDateNames();
          
         kplist.add(kkp);
        kkp.SelectedFilters = InnerClasses;
       // kkp.AddFilter = kaflist;
         kcf.Counterwrap = 1;
        // kaflist.add(kcf);
         kaflist1.add(kcf);
        //  kaflist.add(kcf);
       
        kcf.FilterNames= kaflist1;
        kc.UpdateFilter(); 
      Kc.sortSelectOptions(DatasetValuesList);
      kkp.AddFilter = kaflist;
      kaflist.add(kcf);
       
       //Kc.verifyError(2,'Sil');
       // KC.CloneFromPrevious(DbTemplates.Id); 
        
        
         Kc.DimensionsNew();
        Kc.DatesNew();
        Kc.NewDimensions();
        Kc.ActNaming();
       apexpages.currentpage().getparameters().put('SelectedButtonValues','Test');
System.currentPageReference().getParameters().put('hiddenThemeId','Test');
Kc.Cancelvalues();
Kc.singleDashboardTheme();

    apexpages.currentpage().getParameters().put('Menuitemsval','<licntrws1Amountcntrws1Amountcntrwsx1Amountcntrwssum(\'Amount\')cntrws1Amountrwsallval');
		   Kc.MeasureNew();   
        System.assertEquals('Sales Insight',ads.KPI_Name__c);
        
        Kc.NewDatasets();
        Kc.NewClone();
        Kc.DashboardCreate();
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
        
    }  
    
 
}