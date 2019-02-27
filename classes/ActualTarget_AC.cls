public with sharing class ActualTarget_AC { 
    public Boolean SetDimension{get;set;}
    public Boolean SetDimensionValue{get;set;} 
    public boolean showSectionEdit{get;set;}
    public String KPINameUI{get;set;}
    public String Measure1{get;set;}
    public String Measure2{get;set;}
    public String Measure3{get;set;}
    public String Measure4{get;set;}
    public String Measure5{get;set;}
    public String Measure6{get;set;}
    public String Measure7{get;set;}
    public String Measure8{get;set;}
    public String Measure9{get;set;}
    public integer KPIValue{get;set;}
    public Map<String,String> DatasetMaps{get;set;}
    public Map<String,String> MapValues{get;set;}
    public String sessionId;
    public List<SelectOption> DatasetValuesList{get;set;}
    public  Map<String,String> DimensionLabel{get;set;}
    public  Map<String,String> MeasureFieldAPI{get;set;}
    public Map<String,String> versionLabel{get;set;}
    public Map<String,String> VersionUrl{get;set;}
    public String SessionsId{get;set;}
    public String SelectKPIValue{get;set;}
    public String SelectKPIId{get;set;}
    public String SelectKPIIdone{get;set;}
    public boolean AddFiltersShow{get;set;}
    public boolean EditFiltersShow{get;set;}
    public String tabid{get;set;}
    public boolean EditLabels{get;set;}     
    public string strFloderId{get; set;}
    public List<SelectOption> getFloderList{get;set;} 
    public String SelectedButtonValue{get;set;}
    public Integer SelectedrowValue{get;set;} 
    public boolean DimensionIdClose{get;set;}
    public boolean DimensionIdClosetwo{get;set;}
    public String CurrentVersionId{get;set;} 
    public String CurrentVersionUrl{get;set;}  
    public String CurrentVersionIdone{get;set;} 
    public String CurrentVersionUrlone{get;set;}  
    public boolean DatesIdClose{get;set;}
    public boolean DatesIdClosetwo{get;set;}
    public boolean MeasureIdClose{get;set;}
    public boolean MeasureIdCloses{get;set;}
    public string datevalue{get;set;}
    public string datevalueact{get;set;}
    public String ThemeValue{get;set;}
    
    public list<Measureclass> Measureoneslist{get;set;}
    public list<Measureclass> Measureonestwolist{get;set;}
    public list<Measureclass> Measureonesthreelist{get;set;}
    public String AllVal{get;set;}
    public List<SelectOption> NewListopt{get;set;}
    public string AnalyticsDashboardId{get;set;}
    public Organization org{get;set;}
    public User userData{get;set;}
    
    public void MeasureNew(){
        String MeasureRecordval = System.currentPageReference().getParameters().get('Menuitemsval');
        // integer RowNumber = integer.valueof(System.currentPageReference().getParameters().get('RowNumber'));
        String MeasureRecordtar = System.currentPageReference().getParameters().get('Menuitemsvaltar');
        String Measureones = System.currentPageReference().getParameters().get('Measureones');
        String Measureonestwo = System.currentPageReference().getParameters().get('Measureonestwo');
        String Measureonesthree = System.currentPageReference().getParameters().get('Measureonesthree');
        set<String> SelectedMeastwo = new set<String>();
        set<String> SelectedMeas = new set<String>();
        list<MeasureAngularclass> NewMeasurevarlist = new list<MeasureAngularclass>();
        list<MeasureAngularclass> NewMeasurevarlisttwo = new list<MeasureAngularclass>();
        MeasureIdClose = false;
        MeasureIdCloses = false;
        system.debug('MeasureRecordval***************'+ MeasureRecordval);
        if(MeasureRecordval != Null && MeasureRecordval != '' && MeasureRecordval.contains('<li')){
            system.debug('MeasureRecordval***********'+MeasureRecordval);
            MeasureRecordval = MeasureRecordval.Replace('<li onclick="setActiveMesRows(this)">','').replace('<input type="hidden" class="parentSelected" value="','');
            MeasureRecordval = MeasureRecordval.Replace('<li onclick="setActiveMesRows(this)" style="background-color: white;">','');
            MeasureRecordval = MeasureRecordval.Replace('<li onclick="setActiveMesRows(this)" style="background-color: lightgrey;">','');
            MeasureRecordval = MeasureRecordval.Replace('<li onclick="setActiveMesRows(this)" style="background-color:white;">','');
            MeasureRecordval = MeasureRecordval.Replace('<li onclick="setActiveMesRows(this)" style="background-color:lightgrey;">','');
            MeasureRecordval = MeasureRecordval.Replace('<input class="parentSelected" type="hidden" value="','');
            MeasureRecordval = MeasureRecordval.Replace('<input type="hidden" class="itemSelected" value="','');
            MeasureRecordval = MeasureRecordval.Replace('<input class="itemSelected" type="hidden" value="','');
            MeasureRecordval = MeasureRecordval.Replace('<input type="hidden" class="editApi" value="','');
            MeasureRecordval = MeasureRecordval.Replace('<input class="editApi" type="hidden" value="','');
            MeasureRecordval = MeasureRecordval.Replace('<input type="hidden" class="editSelected" value="','');
            MeasureRecordval = MeasureRecordval.Replace('<input class="editSelected" type="hidden" value="','');
            MeasureRecordval = MeasureRecordval.Replace('<div style="cursor: pointer;overflow:hidden;text-overflow:ellipsis;"','');
            MeasureRecordval = MeasureRecordval.Replace('<div style="cursor: pointer;overflow:hidden;text-overflow:ellipsis;"> ','');
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
            String[] MeasureLists = MeasureRecordval.split('rwsallval');
            System.debug('MeasureLists $$$$$$$$$$$$$$$$$$$'+MeasureLists);
            for(KPIClass KPI : KPIDetils){
                if(KPI.KPIRownumber == 1){
                    integer vals = 1;
                    for(String Measurewrap : MeasureLists){
                        if(Measurewrap != Null && Measurewrap != ''){
                            String[] NewMsList = Measurewrap.split('cntrws');
                            String sumoflist;
                            system.debug('NewMsList[2] "'+NewMsList[2] + '"');
                            if(NewMsList[2] == 'count(Rows)'){
                                sumoflist = 'count(Rows)';
                            }
                            else{
                                sumoflist = NewMsList[2];
                            }
                            String NewMsListString = '';
                            if(NewMsList[0].contains('count')){
                                NewMsListString='count';
                            }
                            if(NewMsList[0].contains('sum')){
                                NewMsListString='sum';
                            }
                            if(NewMsList[0].contains('avg')){
                                NewMsListString='avg';
                            }
                            if(NewMsList[0].contains('min')){
                                NewMsListString='min';
                            }
                            if(NewMsList[0].contains('min')){
                                NewMsListString='min';
                            }
                            if(NewMsList[0].contains('stddev')){
                                NewMsListString='stddev';
                            }
                        if(NewMsList[0].contains('stddevp')){
                            NewMsListString='stddevp';
                        }
                        if(NewMsList[0].contains('var')){
                            NewMsListString='var';
                        }
                        if(NewMsList[0].contains('varp')){
                            NewMsListString='varp';
                        }
                        if(NewMsList[0].contains('unique')){
                           NewMsListString='unique';
                        }
                        if(NewMsList[0].contains('median')){
                            NewMsListString='median';
                        }
                        if(NewMsList[0].contains('first')){
                            NewMsListString='first';
                        }
                        if(NewMsList[0].contains('last')){
                            NewMsListString='last';
                        }
                        String Var;
                        String[] NewMsListspace = NewMsList[1].split('  ');
                        for(string Nes :NewMsListspace){
                            if(Nes != '' && Nes != null){
                                Var = Nes;
                            }
                        }
                        String dddd;
                        if(vals == 1){
                             integer Measureone = integer.valueof(System.currentPageReference().getParameters().get('Measureone'));
                        	 integer Measurefour = integer.valueof(System.currentPageReference().getParameters().get('Measurefour'));
                        	 integer Measuresev = integer.valueof(System.currentPageReference().getParameters().get('Measuresev'));
                        	 dddd = Measureone+','+Measurefour+','+Measuresev;
                        }
                        if(vals == 2){
                            integer Measuretwo = integer.valueof(System.currentPageReference().getParameters().get('Measuretwo'));
                        	 integer Measurefive = integer.valueof(System.currentPageReference().getParameters().get('Measurefive'));
                        	  integer Measureeig = integer.valueof(System.currentPageReference().getParameters().get('Measureeig'));
                        	 dddd = Measuretwo+','+Measurefive+','+Measureeig;
                            
                        }
                        if(vals == 3){
                             integer Measurethree = integer.valueof(System.currentPageReference().getParameters().get('Measurethree'));
                        	 integer Measuresix = integer.valueof(System.currentPageReference().getParameters().get('Measuresix'));
                        	 integer Measurenine = integer.valueof(System.currentPageReference().getParameters().get('Measurenine'));
    	                       dddd = Measurethree+','+Measuresix+','+Measurenine;
                        } 
                        SelectedMeas.add(sumoflist);
                        NewMeasurevarlist.add(new MeasureAngularclass(sumoflist,NewMsListString.replace(' ',''),Var,sumoflist,NewMsList[3],dddd));
                        //  system.debug('KPI.selectedMeasures '+ KPI.selectedMeasures + ' Size' + KPI.selectedMeasures.size());
                        vals = vals+1;
                    }
                }
                if(SelectedMeas.size() != 0 && SelectedMeas != Null){
                    if(SelectedMeas.size() <=3){
                        MeasureIdClose = true;
                        for(String Sts: SelectedMeas){
                            //KPI.selectedMeasures.add(sts);
                            //KPI.MeasureSize = KPI.selectedMeasures.size();
                        }
                    } 
                    else{
                        MeasureIdClose = false;
                        Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'You Cannot Select More than 3 Measures.'));
                    }
                }
                else{
                    MeasureIdClose = false;
                    Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'Please Select atleast 1 Measure.'));
                }
            } 
        }
    }
    else{
        MeasureIdClose = false;
        Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'Please Select atleast 1 Measure.'));
    }
        if(MeasureRecordtar != Null && MeasureRecordtar != '' && MeasureRecordtar.contains('<li')){
        system.debug('MeasureRecordtar***********'+MeasureRecordtar);
         
         MeasureRecordtar = MeasureRecordtar.Replace('<li onclick="setActivetarRows(this)">','').replace('<input type="hidden" class="parentSelected" value="','');
          MeasureRecordtar = MeasureRecordtar.Replace('<li onclick="setActivetarRows(this)" style="background-color: white;">','');
         MeasureRecordtar = MeasureRecordtar.Replace('<li onclick="setActivetarRows(this)" style="background-color: lightgrey;">','');
          MeasureRecordtar = MeasureRecordtar.Replace('<li onclick="setActivetarRows(this)" style="background-color:white;">','');
         MeasureRecordtar = MeasureRecordtar.Replace('<li onclick="setActivetarRows(this)" style="background-color:lightgrey;">','');
         MeasureRecordtar = MeasureRecordtar.Replace('<input class="parentSelected" type="hidden" value="','');
         MeasureRecordtar = MeasureRecordtar.Replace('<input type="hidden" class="itemSelected" value="','');
         MeasureRecordtar = MeasureRecordtar.Replace('<input class="itemSelected" type="hidden" value="','');
             MeasureRecordtar = MeasureRecordtar.Replace('<input type="hidden" class="editApi" value="','');
             MeasureRecordtar = MeasureRecordtar.Replace('<input class="editApi" type="hidden" value="','');
         
         MeasureRecordtar = MeasureRecordtar.Replace('<input type="hidden" class="editSelected" value="','');
         MeasureRecordtar = MeasureRecordtar.Replace('<input class="editSelected" type="hidden" value="','');
         MeasureRecordtar = MeasureRecordtar.Replace('<div style="cursor: pointer;overflow:hidden;text-overflow:ellipsis;"','');
         MeasureRecordtar = MeasureRecordtar.Replace('<div style="cursor: pointer;overflow:hidden;text-overflow:ellipsis;"> ','');
         MeasureRecordtar = MeasureRecordtar.Replace('</div>','').replace('<div style="cursor: pointer;">','cntrws');
         MeasureRecordtar = MeasureRecordtar.Replace('<img style="cursor:pointer;position:relative; z-index:2;" src="','');
         MeasureRecordtar = MeasureRecordtar.Replace('<img height="10px" src="','');
         MeasureRecordtar = MeasureRecordtar.Replace('<img height="12px" onclick="removeItemsone(this,1,\'','');
         MeasureRecordtar = MeasureRecordtar.Replace('\')" src="/resource/1490525779000/analyticscc__Delete" style="cursor:pointer;position:relative; z-index:2;" width="26px">','');
         MeasureRecordtar = MeasureRecordtar.Replace('" style="cursor:pointer;position:relative; z-index:2;" width="20px">','');
         MeasureRecordtar = MeasureRecordtar.Replace('" width="20px" height="10px" />','');
         MeasureRecordtar = MeasureRecordtar.Replace('<img style="cursor:pointer;position:relative; z-index:2;"  src="','');
         MeasureRecordtar = MeasureRecordtar.replace('" onclick="removeItemsone(this,1,\'','cntrws').replace('</li>','rwsallval').replace('">','cntrws');
         MeasureRecordtar = MeasureRecordtar.replace('\')" width="26px" height="12px" />','');
        String[] MeasureListstar = MeasureRecordtar.split('rwsallval');
        System.debug('MeasureListstar $$$$$$$$$$$$$$$$$$$'+MeasureListstar);
        for(KPIClass KPI : KPIDetils){
            if(KPI.KPIRownumber == 2){
           
            
             for(String Measurewrap : MeasureListstar){
                 if(Measurewrap != Null && Measurewrap != ''){
                 String[] NewMsList = Measurewrap.split('cntrws');
                 String sumoflist;
                 system.debug('NewMsList[2] "'+NewMsList[2] + '"');
                 if(NewMsList[2] == 'count(Rows)'){
                     sumoflist = 'count(Rows)';
                    
                 }
                 else{
                     sumoflist = NewMsList[2];
                 }
                  String NewMsListString = '';
                  if(NewMsList[0].contains('count')){
                       NewMsListString='count';
                    }
                    if(NewMsList[0].contains('sum')){
                        NewMsListString='sum';
                    }
                    if(NewMsList[0].contains('avg')){
                        NewMsListString='avg';
                    }
                    if(NewMsList[0].contains('min')){
                        NewMsListString='min';
                    }
                    if(NewMsList[0].contains('min')){
                        NewMsListString='min';
                    }
                    if(NewMsList[0].contains('stddev')){
                        NewMsListString='stddev';
                    }
                    if(NewMsList[0].contains('stddevp')){
                        NewMsListString='stddevp';
                    }
                    if(NewMsList[0].contains('var')){
                        NewMsListString='var';
                    }
                    if(NewMsList[0].contains('varp')){
                        NewMsListString='varp';
                    }
                    if(NewMsList[0].contains('unique')){
                       NewMsListString='unique';
                    }
                    if(NewMsList[0].contains('median')){
                            NewMsListString='median';
                        }
                        if(NewMsList[0].contains('first')){
                            NewMsListString='first';
                        }
                        if(NewMsList[0].contains('last')){
                            NewMsListString='last';
                        }
                    String Var;
                    String[] NewMsListspace = NewMsList[1].split('  ');
                    for(string Nes :NewMsListspace){
                        if(Nes != '' && Nes != null){
                            Var = Nes;
                        }
                    }
                    
                    
                    SelectedMeastwo.add(sumoflist);
                    
                    
                     NewMeasurevarlisttwo.add(new MeasureAngularclass(sumoflist,NewMsListString.replace(' ',''),Var,sumoflist,NewMsList[3],''));
                  //  system.debug('KPI.selectedMeasures '+ KPI.selectedMeasures + ' Size' + KPI.selectedMeasures.size());
                 }
             }
             if(SelectedMeastwo != Null && SelectedMeastwo.size() != 0){
                 if(SelectedMeastwo.size() <=3){
                        MeasureIdCloses = true;
                         for(String Sts: SelectedMeastwo){
                       // KPI.selectedMeasures.add(sts);
                        }
                } 
                else{
                    MeasureIdCloses = false;
                    Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'You Cannot Enter More than 3 Measures.'));
                }
             }
             else{
                  MeasureIdCloses = false;
                Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'Select atleast 1 Measure.'));
             }
        }
        }
        }
        else{
                  MeasureIdCloses = false;
                Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'Select atleast 1 Measure.'));
             }
        
        for(KPIClass KPIRec : KPIDetils){
        if( MeasureIdCloses == true &&  MeasureIdClose == true){
            if(SelectedMeastwo.size() <= 3 && SelectedMeas.size() <= 3 && SelectedMeastwo.size() == SelectedMeas.size()){
                if(KPIRec.KPIRowNumber == 1){
                KPIRec.selectedMeasures = new set<string>();
        	    DimensionIdClose = true;
        	    KPIRec.selectedMeasures = SelectedMeas;
        	    KPIRec.NewMeasurevarlist = new list<MeasureAngularclass>();
        	     KPIRec.NewMeasurevarlist =  NewMeasurevarlist;
        	     
        	     if(Measureones != null && Measureones.contains('<li')){
            Measureones = Measureones.Replace('<li>','').replace('<input type="hidden" class="newselectorslist" value="','');
            Measureones = Measureones.Replace('<input class="newselectorslist" type="hidden" value="','').replace('"/>','Relsder').replace('">','Relsder').replace('</li>','ppppppee');
            Measureoneslist = new list<Measureclass>();
            String[] MeasureLists = Measureones.split('ppppppee');
            system.debug('MeasureLists*********************************' + MeasureLists);
            integer vals = 1;
            for(String Measurewrap : MeasureLists){
                 if(Measurewrap != Null && Measurewrap != ''){
                 String[] NewMsList = Measurewrap.split('Relsder');
                 integer dddd;
                if(vals == 1){
	                integer Measureone = integer.valueof(System.currentPageReference().getParameters().get('Measureone'));
	               dddd  = Measureone;
                }
                if(vals == 2){
                	integer Measuretwo = integer.valueof(System.currentPageReference().getParameters().get('Measuretwo'));
                    dddd  = Measuretwo;
                }
                if(vals == 3){
                	 integer Measurethree = integer.valueof(System.currentPageReference().getParameters().get('Measurethree'));
                	 dddd  = Measurethree;
                
                	
                }

	
                    Measureoneslist.add(new Measureclass(NewMsList[0],dddd));
                    vals = vals+1;
                 }
            }
            
        }
        if(Measureonestwo != null && Measureonestwo.contains('<li')){
            Measureonestwolist = new list<Measureclass>();
             Measureonestwo = Measureonestwo.Replace('<li>','').replace('<input type="hidden" class="newselectorslist" value="','');
            Measureonestwo = Measureonestwo.Replace('<input class="newselectorslist" type="hidden" value="','').replace('"/>','Relsder').replace('">','Relsder').replace('</li>','ppppppee');
           
            String[] MeasureLists = Measureonestwo.split('ppppppee');
            system.debug('MeasureLists22*********************************' + MeasureLists);
            integer vals = 1;
            for(String Measurewrap : MeasureLists){
                 if(Measurewrap != Null && Measurewrap != ''){
                 String[] NewMsList = Measurewrap.split('Relsder');
                 integer dddd;
                if(vals == 1){
	                integer Measurefour = integer.valueof(System.currentPageReference().getParameters().get('Measurefour'));
	               dddd  = Measurefour;
                }
                if(vals == 2){
                	integer Measurefive = integer.valueof(System.currentPageReference().getParameters().get('Measurefive'));
                    dddd  = Measurefive;
                }
                if(vals == 3){
                	 integer Measuresix = integer.valueof(System.currentPageReference().getParameters().get('Measuresix'));
                	 dddd  = Measuresix;
                
                	
                }
                    Measureonestwolist.add(new Measureclass(NewMsList[0],dddd));
                    vals = vals+1;
                 }
            }
            
        }
        if(Measureonesthree != null && Measureonesthree.contains('<li')){
            Measureonesthreelist = new list<Measureclass>();
             Measureonesthree = Measureonesthree.Replace('<li>','').replace('<input type="hidden" class="newselectorslist" value="','');
            Measureonesthree = Measureonesthree.Replace('<input class="newselectorslist" type="hidden" value="','').replace('"/>','Relsder').replace('">','Relsder').replace('</li>','ppppppee');
            
            String[] MeasureLists = Measureonesthree.split('ppppppee');
            integer vals = 1;
            for(String Measurewrap : MeasureLists){
                 if(Measurewrap != Null && Measurewrap != ''){
                 String[] NewMsList = Measurewrap.split('Relsder');
                  integer dddd;
                if(vals == 1){
	                integer Measuresev = integer.valueof(System.currentPageReference().getParameters().get('Measuresev'));
	               dddd  = Measuresev;
                }
                if(vals == 2){
                	integer Measureeig = integer.valueof(System.currentPageReference().getParameters().get('Measureeig'));
                    dddd  = Measureeig;
                }
                if(vals == 3){
                	 integer Measurenine = integer.valueof(System.currentPageReference().getParameters().get('Measurenine'));
                	 dddd  = Measurenine;
                }
                    Measureonesthreelist.add(new Measureclass(NewMsList[0],dddd));
                    vals = vals+1;
                 }
            }
        }
                }
                 if(KPIRec.KPIRowNumber == 2){
        	     KPIRec.selectedMeasures = new set<string>();
        	    DimensionIdClosetwo = true;
        	    KPIRec.selectedMeasures = SelectedMeastwo;
        	    KPIRec.NewMeasurevarlist = new list<MeasureAngularclass>();
        	     KPIRec.NewMeasurevarlist =  NewMeasurevarlisttwo;
                 }
            }
            else{
                  MeasureIdClose = false;
                  MeasureIdCloses= false;
                Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'Select Equal Measures in both Datasets.'));
             }
        }
        
        }
        
        
        
    }
    public void DimensionsNew(){
       // String Filtername = apexpages.currentpage().getparameters().get('DatehiddenKPI');
        String Dimensionname = apexpages.currentpage().getparameters().get('DimhiddenKPI'); 
           String Dimensionnames = apexpages.currentpage().getparameters().get('DimhiddenKPIs'); 
        
        Dimensionname = Dimensionname.replace('<li style="cursor: pointer;width: 99%;margin-top:5px;padding: 5px;border-radius: 2px;" onclick="setActiveRow(this)">','');
        Dimensionname = Dimensionname.replace('<li onclick="setActiveRow(this)" style="cursor: pointer;width: 99%;margin-top:5px;padding: 5px;border-radius: 2px;">','');
        Dimensionname = Dimensionname.replace('<li style="cursor: pointer;width: 99%;margin-top:5px;padding: 5px;border-radius: 2px;" onclick="setActiveRow(this)">','');
        Dimensionname = Dimensionname.replace('<div class="DimeItemDev" onclick="editDimModel(this)" style="display: inline;">','').replace('"></div>','Dimsval');
        Dimensionname = Dimensionname.replace('<img height="12px" src="','').replace('" style="cursor:pointer;position:relative; z-index:2;" width="26px"></div>','Dimsval');
        Dimensionname = Dimensionname.replace('<img style="cursor:pointer;position:relative; z-index:2;" src="','').replace('" width="26px" height="12px"></div>','Dimsval').replace('<p style="margin-left:30px;margin-top:-25px">','').replace('</p>','');
        Dimensionname = Dimensionname.replace('<input type="hidden" class="selectedfield" value="','Dimsval').replace('<input class="selectedfield" type="hidden" value="','Dimsval').replace('"></li>','NewDimension');
        
        
        
         Dimensionnames = Dimensionnames.replace('<li style="cursor: pointer;width: 99%;margin-top:5px;padding: 5px;border-radius: 2px;" onclick="setActiveRow(this)">','');
        Dimensionnames = Dimensionnames.replace('<li onclick="setActiveRow(this)" style="cursor: pointer;width: 99%;margin-top:5px;padding: 5px;border-radius: 2px;">','');
        Dimensionnames = Dimensionnames.replace('<li style="cursor: pointer;width: 99%;margin-top:5px;padding: 5px;border-radius: 2px;" onclick="setActiveRow(this)">','');
        Dimensionnames = Dimensionnames.replace('<div class="DimeItemDev" onclick="editDimModelone(this)" style="display: inline;">','').replace('"></div>','Dimsval');
        Dimensionnames = Dimensionnames.replace('<img height="12px" src="','').replace('" style="cursor:pointer;position:relative; z-index:2;" width="26px"></div>','Dimsval');
        Dimensionnames = Dimensionnames.replace('<img style="cursor:pointer;position:relative; z-index:2;" src="','').replace('" width="26px" height="12px"></div>','Dimsval').replace('<p style="margin-left:30px;margin-top:-25px">','').replace('</p>','');
        Dimensionnames = Dimensionnames.replace('<input type="hidden" class="selectedfield" value="','Dimsval').replace('<input class="selectedfield" type="hidden" value="','Dimsval').replace('"></li>','NewDimension');
        
             list<selectedDimesionWrapper> SelectedDimensionstwo = new list<selectedDimesionWrapper>();
                  list<selectedDimesionWrapper> SelectedDimensions = new list<selectedDimesionWrapper>();
                  DimensionIdClose = false;
                  DimensionIdClosetwo = false;
        for(KPIClass KPIRec : KPIDetils){
        if(KPIRec.KPIRowNumber == 1){
       
        	if(Dimensionname != Null && Dimensionname != ''){
        	String[] Dimensionnamelist = Dimensionname.split('NewDimension');
        	for(String availablename : Dimensionnamelist){
        	    String[] availablenamelist = availablename.split('Dimsval');  
        	    SelectedDimensions.add(new selectedDimesionWrapper(availablenamelist[1].removeEnd(' '),false,availablenamelist[2].removeEnd(' ')));
        	}
        	
        	if(SelectedDimensions.size() <= 6){
        	    DimensionIdClose = true;
        	}
        	else{
        	    DimensionIdClose = false;
        		DimensionId = true;
        		if(SelectedDimensions.Size() > 6)
        		Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'You Cannot Select More than 6 Dimensions.'));
        		
        	}
        	}
        	else{
        	    DimensionIdClose = false;
        	    DimensionId = true;
        	   Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'Please Select atleast 1 Dimension.'));
        	}
        }
        if(KPIRec.KPIRowNumber == 2){
           
        	if(Dimensionnames != Null && Dimensionnames != ''){
        	String[] Dimensionnamelist = Dimensionnames.split('NewDimension');
        	for(String availablename : Dimensionnamelist){
        	    String[] availablenamelist = availablename.split('Dimsval');  
        	    SelectedDimensionstwo.add(new selectedDimesionWrapper(availablenamelist[1].removeEnd(' '),false,availablenamelist[2].removeEnd(' ')));
        	}
        	
        	if(SelectedDimensionstwo.size() <= 6){
        	   DimensionIdClosetwo = true;
        	}
        	else{
        	    DimensionIdClosetwo = false;
        		DimensionId = true;
        		if(SelectedDimensionstwo.Size() > 6)
        		Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'You Cannot Select More than 6 Dimensions.'));
        		
        	}
        	}
        	else{
        	    DimensionIdClosetwo = false;
        	    DimensionId = true;
        	   Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'Please Select atleast 1 Dimension.'));
        	}
        }
        }
        for(KPIClass KPIRec : KPIDetils){
        if( DimensionIdClosetwo == true &&  DimensionIdClose == true){
            if(SelectedDimensions.size() <= 6 && SelectedDimensionstwo.size() <= 6 && SelectedDimensions.size() == SelectedDimensionstwo.size()){
                if(KPIRec.KPIRowNumber == 1){
                KPIRec.SelectedDimensions = new list<selectedDimesionWrapper>();
        	    DimensionIdClose = true;
        	    KPIRec.SelectedDimensions = SelectedDimensions;
                }
                 if(KPIRec.KPIRowNumber == 2){
        	     KPIRec.SelectedDimensions = new list<selectedDimesionWrapper>();
        	    DimensionIdClosetwo = true;
        	    KPIRec.SelectedDimensions = SelectedDimensionstwo;
                 }
            }
            else{
                DimensionIdClosetwo = false;
                DimensionIdClose = false;
                 DimensionId = true;
        	   Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'Select Equal Dimensions in both Datasets.'));
            }
        }
        
        }
        
    }
    
    public void DatesNew(){
        String Dimensionname = apexpages.currentpage().getparameters().get('DatehiddenKPI');
          String Dimensionnames = apexpages.currentpage().getparameters().get('DatehiddenKPIs');
        
        //String Dimensionname = apexpages.currentpage().getparameters().get('DimhiddenKPI'); 
        Dimensionname = Dimensionname.replace('<li style="cursor: pointer;width: 99%;margin-top:5px;padding: 5px;border-radius: 2px;" onclick="setActiveRowdate(this)">','');
        Dimensionname = Dimensionname.replace('<li onclick="setActiveRowdate(this)" style="cursor: pointer;width: 99%;margin-top:5px;padding: 5px;border-radius: 2px;">','');
        Dimensionname = Dimensionname.replace('<li onclick="setActiveRowdate(this)" style="cursor: pointer; width: 99%; margin-top: 5px; padding: 5px; border-radius: 2px; background-color: lightgrey;">','');
        Dimensionname = Dimensionname.replace('<div class="dateFivDiv" onclick="editDateModel(this)" style="display: inline;">','').replace('"></div>','Dimsval');
        Dimensionname = Dimensionname.replace('<img height="12px" src="','').replace('" style="cursor:pointer;position:relative; z-index:2;" width="26px"></div>','Dimsval');
        Dimensionname = Dimensionname.replace('<img style="cursor:pointer;position:relative; z-index:2;" src="','').replace('" width="26px" height="12px"></div>','Dimsval').replace('<p style="margin-left:30px;margin-top:-25px">','').replace('</p>','');
        Dimensionname = Dimensionname.replace('<input type="hidden" class="selectedfield" value="','Dimsval').replace('<input class="selectedfield" type="hidden" value="','Dimsval').replace('"></li>','NewDimension');
        
         Dimensionnames = Dimensionnames.replace('<li style="cursor: pointer;width: 99%;margin-top:5px;padding: 5px;border-radius: 2px;" onclick="setActiveRowdate(this)">','');
        Dimensionnames = Dimensionnames.replace('<li onclick="setActiveRowdateone(this)" style="cursor: pointer;width: 99%;margin-top:5px;padding: 5px;border-radius: 2px;">','');
        Dimensionnames = Dimensionnames.replace('<li onclick="setActiveRowdateone(this)" style="cursor: pointer; width: 99%; margin-top: 5px; padding: 5px; border-radius: 2px; background-color: lightgrey;">','');
        Dimensionnames = Dimensionnames.replace('<div class="dateFivDiv" onclick="editDateModelone(this)" style="display: inline;">','').replace('"></div>','Dimsval');
        Dimensionnames = Dimensionnames.replace('<img height="12px" src="','').replace('" style="cursor:pointer;position:relative; z-index:2;" width="26px"></div>','Dimsval');
        Dimensionnames = Dimensionnames.replace('<img style="cursor:pointer;position:relative; z-index:2;" src="','').replace('" width="26px" height="12px"></div>','Dimsval').replace('<p style="margin-left:30px;margin-top:-25px">','').replace('</p>','');
        Dimensionnames = Dimensionnames.replace('<input type="hidden" class="selectedfield" value="','Dimsval').replace('<input class="selectedfield" type="hidden" value="','Dimsval').replace('"></li>','NewDimension');
        	list<SelectedDateFieldWrapper> SelectedDateFieldlist = new list<SelectedDateFieldWrapper>();
        		list<SelectedDateFieldWrapper> SelectedDateFieldlisttwo = new list<SelectedDateFieldWrapper>();
        		DatesIdClosetwo = false;
        		DatesIdClose = false;
        for(KPIClass KPIRec : KPIDetils){
        	if(KPIRec.KPIRowNumber == 1){
        
        	if(Dimensionname != Null && Dimensionname != ''){
        	String[] Dimensionnamelist = Dimensionname.split('NewDimension');
                for(String availablename : Dimensionnamelist){
                    String[] availablenamelist = availablename.split('Dimsval');  
            	    SelectedDateFieldlist.add(new SelectedDateFieldWrapper(availablenamelist[1].removeEnd(' '),false,availablenamelist[2].removeEnd(' ')));
                }	
            	 if(SelectedDateFieldlist.Size() <=2){ 
            	    DatesIdClose = true;
            	   
            	 }
            	 else{
            		DateIds = true;
                    Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'You Cannot Enter More than 2 DateFields.'));
                 }         
         }
         else{
             DateIds = true;
             Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'Select atleast 1 DateField.'));
                 
         }
         }
            if(KPIRec.KPIRowNumber == 2){
        	if(Dimensionnames != Null && Dimensionnames != ''){
        	String[] Dimensionnamelist = Dimensionnames.split('NewDimension');
                for(String availablename : Dimensionnamelist){
                    String[] availablenamelist = availablename.split('Dimsval');  
            	    SelectedDateFieldlisttwo.add(new SelectedDateFieldWrapper(availablenamelist[1].removeEnd(' '),false,availablenamelist[2].removeEnd(' ')));
                }	
            	 if(SelectedDateFieldlisttwo.Size() <=2){ 
            	    DatesIdClosetwo = true;
            	   
            	 }
            	 else{
            	     DatesIdClosetwo = false;
            		DateIds = true;
                    Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'You Cannot Enter More than 2 DateFields.'));
                 }         
         }
         else{
             DateIds = true;
             Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'Select atleast 1 DateField.'));
                 
         }
         }
         }
         
         for(KPIClass KPIRec : KPIDetils){
        if( DatesIdClose == true &&  DatesIdClosetwo == true){
            if(SelectedDateFieldlist.size() <= 6 && SelectedDateFieldlisttwo.size() <= 6 && SelectedDateFieldlist.size() == SelectedDateFieldlisttwo.size()){
                if(KPIRec.KPIRowNumber == 1){
                KPIRec.SelectedDateFieldlist = new list<SelectedDateFieldWrapper>();
        	    KPIRec.SelectedDateFieldlist = SelectedDateFieldlist;
                }
                 if(KPIRec.KPIRowNumber == 2){
        	     KPIRec.SelectedDateFieldlist = new list<SelectedDateFieldWrapper>();
        	    KPIRec.SelectedDateFieldlist = SelectedDateFieldlisttwo;
                 }
            }
            else{
                DatesIdClose = false;
                DatesIdClosetwo = false;
             DateIds = true;
             Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.WARNING, 'Select Equal DateFields in both Datasets.'));
                 
         }
        }
        
        }
        
    }
   
    public ActualTarget_AC(){  	
        DimensionId = false;
         versionLabel = new Map<String,String>();
        VersionUrl = new Map<String,String>();
        DatasetMaps = new Map<String,String>();
        DatasetValuesList = new list<selectoption>();   
        MapValues  = new Map<String,String>();
        DimensionLabel = new Map<String,String>();      
        DateFullField = new Map<String,String>();
        MeasureFieldAPI = new Map<String,String>();
        DatasetRecords = new list<Dataset__c>(); 
        
        showSectionEdit = false;    
        RowNumbers = new set<integer>();
        EditLabels = false;
         datevalue = apexpages.currentpage().getparameters().get('date');
         datevalueact = apexpages.currentpage().getparameters().get('dateact');
         Themevalue = apexpages.currentpage().getparameters().get('theme');
         
         NewListopt = new list<selectoption>();
        list<Sales_Insight__c> ListSals = [select id,Name,Dashboard_Id__c  from Sales_Insight__c where Name = 'Default Actual Target Theme' and Dashboard_Id__c = null and Dashboard_Id__c = '']; 
        for(Sales_Insight__c Sl1 :ListSals){
            NewListopt.add(new SelectOption(sl1.id,sl1.Name));
        }
        list<Sales_Insight__c> ListSal = [select id,Name,Dashboard_Id__c  from Sales_Insight__c where Dashboard_Type__c = 'Contrast' and Name != 'Default Actual Target Theme' and Dashboard_Id__c != null and Dashboard_Id__c != ''];
        for(Sales_Insight__c Sl1 :ListSal){
            NewListopt.add(new SelectOption(sl1.id,sl1.Name));
        }
        
	    Allval = 'Default Actual Target Theme';
         
        DatasetFromJson  payTypes = new DatasetFromJson();  
        String Datasetvalues = getDatasets(); 
        if(Datasetvalues != null && Datasetvalues != ''){ 
            payTypes = DatasetFromJson.parse(Datasetvalues);
        } 
        if(payTypes.datasets !=null){
            for(DatasetFromJson.cls_datasets Rep : payTypes.datasets){              
                DatasetValuesList.add(new selectOption(Rep.Id,Rep.Name));   
                DatasetMaps.put(Rep.Id,Rep.currentVersionId);  
                MapValues.put(Rep.Id,Rep.Name);  
                 versionLabel.put(Rep.Id,Rep.currentVersionId) ;  
                 VersionUrl.put(Rep.Id,Rep.currentVersionUrl) ;     
            } 
        }
        
        fromJSON  Fnames = new fromJSON(); 
        String Folders = FloderNames();
        if(Folders != null && Folders != ''){
            Fnames =    fromJSON.parse(Folders);
        }
        getFloderList = new List<SelectOption>();
        getFloderList.add(new SelectOption(userInfo.getuserId(),'My Private App'));
        if(Fnames.folders !=null)
        for( fromJSON.cls_folders f:Fnames.folders){
            getFloderList.add(new SelectOption(f.id,f.name)); 
        }
        
       
        showSectionEdit = true; 
        setDimensionvalue= true; 
       
        String SectionValues = apexpages.currentpage().getparameters().get('aid');
        
       
        
        String SingleKPIvalue = apexpages.currentpage().getparameters().get('dbid');
        	KPIDetils = new List<KPIClass>();   
        	KPIDetils.add(new KPIClass('Actual', 1,DatasetValuesList ,false));
            KPIDetils.add(new KPIClass('Target', 2,DatasetValuesList ,false));
            SelectKPIId = apexpages.currentpage().getparameters().get('Id');
            SelectKPIIdone = apexpages.currentpage().getparameters().get('Id1');
            
            if(SelectKPIId != 'None' && SelectKPIIdone != 'None'){
             for(KPIClass KPIRec : KPIDetils){ 
                    
                    	if(KPIRec.KPIRownumber == 1){
                        KPIRec.KPIname = 'Actual';
                         KPIRec.dataSet = SelectKPIId;
                         CurrentVersionId = versionLabel.get(KPIRec.dataSet);
                    	CurrentVersionUrl = VersionUrl.get(KPIRec.dataSet);
                    	}
                    	if(KPIRec.KPIRownumber == 2){
                    	  KPIRec.KPIname = 'Target';  
                    	   KPIRec.dataSet = SelectKPIIdone;
                    	    CurrentVersionIdone = versionLabel.get(KPIRec.dataSet);
                    	CurrentVersionUrlone = VersionUrl.get(KPIRec.dataSet);
                    	}
                		
                    	DatasetDimensionFromJson  DimensionTypes = new DatasetDimensionFromJson();
                         string DimensionsReturnValue = Dimensions(KPIRec.dataSet);
                        	if(DimensionsReturnValue != null &&DimensionsReturnValue != ''){
                        		DimensionTypes = DatasetDimensionFromJson.parse(DimensionsReturnValue);
                        	}
                        	if(DimensionTypes.measures !=null){
                        		for(DatasetDimensionFromJson.cls_measures Dim : DimensionTypes.measures){  
                        			if(Dim.showInExplorer == true) {                
                        			MeasureFieldAPI.put(Dim.label,Dim.Field); 
                        			}                     
                        		} 
                        	}
                        // if(KPIRec.KPIRownumber == 1){                        
                        //     Wave_CreateDateXMD CreateXmd = new Wave_CreateDateXMD();
                        //     if(!Test.isRunningTest())
                        //         Wave_CreateDateXMD.CreateDateXMD(KPIRec.dataSet);
                        // } 
                        
                    }
            }      
                  
        if(SingleKPIvalue != 'None'){
        	CloneFromPrevious(SingleKPIvalue); 
        } 
        
        accountBalance = 0;
		NoAcccountbalance = false;
        CouponValue = 0;
        sessionId = UserInfo.getSessionId();
        
        buildCostMap.put('01t41000004IXmb', 4000); //Insights (Single Auto)
        buildCostMap.put('01t41000004IXkHAAW', 5000); //Insights (Single)
        buildCostMap.put('01t41000004IXkgAAG', 1000); //Insights Configuration
        buildCostMap.put('01t41000004IXmgAAG', 40000); //Command (Multi Auto)
        buildCostMap.put('01t41000004IXmWAAW', 10000); //Command Configuration
        buildCostMap.put('01t41000004IXkMAAW', 5000); //Compare (Snapshot)
        buildCostMap.put('01t41000004IXklAAG', 1000); //Compare Configuration
        buildCostMap.put('01t41000004IXkRAAW', 7000); //Contrast (A vs. T)
        buildCostMap.put('01t41000004IXliAAG', 1400); //Contrast Configuration
        displayConnectButtons = true;
       // isConnect = false;
        isCheckAccount = false;
        isCheckContact = false;
        
    } 
    public boolean SetMeasure{get;set;}        
    public list<availableDimesionWrapper> availabledimensions{get;set;}  
    public set<String> KPIValueList = new set<String>();
    //public Boolean Sectionone{get;set;}   
    public void SaveKPI1(){   
        try{        
            //KPINameUI= System.currentPageReference().getParameters().get('hiddenKPI');
            KPIValue= Integer.valueof(System.currentPageReference().getParameters().get('KPIValue')); 
     
                for(KPIClass KPIRec : KPIDetils){ 
                    if(KPIRec.KPIRownumber == integer.valueOf(KPIValue)){
                    	if(KPIRec.dataset != SelectKPIValue){
							KPIRec.SelectedDimensions = new list<selectedDimesionWrapper>();						
							KPIRec.SelectedDateFieldlist = new list<SelectedDateFieldWrapper>();					
							KPIRec.selectedMeasures	= new set<string>();
                    	}
                    	if(integer.valueOf(KPIValue) == 1){
                        KPIRec.KPIname = 'Actual';
                    	}
                    	else{
                    	  KPIRec.KPIname = 'Target';  
                    	}
                        KPIRec.dataSet = SelectKPIValue;
                		CurrentVersionId = versionLabel.get(SelectKPIvalue);
                    	CurrentVersionUrl = VersionUrl.get(SelectKPIvalue);
                    	DatasetDimensionFromJson  DimensionTypes = new DatasetDimensionFromJson();
                         string DimensionsReturnValue = Dimensions(KPIRec.dataSet);
                        	if(DimensionsReturnValue != null &&DimensionsReturnValue != ''){
                        		DimensionTypes = DatasetDimensionFromJson.parse(DimensionsReturnValue);
                        	}
                        	if(DimensionTypes.measures !=null){
                        		for(DatasetDimensionFromJson.cls_measures Dim : DimensionTypes.measures){  
                        			if(Dim.showInExplorer == true) {                
                        			MeasureFieldAPI.put(Dim.label,Dim.Field); 
                        			}                     
                        		} 
                        	}
                        if(KPIRec.KPIRownumber == 1){                        
                            Wave_CreateDateXMD CreateXmd = new Wave_CreateDateXMD();
                            if(!Test.isRunningTest())
                                Wave_CreateDateXMD.CreateDateXMD(KPIRec.dataSet);
                        } 
                        
                    }
                 
                }  
            
        }  
        catch(Exception e){
            
        }
    } 
    
     public String DateLabels{get;set;} 
    
    public Void EditLabelClass1(){
    	DimStrings = false;
    	DateStrings = true;
    	measStrings = false;
    	DateLabels = System.currentPageReference().getParameters().get('EditTopic');   
    	KPINameUI= DateLabels;
    }
    public String MeasLabels{get;set;} 
    public Void MeasLabelClass1(){
    	DimStrings = false;
    	DateStrings = false;
    	measStrings = true;
    	MeasLabels = System.currentPageReference().getParameters().get('MeasTopic');   
    	
    	KPINameUI= MeasLabels;
   
    }
    public map<String,String> EditDateMapping = new map<String,String>();
    public void SaveEditLabels(){
    	
    	try{
    	Integer RowValues= Integer.valueof(System.currentPageReference().getParameters().get('RowValues'));	
    	for(KPIClass KPIRec :KPIDetils){
    		if(KPIRec.KPIRowNumber == RowValues){
	    		if(KPIRec.SelectedDateFieldlist != Null){
		    		for(SelectedDateFieldWrapper SelDate : KPIRec.SelectedDateFieldlist){
		    			if(SelDate.DateFieldName == DateLabels){
		    				SelDate.DateFieldName = KPINameUI;
		    				if(DateFullField.get(DateLabels) != Null){
		    					KPIRec.EditDateMapping.put(KPINameUI,DateLabels);
		    				}
		    				else{
		    					KPIRec.EditDateMapping.put(KPINameUI,EditDateMapping.get(DateLabels));	
		    				}
		    				KPIRec.NewStringDate.remove(DateLabels);
		    				KPIRec.NewStringDate.add(DateLabels);
		    			}
		    			else{
		    				if(KPIRec.EditDateMapping.get(SelDate.DateFieldName) == Null)
		    				KPIRec.EditDateMapping.put(SelDate.DateFieldName,SelDate.DateFieldName);
		    			}
		    		}
	    		}
    		}
    	}
    	previous();
    	}catch(Exception e){
    		
    	}
    }
    public map<String,String> EditMeasMapping = new map<String,String>();
    public void SaveMeasLabels(){
    	try{
    	    set<String> SetMeas = new Set<String>();
    	Integer RowValues= Integer.valueof(System.currentPageReference().getParameters().get('RowValues'));	
    	for(KPIClass KPIRec :KPIDetils){
    		if(KPIRec.KPIRowNumber == RowValues){
    		    for(MeasureAngularclass Mes :  KPIRec.NewMeasurevarlist){
            	     if(Mes.Measurename == MeasLabels){
            	         Mes.Measurename = KPINameUI;
            	         Mes.EditMeasval = KPINameUI;
            	     }
            	 }
            	 if(KPIRec.EditMeasMapping == Null){
            	     KPIRec.EditMeasMapping = new map<String,String>();
            	 }
            	 else{
            	     
            	 }
    	if(KPIRec.selectedMeasures != Null){
	    		for(String SelDate : KPIRec.selectedMeasures){
	    			
	    			if(SelDate == MeasLabels){
	    				System.debug('*******************' + MeasLabels + ' '+SelDate);
	    				SelDate = KPINameUI;
	    				System.debug('***************************' + SelDate);
	    				
	    				MeasLabels = MeasLabels.replace('(',';');  				 
	                     String[] MeasLabellist = MeasLabels.Split(';');
	                     
	                     String LabelFields;
	                     if(MeasLabellist.Size()>1 ){
	                     LabelFields = MeasLabellist[1].replace(')','');
	                     }
	                     MeasLabels = MeasLabels.replace(';','('); 
	                     System.debug('&&&&&&&&&&&&&&&&&&&&eeeeeeefffffffffffffff' + MeasureFieldAPI.get(LabelFields));
	                     if(MeasureFieldAPI.get(LabelFields) != Null){
	                     	 System.debug('&&&&&&&&&&&&&&&&&&&&eeeeeeefffff' + MeasureFieldAPI.get(LabelFields));
	    					 KPIRec.EditMeasMapping.put(KPINameUI,MeasLabels.replace(';','('));
	                     } 
	                     else{
	                     	System.debug('&&&&&&&&&&&&&&&&&&&&eeeeeee' + KPIRec.EditMeasMapping.get(MeasLabels.replace(';','(')) + '*************'+MeasLabels.replace(';','('));
	                     	if(KPIRec.EditMeasMapping.get(MeasLabels.replace(';','(')) == Null){
	                     	KPIRec.EditMeasMapping.put(KPINameUI,MeasLabels.replace(';','('));
	                     	}
	                     	else{
	                     		KPIRec.EditMeasMapping.put(KPINameUI,KPIRec.EditMeasMapping.get(MeasLabels.replace(';','(')));	
	                     	}
	                     }   				
	    			}
	    			else{
	    				if(KPIRec.EditMeasMapping.get(SelDate) == Null)
	    				KPIRec.EditMeasMapping.put(SelDate,SelDate);
	    			}
	    			SetMeas.add(SelDate);
	    			System.debug('*******************************' + SelDate);
	    		}
	    		 KPIRec.selectedMeasures.Clear();
	    		 for(String Str : SetMeas){
	    		 	KPIRec.selectedMeasures.add(Str);
	    		 }
	    		System.debug('***************************' + KPIRec.selectedMeasures);
	    		System.debug('Select Label Edit' + KPIRec.EditDateMapping);
	    	}
    	}
    	}
    	EditLabels = true;
    	previous();
    	}catch(Exception e){
    		
    	}
    }
   
    public boolean DateStrings{get;set;}
    public boolean DimStrings{get;set;}
    public boolean measStrings{get;set;}
    public String DimensionLabels{get;set;} 
   
    public Void EditDimClass1(){
    	DimStrings = true;
    	DateStrings = false;
    	measStrings = false;
    	DimensionLabels = System.currentPageReference().getParameters().get('EditDim');
    	KPINameUI= DimensionLabels;
    }
    public map<String,String> EditDimMapping = new map<String,String>();
    public void SaveDimLabels(){
    	try{
    	Integer RowValues= Integer.valueof(System.currentPageReference().getParameters().get('RowValues'));	
    	System.debug('RowValues*************************' + RowValues + 'DimensionLabels****'+DimensionLabels);
    	for(KPIClass KPIRec :KPIDetils){
    		if(KPIRec.KPIRowNumber == RowValues){
    		if(KPIRec.SelectedDimensions != Null){
    		for(selectedDimesionWrapper SelDate : KPIRec.SelectedDimensions){
    			if(SelDate.Availablename == DimensionLabels){
    				SelDate.Availablename = KPINameUI;
    				if(DimensionLabel.get(DimensionLabels) != Null){
    					KPIRec.EditDimMapping.put(KPINameUI,DimensionLabels);
    				}
    				else{
    					KPIRec.EditDimMapping.put(KPINameUI,KPIRec.EditDimMapping.get(DimensionLabels));
    				}
    				KPIRec.NewString.remove(DimensionLabels);
    				KPIRec.NewString.add(KPINameUI);
    			}
    			else{
    				if(KPIRec.EditDimMapping.get(SelDate.Availablename) == Null)
    				KPIRec.EditDimMapping.put(SelDate.Availablename,SelDate.Availablename);
    			}
    		}
    	}
    	
    	}
    	}
    previous();
    }catch(Exception e){
    		
    	}
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
    
    public string FloderNames(){
        String sfdcInstance = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v39.0';
        String endpoint;
        endpoint = sfdcInstance + '/wave/folders?hasCurrentOnly=true';         
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
    
    public String getDatasets() {
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
    public String KPIDatasets{get;set;}
   
    public transient list<KPIs__c> KPIs;
    public list<MeasureAngularclass> NewMeasurevarlist{get;set;}
     public void Previous(){
       
      //  try{
        	DatesIdClose = false;
        	DatesIdClosetwo = false;
        DimensionIdClose = false;
        DimensionIdClosetwo = false;
        MeasureIdClose = false;
        MeasureIdCloses = false;
        EditLabels = false;
         
	
             DatasetRecords = new list<Dataset__c>();  
            list<KPIClass> nlist = new list<KPIClass>();    
            for(integer j=1;j<KPIDetils.Size()+1;j++){ 
                boolean a = false;
                boolean b = false;
                for(KPIClass KPI : KPIDetils){
                    if(j == KPI.KPIRownumber){  
                        String  AvailableDimension = '';
                        String DimensionApi= '';
                        String  AvailableDateField = ''; 
                        String  DateFieldApi = '';
                        String  AvailableMeasure = ''; 
                        String  MeasureAPI = ''; 
                        String  FilterName = '';
                        String AliasMeasureAPIN = '';
                        String CompactMeasureAPIN = '';
                        String Filtercode = '';
                        integer i=1;
                        if(KPI.EditMeasMapping == Null){
                            KPI.EditMeasMapping = new Map<String,String>();
                        }
                        if(KPI.selectedDimensions != null){   
                            for(selectedDimesionWrapper Avail : KPI.selectedDimensions){
                                AvailableDimension += Avail.Availablename.removeEnd(' ');
                                if(KPI.EditDimMapping.get(Avail.Availablename) != null){
                    				DimensionApi += DimensionLabel.get(KPI.EditDimMapping.get(Avail.Availablename));
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
                                AvailableDateField += DateField.DateFieldname.removeEnd(' ');                                  
                                if(KPI.EditDateMapping.get(DateField.DateFieldname) != Null){                                
		                        	DateFieldApi += DateFullField.get(KPI.EditDateMapping.get(DateField.DateFieldname));
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
                            system.debug('KPI.selectedMeasures***************'+KPI.selectedMeasures);
                            for(String Measurewrap : KPI.selectedMeasures){                 
                                AvailableMeasure += Measurewrap;
                                if(KPI.EditMeasMapping.get(Measurewrap) == Null){
		                        	Measurewrap = Measurewrap.replace('(',';');   
		                        }
		                        else{
		                        	 Measurewrap = KPI.EditMeasMapping.get(Measurewrap).replace('(',';');   
		                        }                        
                                String[] DateFieldlist = Measurewrap.Split(';');
                                String DateFields = '';
                                    if(DateFieldlist.size()>1){
		                        	DateFields = DateFieldlist[1].replace(')','');
                                    }
		                        
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
                                    if(DateFieldlist[0] == 'count ' || DateFieldlist[0] == 'count'){
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
                        
                        
                        String NewMeasurevarlistApi = '';
                        if(KPI.KPIRownumber == 1){
                             i=1;
                            if(KPI.NewMeasurevarlist != Null){
                                for(MeasureAngularclass Mesrec : KPI.NewMeasurevarlist){
                                    NewMeasurevarlistApi += Mesrec.Numbervalues;
                                    if(KPI.NewMeasurevarlist.Size() >= i + 1 ){
                                        NewMeasurevarlistApi += ';';
                                    }
                                    i++;
                                }
                            }
                        }
                       
                         
                        if(KPI.selectedDimensions != null){                             
                                        Dataset__c DatasetRec = new Dataset__c();
                                        DatasetRec.RowNumber__c = KPI.KPIRownumber; 
                                        DatasetRec.Dataset_Name__c = MapValues.get(KPI.dataset); 
                                        DatasetRec.Dataset_Id__c = KPI.dataset; 
                                        DatasetRec.Dimension_Name__c = ''; 
                                        DatasetRec.Dimension_API__c = '';
                                        DatasetRec.New_Dimension_Name__c = AvailableDimension; 
                                        DatasetRec.New_Dimension_API__c = DimensionApi; 
                                        DatasetRec.Date_Label__c = AvailableDateField; 
                                        DatasetRec.Data_API__c = DateFieldApi; 
                                        DatasetRec.Measure_Name__c = AvailableMeasure; 
                                        DatasetRec.Measure_API__c = MeasureAPI; 
                                        DatasetRec.KPI_Name__c = KPI.KPIName;
                                        DatasetRec.FilterLogic__c = NewMeasurevarlistApi;
                                        DatasetRec.Session_Id__c = SessionsId;
                                        DatasetRec.AliasMeasure_API__c = AliasMeasureAPIN;
                                        DatasetRec.CompactMeasure_API__c = CompactMeasureAPIN;
                                        DatasetRecords.add(DatasetRec);
                                       
                                    }   
                            }
                             else{
                                    b=true;
                            }

                    }
                     
                    
                    
                }
                
                
               
     
            
            showSectionEdit = true;  
            SetDimensionValue = true; 
            setDimension = false;
            filterrend = false;
      // } catch(Exception e){
            
      //  } 
    }
    
                       
    public List<DateFieldWrapper> DateWrapperList{get;set;}
    public List<MeasureWrapper> MeasureWrapperList{get;set;}            
    public boolean SetDate{get;set;}                
    public boolean filterrend{get;set;}         
    //public boolean  CountRender{get;set;}
    
   
    public list<Dataset__c> DatasetRecords{get;set;}
    public set<integer> RowNumbers{get;set;}
    
    
    public List<KPIClass> KPIDetils{get;set;}       

 
   
    
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
    
   
    public boolean filterTrue{get;set;}
    public integer filterCount;
    public integer FilterValue = 1;
    

    
    public boolean tableId{get;set;}
    public String Filternames{get;set;}
    public void AddFilter(){
      
    }
    
  
      public boolean DashboardSuccess { get; set; }
    public boolean DashboardSales { get; set; }
   public void submit(){
        try{
        if(accountBalance >= TotalCost){
        String dashboardName = System.currentPageReference().getParameters().get('hiddenDashboardName');
        String AllTheme;
             list<Sales_Insight__c> Sales = [select id from Sales_Insight__c where id=:AllVal];
             if(Sales.Size() > 0){
                 AllTheme = Sales[0].Id;
             }
             else{
                list<Sales_Insight__c> Saless = [select id from Sales_Insight__c where Name ='Default Actual Target Theme' and Dashboard_Id__c = null and Dashboard_Id__c = '' order by createddate asc limit 1]; 
                AllTheme = Saless[0].Id;
             }
             
             system.debug('DatasetRecords ***********' + DatasetRecords); 
           httpResponse Res =  KPI_DashboardService.m_createDashboards(DatasetRecords,dashboardName,strFloderId,datevalue,datevalueact,AllTheme);	
           system.debug('New debug ***********' + res.getBody()); 
         if(!Test.isRunningTest()){
             if(res.getStatus() == 'Created'){ 
             	DashboardSuccess = true;   
            	DashboardSales = false;
            	dashbocreatejson payTypes = new dashbocreatejson();
                String Datesetvalues = res.getBody();   
                if(Datesetvalues != null && Datesetvalues != ''){ 
                     payTypes = dashbocreatejson.parse(Datesetvalues);
                } 
                AnalyticsDashboardId = payTypes.Id;
                purchaseAndBuildDashboard('Purchase & Build',1);
             }
             else{
             	DashboardSuccess = false;
            	DashboardSales = true;
            	purchaseAndBuildDashboard('Failed',1);
             }		  
         }
         	DB_Template__c DatasetRec = new DB_Template__c();
        		DatasetRec.DB_Name__c = dashboardName;    
        		DatasetRec.Type__c = 'Actual/Target';
        	    if(DatasetRecords.size() > 0)
        		DatasetRec.Section_Name_1__c = DatasetRecords[0].Dataset_Name__c;
        		if(DatasetRecords.size()>1){
        		DatasetRec.Section_Name_2__c = DatasetRecords[1].Dataset_Name__c;
        		}
        	    insert 	DatasetRec;
        	   
                for(Dataset__c Datlist:DatasetRecords) {  					    
        			KPIs__c KPIs = new KPIs__c();					    	
        			KPIs.RowNumber__c = Datlist.RowNumber__c; 
        			KPIs.Dataset_Name__c = Datlist.Dataset_Name__c; 
        			KPIs.Dataset_Id__c = Datlist.Dataset_Id__c; 
        			KPIs.Dimension_Label__c = Datlist.Dimension_Name__c;  
        			KPIs.Date_Label__c = Datlist.Date_Label__c; 
        			KPIs.Measure_Label__c = Datlist.Measure_Name__c; 
        			KPIs.Filter_Logics__c = Datlist.FilterLogic__c;
        			KPIs.KPI_Name__c = DatList.KPI_Name__c;
        			KPIs.Filter_Name__c = Datlist.FilterName__c;
        			KPIs.User_Logic__c = Datlist.UserLogic__c;
        			KPIs.AliasMeasure_API__c = Datlist.AliasMeasure_API__c;
        			KPIs.CompactMeasure_API__c = Datlist.CompactMeasure_API__c; 
        			KPIs.Measure_API__c = Datlist.Measure_API__c; 
        			if(Datlist.Dimension_Api__c != null && Datlist.Dimension_Api__c != ''){
            			KPIs.Dimension_API_Name__c = Datlist.Dimension_Api__c; 
            			KPIs.Dimension_Name__c = Datlist.Dimension_Name__c; 
        			}
        			else{
        			    KPIs.Dimension_API_Name__c = Datlist.New_Dimension_API__c; 
            			KPIs.Dimension_Name__c = Datlist.New_Dimension_Name__c; 
        			}
        			
        			KPIs.Date_API__c = Datlist.Data_API__c;
        			KPIs.DB_Template__c = DatasetRec.Id;
        			KPIs.Snap_Date__c = datevalue;
        			KPIs.Filter_Code__c = datevalueact;
        			KPIs.Theme_Id__c = AllVal;
        			insert KPIs;
        		}
        		 NoAcccountbalance = false; 
             }
             else{
                 DashboardSuccess = false;
                    DashboardSales = false;
                    
                 purchaseAndBuildDashboard('Not Enough Credits',1);
                 NoAcccountbalance = true; 
             }
        }catch(Exception e){
            system.debug('New debug ***********' + e);
        }
   
}

public void SaveandCloseopp(){
       try{
        
        String dashboardName = System.currentPageReference().getParameters().get('hiddenDashboardName');
            saveAndCancelDashboard(1);
         	DB_Template__c DatasetRec = new DB_Template__c();
        		DatasetRec.DB_Name__c = dashboardName;    
        		DatasetRec.Type__c = 'Actual/Target';
        	    if(DatasetRecords.size() > 0)
        		DatasetRec.Section_Name_1__c = DatasetRecords[0].Dataset_Name__c;
        		if(DatasetRecords.size()>1){
        		DatasetRec.Section_Name_2__c = DatasetRecords[1].Dataset_Name__c;
        		}
        	    insert 	DatasetRec;
        	   
                for(Dataset__c Datlist:DatasetRecords) {  					    
        			KPIs__c KPIs = new KPIs__c();					    	
        			KPIs.RowNumber__c = Datlist.RowNumber__c; 
        			KPIs.Dataset_Name__c = Datlist.Dataset_Name__c; 
        			KPIs.Dataset_Id__c = Datlist.Dataset_Id__c;   
        			KPIs.Date_Label__c = Datlist.Date_Label__c; 
        			KPIs.Measure_Label__c = Datlist.Measure_Name__c; 
        			KPIs.Filter_Logics__c = Datlist.FilterLogic__c;
        			KPIs.KPI_Name__c = DatList.KPI_Name__c;
        			KPIs.Filter_Name__c = Datlist.FilterName__c;
        			KPIs.User_Logic__c = Datlist.UserLogic__c;
        			KPIs.AliasMeasure_API__c = Datlist.AliasMeasure_API__c;
        			KPIs.CompactMeasure_API__c = Datlist.CompactMeasure_API__c; 
        			KPIs.Measure_API__c = Datlist.Measure_API__c; 
        			if(Datlist.Dimension_Api__c != null && Datlist.Dimension_Api__c != ''){
            			KPIs.Dimension_API_Name__c = Datlist.Dimension_Api__c; 
            			KPIs.Dimension_Name__c = Datlist.Dimension_Name__c; 
        			}
        			else{
        			    KPIs.Dimension_API_Name__c = Datlist.New_Dimension_API__c; 
            			KPIs.Dimension_Name__c = Datlist.New_Dimension_Name__c; 
        			}
        			KPIs.Date_API__c = Datlist.Data_API__c;
        			KPIs.DB_Template__c = DatasetRec.Id;
        			KPIs.Snap_Date__c = datevalue;
        			KPIs.Filter_Code__c = datevalueact;
        			KPIs.Theme_Id__c = AllVal;
        			insert KPIs;
        		}
        }catch(Exception e){
            
        }
}
    
     public void MeasureMethod(){ 
        
            DimensionId = false;
            SetDimension = false;
            setDimensionValue= false;
            setDate = false;
            setMeasure = true;
            filterRend = false;
            
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
            	DatasetDimensionFromJson  DimensionTypes = new DatasetDimensionFromJson(); 
                if(KPIRec.dataset != Null || Test.isRunningTest()){
                    KPIRec.dataSetName = Mapvalues.get(KPIRec.dataset);
                     
                    string DimensionsReturnValue = Dimensions(KPIRec.dataset);
                    
                    if(DimensionsReturnValue != null &&DimensionsReturnValue != ''){ 
                        DimensionTypes = DatasetDimensionFromJson.parse(DimensionsReturnValue);
                    }
                    
                   
                }
                if(DimensionTypes.dimensions !=null){
			        for(DatasetDimensionFromJson.cls_dimensions Dim : DimensionTypes.dimensions){ 
			        	 DimensionLabel.put(Dim.label,Dim.Field);
			      } 
                }
               
            
	                                  
            }
        }
        catch(Exception e){
            
        }
    }
    
  
    public boolean DimensionId{get;set;}          
    public Set<String> DateFieldLists{get;set;}
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
    public  Map<String,String> DateFullField{get;set;}
    
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
        public map<String,String> EditDimMapping = new map<String,String>();
        public map<String,String> EditDateMapping = new map<String,String>();
        public map<String,String> EditMeasMapping{get;set;}
        public List<Selectoption> dataSetOptions{get;set;}
        public List<availableDimesionWrapper> availableDimesions{get;set;} 
        public List<selectedDimesionWrapper> selectedDimensions{get;set;}  
         public list<MeasureAngularclass> NewMeasurevarlist{get;set;}
        public set<String> NewString{get;set;} 
        public set<String> NewStringDate{get;set;}          
        public List<DateFieldWrapper> availableDateFields{get;set;}
        public List<SelectedDateFieldWrapper> SelectedDateFieldlist{get;set;}
        public set<String> selectedDateFields{get;set;}
        public List<MeasureWrapper> availableMeasures{get;set;}
        public set<String> selectedMeasures{get;set;}
        public boolean CountRender{get;set;}
      
        public list<String> FiltersSelected{get;set;}
        public List<Selectoption> dimensionOptions{get;set;}
        public integer FilterRowCount{get;set;}
        public String UserLogic{get;set;}
        
        
        public KPIClass(String KPIName, Integer KPIRownumber, List<Selectoption> dataSetOptions,boolean KPICheck){
            this.KPIName = KPIName;
            this.KPIRownumber = KPIRownumber;
            this.dataSetOptions = dataSetOptions;
            this.KPICheck = KPICheck;  
        }
        
    }  
    
  

    
    public boolean tableIds{get;set;}
    
    
    
    public void CloneFromPrevious(String Ids){  
    //	try{
    	SelectedrowValue = 1;
    	 Map<String,String> NewDim = new Map<String,String>();
    	 Map<String,String> NewDat = new Map<String,String>();
    	 Map<String,String> NewMeas = new Map<String,String>();
    	 
    	    Measureoneslist = new list<Measureclass>();
 Measureonestwolist = new list<Measureclass>();
 Measureonesthreelist = new list<Measureclass>(); 
    	    list<DB_Template__c> DBTemplates = [select Id from DB_Template__c where Id=: ids order By createddate desc];
    		if(DBTemplates.size()>0){
    			list<KPIs__c> KPIs = [select Dataset_Id__c,Dataset_Name__c,Date_Label__c,Snap_Date__c,Theme_Id__c,Dimension_Name__c,Dimension_API_Name__c,
    									 DB_Template__c,Dimension_Label__c,User_Logic__c,Filter_Code__c,
    									 Filter_Logic__c,Filter_Logics__c,Filter_Name__c,KPI_Name__c,Measure_Label__c,RowNumber__c,
    									 Dimension_API__c,Measure_API__c,Date_API__c,AliasMeasure_API__c,CompactMeasure_API__c
    									 from KPIs__c where  DB_Template__c =: DBTemplates[0].id order by RowNumber__c limit 5];
             KPIDetils = new List<KPIClass>();  
    		//ThemeValue = KPIs[0].Theme_Id__c;
    		integer KPIString;
    		for(KPIs__c KPI : KPIs){ 
    			if(KPI.RowNumber__c <=2){
    				KPIString = integer.valueof(KPI.RowNumber__c);
            		KPIDetils.add(new KPIClass(KPI.KPI_Name__c,integer.valueof(KPI.RowNumber__c),DatasetValuesList ,false));
    			}
    		}
                
                if(KPIDetils.size() > 0){
           for(KPIs__c KPI : KPIs){
    			if(KPI.RowNumber__c <=2){
    			for(KPIClass KPIRec : KPIDetils){ 
    			    if(integer.valueof(KPI.RowNumber__c) == 2 && KPIRec.KPIName != ''){
    			        datevalue =KPI.Snap_Date__c;
    			    }
    			    	if(KPI.RowNumber__c == 1){
                         SelectKPIId = KPI.Dataset_Id__c;
                         CurrentVersionId = versionLabel.get(KPI.Dataset_Id__c);
                    	CurrentVersionUrl = VersionUrl.get(KPI.Dataset_Id__c);
                    	}
                    	if(KPI.RowNumber__c == 2){ 
                    	    SelectKPIIdone = KPI.Dataset_Id__c;
                    	    CurrentVersionIdone = versionLabel.get(KPI.Dataset_Id__c);
                    	CurrentVersionUrlone = VersionUrl.get(KPI.Dataset_Id__c);
                    	}
    				if(integer.valueof(KPI.RowNumber__c) == KPIRec.KPIRownumber && KPIRec.KPIName != ''){
	            	KPIRec.dataSet = KPI.Dataset_Id__c;
	            	
	            	datevalueact =KPIs[0].Filter_Code__c;
	            	datevalue =KPIs[0].Snap_Date__c;
	            	DatasetDimensionFromJson  DimensionTypes = new DatasetDimensionFromJson(); 
						string DimensionsReturnValue = Dimensions(KPIRec.dataset);
						if(DimensionsReturnValue != null &&DimensionsReturnValue != ''){ 
							DimensionTypes = DatasetDimensionFromJson.parse(DimensionsReturnValue);
						}
	            if(KPI.Dimension_Label__c != null || KPI.Dimension_Name__c != Null){  
	            	if(DimensionTypes.dimensions !=null){
						for(DatasetDimensionFromJson.cls_dimensions Dim : DimensionTypes.dimensions){ 
							 DimensionLabel.put(Dim.label,Dim.Field);
							 NewDim.put(Dim.Field,Dim.label);
					  } 
					}
	            //	String[] Dimlist =  KPI.Dimension_Label__c.split(',');
	            	
	                String[] Dimlist;
    			    if(KPI.Dimension_Label__c != null){
    				    Dimlist = KPI.Dimension_Label__c.split(',');
    			    }
    			    else if(KPI.Dimension_Name__c != null){
    			        Dimlist = KPI.Dimension_Name__c.split(','); 
    			    }
	            	String[] DimAPI;
	            	if((KPI.Dimension_API__c != Null && KPI.Dimension_API__c != '') || (KPI.Dimension_API_Name__c != Null && KPI.Dimension_API_Name__c != ''))
	            		 
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
                       KPIRec.EditDimMapping.put(Avail,NewDim.get(DimAPI[i]));
                       i= i+1;
                       }
                    }
                    
                    
                    KPIRec.NewString = new set<String>();
                    for(selectedDimesionWrapper KPIdim : KPIRec.SelectedDimensions){
                    	KPIRec.NewString.add(KPIdim.availablename);
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
                        KPIRec.EditDateMapping.put(Avail,NewDat.get(DatAPI[i]));
                        
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
	            	String[] Filterlog;
	            	
	            	if(KPI.Measure_API__c !=NUll)
	            	MeasureAPI =  KPI.Measure_API__c.split(',');
	            	
	            	if(KPI.Filter_Logics__c !=NUll)
	            	Filterlog =  KPI.Filter_Logics__c.split(';');
            	     KPIRec.EditMeasMapping = new map<String,String>();
            	 
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
                       System.debug('NewMeasurevarlist '+Newvallist);
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
                       	System.debug('NewMeasurevarlist '+Newvallist+NewMeasFiled);
                       	KPIRec.EditMeasMapping.put(Avail,MeasFiled);
                       	String[] fflist;
                       	String[] fflist1;
                       	String[] fflist2;
                       	if(Filterlog != Null){
                        integer Newm = 1;
                           	for(string ff:Filterlog){
                           	    if(Newm == 1)
                           	     fflist = ff.split(',');
                           	     if(Newm == 2)
                           	     fflist1 = ff.split(',');
                           	     if(Newm == 3)
                           	     fflist2 = ff.split(',');
                           	     Newm = Newm + 1;
                           	}
                       	}
                       	else{
                       	    
                       	}
                       	
                       	if(KPI.RowNumber__c == 1){
                       	if(k == 0){
                           	Measureoneslist.add(new Measureclass('sum1'+Newvallist+NewMeasFiled.replace(' ',''),integer.valueof(fflist[0])));
                       	    Measureonestwolist.add(new Measureclass('max1'+Newvallist+NewMeasFiled.replace(' ',''),integer.valueof(fflist[1])));
                       	    Measureonesthreelist.add(new Measureclass('min1'+Newvallist+NewMeasFiled.replace(' ',''),integer.valueof(fflist[2])));
                        }
                        	if(k == 1){
                           	Measureoneslist.add(new Measureclass('sum1'+Newvallist+NewMeasFiled.replace(' ',''),integer.valueof(fflist1[0])));
                       	    Measureonestwolist.add(new Measureclass('max1'+Newvallist+NewMeasFiled.replace(' ',''),integer.valueof(fflist1[1])));
                       	    Measureonesthreelist.add(new Measureclass('min1'+Newvallist+NewMeasFiled.replace(' ',''),integer.valueof(fflist1[2])));
                        }
                        	if(k == 2){
                           	Measureoneslist.add(new Measureclass('sum1'+Newvallist+NewMeasFiled.replace(' ',''),integer.valueof(fflist2[0])));
                       	    Measureonestwolist.add(new Measureclass('max1'+Newvallist+NewMeasFiled.replace(' ',''),integer.valueof(fflist2[1])));
                       	    Measureonesthreelist.add(new Measureclass('min1'+Newvallist+NewMeasFiled.replace(' ',''),integer.valueof(fflist2[2])));
                        }
                       	}
                       	
                       	if(Filterlog != Null){
                       	 KPIRec.NewMeasurevarlist.add(new MeasureAngularclass(Availms,Availlist[0].replace(' ','').replace(']',''),NewMeasFiled,Availms,Newvallist+NewMeasFiled.replace(' ',''),Filterlog[k]));
                       	}
                       	else{
                       	    KPIRec.NewMeasurevarlist.add(new MeasureAngularclass(Availms,Availlist[0].replace(' ','').replace(']',''),NewMeasFiled,Availms,Newvallist+NewMeasFiled.replace(' ',''),''));
                       	}
                       	    
                       	}
                       
                       
                       k=k+1;
                    }
                    KPIRec.MeasureSize = KPIRec.selectedMeasures.size();
                }
                
                
                }
                
    			}
    			}
    			 Dataset__c Dt = new Dataset__c();						    	
    				Dt.RowNumber__c = KPI.RowNumber__c; 
    				Dt.Dataset_Name__c = KPI.Dataset_Name__c; 
    				Dt.Dataset_Id__c = KPI.Dataset_Id__c; 
    				if(KPI.Dimension_Label__c != null && KPI.Dimension_Label__c != ''){
    				    Dt.New_Dimension_Name__c = KPI.Dimension_Label__c; 
    				}
    				else{
    				    Dt.New_Dimension_Name__c = KPI.Dimension_Name__c; 
    				}
    				Dt.Date_Label__c = KPI.Date_Label__c; 
    				Dt.Measure_Name__c = KPI.Measure_Label__c; 
    			
    				Dt.KPI_Name__c = KPI.KPI_Name__c;
    				Dt.UserLogic__c = KPI.User_Logic__c;
    				Dt.AliasMeasure_API__c = KPI.AliasMeasure_API__c;
    				Dt.CompactMeasure_API__c = KPI.CompactMeasure_API__c; 
    				Dt.Measure_API__c = KPI.Measure_API__c; 
    				if(KPI.Dimension_Api__c != null && KPI.Dimension_Api__c != ''){
    				    Dt.New_Dimension_API__c = KPI.Dimension_Api__c; 
    				}
    				else{
    				    Dt.New_Dimension_API__c = KPI.Dimension_API_Name__c;
    				}
    				Dt.Data_API__c = KPI.Date_API__c; 
    				Dt.Session_Id__c = SessionId;
    				Dt.FilterLogic__c = KPI.Filter_Logics__c;
    				DatasetRecords.add(Dt);
    			}
    			      
                }
                else{
                    KPIDetils.add(new KPIClass('KPI 1', 1,DatasetValuesList ,false));
                     KPIDetils.add(new KPIClass('KPI 2', 2,DatasetValuesList ,false));
                }
    		}
    	
    //	}catch(Exception e){
    		
    //	}
    }
     public void Cancelvalues(){
         String values = apexpages.currentpage().getparameters().get('SelectedButtonValues');
    }
    
    
    public void Save(){
    	  String values = apexpages.currentpage().getparameters().get('hiddenSingleName');
                if(DatasetRecords.size()>0){
                DB_Template__c DatasetRec = new DB_Template__c();
        		DatasetRec.DB_Name__c = values;    
        		DatasetRec.Type__c = 'Actual/Target';
        		
        		DatasetRec.Section_Name_1__c = DatasetRecords[0].Dataset_Name__c;
        		if(DatasetRecords.size()>1){
        		DatasetRec.Section_Name_2__c = DatasetRecords[1].Dataset_Name__c;
        		}
        	    insert 	DatasetRec;
                for(Dataset__c Datlist:DatasetRecords) {					    
        			KPIs__c KPIs = new KPIs__c();					    	
        			KPIs.RowNumber__c = Datlist.RowNumber__c; 
        			KPIs.Dataset_Name__c = Datlist.Dataset_Name__c; 
        			KPIs.Dataset_Id__c = Datlist.Dataset_Id__c; 
        			KPIs.Dimension_Name__c = Datlist.Dimension_Name__c;  
        			KPIs.Date_Label__c = Datlist.Date_Label__c; 
        			KPIs.Measure_Label__c = Datlist.Measure_Name__c; 
        			KPIs.Filter_Logics__c = Datlist.FilterLogic__c;
        			KPIs.KPI_Name__c = DatList.KPI_Name__c;
        			KPIs.Filter_Name__c = Datlist.FilterName__c;
        			KPIs.User_Logic__c = Datlist.UserLogic__c;
        			KPIs.AliasMeasure_API__c = Datlist.AliasMeasure_API__c;
        			KPIs.CompactMeasure_API__c = Datlist.CompactMeasure_API__c; 
        			KPIs.Measure_API__c = Datlist.Measure_API__c; 
        			KPIs.Dimension_API_Name__c = Datlist.Dimension_Api__c; 
        			KPIs.Date_API__c = Datlist.Data_API__c;
        			KPIs.DB_Template__c = DatasetRec.Id;
        			KPIs.Snap_Date__c = datevalue;
        			KPIs.Filter_Code__c = datevalueact;
        			KPIs.Theme_Id__c = ThemeValue;
        			insert KPIs;
        		}
        		
        			Apexpages.addMessage( new ApexPages.Message (ApexPages.Severity.CONFIRM, 'Configuration Created Successfully'));
              
            }  
    
    }
    
   

    public class MeasureAngularclass{
         public String Measurename{get;set;}   
        public String Measurevar{get;set;}
        public String Measureval{get;set;}
        public String EditMeasval{get;set;}
         public String EditApi{get;set;}
         public String Numbervalues{get;set;}
         public MeasureAngularclass(String Measurename,String Measurevar,String Measureval,String EditMeasval,String EditApi,String Numbervalues){
              this.Measurename = Measurename;
                this.Measurevar = Measurevar;
                this.Measureval = Measureval;
                this.EditMeasval = EditMeasval;
                this.EditApi = EditApi;
                this.Numbervalues = Numbervalues;
         }
    }  
    
     public class Measureclass{
         public String EditApi{get;set;}   
        public integer Measurevar{get;set;}
       
         public Measureclass(String EditApi,integer Measurevar){
              this.EditApi = EditApi;
                this.Measurevar = Measurevar;
               
         }
    }   
    
    public void ActualTargetTheme(){
        if(AllVal != null){
            Dashboard_Backup_AC  DBUp = new Dashboard_Backup_AC();
            DBUp.NewDashboardsSingle(Allval);
        }
    }
    
      public string serverURL {get;set;}
    public string accountRecId {get;set;}
    public string contactRecId {get;set;}
    public string opportunityRecId {get;set;}
    public string opportunityLineItemRecId {get;set;}
    public string recordTypeId {get;set;}
    public string priceBookId {get;set;}
    
    
    public string selectedDashboard {get;set;}
    public boolean displayConnectButtons {get;set;}
    
    public integer accountBalance {get;set;}
    public integer BuildCost {get;set;}
    public string CouponCode {get;set;}
    public string CouponCodeId {get;set;}
    public integer CouponValue {get;set;}
    public integer TotalCost {get;set;}
    public integer CreditsRemaining {get;set;}
    
    public boolean isConnect{get;set;}
    public boolean isCheckAccount{get;set;}
    public boolean isCheckContact{get;set;}
    
    public map<String, Integer> buildCostMap = new map<String, Integer>();
    
   // public builKPIjoeytest(){
       
   // }
    
    
    public void booleanConnections(){
        isConnect = false;
        isCheckAccount = false; 
        isCheckContact = false;
    }
    public void buildSelected(){
        
        try{
            selectedDashboard = System.currentPageReference().getParameters().get('getProductName');
            system.debug('selectedDashboard *************'+ selectedDashboard);
            if(selectedDashboard != 'Select'){
                if(buildCostMap.get(selectedDashboard) != null){
                    getBulidCost();
                }
                if(CouponValue != null && CouponValue != 0){
                    TotalCost = BuildCost - CouponValue;
                }
                else{
                    TotalCost = BuildCost;
                }
                CreditsRemaining = accountBalance - TotalCost;
            }
            else{
                BuildCost = null;
                CouponValue = null;
                TotalCost = null;
                CreditsRemaining = null;
            }
        }
        catch(Exception exp){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, '' + exp.getmessage());
            ApexPages.addMessage(myMsg);
        }
    }
    
    public void getCouponInformation(){
        try{
            if(CouponCode != null && CouponCode != '' && selectedDashboard != null && selectedDashboard != ''){
                String query = 'select Id,Discount__c from Coupon__c where Name = \''+ CouponCode + '\' and ((Product__c = \''+ selectedDashboard + '\') OR (Any_Product__c = true)) and Active__c = true';
                SFDCApiUtil.couponResponseClass verifyCoupon = SFDCApiUtil.getCouponInformation(sessionId, serverURL, query);
                 CouponCodeId = verifyCoupon.couponId;
                if(verifyCoupon.response){
                    if(verifyCoupon.discount != null){
                        CouponValue = (BuildCost * verifyCoupon.discount) / 100;
                        TotalCost = BuildCost - CouponValue;
                        CreditsRemaining = accountBalance - TotalCost;
                    }
                }
                else{
                    CouponCodeId = '';
                    TotalCost = BuildCost;
                    CreditsRemaining = accountBalance - TotalCost;
                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, '' + verifyCoupon.responsemessage);
                    ApexPages.addMessage(myMsg);
                }
                
            }
        }
        catch(Exception exp){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, '' + exp.getmessage());
            ApexPages.addMessage(myMsg);
        }
    }
    
    public void getBulidCost(){
        try{
            if(selectedDashboard != null && selectedDashboard != ''){
                String query = 'select Id,UnitPrice from PricebookEntry where  Product2Id = \''+ selectedDashboard + '\' and IsActive = true limit 1';
                SFDCApiUtil.buildResponseClass verifyBuild = SFDCApiUtil.getBuildCostformation(sessionId, serverURL, query);
                if(verifyBuild.response){
                        //String RemoveId = System.currentPageReference().getParameters().get('SalesNumbersval');
                    if(verifyBuild.listPrice != null){
                        BuildCost = integer.valueOf(verifyBuild.listPrice);
                    }
                    if(verifyBuild.priceBookId != null){
                        priceBookId = verifyBuild.pricebookId;
                    }
                   
                    // ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Pricebook Id ' + verifyBuild.pricebookId + 'BuildCost '+ BuildCost);
                    // ApexPages.addMessage(myMsg);

                }
                else{

                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'PriceBook Error' + verifyBuild.responsemessage);
                    ApexPages.addMessage(myMsg);
                }
            }
        }
        catch(Exception exp){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, '' + exp.getmessage());
            ApexPages.addMessage(myMsg);
        }
    }    
    
    public void connectToSFDC(){
        SFDCApiUtil.connectResponseClass connectResponse = SFDCApiUtil.connectToSFDC();
        if(connectResponse.response){
            sessionId = connectResponse.sessionId;
            serverURL = connectResponse.responseServerUrl;
            system.debug('connectResponse.responsemessage success ********'+connectResponse);
            // ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, '' + connectResponse);
            // ApexPages.addMessage(myMsg);
            booleanConnections();
            isCheckAccount = true;
        }
        else{
            system.debug('connectResponse.responsemessage ********'+connectResponse.responsemessage);
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, '' + connectResponse.responsemessage);
            ApexPages.addMessage(myMsg);
            booleanConnections();
        }
    }
    
      public void verifyAccountDetails(){
        org = [select Id, Name, Phone, Fax, Street, City, State, Country, PostalCode from Organization where Id = :UserInfo.getOrganizationId()];
        String query = 'select Id,Name from Account where org_Id__c = \''+ userinfo.getOrganizationId() + '\'';
        SFDCApiUtil.verifyResponseClass verifyAccount = SFDCApiUtil.verifyDetails(sessionId, serverURL, query);
        if(verifyAccount.response){
            if(verifyAccount.hasDetails){
                accountRecId = verifyAccount.recordId;
                //  ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Account ' + accountRecId);
                //  ApexPages.addMessage(myMsg);
                booleanConnections();
                isCheckContact = true;
            }
             else{
                
                query = 'select Id,Name from Account where org_Id__c = \''+ userinfo.getuserId() + '\'';
                SFDCApiUtil.verifyResponseClass verifyAccounts = SFDCApiUtil.verifyDetails(sessionId, serverURL, query);
                if(verifyAccounts.response){
                    if(verifyAccounts.hasDetails){
                        accountRecId = verifyAccounts.recordId;
                        //  ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Account ' + accountRecId);
                        //  ApexPages.addMessage(myMsg);
                        booleanConnections();
                        isCheckContact = true;
                    }
                    else{
                
                    Map<String, String> recordDetails = new Map<String, String>();
                    recordDetails.put('Name', UserInfo.getOrganizationName());
                    recordDetails.put('org_Id__c', UserInfo.getOrganizationId());
                    if(org.Phone != null && org.Phone != ''){
                        recordDetails.put('Phone', org.Phone);
                    }
                    if(org.Fax != null && org.Fax != ''){
                    recordDetails.put('Fax', org.Fax);
                    }
                    if(org.Street != null && org.Street != ''){
                    recordDetails.put('BillingStreet', org.Street);
                    }
                    if(org.City != null && org.City != ''){
                    recordDetails.put('BillingCity', org.City);
                    }
                    if(org.State != null && org.State != ''){
                    recordDetails.put('BillingState', org.State);
                    }
                    if(org.Country != null && org.Country != ''){
                    recordDetails.put('BillingCountry', org.Country);
                    }
                    if(org.PostalCode != null && org.PostalCode != ''){
                    recordDetails.put('BillingPostalCode', org.PostalCode);
                    }
                    SFDCApiUtil.createResponseClass createAccount = SFDCApiUtil.createDetails(sessionId, serverURL,
                                                                                                'Account', recordDetails);
                    if(createAccount.response){
                        accountRecId = createAccount.recordId;
                        // ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Account ' + createAccount.recordId);
                        // ApexPages.addMessage(myMsg);
                        booleanConnections();
                        isCheckContact = true;
                    }
                    else{
                        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Account ' + createAccount.responsemessage);
                        ApexPages.addMessage(myMsg);
                        booleanConnections();
                    }
                }
                }
            }
        }
        else{
            // ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Account ' + verifyAccount.responsemessage);
            // ApexPages.addMessage(myMsg);
            booleanConnections();
        }
    }
    
    public void verifyContactDetails(){
        userData = [select Id, Name, Email, Title, Phone, MobilePhone, Fax, Street, City, State, Country, PostalCode from User where Id = :userinfo.getuserId()];
        String query = 'select Id,Credit_Amount__c,Debit_Amount__c from Contact where User_Id__c = \''+ userinfo.getuserId() + '\'';
        SFDCApiUtil.verifyResponseClass verifyContact = SFDCApiUtil.verifyDetails(sessionId, serverURL, query);
        if(verifyContact.response){
            if(verifyContact.hasDetails){
                displayConnectButtons = false;
                contactRecId = verifyContact.recordId;
                if(verifyContact.creditAmount == null){
                   verifyContact.creditAmount = 0; 
                }
                if(verifyContact.debitAmount == null){
                    verifyContact.debitAmount = 0;
                }
                
                accountBalance = verifyContact.creditAmount - verifyContact.debitAmount;
                // ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'ContactNew ' + contactRecId);
                // ApexPages.addMessage(myMsg);
                booleanConnections();
            }
            else{
                Map<String, String> recordDetails = new Map<String, String>();
                recordDetails.put('FirstName', UserInfo.getFirstName());
                recordDetails.put('LastName', UserInfo.getLastName());
                recordDetails.put('User_Id__c', userinfo.getuserId());
                
                recordDetails.put('AccountId', accountRecId);
                if(userData.Email != null && userData.Email != ''){
                recordDetails.put('Email__c', userData.Email);
                }
                if(userData.Title != null && userData.Title != ''){
                recordDetails.put('Title', userData.Title);
                }
                if(userData.Phone != null && userData.Phone != ''){
                recordDetails.put('Phone', userData.Phone);
                }
                if(userData.MobilePhone != null && userData.MobilePhone != ''){
                recordDetails.put('MobilePhone', userData.MobilePhone);
                }
                if(userData.Fax != null && userData.Fax != ''){
                recordDetails.put('Fax', userData.Fax);
                }
                if(userData.Street != null && userData.Street != ''){
                recordDetails.put('MailingStreet', userData.Street);
                }
                if(userData.City != null && userData.City != ''){
                recordDetails.put('MailingCity', userData.City);
                }
                if(userData.State != null && userData.State != ''){
                recordDetails.put('MailingState', userData.State);
                }
                if(userData.Country != null && userData.Country != ''){
                recordDetails.put('MailingCountry', userData.Country);
                }
                if(userData.PostalCode != null && userData.PostalCode != ''){
                recordDetails.put('MailingPostalCode', userData.PostalCode);
                }
                system.debug('the map values are' + recordDetails);
                SFDCApiUtil.createResponseClass createContact = SFDCApiUtil.createDetails(sessionId, serverURL,'Contact', recordDetails);
                if(createContact.response){
                    contactRecId = createContact.recordId;
                      system.debug('ContactOld' + contactRecId);
                    displayConnectButtons = false;
                    // ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'ContactOld ' + createContact.recordId);
                    // ApexPages.addMessage(myMsg);
                    booleanConnections();
                    
                    
                    
                  //  String querys = 'select Id,Credit_Amount__c,Debit_Amount__c from Contact where id = \''+ contactRecId + '\'';
                    SFDCApiUtil.verifyResponseClass reverifyContact = SFDCApiUtil.verifyDetails(sessionId, serverURL, query);
                    if(reverifyContact.response){
                        if(reverifyContact.hasDetails){
                            contactRecId = reverifyContact.recordId;
                            system.debug('the map values are contactRecId' + contactRecId);
                            
                            accountBalance = reverifyContact.creditAmount - reverifyContact.debitAmount;
                            
                            if(accountBalance == null){
                                accountBalance = 0;
                            }
                        }
                    }
                }
                else{
                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Contact ' + createContact.responsemessage);
                    ApexPages.addMessage(myMsg);
                    booleanConnections();
                }
            }
        }
        else{
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Contact ' + verifyContact.creditAmount + ' Debit '+verifyContact.debitAmount);
            ApexPages.addMessage(myMsg);
            booleanConnections();
        }
    }
    
    
    public string OpportunityStage{get;set;}
    public pageReference saveAndCancelDashboard(integer Allsets){
        String recordTypeName = 'ISV App Debit';
        String query = 'select id from recordType where name = \''+ recordTypeName + '\'';
        SFDCApiUtil.verifyResponseClass verifyRecordType = SFDCApiUtil.verifyDetails(sessionId, serverURL, query);
        if(verifyRecordType.response){
            if(verifyRecordType.hasDetails){
                recordTypeId = verifyRecordType.recordId;
                // ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'recordType ' + recordTypeId);
                // ApexPages.addMessage(myMsg);
                OpportunityStage = 'Save & Cancel';
                saveOpportunity(Allsets);
                
            }

        }
        else{
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'RecordType ' + verifyRecordType.responsemessage);
            ApexPages.addMessage(myMsg);
            return null;
        }
        return null;
    }    
    
    public boolean NoAcccountbalance{get;set;}
    public void purchaseAndBuildDashboard(String FiledValue,integer Allsets){
        // system.debug(accountBalance + ' *************  '+ TotalCost);
        // if(accountBalance >= TotalCost){  
        String recordTypeName = 'ISV App Debit';
        String query = 'select id from recordType where name = \''+ recordTypeName + '\'';
        SFDCApiUtil.verifyResponseClass verifyRecordType = SFDCApiUtil.verifyDetails(sessionId, serverURL, query);
        if(verifyRecordType.response){
            if(verifyRecordType.hasDetails){
                recordTypeId = verifyRecordType.recordId;
                // ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'recordType ' + recordTypeId);
                // ApexPages.addMessage(myMsg);
                OpportunityStage = FiledValue;
                saveOpportunity(Allsets);
                
            }

        }
        else{
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'RecordType ' + verifyRecordType.responsemessage);
            ApexPages.addMessage(myMsg);
            
        }
        //  NoAcccountbalance = false;
         
        // }
        // else{
        //   NoAcccountbalance = true;
           
        // }
        
    }    
    
    public void saveOpportunity(integer AllSets){
        Map<String, String> recordDetails = new Map<String, String>();
        recordDetails.put('Name', UserInfo.getOrganizationName());
        recordDetails.put('AccountId', accountRecId);
        recordDetails.put('Primary_Contact__c', contactRecId);
        recordDetails.put('StageName', OpportunityStage);
        recordDetails.put('recordTypeId', recordTypeId);
        recordDetails.put('CloseDate', string.valueOf(date.today()));
        SFDCApiUtil.createResponseClass createOpportunity = SFDCApiUtil.createOpportunity(sessionId, serverURL,'Opportunity', recordDetails);
                if(createOpportunity.response){
                    opportunityRecId = createOpportunity.recordId;
                    saveOpportunityLineItem(AllSets);
                    //  ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Opportunity  Record Id' + createOpportunity.recordId);
                    // ApexPages.addMessage(myMsg);
                    
                   
                }
                else{
                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Opportunity ' + createOpportunity.responsemessage);
                    ApexPages.addMessage(myMsg);
                    
                }
               
    }
    public void saveOpportunityLineItem(integer AllSets){
        Map<String, String> recordDetails = new Map<String, String>();
        recordDetails.put('OpportunityId', opportunityRecId);
        recordDetails.put('Quantity', string.valueOf(AllSets));
        recordDetails.put('PriceBookEntryId',priceBookId);
        // recordDetails.put('Product2Id',selectedDashboard);
        recordDetails.put('Unitprice',string.valueOf(BuildCost/AllSets));
        if(CouponCodeId != '' && CouponCodeId != null){
            recordDetails.put('Coupon__c',CouponCodeId);
        }
  
        system.debug('opportunityRecId '+ opportunityRecId + 'PriceBookEntryId '+ priceBookId + ' Product2Id '+ selectedDashboard + ' BuildCost '+ string.valueOf(BuildCost));
        SFDCApiUtil.createResponseClass createOpportunityLineItem = SFDCApiUtil.createOpportunityLineItem(sessionId, serverURL,'OpportunityLineItem', recordDetails);
                system.debug('createOpportunityLineItem ****' + createOpportunityLineItem.response);
                if(createOpportunityLineItem.response){
                    opportunityLineItemRecId = createOpportunityLineItem.recordId;
                    displayConnectButtons = false;
                    // ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'OpportunityLineItem Record Id' + createOpportunityLineItem.recordId);
                    // ApexPages.addMessage(myMsg);
                    

                }
                else{
                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, ' OpportunityLineItem  ' + createOpportunityLineItem.responsemessage);
                    ApexPages.addMessage(myMsg);
                    
                }
            
    }
    public void ConnectSfdc(){
        isConnect = true;
        DashboardSuccess = false;
        DashboardSales = false;
        //Newvaluesboll = false;
        if(CouponCode == null || CouponCode == ''){
            Couponvalue = 0;
        }
    }
    
    // public void ConnectSfdcclone(){
    //     isConnect = true;
    //     //Newvaluesboll = true;
    //     if(CouponCode == null || CouponCode == ''){
    //         Couponvalue = 0;
    //     }
        
    // }
    
    public void Goback(){
        NoAcccountbalance = false;
    }
     public void Cancelclose(){
        purchaseAndBuildDashboard('Cancel',1);
    }
        public boolean NewDBSva{get;set;}
        public void ErrorMethod(){
            NewDBSva = false;
        for(KPIClass KPI : KPIDetils){
            if(KPI.selectedDimensions != null && KPI.selectedMeasures != NUll){
			 			 
			}
			else{
			    NewDBSva = true;
			}
			
		}
    }
}