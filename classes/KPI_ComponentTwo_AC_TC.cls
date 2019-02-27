@isTest
private class KPI_ComponentTwo_AC_TC {
    
    public  static testMethod void testKPIComponent() {
        
        
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
        ads.KPI_Name__c	='Sales Insight';	
        ads.Measure_API__c	='sum(\'LastModifiedDate_day_epoch\'), min(\'analyticscc__Date_2__c_day_epoch\'),avg(\'CloseDate_day_epoch\'),count(),count(\'AccountId\')';	
        ads.Measure_Name__c	='sum(LastModifiedDate_day_epoch),min(analyticscc__Date_2__c_day_epoch),avg(CloseDate_day_epoch),count (),count(Account ID)';	
        ads.RowNumber__c=6;	
        insert ads;
        
        list<DB_Template__c> Dblist = new list<DB_Template__c>();
        DB_Template__c DBTemplates = new DB_Template__c();
        DBTemplates.DB_Name__c = 'Sales KPI';
        DBTemplates.Type__c = 'Multi KPI';
        insert DBTemplates;
        
        KPIs__c KPIs = new KPIs__c();
        KPIs.Dataset_Id__c = '0Fb36000000H8iHCAS';
        KPIs.Dataset_Name__c = 'All_Opportunities'; 
        KPIs.Dimension_Label__c = 'AccountId.Name,LastModifiedDate,LastModifiedDate_Year'; 
        KPIs.User_Logic__c = '1';
        KPIs.Filter_Logic__c = '(\'AccountId.Name\' == \\\"cscsc\\\")';  
        KPIs.Filter_Name__c = 'F1;F2';
        KPIs.KPI_Name__c = 'Sales';
        KPIs.Measure_Label__c = 'sum(LastModifiedDate_day_epoch),min(analyticscc__Date_2__c_day_epoch),avg(CloseDate_day_epoch),count (),count(Account ID)';
        KPIs.RowNumber__c = 6;
        KPIs.AliasMeasure_API__c = 'sum_CloseDate_day_epoch,min_analyticscc__Date_2__c_day_epoch,avg_CloseDate_day_epoch,count,unique_AccountId';
        KPIs.CompactMeasure_API__c = '[\"sum\",\"LastModifiedDate_day_epoch\"],[\"min\",\"analyticscc__Date_2__c_day_epoch\"],[\"avg\",\"CloseDate_day_epoch\"],[\"count\",\"*\"],[\"count\",\"AccountId\"]';
        KPIs.Dimension_API__c = 'AccountId.Name,LastModifiedDate,LastModifiedDate_Year'; 
        KPIs.Measure_API__c = 'sum(\'LastModifiedDate_day_epoch\'), min(\'analyticscc__Date_2__c_day_epoch\'),avg(\'CloseDate_day_epoch\'),count(),count(\'AccountId\')';
        KPIs.Date_API__c = 'LastModifiedDate,analyticscc__Date_2__c,CloseDate';
        KPIs.DB_Template__c = DBTemplates.Id;
        KPIs.Date_Label__c = 'Last Modified Date,Date 2,Close Date';
        KPIs.Filter_code__c = '1Amount 680 - 85795tyurewmeasuretyurew680tyurew85795tyurewBetweentyurew1AmounttyurewX1AmountqsytrX1CloseDate_day_epoch 1695 - 1762tyurewmeasuretyurew1695tyurew1762tyurewBetweentyurewX1CloseDate_day_epochtyurewX1CloseDate_day_epochqsytr';
        insert KPIs;
        
        list<KPIs__c> KPIlist = new list<KPIs__c>();		
        KPIlist.add(KPIs);
        
        apexpages.currentpage().getparameters().put('FilterNamesandVal','1Amount 680 - 85795tyurewmeasuretyurew680tyurew85795tyurewBetweentyurew1AmounttyurewX1AmountqsytrX1CloseDate_day_epoch 1695 - 1762tyurewmeasuretyurew1695tyurew1762tyurewBetweentyurewX1CloseDate_day_epochtyurewX1CloseDate_day_epochqsytr');
         apexpages.currentpage().getparameters().put('DimhiddenKPI','1AmountDimsval1AmountDimsvalx1AmountNewDimension'); 
         apexpages.currentpage().getparameters().put('DatehiddenKPI','created dateDimsvalcreated dateDimsvalcreateddateNewDimension');
         apexpages.currentpage().getParameters().put('Menuitemsval','<li 1Amountcntrws1Amountcntrwsx1Amountcntrws1Amountcntrws1Amountrwsallval');
		 
        System.currentPageReference().getParameters().put('tabid1','1');
        System.currentPageReference().getParameters().put('hiddenKPI1','1');
        System.currentPageReference().getParameters().put('KPIValue1','6');
        Apexpages.currentpage().getParameters().put('RowNumberDel1','6'); 
        Apexpages.currentpage().getParameters().put('hidrowcount1','1');
        apexpages.currentpage().getparameters().put('KPIDimen','6');
        apexpages.currentpage().getparameters().put('counterWrap','1');
        apexpages.currentpage().getparameters().put('RowNumber','6');
        apexpages.currentpage().getparameters().put('KPIFilterName','1');
        apexpages.currentpage().getParameters().put('DeleteFil','1');
        apexpages.currentpage().getParameters().put('DeleteKPI','1');
        apexpages.currentpage().getParameters().put('RemoveFilter','1');
        apexpages.currentpage().getParameters().put('index','1');
        apexpages.currentpage().getparameters().put('SelectDimen','1');
        apexpages.currentpage().getparameters().put('SUM','1');
        apexpages.currentpage().getparameters().put('Count','1');
        apexpages.currentpage().getparameters().put('SUMName','1');
        apexpages.currentpage().getparameters().put('DimenCount','1');
        apexpages.currentpage().getparameters().put('DimenName','1');
        apexpages.currentpage().getparameters().put('Rowtrue','true');
        apexpages.currentpage().getparameters().put('Rowsumtrue','true');
        apexpages.currentpage().getparameters().put('RowDimtrue','true');          
        apexpages.currentpage().getparameters().put('RowNumbers','6');
        apexpages.currentpage().getParameters().put('RowNumberCount','6');
        apexpages.currentpage().getParameters().put('RowNumberFilter','6');
        apexpages.currentpage().getParameters().put('AddFilName','1');
        apexpages.currentpage().getparameters().put('dimSelecteed','1');
        apexpages.currentpage().getparameters().put('dateSelecteed','1'); 
        apexpages.currentpage().getparameters().put('FilterLogics','1');
        
        System.currentPageReference().getParameters().put('RowValues1','6');
        System.currentPageReference().getParameters().put('EditTopic','createddate');
        System.currentPageReference().getParameters().put('EditDim','AccountId.Name');
        System.currentPageReference().getParameters().put('MeasTopic','count ()');
        
        KPI_ComponentTwo_AC kc = new KPI_ComponentTwo_AC();
         kc.AddFilterNewone();
         kc.updateFilterNewone();
        
        
        
        
        KPI_ComponentTwo_AC.KPIClass kkp = new KPI_ComponentTwo_AC.KPIClass('0Fb36000000H8iHCAS',6, kC.DatasetValuesList,true);
        KPI_ComponentTwo_AC.Filterwrapper kcf = new KPI_ComponentTwo_AC.Filterwrapper('Accountid.Name', '==','null',6);
        KPI_ComponentTwo_AC.SelectedDateFieldWrapper ksf = new KPI_ComponentTwo_AC.SelectedDateFieldWrapper('createddate',false,'createddate');
        
        
        
        kkp.SelectedDateFieldlist = new list<KPI_ComponentTwo_AC.SelectedDateFieldWrapper>();
        list<KPI_ComponentTwo_AC.SelectedDateFieldWrapper> ksflist = new list<KPI_ComponentTwo_AC.SelectedDateFieldWrapper>();
        
        list< KPI_ComponentTwo_AC.FilterInnerClass> InnerClasses = new list< KPI_ComponentTwo_AC.FilterInnerClass>();
        
        list< KPI_ComponentTwo_AC.WrapSelectedFilterList> InnerClasseslist = new list< KPI_ComponentTwo_AC.WrapSelectedFilterList>();
        
        
        KPI_ComponentTwo_AC.FilterInnerClass kfi = new KPI_ComponentTwo_AC.FilterInnerClass('',1,'Accountid.Name','','==','test','');
        
        kkp.SelectedFilters =  new list<KPI_ComponentTwo_AC.FilterInnerClass>(); 
        InnerClasses.add(kfi);
        kkp.SelectedFilters = InnerClasses;
         kc.RemoveFilters();
        list< KPI_ComponentTwo_AC.WrapSelectedFilterList> InnerClasseslists = new list< KPI_ComponentTwo_AC.WrapSelectedFilterList>();
        KPI_ComponentTwo_AC.WrapSelectedFilterList kfiList = new KPI_ComponentTwo_AC.WrapSelectedFilterList('Test',kkp.SelectedFilters,'\'Accountid.Name\' != Null',1, '1');   
        InnerClasseslists.add(kfiList);
       // kkp.SelectedFilterList = new list<KPI_ComponentTwo_AC.WrapSelectedFilterList>();   
        kkp.SelectedFilterList = InnerClasseslists;
        
        
        ksflist.add(ksf);
        kkp.SelectedDateFieldlist  =  ksflist;
        list<KPI_ComponentTwo_AC.Filterwrapper> kaflist = new list<KPI_ComponentTwo_AC.Filterwrapper>();
        kcf.Counterwrap = 1;
        kcf.UserLogic='1';
        kcf.filterRowCount=6;
        kcf.FilterNames = new list<KPI_ComponentTwo_AC.Filterwrapper> ();
        
        kkp.AddFilter = new list<KPI_ComponentTwo_AC.Filterwrapper> ();
        kkp.EditFilter = new list<KPI_ComponentTwo_AC.Filterwrapper> ();
        kaflist.add(kcf);
        kkp.AddFilter = kaflist;
        kkp.EditFilter = kaflist;
        // kkp.FilterNames= kaflist;
        KPI_ComponentTwo_AC.DateFieldWrapper kdf = new KPI_ComponentTwo_AC.DateFieldWrapper('Created Date',false);
        
        KPI_ComponentTwo_AC.availableDimesionWrapper  kaw = new  KPI_ComponentTwo_AC.availableDimesionWrapper('AccountId.Name',false);
        KPI_ComponentTwo_AC.SelectedDimesionWrapper ksw = new   KPI_ComponentTwo_AC.SelectedDimesionWrapper('AccountId.Name',true,'AccountId.Name');
        List<KPI_ComponentTwo_AC.SelectedDimesionWrapper> kswlist = new List<KPI_ComponentTwo_AC.SelectedDimesionWrapper>();
        kkp.SelectedDimensions = new list<KPI_ComponentTwo_AC.SelectedDimesionWrapper>();
        kswlist.add(ksw);
        kkp.availableDimesions = new List<KPI_ComponentTwo_AC.availableDimesionWrapper>();
        List<KPI_ComponentTwo_AC.availableDimesionWrapper> kawlist = new List<KPI_ComponentTwo_AC.availableDimesionWrapper>();
        kawlist.add(kaw);
        kkp.availableDimesions = kawlist;
        kkp.SelectedDimensions = kswlist;
        kkp.availableDateFields = new List<KPI_ComponentTwo_AC.DateFieldWrapper>();
        List<KPI_ComponentTwo_AC.DateFieldWrapper> kdlist = new  List<KPI_ComponentTwo_AC.DateFieldWrapper>();
        kdlist.add(kdf);
        kkp.availableDateFields = kdlist;
        kkp.dataSet='test';
        KPI_ComponentTwo_AC.KPIClass kkp1 = new KPI_ComponentTwo_AC.KPIClass('test1',7, kC.DatasetValuesList,true);
        kkp.selectedMeasures = new  set<string>();
        kkp.selectedMeasures.add('min(analyticscc__Date_2__c_day_epoch)');
        kkp.selectedMeasures.add('sum(Probability )');
        kkp.selectedMeasures.add('avg(CloseDate_day_epoch)');
        kkp.selectedMeasures.add('count(Account ID)');
        kkp.selectedMeasures.add('count ()');
        
        
        
        kkp1.selectedMeasures = new  set<string>();
        kkp1.selectedMeasures.add('min(analyticscc__Date_2__c_day_epoch)');
        kkp1.selectedMeasures.add('sum(Probability )');
        kkp1.selectedMeasures.add('avg(CloseDate_day_epoch)');
        kkp1.selectedMeasures.add('count(Account ID)');
        kkp1.selectedMeasures.add('count ()');
        
        list<KPI_ComponentTwo_AC.KPIClass> kplist = new list<KPI_ComponentTwo_AC.KPIClass>();
        
        KPI_ComponentTwo_AC.MeasureWrapper kmw = new KPI_ComponentTwo_AC.MeasureWrapper('LastModifiedDate');
        kkp.SelectedFilters =  new list<KPI_ComponentTwo_AC.FilterInnerClass>(); 
        InnerClasses.add(kfi);
        kkp.SelectedFilters = InnerClasses;
        kplist.add(kkp);
        kplist.add(kkp1);
        
        kc.KPIDetils=kplist;
        for(KPI_ComponentTwo_AC.KPIClass kck : kplist ) { 
            kck.SelectedFilters=InnerClasses;
        }  
        
        kkp.AddFilter = new list<KPI_ComponentTwo_AC.Filterwrapper> ();                          
        kkp.AddFilter.add(new KPI_ComponentTwo_AC.Filterwrapper('Account', '==','test'  , 6));
        kkp.AddFilter[0].Userlogic = '1';
        kc.FilterMethod();
        Kc.AddFilterNewone();
          //kc.removingRow();
         Kc.verifyError(1,'Sil','1');
        //kc.EditaddRow();
        
       // ;
        kkp.EditFilter = new list<KPI_ComponentTwo_AC.Filterwrapper> ();                          
        kkp.EditFilter.add(new KPI_ComponentTwo_AC.Filterwrapper('Account', '==','test'  , 6));
        kkp.EditFilter[0].Userlogic = '1';
         kc.FilterMethodEdit(); 
       
        Kc.updateFilterNewone();
        list<KPI_ComponentTwo_AC.NewInnerclass> Newinnerlist = new list<KPI_ComponentTwo_AC.NewInnerclass>();
        KPI_ComponentTwo_AC.NewInnerclass NewInner = new KPI_ComponentTwo_AC.NewInnerclass('6','1Amount 680 - 85795tyurewmeasuretyurew680tyurew85795tyurewBetweentyurew1AmounttyurewX1AmountqsytrX1CloseDate_day_epoch 1695 - 1762tyurewmeasuretyurew1695tyurew1762tyurewBetweentyurewX1CloseDate_day_epochtyurewX1CloseDate_day_epochqsytr',6);
        Newinnerlist.add(NewInner);
        
        
        
        kc.KPIDetils=kplist; 
        kc.CloneFromPrevious(DbTemplates.Id);
        kc.KPINameUI='test';
        kc.SaveKPI();
        kc.CloseKPIUI();
        kc.ActTabshide();
        kc.defaultTab1 = true;
        kc.defaultTab2 = false;
        kc.defaultTab3 = false;
        kc.defaultTab4 = false;
        kc.defaultTab5 = false;
        kc.ActTabs();
        kc.Previous();
        
        //kc.getOperatorValues();
        kc.FilterMethod();
        //kc.addRow();
        
        kplist.add(kkp);
        kkp.SelectedFilters = InnerClasses;
       // kkp.AddFilter = kaflist;
        kcf.Counterwrap = 1;
        kaflist.add(kcf);
        kkp.AddFilter = kaflist;
        //Kc.removingEditRow();
        kc.AddFilter();
        kc.RemoveKPIS();
        kc.RemoveFilters();
        //kc.removingRow();
        kc.submit();
        kc.Dimensions('11');
        kc.ReportList();
        kkp.availableDimesions = kawlist;
        kkp.SelectedDimensions = kswlist;
        kc.DimensionNames();
        
        kplist.add(kkp);
        kkp.dataSet='test';
        kkp.availableDateFields = kdlist;
        kc.DateFieldMethod();
        kc.ActTabs();
        kc.DateFieldNames();
        kc.MeasureMethod();
        kc.DateNames();
        //  kc.NextMethod();
        KKP.SelectedFilterList = InnerClasseslists; 
        kc.FilterMethodEdit();  
        
        kplist.add(kkp);
        kkp.SelectedFilters = InnerClasses;
        kkp.AddFilter = kaflist;
        kcf.Counterwrap =1;
        kaflist.add(kcf);
        kkp.EditFilter = kaflist;
        kc.UpdateFilter();
        KKp.EditFilter= kaflist;
        //kc.EditaddRow();
        kkp.SelectedDimensions = kswlist;
        kc.RemoveDimensionNames();
        kkp.SelectedDateFieldlist  =  ksflist;
        kc.RemoveDateNames();
        kc.EditLabelClass2();
        kc.MeasLabelClass2();
        kc.KPIDetils=kplist;
        kkp.SelectedDateFieldlist  =  ksflist;
        kc.SaveEditLabels();
        kc.SaveMeasLabels();
        kc.EditDimClass2();
        kkp.SelectedDimensions = kswlist;
        kc.SaveDimLabels();
        //kc.removingEditRow();
        Kc.DeleteAllValues1 = true;
        KC.DeleteAll();
         Kc.DimensionsNewone();
        Kc.DatesNewone();
        System.assertEquals('Sales Insight',  ads.KPI_Name__c); 
        
        
    }
    
