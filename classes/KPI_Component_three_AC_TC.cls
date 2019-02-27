@isTest
private class KPI_Component_three_AC_TC {
    
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
        ads.RowNumber__c=11;	
        insert ads;
        list<DB_Template__c> Dblist = new list<DB_Template__c>();
        DB_Template__c DBTemplates = new DB_Template__c();
        DBTemplates.DB_Name__c = 'Sales KPI';
        DBTemplates.Type__c = 'Multi KPI';
        insert DBTemplates;
        Dblist.add(DBTemplates);
        
        KPIs__c KPIs = new KPIs__c();
        KPIs.Dataset_Id__c = '0Fb36000000H8iHCAS';
        KPIs.Dataset_Name__c = 'All_Opportunities'; 
        KPIs.Dimension_Label__c = 'AccountId.Name,LastModifiedDate,LastModifiedDate_Year'; 
        KPIs.User_Logic__c = '1';
        KPIs.Filter_Logic__c = '(\'AccountId.Name\' == \\\"cscsc\\\")';  
        KPIs.Filter_Name__c = 'F1;F1';
        KPIs.KPI_Name__c = 'Sales';
        KPIs.Measure_Label__c = 'sum(LastModifiedDate_day_epoch),min(analyticscc__Date_2__c_day_epoch),avg(CloseDate_day_epoch),count (),count(Account ID)';
        KPIs.RowNumber__c = 11;
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
		 
        apexpages.currentpage().getparameters().put('dimSelecteed','11');
        apexpages.currentpage().getparameters().put('dateSelecteed','1'); 
        System.currentPageReference().getParameters().put('tabid2','1');
        System.currentPageReference().getParameters().put('hiddenKPI2','Test');
        System.currentPageReference().getParameters().put('KPIValue2','11'); 
        apexpages.currentpage().getparameters().put('KPIDimen','11');
        apexpages.currentpage().getparameters().put('counterWrap','1');
        apexpages.currentpage().getparameters().put('RowNumber','11');
        Apexpages.currentpage().getParameters().put('RowNumberDel2','11'); 
        Apexpages.currentpage().getParameters().put('hidrowcount2','1');
        apexpages.currentpage().getparameters().put('KPIFilterName','Test');
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
        apexpages.currentpage().getparameters().put('Rowsumtrue','false');
        apexpages.currentpage().getparameters().put('RowDimtrue','true');          
        apexpages.currentpage().getparameters().put('RowNumbers','11');
        apexpages.currentpage().getParameters().put('RowNumberCount','1');
        apexpages.currentpage().getParameters().put('RowNumberFilter','1');
        apexpages.currentpage().getParameters().put('AddFilName','Test');
        apexpages.currentpage().getParameters().put('RowValues2','11');
        apexpages.currentpage().getParameters().put('EditTopic','createddate');
        apexpages.currentpage().getParameters().put('MeasTopic','Amount');
        apexpages.currentpage().getparameters().put('FilterLogics','1');
        System.currentPageReference().getParameters().put('EditDim','AccountId.Name');
        
        KPI_Component_three_AC kc = new KPI_Component_three_AC();
        
        KPI_Component_three_AC.KPIClass kkp = new KPI_Component_three_AC.KPIClass('0Fb36000000H8iHCAS',11, kC.DatasetValuesList,true);
        KPI_Component_three_AC.Filterwrapper kcf = new KPI_Component_three_AC.Filterwrapper('Accountid.Name', '==','null',11); 
        KPI_Component_three_AC.SelectedDateFieldWrapper ksf = new KPI_Component_three_AC.SelectedDateFieldWrapper('createddate',false,'createddate');
        kkp.SelectedDateFieldlist = new list<KPI_Component_three_AC.SelectedDateFieldWrapper>();
        list<KPI_Component_three_AC.SelectedDateFieldWrapper> ksflist = new list<KPI_Component_three_AC.SelectedDateFieldWrapper>();
        ksflist.add(ksf);
        kkp.SelectedDateFieldlist  =  ksflist;
        kkp.KPIRowNumber=11;
        list<KPI_Component_three_AC.Filterwrapper> kaflist = new list<KPI_Component_three_AC.Filterwrapper>();
        kcf.Counterwrap = 1;
        kcf.UserLogic='1';
        kcf.filterRowCount=11;
        kcf.FilterNames = new list<KPI_Component_three_AC.Filterwrapper> ();
        kaflist.add(kcf);
        kkp.AddFilter = new list<KPI_Component_three_AC.Filterwrapper> ();
        kkp.EditFilter = new list<KPI_Component_three_AC.Filterwrapper> ();
       
