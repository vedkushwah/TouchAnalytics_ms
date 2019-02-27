public with sharing class Dashboard_Automation_Controller {
    public  List<SelectOption> MeasuresList{get;set;}
    public  List<SelectOption> FieldsList{get;set;}
    public  List<SelectOption> MeasuresList1{get;set;}
    public List<SelectOption> ValuesList{get;set;}
    // public string measurefield1{get;set;}
    // public string measurefield2{get;set;}
    // public string measurefield3{get;set;}
    // public string measurefield4{get;set;}
    // public string measurefield5{get;set;}
    // public string measurefield6{get;set;}
    // public string measurefield7{get;set;}
    // public string measurefield8{get;set;}
    // public string measurefield9{get;set;}
    // public string measurefield12{get;set;}
    // public string measurefield14{get;set;}
    // public string measurefield15{get;set;}
    // public string measurefield16{get;set;}
    // public string measurefield17{get;set;}
    // public string measurefield18{get;set;}
    // public string measurefield19{get;set;}
    // public string measurefield22{get;set;}
    // public string measurefield23{get;set;}
    // public string measurefield25{get;set;}
    // public string measurefield26{get;set;}
    // public string measurefield27{get;set;}
    // public string measurefield28{get;set;}
    // public string measurefield29{get;set;}
    public integer measurefield31{get;set;}
    public integer measurefield32{get;set;}
   
    List<SelectOption> MeasuresList3 = new List<SelectOption>();
    List<SelectOption> MeasuresList4 = new List<SelectOption>();
    List<SelectOption> MeasuresList0 = new List<SelectOption>();
    List<SelectOption> MeasuresList11 = new List<SelectOption>();
    List<SelectOption> MeasuresList21 = new List<SelectOption>();
    List<SelectOption> MeasuresList31 = new List<SelectOption>();
    List<SelectOption> MeasuresList41 = new List<SelectOption>();
    
    public Dashboard_Automation_Controller(){
       /* measurefield1 = 'Field 1';
        measurefield2 = 'Field 1';
        measurefield3 = 'Field 1';
        measurefield4 = 'Field 1';
        measurefield5 = 'count';
        measurefield6 = 'Rows';
        measurefield15 = 'count';
        measurefield16 = 'Rows';
        measurefield25 = 'count';
        measurefield26 = 'Rows';*/
        measurefield31 = 2;
        measurefield32 = 70;
       
       /* measurefield9 = 'avg';
        measurefield8 = 'max';
        measurefield7 = 'min';
        measurefield19 = 'avg';
        measurefield18 = 'max';
        measurefield17 = 'min';
        measurefield29 = 'avg';
        measurefield28 = 'max';
        measurefield27 = 'min';
        measurefield12 = 'Field 2';
        measurefield14 = 'Field 2';
        measurefield22 = 'Field 2';
        measurefield23 = 'Field 3';*/
        
        list<Dashboard_Automation__c> DashboardAutomation = [select id,Cardinality_Greater_than__c,Cardinality_Less_Than__c,Max_of_Fields__c,
                                                                        Utilization__c from Dashboard_Automation__c where Measure_Number__c = 1];
       
        
        
        WrapperClassList = new list<WrapperClass>();
        
        if(DashboardAutomation.size() <= 0){
            WrapperClassList.add(new WrapperClass('1', '2', '6', '70', '2'));
            WrapperClassList.add(new WrapperClass('2', '5', '11', '70', '2'));
            WrapperClassList.add(new WrapperClass('3', '10', '25', '70', '2'));
            WrapperClassList.add(new WrapperClass('4', '24', '100', '70', '2'));
              WrapperClassList.add(new WrapperClass('5', '99', '2000', '70', '2'));
              WrapperClassList.add(new WrapperClass('6', '1', '999999999', '0', '8'));
            // WrapperClassList.add(new WrapperClass('5', '99', '', '', ''));
        }
        else{
            
            integer j= 1;
            for(Dashboard_Automation__c Dsh :DashboardAutomation){
                 WrapperClassList.add(new WrapperClass(String.valueof(j), String.valueof(Dsh.Cardinality_Greater_than__c), String.valueof(Dsh.Cardinality_Less_Than__c), String.valueof(Dsh.Utilization__c), String.valueof(Dsh.Max_of_Fields__c)));
               j++;
                
            }
              
        }
        
         list<Measure_Requirements__c> MeasureRequirements = [select id,Dashboard_Automation__c,Field_1__c,Field_2__c,Field_3__c,
                                                                        Field_4__c,Field_5__c,
                                                                        Measure_Number__c,Value_1__c,
                                                                        Value_2__c,Value_3__c,Value_4__c,Value_5__c,Operator__c,
                                                                        Dashboard_Automation__r.Utilization_Measure__c,
                                                                        Dashboard_Automation__r.Cardinality_Measure__c
                                                                         from Measure_Requirements__c where Dashboard_Automation__r.Measure_Number__c = 2];
       
       
        
        FieldsList = new List<SelectOption>();
        FieldsList.add(new SelectOption('None', 'None'));
        FieldsList.add(new SelectOption('sum', 'sum'));
        FieldsList.add(new SelectOption('avg', 'avg'));
        FieldsList.add(new SelectOption('max', 'max'));
        FieldsList.add(new SelectOption('min', 'min'));
        FieldsList.add(new SelectOption('unique', 'unique'));
        FieldsList.add(new SelectOption('median', 'median'));
        FieldsList.add(new SelectOption('last', 'last'));
        FieldsList.add(new SelectOption('stddev', 'stddev'));
        FieldsList.add(new SelectOption('stddevp', 'stddevp'));
        FieldsList.add(new SelectOption('var', 'var'));
        FieldsList.add(new SelectOption('varp', 'varp'));
        FieldsList.add(new SelectOption('count', 'count'));
        
        
        MeasuresList = new List<SelectOption>();
        //MeasuresList.add(new SelectOption('0', 'Rows'));
        //MeasuresList.add(new SelectOption('None', 'None'));
        MeasuresList.add(new SelectOption('1', 'Measure 1'));
        
        
        MeasuresList1 = new List<SelectOption>();
        //MeasuresList1.add(new SelectOption('0', 'Rows'));
        //MeasuresList1.add(new SelectOption('None', 'None'));
        MeasuresList1.add(new SelectOption('1', 'Measure 1')); 
        MeasuresList1.add(new SelectOption('2', 'Measure 2'));
        
        MeasuresList3 = new List<SelectOption>();
        //MeasuresList3.add(new SelectOption('0', 'Rows'));
        //MeasuresList3.add(new SelectOption('None', 'None'));
        MeasuresList3.add(new SelectOption('1', 'Measure 1')); 
        MeasuresList3.add(new SelectOption('2', 'Measure 2'));
        MeasuresList3.add(new SelectOption('3', 'Measure 3'));
        
        MeasuresList4 = new List<SelectOption>();
        //MeasuresList4.add(new SelectOption('0', 'Rows'));
        //MeasuresList4.add(new SelectOption('None', 'None'));
        MeasuresList4.add(new SelectOption('1', 'Measure 1')); 
        MeasuresList4.add(new SelectOption('2', 'Measure 2'));
        MeasuresList4.add(new SelectOption('3', 'Measure 3'));
        MeasuresList4.add(new SelectOption('4', 'Measure 4'));
        
        MeasuresList0 = new List<SelectOption>();
        MeasuresList0.add(new SelectOption('0', 'Rows'));
        
        MeasuresList11 = new List<SelectOption>();
        MeasuresList11.add(new SelectOption('0', 'Rows'));
        
        MeasuresList21 = new List<SelectOption>();
        MeasuresList21.add(new SelectOption('0', 'Rows'));
        
        MeasuresList31 = new List<SelectOption>();
        MeasuresList31.add(new SelectOption('0', 'Rows'));
        
        MeasuresList41 = new List<SelectOption>();
        MeasuresList41.add(new SelectOption('None', 'None'));
        
        ValuesList = new List<SelectOption>();
         ValuesList.add(new SelectOption('equals to', '='));
        ValuesList.add(new SelectOption('less than', '<'));
        ValuesList.add(new SelectOption('greater than', '>'));
        ValuesList.add(new SelectOption('less than equals to', '<='));
        ValuesList.add(new SelectOption('greater than equals to', '>='));
        
        
         MeasWrapperClassList = new list<MeasWrapperClass>();
         if(MeasureRequirements.size() <= 0){
            MeasWrapperClassList.add(new MeasWrapperClass('sum','avg','max','min','count','1','1','1','1','0','=',FieldsList,MeasuresList,1,ValuesList,MeasuresList,MeasuresList,MeasuresList,MeasuresList0)); 
            MeasWrapperClassList.add(new MeasWrapperClass('sum','avg','sum','avg','count','1','1','2','2','0','=',FieldsList,MeasuresList1,2,ValuesList,MeasuresList1,MeasuresList1,MeasuresList1,MeasuresList11));
            MeasWrapperClassList.add(new MeasWrapperClass('sum','sum','sum','count','var','1','2','3','0','3','=',FieldsList,MeasuresList3,3,ValuesList,MeasuresList3,MeasuresList3,MeasuresList21,MeasuresList41));
            MeasWrapperClassList.add(new MeasWrapperClass('sum','sum','sum','sum','count','1','2','3','4','0','=',FieldsList,MeasuresList4,4,ValuesList,MeasuresList4,MeasuresList4,MeasuresList4,MeasuresList31));
         }
         else{                                                       
             measurefield31 = integer.valueof(MeasureRequirements[0].Dashboard_Automation__r.Cardinality_Measure__c);
            measurefield32 = integer.valueof(MeasureRequirements[0].Dashboard_Automation__r.Utilization_Measure__c);
             integer k=1;
             for(Measure_Requirements__c Mes :MeasureRequirements){
                  MeasuresList1 = new List<SelectOption>();
                  List<SelectOption> MeasuresList2 = new List<SelectOption>();
                  MeasuresList3 = new List<SelectOption>();
                  MeasuresList4 = new List<SelectOption>();
                  List<SelectOption> MeasuresList5 = new List<SelectOption>();
                    integer j = MeasWrapperClassList.size() + 1;
                    // MeasuresList1.add(new SelectOption('0', 'Rows'));
                    if(Mes.Field_1__c != 'count' && Mes.Field_1__c != 'None'){
                        //MeasuresList1.add(new SelectOption('None', 'None ')); 
                        for(integer i=1;i <= Mes.Measure_Number__c;i++){
                          MeasuresList1.add(new SelectOption(string.valueof(i), 'Measure '+i)); 
                        }
                    }
                    else if(Mes.Field_1__c == 'count'){
                        //MeasuresList1.add(new SelectOption('None', 'None '));
                        MeasuresList1.add(new SelectOption('0', 'Rows'));
                    }
                    else if(Mes.Field_1__c == 'None'){
                        //MeasuresList1.add(new SelectOption('None', 'None '));
                        MeasuresList1.add(new SelectOption('None', 'None'));
                    }
                    if(Mes.Field_2__c != 'count' && Mes.Field_2__c != 'None'){
                        //MeasuresList2.add(new SelectOption('None', 'None ')); 
                        for(integer i=1;i <= Mes.Measure_Number__c;i++){
                          MeasuresList2.add(new SelectOption(string.valueof(i), 'Measure '+i)); 
                        }
                    }
                    else if(Mes.Field_2__c == 'count'){
                        //MeasuresList2.add(new SelectOption('None', 'None '));
                        MeasuresList2.add(new SelectOption('0', 'Rows'));
                    }
                    else if(Mes.Field_2__c == 'None'){
                        //MeasuresList2.add(new SelectOption('None', 'None '));
                        MeasuresList2.add(new SelectOption('None', 'None'));
                    }
                    if(Mes.Field_3__c != 'count' && Mes.Field_3__c != 'None'){
                        //MeasuresList3.add(new SelectOption('None', 'None '));
                        for(integer i=1;i <= Mes.Measure_Number__c;i++){
                          MeasuresList3.add(new SelectOption(string.valueof(i), 'Measure '+i)); 
                        }
                    }
                    else if(Mes.Field_3__c == 'count'){
                        //MeasuresList3.add(new SelectOption('None', 'None '));
                        MeasuresList3.add(new SelectOption('0', 'Rows'));
                    }
                    else if(Mes.Field_3__c == 'None'){
                        //MeasuresList3.add(new SelectOption('None', 'None '));
                        MeasuresList3.add(new SelectOption('None', 'None'));
                    }
                    if(Mes.Field_4__c != 'count' && Mes.Field_4__c != 'None'){
                        //MeasuresList4.add(new SelectOption('None', 'None '));
                        for(integer i=1;i <= Mes.Measure_Number__c;i++){
                          MeasuresList4.add(new SelectOption(string.valueof(i), 'Measure '+i)); 
                        }
                    }
                    else if(Mes.Field_4__c == 'count'){
                        //MeasuresList4.add(new SelectOption('None', 'None '));
                        MeasuresList4.add(new SelectOption('0', 'Rows'));
                    }
                    else if(Mes.Field_4__c == 'None'){
                        //MeasuresList4.add(new SelectOption('None', 'None '));
                        MeasuresList4.add(new SelectOption('None', 'None'));
                    }
                    if(Mes.Field_5__c != 'count' && Mes.Field_5__c != 'None'){
                        //MeasuresList5.add(new SelectOption('None', 'None '));
                        for(integer i=1;i <= Mes.Measure_Number__c;i++){
                          MeasuresList5.add(new SelectOption(string.valueof(i), 'Measure '+i)); 
                        }
                    }
                    else if(Mes.Field_5__c == 'count'){
                        //MeasuresList5.add(new SelectOption('None', 'None '));
                        MeasuresList5.add(new SelectOption('0', 'Rows'));
                    }
                    else if(Mes.Field_5__c == 'None'){
                        //MeasuresList5.add(new SelectOption('None', 'None '));
                        MeasuresList5.add(new SelectOption('None', 'None'));
                    }
                MeasWrapperClassList.add(new MeasWrapperClass(Mes.Field_1__c,Mes.Field_2__c,Mes.Field_3__c,Mes.Field_4__c,Mes.Field_5__c,Mes.Value_1__c,Mes.Value_2__c,Mes.Value_3__c,Mes.Value_4__c,Mes.Value_5__c,Mes.Operator__c,FieldsList,MeasuresList1,integer.valueof(Mes.Measure_Number__c),ValuesList,MeasuresList2,MeasuresList3,MeasuresList4,MeasuresList5)); 
                k++;
             }
         }
    } 
    
   
    
    public list<WrapperClass> WrapperClassList{get;set;}
    public class WrapperClass{
        public string field1{get;set;}
        public string field2{get;set;}
        public string field3{get;set;}
        public string field4{get;set;}
        public string field5{get;set;}
        
        public WrapperClass(string field1, string field2, string field3, string field4, string field5){
            this.field1 = field1;
            this.field2 = field2;
            this.field3 = field3;
            this.field4 = field4;
            this.field5 = field5;
        }
        
    }
    
    public list<MeasWrapperClass> MeasWrapperClassList{get;set;}
    public class MeasWrapperClass{
        public string field1{get;set;}
        public string field2{get;set;}
        public string field3{get;set;}
        public string field4{get;set;}
        public string field5{get;set;}
        public string value1{get;set;}
        public string value2{get;set;}
        public string value3{get;set;}
        public string value4{get;set;}
        public string value5{get;set;}
        public string value6{get;set;}
        public integer Numbers{get;set;}
        public list<selectoption> selectfield1{get;set;}
        public list<selectoption> selectfield2{get;set;}
        public list<selectoption> selectfield4{get;set;}
        public list<selectoption> selectfield5{get;set;}
        public list<selectoption> selectfield6{get;set;}
        public list<selectoption> selectfield7{get;set;}
        public list<selectoption> selectfield3{get;set;}
        
        public MeasWrapperClass(string field1, string field2, string field3, string field4, string field5,string value1,string value2,string value3,string value4,string value5,String value6,list<selectoption> selectfield1,list<selectoption> selectfield2,integer Numbers,list<selectoption> selectfield3,list<selectoption> selectfield4,list<selectoption> selectfield5,list<selectoption> selectfield6,list<selectoption> selectfield7){
            this.field1 = field1;
            this.field2 = field2;
            this.field3 = field3;
            this.field4 = field4;
            this.field5 = field5;
            this.value1 = value1;
            this.value2 = value2;
            this.value3 = value3;
            this.value4 = value4;
            this.value5 = value5;
            this.value6 = value6;
            this.selectfield1 = selectfield1;
            this.selectfield2 = selectfield2;
            this.selectfield3 = selectfield3;
            this.selectfield4 = selectfield4;
            this.selectfield5 = selectfield5;
            this.selectfield6 = selectfield6;
            this.selectfield7 = selectfield7;
            this.Numbers = Numbers;
        }
    }
    
    public void addNewRow(){
        String wrapperSize = String.valueOf(WrapperClassList.size()+1);
        WrapperClassList.add(new WrapperClass(wrapperSize, '', '', '', ''));  
    }
    public string newField{get;set;}
    
    public void removeRow(){
        system.debug('Param Value: ');
        Integer RowNumberId = 1;
        String RemoveId = apexpages.currentpage().getparameters().get('RemoveIds');
        system.debug('Param Value: '+RemoveId);
        list<WrapperClass> NewWrapperClassList = new list<WrapperClass>();
        for(WrapperClass newWar : WrapperClassList){
            if(newWar.field1 != RemoveId){
                NewWrapperClassList.add(new WrapperClass(String.valueOf(RowNumberId), newWar.field2, newWar.field3, newWar.field4, newWar.field5));
                RowNumberId = RowNumberId+1;
            }
        }
        WrapperClassList.clear();
        for(WrapperClass newWar : NewWrapperClassList){
            WrapperClassList.add(new WrapperClass(newWar.field1, newWar.field2, newWar.field3, newWar.field4, newWar.field5));
        }
        
    }
    
    public Boolean CheckValues{get;set;}
	public Boolean CheckValuesMeas{get;set;}
    list<Dashboard_Automation__c> DashAutoList1 = new list<Dashboard_Automation__c>();
    public void SaveRow(){
        CheckValues = true;
		CheckValuesMeas = true;
        list<WrapperClass> NewWrapperClassList = new list<WrapperClass>();
        list<Dashboard_Automation__c> DashAutoList = new list<Dashboard_Automation__c>();
        integer TotalMaxofFields = 0;
        DashAutoList1 = [select Cardinality_Greater_than__c,Cardinality_Less_Than__c,Utilization__c,Max_of_Fields__c,Measure_Number__c from Dashboard_Automation__c limit 1000];
        for(WrapperClass newWar : WrapperClassList){
            if(newWar.field2 != null && newWar.field2 != '' && newWar.field3 != null && newWar.field3 != ''
               && newWar.field4 != null && newWar.field4 != '' && newWar.field5 != null && newWar.field5 != ''){
                Dashboard_Automation__c DashAuto = new Dashboard_Automation__c();
                DashAuto.Cardinality_Greater_than__c = integer.valueOf(newWar.field2);
                DashAuto.Cardinality_Less_Than__c = integer.valueOf(newWar.field3);
                DashAuto.Utilization__c = integer.valueOf(newWar.field4);
                DashAuto.Max_of_Fields__c = integer.valueOf(newWar.field5);
                DashAuto.Measure_Number__c = 1;
                DashAutoList.add(DashAuto);
               // TotalMaxofFields = TotalMaxofFields + integer.valueOf(newWar.field5);
              }else{
                  CheckValues = false;
              }
              
        } 
                Dashboard_Automation__c DashAuto1 = new Dashboard_Automation__c();
                
                if(measurefield31 != null  && measurefield32 != null){
            if( Schema.sObjectType.Dashboard_Automation__c.fields.Utilization_Measure__c .isCreateable() && Schema.sObjectType.Dashboard_Automation__c.fields.Cardinality_Measure__c.isCreateable()
                  && Schema.sObjectType.Dashboard_Automation__c.fields.Measure_Number__c .isCreateable()){
                    DashAuto1.Utilization_Measure__c = measurefield32;
                    DashAuto1.Cardinality_Measure__c = measurefield31;
                    DashAuto1.Measure_Number__c = 2;
                    
                    insert DashAuto1;
                  }  
                }else{
                  ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,'All Values are required in Measures'));  
                }
                
				set<String> StringList = new set<String>();
                list<Measure_Requirements__c> MeasuresNewList = new list<Measure_Requirements__c>();
                 for(MeasWrapperClass newWar : MeasWrapperClassList){
				        String MergeField1 = newWar.field1 + newWar.value1;
						String MergeField2 = newWar.field2 + newWar.value2;
						String MergeField3 = newWar.field3 + newWar.value3;
						String MergeField4 = newWar.field4 + newWar.value4;
						String MergeField5 = newWar.field5 + newWar.value5;
					 if(MergeField1 != MergeField2 && MergeField1 != MergeField3 && MergeField1 != MergeField4 && MergeField1 != MergeField5 && MergeField2 != MergeField3 && MergeField2 != MergeField4 && MergeField3 != MergeField4 &&  MergeField3 != MergeField5 && MergeField2 != MergeField5 && MergeField4 != MergeField5){
                        Measure_Requirements__c MeasuresNew = new Measure_Requirements__c();
                        MeasuresNew.Field_1__c = newWar.field1;
                        MeasuresNew.Field_2__c = newWar.field2;
                        MeasuresNew.Field_3__c = newWar.field3;
                        MeasuresNew.Field_4__c = newWar.field4;
                        MeasuresNew.Field_5__c = newWar.field5;
                        MeasuresNew.Value_1__c = newWar.value1;
                        MeasuresNew.Value_2__c = newWar.value2;
                        MeasuresNew.Value_3__c = newWar.value3;
                        MeasuresNew.Value_4__c = newWar.value4;
                        MeasuresNew.Value_5__c = newWar.value5;
                        MeasuresNew.Measure_Number__c = newWar.Numbers;
                        MeasuresNew.Dashboard_Automation__c = DashAuto1.Id;
                        MeasuresNew.Operator__c = newWar.value6;
                        MeasuresNewList.add(MeasuresNew);
                    }
					else{
						CheckValuesMeas = false;
					}
                 }
               
                
               
        if(DashAutoList.size()>0 && CheckValues == true && CheckValuesMeas == true && MeasuresNewList.size() > 0){
            if(DashAutoList1.size() > 0){
                if(Dashboard_Automation__c.sObjectType.getDescribe().isDeletable()){
                    delete DashAutoList1;
                }    
            }
        if(Schema.sObjectType.Dashboard_Automation__c.fields.Cardinality_Greater_than__c .isCreateable() && Schema.sObjectType.Dashboard_Automation__c.fields.Cardinality_Less_Than__c .isCreateable()
          && Schema.sObjectType.Dashboard_Automation__c.fields.Utilization__c .isCreateable() && Schema.sObjectType.Dashboard_Automation__c.fields.Max_of_Fields__c .isCreateable()
          && Schema.sObjectType.Dashboard_Automation__c.fields.Measure_Number__c .isCreateable() ){
                insert DashAutoList;
                }
                
            if(Schema.sObjectType.Measure_Requirements__c.fields.Field_1__c.isCreateable() && Schema.sObjectType.Measure_Requirements__c.fields.Field_2__c.isCreateable()
            && Schema.sObjectType.Measure_Requirements__c.fields.Field_3__c.isCreateable() && Schema.sObjectType.Measure_Requirements__c.fields.Field_4__c.isCreateable()
            && Schema.sObjectType.Measure_Requirements__c.fields.Field_5__c.isCreateable() && Schema.sObjectType.Measure_Requirements__c.fields.Value_1__c.isCreateable()
            && Schema.sObjectType.Measure_Requirements__c.fields.Value_2__c.isCreateable() && Schema.sObjectType.Measure_Requirements__c.fields.Value_3__c.isCreateable()
            && Schema.sObjectType.Measure_Requirements__c.fields.Value_4__c.isCreateable() && Schema.sObjectType.Measure_Requirements__c.fields.Value_5__c.isCreateable()
            && Schema.sObjectType.Measure_Requirements__c.fields.Measure_Number__c.isCreateable() && Schema.sObjectType.Measure_Requirements__c.fields.Dashboard_Automation__c.isCreateable()
            && Schema.sObjectType.Measure_Requirements__c.fields.Operator__c.isCreateable() ){
				insert MeasuresNewList;
             }
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Dashboard Settings created Successfully'));
        }else{
           
			if(CheckValues == false){
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,'All values are required in Dimensions'));
            }
			else if(CheckValuesMeas == false)
			    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,'Measure values must not be same Please select different values'));  
            }
		}
        
        
  
    
    public void NewMeasure(){
        MeasuresList1 = new List<SelectOption>();
        integer j = MeasWrapperClassList.size() + 1;
        //MeasuresList1.add(new SelectOption('0', 'Rows'));
        for(integer i=1;i <= j;i++){
          MeasuresList1.add(new SelectOption(string.valueof(i), 'Measure '+i)); 
        }
        MeasWrapperClassList.add(new MeasWrapperClass('sum','min','max','avg','var','Measure 1','Measure 1','Measure 1','Measure 1','Measure 1','=',FieldsList,MeasuresList1,j,ValuesList,MeasuresList1,MeasuresList1,MeasuresList1,MeasuresList1)); 
    }
    
    public void onChangeNumber(){
        for(MeasWrapperClass newWar : MeasWrapperClassList){
            newWar.selectfield2 = new List<SelectOption>();
            newWar.selectfield4 = new List<SelectOption>();
            newWar.selectfield5 = new List<SelectOption>();
            newWar.selectfield6 = new List<SelectOption>();
            newWar.selectfield7 = new List<SelectOption>();
            if(newWar.value6 == 'equals to' || newWar.value6 == 'less than equals to' || newWar.value6 == 'greater than equals to'){
                if(newWar.field1 != 'count' && newWar.field1 != 'None'){
                    for(integer i=1;i <= newWar.Numbers;i++){
                        newWar.selectfield2.add(new SelectOption(string.valueof(i), 'Measure '+i));
                    }
                    
                }
                else if(newWar.field1 == 'count'){
                    newWar.selectfield2.add(new SelectOption('0', 'Rows'));
                }
                else if(newWar.field1 == 'None'){
                    newWar.selectfield2.add(new SelectOption('None', 'None'));
                }
                if(newWar.field2 != 'count' && newWar.field2 != 'None'){
                    for(integer i=1;i <= newWar.Numbers;i++){
                        newWar.selectfield4.add(new SelectOption(string.valueof(i), 'Measure '+i));
                    }
                    
                }
                else if(newWar.field2 == 'count'){
                    newWar.selectfield4.add(new SelectOption('0', 'Rows'));
                }
                else if(newWar.field2 == 'None'){
                    newWar.selectfield4.add(new SelectOption('None', 'None'));
                }
                if(newWar.field3 != 'count' && newWar.field3 != 'None'){
                    for(integer i=1;i <= newWar.Numbers;i++){
                        newWar.selectfield5.add(new SelectOption(string.valueof(i), 'Measure '+i));
                    }
                    
                }
                else if(newWar.field3 == 'count'){
                    newWar.selectfield5.add(new SelectOption('0', 'Rows'));
                }
                else if(newWar.field3 == 'None'){
                    newWar.selectfield5.add(new SelectOption('None', 'None'));
                }
                if(newWar.field4 != 'count' && newWar.field4 != 'None'){
                    for(integer i=1;i <= newWar.Numbers;i++){
                        newWar.selectfield6.add(new SelectOption(string.valueof(i), 'Measure '+i));
                    }
                    
                }
                else if(newWar.field4 == 'count'){
                    newWar.selectfield6.add(new SelectOption('0', 'Rows'));
                }
                else if(newWar.field4 == 'None'){
                    newWar.selectfield6.add(new SelectOption('None', 'None'));
                }
                if(newWar.field5 != 'count' && newWar.field5 != 'None'){
                    for(integer i=1;i <= newWar.Numbers;i++){
                        newWar.selectfield7.add(new SelectOption(string.valueof(i), 'Measure '+i));
                    }
                    
                }
                else if(newWar.field5 == 'count'){
                    newWar.selectfield7.add(new SelectOption('0', 'Rows'));
                }
                else if(newWar.field5 == 'None'){
                    newWar.selectfield7.add(new SelectOption('None', 'None'));
                }
                
                

            }
            if(newWar.value6 == 'less than'){
                //newWar.Numbers = newWar.Numbers -1;
                if(newWar.field1 != 'count' && newWar.field1 != 'None'){
                    for(integer i=1;i < newWar.Numbers;i++){
                        newWar.selectfield2.add(new SelectOption(string.valueof(i), 'Measure '+i));
                    }
                    
                }
                else if(newWar.field1 == 'count'){
                    newWar.selectfield2.add(new SelectOption('0', 'Rows'));
                }
                else if(newWar.field1 == 'None'){
                    newWar.selectfield2.add(new SelectOption('None', 'None'));
                }
                if(newWar.field2 != 'count' && newWar.field2 != 'None'){
                    for(integer i=1;i < newWar.Numbers;i++){
                        newWar.selectfield4.add(new SelectOption(string.valueof(i), 'Measure '+i));
                    }
                    
                }
                else if(newWar.field2 == 'None'){
                    newWar.selectfield4.add(new SelectOption('0', 'Rows'));
                }
                else if(newWar.field2 == 'count'){
                    newWar.selectfield4.add(new SelectOption('None', 'None'));
                }
                if(newWar.field3 != 'count' && newWar.field3 != 'None'){
                    for(integer i=1;i < newWar.Numbers;i++){
                        newWar.selectfield5.add(new SelectOption(string.valueof(i), 'Measure '+i));
                    }
                    
                }
                else if(newWar.field3 == 'count'){
                    newWar.selectfield5.add(new SelectOption('0', 'Rows'));
                }
                else if(newWar.field3 == 'None'){
                    newWar.selectfield5.add(new SelectOption('None', 'None'));
                }
                if(newWar.field4 != 'count' && newWar.field4 != 'None'){
                    for(integer i=1;i < newWar.Numbers;i++){
                        newWar.selectfield6.add(new SelectOption(string.valueof(i), 'Measure '+i));
                    }
                    
                }
                else if(newWar.field4 == 'count'){
                    newWar.selectfield6.add(new SelectOption('0', 'Rows'));
                }
                else if(newWar.field4 == 'None'){
                    newWar.selectfield6.add(new SelectOption('None', 'None'));
                }
                
                if(newWar.field5 != 'count' && newWar.field5 != 'None'){
                    for(integer i=1;i < newWar.Numbers;i++){
                        newWar.selectfield7.add(new SelectOption(string.valueof(i), 'Measure '+i));
                    }
                    
                }
                else if(newWar.field5 == 'count'){
                    newWar.selectfield7.add(new SelectOption('0', 'Rows'));
                }
                else if(newWar.field5 == 'None'){
                    newWar.selectfield7.add(new SelectOption('None', 'None'));
                }
                
                
            }
            if(newWar.value6 == 'greater than'){
               //newWar.Numbers = newWar.Numbers +1; 
                if(newWar.field1 != 'count' && newWar.field1 != 'None'){
                    for(integer i=1;i <= newWar.Numbers+1;i++){
                        newWar.selectfield2.add(new SelectOption(string.valueof(i), 'Measure '+i));
                    }
                    
                }
                else if(newWar.field1 == 'count'){
                    newWar.selectfield2.add(new SelectOption('0', 'Rows'));
                }
                 else if(newWar.field1 == 'None'){
                    newWar.selectfield2.add(new SelectOption('None', 'None'));
                }
                if(newWar.field2 != 'count' && newWar.field2 != 'None'){
                    for(integer i=1;i <= newWar.Numbers+1;i++){
                        newWar.selectfield4.add(new SelectOption(string.valueof(i), 'Measure '+i));
                    }
                    
                }
                else if(newWar.field2 == 'count'){
                    newWar.selectfield4.add(new SelectOption('0', 'Rows'));
                }
                else if(newWar.field2 == 'None'){
                    newWar.selectfield4.add(new SelectOption('None', 'None'));
                }
                if(newWar.field3 != 'count' && newWar.field3 != 'None'){
                    for(integer i=1;i <= newWar.Numbers+1;i++){
                        newWar.selectfield5.add(new SelectOption(string.valueof(i), 'Measure '+i));
                    }
                    
                }
                else if(newWar.field3 == 'count'){
                    newWar.selectfield5.add(new SelectOption('0', 'Rows'));
                }
                 else if(newWar.field3 == 'None'){
                    newWar.selectfield5.add(new SelectOption('None', 'None'));
                }
                if(newWar.field4 != 'count' && newWar.field4 != 'None'){
                    for(integer i=1;i <= newWar.Numbers+1;i++){
                        newWar.selectfield6.add(new SelectOption(string.valueof(i), 'Measure '+i));
                    }
                    
                }
                else if(newWar.field4 == 'count'){
                    newWar.selectfield6.add(new SelectOption('0', 'Rows'));
                }
                else if(newWar.field4 == 'None'){
                    newWar.selectfield6.add(new SelectOption('None', 'None'));
                }
                if(newWar.field5 != 'count' && newWar.field5 != 'None'){
                    for(integer i=1;i <= newWar.Numbers+1;i++){
                        newWar.selectfield7.add(new SelectOption(string.valueof(i), 'Measure '+i));
                    }
                    
                }
                else if(newWar.field5 == 'count'){
                    newWar.selectfield7.add(new SelectOption('0', 'Rows'));
                }
                else if(newWar.field5 == 'None'){
                    newWar.selectfield7.add(new SelectOption('None', 'None'));
                }
                
                
            }
        }
    }
    
    public void MeasremoveRow(){
        system.debug('Param Value: ');
        Integer RowNumberId = 1;
        String RemoveId = apexpages.currentpage().getparameters().get('RemoveIds');
        system.debug('Param Value: '+RemoveId);
        list<MeasWrapperClass> NewMeasWrapperClassList = new list<MeasWrapperClass>();
        for(MeasWrapperClass newWar : MeasWrapperClassList){
            if(newWar.field1 != RemoveId){
                NewMeasWrapperClassList.add(new MeasWrapperClass(newWar.field1,newWar.field2, newWar.field3, newWar.field4, newWar.field5,newWar.value1,newWar.value2, newWar.value3, newWar.value4, newWar.value5,newWar.value6, newWar.selectfield1, newWar.selectfield2,RowNumberId,newWar.selectfield3,newWar.selectfield4,newWar.selectfield5,newWar.selectfield6,newWar.selectfield7));
                RowNumberId = RowNumberId+1;
            }
        }
        MeasWrapperClassList.clear();
        for(MeasWrapperClass newWar : NewMeasWrapperClassList){
            MeasWrapperClassList.add(new MeasWrapperClass(newWar.field1,newWar.field2, newWar.field3, newWar.field4, newWar.field5,newWar.value1,newWar.value2, newWar.value3, newWar.value4, newWar.value5,newWar.value6, newWar.selectfield1, newWar.selectfield2,newWar.Numbers,newWar.selectfield3,newWar.selectfield4,newWar.selectfield5,newWar.selectfield6,newWar.selectfield7));
        }
        
    }
    
    public integer Newvalue{get;set;}
    public void ChangeValue(){
         Newvalue = integer.valueof(apexpages.currentpage().getparameters().get('RemoveIds'));
         system.debug('Newvalue ***********'+Newvalue);
        for(MeasWrapperClass newWar:MeasWrapperClassList){
            system.debug('newWar.field1 ***********'+newWar.field1);
            if(Newvalue == newWar.Numbers){
                if(newWar.field1 != 'count' && newWar.field1 != 'None'){
                    newWar.selectfield2 = new List<SelectOption>();
                    for(integer i=1;i <= newWar.Numbers;i++){
                        newWar.selectfield2.add(new SelectOption(string.valueof(i), 'Measure '+i)); 
                    }
                }
                if(newWar.field1 == 'count'){
                    newWar.selectfield2 = new List<SelectOption>();
                    //newWar.selectfield2.add(new SelectOption('None', 'None'));
                    newWar.selectfield2.add(new SelectOption('0', 'Rows')); 
                }
                if(newWar.field1 == 'None'){
                    newWar.selectfield2 = new List<SelectOption>();
                    //newWar.selectfield2.add(new SelectOption('None', 'None'));
                    newWar.selectfield2.add(new SelectOption('None', 'None')); 
                }
            }
        }
    }
    
    public void ChangeValueone(){
        Newvalue = integer.valueof(apexpages.currentpage().getparameters().get('RemoveIds'));
        for(MeasWrapperClass newWar:MeasWrapperClassList){
            if(Newvalue == newWar.Numbers){
                if(newWar.field2 != 'count' && newWar.field2 != 'None'){
                    newWar.selectfield4 = new List<SelectOption>();
                    //newWar.selectfield4.add(new SelectOption('None', 'None'));
                    for(integer i=1;i <= newWar.Numbers;i++){
                        newWar.selectfield4.add(new SelectOption(string.valueof(i), 'Measure '+i)); 
                    }
                }
                if(newWar.field2 == 'count'){
                    newWar.selectfield4 = new List<SelectOption>();
                    //newWar.selectfield4.add(new SelectOption('None', 'None'));
                    newWar.selectfield4.add(new SelectOption('0', 'Rows')); 
                }
                if(newWar.field2 == 'None'){
                    newWar.selectfield4 = new List<SelectOption>();
                    //newWar.selectfield4.add(new SelectOption('None', 'None'));
                    newWar.selectfield4.add(new SelectOption('None', 'None')); 
                }
            }
        }
    }
    
    public void ChangeValuetwo(){
        Newvalue = integer.valueof(apexpages.currentpage().getparameters().get('RemoveIds'));
        for(MeasWrapperClass newWar:MeasWrapperClassList){
            if(Newvalue == newWar.Numbers){
                if(newWar.field3 != 'count' && newWar.field3 != 'None'){
                    newWar.selectfield5 = new List<SelectOption>();
                    //newWar.selectfield5.add(new SelectOption('None', 'None')); 
                    for(integer i=1;i <= newWar.Numbers;i++){
                        newWar.selectfield5.add(new SelectOption(string.valueof(i), 'Measure '+i)); 
                    }
                }
                if(newWar.field3 == 'count'){
                    newWar.selectfield5 = new List<SelectOption>();
                    //newWar.selectfield5.add(new SelectOption('None', 'None'));
                    newWar.selectfield5.add(new SelectOption('0', 'Rows')); 
                }
                if(newWar.field3 == 'None'){
                    newWar.selectfield5 = new List<SelectOption>();
                    //newWar.selectfield5.add(new SelectOption('None', 'None'));
                    newWar.selectfield5.add(new SelectOption('None', 'None')); 
                }
            }
        }
    }
    
    public void ChangeValuethree(){
        Newvalue = integer.valueof(apexpages.currentpage().getparameters().get('RemoveIds'));
        for(MeasWrapperClass newWar:MeasWrapperClassList){
            if(Newvalue == newWar.Numbers){
                if(newWar.field4 != 'count' && newWar.field4 != 'None'){
                    newWar.selectfield6 = new List<SelectOption>();
                    // newWar.selectfield6.add(new SelectOption('None', 'None'));
                    for(integer i=1;i <= newWar.Numbers;i++){
                        newWar.selectfield6.add(new SelectOption(string.valueof(i), 'Measure '+i)); 
                    }
                }
                if(newWar.field4 == 'count'){
                    newWar.selectfield6 = new List<SelectOption>();
                    //newWar.selectfield6.add(new SelectOption('None', 'None')); 
                    newWar.selectfield6.add(new SelectOption('0', 'Rows')); 
                }
                if(newWar.field4 == 'None'){
                    newWar.selectfield6 = new List<SelectOption>();
                    //newWar.selectfield6.add(new SelectOption('None', 'None')); 
                    newWar.selectfield6.add(new SelectOption('None', 'None')); 
                }
            }
        }
    }
    
    public void ChangeValuefour(){
        Newvalue = integer.valueof(apexpages.currentpage().getparameters().get('RemoveIds'));
        for(MeasWrapperClass NewMeas:MeasWrapperClassList){
            if(Newvalue == NewMeas.Numbers){
                if(NewMeas.field5 != 'count' && NewMeas.field5 != 'None'){
                    NewMeas.selectfield7 = new List<SelectOption>();
                    //NewMeas.selectfield7.add(new SelectOption('None', 'None'));
                    for(integer i=1;i <= NewMeas.Numbers;i++){
                        NewMeas.selectfield7.add(new SelectOption(string.valueof(i), 'Measure '+i)); 
                    }
                }
                if(NewMeas.field5 == 'count'){
                    NewMeas.selectfield7 = new List<SelectOption>();
                    //NewMeas.selectfield7.add(new SelectOption('None', 'None')); 
                    NewMeas.selectfield7.add(new SelectOption('0', 'Rows')); 
                }
                if(NewMeas.field5 == 'None'){
                    NewMeas.selectfield7 = new List<SelectOption>();
                    //NewMeas.selectfield7.add(new SelectOption('None', 'None')); 
                    NewMeas.selectfield7.add(new SelectOption('None', 'None')); 
                }
            }
        }
    }
    
    public void ResetToDefault(){
           WrapperClassList.clear();
            WrapperClassList.add(new WrapperClass('1', '2', '6', '70', '2'));
            WrapperClassList.add(new WrapperClass('2', '5', '11', '70', '2'));
            WrapperClassList.add(new WrapperClass('3', '10', '25', '70', '2'));
            WrapperClassList.add(new WrapperClass('4', '24', '100', '70', '2'));
             WrapperClassList.add(new WrapperClass('5', '99', '2000', '70', '2'));
              WrapperClassList.add(new WrapperClass('6', '1', '999999999', '0', '8'));
            
            MeasWrapperClassList.clear();
            MeasuresList1 = new List<SelectOption>();
            integer j = MeasWrapperClassList.size() + 2;
            //MeasuresList1.add(new SelectOption('0', 'Rows'));
            for(integer i=1;i <= j;i++){
              MeasuresList1.add(new SelectOption(string.valueof(i), 'Measure '+i)); 
            }
            //MeasWrapperClassList.clear();
            MeasuresList3 = new List<SelectOption>();
            integer k = MeasWrapperClassList.size() + 3;
            //MeasuresList1.add(new SelectOption('0', 'Rows'));
            for(integer i=1;i <= k;i++){
              MeasuresList3.add(new SelectOption(string.valueof(i), 'Measure '+i)); 
            }
            MeasuresList4 = new List<SelectOption>();
            integer l = MeasWrapperClassList.size() + 4;
            //MeasuresList1.add(new SelectOption('0', 'Rows'));
            for(integer i=1;i <= l;i++){
              MeasuresList4.add(new SelectOption(string.valueof(i), 'Measure '+i)); 
            }
            measurefield31 = 2;
            measurefield32 = 70;
            MeasWrapperClassList.add(new MeasWrapperClass('sum','avg','max','min','count','1','1','1','1','0','=',FieldsList,MeasuresList,1,ValuesList,MeasuresList,MeasuresList,MeasuresList,MeasuresList0)); 
            MeasWrapperClassList.add(new MeasWrapperClass('sum','avg','sum','avg','count','1','1','2','2','0','=',FieldsList,MeasuresList1,2,ValuesList,MeasuresList1,MeasuresList1,MeasuresList1,MeasuresList11));
            MeasWrapperClassList.add(new MeasWrapperClass('sum','sum','sum','count','None','1','2','3','0','None','=',FieldsList,MeasuresList3,3,ValuesList,MeasuresList3,MeasuresList3,MeasuresList21,MeasuresList41));
            MeasWrapperClassList.add(new MeasWrapperClass('sum','sum','sum','sum','count','1','2','3','4','0','=',FieldsList,MeasuresList4,4,ValuesList,MeasuresList4,MeasuresList4,MeasuresList4,MeasuresList31));
         
    }
   
}