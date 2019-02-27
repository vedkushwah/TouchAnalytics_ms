@isTest 
public class KPIComponent_AC_Test {
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
        ads.KPI_Name__c  ='Sales Insight';   
        ads.Measure_API__c   ='sum(\'LastModifiedDate_day_epoch\'), min(\'analyticscc__Date_2__c_day_epoch\'),avg(\'CloseDate_day_epoch\'),count(),count(\'AccountId\')';    
        ads.Measure_Name__c  ='sum(LastModifiedDate_day_epoch),min(analyticscc__Date_2__c_day_epoch),avg(CloseDate_day_epoch),count (),count(Account ID)';   
        ads.RowNumber__c=1;  
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
        KPIs.RowNumber__c = 5;
        KPIs.AliasMeasure_API__c = 'sum_CloseDate_day_epoch,min_analyticscc__Date_2__c_day_epoch,avg_CloseDate_day_epoch,count,unique_AccountId';
        KPIs.CompactMeasure_API__c = '[\"sum\",\"LastModifiedDate_day_epoch\"],[\"min\",\"analyticscc__Date_2__c_day_epoch\"],[\"avg\",\"CloseDate_day_epoch\"],[\"count\",\"*\"],[\"count\",\"AccountId\"]';
        KPIs.Dimension_API__c = 'AccountId.Name,LastModifiedDate,LastModifiedDate_Year'; 
        KPIs.Measure_API__c = 'sum(\'LastModifiedDate_day_epoch\'), min(\'analyticscc__Date_2__c_day_epoch\'),avg(\'CloseDate_day_epoch\'),count(),count(\'AccountId\')';
        KPIs.Date_API__c = 'LastModifiedDate,analyticscc__Date_2__c,CloseDate';
        KPIs.DB_Template__c = DBTemplates.Id;
        KPIs.Date_Label__c = 'Last Modified Date,Date 2,Close Date';
        KPIs.Filter_code__c = '1Amount 680 - 85795tyurewmeasuretyurew680tyurew85795tyurewBetweentyurew1AmounttyurewX1AmountqsytrX1CloseDate_day_epoch 1695 - 1762tyurewmeasuretyurew1695tyurew1762tyurewBetweentyurewX1CloseDate_day_epochtyurewX1CloseDate_day_epochqsytr';
       // KPIs.SelectedFilterList =
        insert KPIs;
         list<KPIs__c> KPIlist = new list<KPIs__c>();				      
        KPIlist.add(KPIs);
        
        System.currentPageReference().getParameters().put('tabid','1');
        System.currentPageReference().getParameters().put('hiddenKPI','1');
        System.currentPageReference().getParameters().put('KPIValue','1');
        