        kkp.AddFilter = kaflist;
        kkp.EditFilter = kaflist;
        // kkp.FilterNames= kaflist;
        // KPI_Component_three_AC.DateFieldWrapper kdf = new KPI_Component_three_AC.DateFieldWrapper('Accountid.Name');
        KPI_Component_three_AC.availableDimesionWrapper  kaw = new  KPI_Component_three_AC.availableDimesionWrapper('AccountId.Name',true);
        KPI_Component_three_AC.SelectedDimesionWrapper ksw = new   KPI_Component_three_AC.SelectedDimesionWrapper('AccountId.Name',true,'AccountId.Name');
        List<KPI_Component_three_AC.SelectedDimesionWrapper> kswlist = new List<KPI_Component_three_AC.SelectedDimesionWrapper>();
       // kkp.SelectedDimensions = new list<KPI_Component_three_AC.SelectedDimesionWrapper>();
        kswlist.add(ksw);
        //kkp.availableDimesions = new List<KPI_Component_three_AC.availableDimesionWrapper>();
        List<KPI_Component_three_AC.availableDimesionWrapper> kawlist = new List<KPI_Component_three_AC.availableDimesionWrapper>();
        kawlist.add(kaw);
        kkp.availableDimesions = kawlist;
        kkp.SelectedDimensions = kswlist;
        kkp.availableDateFields = new List<KPI_Component_three_AC.DateFieldWrapper>();
        List<KPI_Component_three_AC.DateFieldWrapper> kdlist = new  List<KPI_Component_three_AC.DateFieldWrapper>();
        // kdlist.add(kdf);
        kkp.availableDateFields = kdlist;
        kkp.dataSet='test';
        KPI_Component_three_AC.KPIClass kkp1 = new KPI_Component_three_AC.KPIClass('test',2, kC.DatasetValuesList,true);
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
        
        list<KPI_Component_three_AC.KPIClass> kplist = new list<KPI_Component_three_AC.KPIClass>();
        
        list<selectOption> DatasetValuesList = new list<selectOption>();
        DatasetValuesList.add(new selectOption('Rep.Id','Rep.Name'));
        DatasetValuesList.add(new selectOption('sepId','sep.Name'));
        DatasetValuesList.add(new selectOption('wep.Id','wep.Name'));
        KPI_Component_three_AC.FilterInnerClass kfi = new KPI_Component_three_AC.FilterInnerClass('',1,'Accountid.Name','','==','test','');
        list< KPI_Component_three_AC.FilterInnerClass> InnerClasses = new list< KPI_Component_three_AC.FilterInnerClass>();
        
        KPI_Component_three_AC.MeasureWrapper kmw = new KPI_Component_three_AC.MeasureWrapper('LastModifiedDate');
        
        
        list< KPI_Component_three_AC.NewInnerclass> InnerClasslist = new list< KPI_Component_three_AC.NewInnerclass>();
        KPI_Component_three_AC.NewInnerclass newinnerrec = new KPI_Component_three_AC.NewInnerclass('2','typeofSelect',1);
        InnerClasslist.add(newinnerrec);
        
        list<KPI_Component_three_AC.MeasureAngularclass> innermeasureclass = new list<KPI_Component_three_AC.MeasureAngularclass>();
         KPI_Component_three_AC.MeasureAngularclass ma = new  KPI_Component_three_AC.MeasureAngularclass('test','test','test','test','test');
        innermeasureclass.add(ma);
        
        list< KPI_Component_three_AC.FilterInnerClassEdit> Ficerec = new list< KPI_Component_three_AC.FilterInnerClassEdit>();
        KPI_Component_three_AC.FilterInnerClassEdit Fice = new KPI_Component_three_AC.FilterInnerClassEdit('Betweens','typeofSelect','2','6','filterCon','selectedfield','Fieldname','FilterIds','FieldAPI','system.today()','system.today()',1);
        Ficerec.add(Fice);
        
        kkp.SelectedFilters =  new list<KPI_Component_three_AC.FilterInnerClass>(); 
        InnerClasses.add(kfi);
        kkp.SelectedFilters = InnerClasses;
        kplist.add(kkp);
        kplist.add(kkp1);
        
        kc.KPIDetils=kplist;
        for(KPI_Component_three_AC.KPIClass kck : kplist ) { 
            kck.SelectedFilters=InnerClasses;
        } 
        