    public  static testMethod void testKPIComponent1() {
        
        System.currentPageReference().getParameters().put('tabid1','1');
        System.currentPageReference().getParameters().put('hiddenKPI1','1');
        System.currentPageReference().getParameters().put('KPIValue','6');
        Apexpages.currentpage().getParameters().put('RowNumberDel1','6'); 
        Apexpages.currentpage().getParameters().put('hidrowcount1','1');
        apexpages.currentpage().getparameters().put('KPIDimen','1');
        apexpages.currentpage().getparameters().put('counterWrap','1');
        apexpages.currentpage().getparameters().put('RowNumber','6');
        apexpages.currentpage().getparameters().put('KPIFilterName','1');
        apexpages.currentpage().getParameters().put('DeleteFil','1');
        apexpages.currentpage().getParameters().put('DeleteKPI','1');
        apexpages.currentpage().getParameters().put('RemoveFilter','1');
        apexpages.currentpage().getParameters().put('index','1');
        apexpages.currentpage().getparameters().put('SelectDimen','1');
        apexpages.currentpage().getparameters().put('SUM','1');
        apexpages.currentpage().getparameters().put('Count','1');
        apexpages.currentpage().getparameters().put('SUMName','1');
        apexpages.currentpage().getparameters().put('DimenCount','1');
        apexpages.currentpage().getparameters().put('DimenName','1');
        apexpages.currentpage().getparameters().put('Rowtrue','1');
        apexpages.currentpage().getparameters().put('Rowsumtrue','1');
        apexpages.currentpage().getparameters().put('RowDimtrue','1');          
        apexpages.currentpage().getparameters().put('RowNumbers','6');
        apexpages.currentpage().getParameters().put('RowNumberCount','1');
        apexpages.currentpage().getParameters().put('RowNumberFilter','6');
        apexpages.currentpage().getParameters().put('AddFilName','1'); 
        apexpages.currentpage().getparameters().put('dimSelecteed','6');
        apexpages.currentpage().getparameters().put('dateSelecteed','6'); 
        apexpages.currentpage().getparameters().put('FilterLogics','1');
        
        KPI_ComponentTwo_AC kc = new KPI_ComponentTwo_AC();
        
        KPI_ComponentTwo_AC.Filterwrapper kcf = new KPI_ComponentTwo_AC.Filterwrapper('Accountid.Name', '==','null',1);
        
        KPI_ComponentTwo_AC.KPIClass kkp = new KPI_ComponentTwo_AC.KPIClass('0Fb36000000H8iHCAS',6, kC.DatasetValuesList,true);
        KPI_ComponentTwo_AC.KPIClass kkp1 = new KPI_ComponentTwo_AC.KPIClass('0Fb36000000H8iHCAS',7, kC.DatasetValuesList,true);
        kkp.selectedMeasures = new  set<string>();
        kkp.selectedMeasures.add('min(analyticscc__Date_2__c_day_epoch)');
        kkp.selectedMeasures.add('sum(Probability )');
        kkp.selectedMeasures.add('avg(CloseDate_day_epoch)');
        kkp.selectedMeasures.add('count(Account ID)');
        kkp.selectedMeasures.add('count ()');
        
        
        kkp1.selectedMeasures = new  set<string>();
        kkp1.selectedMeasures.add('min(analyticscc__Date_2__c_day_epoch)');
        kkp1.selectedMeasures.add('sum(Probability )');
        kkp1.selectedMeasures.add('avg(CloseDate_day_epoch)');
        kkp1.selectedMeasures.add('count(Account ID)');
        kkp1.selectedMeasures.add('count ()');
        
        list<KPI_ComponentTwo_AC.KPIClass> kplist = new list<KPI_ComponentTwo_AC.KPIClass>();
        
        list<selectOption> DatasetValuesList = new list<selectOption>();
        DatasetValuesList.add(new selectOption('Rep.Id','Rep.Name'));
        DatasetValuesList.add(new selectOption('sepId','sep.Name'));
        DatasetValuesList.add(new selectOption('wep.Id','wep.Name'));
        KPI_ComponentTwo_AC.FilterInnerClass kfi = new KPI_ComponentTwo_AC.FilterInnerClass('',6,'Accountid.Name','','==','test','');
        list< KPI_ComponentTwo_AC.FilterInnerClass> InnerClasses = new list< KPI_ComponentTwo_AC.FilterInnerClass>();
        InnerClasses.add(kfi);
        // kc.KPIRec.SelectedFilters = InnerClasses; 
        kplist.add(kkp);
        kplist.add(kkp1);
        
        kc.KPIDetils=kplist;
        for(KPI_ComponentTwo_AC.KPIClass kck : kplist ) {
            kck.SelectedFilters=InnerClasses;
        }     
        kc.KPIDetils=kplist; 
        kc.KPINameUI='hiddenKPI1';
        kc.SaveKPI();
        kc.CloseKPIUI();
        kc.ActTabshide();
        kc.defaultTab1 = true;
        kc.defaultTab2 = false;
        kc.defaultTab3 = false;
        kc.defaultTab4 = false;
        kc.defaultTab5 = false;
        kc.ActTabs();
        kc.KPIDetils=kplist;
        kc.Previous();
        //kc.getOperatorValues();
        kc.FilterMethod();
        //kc.addRow();
        Kc.FilterNames='Sil';
        kc.AddFilter();
        kc.RemoveKPIS();
        kc.RemoveFilters();
        //kc.removingRow();
        kc.submit();
        kc.Dimensions('11');
        kc.ReportList();
        kc.DimensionNames();
        kc.DateFieldMethod();
        kc.DateFieldNames();
        kc.MeasureMethod();
        kc.DateNames();
        //  kc.NextMethod();
        kc.FilterMethodEdit();
        kc.UpdateFilter();
        //kc.EditaddRow();
        kc.RemoveDimensionNames();
        kc.RemoveDateNames();
        kc.KPINameUI = 'test';
        Kc.sortSelectOptions(DatasetValuesList);
        Kc.verifyError(1,'Sil','1');
        
        System.assertEquals('test', kc.KPINameUI);
    }
    
}