        apexpages.currentpage().getparameters().put('FilterNamesandVal','1Amount 680 - 85795tyurewmeasuretyurew680tyurew85795tyurewBetweentyurew1AmounttyurewX1AmountqsytrX1CloseDate_day_epoch 1695 - 1762tyurewmeasuretyurew1695tyurew1762tyurewBetweentyurewX1CloseDate_day_epochtyurewX1CloseDate_day_epochqsytr');
        apexpages.currentpage().getparameters().put('DimhiddenKPI','1AmountDimsval1AmountDimsvalx1AmountNewDimension'); 
         apexpages.currentpage().getparameters().put('DatehiddenKPI','created dateDimsvalcreated dateDimsvalcreateddateNewDimension');
         apexpages.currentpage().getParameters().put('Menuitemsval','<li 1Amountcntrws1Amountcntrwsx1Amountcntrws1Amountcntrws1Amountrwsallval');
		 
		 
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
        apexpages.currentpage().getparameters().put('SUM','1');
        apexpages.currentpage().getparameters().put('Count','1');
        apexpages.currentpage().getparameters().put('SUMName','1');
        apexpages.currentpage().getparameters().put('DimenCount','1');
        apexpages.currentpage().getparameters().put('DimenName','1');
        apexpages.currentpage().getparameters().put('Rowtrue','true');
        apexpages.currentpage().getparameters().put('Rowsumtrue','true');
        apexpages.currentpage().getparameters().put('RowDimtrue','true');              
        apexpages.currentpage().getparameters().put('RowNumbers','1');
        apexpages.currentpage().getParameters().put('RowNumberCount','1');
        apexpages.currentpage().getParameters().put('RowNumberFilter','1');
        apexpages.currentpage().getParameters().put('AddFilName','Test');
        apexpages.currentpage().getparameters().put('dimSelecteed','1');
        apexpages.currentpage().getparameters().put('dateSelecteed','1');
        System.currentPageReference().getParameters().put('RowValues','1');
        System.currentPageReference().getParameters().put('MeasTopic','avg(CloseDate_day_epoch)');
        System.currentPageReference().getParameters().put('EditTopic','LastModifiedDate');
        System.currentPageReference().getParameters().put('EditDim','AccountId.Name'); 
        System.currentPageReference().getParameters().put('FilterNamesvalues','Test'); 
        apexpages.currentpage().getparameters().put('FilterLogics','1');
        
        
        
        
        
        
        KPIComponent_AC kc = new KPIComponent_AC();
        
        
        KPIComponent_AC.KPIClass kkp = new KPIComponent_AC.KPIClass('0Fb36000000H8iHCAS',1, kC.DatasetValuesList,true);
        KPIComponent_AC.Filterwrapper kcf = new KPIComponent_AC.Filterwrapper('Accountid.Name', '==','null',1);
        list<KPIComponent_AC.Filterwrapper> kaflist = new list<KPIComponent_AC.Filterwrapper>();
        kcf.Counterwrap = 1;
        kcf.UserLogic='1 AND 2';
        kcf.filterRowCount=1;
        kcf.FilterNames = new list<KPIComponent_AC.Filterwrapper> ();
        
        kkp.AddFilter = new list<KPIComponent_AC.Filterwrapper> ();
        kkp.EditFilter = new list<KPIComponent_AC.Filterwrapper> ();
         kcf.Counterwrap = 1;
        kaflist.add(kcf);
        kkp.EditFilter = kaflist;
        // kkp.FilterNames= kaflist;
        //  KPIComponent_AC.DateFieldWrapper kdf = new KPIComponent_AC.DateFieldWrapper('Accountid.Name');
        
        KPIComponent_AC.availableDimesionWrapper  kaw = new  KPIComponent_AC.availableDimesionWrapper('AccountId.Name',true);
        kkp.availableDimesions = new List<KPIComponent_AC.availableDimesionWrapper>();
        List<KPIComponent_AC.availableDimesionWrapper> kawlist = new List<KPIComponent_AC.availableDimesionWrapper>();
        kawlist.add(kaw);
        kkp.availableDimesions = kawlist;
        
        kkp.availableDateFields = new List<KPIComponent_AC.DateFieldWrapper>();
        List<KPIComponent_AC.DateFieldWrapper> kdlist = new  List<KPIComponent_AC.DateFieldWrapper>();
        // kdlist.add(kdf);
        kkp.availableDateFields = kdlist;
        kkp.dataSet='test';
        KPIComponent_AC.KPIClass kkp1 = new KPIComponent_AC.KPIClass('test',2, kC.DatasetValuesList,true);
        set<string> selectedMeasures = new  set<string>();
        selectedMeasures.add('min(analyticscc__Date_2__c_day_epoch)');
        selectedMeasures.add('sum(Probability )');
        selectedMeasures.add('avg(CloseDate_day_epoch)');
        selectedMeasures.add('count(Account ID)');
        selectedMeasures.add('count ()');
        
        kkp.selectedDateFields = new set<string>();
        kkp.selectedDateFields.add('Last Modified Date');
        kkp.selectedDateFields.add('Date 2');
        kkp.selectedDateFields.add('Close Date');
        
        
        