        kkp.AddFilter = new list<KPI_Component_three_AC.Filterwrapper> ();                          
        kkp.AddFilter.add(new KPI_Component_three_AC.Filterwrapper('Account', '==','test'  , 1));
        kkp.AddFilter[0].Userlogic = '1';
        
        
        
        Kc.AddFilterNewtwo();
        kkp.EditFilter = new list<KPI_Component_three_AC.Filterwrapper> ();                          
        kkp.EditFilter.add(new KPI_Component_three_AC.Filterwrapper('Account', '==','test'  , 1));
        kkp.EditFilter[0].Userlogic = '1';
        Kc.updateFilterNewtwo();
        
        
        Kc.SelectedButtonValue = '1';    
        kc.KPIDetils=kplist; 
        kc.KPINameUI='test';
        List<KPI_Component_three_AC.WrapSelectedFilterList> wsfList = new List<KPI_Component_three_AC.WrapSelectedFilterList>();
        KPI_Component_three_AC.WrapSelectedFilterList wsf = new KPI_Component_three_AC.WrapSelectedFilterList('Test', kkp.SelectedFilters, '\'Accountid.Name\' != Null', 0, '1');
        wsfList.add(wsf);
        kc.SaveKPI2();
        kkp.SelectedDateFieldlist  =  ksflist;
        
        
        kc.TableId=false;
        kc.isTrue=true;
        // kc.AddFilterNewtwo();
        // kc.AddFilterNewtwo();
        Kc.EditLabelClass();
        Kc.MeasLabelClass();
        Kc.SaveEditLabels();
        Kc.SaveMeasLabels();
        Kc.EditDimClass();
        Kc.SaveDimLabels();
        
        kc.CloseKPIUI();
        kc.ActTabshide();
        kc.defaultTab1 = true;
        kc.defaultTab2 = false;
        kc.defaultTab3 = false;
        kc.defaultTab4 = false;
        kc.defaultTab5 = false;
        kc.ActTabs2();
        kc.Previous();
        
        //kc.getOperatorValues();
        kc.FilterMethod();
        kplist.add(kkp);
        kcf.Counterwrap = 1;
        kcf.UserLogic='1';
        kcf.filterRowCount=11;
        kaflist.add(kcf);
        kkp.AddFilter = kaflist;
        kkp.EditFilter = kaflist;
        //kc.addRow();
        kc.FilterNames = 'Sil';
        kc.AddFilter();
        kkp.NewMeasurevarlist=innermeasureclass;
       // kkp.selectedMeasures.add('count ()');
       // kc.RemoveKPIS();
        kc.RemoveFilters();
        //kc.removingRow();
        kc.submit();
        kc.Dimensions('11');
        kc.ReportList();
        kplist.add(kkp);
        kawlist.add(kaw);
        kkp.availableDimesions = kawlist;
        kc.DimensionNames();
        //Kc.removingEditRow();
        kplist.add(kkp);
        kkp.dataSet='test';
        kc.DateFieldMethod();
        kc.DateFieldNames();
        kc.MeasureMethod();
        kc.DateNames();
        kplist.add(kkp);
        kaflist.add(kcf);
        kkp.AddFilter = kaflist;
        kkp.EditFilter = kaflist;
        kc.FilterMethodEdit();   
        
