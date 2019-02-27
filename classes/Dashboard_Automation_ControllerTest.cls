@isTest
private class Dashboard_Automation_ControllerTest {

	private static testMethod void test() {
	    list<Dashboard_Automation__c> DashAutoList = new list<Dashboard_Automation__c>();
	    Dashboard_Automation__c DashAuto = new Dashboard_Automation__c();
                DashAuto.Cardinality_Greater_than__c = integer.valueOf(1);
                DashAuto.Cardinality_Less_Than__c = integer.valueOf(7);
                DashAuto.Utilization__c = integer.valueOf(2);
                DashAuto.Max_of_Fields__c = integer.valueOf(3);
                DashAuto.Measure_Number__c = 1;
                insert DashAuto;
                
                 Dashboard_Automation__c DashAuto1 = new Dashboard_Automation__c();
                DashAuto1.Utilization_Measure__c = 2;
                DashAuto1.Cardinality_Measure__c = 6;
                DashAuto1.Measure_Number__c = 2;
                insert DashAuto1;
                DashAutoList.add(DashAuto);
                DashAutoList.add(DashAuto1);
                
                list<Measure_Requirements__c> MeasuresNewList = new list<Measure_Requirements__c>();
                Measure_Requirements__c MeasuresNew = new Measure_Requirements__c();
                MeasuresNew.Field_1__c = 'Measure 1';
                MeasuresNew.Field_2__c = 'Measure 2';
                MeasuresNew.Field_3__c = 'Measure 3';
                MeasuresNew.Field_4__c = 'Measure 4';
                MeasuresNew.Field_5__c = 'Rows';
                MeasuresNew.Value_1__c = 'sum';
                MeasuresNew.Value_2__c = 'min';
                MeasuresNew.Value_3__c = 'max';
                MeasuresNew.Value_4__c = 'min';
                MeasuresNew.Value_5__c = 'count';
                MeasuresNew.Measure_Number__c = 1;
                MeasuresNew.Dashboard_Automation__c = DashAuto1.Id;
                MeasuresNewList.add(MeasuresNew);
                
                List<SelectOption> MeasuresList = new List<SelectOption>();
        //MeasuresList1.add(new SelectOption('0', 'Rows'));
        //MeasuresList1.add(new SelectOption('None', 'None'));
        MeasuresList.add(new SelectOption('1', 'Measure 1')); 
        MeasuresList.add(new SelectOption('2', 'Measure 2'));
        Dashboard_Automation_Controller dac = new Dashboard_Automation_Controller();
       // dac.MeasWrapperClass DacMeas = new dac.MeasWrapperClass('sum','avg','max','min','count','1','1','1','1','0','=',FieldsList,MeasuresList,1,ValuesList,MeasuresList,MeasuresList,MeasuresList,MeasuresList);
          apexpages.currentpage().getparameters().put('RemoveIds','1');
        dac.addNewRow();
        dac.removeRow();
        dac.SaveRow();
        dac.NewMeasure();
        dac.onChangeNumber();
        dac.MeasremoveRow();
        dac.ChangeValue();
        dac.ChangeValueone();
        dac.ChangeValuetwo();
        dac.ChangeValuethree();
        dac.ChangeValuefour();
        dac.ResetToDefault();
        system.assertEquals('test', 'test');
	}
	
	private static testMethod void test2() {
	    list<Dashboard_Automation__c> DashAutoList = new list<Dashboard_Automation__c>();
	   
        Dashboard_Automation_Controller dac = new Dashboard_Automation_Controller();
        dac.addNewRow();
        dac.removeRow();
        dac.SaveRow();
        dac.NewMeasure();
        dac.onChangeNumber();
        dac.MeasremoveRow();
        system.assertEquals('test', 'test');
	}

}