        /*kkp.selectedDimension = new set<string>();
        kkp.selectedDimension.add('AccountId.Name');
        kkp.selectedDimension.add('LastModifiedDate');
        kkp.selectedDimension.add('LastModifiedDate_Year');*/
        
        
        
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
        
        /*kkp1.selectedDimension = new set<string>();
        kkp1.selectedDimension.add('AccountId.Name');
        kkp1.selectedDimension.add('LastModifiedDate');
        kkp1.selectedDimension.add('LastModifiedDate_Year');*/
        
        list<KPIComponent_AC.KPIClass> kplist = new list<KPIComponent_AC.KPIClass>();
        list<selectOption> DatasetValuesList = new list<selectOption>();
        DatasetValuesList.add(new selectOption('Rep.Id','Rep.Name'));
        DatasetValuesList.add(new selectOption('sepId','sep.Name'));
        DatasetValuesList.add(new selectOption('wep.Id','wep.Name'));
        KPIComponent_AC.FilterInnerClass kfi = new KPIComponent_AC.FilterInnerClass('',1,'Accountid.Name','','==','test','');
        list< KPIComponent_AC.FilterInnerClass> InnerClasses = new list< KPIComponent_AC.FilterInnerClass>();
        KPIComponent_AC.MeasureWrapper kmw = new KPIComponent_AC.MeasureWrapper('LastModifiedDate');
        KPIComponent_AC.SelectedDateFieldWrapper ksf = new KPIComponent_AC.SelectedDateFieldWrapper('LastModifiedDate',true,'LastModifiedDate');
        kkp.SelectedDateFieldlist = new list<KPIComponent_AC.SelectedDateFieldWrapper>();
        list<KPIComponent_AC.SelectedDateFieldWrapper> ksflist = new list<KPIComponent_AC.SelectedDateFieldWrapper>();
        ksflist.add(ksf);
        kkp.SelectedDateFieldlist  =  ksflist;
        
        KPIComponent_AC.SelectedDimesionWrapper ksw = new   KPIComponent_AC.SelectedDimesionWrapper('AccountId.Name',true,'AccountId.Name');
        List<KPIComponent_AC.SelectedDimesionWrapper> kswlist = new List<KPIComponent_AC.SelectedDimesionWrapper>();
        kkp.SelectedDimensions = new list<KPIComponent_AC.SelectedDimesionWrapper>();
        kswlist.add(ksw);
        kkp.SelectedDimensions = kswlist;
        
        kkp.SelectedFilters =  new list<KPIComponent_AC.FilterInnerClass>(); 
        InnerClasses.add(kfi);
        kkp.SelectedFilters = InnerClasses;
        kplist.add(kkp);
        kplist.add(kkp1);
        
        kc.KPIDetils=kplist;
        for(KPIComponent_AC.KPIClass kck : kplist ) { 
            kck.SelectedFilters=InnerClasses;
        } 
        
       
       KKP.AddFilter = new list<KPIComponent_AC.Filterwrapper> ();                          
        KKP.AddFilter.add(new KPIComponent_AC.Filterwrapper('Account', '==','Test'  , 1));
        KKP.AddFilter[0].Userlogic = '1';
        kc.FilterMethod();
         Kc.AddFilterNew();
          //kc.removingRow();
         Kc.verifyError(1,'Sil','1');
        //kc.EditaddRow();
         KKP.EditFilter = new list<KPIComponent_AC.Filterwrapper>();                          
        KKP.EditFilter.add(new KPIComponent_AC.Filterwrapper('Account', '==','test'  , 1));
        KKP.EditFilter[0].Userlogic = '1';
        kc.FilterMethodEdit(); 
        Kc.updateFilterNew();
        kkp.selectedMeasures  = SelectedMeasures;
        