        kplist.add(kkp); 
        kkp.SelectedFilters = InnerClasses;
        kkp.AddFilter = kaflist;
        kcf.Counterwrap = 1;
        kaflist.add(kcf);
        kkp.EditFilter = kaflist;
        kc.UpdateFilter();
        //kc.EditaddRow();
        kc.RemoveDimensionNames();
        kc.RemoveDateNames();
        kc.SubmitResults();
        Kc.sortSelectOptions(DatasetValuesList);
        Kc.verifyError(11,'Sil','1');
        Kc.verifyErrorEdit(11,'Fl','(\'AccountId.Name\' == \\\"cscsc\\\")');
        String NewId = DbTemplates.Id;
        KC.CloneFromPrevious(NewId);
        Kc.DeleteAllValues2 = true;
        KC.DeleteAll();
        Kc.DimensionsNewtwo();
        Kc.DatesNewtwo();
        System.assertEquals('Sales Insight',ads.KPI_Name__c);
        
        
    }
    
    public  static testMethod void testKPIComponent1() {
        
        apexpages.currentpage().getparameters().put('FilterNamesandVal','1Amount 680 - 85795tyurewmeasuretyurew680tyurew85795tyurewBetweentyurew1AmounttyurewX1AmountqsytrX1CloseDate_day_epoch 1695 - 1762tyurewmeasuretyurew1695tyurew1762tyurewBetweentyurewX1CloseDate_day_epochtyurewX1CloseDate_day_epochqsytr');
        System.currentPageReference().getParameters().put('tabid2','1');
        System.currentPageReference().getParameters().put('hiddenKPI','1');
        System.currentPageReference().getParameters().put('KPIValue2','1');
        apexpages.currentpage().getparameters().put('KPIDimen','11');
        apexpages.currentpage().getparameters().put('counterWrap','1');
        apexpages.currentpage().getparameters().put('RowNumber','11');
        apexpages.currentpage().getparameters().put('KPIFilterName','1');
        apexpages.currentpage().getParameters().put('DeleteFil','1');
        apexpages.currentpage().getParameters().put('DeleteKPI','1');
        apexpages.currentpage().getParameters().put('RemoveFilter','1');
        Apexpages.currentpage().getParameters().put('RowNumberDel2','11'); 
        Apexpages.currentpage().getParameters().put('hidrowcount2','1');
        apexpages.currentpage().getParameters().put('index','1');
        apexpages.currentpage().getparameters().put('SelectDimen','1');
        apexpages.currentpage().getparameters().put('SUM','1');
        apexpages.currentpage().getparameters().put('Count','1');
        apexpages.currentpage().getparameters().put('SUMName','1');
        apexpages.currentpage().getparameters().put('DimenCount','1');
        apexpages.currentpage().getparameters().put('DimenName','1');
        apexpages.currentpage().getparameters().put('Rowtrue','1');
        apexpages.currentpage().getparameters().put('Rowsumtrue','false');
        apexpages.currentpage().getparameters().put('RowDimtrue','1');          
        apexpages.currentpage().getparameters().put('RowNumbers','11');
        apexpages.currentpage().getParameters().put('RowNumberCount','1');
        apexpages.currentpage().getParameters().put('RowNumberFilter','1');
        apexpages.currentpage().getParameters().put('AddFilName','1');
        apexpages.currentpage().getparameters().put('dimSelecteed','11');
        apexpages.currentpage().getparameters().put('dateSelecteed','1');
        
        KPI_Component_three_AC kc = new KPI_Component_three_AC();
        
        KPI_Component_three_AC.Filterwrapper kcf = new KPI_Component_three_AC.Filterwrapper('Accountid.Name', '==','null',1);
        KPI_Component_three_AC.KPIClass kkp = new KPI_Component_three_AC.KPIClass('0Fb36000000H8iHCAS',11, kC.DatasetValuesList,true);
        KPI_Component_three_AC.KPIClass kkp1 = new KPI_Component_three_AC.KPIClass('0Fb36000000H8iHCAS',12, kC.DatasetValuesList,true);
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
        
        list<KPI_Component_three_AC.KPIClass> kplist = new list<KPI_Component_three_AC.KPIClass>();
        
        
        KPI_Component_three_AC.FilterInnerClass kfi = new KPI_Component_three_AC.FilterInnerClass('',1,'Accountid.Name','','==','test','');
        list< KPI_Component_three_AC.FilterInnerClass> InnerClasses = new list< KPI_Component_three_AC.FilterInnerClass>();
        InnerClasses.add(kfi);
        // kc.KPIRec.SelectedFilters = InnerClasses; 
        kplist.add(kkp);
        kplist.add(kkp1);
        
        list< KPI_Component_three_AC.NewInnerclass> InnerClasslist = new list< KPI_Component_three_AC.NewInnerclass>();
        KPI_Component_three_AC.NewInnerclass newinnerrec = new KPI_Component_three_AC.NewInnerclass('2','typeofSelect',1);
        InnerClasslist.add(newinnerrec);
        
        kc.KPIDetils=kplist;
        for(KPI_Component_three_AC.KPIClass kck : kplist ) {
            kck.SelectedFilters=InnerClasses;
        }     
        kc.KPIDetils=kplist; 
        kc.KPINameUI='test'; 
        kc.SaveKPI2();
        kc.CloseKPIUI();
        kc.ActTabshide();
        kc.defaultTab1 = true; 
        kc.defaultTab2 = false;  
        kc.defaultTab3 = false;
        kc.defaultTab4 = false;
        kc.defaultTab5 = false;
        kc.ActTabs2();
        kc.Previous();
        
        //kc.getOperatorValues();
        kc.FilterMethod();
        //kc.addRow();
        kc.AddFilter();
       // kc.RemoveKPIS();
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
        kc.SubmitResults();
        
        kc.KPINameUI='test';
        
        System.assertEquals('test',kc.KPINameUI);
    }
    
}