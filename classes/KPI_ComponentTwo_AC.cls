public with sharing class KPI_ComponentTwo_AC {    
    public Boolean SetDimension{get;set;}
    public Boolean SetDimensionValue{get;set;} 
    public boolean showSectionEdit{get;set;}
    public String KPINameUI{get;set;}
    public String KPIValue{get;set;}
    public Map<String,String> DatasetMaps{get;set;}
    public Map<String,String> MapValues{get;set;}
    public static String sessionId = UserInfo.getSessionId();
    public List<SelectOption> DatasetValuesList{get;set;}
    public Map<String,String> DimensionLabel{get;set;}
    public Map<String,String> MeasureFieldAPI{get;set;}
         public Map<String,String> versionLabel{get;set;}
         public boolean  EditLabelsone{get;set;}
    public Map<String,String> VersionUrl{get;set;}
    public String SessionsId{get;set;}
    public String SelectKPIValue{get;set;}
      public boolean AddFiltersShow{get;set;}
    public boolean EditFiltersShow{get;set;}
    public String tabid{get;set;}
    public boolean defaultTab1{get;set;}
    public boolean defaultTab2{get;set;}
    public boolean defaultTab3{get;set;}
    public boolean defaultTab4{get;set;}
    public boolean defaultTab5{get;set;}
    
    public String SelectedButtonValue{get;set;}
    public Integer SelectedrowValue{get;set;}
     public boolean DimensionIdCloseone{get;set;}
    public boolean DatesIdCloseone{get;set;}
    public void DimensionsNewone(){
       // String Filtername = apexpages.currentpage().getparameters().get('DatehiddenKPI');
        String Dimensionname = apexpages.currentpage().getparameters().get('DimhiddenKPI'); 
        
          integer Rownumber = integer.valueof(apexpages.currentpage().getparameters().get('RowNumber'));
        Dimensionname = Dimensionname.replace('<li style="cursor: pointer;width: 99%;margin-top:5px;padding: 5px;border-radius: 2px;" onclick="setActiveRowone(this)">','');
        Dimensionname = Dimensionname.replace('<li onclick="setActiveRowone(this)" style="cursor: pointer;width: 99%;margin-top:5px;padding: 5px;border-radius: 2px;">','');
        Dimensionname = Dimensionname.replace('<li style="cursor: pointer;width: 99%;margin-top:5px;padding: 5px;border-radius: 2px;" onclick="setActiveRowone(this)">','');
        Dimensionname = Dimensionname.replace('<div class="DimeItemDev" onclick="editDimModelone(this)" style="display: inline;">','').replace('"></div>','Dimsval');
        Dimensionname = Dimensionname.replace('<img height="12px" src="','').replace('" style="cursor:pointer;position:relative; z-index:2;" width="26px"></div>','Dimsval');
        Dimensionname = Dimensionname.replace('<img style="cursor:pointer;position:relative; z-index:2;" src="','').replace('" width="26px" height="12px"></div>','Dimsval').replace('<p style="margin-left:30px;margin-top:-25px">','').replace('</p>','');
        Dimensionname = Dimensionname.replace('<input type="hidden" class="selectedfield" value="','Dimsval').replace('<input class="selectedfield" type="hidden" value="','Dimsval').replace('"></li>','NewDimension');
          Dimensionname = Dimensionname.replace('<input class="selectedfield" value="','Dimsval').replace('"type="hidden','').replace('" type="hidden','');
       
        for(KPIClass KPIRec : KPIDetils){
        if(KPIRec.KPIRowNumber == Rownumber){
            list<selectedDimesionWrapper> SelectedDimensions = new list<selectedDimesionWrapper>();
        	if(Dimensionname != Null && Dimensionname != ''){
        	String[] Dimensionnamelist = Dimensionname.split('NewDimension');
        	for(String availablename : Dimensionnamelist){
        	    String[] availablenamelist = availablename.split('Dimsval');  
        	    SelectedDimensions.add(new selectedDimesionWrapper(availablenamelist[1].removeEnd(' '),false,availablenamelist[2].removeEnd(' ')));
        	}
        	
        	if(SelectedDimensions.size() <= 10 ){
        	    KPIRec.SelectedDimensions = new list<selectedDimesionWrapper>();
        	    DimensionIdCloseone = true;
        	    KPIRec.SelectedDimensions = SelectedDimensions;
        	}
        	else{
        		DimensionId = true;
        		if(SelectedDimensions.Size() > 10)
        		Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'You Cannot Select More than 10 Dimensions.'));
        		
        	}
        	}
        	else{
        	    DimensionId = true;
        	   Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'Please Select At Least 1 Dimension.'));
        	}
        }
        }
        
    }
    
    public void DatesNewone(){
        String Dimensionname = apexpages.currentpage().getparameters().get('DatehiddenKPI');
          integer Rownumber = integer.valueof(apexpages.currentpage().getparameters().get('RowNumber'));
        
        //String Dimensionname = apexpages.currentpage().getparameters().get('DimhiddenKPI'); 
        Dimensionname = Dimensionname.replace('<li style="cursor: pointer;width: 99%;margin-top:5px;padding: 5px;border-radius: 2px;" onclick="setActiveRowdateone(this)">','');
        Dimensionname = Dimensionname.replace('<li onclick="setActiveRowdateone(this)" style="cursor: pointer;width: 99%;margin-top:5px;padding: 5px;border-radius: 2px;">','');
        Dimensionname = Dimensionname.replace('<li onclick="setActiveRowdateone(this)" style="cursor: pointer; width: 99%; margin-top: 5px; padding: 5px; border-radius: 2px; background-color: lightgrey;">','');
        Dimensionname = Dimensionname.replace('<div class="dateFivDiv" onclick="editDateModelone(this)" style="display: inline;">','').replace('"></div>','Dimsval');
        Dimensionname = Dimensionname.replace('<img height="12px" src="','').replace('" style="cursor:pointer;position:relative; z-index:2;" width="26px"></div>','Dimsval');
        Dimensionname = Dimensionname.replace('<img style="cursor:pointer;position:relative; z-index:2;" src="','').replace('" width="26px" height="12px"></div>','Dimsval').replace('<p style="margin-left:30px;margin-top:-25px">','').replace('</p>','');
        Dimensionname = Dimensionname.replace('<input type="hidden" class="selectedfield" value="','Dimsval').replace('<input class="selectedfield" type="hidden" value="','Dimsval').replace('"></li>','NewDimension');
          Dimensionname = Dimensionname.replace('<input class="selectedfield" value="','Dimsval').replace('"type="hidden','').replace('" type="hidden','');
       
         for(KPIClass KPIRec : KPIDetils){
        	if(KPIRec.KPIRowNumber == Rownumber){
        	list<SelectedDateFieldWrapper> SelectedDateFieldlist = new list<SelectedDateFieldWrapper>();
        	if(Dimensionname != Null && Dimensionname != ''){
        	String[] Dimensionnamelist = Dimensionname.split('NewDimension');
                for(String availablename : Dimensionnamelist){
                    String[] availablenamelist = availablename.split('Dimsval');  
            	    SelectedDateFieldlist.add(new SelectedDateFieldWrapper(availablenamelist[1].removeEnd(' '),false,availablenamelist[2].removeEnd(' ')));
                }	
            	 if(SelectedDateFieldlist.Size() <=3){ 
            	    DatesIdCloseone = true;
            	    KPIRec.SelectedDateFieldlist = new list<SelectedDateFieldWrapper>();
            	    KPIRec.SelectedDateFieldlist = SelectedDateFieldlist;
            	 }
            	 else{
            		DateIds = true;
                    Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'You Cannot Select More than 3 DateFields.'));
                 }         
         }
         else{
             DateIds = true;
             Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'Please Select At Least 1 DateField.'));    
         }
         }
         }
        
    }
    
   public void AddFilterNewone(){ 
       try{
        string Filterlogicnew = apexpages.currentpage().getparameters().get('FilterLogics');
    	Integer RowNumber = Integer.valueof(apexpages.currentpage().getparameters().get('RowNumber'));
    	String Filtername = apexpages.currentpage().getparameters().get('FilterNamesvalues');
    	String typeofselect = apexpages.currentpage().getparameters().get('FilterNamesandVal');
    	typeofselect = typeofselect.replace('<li style="cursor: pointer;width: 99%;margin-top:5px;background-color: #E6ECF2;padding: 5px;border-radius: 2px;">','');
		typeofselect = typeofselect.replace('<div class="MeasuresDivItems" onclick="editFilterModel(this)" style="display: inline;">','');
		typeofselect = typeofselect.replace('</div><div style="display: inline;float: right;padding-right: 1px;cursor: pointer;" onclick="removeItems(this)">X</div>','');
		typeofselect = typeofselect.replace('<input type="hidden" class="typeofSelect" value="','tyurew');
		typeofselect = typeofselect.replace('<input type="hidden" class="minVal" value="','tyurew');
		typeofselect = typeofselect.replace('<input type="hidden" class="maxVal" value="','tyurew');
		typeofselect = typeofselect.replace('<input type="hidden" class="filterCon" value="','tyurew');
		typeofselect = typeofselect.replace('<input type="hidden" class="selectedfield" value="','tyurew');
		typeofselect = typeofselect.replace('<input type="hidden" class="fieldapi" value="','tyurew');     
	
		
		typeofselect = typeofselect.replace('<div class="DimeItemDev" onclick="editFilterModel(this)" style="display: inline;">','');
		typeofselect = typeofselect.replace('<input type="hidden" class="selectedIds" value="','tyurew'); 
		
	    typeofselect = typeofselect.replace('<div class="dateFivDiv" onclick="editFilterModel(this)" style="display: inline;">','');
		typeofselect = typeofselect.replace('<input type="hidden" class="fromDate" value="','tyurew');
		typeofselect = typeofselect.replace('<input type="hidden" class="toDate" value="','tyurew');
			typeofselect = typeofselect.replace('"></li>','qsytr').replace('">','');
			
			typeofselect=typeofselect.replace('<div class="index" style="display: inline; (1) </div>','').replace('<div class="index" style="display: inline; (2) </div>','').replace('<div class="index" style="display: inline; (3) </div>','');
	            typeofselect=typeofselect.replace('<div class="index" style="display: inline; (4) </div>','').replace('<div class="index" style="display: inline; (5) </div>','').replace('<div class="index" style="display: inline; (6) </div>','');
	            typeofselect=typeofselect.replace('<div class="index" style="display: inline; (7) </div>','').replace('<div class="index" style="display: inline; (8) </div>','').replace('<div class="index" style="display: inline; (9) </div>','');
	            typeofselect=typeofselect.replace('<div class="index" style="display: inline; (10) </div>','').replace('<div class="index" style="display: inline; (11) </div>','').replace('<div class="index" style="display: inline; (12) </div>','');
	            typeofselect=typeofselect.replace('<div class="index" style="display: inline; (13) </div>','').replace('<div class="index" style="display: inline; (14) </div>','').replace('<div class="index" style="display: inline; (15) </div>','');
	            typeofselect=typeofselect.replace('<div class="index" style="display: inline; (16) </div>','').replace('<div class="index" style="display: inline; (17) </div>','').replace('<div class="index" style="display: inline; (18) </div>','');
		         typeofselect=typeofselect.replace('<div class="index" style="display: inline;(1)</div>','').replace('<div class="index" style="display: inline;(2)</div>','').replace('<div class="index" style="display: inline;(3)</div>','');
	            typeofselect=typeofselect.replace('<div class="index" style="display: inline;(4)</div>','').replace('<div class="index" style="display: inline;(5)</div>','').replace('<div class="index" style="display: inline;(6)</div>','');
	            typeofselect=typeofselect.replace('<div class="index" style="display: inline;(7)</div>','').replace('<div class="index" style="display: inline;(8)</div>','').replace('<div class="index" style="display: inline;(9)</div>','');
	            typeofselect=typeofselect.replace('<div class="index" style="display: inline;(10)</div>','').replace('<div class="index" style="display: inline;(11)</div>','').replace('<div class="index" style="display: inline;(12)</div>','');
	            typeofselect=typeofselect.replace('<div class="index" style="display: inline;(13)</div>','').replace('<div class="index" style="display: inline;(14)</div>','').replace('<div class="index" style="display: inline;(15)</div>','');
	            typeofselect=typeofselect.replace('<div class="index" style="display: inline;(16)</div>','').replace('<div class="index" style="display: inline;(17)</div>','').replace('<div class="index" style="display: inline;(18)</div>','');
			typeofselect = typeofselect.replace('<input class="typeofSelect" value="','tyurew');
	typeofselect = typeofselect.Replace('<input class="maxVal" value="','tyurew');
	typeofselect = typeofselect.Replace('<input class="minVal" value="','tyurew');
	typeofselect = typeofselect.Replace('<input class="filterCon" value="','tyurew').Replace('<input class="fieldapi" value="','tyurew');  
	typeofselect = typeofselect.Replace('<input class="selectedfield" value="','tyurew').replace('"type="hidden','').replace('" type="hidden','');
	
    	 
        	InnClassEditvalues = new list<NewInnerclass>(); 
    	String NewtypeSlect = typeofselect;
    	String[] typeofSelectlist  = typeofselect.split('qsytr');
    	for(String Types :typeofSelectlist){
    	    if(Types != Null && Types != '')
    	    InnClassEditvalues.add(new NewInnerclass(Filtername,Types,RowNumber));
    	}
    	verifyError(RowNumber,Filtername,Filterlogicnew);
        
    	
    	if(!isErrorone){
    	    TableId = false;
    	    isTrue= true;

    	
    	
    	
    
    	for(KPIClass KPIRec : KPIDetils){
		if(KPIRec.KPIRowNumber == RowNumber){
		     if(KPIRec.InnClassEdit == Null)
          KPIRec.InnClassEdit= new  list<FilterInnerClassEdit>();
		     if(KPIRec.InnClassEditvaluesList == Null)
          KPIRec.InnClassEditvaluesList = new list<NewInnerclass>();
          KPIRec.InnClassEditvaluesList.add(new NewInnerclass(Filtername,NewtypeSlect,RowNumber));
          
    	         if(KPIRec.SelectedFilters == Null){
                    KPIRec.SelectedFilters = new list<FilterInnerClass>();
                } 
    			if(KPIRec.SelectedFilterList == Null){
                    KPIRec.SelectedFilterList = new list<WrapSelectedFilterList>();
        		}
        		integer i=1;
        		 integer z = 1;
        		if(KPIRec.AddFilter != Null){
        		for(Filterwrapper AddFil : KPIRec.AddFilter){
        		     AddFil.userLogic = Filterlogicnew;
        			 if(String.isNotBlank(AddFil.userLogic)){
        			        output = AddFil.userLogic;
        			         if(typeofselect != Null && typeofselect != ''){
        			     	String[] TypeSelectList = typeofselect.Split('qsytr');
                             for(string Type : TypeSelectList){
                                String Vlauesare;
                                String[] TypeMeasures = Type.Split('tyurew');
                                if(TypeMeasures[1] == 'measure'){
                            	if(TypeMeasures[4] == 'Between'){
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' >= '+String.valueof(TypeMeasures[2]).replace(',','') + ' && '+ '\''+TypeMeasures[6]+'\' <= '+ String.valueof(TypeMeasures[3]).replace(',','');
                            	}
                            	else if(TypeMeasures[4] == 'Greater Than'){
                            		 Vlauesare = '\'' +TypeMeasures[6]+'\' > '+ String.valueof(TypeMeasures[2]).replace(',','');
                            	}
                            	else if(TypeMeasures[4] == 'Greater Than Or Equal To'){
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' >= '+ String.valueof(TypeMeasures[2]).replace(',','');
                            	}
                            	else if(TypeMeasures[4] == 'Less Than'){
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' < '+String.valueof(TypeMeasures[3]).replace(',','');
                            	}
                            	else if(TypeMeasures[4] == 'Less Than Or Equal To'){
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' <= '+String.valueof(TypeMeasures[3]).replace(',','');
                            	}
                            	else if(TypeMeasures[4] == 'Equals'){
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' == '+String.valueof(TypeMeasures[2]).replace(',','');
                            	}
                            	else if(TypeMeasures[4] == 'Does Not Equal'){
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' != '+String.valueof(TypeMeasures[2]).replace(',','');
                            	}
                            	else if(TypeMeasures[4] == 'Is Null'){
                            	     Vlauesare = '\''+TypeMeasures[6]+'\' is null';
                            	}
                            	else if(TypeMeasures[4] == 'Is Not Null'){
                            	     Vlauesare = '\''+TypeMeasures[6]+'\' is not null';
                            	    
                            	}
                            	 KPIRec.InnClassEdit.add(new FilterInnerClassEdit(TypeMeasures[0].replace('&lt;','<').replace('&gt;','>'),TypeMeasures[1],TypeMeasures[2],TypeMeasures[3],TypeMeasures[4],TypeMeasures[5],FilterName,Type,TypeMeasures[6],'','',RowNumber));
                             }
                             if(TypeMeasures[1] == 'date'){
                            	if(TypeMeasures[4] == 'Between'){     
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' >= '+TypeMeasures[2] + ' && '+ '\''+TypeMeasures[6]+'\' <= '+TypeMeasures[3];
                            	}
                            	else if(TypeMeasures[4] == 'Greater Than Or Equal To'){
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' >= '+TypeMeasures[2];
                            	}
                            	else if(TypeMeasures[4] == 'Less Than Or Equal To'){
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' <= '+TypeMeasures[3];
                            	}
                            	KPIRec.InnClassEdit.add(new FilterInnerClassEdit(TypeMeasures[0].replace('&lt;','<').replace('&gt;','>'),TypeMeasures[1],'','',TypeMeasures[4],TypeMeasures[5],FilterName,type,TypeMeasures[6],TypeMeasures[2],TypeMeasures[3],RowNumber));
                             }
                             if(TypeMeasures[1] == 'dimension'){
                            	if(TypeMeasures[3] == 'Equals'){
                            	    
                            	     String Newval = '[\\\\\\"'+String.valueof(TypeMeasures[2])+']';
                            	    Newval = Newval.replace(',]','\\\\\\"]').replace(',','\\\\\\",\\\\\\"');
                            	     Vlauesare = '\''+TypeMeasures[5]+'\' in '+ Newval;
                            		
                            	}
                            	else if(TypeMeasures[3] == 'Does Not Equal'){
                            	  String Newval = '[\\\\\\"'+String.valueof(TypeMeasures[2])+']';
                            	    Newval = Newval.replace(',]','\\\\\\"]').replace(',','\\\\\\",\\\\\\"');
                            	     Vlauesare = '\''+TypeMeasures[5]+'\' not in '+ Newval;
                            	}
                            	else{
                            	     Vlauesare = '\''+TypeMeasures[5]+'\' matches \\\\\\"'+String.valueof(TypeMeasures[2]) + '\\\\\\"';
                            	}
                            	KPIRec.InnClassEdit.add(new FilterInnerClassEdit(TypeMeasures[0],TypeMeasures[1],TypeMeasures[2],'',TypeMeasures[3],TypeMeasures[4],FilterName,type,TypeMeasures[5],'','',RowNumber));
                             } 
                       
                             if(output.contains(String.valueOf(i))){
                                if(output.contains('OR '+String.valueOf(i)) || output.contains('|| '+String.valueOf(i))){
                                	output = output.replace('OR '+String.valueOf(i),'OR '+ Vlauesare+ ' '); 
                                	output = output.replace('|| '+String.valueOf(i),'|| '+ Vlauesare+ ' ');
                            	}
                            	else if(output.contains('AND '+String.valueOf(i)) || output.contains('&& '+String.valueOf(i))){
                                	output = output.replace('AND '+String.valueOf(i),'AND '+ Vlauesare+ ' '); 
                                	output = output.replace('&& '+String.valueOf(i),'&& '+ Vlauesare+ ' '); 
                            	}
                            	else if(output.contains(String.valueOf(i)+ ' ')){
                                	output = output.replace(String.valueOf(i)+ ' ',' '+ Vlauesare+ ' '); 
                            	}
                            	else if(output == String.valueOf(i)){
                                	output = output.replace(String.valueOf(i),  ' '+Vlauesare+ ' ' ); 
                            	}
                                output = output.replace(' or ',' || ').replace(' Or ',' || ').replace(' OR ',' || ');
                                output = output.replace(' And ',' && ').replace(' AND ',' && ').replace(' and ',' && '); 
                    
                             }  
                             i=i+1;
                             
                            
                               
                             }
                             KPIRec.SelectedFilters.add(new FilterInnerClass(output,FilterValue,Filtername,'','',AddFil.userLogic,''));  
                            }
        			 }
                            AddFil.FilterLogic = output;
                             KPIRec.SelectedFilterList.add(new WrapSelectedFilterList(Filtername,KPIRec.SelectedFilters,AddFil.FilterLogic,z,Filterlogicnew));
        		    }
        			 }
        			 for(WrapSelectedFilterList sl : KPIRec.SelectedFilterList){
                        sl.rowcount = z;  
                        z++;
                    }
        		}
				}
    	}
    	else{    
    	   TableId = true; 
    	}
       }
       catch(Exception e){
           
       }
    }
    
    
      public void updateFilterNewone(){
          try{
          string Filterlogicnew = apexpages.currentpage().getparameters().get('FilterLogics');
    		Integer RowNumber = Integer.valueof(apexpages.currentpage().getparameters().get('RowNumber'));
    	String Filtername = apexpages.currentpage().getparameters().get('FilterNamesvalues');
    	String typeofselect = apexpages.currentpage().getparameters().get('FilterNamesandVal');
    	 integer RowNumberCount = Integer.valueOf(Apexpages.currentpage().getParameters().get('RowNumberCount'));
    	typeofselect = typeofselect.replace('<li style="cursor: pointer;width: 99%;margin-top:5px;background-color: #E6ECF2;padding: 5px;border-radius: 2px;">','');
		typeofselect = typeofselect.replace('<div class="MeasuresDivItems" onclick="editFilterModel(this)" style="display: inline;">','');
		typeofselect = typeofselect.replace('<div onclick="editFilterModel(this)" style="display: inline;">','');
		typeofselect = typeofselect.replace('</div><div style="display: inline;float: right;padding-right: 1px;cursor: pointer;" onclick="removeItems(this)">X</div>','');
	    typeofselect = typeofselect.replace('</div><div onclick="removeItems(this)" style="display: inline;float: right;padding-right: 1px;cursor: pointer;">X</div>','');
		typeofselect = typeofselect.replace('<input type="hidden" class="typeofSelect" value="','tyurew').replace('<input class="typeofSelect" type="hidden" value="','tyurew');
		typeofselect = typeofselect.replace('<input type="hidden" class="minVal" value="','tyurew').replace('<input class="minVal" type="hidden" value="','tyurew');
		typeofselect = typeofselect.replace('<input type="hidden" class="maxVal" value="','tyurew').replace('<input class="maxVal" type="hidden" value="','tyurew');
		typeofselect = typeofselect.replace('<input type="hidden" class="filterCon" value="','tyurew').replace('<input class="filterCon" type="hidden" value="','tyurew');
		typeofselect = typeofselect.replace('<input type="hidden" class="selectedfield" value="','tyurew').replace('<input class="selectedfield" type="hidden" value="','tyurew');
		typeofselect = typeofselect.replace('<input type="hidden" class="fieldapi" value="','tyurew').replace('<input class="fieldapi" type="hidden" value="','tyurew');     
	
		
		typeofselect = typeofselect.replace('<div class="DimeItemDev" onclick="editFilterModel(this)" style="display: inline;">','');
		typeofselect = typeofselect.replace('<input type="hidden" class="selectedIds" value="','tyurew').replace('<input class="selectedIds" type="hidden" value="','tyurew'); 
		
	    typeofselect = typeofselect.replace('<div class="dateFivDiv" onclick="editFilterModel(this)" style="display: inline;">','');
		typeofselect = typeofselect.replace('<input type="hidden" class="fromDate" value="','tyurew').replace('<input class="fromDate" type="hidden" value="','tyurew');
		typeofselect = typeofselect.replace('<input type="hidden" class="toDate" value="','tyurew').replace('<input class="toDate" type="hidden" value="','tyurew');
			typeofselect = typeofselect.replace('"></li>','qsytr').replace('">','');
		typeofselect = typeofselect.replace(' tyurew','tyurew');
		
		typeofselect=typeofselect.replace('<div class="index" style="display: inline; (1) </div>','').replace('<div class="index" style="display: inline; (2) </div>','').replace('<div class="index" style="display: inline; (3) </div>','');
	            typeofselect=typeofselect.replace('<div class="index" style="display: inline; (4) </div>','').replace('<div class="index" style="display: inline; (5) </div>','').replace('<div class="index" style="display: inline; (6) </div>','');
	            typeofselect=typeofselect.replace('<div class="index" style="display: inline; (7) </div>','').replace('<div class="index" style="display: inline; (8) </div>','').replace('<div class="index" style="display: inline; (9) </div>','');
	            typeofselect=typeofselect.replace('<div class="index" style="display: inline; (10) </div>','').replace('<div class="index" style="display: inline; (11) </div>','').replace('<div class="index" style="display: inline; (12) </div>','');
	            typeofselect=typeofselect.replace('<div class="index" style="display: inline; (13) </div>','').replace('<div class="index" style="display: inline; (14) </div>','').replace('<div class="index" style="display: inline; (15) </div>','');
	            typeofselect=typeofselect.replace('<div class="index" style="display: inline; (16) </div>','').replace('<div class="index" style="display: inline; (17) </div>','').replace('<div class="index" style="display: inline; (18) </div>','');
    	         typeofselect=typeofselect.replace('<div class="index" style="display: inline;(1)</div>','').replace('<div class="index" style="display: inline;(2)</div>','').replace('<div class="index" style="display: inline;(3)</div>','');
	            typeofselect=typeofselect.replace('<div class="index" style="display: inline;(4)</div>','').replace('<div class="index" style="display: inline;(5)</div>','').replace('<div class="index" style="display: inline;(6)</div>','');
	            typeofselect=typeofselect.replace('<div class="index" style="display: inline;(7)</div>','').replace('<div class="index" style="display: inline;(8)</div>','').replace('<div class="index" style="display: inline;(9)</div>','');
	            typeofselect=typeofselect.replace('<div class="index" style="display: inline;(10)</div>','').replace('<div class="index" style="display: inline;(11)</div>','').replace('<div class="index" style="display: inline;(12)</div>','');
	            typeofselect=typeofselect.replace('<div class="index" style="display: inline;(13)</div>','').replace('<div class="index" style="display: inline;(14)</div>','').replace('<div class="index" style="display: inline;(15)</div>','');
	            typeofselect=typeofselect.replace('<div class="index" style="display: inline;(16)</div>','').replace('<div class="index" style="display: inline;(17)</div>','').replace('<div class="index" style="display: inline;(18)</div>','');
		 	typeofselect = typeofselect.replace('<input class="typeofSelect" value="','tyurew');
	typeofselect = typeofselect.Replace('<input class="maxVal" value="','tyurew');
	typeofselect = typeofselect.Replace('<input class="minVal" value="','tyurew');
	typeofselect = typeofselect.Replace('<input class="filterCon" value="','tyurew').Replace('<input class="fieldapi" value="','tyurew');  
	typeofselect = typeofselect.Replace('<input class="selectedfield" value="','tyurew').replace('"type="hidden','').replace('" type="hidden','');
	
    	 
        	InnClassEditvalues = new list<NewInnerclass>(); 
    	String NewtypeSlect = typeofselect; 
    	String[] typeofSelectlist  = typeofselect.split('qsytr');
    	for(String Types :typeofSelectlist){
    	    if(Types != Null && Types != '')
    	    InnClassEditvalues.add(new NewInnerclass(Filtername,Types,RowNumber));
    	}
    	
    	verifyErrorEdit(RowNumber,Filtername,Filterlogicnew);
    
    	
    	if(!isEditError || Test.isRunningTest()){
           isFalse= true;
    	 integer k=0;
        for(KPIClass KPIRec : KPIDetils){  
            if(KPIRec.KPIRowNumber == RowNumber){
                 if(KPIRec.InnClassEdit == Null)
          KPIRec.InnClassEdit= new  list<FilterInnerClassEdit>();
                         list<NewInnerclass> InnClassEditvaluesEditList = new list<NewInnerclass>();
                         if(KPIRec.InnClassEditvaluesList !=null){
                        for(NewInnerclass EditInns : KPIRec.InnClassEditvaluesList){
                            InnClassEditvaluesEditList.add(EditInns);
                        } 
                             
                         }
                        KPIRec.InnClassEditvaluesList = new list<NewInnerclass>();
                        for(NewInnerclass EditInnlist : InnClassEditvaluesEditList){
                            if(EditInnlist.minval != AddFilName){
                                KPIRec.InnClassEditvaluesList.add(new NewInnerclass(EditInnlist.minval,EditInnlist.typeofselect,EditInnlist.RowNumber));
                            }
                           
                        }
                        KPIRec.InnClassEditvaluesList.add(new NewInnerclass(FilterName,NewtypeSlect,RowNumber));
                        list<FilterInnerClass> FilList = new list<FilterInnerClass>();
                        list<WrapSelectedFilterList> WrapFilList = new list<WrapSelectedFilterList>();
                        list<FilterInnerClassEdit> newInnClassEdit = new list<FilterInnerClassEdit>();
                        FilterValue = FilterValue;
                        for(FilterInnerClassEdit EditInn : KPIRec.InnClassEdit){
                            newInnClassEdit.add(EditInn);
                        }
                        integer removeKPs = 1;
                        KPIRec.InnClassEdit = new list<FilterInnerClassEdit>();
                        for(FilterInnerClassEdit EditInn : newInnClassEdit){
                            if(EditInn.Fieldname != AddFilName){
                                KPIRec.InnClassEdit.add(new FilterInnerClassEdit(EditInn.Betweens,EditInn.typeofSelect,EditInn.minval,EditInn.maxVal,EditInn.filterCon,EditInn.selectedfield,EditInn.Fieldname,EditInn.FilterIds,EditInn.FieldAPI,EditInn.fromdate,EditInn.toDate,RowNumber));
                            }
                            removeKPs = removeKPs+1;
                        }
                        for(FilterInnerClass Filte : KPIRec.SelectedFilters ){
                            KPIRec.FiltersSelected = new list<String>();
                            KPIRec.FiltersSelected.add(Filte.SelectedFilters);
                            FilList.add(Filte);
                        }
                        KPIRec.SelectedFilters = new list<FilterInnerClass>(); 
                      	  for(FilterInnerClass Fil : FilList){
                                if(AddFilName != Fil.FilterNames ){    
	                                KPIRec.SelectedFilters.add(new FilterInnerClass(Fil.selectedFilters,Fil.Filtervalue,Fil.FilterNames,Fil.FieldName,Fil.Operator,Fil.UserLogic,Fil.value));
	                            }   
                            }
                        
                        for(WrapSelectedFilterList Wrap : KPIRec.SelectedFilterList){
                            WrapFilList.add(Wrap);
                        }
                        
                        for(WrapSelectedFilterList Sellist : WrapFilList){
                            if(Sellist.FilterName == AddFilName){
                                KPIRec.SelectedFilterList.remove(k)	;
                            }
                            k=K+1;
                        } 
                        if(KPIRec.SelectedFilters == Null){
                            KPIRec.SelectedFilters = new list<FilterInnerClass>();
                        }
    
    	         if(KPIRec.SelectedFilters == Null){
                    KPIRec.SelectedFilters = new list<FilterInnerClass>();
                } 
    			if(KPIRec.SelectedFilterList == Null){
                    KPIRec.SelectedFilterList = new list<WrapSelectedFilterList>();
        		}
        		integer i=1;
        		 integer z = 1;
        		if(KPIRec.EditFilter != Null){
        		for(Filterwrapper AddFil : KPIRec.EditFilter){
        		     AddFil.userLogic = Filterlogicnew;
        			 if(String.isNotBlank(AddFil.userLogic)){
        			        output = AddFil.userLogic;
        			          if(typeofselect != Null && typeofselect != ''){
        			     	String[] TypeSelectList = typeofselect.Split('qsytr');
                             for(string Type : TypeSelectList){
                                String Vlauesare;
                                String[] TypeMeasures = Type.Split('tyurew');
                                if(TypeMeasures[1] == 'measure'){
                            	if(TypeMeasures[4] == 'Between'){
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' >= '+String.valueof(TypeMeasures[2]).replace(',','') + ' && '+ '\''+TypeMeasures[6]+'\' <= '+ String.valueof(TypeMeasures[3]).replace(',','');
                            	}
                            	else if(TypeMeasures[4] == 'Greater Than'){
                            		 Vlauesare = '\'' +TypeMeasures[6]+'\' > '+ String.valueof(TypeMeasures[2]).replace(',','');
                            	}
                            	else if(TypeMeasures[4] == 'Greater Than Or Equal To'){
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' >= '+ String.valueof(TypeMeasures[2]).replace(',','');
                            	}
                            	else if(TypeMeasures[4] == 'Less Than'){
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' < '+String.valueof(TypeMeasures[3]).replace(',','');
                            	}
                            	else if(TypeMeasures[4] == 'Less Than Or Equal To'){
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' <= '+String.valueof(TypeMeasures[3]).replace(',','');
                            	}
                            	else if(TypeMeasures[4] == 'Equals'){
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' == '+String.valueof(TypeMeasures[2]).replace(',','');
                            	}
                            	else if(TypeMeasures[4] == 'Does Not Equal'){
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' != '+String.valueof(TypeMeasures[2]).replace(',','');
                            	}
                            	else if(TypeMeasures[4] == 'Is Null'){
                            	     Vlauesare = '\''+TypeMeasures[6]+'\' is null';
                            	}
                            	else if(TypeMeasures[4] == 'Is Not Null'){
                            	     Vlauesare = '\''+TypeMeasures[6]+'\' is not null';
                            	    
                            	}
                            	 KPIRec.InnClassEdit.add(new FilterInnerClassEdit(TypeMeasures[0].replace('&lt;','<').replace('&gt;','>'),TypeMeasures[1],TypeMeasures[2],TypeMeasures[3],TypeMeasures[4],TypeMeasures[5],FilterName,Type,TypeMeasures[6],'','',RowNumber));
                             }
                             if(TypeMeasures[1] == 'date'){
                            	if(TypeMeasures[4] == 'Between'){     
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' >= '+TypeMeasures[2] + ' && '+ '\''+TypeMeasures[6]+'\' <= '+TypeMeasures[3];
                            	}
                            	else if(TypeMeasures[4] == 'Greater Than Or Equal To'){
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' >= '+TypeMeasures[2];
                            	}
                            	else if(TypeMeasures[4] == 'Less Than Or Equal To'){
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' <= '+TypeMeasures[3];
                            	}
                            	KPIRec.InnClassEdit.add(new FilterInnerClassEdit(TypeMeasures[0].replace('&lt;','<').replace('&gt;','>'),TypeMeasures[1],'','',TypeMeasures[4],TypeMeasures[5],FilterName,type,TypeMeasures[6],TypeMeasures[2],TypeMeasures[3],RowNumber));
                             }
                             if(TypeMeasures[1] == 'dimension'){
                                
                            	if(TypeMeasures[3] == 'Equals'){
                            	     String Newval = '[\\\\\\"'+String.valueof(TypeMeasures[2])+']';
                            	    Newval = Newval.replace(',]','\\\\\\"]').replace(',','\\\\\\",\\\\\\"');
                            	     Vlauesare = '\''+TypeMeasures[5]+'\' in '+ Newval;
                            	}
                            	else if(TypeMeasures[3] == 'Does Not Equal'){
                            	 String Newval = '[\\\\\\"'+String.valueof(TypeMeasures[2])+']';
                            	    Newval = Newval.replace(',]','\\\\\\"]').replace(',','\\\\\\",\\\\\\"');
                            	     Vlauesare = '\''+TypeMeasures[5]+'\' not in '+ Newval;
                            	}
                            	else{
                            	     Vlauesare = '\''+TypeMeasures[5]+'\' matches \\\\\\"'+String.valueof(TypeMeasures[2]) + '\\\\\\"';
                            	}
                            	KPIRec.InnClassEdit.add(new FilterInnerClassEdit(TypeMeasures[0],TypeMeasures[1],TypeMeasures[2],'',TypeMeasures[3],TypeMeasures[4],FilterName,type,TypeMeasures[5],'','',RowNumber));
                             } 
                       
                             if(output.contains(String.valueOf(i))){
                                if(output.contains('OR '+String.valueOf(i)) || output.contains('|| '+String.valueOf(i))){
                                	output = output.replace('OR '+String.valueOf(i),'OR '+ Vlauesare+ ' '); 
                                	output = output.replace('|| '+String.valueOf(i),'|| '+ Vlauesare+ ' ');
                            	}
                            	else if(output.contains('AND '+String.valueOf(i)) || output.contains('&& '+String.valueOf(i))){
                                	output = output.replace('AND '+String.valueOf(i),'AND '+ Vlauesare+ ' '); 
                                	output = output.replace('&& '+String.valueOf(i),'&& '+ Vlauesare+ ' '); 
                            	}
                            	else if(output.contains(String.valueOf(i)+ ' ')){
                                	output = output.replace(String.valueOf(i)+ ' ',' '+ Vlauesare+ ' '); 
                            	}
                            	else if(output == String.valueOf(i)){
                                	output = output.replace(String.valueOf(i),  ' '+Vlauesare+ ' ' ); 
                            	}
                                output = output.replace(' or ',' || ').replace(' Or ',' || ').replace(' OR ',' || ');
                                output = output.replace(' And ',' && ').replace(' AND ',' && ').replace(' and ',' && '); 
                    
                             }  
                             i=i+1;
                             
                            
                               
                             }
                                 KPIRec.SelectedFilters.add(new FilterInnerClass(output,FilterValue,Filtername,'','',AddFil.userLogic,'')); 

                            }
        			 }
                            AddFil.FilterLogic = output;
                             KPIRec.SelectedFilterList.add(new WrapSelectedFilterList(Filtername,KPIRec.SelectedFilters,AddFil.FilterLogic,RowNumberCount,Filterlogicnew));
        		    }
        			 }
        		
        		}
				}
    	}
    	else{
    	    isFalse= false;
    	}
          }
       catch(Exception e){
           
       }
    }
   
      public list<FilterInnerClassEdit> InnClassEdit{get;set;}
    public list<NewInnerclass> InnClassEditvalues{get;set;}
    public list<NewInnerclass> InnClassEditvaluesList{get;set;}
    
       
    public KPI_ComponentTwo_AC(){
        DatasetMaps = new Map<String,String>();
        DatasetValuesList = new list<selectoption>();   
        MapValues  = new Map<String,String>();
        DimensionLabel = new Map<String,String>();      
        DateFullField = new Map<String,String>();
        MeasureFieldAPI = new Map<String,String>();
          versionLabel = new Map<String,String>();
        VersionUrl = new Map<String,String>();
         DatasetRecords = new list<Dataset__c>();  
           showSectionEdit = false;  
            AddAllValues1 = false;
            EditLabelsone = false;
            RowNumbers = new set<String>();
            DatasetFromJson  payTypes = new DatasetFromJson();   
             String Datasets =  getDatasets();
            if(Datasets != null && Datasets != ''){ 
                 payTypes = DatasetFromJson.parse(Datasets);
            } 
        if(payTypes.datasets != null){
            for(DatasetFromJson.cls_datasets Rep : payTypes.datasets){              
                DatasetValuesList.add(new selectOption(Rep.Id,Rep.Name));   
                DatasetMaps.put(Rep.Id,Rep.currentVersionId);  
                MapValues.put(Rep.Id,Rep.Name);
                 versionLabel.put(Rep.Id,Rep.currentVersionId) ;  
                 VersionUrl.put(Rep.Id,Rep.currentVersionUrl) ;  
          
            } 
        }
            KPIDetils = new List<KPIClass>();
            KPIDetils.add(new KPIClass('', 6,DatasetValuesList ,false)); 
                    showSectionEdit = true;
                      IntLists = new set<integer>();
        setDimensionvalue= true; 
        defaultTab1 = false;
        defaultTab2 = false;
        defaultTab3 = false;
        defaultTab4 = false;
        defaultTab5 = false;
        String SectionValues = apexpages.currentpage().getparameters().get('aid1');
        String SingleKPIvalue1 = apexpages.currentpage().getparameters().get('dbid');
        if(SingleKPIvalue1 != 'None' && SectionValues == 'None'){
        CloneFromPrevious(SingleKPIvalue1); 
        } 
        
        String AllKPIvaluesone = apexpages.currentpage().getparameters().get('Allvaluestwo');
        System.debug('Allvaluesone **************' + AllKPIvaluesone);
        
        if(AllKPIvaluesone != '' && AllKPIvaluesone != null){
            CloneFromPreviousNewtwo(AllKPIvaluesone);  
        }
                        
    } 
    
     public void CloneFromPreviousNewtwo(String Values){
        String[] Newvalues = values.split(';');
        String[] Newvalues1 = Newvalues[1].split(',');
        String[] Newvalues2 = Newvalues[0].split(',');
        KPIDetils = new List<KPIClass>();   
        integer KPIStringss = 6;
        for(String S : Newvalues1){ 	
    		KPIDetils.add(new KPIClass(S,KPIStringss,DatasetValuesList ,false));
    		KPIStringss = KPIStringss + 1;
        }
        if(KPIDetils.size() > 0){
             
            try{  
        	list<String> SetLists = new list<String>();
            integer k =0; 
                for(KPIClass KPIRec : KPIDetils){ 
				if(KPIRec.KPIname != Null && KPIRec.KPIname != ''){
                    		KPIRec.SelectedFilterList = new list<WrapSelectedFilterList>();
							KPIRec.SelectedDimensions = new list<selectedDimesionWrapper>();						
							KPIRec.SelectedDateFieldlist = new list<SelectedDateFieldWrapper>();					
							KPIRec.selectedMeasures	= new set<string>();
							CurrentVersionId = versionLabel.get(Newvalues2[k]);
							CurrentVersionUrl = VersionUrl.get(Newvalues2[k]);
							KPIRec.dataSet = Newvalues2[k];
							DatasetDimensionFromJson  DimensionTypes = new DatasetDimensionFromJson();
							string DimensionsReturnValue = Dimensions(KPIRec.dataSet);
                        	if(DimensionsReturnValue != null &&DimensionsReturnValue != ''){
                        		DimensionTypes = DatasetDimensionFromJson.parse(DimensionsReturnValue);
                        	}
                        	if(DimensionTypes.dimensions !=null){
                                for(DatasetDimensionFromJson.cls_dimensions Dim : DimensionTypes.dimensions){ 
                	                SetLists.add(Dim.Field);
                                }
                             }
                        	if(DimensionTypes.measures !=null){
                        		for(DatasetDimensionFromJson.cls_measures Dim : DimensionTypes.measures){  
                        			if(Dim.showInExplorer == true) {                
                        			MeasureFieldAPI.put(Dim.label,Dim.Field);       
                        			}                     
                        		} 
                        	}
                         KPIRec.SelectedFilters = new list<FilterInnerClass>();
                            KPIRec.SelectedFilterList = new list<WrapSelectedFilterList>();
                        KPIRec.SelectedFilterList.add(new WrapSelectedFilterList('All',KPIRec.SelectedFilters,'\''+SetLists[0]+ '\' in all',0,'1'));
                        KPIRec.dataSet = Newvalues2[k];
                		  //  if(KPIRec.KPIRownumber == 6){                        
                    //         Wave_CreateDateXMD CreateXmd = new Wave_CreateDateXMD();
                    //         if(!Test.isRunningTest())
                    //             Wave_CreateDateXMD.CreateDateXMD(KPIRec.dataSet);
                    //     } 
                        
                    } 
                    k=K+1;
                 
                }
                if(KPIStringss >= 6 && KPIStringss <= 9){
					KPIDetils.add(new KPIClass('', KPIStringss,DatasetValuesList ,false));
				}
        }  
        catch(Exception e){
            
        }
	    }
    }
     public boolean SetMeasure{get;set;}        
    public list<availableDimesionWrapper> availabledimensions{get;set;}   
    public set<integer> IntLists{get;set;}
    //public Boolean Sectionone{get;set;}   
    public void SaveKPI(){
      try{
      KPINameUI= System.currentPageReference().getParameters().get('hiddenKPI1');
      KPIValue= System.currentPageReference().getParameters().get('KPIValue1');
      	 list<String> SetList = new list<String>();
      if(KPINameUI != Null && KPINameUI != ''){
        for(KPIClass KPIRec : KPIDetils){ 
            if(KPIRec.KPIRownumber == integer.valueOf(KPIValue)){
            
            if(KPIRec.dataset != SelectKPIValue || KPIRec.KPIname == '' || KPIRec.KPIname == null){
            	KPIRec.SelectedFilterList = new list<WrapSelectedFilterList>();
    			KPIRec.SelectedDimensions = new list<selectedDimesionWrapper>();						
    			KPIRec.SelectedDateFieldlist = new list<SelectedDateFieldWrapper>();					
    			KPIRec.selectedMeasures	= new set<string>();
    			KPIRec.dataSet = SelectKPIValue;
    				DatasetDimensionFromJson  DimensionTypes = new DatasetDimensionFromJson();
              
    			 string DimensionsReturnValue = Dimensions(KPIRec.dataSet);
                        	if(DimensionsReturnValue != null &&DimensionsReturnValue != ''){
                        		DimensionTypes = DatasetDimensionFromJson.parse(DimensionsReturnValue);
                        	}
                        		if(DimensionTypes.dimensions !=null){
                                for(DatasetDimensionFromJson.cls_dimensions Dim : DimensionTypes.dimensions){ 
                	                SetList.add(Dim.Field);
                                }
                             }
                        	if(DimensionTypes.measures !=null){
                        		for(DatasetDimensionFromJson.cls_measures Dim : DimensionTypes.measures){  
                        			if(Dim.showInExplorer == true) {                
                        			MeasureFieldAPI.put(Dim.label,Dim.Field); 
                        			}                     
                        		} 
                        	}
                        	
                        	 KPIRec.SelectedFilters = new list<FilterInnerClass>();
                            KPIRec.SelectedFilterList = new list<WrapSelectedFilterList>();
                        KPIRec.SelectedFilterList.add(new WrapSelectedFilterList('All',KPIRec.SelectedFilters,'\''+SetList[0]+ '\' in all',0,'1'));
          
            }
            KPIRec.KPIname = KPINameUI;
            
            //       if(KPIRec.KPIRownumber == 6){                        
            //         Wave_CreateDateXMD CreateXmd = new Wave_CreateDateXMD();
            //         if(!Test.isRunningTest())
            //         try{
            //         Wave_CreateDateXMD.CreateDateXMD(KPIRec.dataSet);         
            //         }catch(Exception e){
                        
            //         }        
            //   }
            }
        } 
        if(integer.valueOf(KPIValue) >= 6 && integer.valueOf(KPIValue) <= 9   && !IntLists.contains(integer.valueOf(KPIValue))){
        	Integer KPIRows = integer.valueOf(KPIValue)+1;
            KPIDetils.add(new KPIClass('',KPIRows,DatasetValuesList ,false));
            IntLists.add(integer.valueOf(KPIValue));
        } 
        SelectKPIValue = ''; 
      } 
                                               
    } 
     catch(Exception e){  
        }
  } 
  
    public String DateLabels{get;set;} 
    
    public Void EditLabelClass2(){
    	DimStrings = false;
    	DateStrings = true;
    	measStrings = false;
    	DateLabels = System.currentPageReference().getParameters().get('EditTopic');   
    	KPINameUI= DateLabels;
    }
    public String MeasLabels{get;set;} 
    public Void MeasLabelClass2(){
    	DimStrings = false;
    	DateStrings = false;
    	measStrings = true;
    	MeasLabels = System.currentPageReference().getParameters().get('MeasTopic');   
    	KPINameUI= MeasLabels;
    	 String MeasureRecordval = System.currentPageReference().getParameters().get('Menuitemsval');
     integer newvar = integer.valueOf(System.currentPageReference().getParameters().get('RowValues1')); 
        
        system.debug('MeasureRecordval***************'+ MeasureRecordval);
        if(MeasureRecordval != Null && MeasureRecordval != '' && MeasureRecordval.contains('<li')){
            system.debug('MeasureRecordval***********'+MeasureRecordval);
             MeasureRecordval = MeasureRecordval.Replace('"><li','').replace('<input type="hidden" class="parentSelected" value="',''); 
             MeasureRecordval = MeasureRecordval.Replace('<input class="parentSelected" type="hidden" value="','');
             MeasureRecordval = MeasureRecordval.Replace('<input type="hidden" class="itemSelected" value="','');
             MeasureRecordval = MeasureRecordval.Replace('<input class="itemSelected" type="hidden" value="','');
             MeasureRecordval = MeasureRecordval.Replace('<input type="hidden" class="editSelected" value="','');
             MeasureRecordval = MeasureRecordval.Replace('<input class="editSelected" type="hidden" value="','');
             MeasureRecordval = MeasureRecordval.Replace('<input type="hidden" class="editApi" value="','');
             MeasureRecordval = MeasureRecordval.Replace('<input class="editApi" type="hidden" value="','');
             MeasureRecordval = MeasureRecordval.Replace('<div style="cursor: pointer;overflow:hidden;text-overflow:ellipsis;width:87%;float:left;padding-left:30px" onclick="editItems(this,1)"> ','');
             MeasureRecordval = MeasureRecordval.Replace('<div onclick="editItems(this,1)" style="cursor: pointer;overflow:hidden;text-overflow:ellipsis;width:87%;float:left;padding-left:30px"> ','');
             MeasureRecordval = MeasureRecordval.Replace('<div style="cursor: pointer;overflow:hidden;text-overflow:ellipsis;width:87%;float:left;padding-left:30px" onclick="editItems(this,1)">','');
             MeasureRecordval = MeasureRecordval.Replace('<div onclick="editItems(this,1)" style="cursor: pointer;overflow:hidden;text-overflow:ellipsis;width:87%;float:left;padding-left:30px">','');
             MeasureRecordval = MeasureRecordval.Replace('</div>','').replace('<div style="cursor: pointer;display:none" ','');
             MeasureRecordval = MeasureRecordval.Replace('<img style="cursor:pointer;position:relative; z-index:2;" src="','');
             MeasureRecordval = MeasureRecordval.Replace('<img height="10px" src="','');
             MeasureRecordval = MeasureRecordval.Replace('<img height="12px" onclick="removeItemsone(this,1,\'','');
             MeasureRecordval = MeasureRecordval.Replace('\')" src="/resource/1490525779000/analyticscc__Delete" style="cursor:pointer;position:relative; z-index:2;" width="26px">','');
             MeasureRecordval = MeasureRecordval.Replace('" style="cursor:pointer;position:relative; z-index:2;" width="20px">','');
             MeasureRecordval = MeasureRecordval.Replace('" width="20px" height="10px" />','');
             MeasureRecordval = MeasureRecordval.Replace('<img style="cursor:pointer;position:relative; z-index:2;"  src="','');
             MeasureRecordval = MeasureRecordval.replace('" onclick="removeItemsone(this,1,\'','cntrws').replace('</li>','rwsallval').replace('">','cntrws');
             MeasureRecordval = MeasureRecordval.replace('\')" width="26px" height="12px" />','');
             MeasureRecordval = MeasureRecordval.replace('<input class="parentSelected" value="','cntrws').replace('\') ">','');
	MeasureRecordval = MeasureRecordval.Replace('<input class="itemSelected" value="','').replace('\')">','');
	MeasureRecordval = MeasureRecordval.Replace('<input class="editApi" value="','');  
	MeasureRecordval = MeasureRecordval.Replace('<input class="editSelected" value="','').replace('"type="hidden','').replace('" type="hidden','');
	
            String[] MeasureLists = MeasureRecordval.split('rwsallval');
            for(KPIClass KPI : KPIDetils){
                if(KPI.KPIRowNumber == newvar){
                KPI.selectedMeasures = new set<String>();
                KPI.NewMeasurevarlist = new list<MeasureAngularclass>();
                 for(String Measurewrap : MeasureLists){
                     if(Measurewrap != Null && Measurewrap != ''){
                     String[] NewMsList = Measurewrap.split('cntrws');
                     String sumoflist;
                     system.debug('NewMsList[3] "'+NewMsList[3] + '"');
                     if(NewMsList[3] == 'count(Rows)'){
                         sumoflist = 'count(Rows)';
                     }
                     else{
                         sumoflist = NewMsList[3];
                     }
                      String NewMsListString = '';
                  if(NewMsList[1].contains('count')){
                       NewMsListString='count';
                    }
                    if(NewMsList[1].contains('sum')){
                        NewMsListString='sum';
                    }
                    if(NewMsList[1].contains('avg')){
                        NewMsListString='avg';
                    }
                    if(NewMsList[1].contains('min')){
                        NewMsListString='min';
                    }
                    if(NewMsList[1].contains('min')){
                        NewMsListString='min';
                    }
                    if(NewMsList[1].contains('stddev')){
                        NewMsListString='stddev';
                    }
                    if(NewMsList[1].contains('stddevp')){
                        NewMsListString='stddevp';
                    }
                    if(NewMsList[1].contains('var')){
                        NewMsListString='var';
                    }
                    if(NewMsList[1].contains('varp')){
                        NewMsListString='varp';
                    }
                    if(NewMsList[1].contains('unique')){
                       NewMsListString='unique';
                    }
                    if(NewMsList[1].contains('median')){
                            NewMsListString='median';
                        }
                        if(NewMsList[1].contains('first')){
                            NewMsListString='first';
                        }
                        if(NewMsList[1].contains('last')){
                            NewMsListString='last';
                        }
                        String Var;
                        String[] NewMsListspace = NewMsList[2].split('  ');
                        for(string Nes :NewMsListspace){
                            if(Nes != '' && Nes != null){
                                Var = Nes;
                            }
                        }
                     
                        KPI.selectedMeasures.add(sumoflist);
                        KPI.NewMeasurevarlist.add(new MeasureAngularclass(sumoflist,NewMsListString.replace(' ',''),Var,sumoflist,NewMsList[4]));
                        
                     }
                 }
            } 
            }
        } 
    }
    
    public map<String,String> EditDateMapping = new map<String,String>();
    public void SaveEditLabels(){
    	try{
    	    if(KPINameUI != null && KPINameUI != ''){
    	Integer RowValues1= Integer.valueof(System.currentPageReference().getParameters().get('RowValues1'));	
    	for(KPIClass KPIRec :KPIDetils){
    		if(KPIRec.KPIRowNumber == RowValues1){
    		if(KPIRec.SelectedDateFieldlist != Null){
    		for(SelectedDateFieldWrapper SelDate : KPIRec.SelectedDateFieldlist){
    			if(SelDate.DateFieldName == DateLabels){
    				SelDate.DateFieldName = KPINameUI;
    				if(DateFullField.get(DateLabels) != Null){
    					EditDateMapping.put(KPINameUI,DateLabels);
    				}
    				else{
    					EditDateMapping.put(KPINameUI,EditDateMapping.get(DateLabels));	
    				}
    				KPIRec.NewStringDate.remove(DateLabels);
    				KPIRec.NewStringDate.add(DateLabels);
    			}
    			else{
    				if(EditDateMapping.get(SelDate.DateFieldName) == Null)
    				EditDateMapping.put(SelDate.DateFieldName,SelDate.DateFieldName);
    			}
    		}
    	}
    	}
    	}
    	previous();
    	}
    	}catch(Exception e){
    		
    	}
    }
    public map<String,String> EditMeasMapping = new map<String,String>();
   public void SaveMeasLabels(){
    	try{
    	    if(KPINameUI != null && KPINameUI != ''){
    	Integer RowValues1= Integer.valueof(System.currentPageReference().getParameters().get('RowValues1'));	
    	for(KPIClass KPIRec :KPIDetils){
    		if(KPIRec.KPIRowNumber == RowValues1){
    		     for(MeasureAngularclass Mes :  KPIRec.NewMeasurevarlist){
            	     if(Mes.Measurename == MeasLabels){
            	         Mes.Measurename = KPINameUI;
            	         Mes.EditMeasval = KPINameUI;
            	     }
            	 }
    		set<String> SetMeas = new Set<String>();
    		if(KPIRec.selectedMeasures != Null){
    		for(String SelDate : KPIRec.selectedMeasures){
    			
    			if(SelDate == MeasLabels){
    				SelDate = KPINameUI;
    				
    				MeasLabels = MeasLabels.replace('(',';');  				 
                     String[] MeasLabellist = MeasLabels.Split(';');
                     
                     String LabelFields;
                     if(MeasLabellist.Size()>1 ){
                     LabelFields = MeasLabellist[1].replace(')','');
                     }
                     MeasLabels = MeasLabels.replace(';','('); 
                     if(MeasureFieldAPI.get(LabelFields) != Null){
    					 EditMeasMapping.put(KPINameUI,MeasLabels.replace(';','('));
                     } 
                     else{
                     	if(EditMeasMapping.get(MeasLabels.replace(';','(')) == Null){
                     	EditMeasMapping.put(KPINameUI,MeasLabels.replace(';','('));
                     	}
                     	else{
                     		EditMeasMapping.put(KPINameUI,EditMeasMapping.get(MeasLabels.replace(';','(')));	
                     	}
                     }   				
    			}
    			else{
    				if(EditMeasMapping.get(SelDate) == Null)
    				EditMeasMapping.put(SelDate,SelDate);
    			}
    			SetMeas.add(SelDate);
    		}
    		 KPIRec.selectedMeasures.Clear();
    		 for(String Str : SetMeas){
    		 	KPIRec.selectedMeasures.add(Str);
    		 }
    	}
    	}
    	}
    	EditLabelsone = true;
    	previous();
    	}
    	}catch(Exception e){
    		
    	}
    }
   
    public boolean DateStrings{get;set;}
    public boolean DimStrings{get;set;}
    public boolean measStrings{get;set;}
    public String DimensionLabels{get;set;} 
   
    public Void EditDimClass2(){
    	DimStrings = true;
    	DateStrings = false;
    	measStrings = false;
    	DimensionLabels = System.currentPageReference().getParameters().get('EditDim');
    	KPINameUI= DimensionLabels;
    }
    public map<String,String> EditDimMapping = new map<String,String>();
    public void SaveDimLabels(){
    	try{
    	    if(KPINameUI != null && KPINameUI != ''){
    	Integer RowValues1= Integer.valueof(System.currentPageReference().getParameters().get('RowValues1'));	
    	for(KPIClass KPIRec :KPIDetils){
    		if(KPIRec.KPIRowNumber == RowValues1){
    		if(KPIRec.SelectedDimensions != Null){
    		for(selectedDimesionWrapper SelDate : KPIRec.SelectedDimensions){
    			if(SelDate.Availablename == DimensionLabels){
    				SelDate.Availablename = KPINameUI;
    				if(DimensionLabel.get(DimensionLabels) != Null){
    					EditDimMapping.put(KPINameUI,DimensionLabels);
    				}
    				else{
    					EditDimMapping.put(KPINameUI,EditDimMapping.get(DimensionLabels));
    				}
    				KPIRec.NewString.remove(DimensionLabels);
    				KPIRec.NewString.add(KPINameUI);
    			}
    			else{
    				if(EditDimMapping.get(SelDate.Availablename) == Null)
    				EditDimMapping.put(SelDate.Availablename,SelDate.Availablename);
    			}
    		}
    	}
    	
    	}
    	}
    previous();
    }
    }catch(Exception e){
    		
    	}
    }            
    public void CloseKPIUI(){
        KPINameUI = '';
    }               
   
    
    public void ActTabshide(){ 
        defaultTab1 = false;
        defaultTab2 = true;
        defaultTab3 = false;
        defaultTab4 = false;
        defaultTab5 = false;    
        
    }
    
    public String Dimensions(String Dropvalue){
        try{
            String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v39.0';
            String datasetId = Dropvalue;
            String versionId = DatasetMaps.get(datasetId);
            String endpoint;
            endpoint = sfdcInstance + '/wave/datasets/'+ datasetId +'/versions/' + versionId +'/xmds/main';                 
            Http http = new Http();
            HttpRequest req = new HttpRequest();
            req.setEndpoint(endpoint);   
            req.setMethod('GET');
            req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
            req.setHeader('content-type', 'application/json');         
            HttpResponse res;
           if(!Test.isRunningTest()){
            res = http.send(req);            
            return res.getBody();  
        }
        else{
                return null;
            }
        }
        catch(Exception e){
            return null;   
        }
    }                         
    public String getDatasets() {
        try{
        String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v39.0';
        String endpoint;
        endpoint = sfdcInstance + '/wave/datasets?pageSize=200';         
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);   
        req.setMethod('GET');
        req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
        req.setHeader('content-type', 'application/json');         
        HttpResponse res;
        
        if(!Test.isRunningTest()){
            res = http.send(req);            
            return res.getBody();  
        }
        else{
                return null;
            }
        }
            catch(Exception e){
            return null;   
        } 
    }   
    public integer SelectedrowValue1{get;set;}
    public void ActTabs(){ 
        tabid= System.currentPageReference().getParameters().get('tabid1'); 
        for(KPIClass KPI : KPIDetils){
            if(integer.valueOf(tabid) == KPI.KPIRownumber){  
       	        CurrentVersionId = versionLabel.get(KPI.dataset);
                CurrentVersionUrl = VersionUrl.get(KPI.dataset);
                KPIDatasets = KPI.dataset;
            }
        }  
        
        defaultTab2 = true;     
        SelectedrowValue1 = integer.valueOf(tabid);
    }
    public String KPIDatasets{get;set;}
    public string CurrentVersionId{get;set;}
    public string CurrentVersionUrl{get;set;}
     
     public void Previous(){
        try{
         String MeasureRecordval = System.currentPageReference().getParameters().get('Menuitemsval');
         integer RowNumber;
          if(System.currentPageReference().getParameters().get('RowNumber') != Null && System.currentPageReference().getParameters().get('RowNumber') != ''){
          RowNumber = integer.valueof(System.currentPageReference().getParameters().get('RowNumber'));
          }
        
        system.debug('MeasureRecordval***************'+ MeasureRecordval);
        if(MeasureRecordval != Null && MeasureRecordval != '' && MeasureRecordval.contains('<li ') && EditLabelsone == false){
        system.debug('MeasureRecordval***********'+MeasureRecordval);
         MeasureRecordval = MeasureRecordval.Replace('"><li','').replace('<input type="hidden" class="parentSelected" value="','');
         MeasureRecordval = MeasureRecordval.Replace('<input class="parentSelected" type="hidden" value="','');
         MeasureRecordval = MeasureRecordval.Replace('<input type="hidden" class="itemSelected" value="','');
         MeasureRecordval = MeasureRecordval.Replace('<input class="itemSelected" type="hidden" value="','');
             MeasureRecordval = MeasureRecordval.Replace('<input type="hidden" class="editApi" value="','');
             MeasureRecordval = MeasureRecordval.Replace('<input class="editApi" type="hidden" value="','');
         
         MeasureRecordval = MeasureRecordval.Replace('<input type="hidden" class="editSelected" value="','');
         MeasureRecordval = MeasureRecordval.Replace('<input class="editSelected" type="hidden" value="','');
         MeasureRecordval = MeasureRecordval.Replace('<div style="cursor: pointer;overflow:hidden;text-overflow:ellipsis;width:87%;float:left;padding-left:30px" onclick="editItems(this,1)"> ','');
         MeasureRecordval = MeasureRecordval.Replace('<div onclick="editItems(this,1)" style="cursor: pointer;overflow:hidden;text-overflow:ellipsis;width:87%;float:left;padding-left:30px"> ','');
         MeasureRecordval = MeasureRecordval.Replace('<div style="cursor: pointer;overflow:hidden;text-overflow:ellipsis;width:87%;float:left;padding-left:30px" onclick="editItems(this,1)">','');
         MeasureRecordval = MeasureRecordval.Replace('<div onclick="editItems(this,1)" style="cursor: pointer;overflow:hidden;text-overflow:ellipsis;width:87%;float:left;padding-left:30px">','');
         MeasureRecordval = MeasureRecordval.Replace('</div>','').replace('<div style="cursor: pointer;">','cntrws');
         MeasureRecordval = MeasureRecordval.Replace('<img style="cursor:pointer;position:relative; z-index:2;" src="','');
         MeasureRecordval = MeasureRecordval.Replace('<img height="10px" src="','');
         MeasureRecordval = MeasureRecordval.Replace('<img height="12px" onclick="removeItemsone(this,1,\'','');
         MeasureRecordval = MeasureRecordval.Replace('\')" src="/resource/1490525779000/analyticscc__Delete" style="cursor:pointer;position:relative; z-index:2;" width="26px">','');
         MeasureRecordval = MeasureRecordval.Replace('" style="cursor:pointer;position:relative; z-index:2;" width="20px">','');
         MeasureRecordval = MeasureRecordval.Replace('" width="20px" height="10px" />','');
         MeasureRecordval = MeasureRecordval.Replace('<img style="cursor:pointer;position:relative; z-index:2;"  src="','');
         MeasureRecordval = MeasureRecordval.replace('" onclick="removeItemsone(this,1,\'','cntrws').replace('</li>','rwsallval').replace('">','cntrws');
         MeasureRecordval = MeasureRecordval.replace('\')" width="26px" height="12px" />','');
         MeasureRecordval = MeasureRecordval.replace('<input class="parentSelected" value="','cntrws').replace('\') ">','');
	MeasureRecordval = MeasureRecordval.Replace('<input class="itemSelected" value="','').replace('\')">','');
	MeasureRecordval = MeasureRecordval.Replace('<input class="editApi" value="','');  
	MeasureRecordval = MeasureRecordval.Replace('<input class="editSelected" value="','').replace('"type="hidden','').replace('" type="hidden','');
	
        String[] MeasureLists = MeasureRecordval.split('rwsallval');
        for(KPIClass KPI : KPIDetils){
            if(KPI.KPIRownumber == RowNumber){
            KPI.selectedMeasures = new set<String>();
             KPI.NewMeasurevarlist = new list<MeasureAngularclass>();
             for(String Measurewrap : MeasureLists){
                 if(Measurewrap != Null && Measurewrap != ''){
                 String[] NewMsList = Measurewrap.split('cntrws');
                 String sumoflist;
                 system.debug('NewMsList[3] "'+NewMsList[3] + '"');
                 if(NewMsList[3] == 'count(Rows)'){
                     sumoflist = 'count(Rows)';
                    
                 }
                 else{
                     sumoflist = NewMsList[3];
                 }
                 
                 String NewMsListString = '';
                  if(NewMsList[1].contains('count')){
                       NewMsListString='count';
                    }
                    if(NewMsList[1].contains('sum')){
                        NewMsListString='sum';
                    }
                    if(NewMsList[1].contains('avg')){
                        NewMsListString='avg';
                    }
                    if(NewMsList[1].contains('min')){
                        NewMsListString='min';
                    }
                    if(NewMsList[1].contains('min')){
                        NewMsListString='min';
                    }
                    if(NewMsList[1].contains('stddev')){
                        NewMsListString='stddev';
                    }
                    if(NewMsList[1].contains('stddevp')){
                        NewMsListString='stddevp';
                    }
                    if(NewMsList[1].contains('var')){
                        NewMsListString='var';
                    }
                    if(NewMsList[1].contains('varp')){
                        NewMsListString='varp';
                    }
                    if(NewMsList[1].contains('unique')){
                       NewMsListString='unique';
                    }
                    if(NewMsList[1].contains('median')){
                            NewMsListString='median';
                        }
                        if(NewMsList[1].contains('first')){
                            NewMsListString='first';
                        }
                        if(NewMsList[1].contains('last')){
                            NewMsListString='last';
                        }
                    String Var;
                    String[] NewMsListspace = NewMsList[2].split('  ');
                    for(string Nes :NewMsListspace){
                        if(Nes != '' && Nes != null){
                            Var = Nes;
                        }
                    }
                    system.debug('NewMsListspace ' + NewMsListspace);
                    KPI.selectedMeasures.add(sumoflist);
                     KPI.NewMeasurevarlist.add(new MeasureAngularclass(sumoflist,NewMsListString.replace(' ',''),Var,sumoflist,NewMsList[4]));
                    system.debug('KPI.selectedMeasures '+ KPI.selectedMeasures + ' Size' + KPI.selectedMeasures.size());
                 }
             }
            } 
        }
        }
        else{
            for(KPIClass KPI : KPIDetils){
            if(KPI.KPIRownumber == RowNumber){
            //KPI.selectedMeasures = new set<String>();
            // KPI.NewMeasurevarlist = new list<MeasureAngularclass>();
            }
            }
        }
        	isFalse = False;
        	isTrue = False;
        	EditLabelsone = false;
        		DatesIdCloseone = false;
        DimensionIdCloseone = false;
        	list<Dataset__c> DatasetList = [select id from Dataset__c  where Session_Id__c =: SessionsId and RowNumber__c >=6 And RowNumber__c <= 10 order by RowNumber__c limit 5];     
            Delete DatasetList;
             for (Integer i = (KPIDetils.size()-1) ; i>= 0 ; i--){
                String s = KPIDetils[i].KPIName;
                if(s == ''){
                    KPIDetils.remove(i);
                }
            } 
            DatasetRecords = new list<Dataset__c>(); 
          list<KPIClass> nlist = new list<KPIClass>(); 
          for(integer j=6;j<KPIDetils.Size()+7;j++){ 
            boolean a = false;
            boolean b = false;
             
            for(KPIClass KPI : KPIDetils){
                if(j == KPI.KPIRownumber && KPI.KPIName != ''){
                   a=true;
                String  AvailableDimension = '';
                String DimensionApi= '';
                String  AvailableDateField = ''; 
                String  DateFieldApi = '';
                String  AvailableMeasure = ''; 
                String  MeasureAPI = ''; 
                String  FilterName = '';
                String AliasMeasureAPIN = '';
                String CompactMeasureAPIN = '';
                string Filtercode = '';
                integer i=1;
                if(KPI.selectedDimensions != null){   
                    for(selectedDimesionWrapper Avail : KPI.selectedDimensions){
                        AvailableDimension += Avail.Availablename;
                        if(EditDimMapping.get(Avail.Availablename) != null){
		                        	DimensionApi += DimensionLabel.get(EditDimMapping.get(Avail.Availablename));
		                        }
		                        else{
		                        	DimensionApi += DimensionLabel.get(Avail.Availablename);
		                        }
                         if(KPI.selectedDimensions.Size() >= i+ 1){
                            AvailableDimension += ',';
                            DimensionApi += ',';
                        }
                        i++;
                    }
                }
                i=1;
           
                if(KPI.SelectedDateFieldlist != null){
                    for(SelectedDateFieldWrapper DateField : KPI.SelectedDateFieldlist){                           
                        AvailableDateField += DateField.DateFieldname;                                  
                        if(EditDateMapping.get(DateField.DateFieldname) != Null){                                
		                        	DateFieldApi += DateFullField.get(EditDateMapping.get(DateField.DateFieldname));
		                        }
		                        else{
		                        	DateFieldApi += DateFullField.get(DateField.DateFieldname);	
		                        }
                        if(KPI.SelectedDateFieldlist.Size() >= i + 1){
                            AvailableDateField += ',';
                            DateFieldApi += ',';
                        }                       
                        i++;
                    }
                }
                i=1;
                if( KPI.selectedMeasures !=  Null){
                            for(String Measurewrap : KPI.selectedMeasures){                 
                                AvailableMeasure += Measurewrap;
                                if(EditMeasMapping.get(Measurewrap) == Null){
		                        	Measurewrap = Measurewrap.replace('(',';');   
		                        }
		                        else{
		                        	 Measurewrap = EditMeasMapping.get(Measurewrap).replace('(',';');   
		                        }                        
                                String[] DateFieldlist = Measurewrap.Split(';');
                                String DateFields;

		                        	DateFields = DateFieldlist[1].replace(')','');
		                        
                                if(DateFields != Null && DateFields != 'Probability '){
                                    if(DateFieldlist[0] != 'count' && DateFieldlist[0] != 'count ' && DateFieldlist[0] != 'unique'){
                                        MeasureAPI += DateFieldlist[0] +'(\'' + MeasureFieldAPI.get(DateFields) + '\')';
                                        AliasMeasureAPIN += DateFieldlist[0]+ '_' + MeasureFieldAPI.get(DateFields);
                                        CompactMeasureAPIN += '[\\"'+DateFieldlist[0] + '\\",\\"'+ MeasureFieldAPI.get(DateFields) + '\\"]';    
                                    }
                                    if(DateFieldlist[0] == 'unique' && DimensionLabel.get(DateFields) != Null && DimensionLabel.get(DateFields) != '') {
                                        MeasureAPI += 'unique(\'' + DimensionLabel.get(DateFields) + '\')';
                                        AliasMeasureAPIN += 'unique_' + DimensionLabel.get(DateFields);
                                        CompactMeasureAPIN += '[\\"'+DateFieldlist[0] + '\\",\\"'+ DimensionLabel.get(DateFields) + '\\"]';
                                    }
                                    if(DateFieldlist[0] == 'unique' && MeasureFieldAPI.get(DateFields) != Null && MeasureFieldAPI.get(DateFields) != '') {
                                        MeasureAPI += 'unique(\'' + MeasureFieldAPI.get(DateFields) + '\')';
                                        AliasMeasureAPIN += 'unique_' + MeasureFieldAPI.get(DateFields);
                                        CompactMeasureAPIN += '[\\"'+DateFieldlist[0] + '\\",\\"'+ MeasureFieldAPI.get(DateFields) + '\\"]';
                                    }
                                    if(DateFieldlist[0] == 'Count ' || DateFieldlist[0] == 'Count'){
                                        MeasureAPI += 'count()';
                                        AliasMeasureAPIN += 'count';
                                        CompactMeasureAPIN += '[\\"count\\",\\"*\\"]';                                               
                                    }
                                    
                                }
                                if(DateFields == 'Probability '){
                                        MeasureAPI += DateFieldlist[0]+'(\'Probability\')';
                                        AliasMeasureAPIN += DateFieldlist[0]+ '_Probability';
                                        CompactMeasureAPIN += '[\\"'+DateFieldlist[0] + '\\",\\"Probability\\"]';    
                                    }
                                if(KPI.selectedMeasures.Size() >= i + 1 ){
                                    AvailableMeasure += ',';
                                    MeasureAPI += ',';
                                    AliasMeasureAPIN += ',';
                                    CompactMeasureAPIN += ',';
                                }
                                i++;                        
                            }
                        }
                i=1;
                String UserLogic = '';
                String Filters = '';
                if(KPI.SelectedFilterList != Null){
                    for(WrapSelectedFilterList Filter : KPI.SelectedFilterList){
                        FilterName += Filter.Output;
                        Filters += Filter.Filtername;
                        if(Filter.Filtername == 'All'){
                                    UserLogic += '1';
                        }
                        for(FilterInnerclass Selec : Filter.selectedFilters){
                        	if(Filter.Filtername == Selec.FilterNames){
                        		UserLogic += Selec.UserLogic;
                        		break;
                        	}
                        }
                        if(KPI.SelectedFilterList.Size() >= i+1){
                            FilterName += ';';
                            Filters += ';';
                            UserLogic += ';';
                        }
                        i++;
                        //if(KPI.AddFilter.Size())
                    }
                }
                
                  i=1;
                        if(KPI.InnClassEditvaluesList != Null){
                            for(NewInnerclass NewFil : KPI.InnClassEditvaluesList){
                                if(NewFil.Rownumber == j){
                                    Filtercode += NewFil.typeofselect;
                                    if(KPI.InnClassEditvaluesList.Size() >= i+1){
                                        Filtercode += 'mwsqy';
                                    }
                                    i++;
                                }
                            }
                        }
        
       
                 if ( Schema.sObjectType.Dataset__c.fields.RowNumber__c.isCreateable()&&Schema.sObjectType.Dataset__c.fields.Dataset_Name__c.isCreateable()&&
                               Schema.sObjectType.Dataset__c.fields.Dataset_Id__c.isCreateable()&&Schema.sObjectType.Dataset__c.fields.New_Dimension_Name__c.isCreateable()&&
                               Schema.sObjectType.Dataset__c.fields.New_Dimension_API__c.isCreateable()&&Schema.sObjectType.Dataset__c.fields.Date_Label__c.isCreateable()&&
                               Schema.sObjectType.Dataset__c.fields.Data_API__c.isCreateable()&&Schema.sObjectType.Dataset__c.fields.Measure_Name__c.isCreateable()&&
                               Schema.sObjectType.Dataset__c.fields.Measure_API__c.isCreateable()&&Schema.sObjectType.Dataset__c.fields.Filter_Logics__c.isCreateable()&&
                               Schema.sObjectType.Dataset__c.fields.KPI_Name__c.isCreateable()&&Schema.sObjectType.Dataset__c.fields.Session_Id__c.isCreateable()&&
                               Schema.sObjectType.Dataset__c.fields.AliasMeasure_API__c.isCreateable()&&Schema.sObjectType.Dataset__c.fields.CompactMeasure_API__c.isCreateable()){
			                                     
			                Dataset__c DatasetRec = new Dataset__c();
			                DatasetRec.RowNumber__c = KPI.KPIRownumber; 
			                DatasetRec.Dataset_Name__c = MapValues.get(KPI.dataset); 
			                DatasetRec.Dataset_Id__c = KPI.dataset;   
			                DatasetRec.New_Dimension_Name__c = AvailableDimension; 
			                DatasetRec.New_Dimension_API__c = DimensionApi; 
			                DatasetRec.Date_Label__c = AvailableDateField; 
			                DatasetRec.Data_API__c = DateFieldApi; 
			                DatasetRec.Measure_Name__c = AvailableMeasure; 
			                DatasetRec.Measure_API__c = MeasureAPI; 
			                DatasetRec.Filter_Logics__c = FilterName;
			                DatasetRec.KPI_Name__c = KPI.KPIName;
			                DatasetRec.Session_Id__c = SessionsId;
			                DatasetRec.FilterName__c = Filters;
			                DatasetRec.UserLogic__c = UserLogic;
			                DatasetRec.AliasMeasure_API__c = AliasMeasureAPIN;
			                DatasetRec.CompactMeasure_API__c = CompactMeasureAPIN;    
			                   DatasetRec.Filter_Code__c = Filtercode;
			                DatasetRecords.add(DatasetRec);
			               
            	}

                }
                else{
                b=true;
                }
            }
            
            if( !a && KPIDetils.Size()<5){
                nlist.add(new KPIClass('', j,DatasetValuesList ,false));   
            }
        } 
        
        if(DatasetRecords.Size() > 0){
        	insert datasetRecords;
        }
        for(KPIClass nRec : nlist){
        KPIDetils.add(nRec);
        //NextMethod();
        }
        
        showSectionEdit = true;  
        SetDimensionValue = true; 
        setDimension = false;
        filterrend = false;
    } 
     catch(Exception e){   
        } 
}                  
    public List<DateFieldWrapper> DateWrapperList{get;set;}
    public List<MeasureWrapper> MeasureWrapperList{get;set;}            
    public boolean SetDate{get;set;}                
    public boolean filterrend{get;set;}         
    //public boolean  CountRender{get;set;}
  
      public String Filtevalue{get;set;}
    public list<Dataset__c> DatasetRecords{get;set;}
    public set<String> RowNumbers{get;set;}
    public list<KPIClass> KPIRecList{get;set;}
   
 
    public List<KPIClass> KPIDetils{get;set;}       
    public String filedName{get;set;}
    public String value{get;set;}
    public list<Filterwrapper> filterwrapperList{get;set;}
    public Integer counter{get;set;}
          
    public String operator{get;set;}
   /* public List<SelectOption> getOperatorValues(){   
        List<SelectOption> options = new List<SelectOption>();
        //options.add(new SelectOption('','--Select--'));
        
        options.add(new SelectOption('!=','not equal to'));
        options.add(new SelectOption('==','equals'));
        options.add(new SelectOption('<','less than'));
        options.add(new SelectOption('>','greater than'));
        options.add(new SelectOption('<=','less or equal'));
        options.add(new SelectOption('>=','greater or equal')); 
        options.add(new SelectOption('IN','in')); 
        options.add(new SelectOption('NOT IN','not in')); 
        return options;
    }           
       */ 
    public Integer filterRowCount = 0; 
    public void FilterMethod(){
        try{
        for (Integer i = (KPIDetils.size()-1) ; i>= 0 ; i--){
             String s = KPIDetils[i].KPIName;
            if(s == ''){
                KPIDetils.remove(i);
            }
        } 
        isTrue=false;
        FilterNames = '';
        filtercountList = new list<Filterwrapper>();
 EditFiltersShow = false;
            AddFiltersShow = true;
            filterLogic = '1';
            for(KPIClass KPIRec : KPIDetils){           
                filterCount = 1;
                KPIRec.dimensionOptions = new List<SelectOption>();                                            
                DatasetDimensionFromJson  DimensionTypes = new DatasetDimensionFromJson();       
                if(KPIRec.dataSet != null || Test.isRunningTest()){
                string DimensionsReturnValue = Dimensions(KPIRec.dataSet);
                if(DimensionsReturnValue != null &&DimensionsReturnValue != ''){
                    DimensionTypes = DatasetDimensionFromJson.parse(DimensionsReturnValue);
                    
                }         
                if(DimensionTypes.dimensions !=null){      
                for(DatasetDimensionFromJson.cls_dimensions Dim : DimensionTypes.dimensions){ 
                    if(Dim.showInExplorer == true) {                          
                    KPIRec.dimensionOptions.add(new selectOption(Dim.field,Dim.field)); 
                    }                        
                } 
                KPIRec.dimensionOptions= sortSelectOptions(KPIRec.dimensionOptions);   
                }         
                KPIRec.AddFilter = new list<Filterwrapper> ();                          
                KPIRec.AddFilter.add(new Filterwrapper(filedName, operator, value, filterCount));
                for(Filterwrapper Filter: KPIRec.AddFilter){
                    Filter.userLogic = '1';
                     Filter.filterRowCount =  1;
                     KPIRec.FilterRowCount = 1;
                        Filter.FilterNames = new list<Filterwrapper> ();
                        KPIRec.datasetFilterId = KPIRec.Dataset  ;
                        Filter.FilterNames.add(new Filterwrapper(filedName,operator,value, Filter.filterRowCount));
                }   
            }
            filterRend= true;
            SetMeasure = false;
            }
    } 
    catch(Exception e){   
        }
    }
    
    public List<SelectOption> sortSelectOptions(List<SelectOption> sortingList) {
        for (Integer i =0; i < sortingList.size(); i++) {
            for (Integer j = i; j > 0; j--) {
                if (sortingList[j-1].getLabel() > sortingList[j].getLabel()){
                    SelectOption temp = sortingList[j];
                    sortingList[j] = sortingList[j-1];
                    sortingList[j-1] = temp;
                }
            }
        }
        return sortingList;
    }  
    
    /*public void addRow(){ 
        try{      
        Integer KPIDimen = Integer.valueof(apexpages.currentpage().getparameters().get('KPIDimen'));
        Integer counterWrap = Integer.valueof(apexpages.currentpage().getparameters().get('counterWrap'));
        integer i = 0;
        for(KPIClass KPIRec : KPIDetils){
            if(KPIRec.KPIRownumber == KPIDimen){
                if(KPIRec.AddFilter !=null) {
                for(Filterwrapper AddFil : KPIRec.AddFilter){ 
                    if(AddFil.Counterwrap == counterWrap){
                        AddFil.UserLogic = AddFil.UserLogic + ' AND ' + (AddFil.filterRowCount+1);
                        AddFil.filterRowCount = AddFil.filterRowCount + 1;
                        AddFil.FilterNames.add(new Filterwrapper(filedName, operator, value, AddFil.filterRowCount));
                    }
                }  
                }             
            }           
        }
    }
    catch(Exception e){  
        }
    }*/ 
    /*public void EditaddRow(){ 
        try{      
            Integer KPIDimen = Integer.valueof(apexpages.currentpage().getparameters().get('KPIDimen'));
            Integer counterWrap = Integer.valueof(apexpages.currentpage().getparameters().get('counterWrap'));
            integer i = 0;
            for(KPIClass KPIRec : KPIDetils){
                if(KPIRec.KPIRownumber == KPIDimen){
                    if(KPIRec.EditFilter !=null){
                        for(Filterwrapper AddFil : KPIRec.EditFilter){ 
                            if(AddFil.Counterwrap == counterWrap){
                            	for(Filterwrapper ForList : AddFil.FilterNames){
                            		AddFil.filterRowCount = ForList.Counterwrap + 1;	
                            	} 
                                AddFil.UserLogic = AddFil.UserLogic + ' AND ' + (AddFil.filterRowCount);
                                
                                AddFil.FilterNames.add(new Filterwrapper(filedName, operator, value, AddFil.filterRowCount));
                                AddFil.filterRowCount = AddFil.filterRowCount + 1;
                            }
                        }               
                    }  }         
            }
        } 
        catch(Exception e){
            
        }
    }*/ 
          
    public list<Filterwrapper> filtercountList;
    public boolean filterTrue{get;set;}
    public integer filterCount;
    public integer FilterValue = 1;
     public void verifyError(Integer RowNumber,String Filtername,String Filterlogicnew){
        for(KPIClass KPIRec : KPIDetils){ 
            if(KPIRec.KPIRowNumber == RowNumber) {  
                if(KPIRec.SelectedFilters == Null){
                    KPIRec.SelectedFilters = new list<FilterInnerClass>();
                } 
                if(KPIRec.SelectedFilterList == Null){
                    KPIRec.SelectedFilterList = new list<WrapSelectedFilterList>();
                } 
                isErrorone = false;
                if(KPIRec.AddFilter !=null){
                    for(Filterwrapper AddFil : KPIRec.AddFilter){
                         AddFil.userLogic = Filterlogicnew;
                        if(String.isNotBlank(AddFil.userLogic)){ 
                            List<String> filterStrings = new List<String>();
                            Map<String, String> maptocheckfilterStrings = new Map<String, String>();
                            for(string s : AddFil.userLogic.split(' ')) { 
                                if(s != ')' &&  s != '(' && s!='' && s!= ' ' ){
                                    filterStrings.add(s);  
                                } 
                            }
                            for(String s : filterStrings){
                                if(maptocheckfilterStrings.get(s) == null){ 
                                    maptocheckfilterStrings.put(s,s);
                                } 
                            }
                           	integer bw = 1;
								for(NewInnerclass fw : InnClassEditvalues){
								    if(fw.minval == Filtername && fw.RowNumber == RowNumber){
									maptocheckfilterStrings.remove(String.valueOf(bw));
									maptocheckfilterStrings.remove(String.valueOf(bw)+')');
									maptocheckfilterStrings.remove('('+String.valueOf(bw));
									bw = bw+1;
								    }
								}
                            for(String s : maptocheckfilterStrings.values()){ 
                                if(s == 'AND' || s == 'OR'){   
                                    isErrorone = false;
                                }
                                else{
                                    
                                    isErrorone = true;
                                    isTrue = false;
                                    break;
                                }
                            }             
                            for(String s : maptocheckfilterStrings.values()){ 
                                if(s == 'AND' || s == 'OR'){  
                                    isErrorone = false;
                                }
                                else{
                                    isErrorone = true;
                                    isTrue = false;
                                    break;
                                }
                            } 
                            
                            List<String> filterNumbers = new List<String>();
                            Map<String, String> maptocheckduplicates = new Map<String, String>();
                            AddFil.userLogic.split(' '); 
                            for(string s : AddFil.userLogic.split('')) {
                                if(s != 'A' && s != 'N' && s != 'D' && s!= 'O' && s != 'R' && s != '(' && s != ')' && s!='' && s!= ' '){
                                    filterNumbers.add(s); 
                                }
                            }
                            for(String s : filterNumbers){
                                if(maptocheckduplicates.get(s) == null){
                                    maptocheckduplicates.put(s,s);
                                }
                                else{
                                    //Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.ERROR, 'Please Enter Valid Filter Condition'));  
                                    isErrorone = true;
                                    isTrue = false;
                                }
                            }
                            
                            if(!isErrorone){
									String Values = '';
									integer w = 1;
									integer ival = 1;
								for(NewInnerclass fw : InnClassEditvalues){
								    if(fw.minval == Filtername && fw.RowNumber == RowNumber){
								//	if(fw.filedName != null && fw.operator != null && fw.value != null){ 
											if(AddFil.userLogic.contains(String.valueOf(ival))){
												if(AddFil.userLogic.contains(String.valueOf(ival) + '  ')){
													isErrorone = true;
													break;
												}
												if(AddFil.userLogic.contains(')  ' + String.valueOf(ival)) || AddFil.userLogic.contains(')   ' + String.valueOf(ival)) || AddFil.userLogic.contains(')   ' + String.valueOf(ival)) || AddFil.userLogic.contains(')    ' + String.valueOf(ival))){
													isErrorone = true;
													break;
												}
												if(AddFil.userLogic.contains(')' + ' (') || AddFil.userLogic.contains(')' + '  (') || AddFil.userLogic.contains(')' + '   (')){
													isErrorone = true;
													break;
												}
												if(AddFil.userLogic.contains(String.valueOf(ival) + ' (') || AddFil.userLogic.contains(String.valueOf(ival) + '  (') || AddFil.userLogic.contains(String.valueOf(ival) + '   (')){
													isErrorone = true;
													break;
												}
												if((AddFil.userLogic.contains('(') && !AddFil.userLogic.contains(')')) || (AddFil.userLogic.contains(')') && !AddFil.userLogic.contains('(')) ||  AddFil.userLogic.contains(') '+ String.valueOf(ival))){
													isErrorone = true;
													break;
												}
												if(AddFil.userLogic.contains(String.valueOf(ival) + ' '+(String.valueOf(ival + 1)))){
													isErrorone = true;
													break;
												}
												if(AddFil.userLogic.contains(String.valueOf(ival) + ' '+(String.valueOf(ival + 2)))){
													isErrorone = true;
													break;
												}
												if(AddFil.userLogic.contains(String.valueOf(ival) + ' '+(String.valueOf(ival + 3)))){
													isErrorone = true;
													break;
												}
												if(AddFil.userLogic.contains(String.valueOf(ival) + ' '+(String.valueOf(ival + 4)))){
													isErrorone = true;
													break;
												}
												if(AddFil.userLogic.contains(String.valueOf(ival) + ' '+(String.valueOf(ival + 5)))){
													isErrorone = true;
													break;
												}
												if(AddFil.userLogic == String.valueOf(ival)+ ' AND'){
													isErrorone = true;
													break;
												}
												else if(AddFil.userLogic == String.valueOf(ival)+ ' OR'){
													isErrorone = true;
													break;
												}
												else if(AddFil.userLogic == String.valueOf(ival)){
													isErrorone = false;
												}
												else if(AddFil.userLogic.contains(String.valueOf(ival) + ' '+(String.valueOf(ival + 1)))){
													isErrorone = true;
													break;
												}
												else if(AddFil.userLogic.contains('AND')){
													isErrorone = false;
												}
												else if(AddFil.userLogic.contains('OR')){
													isErrorone = false;
												}										    
												else{
													isErrorone = true;
													break;
												}
												
												 
											/*}
											else{
												//AddFil.userLogic.addError('Please Add Condition'+ival); 
												//Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.ERROR, 'Please Add Condition'+ival)); 
												isErrorone = true;
												break;
											}*/
										}
										else{
											//AddFil.userLogic.addError('Please Select Condition'+ival);
											//Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.ERROR, 'Please Select Condition'+ival));  
											isErrorone = true;
											isTrue = false;
											break;
										}
								   
										ival = ival+1;
									}
								}
									
									
								}							 
                        } 
                        else{
                            //Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.ERROR, 'Please Enter Valid Filter Condition')); 
                            isErrorone = true;
                            isTrue = false;
                            break;
                        }
                        
                    }
                }			
            }
        }
    }
    public boolean isTrue{get;set;}
    public boolean isErrorone{get;set;}
    
    public boolean tableId{get;set;}
    public String Filternames{get;set;}
    public void AddFilter(){
        /* try{
         Integer RowNumber = Integer.valueof(apexpages.currentpage().getparameters().get('RowNumber'));
         //String Filtername = apexpages.currentpage().getparameters().get('KPIFilterName');
        
         String Filtername = Filternames;
        if(Filtername != Null && Filtername != ''){
            TableId = false;
        verifyError(RowNumber,Filtername);
        
        if(!isErrorone || Test.isRunningTest()){
            isTrue= true;
        for(KPIClass KPIRec : KPIDetils){             
            if(KPIRec.KPIRowNumber == RowNumber) {  
                if(KPIRec.SelectedFilters == Null){
                    KPIRec.SelectedFilters = new list<FilterInnerClass>();
                } 
                if(KPIRec.SelectedFilterList == Null){
                    KPIRec.SelectedFilterList = new list<WrapSelectedFilterList>();
                } 
                integer z = 1;
                if(KPIRec.AddFilter !=null){
                for(Filterwrapper AddFil : KPIRec.AddFilter){
                    output = AddFil.userLogic;
                    String filedName ;
                    String operator ;
                    String value ;
                    if(String.isNotBlank(AddFil.userLogic)){
                        for(Filterwrapper fw : AddFil.Filternames){                     
                            if(output.contains(String.valueOf(fw.counterWrap))){
                                if(fw.operator != 'IN' && fw.operator != 'NOT IN'){
                                if(output.contains(' '+String.valueOf(fw.counterWrap))){
                                	output = output.replace(' '+String.valueOf(fw.counterWrap),  ' \'' + fw.filedName + '\' ' + fw.operator+ ' \\\\\\"' + fw.value + '\\\\\\" ' ); 
                            	}
                            	else if(output.contains(String.valueOf(fw.counterWrap)+ ' ')){
                                	output = output.replace(String.valueOf(fw.counterWrap)+ ' ',  ' \'' + fw.filedName + '\' ' + fw.operator+ ' \\\\\\"' + fw.value + '\\\\\\" ' ); 
                            	}
                            	else if(output.contains(String.valueOf(fw.counterWrap))){
                                	output = output.replace(String.valueOf(fw.counterWrap),  ' \'' + fw.filedName + '\' ' + fw.operator+ ' \\\\\\"' + fw.value + '\\\\\\" ' ); 
                            	}
                                output = output.replace(' or ',' || ').replace(' Or ',' || ').replace(' OR ',' || ');
                                output = output.replace(' And ',' && ').replace(' AND ',' && ').replace(' and ',' && '); 
                              //  output = output.replace('And',' && ').replace('AND',' && ').replace('and',' && '); 
                             //   output = output.replace('or',' || ').replace('Or',' || ').replace('OR',' || '); 
                                }
                                else{
                                     list<string> ls = new list<string>();
                                    string str;
                                    str = '(\''+fw.filedName+'\' '+fw.operator+' [';
                                    for(string s: fw.value.split(',')){
                                       ls.add('\\\\\\"'+s+'\\\\\\"');
                                    }
                                    string allstring = string.join(ls,',');
                                    str = str + allstring +'])';
                                    output = str; 
                                }
                               system.debug('----------------'+output);
                               KPIRec.SelectedFilters.add(new FilterInnerClass(output,FilterValue,Filtername,fw.filedName,fw.operator,AddFil.userLogic,fw.value));   
                            }
                                                    
                        }
                    } 
                    AddFil.FilterLogic = output; 
                    AddFil.FIlterName = Filtername; 
                    
                    
                     
                     FilterValue = FilterValue;
                     for(FilterInnerClass Filte : KPIRec.SelectedFilters ){
                         KPIRec.FiltersSelected = new list<String>();
                         KPIRec.FiltersSelected.add(Filte.SelectedFilters);
                     }
                    KPIRec.SelectedFilterList.add(new WrapSelectedFilterList(Filtername,KPIRec.SelectedFilters,AddFil.FilterLogic,z)); 
                }
                }
                
                for(WrapSelectedFilterList sl : KPIRec.SelectedFilterList){
                    sl.rowcount = z;
                    z++;
                }
                system.debug('------------'+KPIRec.SelectedFilters);
                system.debug('------------'+KPIRec.SelectedFilterList);
                
            } 
            else{
                 FilterValue = 1;
            }
         }   
            filterTrue = false;
            filtercountList = new list<Filterwrapper>();
            Integer KPIDimen = Integer.valueof(apexpages.currentpage().getparameters().get('KPIDimen'));
            Integer Counterwrap = Integer.valueof(apexpages.currentpage().getparameters().get('Counterwrap'));
            integer i = 0;  
                
        if(KPIDetils !=null){
            for(KPIClass KPIRec : KPIDetils){ 
                if(KPIRec.AddFilter !=null){
                if(KPIRec.AddFilter.Size() > 5){            
                    filterTrue = true; 
                    Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.ERROR, 'You cannot Add more than Five Filters.'));
                } 
                }
            } 
            }
           // previous();
    }
        }
        else{
        	TableId = true;
        }
         }
    catch(Exception e){  
        }*/
    }
   public void RemoveKPIS(){
    //    try{
        Integer RowNumber = Integer.valueOf(Apexpages.currentpage().getParameters().get('DeleteKPI'));
        String KPINames = Apexpages.currentpage().getParameters().get('DeleteFil');
        list<KPIClass> KPIRecs = new LIst<KPIClass>();
        
        for(Integer j = 0; j < KPIDetils.size(); j++){
            if(KPIDetils[j].KPIName == KPINames && KPIDetils[j].KPIRowNumber == RowNumber ){
               KPIDetils.remove(j);  
            }
        }
   

        integer i = 6;
        for(KPIClass KPIRec : KPIDetils){   
            if(KPIRec.KPIName != ''){
                KPIRecs.add(new KPIClass(KPIRec.KPIName,i,KPIRec.dataSetOptions,KPIRec.KPICheck));
                //KPIRecs
            }
            i++;
        }
         integer j = 6;
        for(KPIClass KPIRec : KPIDetils){
            for(KPIClass KPIs : KPIRecs){
                if(KPIRec.KPIName != '' && KPIs.KPIName != Null && KPIRec.KPIName == KPIs.KPIName){
                    KPIs.dataSet = KPIRec.dataSet;
                    KPIs.DatasetId = KPIRec.DatasetId;
                    KPIs.DatasetDateId = KPIRec.DatasetDateId;
                    KPIs.DatasetMeasureId = KPIRec.dataSet;
                    KPIs.DatasetFilterId = KPIRec.DatasetFilterId ;
                    KPIs.dataSetName = KPIRec.dataSetName;
                    KPIs.FilterLogic = KPIRec.FilterLogic;
                    KPIs.availableDimesions = KPIRec.availableDimesions;
                    KPIs.selectedDimensions = KPIRec.selectedDimensions;       
                    KPIs.availableDateFields = KPIRec.availableDateFields;
                    KPIs.SelectedDateFieldlist = KPIRec.SelectedDateFieldlist;
                    KPIs.availableMeasures = KPIRec.availableMeasures;
                    KPIs.selectedMeasures = KPIRec.selectedMeasures;
                    KPIs.CountRender = KPIRec.CountRender;
                    KPIs.FilterNames = KPIRec.FilterNames;
                    KPIs.AddFilter = KPIRec.AddFilter;
                    KPIs.EditFilter = KPIRec.EditFilter;
                    KPIs.SelectedFilters = KPIRec.SelectedFilters;
                    KPIs.FiltersSelected = KPIRec.FiltersSelected;
                    KPIs.dimensionOptions = KPIRec.dimensionOptions;
                    KPIs.FilterRowCount = KPIRec.FilterRowCount;
                    KPIs.UserLogic = KPIRec.UserLogic;
                    KPIs.SelectedFilterList = KPIRec.SelectedFilterList; 
                    KPIs.NewMeasurevarlist = new list<MeasureAngularclass>();
                     if(KPIRec.NewMeasurevarlist != Null){
                    for(MeasureAngularclass Meas : KPIRec.NewMeasurevarlist){
                            KPIs.NewMeasurevarlist.add(new MeasureAngularclass(Meas.Measurename,Meas.Measurevar,Meas.Measureval,Meas.EditMeasval,Meas.EditApi));
                        }
                     }
                      KPIs.InnClassEditvaluesList = new list<NewInnerclass>(); 
                        if(KPIRec.InnClassEditvaluesList != Null){
                            for(NewInnerclass Meass : KPIRec.InnClassEditvaluesList){
                                KPIs.InnClassEditvaluesList.add(new NewInnerclass(Meass.minval,Meass.typeofSelect,j));
                            }
                        }
                        KPIs.InnClassEdit = new list<FilterInnerClassEdit>();
                        if(KPIRec.InnClassEdit != Null){
                            for(FilterInnerClassEdit Meassss : KPIRec.InnClassEdit){
                                KPIs.InnClassEdit.add(new FilterInnerClassEdit(Meassss.Betweens,Meassss.typeofSelect,Meassss.minval,Meassss.maxVal,Meassss.filterCon,Meassss.selectedfield,Meassss.Fieldname,Meassss.FilterIds,Meassss.FieldAPI,Meassss.fromDate,Meassss.toDate,j));
                            }
                        }
                }
            }
            j++;
        }
        

        KPIDetils.clear();
        for(KPIClass KPIRec : KPIRecs){
            KPIDetils.add(KPIRec);
        }
        if(KPIDetils.size() == 0){
         KPIDetils.add(new KPIClass('', 6,DatasetValuesList ,false));
        }
       
        previous();
        defaultTab2 = false;
 // }
 // catch(Exception e){   
      //  }
   } 
  public void RemoveFilters(){
        try{
        integer param = Integer.valueOf(Apexpages.currentpage().getParameters().get('RowNumberDel1'));
        Integer RowNumber = Integer.valueOf(Apexpages.currentpage().getParameters().get('RowNumberDel1'));
        string delname = Apexpages.currentpage().getParameters().get('RemoveFilterDel1');
        Integer rowcount = Integer.valueOf(Apexpages.currentpage().getParameters().get('hidrowcount1'));
        list<FilterInnerClass> InnerClasses = new list<FilterInnerClass>();
         for (Integer i = (KPIDetils.size()-1) ; i>= 0 ; i--){
                String s = KPIDetils[i].KPIName;
                if(s == ''){
                    KPIDetils.remove(i);
                }
            } 
            
           
            
            
            
            
        for(KPIClass KPIRec : KPIDetils){
            if(KPIRec.innclassEdit  != Null){
               list<FilterInnerClassEdit> newInnClassEdit = new list<FilterInnerClassEdit>();
                 for(FilterInnerClassEdit EditInn : KPIRec.InnClassEdit){
                 newInnClassEdit.add(EditInn);
                }
                
                KPIRec.InnClassEdit = new list<FilterInnerClassEdit>();
                for(FilterInnerClassEdit EditInn : newInnClassEdit){
                 if(EditInn.Fieldname != delname && EditInn.Rownumber == RowNumber){
                  KPIRec.InnClassEdit.add(new FilterInnerClassEdit(EditInn.Betweens,EditInn.typeofSelect,EditInn.minval,EditInn.maxVal,EditInn.filterCon,EditInn.selectedfield,EditInn.Fieldname,EditInn.FilterIds,EditInn.FieldAPI,EditInn.fromdate,EditInn.toDate,RowNumber));
                 }
                 
                }
           
            }
            
             if(KPIRec.InnClassEditvaluesList != Null){
                    list<NewInnerclass> InnClassEditvaluesEditList = new list<NewInnerclass>();
                    for(NewInnerclass EditInns : KPIRec.InnClassEditvaluesList){
                        InnClassEditvaluesEditList.add(EditInns);
                    }
                    
                    KPIRec.InnClassEditvaluesList = new list<NewInnerclass>();
                    for(NewInnerclass EditInnlist : InnClassEditvaluesEditList){
                        if(EditInnlist.minval != delname){
                            KPIRec.InnClassEditvaluesList.add(new NewInnerclass(EditInnlist.minval,EditInnlist.typeofselect,EditInnlist.RowNumber));
                        }
                    }
                }       
            if(KPIRec.SelectedFilterList != null){
            for(WrapSelectedFilterList sl : KPIRec.SelectedFilterList) {
                if(KPIRec.KPIRownumber == RowNumber && rowcount == sl.rowcount && sl.FilterName == delname){
                    for(Integer i=0;i<KPIRec.SelectedFilters.Size();i++){
                        if(KPIRec.SelectedFilters[i].FilterNames == delname ){
                            KPIRec.SelectedFilters.remove(i); 
                        }
                    }
                }
            }
                    for(Integer i=0;i<KPIRec.SelectedFilterList.Size();i++){
                        if(KPIRec.SelectedFilterList[i].FilterName == delname ){
                            KPIRec.SelectedFilterList.remove(i); 
                        }
                    }          
            
            }
        }
        previous();
    }
    catch(Exception e){  
        } 
  }
     
    /*public void removingRow(){  
        try{
        Integer param = Integer.valueOf(Apexpages.currentpage().getParameters().get('index')); 
        Integer KPIDimen = Integer.valueOf(Apexpages.currentpage().getParameters().get('KPIDimen'));  
        Integer counterWrap = Integer.valueof(apexpages.currentpage().getparameters().get('counterWrap')); 
        for(KPIClass KPIRec : KPIDetils){
            if(KPIRec.KPIRownumber == KPIDimen){
                if(KPIRec.AddFilter !=null){
                for(Filterwrapper Filter: KPIRec.AddFilter){ 
                    if(Filter.counterWrap == counterWrap){
                    	integer WCount;
                        for(Integer i=0;i<Filter.FilterNames.Size();i++){
                            if(Filter.FilterNames[i].counterWrap == param ){
                            	
                            	WCount = param;
                                Filter.FilterNames.remove(i);     
                            }
                        }
                         if(Filter.UserLogic.contains(' '+WCount)){                             	
		                    		Filter.UserLogic = Filter.UserLogic.replace('AND '+WCount,'').replace('OR '+WCount,'').replace('and '+WCount,'').replace('or '+WCount,'');		                    	
                    			}else{
                    				Filter.UserLogic = Filter.UserLogic.replace(WCount+' AND ','').replace(WCount+' OR ','').replace(WCount+' and ','').replace(WCount+' or ','');
                    			}
                    }
                }
                }            
            }
        }
    }
    catch(Exception e){  
        }
    }*/
    
    /*public void removingEditRow(){  
        try{
            Integer param = Integer.valueOf(Apexpages.currentpage().getParameters().get('index')); 
            Integer KPIDimen = Integer.valueOf(Apexpages.currentpage().getParameters().get('KPIDimen'));  
            Integer counterWrap = Integer.valueof(apexpages.currentpage().getparameters().get('counterWrap')); 
            for(KPIClass KPIRec : KPIDetils){
                if(KPIRec.KPIRownumber == KPIDimen){
                    if(KPIRec.EditFilter !=null){
                        for(Filterwrapper Filter: KPIRec.EditFilter){ 
                            if(Filter.counterWrap == counterWrap){
                            	integer  WCount;
                                for(Integer i=0;i<Filter.FilterNames.Size();i++){
                                    if(Filter.FilterNames[i].counterWrap == param ){
                                    	WCount = param;
                                        Filter.FilterNames.remove(i);     
                                    }
                                }
                                if(Filter.UserLogic.contains(' '+WCount)){                             	
		                    		Filter.UserLogic = Filter.UserLogic.replace('AND '+WCount,'').replace('OR '+WCount,'').replace('and '+WCount,'').replace('or '+WCount,'');		                    	
                    			}else{
                    				Filter.UserLogic = Filter.UserLogic.replace(WCount+' AND ','').replace(WCount+' OR ','').replace(WCount+' and ','').replace(WCount+' or ','');
                    			}
                            }
                        }
                    }            
                }
                
            }
        }
        catch(Exception e){
            
        }
    }*/
    public String output { get; set; }
    public String filterLogic { get; set; }
    public void submit(){
       
    }
        
    public class Filterwrapper{
        public String filedName{get;set;}
        public String operator{get;set;}
        public String value{get;set;}
        public String userLogic{get;set;}
        public String FilterLogic{get;set;} 
        public String FilterName{get;set;}
        public list<Filterwrapper> FilterNames{get;set;}
        public integer FilterRowCount{get;set;}
        public Integer counterWrap{get;set;}        
        public Filterwrapper(String filedName,String operator,String value, Integer counterWrap){
              this.filedName = filedName;  
              this.operator = operator;  
              this.value = value;  
              this.counterWrap = counterWrap;  
         }
    }

    public class WrapSelectedFilterList{
        public String FilterName{get;set;}
        public integer rowcount{get;set;}
        public String output{get;set;}
        public String NewOutput{get;set;}
        public list<FilterInnerClass> SelectedFilters{get;set;}
        public WrapSelectedFilterList(String FilterName,list<FilterInnerClass> SelectedFilters,String Output,integer rowcount,String NewOutput){
            this.FilterName = FilterName;
            this.SelectedFilters = SelectedFilters;
            this.Output = Output;
            this.rowcount = rowcount;
            this.NewOutput = NewOutput;
        }
        
    } 
     
        
     public void ReportList(){ 
        try{
        DimensionId = false;
        SetDimension = true;
        setDimensionValue= false;
        setDate = false;
        setMeasure = false;
        filterRend = false;
        
        for (Integer i = (KPIDetils.size()-1) ; i>= 0 ; i--){
             String s = KPIDetils[i].KPIName;
            if(s == ''){
                KPIDetils.remove(i);
            }
        } 
        for(KPIClass KPIRec : KPIDetils){
            if(KPIRec.dataset != Null || Test.isRunningTest()){ 
            KPIRec.dataSetName = Mapvalues.get(KPIRec.dataset);
            DatasetDimensionFromJson  DimensionTypes = new DatasetDimensionFromJson();  
            string DimensionsReturnValue = Dimensions(KPIRec.dataset);
            if(DimensionsReturnValue != null &&DimensionsReturnValue != ''){ 
                DimensionTypes = DatasetDimensionFromJson.parse(DimensionsReturnValue);
            }
            if(DimensionTypes.dimensions !=null){
			        for(DatasetDimensionFromJson.cls_dimensions Dim : DimensionTypes.dimensions){ 
			        	 DimensionLabel.put(Dim.label,Dim.Field);
			      } 
                }
       }
        }
    }catch(Exception e){ 
        }
     }


    public boolean DimensionId{get;set;}           
    public void DimensionNames(){ 
        try{
       /* Integer KPIDimen = Integer.valueof(apexpages.currentpage().getparameters().get('dimSelecteed'));
        for(KPIClass KPIRec : KPIDetils){
            if(KPIRec.KPIRownumber == KPIDimen){
                
                if(KPIRec.availableDimesions !=null){
                    
                    if(KPIRec.SelectedDimensions == Null){
                    KPIRec.SelectedDimensions = new list<selectedDimesionWrapper>();
                    }
                    if(KPIRec.NewString == Null){
                            KPIRec.NewString = new set<String>();
                        }
                
                    for(availableDimesionWrapper availableDimention : KPIRec.availableDimesions){
                          
                       if(availableDimention.availablecheck == true ){
                            KPIRec.NewString.add(availableDimention.availablename);
                       }
                       else{
                            KPIRec.NewString.remove(availableDimention.availablename);
                       }
                    }
                    
                    if(KPIRec.NewString != Null){
                        if(KPIRec.NewString.Size() <= 10){
                        for(availableDimesionWrapper availableDimention : KPIRec.availableDimesions){                         
                           if(availableDimention.availablecheck == true ){
                                    if(KPIRec.SelectedDimensions == null){                            
                                         KPIRec.SelectedDimensions.add(new selectedDimesionWrapper(availableDimention.availablename,false));
                                    } 
                                    else{
                                        KPIRec.SelectedDimensions.add(new selectedDimesionWrapper(availableDimention.availablename,false));
                                    } 
                                DimensionId = false;                              
                             }
                             
                          
                            else{
                                
                             //  KPIRec.selectedDimension.remove(availableDimention.availablename);               
                            }
                                   
                            }
                            KPIRec.SelectedDimensions.sort();
                        }
                        else{
                            DimensionId = true;
                            Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'You Cannot Enter More than 10 Dimensions.'));
                        }
    
                            for(Integer j = 0; j < KPIRec.availableDimesions.size(); j++){
                                for(selectedDimesionWrapper sd : KPIRec.SelectedDimensions){
                                    if(sd.Availablename == KPIRec.availableDimesions[j].Availablename){
                                        KPIRec.availableDimesions.remove(j);
                                    }
                                }
                                
                            }
                    }
                            
                        }                                               
                    } 
               }  */            
        } 
        catch(Exception e){  
        }
    }                      
   
    
 public void RemoveDimensionNames(){ 
    try{
   /* Integer KPIDimen = Integer.valueof(apexpages.currentpage().getparameters().get('dimSelecteed'));
            for(KPIClass KPIRec : KPIDetils){
            if(KPIRec.KPIRownumber == KPIDimen){
                if(KPIRec.SelectedDimensions !=null){
                    
                    if(KPIRec.SelectedDimensions == Null){
                    KPIRec.SelectedDimensions = new list<selectedDimesionWrapper>();
                    }
                    if(KPIRec.availableDimesions == Null){
                    KPIRec.availableDimesions = new list<availableDimesionWrapper>();
                    }
                
                    for(selectedDimesionWrapper selectedDimention : KPIRec.SelectedDimensions){  
                       if(selectedDimention.availablecheck == true ){
                            if(KPIRec.availableDimesions == null){                            
                                 KPIRec.availableDimesions.add(new availableDimesionWrapper(selectedDimention.availablename,false));
                            } 
                            else{
                                KPIRec.availableDimesions.add(new availableDimesionWrapper(selectedDimention.availablename,false));
                            }                           
                        }
                        else{
                           //KPIRec.selectedDimension.remove(availableDimention.availablename);                
                        }
                               
                        }
                        KPIRec.availableDimesions.sort();
                        for(Integer j = 0; j < KPIRec.SelectedDimensions.size(); j++){
                            for(availableDimesionWrapper sd : KPIRec.availableDimesions){
                                if(sd.Availablename == KPIRec.SelectedDimensions[j].Availablename){
                                    KPIRec.SelectedDimensions.remove(j);
                                }
                            }
                            
                        }
                      
                        
                        
                    } 

               } 
            
        }  */
 } 
 catch(Exception e){   
        }
 }
     public Set<String> DateFieldLists{get;set;}
     public boolean Valuetrue{get;set;}   
    public void DateFieldMethod(){  
        try{
        for (Integer i = (KPIDetils.size()-1) ; i>= 0 ; i--){
             String s = KPIDetils[i].KPIName;
            if(s == ''){
                KPIDetils.remove(i);
            }
        } 
                      
               SetDimension = false;
                setDimensionValue= false;
                setDate = true;
                setMeasure = false;
                filterRend = false;        
        for(KPIClass KPIRec : KPIDetils){           
                DatasetDimensionFromJson  DimensionTypes = new DatasetDimensionFromJson();
                if(KPIRec.dataSet != null || Test.isRunningTest()){
                    
                   
                string DimensionsReturnValue = Dimensions(KPIRec.dataSet);
                if(DimensionsReturnValue != null &&DimensionsReturnValue != ''){
                    DimensionTypes = DatasetDimensionFromJson.parse(DimensionsReturnValue);
                }
                    if(!Test.isRunningTest()){
                    if(DimensionTypes.dates !=null){
                    for(DatasetDimensionFromJson.cls_dates Dim : DimensionTypes.dates){   
                        if(Dim.showInExplorer == true){  
                        DateFullField.put(Dim.label,Dim.fields.fullField); 
                        
                        if(DateFullField.get(Dim.label) == Null){
                            DateFullField.put(Dim.label,Dim.label);
                        }                                           
                    } 
                    }
                    }
                    }
                    else{
                    	DateFullField.put('Created Date','CreatedDate'); 
                    }     
            }
        }  
    }
    catch(Exception e){  
        }
    }
    
    public boolean DateIds{get;set;} 
    public boolean MeasuresIds{get;set;}
    public void DateFieldNames(){ 
        try{
      /*  Integer KPIDimen = Integer.valueof(apexpages.currentpage().getparameters().get('dateSelecteed'));
        for(KPIClass KPIRec : KPIDetils){           
            if(KPIRec.KPIRownumber == KPIDimen){     
                if(KPIRec.availableDateFields !=null){
                    
                    if(KPIRec.SelectedDateFieldlist == Null){
                    KPIRec.SelectedDateFieldlist = new list<SelectedDateFieldWrapper>();
                 
                    }
                    if(KPIRec.NewStringDate == Null){
		            	KPIRec.NewStringDate = new set<String>();
		            }
                
                for(DateFieldWrapper DateFields : KPIRec.availableDateFields){
                    if(DateFields.Datevaluecheck == true ){    
                        KPIRec.NewStringDate.add(DateFields.DateFieldName);                                     
                    }
                    else{
                        KPIRec.NewStringDate.remove(DateFields.DateFieldName);
                    }                                               
                
                }
                if(KPIRec.NewStringDate != NUll){
                if(KPIRec.NewStringDate.Size() <=3){    
                for(DateFieldWrapper DateFields : KPIRec.availableDateFields){
                    if(DateFields.Datevaluecheck == true ){    
                         KPIRec.SelectedDateFieldlist.add(new SelectedDateFieldWrapper(DateFields.DateFieldName,false));                                     
                    }                           
                    
                DateIds = false;
                }
                KPIRec.SelectedDateFieldlist.sort();
                }
                else{
                    DateIds = true;
                    Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'You Cannot Enter More than 3 DateFields.'));
                }
                for(Integer j = 0; j < KPIRec.availableDateFields.size(); j++){
                    for(SelectedDateFieldWrapper sd : KPIRec.SelectedDateFieldlist){
                        if(sd.DateFieldName == KPIRec.availableDateFields[j].DateFieldName){
                            KPIRec.availableDateFields.remove(j);
                        }
                    }
                    
                }
                
                }    
                }
            }                            
        }*/
    } 
    catch(Exception e){   
        }
    }
 public void RemoveDateNames(){ 
    try{
   /* Integer KPIDimen = Integer.valueof(apexpages.currentpage().getparameters().get('dateSelecteed'));
            for(KPIClass KPIRec : KPIDetils){
            if(KPIRec.KPIRownumber == KPIDimen){
                if(KPIRec.SelectedDateFieldlist !=null){
                    
                    if(KPIRec.SelectedDateFieldlist == Null){
                    KPIRec.SelectedDateFieldlist = new list<SelectedDateFieldWrapper>();
                    }
                    if(KPIRec.availableDateFields == Null){
                    KPIRec.availableDateFields = new list<DateFieldWrapper>();
                    }
                
                    for(SelectedDateFieldWrapper selectedDate : KPIRec.SelectedDateFieldlist){  
                       if(selectedDate.DateValueCheck == true ){
                            if(KPIRec.availableDateFields == null){                            
                                 KPIRec.availableDateFields.add(new DateFieldWrapper(selectedDate.DateFieldName,false));
                            } 
                            else{
                                KPIRec.availableDateFields.add(new DateFieldWrapper(selectedDate.DateFieldName,false));
                            }                           
                        }
                        else{
                           //KPIRec.selectedDimension.remove(availableDimention.availablename);                
                        }
                               
                        }
                          KPIRec.availableDateFields.sort();
                        for(Integer j = 0; j < KPIRec.SelectedDateFieldlist.size(); j++){
                            for(DateFieldWrapper sd : KPIRec.availableDateFields){
                                if(sd.DateFieldName == KPIRec.SelectedDateFieldlist[j].DateFieldName){
                                    KPIRec.SelectedDateFieldlist.remove(j);
                                }
                            }
                            
                        }
                      
                        
                        
                    } 

               } 
            
        } */
 }   catch(Exception e){  
        }
 } 
    
    
        
    public void MeasureMethod(){ 
       /* try{
        for (Integer i = (KPIDetils.size()-1) ; i>= 0 ; i--){
             String s = KPIDetils[i].KPIName;
            if(s== ''){
                KPIDetils.remove(i);
            }
        }
              
        selectedMeasuresList = new set<String>(); 
        SetMeasure = true;
        SetDimension = false;
        setDimensionValue= false;
        setDate = false;
        filterRend = false;  
        for(KPIClass KPIRec : KPIDetils){
            DatasetDimensionFromJson  DimensionTypes = new DatasetDimensionFromJson();  
            if(KPIRec.dataSet != null || Test.isRunningTest()){ 
            string DimensionsReturnValue = Dimensions(KPIRec.dataSet);
            if(DimensionsReturnValue != null &&DimensionsReturnValue != ''){ 
                DimensionTypes = DatasetDimensionFromJson.parse(DimensionsReturnValue);
            }
                           availabledimensions = new list<availableDimesionWrapper>();   
                           if(!Test.isRunningTest()){
                        for(DatasetDimensionFromJson.cls_dimensions Dim : DimensionTypes.dimensions){ 
                            if(Dim.showInExplorer == true){    
                            availabledimensions.add(new availableDimesionWrapper(Dim.label, false))  ; 
                            }
                        }
                           }
                           else{
                           	availabledimensions.add(new availableDimesionWrapper('AccountId.Name', false))  ;
                           }
                        availabledimensions.sort();
                        KPIRec.availableDimesions = availabledimensions;       
                KPIRec.countRender = false;
                KPIRec.DatasetId = KPIRec.dataset;
  
                MeasureWrapperList = new list<MeasureWrapper>();      
                if(KPIRec.selectedMeasures == null){
	    			KPIRec.selectedMeasures = new set<String>();
	    		}
                if(!Test.isRunningTest())   {      
	                if(DimensionTypes.measures !=null){
		                for(DatasetDimensionFromJson.cls_measures Dim : DimensionTypes.measures){ 
		                    if(Dim.showInExplorer == true){              
		                    	MeasureWrapperList.add(new MeasureWrapper(Dim.label)); 
			                    if(MeasureFieldAPI.get(Dim.label) == Null)     
			                    MeasureFieldAPI.put(Dim.label,Dim.Field);  
		                    }                    
		                } 
	                }
                }
                else{
                	MeasureWrapperList.add(new MeasureWrapper('Amount'));      
                    MeasureFieldAPI.put('Amount','Amount');  
                }
                MeasureWrapperList.sort();
                KPIRec.availableMeasures = MeasureWrapperList;
              if(KPIRec.selectedMeasures != Null){
            			for(String St : KPIRec.selectedMeasures){
                	
		                	if(EditMeasMapping.get(St) == 'Count ()'){
		                		KPIRec.countRender = true;
		                	}
		                	else{
		                	    if(st == 'Count ()'){
		                	       KPIRec.countRender = true; 
		                	    }
		                	}
		                	for(availableDimesionWrapper availDim : KPIRec.availableDimesions){ 
			                	if(EditMeasMapping.get(St) == 'count('+availDim.AvailableName+')'){
			                		availDim.availableMeasure = true;
			                	}
			                	else{
			                	    if(St == 'count('+availDim.AvailableName+')'){
			                	        availDim.availableMeasure = true;
			                	    }
			                	}
		                	}
		                	for(MeasureWrapper MeasureDim : KPIRec.availableMeasures){
			                	if(EditMeasMapping.get(St) == 'sum('+MeasureDim.DateFieldName+')'){
			                		   MeasureDim.DateFieldCheck = true;
			                    }
			                    else{
			                        if(St == 'sum('+MeasureDim.DateFieldName+')'){
			                	       MeasureDim.DateFieldCheck = true;
			                	    }
			                    }
			                    if(EditMeasMapping.get(St) == 'max('+MeasureDim.DateFieldName+')'){
			                        MeasureDim.DateFieldCheckMAX = true;
			                    }
			                    else{
			                        if(St == 'max('+MeasureDim.DateFieldName+')'){
			                	        MeasureDim.DateFieldCheckMAX = true;
			                	    }
			                    }
			                    if(EditMeasMapping.get(St) == 'min('+MeasureDim.DateFieldName+')'){
			                        MeasureDim.DateFieldCheckMIN = true;
			                    }
			                    else{
			                         if(St == 'min('+MeasureDim.DateFieldName+')'){
			                	         MeasureDim.DateFieldCheckMIN = true;
			                	    }
			                    }
			                    if(EditMeasMapping.get(St) == 'avg('+MeasureDim.DateFieldName+')'){
			                        MeasureDim.DateFieldCheckAVG = true;  
			                    }
			                    else{
			                         if(St == 'avg('+MeasureDim.DateFieldName+')'){
			                	         MeasureDim.DateFieldCheckAVG = true;
			                	    }
			                    }
			                  }
			    		}
		            }
        } 
    } 
    
    }
        
    catch(Exception e){  
        }*/
    }
    
    public set<String>  selectedMeasuresList;    
    public void DateNames(){
       /* try{
        String values = apexpages.currentpage().getparameters().get('SUM');
        String Values2 = apexpages.currentpage().getparameters().get('Count');
        String RowName = apexpages.currentpage().getparameters().get('SUMName');
        String DimenCount = apexpages.currentpage().getparameters().get('DimenCount');
        String DimenName = apexpages.currentpage().getparameters().get('DimenName');
        String Rowtrue = apexpages.currentpage().getparameters().get('Rowtrue');
        String RowSumtrue = apexpages.currentpage().getparameters().get('Rowsumtrue');
        String RowDimtrue = apexpages.currentpage().getparameters().get('RowDimtrue');          
        Integer RowNumber = Integer.valueof(apexpages.currentpage().getparameters().get('RowNumbers'));
        String Dataset;
        if(Values2 != Null){ 
            Dataset = apexpages.currentpage().getparameters().get('Dataset');
        }
        for(KPIClass KPIRec : KPIDetils){  
        	set<String>  StringList = new Set<String>();
            if(Rowtrue == 'true'){                      
                if(KPIRec.KPIRowNumber == RowNumber){
                    if(Dataset == KPIRec.Dataset){                                                                                     
                        KPIRec.selectedMeasures.add(Values2 + ' ()');
                        KPIRec.MeasureSize = KPIRec.selectedMeasures.size();
                        //selectedMeasuresList = KPIRec.selectedMeasures;
                        if(Values2 == 'Count'){
                            KPIrec.CountRender = true; 
                        } 
                        if(KPIRec.selectedMeasures.Size() <= 4){
                             MeasuresIds = false; 
                        }        
                        else{
                            MeasuresIds = true;
                            if(Values2 == 'Count'){
                                KPIrec.CountRender = false; 
                            } 
                            KPIRec.selectedMeasures.remove(Values2 + ' ()');
                            for(String St : KPIRec.selectedMeasures){		                	
				                	if(EditMeasMapping.get(St) == 'Count ()'){
				                		StringList.add(St);
				                	}
			                	}
			                	for(String Str : StringList){
		    						KPIRec.selectedMeasures.remove(Str);
		    					} 
                            KPIRec.MeasureSize = KPIRec.selectedMeasures.size();
                            Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'You Cannot Enter More than 4 Measures.'));
                        }
                    }
                }
            }
            else{
                if(Dataset != Null &&  Dataset == KPIRec.Dataset){
                    KPIRec.selectedMeasures.remove(Values2 + ' ()');
                    for(String St : KPIRec.selectedMeasures){		                	
				                	if(EditMeasMapping.get(St) == 'Count ()'){
				                		StringList.add(St);
				                	}
			                	}
			                	for(String Str : StringList){
		    						KPIRec.selectedMeasures.remove(Str);
		    					}
                    if(Values2 == 'Count'){
                        KPIRec.CountRender = false; 
                    }
                   
                }
            }                       
            if(KPIRec.availableDimesions !=null){
            for(availableDimesionWrapper availDim : KPIRec.availableDimesions){                 
                if(KPIRec.KPIRowNumber == RowNumber){
                    if(RowDimtrue == 'true'){                       
                        if(availDim.AvailableName == DimenName){                           
                            KPIRec.selectedMeasures.add(DimenCount+ '('+availDim.AvailableName + ')');
                            KPIRec.MeasureSize = KPIRec.selectedMeasures.size();
                            selectedMeasuresList = KPIRec.selectedMeasures;                         
                            if(DimenCount == 'Count'){
                                availDim.availableMeasure = true;
                            }
                        }
                    }
                    else{    
                        if(availDim.AvailableName == DimenName){
                            KPIRec.selectedMeasures.remove(DimenCount+ '('+availDim.AvailableName + ')');  
                            KPIRec.MeasureSize = KPIRec.selectedMeasures.size(); 
                            for(String St : KPIRec.SelectedMeasures){
		                        	    if(EditMeasMapping.get(St) == 'count('+availDim.AvailableName+')'){
					                		StringList.add(St);
				                		}
		                        	} 
		                        	for(String Str : StringList){
				    						KPIRec.selectedMeasures.remove(Str);
				    					}                      
                            if(DimenCount == 'Count'){
                                availDim.availableMeasure = false;
                            }
                        }
                    }
                    if(KPIRec.selectedMeasures.Size() <= 4){
                         MeasuresIds = false;   
                    }        
                    else{
                         MeasuresIds = true;
                         if(availDim.AvailableName == DimenName ){
                            if(DimenCount == 'Count'){
                                availDim.availableMeasure = false;
                            }
                            for(String St : KPIRec.SelectedMeasures){
		                        	    if(EditMeasMapping.get(St) == 'count('+availDim.AvailableName+')'){
					                		StringList.add(St);
				                		}
		                        	} 
		                        	for(String Str : StringList){
				    						KPIRec.selectedMeasures.remove(Str);
				    					}    
                            KPIRec.selectedMeasures.remove(DimenCount+ '('+availDim.AvailableName + ')'); 
                            KPIRec.MeasureSize = KPIRec.selectedMeasures.size();
                         }
                        Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'You Cannot Enter More than 4 Measures.'));
                    }
                }
            } 
            }
            if(KPIRec.availableMeasures !=null) {                               
            for(MeasureWrapper MeasureDim : KPIRec.availableMeasures){              
                if(KPIRec.KPIRowNumber == RowNumber){
                    if(Rowsumtrue == 'false'){                   
                        MeasureDim.SumNames = values;                                                                       
                        if(MeasureDim.DateFieldName == RowName ){                           
                                KPIRec.selectedMeasures.add(MeasureDim.SumNames+ '('+MeasureDim.DateFieldName + ')');
                               KPIRec.MeasureSize = KPIRec.selectedMeasures.size();
                                selectedMeasuresList = KPIRec.selectedMeasures;                       
                            if(values == 'SUM'){
                                MeasureDim.DateFieldCheck = true;
                            }
                            if(values == 'MAX'){
                                MeasureDim.DateFieldCheckMAX = true;
                            }
                            if(Values == 'MIN'){
                                MeasureDim.DateFieldCheckMIN = true;
                            }
                            if(Values == 'AVG'){
                                MeasureDim.DateFieldCheckAVG = true;  
                            }               
                        } 
                        if(KPIRec.selectedMeasures.Size() <= 4){
                            MeasuresIds = false;
                        }        
                        else{
                            MeasuresIds = true;
                            if(MeasureDim.DateFieldName == RowName ){
                                KPIRec.selectedMeasures.remove(MeasureDim.SumNames+ '('+MeasureDim.DateFieldName + ')');
                                KPIRec.MeasureSize = KPIRec.selectedMeasures.size();
                                 for(String St : KPIRec.selectedMeasures){
		                        	if(EditMeasMapping.get(St) == 'sum('+MeasureDim.DateFieldName+')'){
				                        StringList.add(St);
				                    }
				                    if(EditMeasMapping.get(St) == 'max('+MeasureDim.DateFieldName+')'){
				                        StringList.add(St);
				                    }
				                    if(EditMeasMapping.get(St) == 'min('+MeasureDim.DateFieldName+')'){
				                        StringList.add(St);
				                    }
				                    if(EditMeasMapping.get(St) == 'avg('+MeasureDim.DateFieldName+')'){
				                        StringList.add(St);
				                    }
                                        }
			                        for(String Str : StringList){
			    						KPIRec.selectedMeasures.remove(Str);
			    					}
                                if(values == 'SUM'){
                                    MeasureDim.DateFieldCheck = false;
                                }
                                if(values == 'MAX'){
                                    MeasureDim.DateFieldCheckMAX = false;
                                }
                                if(Values == 'MIN'){
                                    MeasureDim.DateFieldCheckMIN = false;
                                }
                                if(Values == 'AVG'){
                                    MeasureDim.DateFieldCheckAVG = false;  
                                }
                            }
                            Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'You Cannot Enter More than 4 Measures.'));
                        }
                    }
                    else{
                        MeasureDim.SumNames = values;                                                                       
                        if(MeasureDim.DateFieldName == RowName ){                       
                                KPIRec.selectedMeasures.remove(MeasureDim.SumNames+ '('+MeasureDim.DateFieldName + ')');
                        KPIRec.MeasureSize = KPIRec.selectedMeasures.size();
                         for(String St : KPIRec.selectedMeasures){
		                        	if(EditMeasMapping.get(St) == 'sum('+MeasureDim.DateFieldName+')'){
				                        StringList.add(St);
				                    }
				                    if(EditMeasMapping.get(St) == 'max('+MeasureDim.DateFieldName+')'){
				                        StringList.add(St);
				                    }
				                    if(EditMeasMapping.get(St) == 'min('+MeasureDim.DateFieldName+')'){
				                        StringList.add(St);
				                    }
				                    if(EditMeasMapping.get(St) == 'avg('+MeasureDim.DateFieldName+')'){
				                        StringList.add(St);
				                    }
                                        }
			                        for(String Str : StringList){
			    						KPIRec.selectedMeasures.remove(Str);
			    					}
                            if(values == 'SUM'){
                                MeasureDim.DateFieldCheck = false;
                            }
                            if(values == 'MAX'){
                                MeasureDim.DateFieldCheckMAX = false;
                            }
                            if(Values == 'MIN'){
                                MeasureDim.DateFieldCheckMIN = false;
                            }
                            if(Values == 'AVG'){
                                MeasureDim.DateFieldCheckAVG = false;      
                            }
                        }                                                   
                    }
                }
            } 
            }
        } 
    } 
    catch(Exception e){  
        }*/
    } 
   
    public class availableDimesionWrapper implements Comparable{    
        public String Availablename{get;set;}
        public boolean availablecheck{get;set;}
        public boolean availableMeasure{get;set;}
        public availableDimesionWrapper(String Availablename, boolean availablecheck){
            this.Availablename = Availablename;
            this.availablecheck = availablecheck;
        }
        public Integer compareTo(Object ObjToCompare) {
            return Availablename.CompareTo(((availableDimesionWrapper)ObjToCompare).Availablename);
        }
    }

    public class selectedDimesionWrapper implements Comparable{
        public String Availablename{get;set;}
        public boolean availablecheck{get;set;}
        public String AvailableAPI{get;set;}
        public boolean availableMeasure{get;set;}
        public selectedDimesionWrapper(String Availablename, boolean availablecheck,String AvailableAPI){
            this.Availablename = Availablename;
            this.availablecheck = availablecheck;
            this.AvailableAPI = AvailableAPI;
        }
        public Integer compareTo(Object ObjToCompare) {
            return Availablename.CompareTo(((selectedDimesionWrapper)ObjToCompare).Availablename);
        }
    }
    
    public class DateFieldWrapper implements Comparable{
        public String DateFieldName   { get; set; }     
        public Boolean  DateValueCheck   { get; set; } 
        public DateFieldWrapper(String DateFieldName, boolean DateValueCheck){
            this.DateFieldName =  DateFieldName;
            this.DateValueCheck = DateValueCheck;
        }
        public Integer compareTo(Object ObjToCompare) {
            return DateFieldName.CompareTo(((DateFieldWrapper)ObjToCompare).DateFieldName);
        }     
    }
    
    public class SelectedDateFieldWrapper implements Comparable{
        public String DateFieldName   { get; set; }     
        public Boolean  DateValueCheck   { get; set; } 
        public String DateFieldAPI   { get; set; } 
        public SelectedDateFieldWrapper(String DateFieldName, boolean DateValueCheck,String DateFieldAPI){
            this.DateFieldName =  DateFieldName;
            this.DateValueCheck = DateValueCheck;
            this.DateFieldAPI = DateFieldAPI;
        }
        public Integer compareTo(Object ObjToCompare) {
            return DateFieldName.CompareTo(((SelectedDateFieldWrapper)ObjToCompare).DateFieldName);
        }     
    }  
    
    public boolean AllResults{ get; set; }
    public class MeasureWrapper implements Comparable{
        public String DateFieldName   { get; set; }
        public Boolean DateFieldCheckMIN   { get; set; }
        public Boolean DateFieldCheckMAX   { get; set; }
        public Boolean DateFieldCheckAVG   { get; set; } 
        public String SumNames  { get; set; }     
        public Boolean  DateFieldCheck   { get; set; }
        public MeasureWrapper(String  DateFieldName){
            this.DateFieldName =  DateFieldName;
        }
        public Integer compareTo(Object ObjToCompare) {
            return DateFieldName.CompareTo(((MeasureWrapper)ObjToCompare).DateFieldName);
        }         
    }
    public Map<String,String> DateFullField{get;set;}
   
        
    public class KPIClass{      
        public string KPIName{get;set;}         
        public boolean KPICheck{get;set;}
        public Integer KPIRownumber{get;set;}
        public String dataSet{get;set;}
        public String DatasetId{get;set;}
        public String DatasetDateId{get;set;}
        public String DatasetMeasureId{get;set;}
        public String DatasetFilterId{get;set;}
        public String dataSetName{get;set;}
        public String FilterLogic{get;set;}
       public integer MeasureSize{get;set;}
        public List<Selectoption> dataSetOptions{get;set;}
        public List<availableDimesionWrapper> availableDimesions{get;set;}   
        public List<selectedDimesionWrapper> selectedDimensions{get;set;}           
        public List<DateFieldWrapper> availableDateFields{get;set;}
        public List<SelectedDateFieldWrapper> SelectedDateFieldlist{get;set;}
        public list<FilterInnerClassEdit> InnClassEdit{get;set;}
        public list<NewInnerclass> InnClassEditvaluesList{get;set;}
         public list<MeasureAngularclass> NewMeasurevarlist{get;set;}   
        public set<String> NewString{get;set;}
        public set<String> NewStringDate{get;set;}
        public List<MeasureWrapper> availableMeasures{get;set;}
        public set<String> selectedMeasures{get;set;}
        public boolean CountRender{get;set;}
        public list<FilterWrapper> FilterNames{get;set;}
        public list<FilterWrapper> AddFilter{get;set;}
        public list<FilterWrapper> EditFilter{get;set;}
        public list<FilterInnerClass> SelectedFilters{get;set;} 
        public list<String> FiltersSelected{get;set;}
        public List<Selectoption> dimensionOptions{get;set;}
        public integer FilterRowCount{get;set;}
        public String UserLogic{get;set;}
        public list<WrapSelectedFilterList> SelectedFilterList{get;set;}
        
        public KPIClass(String KPIName, Integer KPIRownumber, List<Selectoption> dataSetOptions,boolean KPICheck){
            this.KPIName = KPIName;
            this.KPIRownumber = KPIRownumber;
            this.dataSetOptions = dataSetOptions;
            this.KPICheck = KPICheck;  
        }
        
    }   
  
 public list<Filterwrapper> KPIRecAddFilter{get;set;}
    public list<FilterInnerClassEdit> InnClassEditList{get;set;}
 public String AddFilName{get;set;}
    public void FilterMethodEdit(){
       // try{
            EditFiltersShow = true;
            AddFiltersShow = false;
            KPIRecAddFilter = new list<Filterwrapper>();
            Integer RowNumber = Integer.valueOf(Apexpages.currentpage().getParameters().get('RowNumberFilter'));
            AddFilName = Apexpages.currentpage().getParameters().get('AddFilName');
            integer RowNumberCount = Integer.valueOf(Apexpages.currentpage().getParameters().get('RowNumberCount'));
            isFalse = False;
            //scriptPanel = true;
            Filternames = AddFilName;
            integer z = 1;
            string userlogic;
            isEditError = false;
            isErrorone = false;
            
    	    InnClassEditList = new  list<FilterInnerClassEdit>();
            for(KPIClass KPIRec : KPIDetils){ 
			     if(KPIRec.KPIRowNumber == RowNumber){
			         if(KPIRec.InnClassEdit == Null){
    	        KPIRec.InnClassEdit= new  list<FilterInnerClassEdit>();
    	    }
                  for(FilterInnerClassEdit Innclass : KPIRec.InnClassEdit){
                            if(AddFilName == Innclass.FieldName && Innclass.RowNumber == RowNumber){
                                InnClassEditList.add(Innclass);
                            }
                        }
                if(KPIRec.SelectedFilterList != Null){
                    for(WrapSelectedFilterList sl : KPIRec.SelectedFilterList) {
                       if(sl.FilterName == AddFilName ){
                            if(KPIRec.dataSet != null || Test.isRunningTest()){
                            	 KPIRec.dimensionOptions = new List<SelectOption>();                                            
                				DatasetDimensionFromJson  DimensionTypes = new DatasetDimensionFromJson();
				                string DimensionsReturnValue = Dimensions(KPIRec.dataSet);
				                if(DimensionsReturnValue != null &&DimensionsReturnValue != ''){
				                    DimensionTypes = DatasetDimensionFromJson.parse(DimensionsReturnValue);
				                    
				                }  
				                if(DimensionTypes.dimensions !=null){
				                for(DatasetDimensionFromJson.cls_dimensions Dim : DimensionTypes.dimensions){ 
				                	if(Dim.showInExplorer == true) {                          
				                     KPIRec.dimensionOptions.add(new selectOption(Dim.field,Dim.field));
				                	}                         
				                }   
				                KPIRec.dimensionOptions =  sortSelectOptions(KPIRec.dimensionOptions);
				                }				                
                            }
                            KPIRec.EditFilter = new list<Filterwrapper> ();
                            list<Filterwrapper> FilterNamesList = new list<Filterwrapper> ();
                            integer i=0;
                            for(FilterInnerClass InnClass : sl.SelectedFilters) {
                                if(InnClass.FilterNames == AddFilName){
                                	String Userslist = InnClass.UserLogic.replace(' AND ','###').replace(' OR ','###').replace(' or ','###').replace(' and ','###').replace('(','').replace(')','').replace(' )','');
                                	String[] values = Userslist.Split('###');
                                // FilterNamesList.add(new Filterwrapper(InnClass.FieldName, InnClass.Operator, InnClass.Value, integer.valueof(values[i].replace(' ',''))));
	                                i++;
	                                
	                                if(InnClass.UserLogic != null){
	                                    userlogic = InnClass.UserLogic;
	                                }
                                }
                            }
                            KPIRec.EditFilter.add(new Filterwrapper(null, null, null, RowNumberCount));
                            for(Filterwrapper Filters: KPIRec.EditFilter)   {
                            	Filters.filterRowCount =  i;
                                Filters.UserLogic = userlogic;    
                                Filters.FilterNames = new list<Filterwrapper> ();  
                                Filters.FilterNames = FilterNamesList;    
                               }
                              
                        }
                    }
                } 
                
            }    
}			
            filterRend= true;      
            SetMeasure = false;
     //   } 
     //   catch(Exception e){
            
     //   }
    }
                   
     public void verifyErrorEdit(Integer RowNumber,String Filtername,String Filterlogicnew){              
        for(KPIClass KPIRec : KPIDetils){ 
            if(KPIRec.KPIRowNumber == RowNumber) {  
                if(KPIRec.SelectedFilters == Null){
                    KPIRec.SelectedFilters = new list<FilterInnerClass>();
                } 
                if(KPIRec.SelectedFilterList == Null){
                    KPIRec.SelectedFilterList = new list<WrapSelectedFilterList>();
                } 
                isEditError = false;
                if(KPIRec.EditFilter !=null){
                    for(Filterwrapper AddFil : KPIRec.EditFilter){
                         AddFil.userLogic = Filterlogicnew;
                        if(String.isNotBlank(AddFil.userLogic)){ 
                            List<String> filterStrings = new List<String>();
                            Map<String, String> maptocheckfilterStrings = new Map<String, String>();
                            for(string s : AddFil.userLogic.split(' ')) { 
                                if(s != ')' &&  s != '(' && s!='' && s!= ' ' ){
                                    filterStrings.add(s);  
                                } 
                            }
                            for(String s : filterStrings){
                                if(maptocheckfilterStrings.get(s) == null){ 
                                    maptocheckfilterStrings.put(s,s);
                                } 
                            }
                           	integer bw = 1;
								for(NewInnerclass fw : InnClassEditvalues){
								    if(fw.minval == Filtername && fw.RowNumber == RowNumber){
									maptocheckfilterStrings.remove(String.valueOf(bw));
									maptocheckfilterStrings.remove(String.valueOf(bw)+')');
									maptocheckfilterStrings.remove('('+String.valueOf(bw));
									bw = bw+1;
								    }
								}
                            for(String s : maptocheckfilterStrings.values()){ 
                                if(s == 'AND' || s == 'OR'){  
                                    isEditError = false;
                                }
                                else{
                                    
                                    isEditError = true;
                                    isFalse = false;
                                    break;
                                }
                            }             
                            for(String s : maptocheckfilterStrings.values()){ 
                                if(s == 'AND' || s == 'OR'){  
                                    isEditError = false;
                                }
                                else{
                                    isEditError = true;
                                    isFalse = false;
                                    break;
                                }
                            } 
                            
                            List<String> filterNumbers = new List<String>();
                            Map<String, String> maptocheckduplicates = new Map<String, String>();
                            AddFil.userLogic.split(' '); 
                            for(string s : AddFil.userLogic.split('')) {
                                if(s != 'A' && s != 'N' && s != 'D' && s!= 'O' && s != 'R' && s != '(' && s != ')' && s!='' && s!= ' '){
                                    filterNumbers.add(s); 
                                }
                            }
                            for(String s : filterNumbers){
                                if(maptocheckduplicates.get(s) == null){
                                    maptocheckduplicates.put(s,s);
                                }
                                else{
                                    //Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.ERROR, 'Please Enter Valid Filter Condition'));  
                                    isEditError = true;
                                    isFalse = false;
                                }
                            }
                            
                             if(!isEditError){
									String Values = '';
									integer w = 1;
									integer ival = 1;
								for(NewInnerclass fw : InnClassEditvalues){
								    if(fw.minval == Filtername && fw.RowNumber == RowNumber){
								//	if(fw.filedName != null && fw.operator != null && fw.value != null){ 
											if(AddFil.userLogic.contains(String.valueOf(ival))){
												if(AddFil.userLogic.contains(String.valueOf(ival) + '  ')){
													isEditError = true;
													break;
												}
												if(AddFil.userLogic.contains(')  ' + String.valueOf(ival)) || AddFil.userLogic.contains(')   ' + String.valueOf(ival)) || AddFil.userLogic.contains(')   ' + String.valueOf(ival)) || AddFil.userLogic.contains(')    ' + String.valueOf(ival))){
													isEditError = true;
													break;
												}
												if(AddFil.userLogic.contains(')' + ' (') || AddFil.userLogic.contains(')' + '  (') || AddFil.userLogic.contains(')' + '   (')){
													isEditError = true;
													break;
												}
												if(AddFil.userLogic.contains(String.valueOf(ival) + ' (') || AddFil.userLogic.contains(String.valueOf(ival) + '  (') || AddFil.userLogic.contains(String.valueOf(ival) + '   (')){
													isEditError = true;
													break;
												}
												if((AddFil.userLogic.contains('(') && !AddFil.userLogic.contains(')')) || (AddFil.userLogic.contains(')') && !AddFil.userLogic.contains('(')) ||  AddFil.userLogic.contains(') '+ String.valueOf(ival))){
													isEditError = true;
													break;
												}
												if(AddFil.userLogic.contains(String.valueOf(ival) + ' '+(String.valueOf(ival + 1)))){
													isEditError = true;
													break;
												}
												if(AddFil.userLogic.contains(String.valueOf(ival) + ' '+(String.valueOf(ival + 2)))){
													isEditError = true;
													break;
												}
												if(AddFil.userLogic.contains(String.valueOf(ival) + ' '+(String.valueOf(ival + 3)))){
													isEditError = true;
													break;
												}
												if(AddFil.userLogic.contains(String.valueOf(ival) + ' '+(String.valueOf(ival + 4)))){
													isEditError = true;
													break;
												}
												if(AddFil.userLogic.contains(String.valueOf(ival) + ' '+(String.valueOf(ival + 5)))){
													isEditError = true;
													break;
												}
												if(AddFil.userLogic == String.valueOf(ival)+ ' AND'){
													isEditError = true;
													break;
												}
												else if(AddFil.userLogic == String.valueOf(ival)+ ' OR'){
													isEditError = true;
													break;
												}
												else if(AddFil.userLogic == String.valueOf(ival)){
													isEditError = false;
												}
												else if(AddFil.userLogic.contains(String.valueOf(ival) + ' '+(String.valueOf(ival + 1)))){
													isEditError = true;
													break;
												}
												else if(AddFil.userLogic.contains('AND')){
													isEditError = false;
												}
												else if(AddFil.userLogic.contains('OR')){
													isEditError = false;
												}										    
												else{
													isEditError = true;
													break;
												}
												
												 
											/*}
											else{
												//AddFil.userLogic.addError('Please Add Condition'+ival); 
												//Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.ERROR, 'Please Add Condition'+ival)); 
												isEditError = true;
												break;
											}*/
										}
										else{
											//AddFil.userLogic.addError('Please Select Condition'+ival);
											//Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.ERROR, 'Please Select Condition'+ival));  
											isEditError = true;
											isTrue = false;
											break;
										}
								   
										ival = ival+1;
									}
								}
									
									
								}							 
                        } 
                        else{
                            //Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.ERROR, 'Please Enter Valid Filter Condition')); 
                            isEditError = true;
                            isTrue = false;
                            break;
                        }
                        
                    }
                }			
            }
        }
    }
    public boolean isFalse{get;set;}
    public boolean isEditError{get;set;}
    
    public boolean tableIds{get;set;}
    
    
    public pagereference UpdateFilter(){
      /*  Integer RowNumber = Integer.valueOf(Apexpages.currentpage().getParameters().get('RowNumber'));
        integer Counterwrap = Integer.valueOf(Apexpages.currentpage().getParameters().get('counterWrap'));
        String Filtername = FilterNames;
        system.debug('the fileter name is' + Filtername);
        
        if(Filtername != Null && Filtername != ''){
            TableIds = false;
            verifyErrorEdit(RowNumber,Filtername);
            if(!isEditError || Test.isRunningTest()){
                isFalse= true;
                integer k=0;
                System.debug('-------------------AddFilssssssssssss'+ AddFilName + '***********' + Filtername); 
                 
                for(KPIClass KPIRec : KPIDetils){   
                    if(KPIRec.KPIRowNumber == RowNumber) {
                        list<FilterInnerClass> FilList = new list<FilterInnerClass>();
                        list<WrapSelectedFilterList> WrapFilList = new list<WrapSelectedFilterList>();
                        FilterValue = FilterValue;
                        for(FilterInnerClass Filte : KPIRec.SelectedFilters ){
                            KPIRec.FiltersSelected = new list<String>();
                            KPIRec.FiltersSelected.add(Filte.SelectedFilters);
                            FilList.add(Filte);
                        }
                        KPIRec.SelectedFilters = new list<FilterInnerClass>(); 
                      	  for(FilterInnerClass Fil : FilList){
                            System.debug('-------------------Addrrrrrrrrrrrrrrrrrrrr'+ AddFilName + '***************'+ Fil.FilterNames);                      
	                            if(AddFilName != Fil.FilterNames ){    
	                            	System.debug('$$$$$$$$$$$$$$$$$$$$$$$$$$ Addrrrrrrrrrrrrrrrrrrrr'+ KPIRec.SelectedFilters.size() + '***************');                           
	                                KPIRec.SelectedFilters.add(new FilterInnerClass(Fil.selectedFilters,Fil.Filtervalue,Fil.FilterNames,Fil.FieldName,Fil.Operator,Fil.UserLogic,Fil.value));
	                            }   
                            }
                        for(WrapSelectedFilterList Wrap : KPIRec.SelectedFilterList){
                        	 System.debug('^^^^^^^^^^^^^^^^^^^^^^Addrrrrrrrrrrrrrrrrrrrr'+ AddFilName + '***************'+ KPIRec.SelectedFilterList);    
                            WrapFilList.add(Wrap);
                        }
                        
                        for(WrapSelectedFilterList Sellist : WrapFilList){
                            if(Sellist.FilterName == AddFilName){
                                System.debug('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& Addrrrrrrrrrrrrrrrrrrrr'+ AddFilName + Sellist.FilterName);
                                if(!Test.isRunningTest())
                                KPIRec.SelectedFilterList.remove(k)	;
                            }
                            k=K+1;
                        } 
                        if(KPIRec.SelectedFilters == Null){
                            KPIRec.SelectedFilters = new list<FilterInnerClass>();
                        }
                        if(KPIRec.EditFilter !=null){
                            if(KPIRec.EditFilter.size() != 0){
                            	System.debug('-------------------AddFilwwwwwwwwwwwwwwv '+ Counterwrap + '00000000000v ' + KPIRec.EditFilter);
                                for(Filterwrapper AddFil : KPIRec.EditFilter){
                                	System.debug('-------------------AddFilwwwwwwwwwwwwwwv '+ Counterwrap + '1111111111v ' + AddFil.Counterwrap);
                                    if(AddFil.Counterwrap == Counterwrap) {
                                        output = AddFil.userLogic;
                                        String filedName ;
                                        String operator ;
                                        String value ;
                                        if(String.isNotBlank(AddFil.userLogic)){
                                            for(Filterwrapper fw : AddFil.Filternames){  
                                                if(output.contains(String.valueOf(fw.counterWrap))){
                                                    System.debug('-------------------AddFilwwwwwwwwwwwwww '+ Counterwrap + '222222 ' + fw.Counterwrap);
                                                    if(fw.operator != 'IN' && fw.operator != 'NOT IN'){
                                                       if(output.contains(' '+String.valueOf(fw.counterWrap))){
                                	output = output.replace(' '+String.valueOf(fw.counterWrap),  ' \'' + fw.filedName + '\' ' + fw.operator+ ' \\\\\\"' + fw.value + '\\\\\\" ' ); 
                            	}
                            	else if(output.contains(String.valueOf(fw.counterWrap)+ ' ')){
                                	output = output.replace(String.valueOf(fw.counterWrap)+ ' ',  ' \'' + fw.filedName + '\' ' + fw.operator+ ' \\\\\\"' + fw.value + '\\\\\\" ' ); 
                            	}
                            	else if(output.contains(String.valueOf(fw.counterWrap))){
                                	output = output.replace(String.valueOf(fw.counterWrap),  ' \'' + fw.filedName + '\' ' + fw.operator+ ' \\\\\\"' + fw.value + '\\\\\\" ' ); 
                            	}
                                output = output.replace(' or ',' || ').replace(' Or ',' || ').replace(' OR ',' || ');
                                output = output.replace(' And ',' && ').replace(' AND ',' && ').replace(' and ',' && '); 
                              //  output = output.replace('And',' && ').replace('AND',' && ').replace('and',' && '); 
                              //  output = output.replace('or',' || ').replace('Or',' || ').replace('OR',' || '); 
                                                    }
                                                    else{
                                                        list<string> ls = new list<string>();
                                                        string str;
                                                        str = '\''+fw.filedName+'\' '+fw.operator+' [';
                                                        for(string s: fw.value.split(',')){
                                                            ls.add('\\\\\\"'+s+'\\\\\\"');
                                                        }
                                                        string allstring = string.join(ls,',');
                                                        str = str + allstring +']';
                                                        output = output.replace(String.valueOf(fw.counterWrap),str);
                                                    }
                                                    KPIRec.SelectedFilters.add(new FilterInnerClass(output,FilterValue,Filtername,fw.filedName,fw.operator,AddFil.userLogic,fw.value));
                                                    System.debug('-------------------AddFilwwwwwwwwwwwwww '+ KPIRec.SelectedFilters + '3333333 ' + AddFil.Counterwrap);   
                                                }
                                                
                                            }
                                        } 
                                        AddFil.FilterLogic = output; 
                                        AddFil.FIlterName = Filtername; 
                                        FilterValue = FilterValue;
                                        for(FilterInnerClass Filte : KPIRec.SelectedFilters ){
                                            KPIRec.FiltersSelected = new list<String>();
                                            KPIRec.FiltersSelected.add(Filte.SelectedFilters);
                                        }
                                        System.debug('-------------------AddFilwwwwwwwwwwwwww '+ KPIRec.SelectedFilters + '44444444 ' + AddFil.Counterwrap); 
                                        KPIRec.SelectedFilterList.add(new WrapSelectedFilterList(Filtername,KPIRec.SelectedFilters,AddFil.FilterLogic,counterwrap));
                                        System.debug('-------------------AddFilqqqqqqqqqqqqqqqqqqqqqq '+ KPIRec.SelectedFilterList);  
                                        
                                    }
                                }
                            }
                        }
                    } 
                    else{
                        FilterValue = 1;
                    }
                }          
                //previous();
            }
        }
        else{
            TableIds = true;
        }*/
        
        return null;
    }
    
    public void CloneFromPrevious(String Ids){  
        try{
    	SelectedrowValue = 1;
    	Map<String,String> NewDim = new Map<String,String>();   
    	Map<String,String> NewDat = new Map<String,String>();
    	Map<String,String> NewMeas = new Map<String,String>();
    	 
    	  
    	    list<DB_Template__c> DBTemplates = [select Id from DB_Template__c where id =: Ids order By createddate desc ];
    		if(DBTemplates.size()>0){
    			list<KPIs__c> KPIs = [select Dataset_Id__c,Dataset_Name__c,Date_Label__c,Filter_code__c,
    									 DB_Template__c,Dimension_Label__c,User_Logic__c,
    									 Filter_Logics__c,Filter_Logic__c,Filter_Name__c,KPI_Name__c,Measure_Label__c,RowNumber__c,
    									 Dimension_API__c,Measure_API__c,Date_API__c,Dimension_Name__c,Dimension_API_Name__c
    									 from KPIs__c where  DB_Template__c =: DBTemplates[0].id and (RowNumber__c >=6 and RowNumber__c <=10) order by RowNumber__c ];
    									 
    									 KPIDetils = new List<KPIClass>();  
    		
    		integer KPIString;
    		for(KPIs__c KPI : KPIs){ 
    			if(KPI.RowNumber__c >=6 && KPI.RowNumber__c <=10){
    				KPIString = integer.valueof(KPI.RowNumber__c);
            		KPIDetils.add(new KPIClass(KPI.KPI_Name__c,integer.valueof(KPI.RowNumber__c),DatasetValuesList ,false));
    			}
    		}
    		if(KPIString >=6 && KPIString <=9){
                    KPIDetils.add(new KPIClass('', KPIString+1,DatasetValuesList ,false));
            }
              if(KPIDetils.size() > 0){
    		for(KPIs__c KPI : KPIs){
    			if(KPI.RowNumber__c <=10){
    			for(KPIClass KPIRec : KPIDetils){ 
    				if(integer.valueof(KPI.RowNumber__c) == KPIRec.KPIRownumber && KPIRec.KPIName != ''){
	            KPIRec.dataSet = KPI.Dataset_Id__c;
	            DatasetDimensionFromJson  DimensionTypes = new DatasetDimensionFromJson(); 
				string DimensionsReturnValue = Dimensions(KPIRec.dataset);
				if(DimensionsReturnValue != null &&DimensionsReturnValue != ''){ 
					DimensionTypes = DatasetDimensionFromJson.parse(DimensionsReturnValue);
				}
	            if((KPI.Dimension_Label__c != null && KPI.Dimension_Label__c != '') || (KPI.Dimension_Name__c != null && KPI.Dimension_Name__c != '')){ 
	            	if(DimensionTypes.dimensions !=null){
						for(DatasetDimensionFromJson.cls_dimensions Dim : DimensionTypes.dimensions){ 
							 DimensionLabel.put(Dim.label,Dim.Field);
							 NewDim.put(Dim.Field,Dim.label);
					  } 
					}
	            	String[] Dimlist;
			  if(KPI.Dimension_Label__c != null){
				Dimlist = KPI.Dimension_Label__c.split(',');
			  }
			  else{
				 Dimlist = KPI.Dimension_Name__c.split(','); 
			  }
	            	String[] DimAPI;
	            	if((KPI.Dimension_API__c != Null && KPI.Dimension_API__c != '') || KPI.Dimension_API_Name__c != Null && KPI.Dimension_API_Name__c != '')
	            		 
	            		 if(KPI.Dimension_API__c != null && KPI.Dimension_API__c != ''){
	            		    DimAPI = KPI.Dimension_API__c.split(',');
	            		 }
	            		 else{
	            		    DimAPI = KPI.Dimension_API_Name__c.split(',');    
	            		 }
	            		
                        KPIRec.SelectedDimensions = new list<selectedDimesionWrapper>();
                        integer i=0;
                    for(String Avail : Dimlist){
                       KPIRec.SelectedDimensions.add(new selectedDimesionWrapper(Avail,false,DimAPI[i]));
                       if(DimAPI != Null){
                       EditDimMapping.put(Avail,NewDim.get(DimAPI[i]));
                       i= i+1;
                       }
                    }
                    
                    
                    KPIRec.NewString = new set<String>();
                    for(selectedDimesionWrapper KPIdim : KPIRec.SelectedDimensions){
                    	KPIRec.newString.add(KPIdim.availablename);
                    }
                }
                
                if(KPI.Date_Label__c != null){  
                	if(DimensionTypes.dates !=null){
						for(DatasetDimensionFromJson.cls_dates Dim : DimensionTypes.dates){ 	
							DateFullField.put(Dim.label,Dim.fields.fullField); 	
							NewDat.put(Dim.fields.fullField,Dim.label)	;	
							if(DateFullField.get(Dim.label) == Null){
								DateFullField.put(Dim.label,Dim.label);
								
							}                                           
						} 
					}
	            	String[] DatList =  KPI.Date_Label__c.split(',');
	            	String[] DatAPI;
	            	if(KPI.Date_API__c != Null && KPI.Date_API__c != '')
	            	  DatAPI =  KPI.Date_API__c.split(',');
	            	
                    KPIRec.SelectedDateFieldlist = new list<SelectedDateFieldWrapper>();
                    integer i=0;
                    for(String Avail : DatList){
                       KPIRec.SelectedDateFieldlist.add(new SelectedDateFieldWrapper(Avail,false,DatAPI[i])); 
                        if(DatAPI != Null)
                        EditDateMapping.put(Avail,NewDat.get(DatAPI[i]));
                        
                       	i= i+1;
                    }
                    KPIRec.NewStringDate = new set<String>();
                     for(SelectedDateFieldWrapper KPIdim : KPIRec.SelectedDateFieldlist){
                    	KPIRec.NewStringDate.add(KPIdim.DateFieldname);
                    }
                    
                }
                if(KPI.Measure_Label__c != null){  
	            	String[] MeasureList =  KPI.Measure_Label__c.split(',');
	            	String[] MeasureAPI ;
	            	String[] ALiasAPI;
	            	String[] CompactAPI;
	            	
	            	if(KPI.Measure_API__c !=NUll)
	            	MeasureAPI =  KPI.Measure_API__c.split(',');
	            	
                    KPIRec.selectedMeasures = new set<String>();
                    KPIRec.NewMeasurevarlist = new list<MeasureAngularclass>();
                     if(DimensionTypes.measures !=null){
						for(DatasetDimensionFromJson.cls_measures Dim : DimensionTypes.measures){      
							MeasureFieldAPI.put(Dim.label,Dim.Field); 
							NewMeas.put(Dim.Field,Dim.label);                     
						} 
					}
					integer k=0;
                    for(String Avail : MeasureList){
                       KPIRec.selectedMeasures.add(Avail); 
                       String Availms;
                       if(Avail == 'count ()'){
                         Availms = 'count(Rows)';
                       }
                       else{
                          Availms = Avail; 
                       }
                       String Availmeasures = Availms.replace('(',';').replace(')','');
                       String[] Availlist = Availmeasures.split(';');
                       String Newvar;
                       
                       if(Availlist.size()>1 ){
                           if(Availlist[1] == 'Probability '){
                              Availlist[1] =  'Probability (%)';
                           }
                       }
                       String Newvallist  = Availlist[0].replace(' ','').replace(']','');
                       if(MeasureAPI != Null){
                       
                       	String Measuresdim  = MeasureAPI[k].replace('(',';');
                       
                       	String[] MeasList = Measuresdim.split(';');
                       	String MeasFiled;
                       	String NewMeasFiled;
                       	if(NewMeas.get(MeasList[1].replace(')','').replace('\'','')) != null){
                       		 MeasFiled = MeasList[0]+'('+ NewMeas.get(MeasList[1].replace(')','').replace('\'','')) +')';
                       		 NewMeasFiled = NewMeas.get(MeasList[1].replace(')','').replace('\'',''));
                       	}
                       	else if(NewDim.get(MeasList[1].replace(')','').replace('\'','')) != null){
                       		MeasFiled = MeasList[0]+'('+ NewDim.get(MeasList[1].replace(')','').replace('\'',''))+')';
                       		NewMeasFiled = NewDim.get(MeasList[1].replace(')','').replace('\'',''));
                       	}
                       	else{
                       		MeasFiled = 'count ()';	
                       		NewMeasFiled = 'Rows';
                       	}
                       	EditMeasMapping.put(Avail,MeasFiled);
                       	 KPIRec.NewMeasurevarlist.add(new MeasureAngularclass(Availms,Availlist[0].replace(' ','').replace(']',''),NewMeasFiled,Availms,KPIRec.KPIRownumber+Newvallist+NewMeasFiled.replace(' ','')));
                       }
                       
                       
                       k=k+1;
                    }
                    KPIRec.MeasureSize = KPIRec.selectedMeasures.size();
                }
                if(KPI.Filter_Name__c != null){ 
                	list<String> FilterList = new list<String>();
                	 if(KPI.Filter_Logics__c != null && KPI.Filter_Logics__c != ''  && KPI.Filter_Logics__c != '\'\' in all'){
	            		 FilterList =  KPI.Filter_Logics__c.split(';');
                	 }
                	 else if(KPI.Filter_Logic__c != null && KPI.Filter_Logic__c != ''  && KPI.Filter_Logic__c != '\'\' in all'){
                	 	 FilterList =  KPI.Filter_Logic__c.split(';');
                	 }
                	 else{
                	     String Allvals = '';
                        if(DimensionTypes.dimensions !=null){
    						for(DatasetDimensionFromJson.cls_dimensions Dim : DimensionTypes.dimensions){ 
    							 if(Allvals == ''){
    							    Allvals = Dim.Field;
    							 }
    					    }   
    					    
					    }
					    String Allvl = '\''+Allvals+ '\' in all';
					    FilterList.add(Allvl);
                	 }
	            	String[] FilNames = KPI.Filter_Name__c.split(';');
	            	String[] Userlogic = KPI.User_Logic__c.split(';');
                    KPIRec.SelectedFilterList = new list<WrapSelectedFilterList>();
                    KPIRec.SelectedFilters = new list<FilterInnerClass>();
                    integer i=0;
                    integer k=0;
                    integer j= 1;
                    for(String Avail : FilterList){
                    	String selFilterNames;
                    	String Seloperator;
                    	String Selvalue;
                    	 String[] SplitwithAnd = Avail.replace('&&','##').replace('||','##').Split('##');
                    	 	
                    	 for(String Str : SplitwithAnd){    
                    	 	
                    	 	String[] SplitwithQuote = Str.Split('\'');
                    	 		selFilterNames = SplitwithQuote[1].replace('(\'','').remove('\'');
                    	 		String[] SplitwithSlash = SplitwithQuote[2].Split(' ');                  	 		
                    	 		Seloperator = SplitwithSlash[1];
                    	 		if(SplitwithSlash.size()>2){
                    	 		    Selvalue = SplitwithSlash[2].replace('\\\\\\"','').replace(')',''); 
                    	 		}
                    	 		else{
                    	 		    Selvalue = '';
                    	 		}
                    	 		 }
                    	 		 	KPIRec.SelectedFilters.add(new FilterInnerClass(Avail,1,FilNames[i],selFilterNames,Seloperator,Userlogic[i],Selvalue));
                    	 		
                    	 
                    	  KPIRec.SelectedFilterList.add(new WrapSelectedFilterList(FilNames[k],KPIRec.SelectedFilters,Avail,j,Userlogic[i]));
                    	 i=i+1;
                    	 k=k+1;
                        j=j+1;
                    }
                }
                if(KPI.Filter_code__c != Null && KPI.Filter_code__c != ''){
                    String[] FilterList;
                    FilterList = KPI.Filter_code__c.split('mwsqy');
                    KPIRec.InnClassEditvaluesList = new list<NewInnerclass>();
                      KPIRec.InnClassEdit = new  list<FilterInnerClassEdit>();
                    String[] FilNames = KPI.Filter_Name__c.split(';');
                        integer valRet = 1;
                         integer w = 1;
                        for(String TypeofSelect : FilterList){
		                if(TypeofSelect != Null && TypeofSelect != ''){
		                    KPIRec.InnClassEditvaluesList.add(new NewInnerclass(FilNames[w],TypeofSelect,integer.valueof(KPI.RowNumber__c)));
                           
		                }
		                W= W+1;
                        }
		                for(String TypeofSelect : FilterList){
		                	String[] TypeSelectList = typeofselect.Split('qsytr');
                        
                             for(string Type : TypeSelectList){
                                String Vlauesare;
                                String[] TypeMeasures = Type.Split('tyurew');
                                if(TypeMeasures[1] == 'measure'){
                            	if(TypeMeasures[4] == 'Between'){
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' >= '+String.valueof(TypeMeasures[2]).replace(',','') + ' && '+ '\''+TypeMeasures[6]+'\' <= '+ String.valueof(TypeMeasures[3]).replace(',','');
                            	}
                            	else if(TypeMeasures[4] == 'Greater Than'){
                            		 Vlauesare = '\'' +TypeMeasures[6]+'\' > '+ String.valueof(TypeMeasures[2]).replace(',','');
                            	}
                            	else if(TypeMeasures[4] == 'Greater Than Or Equal To'){
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' >= '+ String.valueof(TypeMeasures[2]).replace(',','');
                            	}
                            	else if(TypeMeasures[4] == 'Less Than'){
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' < '+String.valueof(TypeMeasures[3]).replace(',','');
                            	}
                            	else if(TypeMeasures[4] == 'Less Than Or Equal To'){
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' <= '+String.valueof(TypeMeasures[3]).replace(',','');
                            	}
                            	else if(TypeMeasures[4] == 'Equals'){
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' == '+String.valueof(TypeMeasures[2]).replace(',','');
                            	}
                            	else if(TypeMeasures[4] == 'Does Not Equal'){
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' != '+String.valueof(TypeMeasures[2]).replace(',','');
                            	}
                            	else if(TypeMeasures[4] == 'Is Null'){
                            	     Vlauesare = '\''+TypeMeasures[6]+'\' is null';
                            	}
                            	else if(TypeMeasures[4] == 'Is Not Null'){
                            	     Vlauesare = '\''+TypeMeasures[6]+'\' is not null';
                            	    
                            	}
                            	 KPIRec.InnClassEdit.add(new FilterInnerClassEdit(TypeMeasures[0].replace('&lt;','<').replace('&gt;','>'),TypeMeasures[1],TypeMeasures[2],TypeMeasures[3],TypeMeasures[4],TypeMeasures[5],FilNames[valRet],Type,TypeMeasures[6],'','',integer.valueof(KPI.RowNumber__c)));
                             }
                             if(TypeMeasures[1] == 'date'){
                            	if(TypeMeasures[4] == 'Between'){     
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' >= '+TypeMeasures[2] + ' && '+ '\''+TypeMeasures[6]+'\' <= '+TypeMeasures[3];
                            	}
                            	else if(TypeMeasures[4] == 'Greater Than Or Equal To'){
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' >= '+TypeMeasures[2];
                            	}
                            	else if(TypeMeasures[4] == 'Less Than Or Equal To'){
                            		 Vlauesare = '\''+TypeMeasures[6]+'\' <= '+TypeMeasures[3];
                            	}
                            	KPIRec.InnClassEdit.add(new FilterInnerClassEdit(TypeMeasures[0].replace('&lt;','<').replace('&gt;','>'),TypeMeasures[1],'','',TypeMeasures[4],TypeMeasures[5],FilNames[valRet],type,TypeMeasures[6],TypeMeasures[2],TypeMeasures[3],integer.valueof(KPI.RowNumber__c)));
                             }
                             if(TypeMeasures[1] == 'dimension'){
                            	if(TypeMeasures[3] == 'Equals'){
                            	      String Newval = '[\\\\\\"'+String.valueof(TypeMeasures[2])+']';
                            	    Newval = Newval.replace(',]','\\\\\\"]').replace(',','\\\\\\",\\\\\\"');
                            	     Vlauesare = '\''+TypeMeasures[5]+'\' in '+ Newval;
                            	}
                            	else if(TypeMeasures[3] == 'Does Not Equal'){
                            	  String Newval = '[\\\\\\"'+String.valueof(TypeMeasures[2])+']';
                            	    Newval = Newval.replace(',]','\\\\\\"]').replace(',','\\\\\\",\\\\\\"');
                            	     Vlauesare = '\''+TypeMeasures[5]+'\' not in '+ Newval;	     
                            
                            	}
                            	else{
                            	     Vlauesare = '\''+TypeMeasures[5]+'\' matches \\\\\\"'+String.valueof(TypeMeasures[2]) + '\\\\\\"';
                            	}
                            	KPIRec.InnClassEdit.add(new FilterInnerClassEdit(TypeMeasures[0],TypeMeasures[1],TypeMeasures[2],'',TypeMeasures[3],TypeMeasures[4],FilNames[valRet],type,TypeMeasures[5],'','',integer.valueof(KPI.RowNumber__c)));
                             } 	
                        			
                              
                            }
                            valRet = valRet+1;
		                }
                }
                
                
                
                
                
                }
                
    			}
    			}
    			}
    		}
            
             else{
            	KPIDetils.add(new KPIClass('', 6,DatasetValuesList ,false));
             }
    	}
        }catch(Exception e){
    		
    	}
    }
    
    public boolean DeleteAllValues1{get;set;}
    public boolean AddAllValues1{get;set;}
    public void DeleteAll(){
    	if(DeleteAllValues1 == true){
    		KPIDetils = new List<KPIClass>();   
        	KPIDetils.add(new KPIClass('', 6,DatasetValuesList ,false));
    	}
    	DeleteAllValues1 = false;
    	AddAllValues1 = true;
    }
    
    public class FilterInnerClass{
        public String selectedFilters{get;set;}
        public String FilterNames{get;set;}
        public Integer Filtervalue{get;set;}
         public String FieldName{get;set;}
          public String Operator{get;set;}
           public String UserLogic{get;set;}
            public String Value{get;set;}
            
        public FilterInnerClass(String selectedFilters,Integer Filtervalue,String FilterNames,String FieldName,String Operator,String UserLogic,String Value){
            this.selectedFilters = selectedFilters;
            this.Filtervalue = Filtervalue;
            this.FilterNames = FilterNames;
             this.Value = Value;
            this.FieldName = FieldName;
            this.Operator = Operator;
             this.UserLogic = UserLogic;
        }
    }  
    
    
        
    public class FilterInnerClassEdit{
        public String typeofSelect{get;set;}   
        public String minval{get;set;}
        public String maxVal{get;set;}
        public String filterCon{get;set;}
        public String selectedfield{get;set;}
        public String Betweens{get;set;}
        public String Fieldname{get;set;}
        public String FilterIds{get;set;}  
         public String FieldAPI{get;set;}  
         public String fromDate{get;set;}  
         public String toDate{get;set;}  
         public integer RowNumber{get;set;}
        public FilterInnerClassEdit(String Betweens,String typeofSelect,String minval,String maxVal,String filterCon,String selectedfield,String Fieldname,String FilterIds,String FieldAPI,String fromDate,String toDate,integer RowNumber){
            this.typeofSelect = typeofSelect;
            this.minval = minval;
            this.maxVal = maxVal;   
             this.filterCon = filterCon;
            this.selectedfield = selectedfield;
            this.Betweens = Betweens;
            this.Fieldname = Fieldname;
            this.FilterIds = FilterIds;
            this.FieldAPI = FieldAPI;
            this.fromDate = fromDate;
            this.toDate = toDate;
            this.RowNumber = RowNumber;
        }
    }
    
     public class NewInnerclass{
         public String typeofSelect{get;set;}   
        public String minval{get;set;}
        public integer RowNumber{get;set;}
         public NewInnerclass(String minval,String typeofSelect,integer RowNumber){
              this.typeofSelect = typeofSelect;
                this.minval = minval;
                this.RowNumber = RowNumber;
         }
    }
    
    
     public class MeasureAngularclass{
         public String Measurename{get;set;}   
        public String Measurevar{get;set;}
        public String Measureval{get;set;}
        public String EditMeasval{get;set;}
         public String EditApi{get;set;}
         public MeasureAngularclass(String Measurename,String Measurevar,String Measureval,String EditMeasval,String EditApi){
              this.Measurename = Measurename;
                this.Measurevar = Measurevar;
                this.Measureval = Measureval;
                this.EditMeasval = EditMeasval;
                this.EditApi = EditApi;
         }
    }



}