        list< KPIComponent_AC.FilterInnerClassEdit> Ficerec = new list< KPIComponent_AC.FilterInnerClassEdit>();
        KPIComponent_AC.FilterInnerClassEdit Fice = new KPIComponent_AC.FilterInnerClassEdit('Betweens','typeofSelect','2','6','filterCon','selectedfield','Fieldname','FilterIds','FieldAPI','system.today()','system.today()',1);
        Ficerec.add(Fice);
         kc.RemoveFilters();
        list< KPIComponent_AC.WrapSelectedFilterList> InnerClasseslists = new list< KPIComponent_AC.WrapSelectedFilterList>();
        KPIComponent_AC.WrapSelectedFilterList kfiList = new KPIComponent_AC.WrapSelectedFilterList('Test',kkp.SelectedFilters,'\'Accountid.Name\' != Null',1, '1');   
        InnerClasseslists.add(kfiList);
       // kkp.SelectedFilterList = new list<KPI_ComponentTwo_AC.WrapSelectedFilterList>();   
        kkp.SelectedFilterList = InnerClasseslists;
        
        
        
        kc.KPIDetils=kplist; 
        kc.KPINameUI='test';
        kc.SaveKPI1();
        kkp.SelectedDimensions = kswlist;
        kkp.SelectedDateFieldlist  =  ksflist;
        kc.SaveEditLabels();
        kc.SaveMeasLabels();
        kc.SaveDimLabels();
        kc.CloseKPIUI();
        kc.ActTabshide();
        kc.defaultTab1 = true;
        kc.defaultTab2 = false;
        kc.defaultTab3 = false;
        kc.defaultTab4 = false;
        kc.defaultTab5 = false;
        kc.Filternames = 'Sil';
        kc.ActTabs1();
        kc.Previous();
        //Kc.removingEditRow();
        //kc.getOperatorValues();
        kc.FilterMethod();
        //kc.addRow();
        kc.Filternames = 'Sil';   
        kc.AddFilter();
        kc.RemoveKPIS();
        kc.RemoveFilters();
        //kc.removingRow();
        kc.submit();
        kc.Dimensions('11');
        kc.ReportList();
        kplist.add(kkp);
        kawlist.add(kaw);
        kkp.availableDimesions = kawlist;
        kc.DimensionNames();
        
        kplist.add(kkp);
        kkp.dataSet='test';
        kc.DateFieldMethod();
        kc.DateFieldNames();
        kc.MeasureMethod();
        kc.DateNames();
        //  kc.NextMethod(); 
        kc.FilterMethodEdit(); 
        
         
        kc.RemoveDimensionNames();
        kc.RemoveDateNames();
        
        kplist.add(kkp);
        kkp.SelectedFilters = InnerClasses;
        kkp.AddFilter = kaflist;
        kcf.Counterwrap = 1;
        kaflist.add(kcf);
        kkp.EditFilter = kaflist;
        kc.UpdateFilter(); 
        Kc.sortSelectOptions(DatasetValuesList);
        Kc.verifyError(1,'Sil','1');
      // Kc.verifyErrorEdit(5,'Fl','(\'AccountId.Name\' == \\\"cscsc\\\")');
        list<KPIComponent_AC.NewInnerclass> Innrec = new list<KPIComponent_AC.NewInnerclass>();
        KPIComponent_AC.NewInnerclass Inn = new KPIComponent_AC.NewInnerclass('1', 'typeofSelect', 1);
        Innrec.add(Inn);
        KC.CloneFromPrevious(DbTemplates.Id);
        Kc.DeleteAllValues = true;
        KC.DeleteAll();
        
        Kc.DimensionsNew();
        Kc.DatesNew();
        
        System.assertEquals('Sales Insight',ads.KPI_Name__c);
        
    }
    
    public  static testMethod void testKPIComponent1() {
        
        
        
        
        System.currentPageReference().getParameters().put('tabid','1');
        System.currentPageReference().getParameters().put('hiddenKPI','1');
        System.currentPageReference().getParameters().put('KPIValue','1');
        System.currentPageReference().getParameters().put('RowValues','1');
        System.currentPageReference().getParameters().put('MeasTopic','avg(CloseDate_day_epoch)');
        System.currentPageReference().getParameters().put('EditTopic','LastModifiedDate');
        System.currentPageReference().getParameters().put('EditDim','AccountId.Name');
        apexpages.currentpage().getparameters().put('KPIDimen','1');
        apexpages.currentpage().getparameters().put('counterWrap','1');
        apexpages.currentpage().getparameters().put('RowNumber','1');
        apexpages.currentpage().getparameters().put('KPIFilterName','1');
        apexpages.currentpage().getParameters().put('DeleteFil','1');
        apexpages.currentpage().getParameters().put('DeleteKPI','1');
        apexpages.currentpage().getParameters().put('RemoveFilter','1');
        Apexpages.currentpage().getParameters().put('RowNumberDel','1');
        Apexpages.currentpage().getParameters().put('hidrowcount','1');
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
        apexpages.currentpage().getparameters().put('RowNumbers','1');
        apexpages.currentpage().getParameters().put('RowNumberCount','1');
        apexpages.currentpage().getParameters().put('RowNumberFilter','1');
        apexpages.currentpage().getParameters().put('AddFilName','1');
        apexpages.currentpage().getparameters().put('dimSelecteed','1');
        apexpages.currentpage().getparameters().put('dateSelecteed','1');
        apexpages.currentpage().getparameters().put('FilterLogics','1');
        KPIComponent_AC kc = new KPIComponent_AC();
        
        KPIComponent_AC.Filterwrapper kcf = new KPIComponent_AC.Filterwrapper('Accountid.Name', '==','null',1);
        KPIComponent_AC.KPIClass kkp = new KPIComponent_AC.KPIClass('0Fb36000000H8iHCAS',1, kC.DatasetValuesList,true);
        KPIComponent_AC.KPIClass kkp1 = new KPIComponent_AC.KPIClass('0Fb36000000H8iHCAS',2, kC.DatasetValuesList,true);
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
        
        /*kkp.selectedDimension = new set<string>();
        kkp.selectedDimension.add('AccountId.Name');
        kkp.selectedDimension.add('LastModifiedDate');
        kkp.selectedDimension.add('LastModifiedDate_Year');*/
                
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
        
        /*kkp1.selectedDimension = new set<string>();
        kkp1.selectedDimension.add('AccountId.Name');
        kkp1.selectedDimension.add('LastModifiedDate');
        kkp1.selectedDimension.add('LastModifiedDate_Year');*/
        
        list<KPIComponent_AC.KPIClass> kplist = new list<KPIComponent_AC.KPIClass>();
        
        
        KPIComponent_AC.FilterInnerClass kfi = new KPIComponent_AC.FilterInnerClass('',1,'Accountid.Name','','==','test','');
        list< KPIComponent_AC.FilterInnerClass> InnerClasses = new list< KPIComponent_AC.FilterInnerClass>();
        InnerClasses.add(kfi);
        // kc.KPIRec.SelectedFilters = InnerClasses; 
        kplist.add(kkp);
        kplist.add(kkp1);
        
        kc.KPIDetils=kplist;
        for(KPIComponent_AC.KPIClass kck : kplist ) {
            kck.SelectedFilters=InnerClasses;
        }     
        kc.KPIDetils=kplist; 
        kc.KPINameUI='test';
        
        
        kc.SaveKPI1();
        kc.CloseKPIUI();
        kc.ActTabshide();
        kc.defaultTab1 = true;
        kc.defaultTab2 = false;
        kc.defaultTab3 = false;
        kc.defaultTab4 = false;
        kc.defaultTab5 = false;
        kc.ActTabs1();
        kc.Previous();
        
        //kc.getOperatorValues();
        kc.FilterMethod();
        //kc.addRow();
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
        kc.EditLabelClass1();
        kc.MeasLabelClass1();
        kc.SaveEditLabels();
        kc.SaveMeasLabels();
        kc.SaveDimLabels();
        kc.EditDimClass1();
        kc.KPINameUI='test';
         
        System.assertEquals('test',kc.KPINameUI);
    }
    
}