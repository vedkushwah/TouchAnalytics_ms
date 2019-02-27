public class Dashboard_Backup_AC {

    public void NewDashboardsSingle(String Allval) {
        list<Sales_Insight__c> NewSales = [select id, Dashboard_Id__c, Dashboard_Type__c, DataSet_Delete__c, Sales_insight_String5__c, Delete_All_Group__c, Delete_All_Orders__c, Sales_KPI_Delete__c, Number_Delete1__c, ListSelector__c, Lis_Selector36__c, Sales_insight_Day_Delete__c, Sales_Insight_String2__c, Delete_All_Lists__c, Sales_Insight_String3__c, Delete_List_Selector__c, Sales_Insight_Delete2__c, List_Selector6__c, Grouping_label_Delete__c, Delete_All_Group5__c, Grouping_Delete__c, Delete_All_Timeline1__c, Number_Delete2__c, Sales_Insight_Delete3__c, Container_Delete2__c, Grouping_Selectors__c, Delete_All_Timeline2__c, Date_label_Delete__c, Delete_All_Timeline3__c, Number_Delete3__c, Number_Delete4__c, Chart_Delete14__c, Date_Selector__c, Delete_All_Timeline4__c, Delete_All_dateselector1__c, Sales_Date_Delete__c, Delete_pillbox__c, Delete_All_dateselectors__c, Dates_Delete__c, Delete_All_Timeline__c, Delete_All_Dates__c, Sales_Insight_Measure_Delete__c, Delete_All_Measures__c, Chart_Delete2__c, Chart_Delete24__c, Measure_List_Selector__c, Measures_Delete__c, Delete_All_Texts__c, Sales_Insight_Filter_Delete__c, Delete_All_Static_KPIs__c, Delete_All_Chart4__c, Container1__c, Container2__c, Container3__c, number_33__c, number_34__c, Sales_KPI_1__c, Sales_KPI_2__c, Sales_KPI_3__c, Sales_KPI_4__c, Sales_KPI_5__c, Sales_Chart_1__c, Sales_Chart_2__c, Sales_Chart_3__c, Sales_Chart_4__c, Sales_Chart_5__c, Container__c, Container_Delete__c, Container_Delete1__c, Delete_All_Chart__c, Delete_All_Chart1__c, Delete_All_Chart2__c, Delete_All_Chart3__c, List_Selector__c, Pillbox__c, Date_Selector_Delete__c, Chart_Delete__c, Text_Delete__c, Chart_Delete1__c, Test1__c, Test2__c, Test3__c, Test4__c, Test5__c, Test6__c, Test7__c, Test8__c, Test9__c, Test10__c, Test11__c, Test12__c, Test13__c, Test14__c, Test15__c, Test16__c, Sales_Insight_String4__c, Delete_List_Selector43__c, List_Selector43__c, Delete_List_Selector53__c, View_Results__c, View_Results_Text__c, List_Selector53__c, Sales_KPI_Headers__c, Sales_Header_text__c, Sales_insight_String1__c from Sales_Insight__c where id = :Allval limit 1];
        String Str = userInfo.getSessionId();

        if (NewSales.size() > 0) {
            HttpResponse hRes = SingleKPI_DashboardService.retriveDashboardFile(NewSales[0].Dashboard_Id__c, Str);
            String responseBody;
            if (!Test.isRunningTest()) {
                responseBody = hRes.getBody();
            } else {
                responseBody = NewSales[0].Sales_insight_String1__c + NewSales[0].Sales_insight_String2__c + NewSales[0].Sales_insight_String3__c;
            }
            System.debug('responseBody *********** ' + responseBody);
            String objNewDesc = '', objNewDesc1 = '', objNewDesc2 = '', objNewDesc3 = '', objNewDesc4 = '', objKPINewDesc1 = '', objKPINewDesc2 = '', objKPINewDesc3 = '', objKPINewDesc4 = '';
            String FilobjKPINewDesc1 = '', FilobjKPINewDesc2 = '', FilobjKPINewDesc3 = '', FilobjKPINewDesc4 = '', FilobjKPINewDesc5 = '', FilobjKPINewDesc6 = '', FilobjKPINewDesc7 = '';
            String ChartFilobjKPINewDesc1 = '', ChartFilobjKPINewDesc2 = '', ChartFilobjKPINewDesc3 = '', ChartFilobjKPINewDesc4 = '';
            String ChartFilobjKPINewDesc5 = '', ChartFilobjKPINewDesc6 = '', ChartFilobjKPINewDesc7 = '', ChartFilobjKPINewDesc8 = '';
            String FilobjKPINewDescMeas = '', FilobjKPINewDescSort = '';
            string TextFilobjAct1 = '', TextFilobjAct2 = '', TextFilobjAct3 = '', TextFilobjAct4 = '';
            string Newstrsnaptxt1 = '', Newstrsnaptxt2 = '', Newstrsnaptxt3 = '', Newstrsnaptxt4 = '', Newstrsnaptxt5 = '', Newstrsnaptxt6 = '', Newstrsnaptxt7 = '', Newstrsnaptxt8 = '', Newstrsnaptxt9 = '', Newstrsnaptxt10 = '', Newstrsnaptxt11 = '';
            String NewDesc = '', NewDesc1 = '', NewDesc2 = '', NewDesc3 = '', NewDesc4 = '';
            String KPINewDesc1 = '', KPINewDesc2 = '', KPINewDesc3 = '', KPINewDesc4 = '';
            String FilNewDesc1 = '', FilNewDesc2 = '', FilNewDesc3 = '', FilNewDesc4 = '', FilNewDesc5 = '', FilNewDesc6 = '', FilNewDesc7 = '';
            String ActNewDesc = '', ActNewDesc1 = '', ActNewDesc2 = '';
            String snapNewDesc = '', snapNewDesc1 = '', snapNewDesc2 = '', snapNewDesc3 = '', snapNewDesc4 = '', snapKPINewDesc1 = '';
            String ChartFilNewDesc1 = '', ChartFilNewDesc2 = '', ChartFilNewDesc3 = '', ChartFilNewDesc4 = '', ChartFilNewDesc5 = '';
            String ChartFilNewDesc6 = '', ChartFilNewDesc7 = '', ChartFilNewDesc8 = '';
            String FilNewDescMeas = '', FilNewDescSort = '';
            String NewDBS = '';
            string strsnaptxt1 = '', strsnaptxt2 = '', strsnaptxt3 = '', strsnaptxt4 = '', strsnaptxt5 = '', strsnaptxt6 = '', strsnaptxt7 = '', strsnaptxt8 = '', strsnaptxt9 = '', strsnaptxt10 = '', strsnaptxt11 = '';
            string Actualtext1 = '', Actualtext2 = '', Actualtext3 = '', Actualtext4 = '';
            if (hRes.getStatus() == 'OK' || Test.isRunningtest()) {
                String[] responseBodylist = responseBody.split('"layouts":');

                // String NewDesc='',NewDesc1='',NewDesc2='',NewDesc3='',NewDesc4='' ;
                // String KPINewDesc1='',KPINewDesc2='',KPINewDesc3='',KPINewDesc4='';
                // String FilNewDesc1='',FilNewDesc2='',FilNewDesc3='',FilNewDesc4='',FilNewDesc5='',FilNewDesc6='',FilNewDesc7='';
                // String ActNewDesc='',ActNewDesc1='',ActNewDesc2='';
                // String snapNewDesc='',snapNewDesc1='',snapNewDesc2='',snapNewDesc3='',snapNewDesc4='',snapKPINewDesc1='';
                // String ChartFilNewDesc1 = '',ChartFilNewDesc2 = '',ChartFilNewDesc3 = '',ChartFilNewDesc4 = '',ChartFilNewDesc5 = '';
                // String ChartFilNewDesc6 = '',ChartFilNewDesc7 = '',ChartFilNewDesc8 = '';
                // String FilNewDescMeas= '',FilNewDescSort = '';
                // String NewDBS = '';
                // string strsnaptxt1 = '',strsnaptxt2 = '',strsnaptxt3 = '',strsnaptxt4 = '',strsnaptxt5 = '',strsnaptxt6 = '',strsnaptxt7 = '',strsnaptxt8 = '',strsnaptxt9 = '',strsnaptxt10 = '',strsnaptxt11 = '';
                // string Actualtext1 = '',Actualtext2 = '',Actualtext3 = '',Actualtext4 = '';
                if (NewSales[0].Dashboard_Type__c == 'Insights') {
                    String[] responses = responseBody.split('"Description_Container":');
                    if (responses.size() > 1) {
                        String[] NewDescllist = responses[1].split('"type":"container"');
                        NewDesc = '"Description_Container":' + NewDescllist[0] + '"type": "container" },';
                    }

                    String[] responses1 = responseBody.split('"Filters_Container":');
                    if (responses1.size() > 1) {
                        String[] NewDescllist1 = responses1[1].split('"type":"container"');
                        NewDesc1 = '"Filters_Container":' + NewDescllist1[0] + '"type": "container" },';
                    }

                    String[] responses2 = responseBody.split('"Header_Container":');
                    if (responses2.size() > 1) {
                        String[] NewDescllist2 = responses2[1].split('"type":"container"');
                        NewDesc2 = '"Header_Container":' + NewDescllist2[0] + '"type": "container" },';
                    }

                    String[] responses3 = responseBody.split('"Chart_Container":');
                    if (responses3.size() > 1) {
                        String[] NewDescllist3 = responses3[1].split('"type":"container"');
                        NewDesc3 = '"Chart_Container":' + NewDescllist3[0] + '"type": "container" },';
                    }

                    String[] responses4 = responseBody.split('"Groupings_Container":');
                    if (responses4.size() > 1) {
                        String[] NewDescllist4 = responses4[1].split('"type":"container"');
                        NewDesc4 = '"Groupings_Container":' + NewDescllist4[0] + '"type": "container" },';
                    }

                    String[] KPIresponses1 = responseBody.split('"KPI_Title_4":');
                    if (KPIresponses1.size() > 1) {
                        String[] KPINewDescllist1 = KPIresponses1[1].split('"type":"text"');
                        KPINewDesc1 = '"KPI_Title_4":' + KPINewDescllist1[0] + '"type": "text" },';
                    }

                    String[] KPIresponses2 = responseBody.split('"KPI_Title_3":');
                    if (KPIresponses2.size() > 1) {
                        String[] KPINewDescllist2 = KPIresponses2[1].split('"type":"text"');
                        KPINewDesc2 = '"KPI_Title_3":' + KPINewDescllist2[0] + '"type": "text" },';
                    }

                    String[] KPIresponses3 = responseBody.split('"KPI_Title_2":');
                    if (KPIresponses3.size() > 1) {
                        String[] KPINewDescllist3 = KPIresponses3[1].split('"type":"text"');
                        KPINewDesc3 = '"KPI_Title_2":' + KPINewDescllist3[0] + '"type": "text" },';
                    }

                    String[] KPIresponses4 = responseBody.split('"KPI_Title_1":');
                    if (KPIresponses4.size() > 1) {
                        String[] KPINewDescllist4 = KPIresponses4[1].split('"type":"text"');
                        KPINewDesc4 = '"KPI_Title_1":' + KPINewDescllist4[0] + '"type": "text" },';
                    }

                    String[] FilKPIresponses1 = responseBody.split('"Filters_Title":');
                    if (FilKPIresponses1.size() > 1) {
                        String[] FilKPINewDescllist1 = FilKPIresponses1[1].split('"type":"text"');
                        FilNewDesc1 = '"Filters_Title":' + FilKPINewDescllist1[0] + '"type": "text" },';
                    }

                    String[] FilKPIresponses2 = responseBody.split('"Overview_Title":');
                    if (FilKPIresponses2.size() > 1) {
                        String[] FilKPINewDescllist2 = FilKPIresponses2[1].split('"type":"text"');
                        FilNewDesc2 = '"Overview_Title":' + FilKPINewDescllist2[0] + '"type": "text" },';
                    }

                    String[] FilKPIresponses3 = responseBody.split('"Additional_Feature_Title_1":');
                    if (FilKPIresponses3.size() > 1) {
                        String[] FilKPINewDescllist3 = FilKPIresponses3[1].split('"type":"text"');
                        FilNewDesc3 = '"Additional_Feature_Title_1":' + FilKPINewDescllist3[0] + '"type": "text" },';
                    }

                    String[] FilKPIresponses4 = responseBody.split('"Additional_Feature_Title_2":');
                    if (FilKPIresponses4.size() > 1) {
                        String[] FilKPINewDescllist4 = FilKPIresponses4[1].split('"type":"text"');
                        FilNewDesc4 = '"Additional_Feature_Title_2":' + FilKPINewDescllist4[0] + '"type": "text" },';
                    }

                    String[] FilKPIresponses5 = responseBody.split('"Raw_Details_Title":');
                    if (FilKPIresponses5.size() > 1) {
                        String[] FilKPINewDescllist5 = FilKPIresponses5[1].split('"type":"text"');
                        FilNewDesc5 = '"Raw_Details_Title":' + FilKPINewDescllist5[0] + '"type": "text" },';
                    }

                    String[] FilKPIresponses6 = responseBody.split('"Dashboard_Title":');
                    if (FilKPIresponses6.size() > 1) {
                        String[] FilKPINewDescllist6 = FilKPIresponses6[1].split('"type":"text"');
                        String[] NewFilobj = FilKPINewDescllist6[0].split('"text":');
                        String[] StrNewFilobj = NewFilobj[1].split(',');
                        FilKPINewDescllist6[0] = FilKPINewDescllist6[0].replace(StrNewFilobj[0], '"Dashboard Title"');
                        FilNewDesc6 = '"Dashboard_Title":' + FilKPINewDescllist6[0] + '"type": "text" },';
                    }

                    String[] FilKPIresponses7 = responseBody.split('"Dashboard_Description":');
                    if (FilKPIresponses7.size() > 1) {
                        String[] FilKPINewDescllist7 = FilKPIresponses7[1].split('"type":"text"');
                        String[] NewFilobj = FilKPINewDescllist7[0].split('"text":');
                        String[] StrNewFilobj = NewFilobj[1].split(',');
                        FilKPINewDescllist7[0] = FilKPINewDescllist7[0].replace(StrNewFilobj[0], '"Dashboard Description"');
                        FilNewDesc7 = '"Dashboard_Description":' + FilKPINewDescllist7[0] + '"type": "text" },';
                    }

                    for (integer i = 1; i <= 8; i++) {
                        String[] FilKPIresponsesChart = responseBody.split('"Chart_Title_' + i + '":');
                        if (FilKPIresponsesChart.size() > 1) {
                            String[] FilKPINewDescllistChart = FilKPIresponsesChart[1].split('"type":"text"');
                            String[] NewFilobj = FilKPINewDescllistChart[0].split('"text":');
                            String[] StrNewFilobj = NewFilobj[1].split(',');
                            FilKPINewDescllistChart[0] = FilKPINewDescllistChart[0].replace(StrNewFilobj[0], '"{{ cell(Static_Dimensions.selection, 0, \\\"label' + i + '\\\").asString()}}"');
                            if (i == 1) {
                                ChartFilNewDesc1 = '"Chart_Title_' + i + '":' + FilKPINewDescllistChart[0] + '"type": "text" },';
                            }
                            else if (i == 2) {
                                ChartFilNewDesc2 = '"Chart_Title_' + i + '":' + FilKPINewDescllistChart[0] + '"type": "text" },';
                            }
                            else if (i == 3) {
                                ChartFilNewDesc3 = '"Chart_Title_' + i + '":' + FilKPINewDescllistChart[0] + '"type": "text" },';
                            }
                            else if (i == 4) {
                                ChartFilNewDesc4 = '"Chart_Title_' + i + '":' + FilKPINewDescllistChart[0] + '"type": "text" },';
                            }
                            else if (i == 5) {
                                ChartFilNewDesc5 = '"Chart_Title_' + i + '":' + FilKPINewDescllistChart[0] + '"type": "text" },';
                            }
                            else if (i == 6) {
                                ChartFilNewDesc6 = '"Chart_Title_' + i + '":' + FilKPINewDescllistChart[0] + '"type": "text" },';
                            }
                            else if (i == 7) {
                                ChartFilNewDesc7 = '"Chart_Title_' + i + '":' + FilKPINewDescllistChart[0] + '"type": "text" },';
                            }
                            else if (i == 8) {
                                ChartFilNewDesc8 = '"Chart_Title_' + i + '":' + FilKPINewDescllistChart[0] + '"type": "text" },';
                            }
                        }
                    }

                    String[] FilKPIresponsesMeas = responseBody.split('"Measure_Text":');
                    if (FilKPIresponsesMeas.size() > 1) {
                        String[] FilKPINewDescllistMeas = FilKPIresponsesMeas[1].split('"type":"text"');
                        FilNewDescMeas = '"Measure_Text":' + FilKPINewDescllistMeas[0] + '"type": "text" },';
                    }

                    String[] FilKPIresponsesSort = responseBody.split('"Sort_Results":');
                    if (FilKPIresponsesSort.size() > 1) {
                        String[] FilKPINewDescllistSort = FilKPIresponsesSort[1].split('"type":"text"');
                        FilNewDescSort = '"Sort_Results":' + FilKPINewDescllistSort[0] + '"type": "text" },';
                    }






                    System.debug('KPINewDesc1 *********** ' + NewDBS);
                    System.debug('KPINewDesc1 *********** ' + FilNewDesc2);
                    System.debug('KPINewDesc1 *********** ' + FilNewDesc3);
                    System.debug('KPINewDesc1 *********** ' + FilNewDesc4);
                    System.debug('KPINewDesc1 *********** ' + FilNewDesc5);
                }
                else if (NewSales[0].Dashboard_Type__c == 'Beta Insights') {



                }

                else if (NewSales[0].Dashboard_Type__c == 'Compare') {

                    for (integer i = 1; i <= 11; i++) {
                        String[] snaptxt1 = responseBody.split('"text_' + i + '":');
                        if (snaptxt1.size() > 1) {
                            snaptxt1[1] = snaptxt1[1].replace('"type": "text"', '"type":"text"');
                            String[] ssnaptxt1 = snaptxt1[1].split('"type":"text"');
                            if (i == 1) {
                                strsnaptxt1 = '"text_' + i + '":' + ssnaptxt1[0] + '"type": "text" },';
                            }
                            else if (i == 2) {
                                strsnaptxt2 = '"text_' + i + '":' + ssnaptxt1[0] + '"type": "text" },';
                            }
                            else if (i == 3) {
                                strsnaptxt3 = '"text_' + i + '":' + ssnaptxt1[0] + '"type": "text" },';
                            }
                            else if (i == 4) {
                                strsnaptxt4 = '"text_' + i + '":' + ssnaptxt1[0] + '"type": "text" },';
                            }
                            else if (i == 5) {
                                strsnaptxt5 = '"text_' + i + '":' + ssnaptxt1[0] + '"type": "text" },';
                            }
                            else if (i == 6) {
                                strsnaptxt6 = '"text_' + i + '":' + ssnaptxt1[0] + '"type": "text" },';
                            }
                            else if (i == 7) {
                                strsnaptxt7 = '"text_' + i + '":' + ssnaptxt1[0] + '"type": "text" },';
                            }
                            else if (i == 8) {
                                strsnaptxt8 = '"text_' + i + '":' + ssnaptxt1[0] + '"type": "text" },';
                            }
                            else if (i == 9) {
                                strsnaptxt9 = '"text_' + i + '":' + ssnaptxt1[0] + '"type": "text" },';
                            }
                            else if (i == 10) {
                                strsnaptxt10 = '"text_' + i + '":' + ssnaptxt1[0] + '"type": "text" },';
                            }
                            else if (i == 11) {
                                strsnaptxt11 = '"text_' + i + '":' + ssnaptxt1[0] + '"type": "text" },';
                            }
                        }
                    }
                    String[] responses = responseBody.split('"container_1":');
                    if (responses.size() > 1) {
                        String[] NewDescllist = responses[1].split('"type":"container"');
                        snapNewDesc = '"container_1":' + NewDescllist[0] + '"type": "container" },';
                    }
                    String[] responses1 = responseBody.split('"container_2":');
                    if (responses1.size() > 1) {
                        String[] NewDescllist1 = responses1[1].split('"type":"container"');
                        snapNewDesc1 = '"container_2":' + NewDescllist1[0] + '"type": "container" },';
                    }

                    String[] responses2 = responseBody.split('"container_3":');
                    if (responses2.size() > 1) {
                        String[] NewDescllist2 = responses2[1].split('"type":"container"');
                        snapNewDesc2 = '"container_3":' + NewDescllist2[0] + '"type": "container" },';
                    }

                    String[] responses3 = responseBody.split('"container_4":');
                    if (responses3.size() > 1) {
                        String[] NewDescllist3 = responses3[1].split('"type":"container"');
                        snapNewDesc3 = '"container_4":' + NewDescllist3[0] + '"type": "container" },';
                    }

                    String[] responses4 = responseBody.split('"container_5":');
                    if (responses4.size() > 1) {
                        String[] NewDescllist4 = responses4[1].split('"type":"container"');
                        snapNewDesc4 = '"container_5":' + NewDescllist4[0] + '"type": "container" },';
                    }

                    String[] KPIresponses2 = responseBody.split('"container_6":');
                    if (KPIresponses2.size() > 1) {
                        String[] KPINewDescllist2 = KPIresponses2[1].split('"type":"container"');
                        snapKPINewDesc1 = '"container_6":' + KPINewDescllist2[0] + '"type": "container" },';
                    }
                }
                else if (NewSales[0].Dashboard_Type__c == 'Contrast') {

                    String[] responses = responseBody.split('"container_3":');
                    if (responses.size() > 1) {
                        String[] NewDescllist = responses[1].split('"type":"container"');
                        ActNewDesc = '"container_3":' + NewDescllist[0] + '"type": "container" },';
                    }

                    String[] responses1 = responseBody.split('"container_9":');
                    if (responses1.size() > 1) {
                        String[] NewDescllist1 = responses1[1].split('"type":"container"');
                        ActNewDesc1 = '"container_9":' + NewDescllist1[0] + '"type": "container" },';
                    }

                    String[] responses2 = responseBody.split('"container_5":');
                    if (responses2.size() > 1) {
                        String[] NewDescllist2 = responses2[1].split('"type":"container"');
                        ActNewDesc2 = '"container_5":' + NewDescllist2[0] + '"type": "container" },';
                    }


                    String[] FilKPIresponsesMeas = responseBody.split('"Measure_Text":');
                    if (FilKPIresponsesMeas.size() > 1) {
                        String[] FilKPINewDescllistMeas = FilKPIresponsesMeas[1].split('"type":"text"');
                        FilNewDescMeas = '"Measure_Text":' + FilKPINewDescllistMeas[0] + '"type": "text" },';
                    }

                    String[] Filresac1 = responseBody.split('"text_1":');
                    if (Filresac1.size() > 1) {
                        String[] resac1 = Filresac1[1].split('"type":"text"');
                        Actualtext1 = '"text_1":' + resac1[0] + '"type": "text" },';
                    }

                    String[] Filresac2 = responseBody.split('"text_2":');
                    if (Filresac2.size() > 1) {
                        String[] resac2 = Filresac2[1].split('"type":"text"');
                        Actualtext2 = '"text_2":' + resac2[0] + '"type": "text" },';
                    }

                    String[] Filresac3 = responseBody.split('"text_3":');
                    if (Filresac3.size() > 1) {
                        String[] resac3 = Filresac3[1].split('"type":"text"');
                        Actualtext3 = '"text_3":' + resac3[0] + '"type": "text" },';
                    }

                    String[] Filresac4 = responseBody.split('"text_4":');
                    if (Filresac4.size() > 1) {
                        String[] resac4 = Filresac4[1].split('"type":"text"');
                        Actualtext4 = '"text_4":' + resac4[0] + '"type": "text" },';
                    }

                }

                String Res = responseBodylist[0];
                String[] Reslst = Res.split('"gridLayouts":');
                String Rs = '"gridLayouts": ' + Reslst[1];
                Rs = Rs.replace('"name":"49aec73a-4cfc-4256-93d7-98d922372c8a",', '');
                Rs = Rs.replace('"name":"c0194d25-02cd-47ee-9569-aa3b0b159ad5",', '');
                Rs = Rs.replace('"name":"62975578-cd05-4a7c-919e-83ab5fd866dd",', '');
                // Rs = Rs.replace('"name":"03942376-0b77-4993-875d-3521ff42e2a8",','');
                Rs = Rs.replace('"label":"Untitled",', '');
                // String Ws = '"widgets": {' + responseBodylists[1];
                //  String[] AllWs = Ws.split(',"type":"dashboard"');
                //  String Values = '"Raw_Details_Chart":{"parameters":{"borderColor":"#e0e5ee","borderWidth":1,"cell":{"backgroundColor":"#ffffff","fontColor":"#16325c","fontSize":12},"columns":[],"customBulkActions":[],"exploreLink":true,"header":{"backgroundColor":"#f4f6f9","fontColor":"#16325c","fontSize":12},"innerMajorBorderColor":"#a8b7c7","innerMinorBorderColor":"#e0e5ee","maxColumnWidth":300,"minColumnWidth":40,"mode":"variable","numberOfLines":1,"showRowIndexColumn":true,"totals":true,"verticalPadding":8},"type":"table"},'; 
                // String AllWsDel = AllWs[0].replace(Values,'"Raw_Details_Chart": { "parameters": { "customBulkActions": [], "exploreLink": true, "step": "Raw_Data" }, "type": "table" },');
                String NewWrap;
                String NewWrapone = '';
                String NewWraptwo = '';
                if (NewSales[0].Dashboard_Type__c != 'Sales Insights') {
                    if (NewSales[0].Sales_Insight_String4__c == null || NewSales[0].Sales_Insight_String4__c == '') {
                        NewWrap = NewSales[0].Sales_Insight_String3__c.replaceAll('\\s+\\s+', '#testcode#').replaceAll('#testcode#', ' ');

                    }
                    else {
                        NewWrap = NewSales[0].Sales_Insight_String4__c.replaceAll('\\s+\\s+', '#testcode#').replaceAll('#testcode#', ' ');
                    }
                }
                else {
                    // NewWrap = NewSales[0].Sales_Insight_String3__c;
                    NewWrap = NewSales[0].Grouping_label_Delete__c;
                    NewWrapone = NewSales[0].Sales_Insight_String4__c;
                    NewWraptwo = NewSales[0].Grouping_Delete__c;
                }

                //   String objNewDesc='',objNewDesc1='',objNewDesc2='',objNewDesc3='',objNewDesc4='',objKPINewDesc1='',objKPINewDesc2='',objKPINewDesc3='',objKPINewDesc4='';
                //     String FilobjKPINewDesc1='',FilobjKPINewDesc2='',FilobjKPINewDesc3='',FilobjKPINewDesc4='',FilobjKPINewDesc5='',FilobjKPINewDesc6 = '',FilobjKPINewDesc7 = '';
                // String ChartFilobjKPINewDesc1 = '',ChartFilobjKPINewDesc2 = '',ChartFilobjKPINewDesc3 = '',ChartFilobjKPINewDesc4 = '';
                // String ChartFilobjKPINewDesc5 = '',ChartFilobjKPINewDesc6 = '',ChartFilobjKPINewDesc7 = '',ChartFilobjKPINewDesc8 = '';
                // String FilobjKPINewDescMeas='',FilobjKPINewDescSort='';
                // string TextFilobjAct1 = '',TextFilobjAct2 = '',TextFilobjAct3 = '',TextFilobjAct4 = '';
                // string Newstrsnaptxt1 = '',Newstrsnaptxt2 = '',Newstrsnaptxt3 = '',Newstrsnaptxt4 = '',Newstrsnaptxt5 = '',Newstrsnaptxt6 = '',Newstrsnaptxt7 = '',Newstrsnaptxt8 = '',Newstrsnaptxt9 = '',Newstrsnaptxt10 = '',Newstrsnaptxt11 = '';
                if (NewSales[0].Dashboard_Type__c == 'Insights') {
                    String[] objresponses = NewWrap.split('"Description_Container":');
                    if (objresponses.size() > 1) {
                        objresponses[1] = objresponses[1].replace('"type": "container"', '"type":"container"');
                        String[] objNewDescllist = objresponses[1].split('"type":"container"');
                        objNewDesc = '"Description_Container":' + objNewDescllist[0] + '"type": "container" },';
                    }

                    String[] objresponses1 = NewWrap.split('"Filters_Container":');
                    if (objresponses1.size() > 1) {
                        objresponses1[1] = objresponses1[1].replace('"type": "container"', '"type":"container"');
                        String[] objNewDescllist1 = objresponses1[1].split('"type":"container"');
                        objNewDesc1 = '"Filters_Container":' + objNewDescllist1[0] + '"type": "container" },';
                    }

                    String[] objresponses2 = NewWrap.split('"Header_Container":');
                    if (objresponses2.size() > 1) {
                        objresponses2[1] = objresponses2[1].replace('"type": "container"', '"type":"container"');
                        String[] objNewDescllist2 = objresponses2[1].split('"type":"container"');
                        objNewDesc2 = '"Header_Container":' + objNewDescllist2[0] + '"type": "container" },';
                    }

                    String[] objresponses3 = NewWrap.split('"Chart_Container":');
                    if (objresponses3.size() > 1) {
                        objresponses3[1] = objresponses3[1].replace('"type": "container"', '"type":"container"');
                        String[] objNewDescllist3 = objresponses3[1].split('"type":"container"');
                        objNewDesc3 = '"Chart_Container":' + objNewDescllist3[0] + '"type": "container" },';
                    }
                    String[] objresponses4 = NewWrap.split('"Groupings_Container":');
                    if (objresponses4.size() > 1) {
                        objresponses4[1] = objresponses4[1].replace('"type": "container"', '"type":"container"');
                        String[] objNewDescllist4 = objresponses4[1].split('"type":"container"');
                        objNewDesc4 = '"Groupings_Container":' + objNewDescllist4[0] + '"type": "container" },';
                    }

                    String[] objKPIresponses1 = NewWrap.split('"KPI_Title_4":');
                    if (objKPIresponses1.size() > 1) {
                        objKPIresponses1[1] = objKPIresponses1[1].replace('"type": "text"', '"type":"text"');
                        String[] objKPINewDescllist1 = objKPIresponses1[1].split('"type":"text"');
                        objKPINewDesc1 = '"KPI_Title_4":' + objKPINewDescllist1[0] + '"type": "text" },';
                    }

                    String[] objKPIresponses2 = NewWrap.split('"KPI_Title_3":');
                    if (objKPIresponses2.size() > 1) {
                        objKPIresponses2[1] = objKPIresponses2[1].replace('"type": "text"', '"type":"text"');
                        String[] objKPINewDescllist2 = objKPIresponses2[1].split('"type":"text"');
                        objKPINewDesc2 = '"KPI_Title_3":' + objKPINewDescllist2[0] + '"type": "text" },';
                    }

                    String[] objKPIresponses3 = NewWrap.split('"KPI_Title_2":');
                    if (objKPIresponses3.size() > 1) {
                        objKPIresponses3[1] = objKPIresponses3[1].replace('"type": "text"', '"type":"text"');
                        String[] objKPINewDescllist3 = objKPIresponses3[1].split('"type":"text"');
                        objKPINewDesc3 = '"KPI_Title_2":' + objKPINewDescllist3[0] + '"type": "text" },';
                    }

                    String[] objKPIresponses4 = NewWrap.split('"KPI_Title_1":');
                    if (objKPIresponses4.size() > 1) {
                        objKPIresponses4[1] = objKPIresponses4[1].replace('"type": "text"', '"type":"text"');
                        String[] objKPINewDescllist4 = objKPIresponses4[1].split('"type":"text"');
                        objKPINewDesc4 = '"KPI_Title_1":' + objKPINewDescllist4[0] + '"type": "text" },';
                    }

                    String[] FilobjKPIresponses1 = NewWrap.split('"Filters_Title":');
                    if (FilobjKPIresponses1.size() > 1) {
                        FilobjKPIresponses1[1] = FilobjKPIresponses1[1].replace('"type": "text"', '"type":"text"');
                        String[] FilobjKPINewDescllist1 = FilobjKPIresponses1[1].split('"type":"text"');
                        FilobjKPINewDesc1 = '"Filters_Title":' + FilobjKPINewDescllist1[0] + '"type": "text" },';
                    }

                    String[] FilobjKPIresponses2 = NewWrap.split('"Overview_Title":');
                    if (FilobjKPIresponses2.size() > 1) {
                        FilobjKPIresponses2[1] = FilobjKPIresponses2[1].replace('"type": "text"', '"type":"text"');
                        String[] FilobjKPINewDescllist2 = FilobjKPIresponses2[1].split('"type":"text"');
                        FilobjKPINewDesc2 = '"Overview_Title":' + FilobjKPINewDescllist2[0] + '"type": "text" },';
                    }
                    String[] FilobjKPIresponses3 = NewWrap.split('"Additional_Feature_Title_1":');
                    if (FilobjKPIresponses3.size() > 1) {
                        FilobjKPIresponses3[1] = FilobjKPIresponses3[1].replace('"type": "text"', '"type":"text"');
                        String[] FilobjKPINewDescllist3 = FilobjKPIresponses3[1].split('"type":"text"');
                        FilobjKPINewDesc3 = '"Additional_Feature_Title_1":' + FilobjKPINewDescllist3[0] + '"type": "text" },';
                    }
                    String[] FilobjKPIresponses4 = NewWrap.split('"Additional_Feature_Title_2":');

                    if (FilobjKPIresponses4.size() > 1) {
                        FilobjKPIresponses4[1] = FilobjKPIresponses4[1].replace('"type": "text"', '"type":"text"');
                        String[] FilobjKPINewDescllist4 = FilobjKPIresponses4[1].split('"type":"text"');
                        FilobjKPINewDesc4 = '"Additional_Feature_Title_2":' + FilobjKPINewDescllist4[0] + '"type": "text" },';
                    }

                    String[] FilobjKPIresponses5 = NewWrap.split('"Raw_Details_Title":');
                    if (FilobjKPIresponses5.size() > 1) {
                        FilobjKPIresponses5[1] = FilobjKPIresponses5[1].replace('"type": "text"', '"type":"text"');
                        String[] FilobjKPINewDescllist5 = FilobjKPIresponses5[1].split('"type":"text"');
                        FilobjKPINewDesc5 = '"Raw_Details_Title":' + FilobjKPINewDescllist5[0] + '"type": "text" },';
                    }

                    String[] FilobjKPIresponses6 = NewWrap.split('"Dashboard_Title":');
                    if (FilobjKPIresponses6.size() > 1) {
                        FilobjKPIresponses6[1] = FilobjKPIresponses6[1].replace('"type": "text"', '"type":"text"');
                        String[] FilobjKPINewDescllist6 = FilobjKPIresponses6[1].split('"type":"text"');
                        FilobjKPINewDesc6 = '"Dashboard_Title":' + FilobjKPINewDescllist6[0] + '"type": "text" },';
                    }

                    String[] FilobjKPIresponses7 = NewWrap.split('"Dashboard_Description":');
                    if (FilobjKPIresponses7.size() > 1) {
                        FilobjKPIresponses7[1] = FilobjKPIresponses7[1].replace('"type": "text"', '"type":"text"');
                        String[] FilobjKPINewDescllist7 = FilobjKPIresponses7[1].split('"type":"text"');
                        FilobjKPINewDesc7 = '"Dashboard_Description":' + FilobjKPINewDescllist7[0] + '"type": "text" },';
                    }

                    for (integer i = 1; i <= 8; i++) {
                        String[] FilobjKPIresponsesChart = NewWrap.split('"Chart_Title_' + i + '":');
                        if (FilobjKPIresponsesChart.size() > 1) {
                            FilobjKPIresponsesChart[1] = FilobjKPIresponsesChart[1].replace('"type": "text"', '"type":"text"');
                            String[] FilobjKPINewDescllistChat = FilobjKPIresponsesChart[1].split('"type":"text"');
                            if (i == 1) {
                                ChartFilobjKPINewDesc1 = '"Chart_Title_' + i + '":' + FilobjKPINewDescllistChat[0] + '"type": "text" },';
                            }
                            else if (i == 2) {
                                ChartFilobjKPINewDesc2 = '"Chart_Title_' + i + '":' + FilobjKPINewDescllistChat[0] + '"type": "text" },';
                            }
                            else if (i == 3) {
                                ChartFilobjKPINewDesc3 = '"Chart_Title_' + i + '":' + FilobjKPINewDescllistChat[0] + '"type": "text" },';
                            }
                            else if (i == 4) {
                                ChartFilobjKPINewDesc4 = '"Chart_Title_' + i + '":' + FilobjKPINewDescllistChat[0] + '"type": "text" },';
                            }
                            else if (i == 5) {
                                ChartFilobjKPINewDesc5 = '"Chart_Title_' + i + '":' + FilobjKPINewDescllistChat[0] + '"type": "text" },';
                            }
                            else if (i == 6) {
                                ChartFilobjKPINewDesc6 = '"Chart_Title_' + i + '":' + FilobjKPINewDescllistChat[0] + '"type": "text" },';
                            }
                            else if (i == 7) {
                                ChartFilobjKPINewDesc7 = '"Chart_Title_' + i + '":' + FilobjKPINewDescllistChat[0] + '"type": "text" },';
                            }
                            else if (i == 8) {
                                ChartFilobjKPINewDesc8 = '"Chart_Title_' + i + '":' + FilobjKPINewDescllistChat[0] + '"type": "text" },';
                            }
                        }
                    }

                    String[] FilobjKPIresponsesMeas = NewWrap.split('"Measure_Text":');
                    if (FilobjKPIresponsesMeas.size() > 1) {
                        FilobjKPIresponsesMeas[1] = FilobjKPIresponsesMeas[1].replace('"type": "text"', '"type":"text"');
                        String[] FilobjKPINewDescllistmeas = FilobjKPIresponsesMeas[1].split('"type":"text"');
                        FilobjKPINewDescMeas = '"Measure_Text":' + FilobjKPINewDescllistmeas[0] + '"type": "text" },';
                    }

                    String[] FilobjKPIresponsesSort = NewWrap.split('"Sort_Results":');
                    if (FilobjKPIresponsesSort.size() > 1) {
                        FilobjKPIresponsesSort[1] = FilobjKPIresponsesSort[1].replace('"type": "text"', '"type":"text"');
                        String[] FilobjKPINewDescllistSort = FilobjKPIresponsesSort[1].split('"type":"text"');
                        FilobjKPINewDescSort = '"Sort_Results":' + FilobjKPINewDescllistSort[0] + '"type": "text" },';
                    }




                    for (integer i = 1; i <= 100; i++) {
                        String[] FilKPIresponsesImg = responseBody.split('"image_' + i + '":');
                        if (FilKPIresponsesImg.size() > 1 && !NewWrap.contains('"image_' + i + '":')) {
                            String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"image"');
                            if (NewDBS == null || NewDBS == '') {
                                NewDBS = '"image_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "image" },';
                            }
                            else {
                                NewDBS += '"image_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "image" },';
                            }
                        }
                        if (NewWrap.contains('"image_' + i + '":') && FilKPIresponsesImg.size() > 1) {
                            String[] objresponsescon = NewWrap.split('"image_' + i + '":');
                            objresponsescon[1] = objresponsescon[1].replace('"type": "image"', '"type":"image"');
                            String[] objNewDescllistcon = objresponsescon[1].split('"type":"image"');
                            String objNewDesccon = '"image_' + i + '":' + objNewDescllistcon[0] + '"type": "image" },';

                            String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"image"');
                            String NewDBScon = '"image_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "image" },';
                            NewWrap = NewWrap.replace(objNewDesccon, NewDBScon);
                        }
                        if (NewWrap.contains('"image_' + i + '":') && !responseBody.contains('"image_' + i + '":')) {
                            String[] objresponsescon = NewWrap.split('"image_' + i + '":');
                            objresponsescon[1] = objresponsescon[1].replace('"type": "image"', '"type":"image"');
                            String[] objNewDescllistcon = objresponsescon[1].split('"type":"image"');
                            String objNewDesccon = '"image_' + i + '":' + objNewDescllistcon[0] + '"type": "image" },';
                            NewWrap = NewWrap.replace(objNewDesccon, '');
                        }

                    }

                    for (integer i = 3; i <= 100; i++) {
                        String[] FilKPIresponsesImg = responseBody.split('"listselector_' + i + '":');
                        if (FilKPIresponsesImg.size() > 1 && !NewWrap.contains('"listselector_' + i + '":')) {
                            String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"listselector"');
                            if (NewDBS == null || NewDBS == '') {
                                NewDBS = '"listselector_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "listselector" },';
                            }
                            else {
                                NewDBS += '"listselector_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "listselector" },';
                            }
                        }
                        if (NewWrap.contains('"listselector_' + i + '":') && FilKPIresponsesImg.size() > 1) {
                            String[] objresponsescon = NewWrap.split('"listselector_' + i + '":');
                            objresponsescon[1] = objresponsescon[1].replace('"type": "listselector"', '"type":"listselector"');
                            String[] objNewDescllistcon = objresponsescon[1].split('"type":"listselector"');
                            String objNewDesccon = '"listselector_' + i + '":' + objNewDescllistcon[0] + '"type": "listselector" },';

                            String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"listselector"');
                            String NewDBScon = '"listselector_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "listselector" },';
                            NewWrap = NewWrap.replace(objNewDesccon, NewDBScon);
                        }
                        if (NewWrap.contains('"listselector_' + i + '":') && !responseBody.contains('"listselector' + i + '":')) {
                            String[] objresponsescon = NewWrap.split('"listselector_' + i + '":');
                            objresponsescon[1] = objresponsescon[1].replace('"type": "listselector"', '"type":"listselector"');
                            String[] objNewDescllistcon = objresponsescon[1].split('"type":"listselector"');
                            String objNewDesccon = '"listselector_' + i + '":' + objNewDescllistcon[0] + '"type": "listselector" },';
                            NewWrap = NewWrap.replace(objNewDesccon, '');
                        }

                    }

                    for (integer i = 3; i <= 100; i++) {
                        String[] FilKPIresponsesImg = responseBody.split('"dateselector_' + i + '":');
                        if (FilKPIresponsesImg.size() > 1 && !NewWrap.contains('"dateselector_' + i + '":')) {
                            String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"dateselector"');
                            if (NewDBS == null || NewDBS == '') {
                                NewDBS = '"dateselector_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "dateselector" },';
                            }
                            else {
                                NewDBS += '"dateselector_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "dateselector" },';
                            }
                        }
                        if (NewWrap.contains('"dateselector_' + i + '":') && FilKPIresponsesImg.size() > 1) {
                            String[] objresponsescon = NewWrap.split('"dateselector_' + i + '":');
                            objresponsescon[1] = objresponsescon[1].replace('"type": "dateselector"', '"type":"dateselector"');
                            String[] objNewDescllistcon = objresponsescon[1].split('"type":"dateselector"');
                            String objNewDesccon = '"dateselector_' + i + '":' + objNewDescllistcon[0] + '"type": "dateselector" },';

                            String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"dateselector"');
                            String NewDBScon = '"dateselector_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "dateselector" },';
                            NewWrap = NewWrap.replace(objNewDesccon, NewDBScon);
                        }
                        if (NewWrap.contains('"dateselector_' + i + '":') && !responseBody.contains('"dateselector_' + i + '":')) {
                            String[] objresponsescon = NewWrap.split('"dateselector_' + i + '":');
                            objresponsescon[1] = objresponsescon[1].replace('"type": "dateselector"', '"type":"dateselector"');
                            String[] objNewDescllistcon = objresponsescon[1].split('"type":"dateselector"');
                            String objNewDesccon = '"dateselector_' + i + '":' + objNewDescllistcon[0] + '"type": "dateselector" },';
                            NewWrap = NewWrap.replace(objNewDesccon, '');
                        }

                    }



                    for (integer i = 1; i <= 100; i++) {
                        String[] FilKPIresponsesImg = responseBody.split('"container_' + i + '":');
                        if (FilKPIresponsesImg.size() > 1 && !NewWrap.contains('"container_' + i + '":')) {
                            String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"container"');
                            if (NewDBS == null || NewDBS == '') {
                                NewDBS = '"container_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "container" },';
                            }
                            else {
                                NewDBS += '"container_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "container" },';
                            }
                        }
                        if (NewWrap.contains('"container_' + i + '":') && FilKPIresponsesImg.size() > 1) {
                            String[] objresponsescon = NewWrap.split('"container_' + i + '":');
                            objresponsescon[1] = objresponsescon[1].replace('"type": "container"', '"type":"container"');
                            String[] objNewDescllistcon = objresponsescon[1].split('"type":"container"');
                            String objNewDesccon = '"container_' + i + '":' + objNewDescllistcon[0] + '"type": "container" },';


                            String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"container"');
                            String NewDBScon = '"container_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "container" },';

                            NewWrap = NewWrap.replace(objNewDesccon, NewDBScon);
                        }
                        if (NewWrap.contains('"container_' + i + '":') && !responseBody.contains('"container_' + i + '":')) {
                            String[] objresponsescon = NewWrap.split('"container_' + i + '":');
                            objresponsescon[1] = objresponsescon[1].replace('"type": "container"', '"type":"container"');
                            String[] objNewDescllistcon = objresponsescon[1].split('"type":"container"');
                            String objNewDesccon = '"container_' + i + '":' + objNewDescllistcon[0] + '"type": "container" },';
                            NewWrap = NewWrap.replace(objNewDesccon, '');
                        }

                    }


                    NewWrap = NewWrap.replace('"widgets":{', '"widgets": {');
                    NewWrap = NewWrap.replace('"widgets": {', '"widgets": {' + NewDBS);
                    System.debug('objNewDesc1 *******************' + objKPINewDesc2);
                    System.debug('objNewDesc5 *******************' + objKPINewDesc1);
                    System.debug('objNewDesc2 *******************' + objKPINewDesc3);
                    System.debug('objNewDesc3 *******************' + FilobjKPINewDesc4);
                    System.debug('objNewDesc4 *******************' + FilobjKPINewDesc5);

                    NewWrap = NewWrap.replace(objNewDesc1, NewDesc1);
                    NewWrap = NewWrap.replace(objNewDesc2, NewDesc2);
                    NewWrap = NewWrap.replace(objNewDesc3, NewDesc3);
                    NewWrap = NewWrap.replace(objNewDesc4, NewDesc4);
                    NewWrap = NewWrap.replace(objNewDesc, NewDesc).replace(FilobjKPINewDesc1, FilNewDesc1);
                    NewWrap = NewWrap.replace(objKPINewDesc1, KPINewDesc1).replace(FilobjKPINewDesc2, FilNewDesc2);
                    NewWrap = NewWrap.replace(objKPINewDesc2, KPINewDesc2).replace(FilobjKPINewDesc3, FilNewDesc3);
                    NewWrap = NewWrap.replace(objKPINewDesc3, KPINewDesc3).replace(FilobjKPINewDesc4, FilNewDesc4);
                    NewWrap = NewWrap.replace(objKPINewDesc4, KPINewDesc4).replace(FilobjKPINewDesc5, FilNewDesc5);
                    NewWrap = NewWrap.replace(FilobjKPINewDesc6, FilNewDesc6).replace(FilobjKPINewDesc7, FilNewDesc7);
                    NewWrap = NewWrap.replace(ChartFilobjKPINewDesc1, ChartFilNewDesc1).replace(ChartFilobjKPINewDesc2, ChartFilNewDesc2);
                    NewWrap = NewWrap.replace(ChartFilobjKPINewDesc3, ChartFilNewDesc3).replace(ChartFilobjKPINewDesc4, ChartFilNewDesc4);
                    NewWrap = NewWrap.replace(ChartFilobjKPINewDesc5, ChartFilNewDesc5).replace(ChartFilobjKPINewDesc6, ChartFilNewDesc6);
                    NewWrap = NewWrap.replace(ChartFilobjKPINewDesc7, ChartFilNewDesc7).replace(ChartFilobjKPINewDesc8, ChartFilNewDesc8);
                    NewWrap = NewWrap.replace(FilobjKPINewDescMeas, FilNewDescMeas).replace(FilobjKPINewDescSort, FilNewDescSort);
                    NewWrap = NewWrap.replace('"type":"text"', '"type": "text"');
                    NewWrap = Newwrap.replace('&quot;', '\\"');
                    if (NewSales[0].Sales_Insight_String4__c == null || NewSales[0].Sales_Insight_String4__c == '') {
                        NewSales[0].Sales_Insight_String3__c = NewWrap;
                    }
                    else {
                        NewSales[0].Sales_Insight_String4__c = NewWrap;
                    }
                }
                else if (NewSales[0].Dashboard_Type__c == 'Beta Insights') {



                }
                else if (NewSales[0].Dashboard_Type__c == 'Compare') {

                    for (integer i = 1; i <= 11; i++) {
                        system.debug('Newstrsnaptxt1 NewWrap ****' + i);
                        String[] snaptxt1 = NewWrap.split('"text_' + i + '":');
                        if (snaptxt1.size() > 1) {
                            system.debug('Newstrsnaptxt1 NewWrap ****' + snaptxt1[1]);
                            snaptxt1[1] = snaptxt1[1].replace('"type": "text"', '"type":"text"');
                            String[] ssnaptxt1 = snaptxt1[1].split('"type":"text"');
                            if (i == 1) {
                                Newstrsnaptxt1 = '"text_' + i + '":' + ssnaptxt1[0] + '"type": "text" },';
                            }
                            else if (i == 2) {
                                Newstrsnaptxt2 = '"text_' + i + '":' + ssnaptxt1[0] + '"type": "text" },';
                            }
                            else if (i == 3) {
                                Newstrsnaptxt3 = '"text_' + i + '":' + ssnaptxt1[0] + '"type": "text" },';
                            }
                            else if (i == 4) {
                                Newstrsnaptxt4 = '"text_' + i + '":' + ssnaptxt1[0] + '"type": "text" },';
                            }
                            else if (i == 5) {
                                Newstrsnaptxt5 = '"text_' + i + '":' + ssnaptxt1[0] + '"type": "text" },';
                            }
                            else if (i == 6) {
                                Newstrsnaptxt6 = '"text_' + i + '":' + ssnaptxt1[0] + '"type": "text" },';
                            }
                            else if (i == 7) {
                                Newstrsnaptxt7 = '"text_' + i + '":' + ssnaptxt1[0] + '"type": "text" },';
                            }
                            else if (i == 8) {
                                Newstrsnaptxt8 = '"text_' + i + '":' + ssnaptxt1[0] + '"type": "text" },';
                            }
                            else if (i == 9) {
                                Newstrsnaptxt9 = '"text_' + i + '":' + ssnaptxt1[0] + '"type": "text" },';
                            }
                            else if (i == 10) {
                                Newstrsnaptxt10 = '"text_' + i + '":' + ssnaptxt1[0] + '"type": "text" },';
                            }
                            else if (i == 11) {
                                Newstrsnaptxt11 = '"text_' + i + '":' + ssnaptxt1[0] + '"type": "text" },';
                            }
                        }
                    }
                    String[] objresponses = NewWrap.split('"container_1":');
                    if (objresponses.size() > 1) {
                        objresponses[1] = objresponses[1].replace('"type": "container"', '"type":"container"');
                        String[] objNewDescllist = objresponses[1].split('"type":"container"');
                        objNewDesc = '"container_1":' + objNewDescllist[0] + '"type": "container" },';
                    }

                    String[] objresponses1 = NewWrap.split('"container_2":');
                    if (objresponses1.size() > 1) {
                        objresponses1[1] = objresponses1[1].replace('"type": "container"', '"type":"container"');
                        String[] objNewDescllist1 = objresponses1[1].split('"type":"container"');
                        objNewDesc1 = '"container_2":' + objNewDescllist1[0] + '"type": "container" },';
                    }

                    String[] objresponses2 = NewWrap.split('"container_3":');
                    if (objresponses2.size() > 1) {
                        objresponses2[1] = objresponses2[1].replace('"type": "container"', '"type":"container"');
                        String[] objNewDescllist2 = objresponses2[1].split('"type":"container"');
                        objNewDesc2 = '"container_3":' + objNewDescllist2[0] + '"type": "container" },';
                    }

                    String[] objresponses3 = NewWrap.split('"container_4":');
                    if (objresponses3.size() > 1) {
                        objresponses3[1] = objresponses3[1].replace('"type": "container"', '"type":"container"');
                        String[] objNewDescllist3 = objresponses3[1].split('"type":"container"');
                        objNewDesc3 = '"container_4":' + objNewDescllist3[0] + '"type": "container" },';
                    }

                    String[] objresponses4 = NewWrap.split('"container_5":');
                    if (objresponses4.size() > 1) {
                        objresponses4[1] = objresponses4[1].replace('"type": "container"', '"type":"container"');
                        String[] objNewDescllist4 = objresponses4[1].split('"type":"container"');
                        objNewDesc4 = '"container_5":' + objNewDescllist4[0] + '"type": "container" },';
                    }

                    String[] objKPIresponses1 = NewWrap.split('"container_6":');
                    if (objKPIresponses1.size() > 1) {
                        objKPIresponses1[1] = objKPIresponses1[1].replace('"type": "container"', '"type":"container"');
                        String[] objKPINewDescllist1 = objKPIresponses1[1].split('"type":"container"');
                        objKPINewDesc1 = '"container_6":' + objKPINewDescllist1[0] + '"type": "container" },';
                    }

                    for (integer i = 1; i <= 100; i++) {
                        String[] FilKPIresponsesImg = responseBody.split('"image_' + i + '":');
                        if (FilKPIresponsesImg.size() > 1 && !NewWrap.contains('"image_' + i + '":')) {
                            String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"image"');
                            if (NewDBS == null || NewDBS == '') {
                                NewDBS = '"image_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "image" },';
                            }
                            else {
                                NewDBS += '"image_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "image" },';
                            }
                        }
                        if (NewWrap.contains('"image_' + i + '":') && FilKPIresponsesImg.size() > 1) {
                            String[] objresponsescon = NewWrap.split('"image_' + i + '":');
                            objresponsescon[1] = objresponsescon[1].replace('"type": "image"', '"type":"image"');
                            String[] objNewDescllistcon = objresponsescon[1].split('"type":"image"');
                            String objNewDesccon = '"image_' + i + '":' + objNewDescllistcon[0] + '"type": "image" },';

                            String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"image"');
                            String NewDBScon = '"image_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "image" },';
                            NewWrap = NewWrap.replace(objNewDesccon, NewDBScon);
                        }
                        if (NewWrap.contains('"image_' + i + '":') && !responseBody.contains('"image_' + i + '":')) {
                            String[] objresponsescon = NewWrap.split('"image_' + i + '":');
                            objresponsescon[1] = objresponsescon[1].replace('"type": "image"', '"type":"image"');
                            String[] objNewDescllistcon = objresponsescon[1].split('"type":"image"');
                            String objNewDesccon = '"image_' + i + '":' + objNewDescllistcon[0] + '"type": "image" },';
                            NewWrap = NewWrap.replace(objNewDesccon, '');
                        }

                    }
                    for (integer i = 7; i <= 100; i++) {
                        String[] FilKPIresponsesImg = responseBody.split('"container_' + i + '":');
                        if (FilKPIresponsesImg.size() > 1 && !NewWrap.contains('"container_' + i + '":')) {
                            String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"container"');
                            if (NewDBS == null || NewDBS == '') {
                                NewDBS = '"container_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "container" },';
                            }
                            else {
                                NewDBS += '"container_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "container" },';
                            }
                        }
                        if (NewWrap.contains('"container_' + i + '":') && FilKPIresponsesImg.size() > 1) {
                            String[] objresponsescon = NewWrap.split('"container_' + i + '":');
                            objresponsescon[1] = objresponsescon[1].replace('"type": "container"', '"type":"container"');
                            String[] objNewDescllistcon = objresponsescon[1].split('"type":"container"');
                            String objNewDesccon = '"container_' + i + '":' + objNewDescllistcon[0] + '"type": "container" },';


                            String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"container"');
                            String NewDBScon = '"container_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "container" },';

                            NewWrap = NewWrap.replace(objNewDesccon, NewDBScon);
                        }
                        if (NewWrap.contains('"container_' + i + '":') && !responseBody.contains('"container_' + i + '":')) {
                            String[] objresponsescon = NewWrap.split('"container_' + i + '":');
                            objresponsescon[1] = objresponsescon[1].replace('"type": "container"', '"type":"container"');
                            String[] objNewDescllistcon = objresponsescon[1].split('"type":"container"');
                            String objNewDesccon = '"container_' + i + '":' + objNewDescllistcon[0] + '"type": "container" },';
                            NewWrap = NewWrap.replace(objNewDesccon, '');
                        }

                    }
                    system.debug('Newstrsnaptxt1 ****' + Newstrsnaptxt1);
                    system.debug('Newstrsnaptxt2 ****' + Newstrsnaptxt2);
                    system.debug('Newstrsnaptxt3 ****' + Newstrsnaptxt3);
                    system.debug('Newstrsnaptxt4 ****' + Newstrsnaptxt4);
                    system.debug('strsnaptxt1 ****' + strsnaptxt1);
                    system.debug('strsnaptxt2 ****' + strsnaptxt2);
                    system.debug('strsnaptxt3 ****' + strsnaptxt3);
                    system.debug('strsnaptxt4 ****' + strsnaptxt4);
                    NewWrap = NewWrap.replace('"widgets":{', '"widgets": {');
                    NewWrap = NewWrap.replace('"widgets": {', '"widgets": {' + NewDBS);
                    NewWrap = NewWrap.replace('"type":"text"', '"type": "text"');
                    NewWrap = NewWrap.replace(objNewDesc1, snapNewDesc1);
                    NewWrap = NewWrap.replace(objNewDesc2, snapNewDesc2);
                    NewWrap = NewWrap.replace(objNewDesc3, snapNewDesc3);
                    NewWrap = NewWrap.replace(objNewDesc4, snapNewDesc4);
                    NewWrap = NewWrap.replace(Newstrsnaptxt1, strsnaptxt1);
                    NewWrap = NewWrap.replace(Newstrsnaptxt2, strsnaptxt2);
                    NewWrap = NewWrap.replace(Newstrsnaptxt3, strsnaptxt3);
                    NewWrap = NewWrap.replace(Newstrsnaptxt4, strsnaptxt4);
                    NewWrap = NewWrap.replace(Newstrsnaptxt5, strsnaptxt5);
                    NewWrap = NewWrap.replace(Newstrsnaptxt6, strsnaptxt6);
                    NewWrap = NewWrap.replace(Newstrsnaptxt7, strsnaptxt7);
                    NewWrap = NewWrap.replace(Newstrsnaptxt8, strsnaptxt8);
                    NewWrap = NewWrap.replace(Newstrsnaptxt9, strsnaptxt9);
                    NewWrap = NewWrap.replace(Newstrsnaptxt10, strsnaptxt10);
                    NewWrap = NewWrap.replace(Newstrsnaptxt11, strsnaptxt11);
                    NewWrap = NewWrap.replace(objNewDesc, snapNewDesc).replace(objKPINewDesc1, snapKPINewDesc1);
                    NewWrap = Newwrap.replace('&quot;', '\\"');
                    if (NewSales[0].Sales_Insight_String4__c == null || NewSales[0].Sales_Insight_String4__c == '') {
                        NewSales[0].Sales_Insight_String3__c = NewWrap;
                    }
                    else {
                        NewSales[0].Sales_Insight_String4__c = NewWrap;
                    }

                }
                else if (NewSales[0].Dashboard_Type__c == 'Contrast') {
                    String[] objresponses = NewWrap.split('"container_3":');
                    if (objresponses.size() > 1) {
                        objresponses[1] = objresponses[1].replace('"type": "container"', '"type":"container"');
                        String[] objNewDescllist = objresponses[1].split('"type":"container"');
                        objNewDesc = '"container_3":' + objNewDescllist[0] + '"type": "container" },';
                    }
                    String[] objresponses1 = NewWrap.split('"container_9":');
                    if (objresponses1.size() > 1) {
                        objresponses1[1] = objresponses1[1].replace('"type": "container"', '"type":"container"');
                        String[] objNewDescllist1 = objresponses1[1].split('"type":"container"');
                        objNewDesc1 = '"container_9":' + objNewDescllist1[0] + '"type": "container" },';
                    }

                    String[] objresponses2 = NewWrap.split('"container_5":');
                    if (objresponses2.size() > 1) {
                        objresponses2[1] = objresponses2[1].replace('"type": "container"', '"type":"container"');
                        String[] objNewDescllist2 = objresponses2[1].split('"type":"container"');
                        objNewDesc2 = '"container_5":' + objNewDescllist2[0] + '"type": "container" },';
                    }

                    for (integer i = 1; i <= 100; i++) {
                        String[] FilKPIresponsesImg = responseBody.split('"image_' + i + '":');
                        if (FilKPIresponsesImg.size() > 1 && !NewWrap.contains('"image_' + i + '":')) {
                            String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"image"');
                            if (NewDBS == null || NewDBS == '') {
                                NewDBS = '"image_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "image" },';
                            }
                            else {
                                NewDBS += '"image_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "image" },';
                            }
                        }
                        if (NewWrap.contains('"image_' + i + '":') && FilKPIresponsesImg.size() > 1) {
                            String[] objresponsescon = NewWrap.split('"image_' + i + '":');
                            objresponsescon[1] = objresponsescon[1].replace('"type": "image"', '"type":"image"');
                            String[] objNewDescllistcon = objresponsescon[1].split('"type":"image"');
                            String objNewDesccon = '"image_' + i + '":' + objNewDescllistcon[0] + '"type": "image" },';

                            String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"image"');
                            String NewDBScon = '"image_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "image" },';
                            NewWrap = NewWrap.replace(objNewDesccon, NewDBScon);
                        }
                        if (NewWrap.contains('"image_' + i + '":') && !responseBody.contains('"image_' + i + '":')) {
                            String[] objresponsescon = NewWrap.split('"image_' + i + '":');
                            objresponsescon[1] = objresponsescon[1].replace('"type": "image"', '"type":"image"');
                            String[] objNewDescllistcon = objresponsescon[1].split('"type":"image"');
                            String objNewDesccon = '"image_' + i + '":' + objNewDescllistcon[0] + '"type": "image" },';
                            NewWrap = NewWrap.replace(objNewDesccon, '');
                        }

                    }
                    for (integer i = 6; i <= 100; i++) {
                        String[] FilKPIresponsesImg = responseBody.split('"container_' + i + '":');
                        if (FilKPIresponsesImg.size() > 1 && !NewWrap.contains('"container_' + i + '":')) {
                            String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"container"');
                            if (NewDBS == null || NewDBS == '') {
                                NewDBS = '"container_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "container" },';
                            }
                            else {
                                NewDBS += '"container_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "container" },';
                            }
                        }
                        if (NewWrap.contains('"container_' + i + '":') && FilKPIresponsesImg.size() > 1) {
                            String[] objresponsescon = NewWrap.split('"container_' + i + '":');
                            objresponsescon[1] = objresponsescon[1].replace('"type": "container"', '"type":"container"');
                            String[] objNewDescllistcon = objresponsescon[1].split('"type":"container"');
                            String objNewDesccon = '"container_' + i + '":' + objNewDescllistcon[0] + '"type": "container" },';


                            String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"container"');
                            String NewDBScon = '"container_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "container" },';

                            NewWrap = NewWrap.replace(objNewDesccon, NewDBScon);
                        }
                        if (NewWrap.contains('"container_' + i + '":') && !responseBody.contains('"container_' + i + '":')) {
                            String[] objresponsescon = NewWrap.split('"container_' + i + '":');
                            objresponsescon[1] = objresponsescon[1].replace('"type": "container"', '"type":"container"');
                            String[] objNewDescllistcon = objresponsescon[1].split('"type":"container"');
                            String objNewDesccon = '"container_' + i + '":' + objNewDescllistcon[0] + '"type": "container" },';
                            NewWrap = NewWrap.replace(objNewDesccon, '');
                        }

                    }

                    String[] FilobjAct1 = NewWrap.split('"text_1":');
                    if (FilobjAct1.size() > 1) {
                        FilobjAct1[1] = FilobjAct1[1].replace('"type": "text"', '"type":"text"');
                        String[] FilAct1 = FilobjAct1[1].split('"type":"text"');
                        TextFilobjAct1 = '"text_1":' + FilAct1[0] + '"type": "text" },';
                    }

                    String[] FilobjAct2 = NewWrap.split('"text_2":');
                    if (FilobjAct2.size() > 1) {
                        FilobjAct2[1] = FilobjAct2[1].replace('"type": "text"', '"type":"text"');
                        String[] FilAct2 = FilobjAct2[1].split('"type":"text"');
                        TextFilobjAct2 = '"text_2":' + FilAct2[0] + '"type": "text" },';
                    }

                    String[] FilobjAct3 = NewWrap.split('"text_3":');
                    if (FilobjAct3.size() > 1) {
                        FilobjAct3[1] = FilobjAct3[1].replace('"type": "text"', '"type":"text"');
                        String[] FilAct3 = FilobjAct3[1].split('"type":"text"');
                        TextFilobjAct3 = '"text_3":' + FilAct3[0] + '"type": "text" },';
                    }


                    String[] FilobjAct4 = NewWrap.split('"text_4":');
                    if (FilobjAct4.size() > 1) {
                        FilobjAct4[1] = FilobjAct4[1].replace('"type": "text"', '"type":"text"');
                        String[] FilAct4 = FilobjAct4[1].split('"type":"text"');
                        TextFilobjAct4 = '"text_4":' + FilAct4[0] + '"type": "text" },';
                    }
                    NewWrap = NewWrap.replace('"widgets":{', '"widgets": {');
                    NewWrap = NewWrap.replace('"widgets": {', '"widgets": {' + NewDBS);
                    NewWrap = NewWrap.replace(objNewDesc, ActNewDesc);
                    NewWrap = NewWrap.replace(objNewDesc1, ActNewDesc1);
                    NewWrap = NewWrap.replace(objNewDesc2, ActNewDesc2);
                    NewWrap = NewWrap.replace(TextFilobjAct1, Actualtext1).replace(TextFilobjAct2, Actualtext2);
                    NewWrap = NewWrap.replace(TextFilobjAct3, Actualtext3).replace(TextFilobjAct4, Actualtext4);
                    NewWrap = Newwrap.replace('&quot;', '\\"');
                    if (NewSales[0].Sales_Insight_String4__c == null || NewSales[0].Sales_Insight_String4__c == '') {
                        NewSales[0].Sales_Insight_String3__c = NewWrap;
                    }
                    else {
                        NewSales[0].Sales_Insight_String4__c = NewWrap;
                    }
                }


                if (NewSales[0].Dashboard_Type__c != 'Sales Insights') {
                    NewSales[0].Sales_Insight_String2__c = Rs;
                }
                else {
                    //   NewSales[0].Sales_Insight_String1__c = '{ "label": "#InsightComplete#",  "folder": { "id": "00l36000000PcfKAAS" }, "state": {'+Rs;
                    //   NewSales[0].Sales_Insight_String4__c = '{ "label": "#InsightComplete#",  "folder": { "id": "00l36000000PcfKAAS" }, "state": {'+Rs;
                    //   String NewRs = '{"colspan":6,"column":18,"name":"link_4","row":1,"rowspan":1,"widgetStyle":{"backgroundColor":"#F2F6FA","borderColor":"rgb(68, 162, 245)","borderEdges":["top"],"borderRadius":0,"borderWidth":4}}';
                    //   String NewRs1 = '{"colspan":6,"column":6,"name":"link_2","row":1,"rowspan":1,"widgetStyle":{"backgroundColor":"#FFFFFF","borderColor":"rgb(46, 194, 186)","borderEdges":["top"],"borderRadius":0,"borderWidth":4}}';
                    //   String NewRsRep = '{"colspan":6,"column":18,"name":"link_4","row":1,"rowspan":1,"widgetStyle":{"backgroundColor":"#FFFFFF","borderColor":"rgb(68, 162, 245)","borderEdges":["top"],"borderRadius":0,"borderWidth":4}}';
                    //   String NewRsRep1 = '{"colspan":6,"column":6,"name":"link_2","row":1,"rowspan":1,"widgetStyle":{"backgroundColor":"#F2F6FA","borderColor":"rgb(46, 194, 186)","borderEdges":["top"],"borderRadius":0,"borderWidth":4}}';
                    //   String NewRs3 = '{"colspan":6,"column":12,"name":"link_3","row":1,"rowspan":1,"widgetStyle":{"backgroundColor":"#F2F6FA","borderColor":"rgb(146, 113, 232)","borderEdges":["top"],"borderRadius":0,"borderWidth":4}}';
                    //   String NewRsRep3 = '{"colspan":6,"column":12,"name":"link_3","row":1,"rowspan":1,"widgetStyle":{"backgroundColor":"#FFFFFF","borderColor":"rgb(146, 113, 232)","borderEdges":["top"],"borderRadius":0,"borderWidth":4}}';
                    //   NewSales[0].Sales_Insight_String4__c = NewSales[0].Sales_Insight_String4__c.replace(NewRs,NewRsRep).replace(NewRs1,NewRsRep1);
                    //   NewSales[0].Sales_Insight_String5__c = '{ "label": "#InsightComplete#",  "folder": { "id": "00l36000000PcfKAAS" }, "state": {'+Rs;
                    //   NewSales[0].Sales_Insight_String5__c = NewSales[0].Sales_Insight_String5__c.replace(NewRs3,NewRsRep3).replace(NewRs1,NewRsRep1);

                }

                //DashId[0].Is_Updated__c = true;
                System.debug('NewWrap *******************' + NewSales);
            }

            if (!Test.isRunningTest())
            update NewSales;
        }
        //Complete_Dashboard_Backup_BatchClass_AC Clss = new Complete_Dashboard_Backup_BatchClass_AC(NewIds,Str);
        //database.executeBatch(Clss,1);                                                                   
    }

    public void NewDashboardsSingle1(String Allval) {


        list<Json_class__c> NewJson = [select id, Name, Json1__c, Json3__c, Json_String__c, Json2__c, Dashboard_Id__c from Json_class__c
                                       where id = :Allval];



        String Str = userInfo.getSessionId();

        String mulText1 = '', mulText2 = '', mulText3 = '', mulText4 = '', mulText5 = '', mulText6 = '', mulText7 = '';
        String mulText8 = '', mulText9 = '', mulText10 = '', mulText11 = '', mulText12 = '', mulText13 = '', mulText14 = '';
        String mulText15 = '', mulText16 = '', mulText21 = '';

        String selmulText1 = '', selmulText2 = '', selmulText3 = '', selmulText4 = '', selmulText5 = '', selmulText6 = '', selmulText7 = '';
        String selmulText8 = '', selmulText9 = '', selmulText10 = '', selmulText11 = '', selmulText12 = '', selmulText13 = '', selmulText14 = '';
        String selmulText15 = '', selmulText16 = '', selmulText21 = '';
        String NewDesc = '', NewDesc1 = '', NewDesc3 = '', NewDesc4 = '', NewDesc5 = '';
        if (NewJson.size() > 0) {

            HttpResponse hRes = SingleKPI_DashboardService.retriveDashboardFile(NewJson[0].Dashboard_Id__c, Str);
            String responseBody;
            if (!Test.isRunningTest()) {
                responseBody = hRes.getBody();
            }
            else {
                responseBody = NewJson[0].Json_String__c + NewJson[0].Json1__c + NewJson[0].Json2__c + NewJson[0].Json3__c;
            }
            if (hRes.getStatus() == 'OK' || Test.isRunningTest()) {
                String NewWrap;
                String NewDBS = '';
                Newwrap = NewJson[0].Json3__c;
                for (integer i = 1; i <= 21; i++) {
                    if (responseBody.contains('"text_' + i + '":')) {
                        String[] responsess = responseBody.split('"text_' + i + '":');
                        if (responsess.size() > 1) {
                            responsess[1] = responsess[1].replace('"type": "text"', '"type":"text"');
                            String[] NewDescllists = responsess[1].split('"type":"text"');
                            if (i == 1) {
                                selmulText1 = '"text_' + i + '":' + NewDescllists[0];
                            }
                            else if (i == 2) {
                                selmulText2 = '"text_' + i + '":' + NewDescllists[0];
                            }
                            else if (i == 3) {
                                selmulText3 = '"text_' + i + '":' + NewDescllists[0];
                            }
                            else if (i == 4) {
                                selmulText4 = '"text_' + i + '":' + NewDescllists[0];
                            }
                            else if (i == 5) {
                                selmulText5 = '"text_' + i + '":' + NewDescllists[0];
                            }
                            else if (i == 6) {
                                selmulText6 = '"text_' + i + '":' + NewDescllists[0];
                            }
                            else if (i == 7) {
                                selmulText7 = '"text_' + i + '":' + NewDescllists[0];
                            }
                            else if (i == 8) {
                                selmulText8 = '"text_' + i + '":' + NewDescllists[0];
                            }
                            else if (i == 9) {
                                selmulText9 = '"text_' + i + '":' + NewDescllists[0];
                            }
                            else if (i == 10) {
                                selmulText10 = '"text_' + i + '":' + NewDescllists[0];
                            }
                            else if (i == 11) {
                                selmulText11 = '"text_' + i + '":' + NewDescllists[0];
                            }
                            else if (i == 12) {
                                selmulText12 = '"text_' + i + '":' + NewDescllists[0];
                            }
                            else if (i == 13) {
                                selmulText13 = '"text_' + i + '":' + NewDescllists[0];
                            }
                            else if (i == 14) {
                                selmulText14 = '"text_' + i + '":' + NewDescllists[0];
                            }
                            else if (i == 15) {
                                selmulText15 = '"text_' + i + '":' + NewDescllists[0];
                            }
                            else if (i == 16) {
                                selmulText16 = '"text_' + i + '":' + NewDescllists[0];
                            }
                            else if (i == 21) {
                                selmulText21 = '"text_' + i + '":' + NewDescllists[0];
                            }
                        }
                    }
                }


                String[] responseBodylist = responseBody.split('"layouts":');
                String[] responses = responseBody.split('"container_1":');
                if (responses.size() > 1) {
                    String[] NewDescllist = responses[1].split('"type":"container"');
                    NewDesc = '"container_1":' + NewDescllist[0];
                }
                String[] responses1 = responseBody.split('"container_2":');
                if (responses1.size() > 1) {
                    String[] NewDescllist1 = responses1[1].split('"type":"container"');
                    NewDesc1 = '"container_2":' + NewDescllist1[0];
                }



                String[] responses3 = responseBody.split('"container_4":');
                if (responses3.size() > 1) {
                    String[] NewDescllist3 = responses3[1].split('"type":"container"');
                    NewDesc3 = '"container_4":' + NewDescllist3[0];
                }

                String[] responses4 = responseBody.split('"container_5":');
                if (responses4.size() > 1) {
                    String[] NewDescllist4 = responses4[1].split('"type":"container"');
                    NewDesc4 = '"container_5":' + NewDescllist4[0];
                }

                String[] responses5 = responseBody.split('"container_6":');
                if (responses5.size() > 1) {
                    String[] NewDescllist5 = responses5[1].split('"type":"container"');
                    NewDesc5 = '"container_6":' + NewDescllist5[0];
                }
                String Res = responseBodylist[0];
                String[] Reslst = Res.split('"gridLayouts":');
                String Rs = '"gridLayouts": ' + Reslst[1];
                Rs = Rs.replace('"name":"83a16e97-9cd6-448d-b057-7ec6ba78f6a0",', '');
                // Rs = Rs.replace('"name":"03942376-0b77-4993-875d-3521ff42e2a8",','');
                Rs = Rs.replace('"label":"Untitled",', '');
                String MulNewDesc5 = '', MulNewDesc4 = '', MulNewDesc3 = '', MulNewDesc1 = '', MulNewDesc = '';
                if (Newwrap != Null) {



                    for (integer i = 1; i <= 21; i++) {
                        if (NewWrap.contains('"text_' + i + '":')) {
                            String[] responsess = Newwrap.split('"text_' + i + '":');
                            if (responsess.size() > 1) {
                                responsess[1] = responsess[1].replace('"type": "text"', '"type":"text"');
                                String[] NewDescllists = responsess[1].split('"type":"text"');
                                if (i == 1) {
                                    mulText1 = '"text_' + i + '":' + NewDescllists[0];
                                }
                                else if (i == 2) {
                                    mulText2 = '"text_' + i + '":' + NewDescllists[0];
                                }
                                else if (i == 3) {
                                    mulText3 = '"text_' + i + '":' + NewDescllists[0];
                                }
                                else if (i == 4) {
                                    mulText4 = '"text_' + i + '":' + NewDescllists[0];
                                }
                                else if (i == 5) {
                                    mulText5 = '"text_' + i + '":' + NewDescllists[0];
                                }
                                else if (i == 6) {
                                    mulText6 = '"text_' + i + '":' + NewDescllists[0];
                                }
                                else if (i == 7) {
                                    mulText7 = '"text_' + i + '":' + NewDescllists[0];
                                }
                                else if (i == 8) {
                                    mulText8 = '"text_' + i + '":' + NewDescllists[0];
                                }
                                else if (i == 9) {
                                    mulText9 = '"text_' + i + '":' + NewDescllists[0];
                                }
                                else if (i == 10) {
                                    mulText10 = '"text_' + i + '":' + NewDescllists[0];
                                }
                                else if (i == 11) {
                                    mulText11 = '"text_' + i + '":' + NewDescllists[0];
                                }
                                else if (i == 12) {
                                    mulText12 = '"text_' + i + '":' + NewDescllists[0];
                                }
                                else if (i == 13) {
                                    mulText13 = '"text_' + i + '":' + NewDescllists[0];
                                }
                                else if (i == 14) {
                                    mulText14 = '"text_' + i + '":' + NewDescllists[0];
                                }
                                else if (i == 15) {
                                    mulText15 = '"text_' + i + '":' + NewDescllists[0];
                                }
                                else if (i == 16) {
                                    mulText16 = '"text_' + i + '":' + NewDescllists[0];
                                }
                                else if (i == 21) {
                                    mulText21 = '"text_' + i + '":' + NewDescllists[0];
                                }
                            }
                        }
                    }


                    String[] responsess = Newwrap.split('"container_1":');
                    if (responsess.size() > 1) {
                        responsess[1] = responsess[1].replace('"type": "container"', '"type":"container"');
                        String[] NewDescllists = responsess[1].split('"type":"container"');
                        MulNewDesc = '"container_1":' + NewDescllists[0];
                    }
                    String[] responsess1 = Newwrap.split('"container_2":');
                    if (responsess1.size() > 1) {
                        responsess1[1] = responsess1[1].replace('"type": "container"', '"type":"container"');
                        String[] NewDescllists1 = responsess1[1].split('"type":"container"');
                        MulNewDesc1 = '"container_2":' + NewDescllists1[0];
                    }


                    String[] responsess3 = Newwrap.split('"container_4":');
                    if (responsess3.size() > 1) {
                        responsess3[1] = responsess3[1].replace('"type": "container"', '"type":"container"');
                        String[] NewDescllists3 = responsess3[1].split('"type":"container"');
                        MulNewDesc3 = '"container_4":' + NewDescllists3[0];
                    }


                    String[] responsess4 = Newwrap.split('"container_5":');
                    if (responsess4.size() > 1) {
                        responsess4[1] = responsess4[1].replace('"type": "container"', '"type":"container"');
                        String[] NewDescllists4 = responsess4[1].split('"type":"container"');
                        MulNewDesc4 = '"container_5":' + NewDescllists4[0];
                    }


                    String[] responsess5 = Newwrap.split('"container_6":');
                    if (responsess5.size() > 1) {
                        responsess5[1] = responsess5[1].replace('"type": "container"', '"type":"container"');
                        String[] NewDescllists5 = responsess5[1].split('"type":"container"');
                        MulNewDesc5 = '"container_6":' + NewDescllists5[0];
                    }
                    for (integer i = 1; i <= 100; i++) {
                        String[] FilKPIresponsesImg = responseBody.split('"image_' + i + '":');
                        if (FilKPIresponsesImg.size() > 1 && !NewWrap.contains('"image_' + i + '":')) {
                            String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"image"');
                            if (NewDBS == null || NewDBS == '') {
                                NewDBS = '"image_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "image" },';
                            }
                            else {
                                NewDBS += '"image_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "image" },';
                            }
                        }
                        if (NewWrap.contains('"image_' + i + '":') && FilKPIresponsesImg.size() > 1) {
                            String[] objresponsescon = NewWrap.split('"image_' + i + '":');
                            objresponsescon[1] = objresponsescon[1].replace('"type": "image"', '"type":"image"');
                            String[] objNewDescllistcon = objresponsescon[1].split('"type":"image"');
                            String objNewDesccon = '"image_' + i + '":' + objNewDescllistcon[0] + '"type": "image" },';

                            String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"image"');
                            String NewDBScon = '"image_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "image" },';
                            NewWrap = NewWrap.replace(objNewDesccon, NewDBScon);
                        }
                        if (NewWrap.contains('"image_' + i + '":') && !responseBody.contains('"image_' + i + '":')) {
                            String[] objresponsescon = NewWrap.split('"image_' + i + '":');
                            objresponsescon[1] = objresponsescon[1].replace('"type": "image"', '"type":"image"');
                            String[] objNewDescllistcon = objresponsescon[1].split('"type":"image"');
                            String objNewDesccon = '"image_' + i + '":' + objNewDescllistcon[0] + '"type": "image" },';
                            NewWrap = NewWrap.replace(objNewDesccon, '');
                        }

                    }



                    String[] FilKPIresponsesImgs = responseBody.split('"container_3":');
                    if (FilKPIresponsesImgs.size() > 1 && !NewWrap.contains('"container_3":')) {
                        String[] FilKPINewDescllistImg = FilKPIresponsesImgs[1].split('"type":"container"');
                        if (NewDBS == null || NewDBS == '') {
                            NewDBS = '"container_3":' + FilKPINewDescllistImg[0] + '"type": "container" },';
                        }
                        else {
                            NewDBS += '"container_3":' + FilKPINewDescllistImg[0] + '"type": "container" },';
                        }
                    }
                    if (NewWrap.contains('"container_3":') && FilKPIresponsesImgs.size() > 1) {
                        String[] objresponsescon = NewWrap.split('"container_3":');
                        objresponsescon[1] = objresponsescon[1].replace('"type": "container"', '"type":"container"');
                        String[] objNewDescllistcon = objresponsescon[1].split('"type":"container"');
                        String objNewDesccon = '"container_3":' + objNewDescllistcon[0] + '"type": "container" },';


                        String[] FilKPINewDescllistImg = FilKPIresponsesImgs[1].split('"type":"container"');
                        String NewDBScon = '"container_3":' + FilKPINewDescllistImg[0] + '"type": "container" },';

                        NewWrap = NewWrap.replace(objNewDesccon, NewDBScon);
                    }
                    if (NewWrap.contains('"container_3":') && !responseBody.contains('"container_3":')) {
                        String[] objresponsescon = NewWrap.split('"container_3":');
                        objresponsescon[1] = objresponsescon[1].replace('"type": "container"', '"type":"container"');
                        String[] objNewDescllistcon = objresponsescon[1].split('"type":"container"');
                        String objNewDesccon = '"container_3":' + objNewDescllistcon[0] + '"type": "container" },';
                        NewWrap = NewWrap.replace(objNewDesccon, '');
                    }


                    for (integer i = 7; i <= 100; i++) {
                        String[] FilKPIresponsesImg = responseBody.split('"container_' + i + '":');
                        if (FilKPIresponsesImg.size() > 1 && !NewWrap.contains('"container_' + i + '":')) {
                            String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"container"');
                            if (NewDBS == null || NewDBS == '') {
                                NewDBS = '"container_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "container" },';
                            }
                            else {
                                NewDBS += '"container_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "container" },';
                            }
                        }
                        if (NewWrap.contains('"container_' + i + '":') && FilKPIresponsesImg.size() > 1) {
                            String[] objresponsescon = NewWrap.split('"container_' + i + '":');
                            objresponsescon[1] = objresponsescon[1].replace('"type": "container"', '"type":"container"');
                            String[] objNewDescllistcon = objresponsescon[1].split('"type":"container"');
                            String objNewDesccon = '"container_' + i + '":' + objNewDescllistcon[0] + '"type": "container" },';


                            String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"container"');
                            String NewDBScon = '"container_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "container" },';

                            NewWrap = NewWrap.replace(objNewDesccon, NewDBScon);
                        }
                        if (NewWrap.contains('"container_' + i + '":') && !responseBody.contains('"container_' + i + '":')) {
                            String[] objresponsescon = NewWrap.split('"container_' + i + '":');
                            objresponsescon[1] = objresponsescon[1].replace('"type": "container"', '"type":"container"');
                            String[] objNewDescllistcon = objresponsescon[1].split('"type":"container"');
                            String objNewDesccon = '"container_' + i + '":' + objNewDescllistcon[0] + '"type": "container" },';
                            NewWrap = NewWrap.replace(objNewDesccon, '');
                        }

                    }
                    NewWrap = NewWrap.replace('"widgets":{', '"widgets": {');
                    NewWrap = NewWrap.replace('"widgets": {', '"widgets": {' + NewDBS);

                    Newwrap = Newwrap.replace(MulNewDesc, NewDesc);
                    Newwrap = Newwrap.replace(MulNewDesc1, NewDesc1);

                    Newwrap = Newwrap.replace(MulNewDesc3, NewDesc3);
                    Newwrap = Newwrap.replace(MulNewDesc4, NewDesc4);
                    Newwrap = Newwrap.replace(MulNewDesc5, NewDesc5);
                    Newwrap = Newwrap.replace(mulText1, selmulText1);
                    Newwrap = Newwrap.replace(mulText2, selmulText2);
                    Newwrap = Newwrap.replace(mulText3, selmulText3);
                    Newwrap = Newwrap.replace(mulText4, selmulText4);
                    Newwrap = Newwrap.replace(mulText5, selmulText5);
                    Newwrap = Newwrap.replace(mulText6, selmulText6);
                    Newwrap = Newwrap.replace(mulText7, selmulText7);
                    Newwrap = Newwrap.replace(mulText8, selmulText8);
                    Newwrap = Newwrap.replace(mulText9, selmulText9);
                    Newwrap = Newwrap.replace(mulText10, selmulText10);
                    Newwrap = Newwrap.replace(mulText11, selmulText11);
                    Newwrap = Newwrap.replace(mulText12, selmulText12);
                    Newwrap = Newwrap.replace(mulText13, selmulText13);
                    Newwrap = Newwrap.replace(mulText14, selmulText14);
                    Newwrap = Newwrap.replace(mulText15, selmulText15);
                    Newwrap = Newwrap.replace(mulText16, selmulText16);
                    Newwrap = Newwrap.replace(mulText21, selmulText21);

                    // if(MulNewDesc4)
                }
                NewJson[0].analyticscc__Json3__c = Newwrap;
                NewJson[0].analyticscc__Json1__c = Rs;
            }

            if (Newjson[0].Dashboard_Id__c != null && Newjson[0].Dashboard_Id__c != '') {
                list<Sales_Insight__c> NewJsons = [select id, Name, Dashboard_Id__c, Dashboard_Type__c from Sales_Insight__c
                                                   where Dashboard_Id__c = :Newjson[0].Dashboard_Id__c and Dashboard_Type__c = 'Sales Insights' limit 1];
                list<Sales_Insight__c> NewJsons1 = [select id, Name, Dashboard_Id__c, Dashboard_Type__c from Sales_Insight__c
                                                    where Dashboard_Id__c = :Newjson[0].Dashboard_Id__c and Dashboard_Type__c = 'Success Insight' limit 1];

                list<Sales_Insight__c> NewJsons2 = [select id, Name, Dashboard_Id__c, Dashboard_Type__c from Sales_Insight__c
                                                    where Dashboard_Id__c = :Newjson[0].Dashboard_Id__c and Dashboard_Type__c = 'Marketing Insight' limit 1];
                system.debug('NewJsons ******************' + NewJsons);
                set<String> StrList = new set<String> ();
                set<String> StrList1 = new set<String> ();
                list<String> Sales = new list<String> ();
                list<Sales_Insight__c> SldsNewlist = new list<Sales_Insight__c> ();
                list<Sales_Insight__c> SldsNewlists = new list<Sales_Insight__c> ();
                list<Sales_Insight__c> SldsNewlists1 = new list<Sales_Insight__c> ();
                list<Sales_Insight__c> SldsNewlists2 = new list<Sales_Insight__c> ();
                string sessionIds = userinfo.getSessionId();
                if (NewJsons.size() > 0) {
                    NewDashboardSingle(NewJsons[0].Id, sessionIds);
                    NewDashboardSingle4(NewJsons[0].Id, sessionIds);
                    NewDashboardSingle2(NewJsons[0].Id, sessionIds);
                    NewDashboardSingle3(NewJsons[0].Id, sessionIds);
                    //NewDashboardSingle5(NewJsons[0].Id,sessionIds);
                }
                if (NewJsons1.size() > 0) {
                    NewDashboardSingle(NewJsons1[0].Id, sessionIds);
                    NewDashboardSingle4(NewJsons1[0].Id, sessionIds);
                    NewDashboardSingle2(NewJsons1[0].Id, sessionIds);
                    NewDashboardSingle3(NewJsons1[0].Id, sessionIds);
                    //NewDashboardSingle5(NewJsons1[0].Id,sessionIds);
                }

                if (NewJsons2.size() > 0) {
                    NewDashboardSingle(NewJsons2[0].Id, sessionIds);
                    NewDashboardSingle4(NewJsons2[0].Id, sessionIds);
                    NewDashboardSingle2(NewJsons2[0].Id, sessionIds);
                    NewDashboardSingle3(NewJsons2[0].Id, sessionIds);
                    //NewDashboardSingle5(NewJsons2[0].Id,sessionIds);
                }

                if (NewJsons.size() > 0) {
                    NewDashboardSingle5(NewJsons[0].Id, sessionIds);
                }
                if (NewJsons1.size() > 0) {
                    NewDashboardSingle5(NewJsons1[0].Id, sessionIds);
                }
                if (NewJsons2.size() > 0) {
                    NewDashboardSingle5(NewJsons2[0].Id, sessionIds);
                }

            }
        }

        if (!Test.isRunningTest())
        update NewJson;
    }

    //private transient String Newwrap;
    @Future(callout = true)
    private static void NewDashboardSingle(String Allval, String sessionIds) {
        list<Sales_Insight__c> NewSaleslist = [select id, Name, Dashboard_Id__c, Dashboard_Type__c, DataSet_Delete__c, Sales_insight_String5__c, Delete_All_Group__c, Delete_All_Orders__c, Sales_KPI_Delete__c, Number_Delete1__c, ListSelector__c, Lis_Selector36__c, Sales_insight_Day_Delete__c, Sales_Insight_String2__c, Sales_Insight_String3__c, Grouping_label_Delete__c, Grouping_Delete__c, Measures_Delete__c, Sales_Insight_String4__c, List_Selector53__c, Sales_insight_String1__c from Sales_Insight__c where id = :Allval limit 1];
        transient String Str = sessionIds;
        Sales_Insight__c Sales = new Sales_Insight__c();
        if (NewSaleslist.size() > 0) {
            for (Sales_Insight__c slds : NewSaleslist) {
                HttpResponse hRes = SingleKPI_DashboardService.retriveDashboardFile(slds.Name, Str);
                transient String responseBody;

                if (!Test.isRunningTest()) {
                    responseBody = hRes.getBody();
                }
                else {
                    list<Sales_Insight__c> Saleslist = [select id, Name, Sales_Insight_String2__c, Sales_Insight_String3__c, Sales_Insight_String4__c, Sales_insight_String1__c from Sales_Insight__c where Name = 'Theme For NewSalesSight' limit 1];
                    responseBody = Saleslist[0].Sales_Insight_String1__c + Saleslist[0].Sales_insight_String2__c + Saleslist[0].Sales_Insight_String3__c;
                }
                if (hRes.getStatus() == 'OK' || Test.isRunningTest()) {
                    responseBody = responseBody.replace('"widgets": {', '"widgets":{');
                    responseBody = responseBody.replace('"widgets":{', '"widgets":splx');
                    responseBody = responseBody.replace('"widgets": splx', '"widgets":splx');
                    transient String[] responseBodylistss = responseBody.split('"widgets":splx');
                    responseBody = '"widgets": {' + responseBodylistss[1];
                    transient String objNewDesc1 = '', objNewDesc3 = '', objNewDesc4 = '', objNewDescKPI2 = '', NewDescKPI2 = '';
                    transient String objKPINewDesc1KPI5 = '';
                    //transient String objKPINewDesc2KPI5 = '';
                    transient String objKPINewDesc3KPI5 = '';
                    transient String objKPINewDesc4KPI5 = '';
                    transient String objNewDescKPI3 = '';
                    transient String objNewDesc2KPI2 = '';
                    transient String objNewDesc3KPI3 = '', objNewDesc3KPI4 = '';
                    transient String FilobjKPINewDesc3 = '', FilobjKPINewDesc4 = '', FilobjKPINewDesc5 = '', FilobjKPINewDesc6 = '', FilobjKPINewDesc7 = '';
                    transient String FilobjKPINewDescMeas = '', FilobjKPINewDescSort = '';
                    transient String NewDesc1 = '', NewDesc3 = '', NewDesc4 = '';
                    transient String NewDesc2KPI2 = '';
                    transient String NewDesc3KPI3 = '', NewDesc3KPI4 = '';
                    transient String NewDescKPI3 = '';
                    transient String KPINewDesc1KPI5 = '';
                    transient String KPINewDesc2KPI5 = '';
                    transient String KPINewDesc3KPI5 = '';
                    transient String KPINewDesc4KPI5 = '';
                    transient String FilNewDesc3 = '', FilNewDesc4 = '', FilNewDesc5 = '', FilNewDesc6 = '', FilNewDesc7 = '';
                    transient String FilNewDescMeas = '', FilNewDescSort = '';
                    transient String Newwrap = '';


                    NewWrap = Slds.Grouping_label_Delete__c.replaceAll('\\s+\\s+', '#testcode#').replaceAll('#testcode#', ' ');
                    transient String[] responses1 = responseBody.split('"Filters_Container":');
                    if (responses1.size() > 1) {
                        transient String[] NewDescllist1 = responses1[1].split('"type":"container"');
                        NewDesc1 = '"Filters_Container":' + NewDescllist1[0] + '"type": "container" },';
                    }
                    transient String[] objresponses1 = NewWrap.split('"Filters_Container":');
                    if (objresponses1.size() > 1) {
                        objresponses1[1] = objresponses1[1].replace('"type": "container"', '"type":"container"');
                        transient String[] objNewDescllist1 = objresponses1[1].split('"type":"container"');
                        objNewDesc1 = '"Filters_Container":' + objNewDescllist1[0] + '"type": "container" },';
                    }

                    transient String[] responses4 = responseBody.split('"Groupings_Container":');
                    if (responses4.size() > 1) {
                        transient String[] NewDescllist4 = responses4[1].split('"type":"container"');
                        NewDesc4 = '"Groupings_Container":' + NewDescllist4[0] + '"type": "container" },';
                    }
                    transient String[] objresponses4 = NewWrap.split('"Groupings_Container":');
                    if (objresponses4.size() > 1) {
                        objresponses4[1] = objresponses4[1].replace('"type": "container"', '"type":"container"');
                        transient String[] objNewDescllist4 = objresponses4[1].split('"type":"container"');
                        objNewDesc4 = '"Groupings_Container":' + objNewDescllist4[0] + '"type": "container" },';
                    }


                    transient String[] FilKPIresponses6 = responseBody.split('"Dashboard_Title":');
                    if (FilKPIresponses6.size() > 1) {
                        transient String[] FilKPINewDescllist6 = FilKPIresponses6[1].split('"type":"text"');
                        transient String[] NewFilobj = FilKPINewDescllist6[0].split('"text":');
                        transient String[] StrNewFilobj = NewFilobj[1].split(',');
                        FilKPINewDescllist6[0] = FilKPINewDescllist6[0].replace(StrNewFilobj[0], '"Dashboard Title"');
                        FilNewDesc6 = '"Dashboard_Title":' + FilKPINewDescllist6[0] + '"type": "text" },';
                    }

                    transient String[] FilobjKPIresponses6 = NewWrap.split('"Dashboard_Title":');
                    if (FilobjKPIresponses6.size() > 1) {
                        FilobjKPIresponses6[1] = FilobjKPIresponses6[1].replace('"type": "text"', '"type":"text"');
                        transient String[] FilobjKPINewDescllist6 = FilobjKPIresponses6[1].split('"type":"text"');
                        FilobjKPINewDesc6 = '"Dashboard_Title":' + FilobjKPINewDescllist6[0] + '"type": "text" },';
                    }

                    transient String[] FilKPIresponsesMeas = responseBody.split('"Measure_Text":');
                    if (FilKPIresponsesMeas.size() > 1) {
                        transient String[] FilKPINewDescllistMeas = FilKPIresponsesMeas[1].split('"type":"text"');
                        FilNewDescMeas = '"Measure_Text":' + FilKPINewDescllistMeas[0] + '"type": "text" },';
                    }

                    transient String[] FilobjKPIresponsesMeas = NewWrap.split('"Measure_Text":');
                    if (FilobjKPIresponsesMeas.size() > 1) {
                        FilobjKPIresponsesMeas[1] = FilobjKPIresponsesMeas[1].replace('"type": "text"', '"type":"text"');
                        transient String[] FilobjKPINewDescllistmeas = FilobjKPIresponsesMeas[1].split('"type":"text"');
                        FilobjKPINewDescMeas = '"Measure_Text":' + FilobjKPINewDescllistmeas[0] + '"type": "text" },';
                    }

                    transient String[] FilKPIresponsesSort = responseBody.split('"Sort_Results":');
                    if (FilKPIresponsesSort.size() > 1) {
                        transient String[] FilKPINewDescllistSort = FilKPIresponsesSort[1].split('"type":"text"');
                        FilNewDescSort = '"Sort_Results":' + FilKPINewDescllistSort[0] + '"type": "text" },';
                    }

                    transient String[] FilobjKPIresponsesSort = NewWrap.split('"Sort_Results":');
                    if (FilobjKPIresponsesSort.size() > 1) {
                        FilobjKPIresponsesSort[1] = FilobjKPIresponsesSort[1].replace('"type": "text"', '"type":"text"');
                        transient String[] FilobjKPINewDescllistSort = FilobjKPIresponsesSort[1].split('"type":"text"');
                        FilobjKPINewDescSort = '"Sort_Results":' + FilobjKPINewDescllistSort[0] + '"type": "text" },';
                    }

                    transient String[] objresponsesKPI2 = NewWrap.split('"KPI2_Description_Container":');
                    if (objresponsesKPI2.size() > 1) {
                        objresponsesKPI2[1] = objresponsesKPI2[1].replace('"type": "container"', '"type":"container"');
                        transient String[] objNewDescllistKPI2 = objresponsesKPI2[1].split('"type":"container"');
                        objNewDescKPI2 = '"KPI2_Description_Container":' + objNewDescllistKPI2[0] + '"type": "container" },';
                    }

                    transient String[] responsesKPI2 = responseBody.split('"KPI2_Description_Container":');
                    if (responsesKPI2.size() > 1) {
                        transient String[] NewDescllistKPI2 = responsesKPI2[1].split('"type":"container"');
                        NewDescKPI2 = '"KPI2_Description_Container":' + NewDescllistKPI2[0] + '"type": "container" },';
                    }


                    transient String[] responsesKPI3 = responseBody.split('"KPI3_Description_Container":');
                    if (responsesKPI3.size() > 1) {
                        transient String[] NewDescllistKPI3 = responsesKPI3[1].split('"type":"container"');
                        NewDescKPI3 = '"KPI3_Description_Container":' + NewDescllistKPI3[0] + '"type": "container" },';
                    }

                    transient String[] objresponsesKPI3 = NewWrap.split('"KPI3_Description_Container":');
                    if (objresponsesKPI3.size() > 1) {
                        objresponsesKPI3[1] = objresponsesKPI3[1].replace('"type": "container"', '"type":"container"');
                        transient String[] objNewDescllistKPI3 = objresponsesKPI3[1].split('"type":"container"');
                        objNewDescKPI3 = '"KPI3_Description_Container":' + objNewDescllistKPI3[0] + '"type": "container" },';
                    }

                    transient String[] responses3 = responseBody.split('"KPI1_Chart_Container":');
                    if (responses3.size() > 1) {
                        transient String[] NewDescllist3 = responses3[1].split('"type":"container"');
                        NewDesc3 = '"KPI1_Chart_Container":' + NewDescllist3[0] + '"type": "container" },';
                    }

                    transient String[] objresponses3 = NewWrap.split('"KPI1_Chart_Container":');
                    if (objresponses3.size() > 1) {
                        objresponses3[1] = objresponses3[1].replace('"type": "container"', '"type":"container"');
                        transient String[] objNewDescllist3 = objresponses3[1].split('"type":"container"');
                        objNewDesc3 = '"KPI1_Chart_Container":' + objNewDescllist3[0] + '"type": "container" },';
                    }

                    transient String[] responses3KPI3 = responseBody.split('"KPI3_Chart_Container":');
                    if (responses3KPI3.size() > 1) {
                        transient String[] NewDescllist3KPI3 = responses3KPI3[1].split('"type":"container"');
                        NewDesc3KPI3 = '"KPI3_Chart_Container":' + NewDescllist3KPI3[0] + '"type": "container" },';
                    }

                    transient String[] objresponses3KPI3 = NewWrap.split('"KPI3_Chart_Container":');
                    if (objresponses3KPI3.size() > 1) {
                        objresponses3KPI3[1] = objresponses3KPI3[1].replace('"type": "container"', '"type":"container"');
                        transient String[] objNewDescllist3KPI3 = objresponses3KPI3[1].split('"type":"container"');
                        objNewDesc3KPI3 = '"KPI3_Chart_Container":' + objNewDescllist3KPI3[0] + '"type": "container" },';
                    }

                    transient String[] responses3KPI4 = responseBody.split('"KPI4_Chart_Container":');
                    if (responses3KPI4.size() > 1) {
                        transient String[] NewDescllist3KPI4 = responses3KPI4[1].split('"type":"container"');
                        NewDesc3KPI4 = '"KPI4_Chart_Container":' + NewDescllist3KPI4[0] + '"type": "container" },';
                    }

                    transient String[] objresponses3KPI4 = NewWrap.split('"KPI4_Chart_Container":');
                    if (objresponses3KPI4.size() > 1) {
                        objresponses3KPI4[1] = objresponses3KPI4[1].replace('"type": "container"', '"type":"container"');
                        transient String[] objNewDescllist3KPI4 = objresponses3KPI4[1].split('"type":"container"');
                        objNewDesc3KPI4 = '"KPI4_Chart_Container":' + objNewDescllist3KPI4[0] + '"type": "container" },';
                    }

                    // }

                    transient String KPINewDesc1KPI31 = '';
                    transient String KPINewDesc1KPI32 = '';
                    transient String KPINewDesc1KPI33 = '';
                    transient String KPINewDesc1KPI34 = '';
                    transient String KPINewDesc1KPI35 = '';

                    transient String objKPINewDesc4KPI31 = '';
                    transient String objKPINewDesc4KPI32 = '';
                    transient String objKPINewDesc4KPI33 = '';
                    transient String objKPINewDesc4KPI34 = '';
                    transient String objKPINewDesc4KPI35 = '';


                    transient String[] KPIresponses1KPI31 = responseBody.split('"KPI1_Raw_Details_Title":');
                    if (KPIresponses1KPI31.size() > 1) {
                        transient String[] KPINewDescllist1KPI31 = KPIresponses1KPI31[1].split('"type":"text"');
                        KPINewDesc1KPI31 = '"KPI1_Raw_Details_Title":' + KPINewDescllist1KPI31[0] + '"type": "text" },';
                    }

                    transient String[] KPIresponses1KPI32 = responseBody.split('"KPI2_Raw_Details_Title":');
                    if (KPIresponses1KPI32.size() > 1) {
                        transient String[] KPINewDescllist1KPI32 = KPIresponses1KPI32[1].split('"type":"text"');
                        KPINewDesc1KPI32 = '"KPI2_Raw_Details_Title":' + KPINewDescllist1KPI32[0] + '"type": "text" },';
                    }

                    transient String[] KPIresponses1KPI33 = responseBody.split('"KPI3_Raw_Details_Title":');
                    if (KPIresponses1KPI33.size() > 1) {
                        transient String[] KPINewDescllist1KPI33 = KPIresponses1KPI33[1].split('"type":"text"');
                        KPINewDesc1KPI33 = '"KPI3_Raw_Details_Title":' + KPINewDescllist1KPI33[0] + '"type": "text" },';
                    }

                    transient String[] KPIresponses1KPI34 = responseBody.split('"KPI4_Raw_Details_Title":');
                    if (KPIresponses1KPI34.size() > 1) {
                        transient String[] KPINewDescllist1KPI34 = KPIresponses1KPI34[1].split('"type":"text"');
                        KPINewDesc1KPI34 = '"KPI4_Raw_Details_Title":' + KPINewDescllist1KPI34[0] + '"type": "text" },';
                    }

                    transient String[] KPIresponses1KPI35 = responseBody.split('"KPI5_Raw_Details_Title":');
                    if (KPIresponses1KPI35.size() > 1) {
                        transient String[] KPINewDescllist1KPI35 = KPIresponses1KPI35[1].split('"type":"text"');
                        KPINewDesc1KPI35 = '"KPI5_Raw_Details_Title":' + KPINewDescllist1KPI35[0] + '"type": "text" },';
                    }

                    if (!Test.isRunningTest()) {
                        transient String[] objKPIresponses4KPI31 = NewWrap.split('"KPI1_Raw_Details_Title":');
                        if (objKPIresponses4KPI31.size() > 1) {
                            objKPIresponses4KPI31[1] = objKPIresponses4KPI31[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist4KPI31 = objKPIresponses4KPI31[1].split('"type":"text"');
                            objKPINewDesc4KPI31 = '"KPI1_Raw_Details_Title":' + objKPINewDescllist4KPI31[0] + '"type": "text" },';
                        }

                        transient String[] objKPIresponses4KPI32 = NewWrap.split('"KPI2_Raw_Details_Title":');
                        if (objKPIresponses4KPI32.size() > 1) {
                            objKPIresponses4KPI32[1] = objKPIresponses4KPI32[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist4KPI32 = objKPIresponses4KPI32[1].split('"type":"text"');
                            objKPINewDesc4KPI32 = '"KPI2_Raw_Details_Title":' + objKPINewDescllist4KPI32[0] + '"type": "text" },';
                        }

                        transient String[] objKPIresponses4KPI33 = NewWrap.split('"KPI3_Raw_Details_Title":');
                        if (objKPIresponses4KPI33.size() > 1) {
                            objKPIresponses4KPI33[1] = objKPIresponses4KPI33[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist4KPI33 = objKPIresponses4KPI33[1].split('"type":"text"');
                            objKPINewDesc4KPI33 = '"KPI3_Raw_Details_Title":' + objKPINewDescllist4KPI33[0] + '"type": "text" },';
                        }

                        transient String[] objKPIresponses4KPI34 = NewWrap.split('"KPI4_Raw_Details_Title":');
                        if (objKPIresponses4KPI34.size() > 1) {
                            objKPIresponses4KPI34[1] = objKPIresponses4KPI34[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist4KPI34 = objKPIresponses4KPI34[1].split('"type":"text"');
                            objKPINewDesc4KPI34 = '"KPI4_Raw_Details_Title":' + objKPINewDescllist4KPI34[0] + '"type": "text" },';
                        }

                        transient String[] objKPIresponses4KPI35 = NewWrap.split('"KPI5_Raw_Details_Title":');
                        if (objKPIresponses4KPI35.size() > 1) {
                            objKPIresponses4KPI35[1] = objKPIresponses4KPI35[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist4KPI35 = objKPIresponses4KPI35[1].split('"type":"text"');
                            objKPINewDesc4KPI35 = '"KPI5_Raw_Details_Title":' + objKPINewDescllist4KPI35[0] + '"type": "text" },';
                        }
                        NewWrap = NewWrap.replace(objKPINewDesc4KPI31, KPINewDesc1KPI31);
                        NewWrap = NewWrap.replace(objKPINewDesc4KPI32, KPINewDesc1KPI32);
                        NewWrap = NewWrap.replace(objKPINewDesc4KPI33, KPINewDesc1KPI33);
                        NewWrap = NewWrap.replace(objKPINewDesc4KPI34, KPINewDesc1KPI34);
                        NewWrap = NewWrap.replace(objKPINewDesc4KPI35, KPINewDesc1KPI35);
                    }



                    // } 
                    NewWrap = NewWrap.replace(objNewDesc3, NewDesc3);
                    NewWrap = NewWrap.replace(objNewDesc3KPI3, NewDesc3KPI3);
                    NewWrap = NewWrap.replace(objNewDesc3KPI4, NewDesc3KPI4);

                    NewWrap = NewWrap.replace(objNewDesc1, NewDesc1);
                    NewWrap = NewWrap.replace(objNewDescKPI2, NewDescKPI2);
                    NewWrap = NewWrap.replace(objNewDescKPI3, NewDescKPI3);
                    NewWrap = NewWrap.replace(objNewDesc4, NewDesc4);
                    NewWrap = NewWrap.replace(FilobjKPINewDesc6, FilNewDesc6);
                    NewWrap = NewWrap.replace(FilobjKPINewDesc7, FilNewDesc7);
                    NewWrap = NewWrap.replace(FilobjKPINewDescMeas, FilNewDescMeas).replace(FilobjKPINewDescSort, FilNewDescSort);
                    NewWrap = NewWrap.replace('"type":"text"', '"type": "text"');
                    NewWrap = Newwrap.replace('&quot;', '\\"');
                    if (!Test.isRunningTest()) {
                        Slds.Grouping_label_Delete__c = NewWrap;

                        Sales.id = Slds.Id;
                        Sales.Grouping_label_Delete__c = Slds.Grouping_label_Delete__c;

                    }

                }
            }
            if (Sales.Id != null)
            update Sales;
        }

    }

    @Future(callout = true)
    private static void NewDashboardSingle3(String Allval, String sessionIds) {
        //System.debug('Allval *********** ' + Allval);  
        list<Sales_Insight__c> NewSaleslist = [select id, Name, Dashboard_Id__c, Dashboard_Type__c, DataSet_Delete__c, Sales_insight_String5__c, Delete_All_Group__c, Delete_All_Orders__c, Sales_KPI_Delete__c, Number_Delete1__c, ListSelector__c, Lis_Selector36__c, Sales_insight_Day_Delete__c, Sales_Insight_String2__c, Sales_Insight_String3__c, Grouping_label_Delete__c, Grouping_Delete__c, Measures_Delete__c, Sales_Insight_String4__c, List_Selector53__c, Sales_insight_String1__c from Sales_Insight__c where id = :Allval limit 1];
        transient String Str = sessionIds;
        Sales_Insight__c Sales = new Sales_Insight__c();
        if (NewSaleslist.size() > 0) {
            for (Sales_Insight__c slds : NewSaleslist) {
                HttpResponse hRes = SingleKPI_DashboardService.retriveDashboardFile(slds.Name, Str);
                transient String responseBody;
                if (!Test.isRunningTest()) {
                    responseBody = hRes.getBody();
                }
                else {
                    responseBody = NewSaleslist[0].Sales_insight_String4__c;
                    //}
                    //responseBody= NewSaleslist[0].DataSet_Delete__c +NewSaleslist[0].Sales_Insight_String5__c + NewSaleslist[0].Sales_insight_String2__c + NewSaleslist[0].Sales_insight_String3__c +NewSaleslist[0].Grouping_label_Delete__c + NewSaleslist[0].Sales_insight_String4__c + NewSaleslist[0].Grouping_Delete__c ; 
                }
                //System.debug(hRes.getStatus()+ 'responseBody *********** ' + responseBody);
                if (hRes.getStatus() == 'OK' || Test.isRunningTest()) {
                    transient String[] responseBodylist = responseBody.split('"KPI1_Filter_6":');
                    transient String Res = responseBodylist[1];
                    responseBody = '"KPI1_Filter_6":' + Res;
                    transient String KPINewDesc1 = '';
                    transient String KPINewDesc2 = '';
                    transient String KPINewDesc3 = '';
                    transient String KPINewDesc4 = '';
                    transient String objKPINewDesc1 = '';
                    transient String objKPINewDesc2 = '';
                    transient String objKPINewDesc3 = '';
                    transient String objKPINewDesc4 = '';
                    transient String FilobjKPINewDesc1 = '';
                    transient String FilNewDesc1 = '';
                    transient String FilobjKPINewDesc2 = '';
                    transient String FilNewDesc2 = '';
                    transient String NewDesc = '';
                    transient String objNewDesc = '';
                    transient String NewDescKPI4 = '';
                    transient String objNewDescKPI4 = '';
                    transient String NewDescKPI5 = '';
                    transient String objNewDescKPI5 = '';
                    transient String NewDesc2KPI2 = '';
                    transient String objNewDesc2KPI2 = '';
                    transient String NewDesc2KPI5 = '';
                    transient String objNewDesc2KPI5 = '';
                    transient String NewDesc3KPI2 = '';
                    transient String objNewDesc3KPI2 = '';
                    transient String NewDesc3KPI5 = '';
                    transient String objNewDesc3KPI5 = '';
                    transient String KPINewDesc1KPI2 = '';
                    transient String KPINewDesc2KPI2 = '';
                    transient String KPINewDesc3KPI2 = '';
                    transient String KPINewDesc4KPI2 = '';
                    transient String objKPINewDesc1KPI2 = '';
                    transient String objKPINewDesc2KPI2 = '';
                    transient String objKPINewDesc3KPI2 = '';
                    transient String objKPINewDesc4KPI2 = '';

                    transient String objNewDesc2KPI3 = '';
                    transient String NewDesc2KPI3 = '';
                    transient String Newwrap = '';
                    Newwrap = Slds.Sales_Insight_String4__c.replaceAll('\\s+\\s+', '#testcode#').replaceAll('#testcode#', ' ');
                    transient String[] KPIresponses1 = responseBody.split('"KPI1_KPI_Title_4":');
                    if (KPIresponses1.size() > 1) {
                        transient String[] KPINewDescllist1 = KPIresponses1[1].split('"type":"text"');
                        KPINewDesc1 = '"KPI1_KPI_Title_4":' + KPINewDescllist1[0] + '"type": "text" },';
                    }
                    transient String[] KPIresponses2 = responseBody.split('"KPI1_KPI_Title_3":');
                    if (KPIresponses2.size() > 1) {
                        transient String[] KPINewDescllist2 = KPIresponses2[1].split('"type":"text"');
                        KPINewDesc2 = '"KPI1_KPI_Title_3":' + KPINewDescllist2[0] + '"type": "text" },';
                    }
                    transient String[] KPIresponses3 = responseBody.split('"KPI1_KPI_Title_2":');
                    if (KPIresponses3.size() > 1) {
                        transient String[] KPINewDescllist3 = KPIresponses3[1].split('"type":"text"');
                        KPINewDesc3 = '"KPI1_KPI_Title_2":' + KPINewDescllist3[0] + '"type": "text" },';
                    }
                    transient String[] KPIresponses4 = responseBody.split('"KPI1_KPI_Title_1":');
                    if (KPIresponses4.size() > 1) {
                        transient String[] KPINewDescllist4 = KPIresponses4[1].split('"type":"text"');
                        KPINewDesc4 = '"KPI1_KPI_Title_1":' + KPINewDescllist4[0] + '"type": "text" },';
                    }
                    if (!Test.isRunningTest()) {
                        transient String[] objKPIresponses1 = NewWrap.split('"KPI1_KPI_Title_4":');
                        if (objKPIresponses1.size() > 1) {
                            objKPIresponses1[1] = objKPIresponses1[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist1 = objKPIresponses1[1].split('"type":"text"');
                            objKPINewDesc1 = '"KPI1_KPI_Title_4":' + objKPINewDescllist1[0] + '"type": "text" },';
                        }
                        transient String[] objKPIresponses2 = NewWrap.split('"KPI1_KPI_Title_3":');
                        if (objKPIresponses2.size() > 1) {
                            objKPIresponses2[1] = objKPIresponses2[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist2 = objKPIresponses2[1].split('"type":"text"');
                            objKPINewDesc2 = '"KPI1_KPI_Title_3":' + objKPINewDescllist2[0] + '"type": "text" },';
                        }
                        transient String[] objKPIresponses3 = NewWrap.split('"KPI1_KPI_Title_2":');
                        if (objKPIresponses3.size() > 1) {
                            objKPIresponses3[1] = objKPIresponses3[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist3 = objKPIresponses3[1].split('"type":"text"');
                            objKPINewDesc3 = '"KPI1_KPI_Title_2":' + objKPINewDescllist3[0] + '"type": "text" },';
                        }
                        transient String[] objKPIresponses4 = NewWrap.split('"KPI1_KPI_Title_1":');
                        if (objKPIresponses4.size() > 1) {
                            objKPIresponses4[1] = objKPIresponses4[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist4 = objKPIresponses4[1].split('"type":"text"');
                            objKPINewDesc4 = '"KPI1_KPI_Title_1":' + objKPINewDescllist4[0] + '"type": "text" },';
                        }
                        transient String[] FilobjKPIresponses1 = NewWrap.split('"Filters_Title":');
                        if (FilobjKPIresponses1.size() > 1) {
                            FilobjKPIresponses1[1] = FilobjKPIresponses1[1].replace('"type": "text"', '"type":"text"');
                            transient String[] FilobjKPINewDescllist1 = FilobjKPIresponses1[1].split('"type":"text"');
                            FilobjKPINewDesc1 = '"Filters_Title":' + FilobjKPINewDescllist1[0] + '"type": "text" },';
                        }
                    }
                    transient String[] FilKPIresponses1 = responseBody.split('"Filters_Title":');
                    if (FilKPIresponses1.size() > 1) {
                        transient String[] FilKPINewDescllist1 = FilKPIresponses1[1].split('"type":"text"');
                        FilNewDesc1 = '"Filters_Title":' + FilKPINewDescllist1[0] + '"type": "text" },';
                    }
                    transient String[] FilobjKPIresponses2 = NewWrap.split('"Overview_Title":');
                    if (FilobjKPIresponses2.size() > 1) {
                        FilobjKPIresponses2[1] = FilobjKPIresponses2[1].replace('"type": "text"', '"type":"text"');
                        transient String[] FilobjKPINewDescllist2 = FilobjKPIresponses2[1].split('"type":"text"');
                        FilobjKPINewDesc2 = '"Overview_Title":' + FilobjKPINewDescllist2[0] + '"type": "text" },';
                    }
                    transient String[] FilKPIresponses2 = responseBody.split('"Overview_Title":');
                    if (FilKPIresponses2.size() > 1) {
                        transient String[] FilKPINewDescllist2 = FilKPIresponses2[1].split('"type":"text"');
                        FilNewDesc2 = '"Overview_Title":' + FilKPINewDescllist2[0] + '"type": "text" },';
                    }
                    transient String[] responses = responseBody.split('"KPI1_Description_Container":');
                    if (responses.size() > 1) {
                        transient String[] NewDescllist = responses[1].split('"type":"container"');
                        NewDesc = '"KPI1_Description_Container":' + NewDescllist[0] + '"type": "container" },';
                    }
                    transient String[] objresponses = NewWrap.split('"KPI1_Description_Container":');
                    if (objresponses.size() > 1) {
                        objresponses[1] = objresponses[1].replace('"type": "container"', '"type":"container"');
                        transient String[] objNewDescllist = objresponses[1].split('"type":"container"');
                        objNewDesc = '"KPI1_Description_Container":' + objNewDescllist[0] + '"type": "container" },';
                    }
                    transient String[] responsesKPI4 = responseBody.split('"KPI4_Description_Container":');
                    if (responsesKPI4.size() > 1) {
                        transient String[] NewDescllistKPI4 = responsesKPI4[1].split('"type":"container"');
                        NewDescKPI4 = '"KPI4_Description_Container":' + NewDescllistKPI4[0] + '"type": "container" },';
                    }
                    if (!Test.isRunningTest()) {
                        transient String[] objresponsesKPI4 = NewWrap.split('"KPI4_Description_Container":');
                        if (objresponsesKPI4.size() > 1) {
                            objresponsesKPI4[1] = objresponsesKPI4[1].replace('"type": "container"', '"type":"container"');
                            transient String[] objNewDescllistKPI4 = objresponsesKPI4[1].split('"type":"container"');
                            objNewDescKPI4 = '"KPI4_Description_Container":' + objNewDescllistKPI4[0] + '"type": "container" },';
                        }
                    }
                    transient String[] responsesKPI5 = responseBody.split('"KPI5_Description_Container":');
                    if (responsesKPI5.size() > 1) {
                        transient String[] NewDescllistKPI5 = responsesKPI5[1].split('"type":"container"');
                        NewDescKPI5 = '"KPI5_Description_Container":' + NewDescllistKPI5[0] + '"type": "container" },';
                    }
                    if (!Test.isRunningTest()) {
                        transient String[] objresponsesKPI5 = NewWrap.split('"KPI5_Description_Container":');
                        if (objresponsesKPI5.size() > 1) {
                            objresponsesKPI5[1] = objresponsesKPI5[1].replace('"type": "container"', '"type":"container"');
                            transient String[] objNewDescllistKPI5 = objresponsesKPI5[1].split('"type":"container"');
                            objNewDescKPI5 = '"KPI5_Description_Container":' + objNewDescllistKPI5[0] + '"type": "container" },';
                        }
                    }
                    transient String[] responses2KPI2 = responseBody.split('"KPI2_Header_Container":');
                    if (responses2KPI2.size() > 1) {
                        transient String[] NewDescllist2KPI2 = responses2KPI2[1].split('"type":"container"');
                        NewDesc2KPI2 = '"KPI2_Header_Container":' + NewDescllist2KPI2[0] + '"type": "container" },';
                    }
                    if (!Test.isRunningTest()) {
                        transient String[] objresponses2KPI2 = NewWrap.split('"KPI2_Header_Container":');
                        if (objresponses2KPI2.size() > 1) {
                            objresponses2KPI2[1] = objresponses2KPI2[1].replace('"type": "container"', '"type":"container"');
                            transient String[] objNewDescllist2KPI2 = objresponses2KPI2[1].split('"type":"container"');
                            objNewDesc2KPI2 = '"KPI2_Header_Container":' + objNewDescllist2KPI2[0] + '"type": "container" },';
                        }
                    }
                    transient String[] responses2KPI5 = responseBody.split('"KPI5_Header_Container":');
                    if (responses2KPI5.size() > 1) {
                        transient String[] NewDescllist2KPI5 = responses2KPI5[1].split('"type":"container"');
                        NewDesc2KPI5 = '"KPI5_Header_Container":' + NewDescllist2KPI5[0] + '"type": "container" },';
                    }
                    if (!Test.isRunningTest()) {
                        transient String[] objresponses2KPI5 = NewWrap.split('"KPI5_Header_Container":');
                        if (objresponses2KPI5.size() > 1) {
                            objresponses2KPI5[1] = objresponses2KPI5[1].replace('"type": "container"', '"type":"container"');
                            transient String[] objNewDescllist2KPI5 = objresponses2KPI5[1].split('"type":"container"');
                            objNewDesc2KPI5 = '"KPI5_Header_Container":' + objNewDescllist2KPI5[0] + '"type": "container" },';
                        }
                    }
                    transient String[] responses3KPI2 = responseBody.split('"KPI2_Chart_Container":');
                    if (responses3KPI2.size() > 1) {
                        transient String[] NewDescllist3KPI2 = responses3KPI2[1].split('"type":"container"');
                        NewDesc3KPI2 = '"KPI2_Chart_Container":' + NewDescllist3KPI2[0] + '"type": "container" },';
                    }
                    transient String[] objresponses3KPI2 = NewWrap.split('"KPI2_Chart_Container":');
                    if (objresponses3KPI2.size() > 1) {
                        objresponses3KPI2[1] = objresponses3KPI2[1].replace('"type": "container"', '"type":"container"');
                        transient String[] objNewDescllist3KPI2 = objresponses3KPI2[1].split('"type":"container"');
                        objNewDesc3KPI2 = '"KPI2_Chart_Container":' + objNewDescllist3KPI2[0] + '"type": "container" },';
                    }
                    transient String[] responses3KPI5 = responseBody.split('"KPI5_Chart_Container":');
                    if (responses3KPI5.size() > 1) {
                        transient String[] NewDescllist3KPI5 = responses3KPI5[1].split('"type":"container"');
                        NewDesc3KPI5 = '"KPI5_Chart_Container":' + NewDescllist3KPI5[0] + '"type": "container" },';
                    }
                    if (!Test.isRunningTest()) {
                        transient String[] objresponses3KPI5 = NewWrap.split('"KPI5_Chart_Container":');
                        if (objresponses3KPI5.size() > 1) {
                            objresponses3KPI5[1] = objresponses3KPI5[1].replace('"type": "container"', '"type":"container"');
                            transient String[] objNewDescllist3KPI5 = objresponses3KPI5[1].split('"type":"container"');
                            objNewDesc3KPI5 = '"KPI5_Chart_Container":' + objNewDescllist3KPI5[0] + '"type": "container" },';
                        }
                    }
                    transient String[] KPIresponses1KPI2 = responseBody.split('"KPI2_KPI_Title_4":');
                    if (KPIresponses1KPI2.size() > 1) {
                        transient String[] KPINewDescllist1KPI2 = KPIresponses1KPI2[1].split('"type":"text"');
                        KPINewDesc1KPI2 = '"KPI2_KPI_Title_4":' + KPINewDescllist1KPI2[0] + '"type": "text" },';
                    }
                    transient String[] KPIresponses2KPI2 = responseBody.split('"KPI2_KPI_Title_3":');
                    if (KPIresponses2KPI2.size() > 1) {
                        transient String[] KPINewDescllist2KPI2 = KPIresponses2KPI2[1].split('"type":"text"');
                        KPINewDesc2KPI2 = '"KPI2_KPI_Title_3":' + KPINewDescllist2KPI2[0] + '"type": "text" },';
                    }
                    transient String[] KPIresponses3KPI2 = responseBody.split('"KPI2_KPI_Title_2":');
                    if (KPIresponses3KPI2.size() > 1) {
                        transient String[] KPINewDescllist3KPI2 = KPIresponses3KPI2[1].split('"type":"text"');
                        KPINewDesc3KPI2 = '"KPI2_KPI_Title_2":' + KPINewDescllist3KPI2[0] + '"type": "text" },';
                    }
                    transient String[] KPIresponses4KPI2 = responseBody.split('"KPI2_KPI_Title_1":');
                    if (KPIresponses4KPI2.size() > 1) {
                        transient String[] KPINewDescllist4KPI2 = KPIresponses4KPI2[1].split('"type":"text"');
                        KPINewDesc4KPI2 = '"KPI2_KPI_Title_1":' + KPINewDescllist4KPI2[0] + '"type": "text" },';
                    }
                    if (!Test.isRunningTest()) {
                        transient String[] objKPIresponses1KPI2 = NewWrap.split('"KPI2_KPI_Title_4":');
                        if (objKPIresponses1KPI2.size() > 1) {
                            objKPIresponses1KPI2[1] = objKPIresponses1KPI2[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist1KPI2 = objKPIresponses1KPI2[1].split('"type":"text"');
                            objKPINewDesc1KPI2 = '"KPI2_KPI_Title_4":' + objKPINewDescllist1KPI2[0] + '"type": "text" },';
                        }
                        transient String[] objKPIresponses2KPI2 = NewWrap.split('"KPI2_KPI_Title_3":');
                        if (objKPIresponses2KPI2.size() > 1) {
                            objKPIresponses2KPI2[1] = objKPIresponses2KPI2[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist2KPI2 = objKPIresponses2KPI2[1].split('"type":"text"');
                            objKPINewDesc2KPI2 = '"KPI2_KPI_Title_3":' + objKPINewDescllist2KPI2[0] + '"type": "text" },';
                        }
                        transient String[] objKPIresponses3KPI2 = NewWrap.split('"KPI2_KPI_Title_2":');
                        if (objKPIresponses3KPI2.size() > 1) {
                            objKPIresponses3KPI2[1] = objKPIresponses3KPI2[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist3KPI2 = objKPIresponses3KPI2[1].split('"type":"text"');
                            objKPINewDesc3KPI2 = '"KPI2_KPI_Title_2":' + objKPINewDescllist3KPI2[0] + '"type": "text" },';
                        }
                        transient String[] objKPIresponses4KPI2 = NewWrap.split('"KPI2_KPI_Title_1":');
                        if (objKPIresponses4KPI2.size() > 1) {
                            objKPIresponses4KPI2[1] = objKPIresponses4KPI2[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist4KPI2 = objKPIresponses4KPI2[1].split('"type":"text"');
                            objKPINewDesc4KPI2 = '"KPI2_KPI_Title_1":' + objKPINewDescllist4KPI2[0] + '"type": "text" },';
                        }
                        NewWrap = NewWrap.replace(objKPINewDesc1KPI2, KPINewDesc1KPI2);
                        NewWrap = NewWrap.replace(objKPINewDesc2KPI2, KPINewDesc2KPI2);
                        NewWrap = NewWrap.replace(objKPINewDesc3KPI2, KPINewDesc3KPI2);
                        NewWrap = NewWrap.replace(objKPINewDesc4KPI2, KPINewDesc4KPI2);
                    }

                    transient String[] responses2KPI3 = responseBody.split('"KPI3_Header_Container":');
                    if (responses2KPI3.size() > 1) {
                        transient String[] NewDescllist2KPI3 = responses2KPI3[1].split('"type":"container"');
                        NewDesc2KPI3 = '"KPI3_Header_Container":' + NewDescllist2KPI3[0] + '"type": "container" },';
                    }
                    transient String[] objresponses2KPI3 = NewWrap.split('"KPI3_Header_Container":');
                    if (objresponses2KPI3.size() > 1) {
                        objresponses2KPI3[1] = objresponses2KPI3[1].replace('"type": "container"', '"type":"container"');
                        transient String[] objNewDescllist2KPI3 = objresponses2KPI3[1].split('"type":"container"');
                        objNewDesc2KPI3 = '"KPI3_Header_Container":' + objNewDescllist2KPI3[0] + '"type": "container" },';
                    }



                    if (!Test.isRunningTest()) {

                        NewWrap = NewWrap.replace(objNewDesc3KPI5, NewDesc3KPI5);
                        NewWrap = NewWrap.replace(objNewDesc3KPI2, NewDesc3KPI2);
                        NewWrap = NewWrap.replace(objNewDesc2KPI2, NewDesc2KPI2);
                        NewWrap = NewWrap.replace(objNewDesc2KPI5, NewDesc2KPI5);
                        NewWrap = NewWrap.replace(objNewDesc, NewDesc);
                        NewWrap = NewWrap.replace(objNewDescKPI4, NewDescKPI4);
                        NewWrap = NewWrap.replace(objNewDescKPI5, NewDescKPI5);
                        NewWrap = NewWrap.replace(FilobjKPINewDesc1, FilNewDesc1);
                        NewWrap = NewWrap.replace(FilobjKPINewDesc2, FilNewDesc2);
                        NewWrap = NewWrap.replace(objKPINewDesc1, KPINewDesc1);
                        NewWrap = NewWrap.replace(objKPINewDesc1, KPINewDesc1);
                        NewWrap = NewWrap.replace(objKPINewDesc2, KPINewDesc2);
                        NewWrap = NewWrap.replace(objKPINewDesc3, KPINewDesc3);
                        NewWrap = NewWrap.replace(objKPINewDesc4, KPINewDesc4);
                        NewWrap = NewWrap.replace(objNewDesc2KPI3, NewDesc2KPI3);
                    }
                    NewWrap = Newwrap.replace('&quot;', '\\"');
                    NewWrap = NewWrap.replace('"type":"text"', '"type": "text"');
                    if (!Test.isRunningTest()) {
                        Slds.Sales_Insight_String4__c = Newwrap;
                        Sales.Sales_Insight_String4__c = Slds.Sales_Insight_String4__c;
                        Sales.Id = Slds.Id;
                    }
                }
            }
            if (Sales.Id != null) {
                if (Schema.sObjectType.Sales_Insight__c.fields.Sales_Insight_String4__c.isUpdateable() && Schema.sObjectType.Sales_Insight__c.fields.Id.isUpdateable()) {
                    update Sales;
                }
            }
        }
    }

    @Future(callout = true)
    private static void NewDashboardSingle4(String Allval, String sessionIds) {
        list<Sales_Insight__c> NewSaleslist = [select id, Name, Dashboard_Id__c, Dashboard_Type__c, DataSet_Delete__c, Sales_insight_String5__c, Delete_All_Group__c, Delete_All_Orders__c, Sales_KPI_Delete__c, Number_Delete1__c, ListSelector__c, Lis_Selector36__c, Sales_insight_Day_Delete__c, Sales_Insight_String2__c, Sales_Insight_String3__c, Grouping_label_Delete__c, Grouping_Delete__c, Measures_Delete__c, Sales_Insight_String4__c, List_Selector53__c, Sales_insight_String1__c from Sales_Insight__c where id = :Allval limit 1];
        transient String Str = sessionIds;
        Sales_Insight__c Sales = new Sales_Insight__c();
        if (NewSaleslist.size() > 0) {
            for (Sales_Insight__c slds : NewSaleslist) {
                HttpResponse hRes = SingleKPI_DashboardService.retriveDashboardFile(slds.Name, Str);
                transient String responseBody;

                if (!Test.isRunningTest()) {
                    responseBody = hRes.getBody();
                }
                else {
                    responseBody = NewSaleslist[0].DataSet_Delete__c + NewSaleslist[0].Sales_Insight_String5__c + NewSaleslist[0].Sales_insight_String2__c + NewSaleslist[0].Sales_insight_String3__c + NewSaleslist[0].Grouping_label_Delete__c + NewSaleslist[0].Sales_insight_String4__c + NewSaleslist[0].Grouping_Delete__c;
                }
                if (hRes.getStatus() == 'OK' || Test.isRunningTest()) {
                    responseBody = responseBody.replace('"widgets": {', '"widgets":{');
                    responseBody = responseBody.replace('"widgets":{', '"widgets":splx');
                    responseBody = responseBody.replace('"widgets": splx', '"widgets":splx');
                    transient String[] responseBodylistss = responseBody.split('"widgets":splx');
                    responseBody = '"widgets": {' + responseBodylistss[1];
                    transient String objKPINewDesc1KPI3 = '';
                    transient String KPINewDesc1KPI3 = '';
                    transient String objKPINewDesc2KPI3 = '';
                    transient String objKPINewDesc3KPI3 = '';
                    transient String objKPINewDesc4KPI3 = '';
                    transient String objNewDesc2 = '';

                    transient String objNewDesc2KPI4 = '';
                    transient String KPINewDesc2KPI3 = '';
                    transient String KPINewDesc3KPI3 = '';
                    transient String KPINewDesc4KPI3 = '';
                    transient String NewDesc2 = '';

                    transient String NewDesc2KPI4 = '';
                    transient String Newwrap = '';
                    Newwrap = Slds.Grouping_Delete__c.replaceAll('\\s+\\s+', '#testcode#').replaceAll('#testcode#', ' ');
                    transient String[] responses2 = responseBody.split('"KPI1_Header_Container":');
                    if (responses2.size() > 1) {
                        transient String[] NewDescllist2 = responses2[1].split('"type":"container"');
                        NewDesc2 = '"KPI1_Header_Container":' + NewDescllist2[0] + '"type": "container" },';
                    }

                    transient String[] objresponses2 = NewWrap.split('"KPI1_Header_Container":');
                    if (objresponses2.size() > 1) {
                        objresponses2[1] = objresponses2[1].replace('"type": "container"', '"type":"container"');
                        transient String[] objNewDescllist2 = objresponses2[1].split('"type":"container"');
                        objNewDesc2 = '"KPI1_Header_Container":' + objNewDescllist2[0] + '"type": "container" },';
                    }

                    //  transient String[]  responses2KPI3 = responseBody.split('"KPI3_Header_Container":');
                    // if(responses2KPI3.size()>1){
                    // transient String[]  NewDescllist2KPI3 = responses2KPI3[1].split('"type":"container"');
                    //  NewDesc2KPI3 = '"KPI3_Header_Container":' +NewDescllist2KPI3[0]+'"type": "container" },';
                    // }

                    // transient String[]  objresponses2KPI3 = NewWrap.split('"KPI3_Header_Container":');
                    // if(objresponses2KPI3.size()>1){
                    // objresponses2KPI3[1] = objresponses2KPI3[1].replace('"type": "container"','"type":"container"');
                    // transient String[]  objNewDescllist2KPI3 = objresponses2KPI3[1].split('"type":"container"');
                    //  objNewDesc2KPI3 = '"KPI3_Header_Container":' +objNewDescllist2KPI3[0]+'"type": "container" },';
                    // }


                    transient String[] responses2KPI4 = responseBody.split('"KPI4_Header_Container":');
                    if (responses2KPI4.size() > 1) {
                        transient String[] NewDescllist2KPI4 = responses2KPI4[1].split('"type":"container"');
                        NewDesc2KPI4 = '"KPI4_Header_Container":' + NewDescllist2KPI4[0] + '"type": "container" },';
                    }

                    transient String[] objresponses2KPI4 = NewWrap.split('"KPI4_Header_Container":');
                    if (objresponses2KPI4.size() > 1) {
                        objresponses2KPI4[1] = objresponses2KPI4[1].replace('"type": "container"', '"type":"container"');
                        transient String[] objNewDescllist2KPI4 = objresponses2KPI4[1].split('"type":"container"');
                        objNewDesc2KPI4 = '"KPI4_Header_Container":' + objNewDescllist2KPI4[0] + '"type": "container" },';
                    }

                    transient String[] KPIresponses1KPI3 = responseBody.split('"KPI3_KPI_Title_4":');
                    if (KPIresponses1KPI3.size() > 1) {
                        transient String[] KPINewDescllist1KPI3 = KPIresponses1KPI3[1].split('"type":"text"');
                        KPINewDesc1KPI3 = '"KPI3_KPI_Title_4":' + KPINewDescllist1KPI3[0] + '"type": "text" },';
                    }

                    transient String[] KPIresponses2KPI3 = responseBody.split('"KPI3_KPI_Title_3":');
                    if (KPIresponses2KPI3.size() > 1) {
                        transient String[] KPINewDescllist2KPI3 = KPIresponses2KPI3[1].split('"type":"text"');
                        KPINewDesc2KPI3 = '"KPI3_KPI_Title_3":' + KPINewDescllist2KPI3[0] + '"type": "text" },';
                    }

                    transient String[] KPIresponses3KPI3 = responseBody.split('"KPI3_KPI_Title_2":');
                    if (KPIresponses3KPI3.size() > 1) {
                        transient String[] KPINewDescllist3KPI3 = KPIresponses3KPI3[1].split('"type":"text"');
                        KPINewDesc3KPI3 = '"KPI3_KPI_Title_2":' + KPINewDescllist3KPI3[0] + '"type": "text" },';
                    }

                    transient String[] KPIresponses4KPI3 = responseBody.split('"KPI3_KPI_Title_1":');
                    if (KPIresponses4KPI3.size() > 1) {
                        transient String[] KPINewDescllist4KPI3 = KPIresponses4KPI3[1].split('"type":"text"');
                        KPINewDesc4KPI3 = '"KPI3_KPI_Title_1":' + KPINewDescllist4KPI3[0] + '"type": "text" },';
                    }


                    transient String[] objKPIresponses1KPI3 = NewWrap.split('"KPI3_KPI_Title_4":');
                    if (objKPIresponses1KPI3.size() > 1) {
                        objKPIresponses1KPI3[1] = objKPIresponses1KPI3[1].replace('"type": "text"', '"type":"text"');
                        transient String[] objKPINewDescllist1KPI3 = objKPIresponses1KPI3[1].split('"type":"text"');
                        objKPINewDesc1KPI3 = '"KPI3_KPI_Title_4":' + objKPINewDescllist1KPI3[0] + '"type": "text" },';
                    }

                    transient String[] objKPIresponses2KPI3 = NewWrap.split('"KPI3_KPI_Title_3":');
                    if (objKPIresponses2KPI3.size() > 1) {
                        objKPIresponses2KPI3[1] = objKPIresponses2KPI3[1].replace('"type": "text"', '"type":"text"');
                        transient String[] objKPINewDescllist2KPI3 = objKPIresponses2KPI3[1].split('"type":"text"');
                        objKPINewDesc2KPI3 = '"KPI3_KPI_Title_3":' + objKPINewDescllist2KPI3[0] + '"type": "text" },';
                    }

                    transient String[] objKPIresponses3KPI3 = NewWrap.split('"KPI3_KPI_Title_2":');
                    if (objKPIresponses3KPI3.size() > 1) {
                        objKPIresponses3KPI3[1] = objKPIresponses3KPI3[1].replace('"type": "text"', '"type":"text"');
                        transient String[] objKPINewDescllist3KPI3 = objKPIresponses3KPI3[1].split('"type":"text"');
                        objKPINewDesc3KPI3 = '"KPI3_KPI_Title_2":' + objKPINewDescllist3KPI3[0] + '"type": "text" },';
                    }

                    transient String[] objKPIresponses4KPI3 = NewWrap.split('"KPI3_KPI_Title_1":');
                    if (objKPIresponses4KPI3.size() > 1) {
                        objKPIresponses4KPI3[1] = objKPIresponses4KPI3[1].replace('"type": "text"', '"type":"text"');
                        transient String[] objKPINewDescllist4KPI3 = objKPIresponses4KPI3[1].split('"type":"text"');
                        objKPINewDesc4KPI3 = '"KPI3_KPI_Title_1":' + objKPINewDescllist4KPI3[0] + '"type": "text" },';
                    }


                    //                          transient string KPI1ChartFilNewDesc1 = '',KPI1ChartFilNewDesc2 = '',KPI1ChartFilNewDesc3 = '',KPI1ChartFilNewDesc4 = '',KPI1ChartFilNewDesc5 = '';
                    // transient string KPI1ChartFilNewDesc6 = '',KPI1ChartFilNewDesc7 = '',KPI1ChartFilNewDesc8 = '';

                    //  transient string KPI1ChartFilobjKPINewDesc1 = '',KPI1ChartFilobjKPINewDesc2 = '',KPI1ChartFilobjKPINewDesc3 = '',KPI1ChartFilobjKPINewDesc4 = '';
                    //  transient string KPI1ChartFilobjKPINewDesc5 = '',KPI1ChartFilobjKPINewDesc6 = '',KPI1ChartFilobjKPINewDesc7 = '',KPI1ChartFilobjKPINewDesc8 = '';

                    // for(integer i=1;i<=8;i++){
                    //     transient string[] FilKPIresponsesChart = responseBody.split('"KPI1_Chart_Title_'+i+'":');
                    //     if(FilKPIresponsesChart.size()>1){
                    //         transient string[] FilKPINewDescllistChart = FilKPIresponsesChart[1].split('"type":"text"');
                    //         transient string[] NewFilobj = FilKPINewDescllistChart[0].split('"text":');
                    //         transient string[] StrNewFilobj = NewFilobj[1].split(',');
                    //         FilKPINewDescllistChart[0] = FilKPINewDescllistChart[0].replace(StrNewFilobj[0],'"{{ cell(KPI1_Static_Dimensions.selection, 0, \\\"label'+i+'\\\").astransient string()}}"');
                    //         if(i==1){
                    //             KPI1ChartFilNewDesc1 = '"KPI1_Chart_Title_'+i+'":' +FilKPINewDescllistChart[0]+'"type": "text" },';
                    //         }
                    //         else if(i==2){
                    //             KPI1ChartFilNewDesc2 = '"KPI1_Chart_Title_'+i+'":' +FilKPINewDescllistChart[0]+'"type": "text" },';
                    //         }
                    //         else if(i==3){
                    //             KPI1ChartFilNewDesc3 = '"KPI1_Chart_Title_'+i+'":' +FilKPINewDescllistChart[0]+'"type": "text" },';    
                    //         }
                    //         else if(i==4){
                    //             KPI1ChartFilNewDesc4 = '"KPI1_Chart_Title_'+i+'":' +FilKPINewDescllistChart[0]+'"type": "text" },';    
                    //         }
                    //         else if(i==5){
                    //             KPI1ChartFilNewDesc5 = '"KPI1_Chart_Title_'+i+'":' +FilKPINewDescllistChart[0]+'"type": "text" },';    
                    //         }
                    //         else if(i==6){
                    //             KPI1ChartFilNewDesc6 = '"KPI1_Chart_Title_'+i+'":' +FilKPINewDescllistChart[0]+'"type": "text" },';    
                    //         }
                    //         else if(i==7){
                    //             KPI1ChartFilNewDesc7 = '"KPI1_Chart_Title_'+i+'":' +FilKPINewDescllistChart[0]+'"type": "text" },';    
                    //         }
                    //         else if(i==8){
                    //             KPI1ChartFilNewDesc8 = '"KPI1_Chart_Title_'+i+'":' +FilKPINewDescllistChart[0]+'"type": "text" },';    
                    //         }
                    //     }
                    // }

                    // for(integer i=1;i<=8;i++){  
                    //     transient string[] FilobjKPIresponsesChart = NewWrap.split('"KPI1_Chart_Title_'+i+'":');
                    //     if(FilobjKPIresponsesChart.size()>1){
                    //         FilobjKPIresponsesChart[1] = FilobjKPIresponsesChart[1].replace('"type": "text"','"type":"text"');
                    //         transient string[] FilobjKPINewDescllistChat = FilobjKPIresponsesChart[1].split('"type":"text"');
                    //         if(i==1){
                    //             KPI1ChartFilobjKPINewDesc1 = '"KPI1_Chart_Title_'+i+'":' +FilobjKPINewDescllistChat[0]+'"type": "text" },';
                    //         }
                    //         else if(i==2){
                    //             KPI1ChartFilobjKPINewDesc2 = '"KPI1_Chart_Title_'+i+'":' +FilobjKPINewDescllistChat[0]+'"type": "text" },';
                    //         }
                    //         else if(i==3){
                    //             KPI1ChartFilobjKPINewDesc3 = '"KPI1_Chart_Title_'+i+'":' +FilobjKPINewDescllistChat[0]+'"type": "text" },';    
                    //         }
                    //         else if(i==4){
                    //             KPI1ChartFilobjKPINewDesc4 = '"KPI1_Chart_Title_'+i+'":' +FilobjKPINewDescllistChat[0]+'"type": "text" },';    
                    //         }
                    //         else if(i==5){
                    //             KPI1ChartFilobjKPINewDesc5 = '"KPI1_Chart_Title_'+i+'":' +FilobjKPINewDescllistChat[0]+'"type": "text" },';    
                    //         }
                    //         else if(i==6){
                    //             KPI1ChartFilobjKPINewDesc6 = '"KPI1_Chart_Title_'+i+'":' +FilobjKPINewDescllistChat[0]+'"type": "text" },';    
                    //         }
                    //         else if(i==7){
                    //             KPI1ChartFilobjKPINewDesc7 = '"KPI1_Chart_Title_'+i+'":' +FilobjKPINewDescllistChat[0]+'"type": "text" },';    
                    //         }
                    //         else if(i==8){
                    //             KPI1ChartFilobjKPINewDesc8 = '"KPI1_Chart_Title_'+i+'":' +FilobjKPINewDescllistChat[0]+'"type": "text" },';    
                    //         }
                    //     }
                    // }

                    // NewWrap = NewWrap.replace(KPI1ChartFilobjKPINewDesc1,KPI1ChartFilNewDesc1).replace(KPI1ChartFilobjKPINewDesc2,KPI1ChartFilNewDesc2);
                    // NewWrap = NewWrap.replace(KPI1ChartFilobjKPINewDesc3,KPI1ChartFilNewDesc3).replace(KPI1ChartFilobjKPINewDesc4,KPI1ChartFilNewDesc4);
                    // NewWrap = NewWrap.replace(KPI1ChartFilobjKPINewDesc5,KPI1ChartFilNewDesc5).replace(KPI1ChartFilobjKPINewDesc6,KPI1ChartFilNewDesc6);
                    // NewWrap = NewWrap.replace(KPI1ChartFilobjKPINewDesc7,KPI1ChartFilNewDesc7).replace(KPI1ChartFilobjKPINewDesc8,KPI1ChartFilNewDesc8);

                    NewWrap = NewWrap.replace(objKPINewDesc1KPI3, KPINewDesc1KPI3);
                    NewWrap = NewWrap.replace(objKPINewDesc2KPI3, KPINewDesc2KPI3);
                    NewWrap = NewWrap.replace(objKPINewDesc3KPI3, KPINewDesc3KPI3);
                    NewWrap = NewWrap.replace(objKPINewDesc4KPI3, KPINewDesc4KPI3);
                    NewWrap = NewWrap.replace(objNewDesc2, NewDesc2);

                    NewWrap = NewWrap.replace(objNewDesc2KPI4, NewDesc2KPI4);
                    NewWrap = Newwrap.replace('&quot;', '\\"');
                    NewWrap = NewWrap.replace('"type":"text"', '"type": "text"');
                    if (!Test.isRunningTest()) {
                        Slds.Grouping_Delete__c = Newwrap;

                        Sales.Grouping_Delete__c = Newwrap.replace('&quot;', '\\"');
                        Sales.Id = Slds.Id;
                    }

                }
            }
            if (Sales.Id != null)
            update Sales;
        }

    }

    @Future(callout = true)
    private static void NewDashboardSingle2(String Allval, String sessionIds) {
        list<Sales_Insight__c> NewSaleslist = [select id, Name, Dashboard_Id__c, Dashboard_Type__c, Sales_Insight_String1__c, Sales_Insight_String2__c, Sales_Insight_String3__c from Sales_Insight__c where id = :Allval limit 1];
        transient String Str = sessionIds;
        Sales_Insight__c Sales = new Sales_Insight__c();
        if (NewSaleslist.size() > 0) {
            for (Sales_Insight__c Newsales : NewSaleslist) {

                HttpResponse hRes = new HttpResponse();

                //if(!Test.isRunningTest());
                hRes = SingleKPI_DashboardService.retriveDashboardFile(Newsales.Name, Str);


                transient String responseBody;

                if (!Test.isRunningTest()) {
                    responseBody = hRes.getBody();
                }
                else {
                    list<Sales_Insight__c> Saleslist = [select id, Name, Sales_Insight_String2__c, Sales_Insight_String3__c, Sales_Insight_String4__c, Sales_insight_String1__c from Sales_Insight__c where Name = 'Theme For NewSalesSight' limit 1];
                    responseBody = Saleslist[0].Sales_Insight_String1__c + Saleslist[0].Sales_insight_String2__c + Saleslist[0].Sales_Insight_String3__c;
                }

                if (hRes.getStatus() == 'OK' || Test.isRunningTest()) {

                    transient String[] responseBodylist = responseBody.split('"layouts":');
                    transient String Res = responseBodylist[0];
                    transient String[] Reslst = Res.split('"gridLayouts":');
                    transient String Rs = '"gridLayouts": ' + Reslst[1];
                    Rs = Rs.replace('"name":"49aec73a-4cfc-4256-93d7-98d922372c8a",', '');
                    Rs = Rs.replace('"name":"c0194d25-02cd-47ee-9569-aa3b0b159ad5",', '');
                    Rs = Rs.replace('"name":"62975578-cd05-4a7c-919e-83ab5fd866dd",', '');
                    // Rs = Rs.replace('"name":"03942376-0b77-4993-875d-3521ff42e2a8",','');
                    Rs = Rs.replace('"label":"Untitled",', '');

                    responseBody = responseBody.replace('"widgets": {', '"widgets":{');
                    responseBody = responseBody.replace('"widgets":{', '"widgets":splx');
                    responseBody = responseBody.replace('"widgets": splx', '"widgets":splx');
                    transient String[] responseBodylistss = responseBody.split('"widgets":splx');
                    responseBody = '"widgets": {' + responseBodylistss[1];
                    transient String Newwrap = '';
                    //   Newsales.Sales_Insight_String1__c = Rs; 
                    //   Newsales.Sales_Insight_String5__c = Rs; 
                    //   Newsales.Measures_Delete__c = Rs; 
                    NewWrap = Newsales.Sales_Insight_String3__c;
                    transient String NewDBS = '';
                    for (integer i = 1; i <= 50; i++) {
                        transient String[] FilKPIresponsesImg = responseBody.split('"image_' + i + '":');
                        if (FilKPIresponsesImg.size() > 1 && !NewWrap.contains('"image_' + i + '":')) {
                            transient String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"image"');
                            if (NewDBS == null || NewDBS == '') {
                                NewDBS = '"image_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "image" },';
                            }
                            else {
                                NewDBS += '"image_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "image" },';
                            }
                        }
                        if (NewWrap.contains('"image_' + i + '":') && FilKPIresponsesImg.size() > 1) {
                            transient String[] objresponsescon = NewWrap.split('"image_' + i + '":');
                            objresponsescon[1] = objresponsescon[1].replace('"type": "image"', '"type":"image"');
                            transient String[] objNewDescllistcon = objresponsescon[1].split('"type":"image"');
                            transient String objNewDesccon = '"image_' + i + '":' + objNewDescllistcon[0] + '"type": "image" },';

                            transient String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"image"');
                            transient String NewDBScon = '"image_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "image" },';
                            NewWrap = NewWrap.replace(objNewDesccon, NewDBScon);
                        }
                        if (NewWrap.contains('"image_' + i + '":') && !responseBody.contains('"image_' + i + '":')) {
                            transient String[] objresponsescon = NewWrap.split('"image_' + i + '":');
                            objresponsescon[1] = objresponsescon[1].replace('"type": "image"', '"type":"image"');
                            transient String[] objNewDescllistcon = objresponsescon[1].split('"type":"image"');
                            transient String objNewDesccon = '"image_' + i + '":' + objNewDescllistcon[0] + '"type": "image" },';
                            NewWrap = NewWrap.replace(objNewDesccon, '');
                        }

                    }

                    for (integer i = 1; i <= 50; i++) {
                        transient String[] FilKPIresponsesImg = responseBody.split('"container_' + i + '":');
                        if (FilKPIresponsesImg.size() > 1 && !NewWrap.contains('"container_' + i + '":')) {
                            transient String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"container"');
                            if (NewDBS == null || NewDBS == '') {
                                NewDBS = '"container_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "container" },';
                            }
                            else {
                                NewDBS += '"container_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "container" },';
                            }
                        }
                        if (NewWrap.contains('"container_' + i + '":') && FilKPIresponsesImg.size() > 1) {
                            transient String[] objresponsescon = NewWrap.split('"container_' + i + '":');
                            objresponsescon[1] = objresponsescon[1].replace('"type": "container"', '"type":"container"');
                            transient String[] objNewDescllistcon = objresponsescon[1].split('"type":"container"');
                            transient String objNewDesccon = '"container_' + i + '":' + objNewDescllistcon[0] + '"type": "container" },';


                            transient String[] FilKPINewDescllistImg = FilKPIresponsesImg[1].split('"type":"container"');
                            transient String NewDBScon = '"container_' + i + '":' + FilKPINewDescllistImg[0] + '"type": "container" },';

                            NewWrap = NewWrap.replace(objNewDesccon, NewDBScon);
                        }
                        if (NewWrap.contains('"container_' + i + '":') && !responseBody.contains('"container_' + i + '":')) {
                            transient String[] objresponsescon = NewWrap.split('"container_' + i + '":');
                            objresponsescon[1] = objresponsescon[1].replace('"type": "container"', '"type":"container"');
                            transient String[] objNewDescllistcon = objresponsescon[1].split('"type":"container"');
                            transient String objNewDesccon = '"container_' + i + '":' + objNewDescllistcon[0] + '"type": "container" },';
                            NewWrap = NewWrap.replace(objNewDesccon, '');
                        }

                    }
                    NewWrap = NewWrap.replace('"widgets":{', '"widgets": {');
                    NewWrap = NewWrap.replace('"widgets": {', '"widgets": {' + NewDBS);
                    NewSales.Sales_Insight_String3__c = NewWrap;
                    Sales.id = NewSales.Id;
                    Sales.Sales_Insight_String3__c = NewWrap;
                    Sales.Sales_Insight_String1__c = Rs;
                    Sales.Sales_Insight_String5__c = Rs;
                    Sales.Measures_Delete__c = Rs;

                }
            }
            if (Sales.Id != null)
            update Sales;
        }

    }

    @Future(callout = true)
    public static void NewDashboardSingle5(String Allval, String sessionIds) {
        list<analyticscc__Sales_Insight__c> NewSaleslist = [select id, Name, analyticscc__Dashboard_Id__c, analyticscc__Dashboard_Type__c, analyticscc__DataSet_Delete__c, analyticscc__Sales_insight_String5__c, analyticscc__Delete_All_Group__c, analyticscc__Delete_All_Orders__c, analyticscc__Sales_KPI_Delete__c, analyticscc__Sales_Insight_String2__c, analyticscc__Sales_Insight_String3__c, analyticscc__Grouping_label_Delete__c, analyticscc__Grouping_Delete__c, analyticscc__Measures_Delete__c, analyticscc__Sales_Insight_String4__c, analyticscc__Sales_insight_String1__c from analyticscc__Sales_Insight__c where id = :Allval limit 1];
        transient String Str = sessionIds;
        transient analyticscc__Sales_Insight__c Sales = new analyticscc__Sales_Insight__c();
        if (NewSaleslist.size() > 0) {
            for (analyticscc__Sales_Insight__c slds : NewSaleslist) {
                HttpResponse hRes = SingleKPI_DashboardService.retriveDashboardFile(slds.Name, Str);
                transient String responseBody;
                if (!Test.isRunningTest()) {
                    responseBody = hRes.getBody();
                    System.debug('========== Heap Size :: ' + Limits.getHeapSize());
                }
                else {
                    responseBody = NewSaleslist[0].analyticscc__Sales_Insight_String4__c;
                }
                if (hRes.getStatus() == 'OK' || Test.isRunningTest()) {
                    transient String[] responseBodylist = responseBody.split('"KPI1_Filter_6":');
                    transient String Res = responseBodylist[1];
                    responseBody = '""KPI1_Filter_6": ": {' + Res;

                    transient String KPINewDesc1KPI4 = '';
                    transient String KPINewDesc2KPI4 = '';
                    transient String KPINewDesc3KPI4 = '';
                    transient String KPINewDesc4KPI4 = '';
                    transient String objKPINewDesc1KPI4 = '';
                    transient String objKPINewDesc2KPI4 = '';
                    transient String objKPINewDesc3KPI4 = '';
                    transient String objKPINewDesc4KPI4 = '';
                    transient String KPINewDesc1KPI5 = '';
                    transient String KPINewDesc2KPI5 = '';
                    transient String KPINewDesc3KPI5 = '';
                    transient String KPINewDesc4KPI5 = '';
                    transient String objKPINewDesc1KPI5 = '';
                    transient String objKPINewDesc2KPI5 = '';
                    transient String objKPINewDesc3KPI5 = '';
                    transient String objKPINewDesc4KPI5 = '';
                    transient String Newwrap = '';
                    Newwrap = Slds.analyticscc__Sales_Insight_String4__c.replaceAll('\\s+\\s+', '#testcode#').replaceAll('#testcode#', ' ');
                    transient String[] KPIresponses1KPI4 = responseBody.split('"KPI4_KPI_Title_4":');
                    if (KPIresponses1KPI4.size() > 1) {
                        transient String[] KPINewDescllist1KPI4 = KPIresponses1KPI4[1].split('"type":"text"');
                        KPINewDesc1KPI4 = '"KPI4_KPI_Title_4":' + KPINewDescllist1KPI4[0] + '"type": "text" },';
                    }

                    transient String[] KPIresponses2KPI4 = responseBody.split('"KPI4_KPI_Title_3":');
                    if (KPIresponses2KPI4.size() > 1) {
                        transient String[] KPINewDescllist2KPI4 = KPIresponses2KPI4[1].split('"type":"text"');
                        KPINewDesc2KPI4 = '"KPI4_KPI_Title_3":' + KPINewDescllist2KPI4[0] + '"type": "text" },';
                    }

                    transient String[] KPIresponses3KPI4 = responseBody.split('"KPI4_KPI_Title_2":');
                    if (KPIresponses3KPI4.size() > 1) {
                        transient String[] KPINewDescllist3KPI4 = KPIresponses3KPI4[1].split('"type":"text"');
                        KPINewDesc3KPI4 = '"KPI4_KPI_Title_2":' + KPINewDescllist3KPI4[0] + '"type": "text" },';
                    }

                    transient String[] KPIresponses4KPI4 = responseBody.split('"KPI4_KPI_Title_1":');
                    if (KPIresponses4KPI4.size() > 1) {
                        transient String[] KPINewDescllist4KPI4 = KPIresponses4KPI4[1].split('"type":"text"');
                        KPINewDesc4KPI4 = '"KPI4_KPI_Title_1":' + KPINewDescllist4KPI4[0] + '"type": "text" },';
                    }

                    if (!Test.isRunningTest()) {
                        transient String[] objKPIresponses1KPI4 = NewWrap.split('"KPI4_KPI_Title_4":');
                        if (objKPIresponses1KPI4.size() > 1) {
                            objKPIresponses1KPI4[1] = objKPIresponses1KPI4[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist1KPI4 = objKPIresponses1KPI4[1].split('"type":"text"');
                            objKPINewDesc1KPI4 = '"KPI4_KPI_Title_4":' + objKPINewDescllist1KPI4[0] + '"type": "text" },';
                        }

                        transient String[] objKPIresponses2KPI4 = NewWrap.split('"KPI4_KPI_Title_3":');
                        if (objKPIresponses2KPI4.size() > 1) {
                            objKPIresponses2KPI4[1] = objKPIresponses2KPI4[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist2KPI4 = objKPIresponses2KPI4[1].split('"type":"text"');
                            objKPINewDesc2KPI4 = '"KPI4_KPI_Title_3":' + objKPINewDescllist2KPI4[0] + '"type": "text" },';
                        }

                        transient String[] objKPIresponses3KPI4 = NewWrap.split('"KPI4_KPI_Title_2":');
                        if (objKPIresponses3KPI4.size() > 1) {
                            objKPIresponses3KPI4[1] = objKPIresponses3KPI4[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist3KPI4 = objKPIresponses3KPI4[1].split('"type":"text"');
                            objKPINewDesc3KPI4 = '"KPI4_KPI_Title_2":' + objKPINewDescllist3KPI4[0] + '"type": "text" },';
                        }

                        transient String[] objKPIresponses4KPI4 = NewWrap.split('"KPI4_KPI_Title_1":');
                        if (objKPIresponses4KPI4.size() > 1) {
                            objKPIresponses4KPI4[1] = objKPIresponses4KPI4[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist4KPI4 = objKPIresponses4KPI4[1].split('"type":"text"');
                            objKPINewDesc4KPI4 = '"KPI4_KPI_Title_1":' + objKPINewDescllist4KPI4[0] + '"type": "text" },';
                        }

                        NewWrap = NewWrap.replace(objKPINewDesc1KPI4, KPINewDesc1KPI4);
                        NewWrap = NewWrap.replace(objKPINewDesc2KPI4, KPINewDesc2KPI4);
                        NewWrap = NewWrap.replace(objKPINewDesc3KPI4, KPINewDesc3KPI4);
                        NewWrap = NewWrap.replace(objKPINewDesc4KPI4, KPINewDesc4KPI4);
                    }
                    System.debug('========== Heap Size7 :: ' + Limits.getHeapSize());

                    transient String[] KPIresponses1KPI5 = responseBody.split('"KPI5_KPI_Title_4":');
                    if (KPIresponses1KPI5.size() > 1) {
                        transient String[] KPINewDescllist1KPI5 = KPIresponses1KPI5[1].split('"type":"text"');
                        KPINewDesc1KPI5 = '"KPI5_KPI_Title_4":' + KPINewDescllist1KPI5[0] + '"type": "text" },';
                    }

                    transient String[] KPIresponses2KPI5 = responseBody.split('"KPI5_KPI_Title_3":');
                    if (KPIresponses2KPI5.size() > 1) {
                        transient String[] KPINewDescllist2KPI5 = KPIresponses2KPI5[1].split('"type":"text"');
                        KPINewDesc2KPI5 = '"KPI5_KPI_Title_3":' + KPINewDescllist2KPI5[0] + '"type": "text" },';
                    }

                    transient String[] KPIresponses3KPI5 = responseBody.split('"KPI5_KPI_Title_2":');
                    if (KPIresponses3KPI5.size() > 1) {
                        transient String[] KPINewDescllist3KPI5 = KPIresponses3KPI5[1].split('"type":"text"');
                        KPINewDesc3KPI5 = '"KPI5_KPI_Title_2":' + KPINewDescllist3KPI5[0] + '"type": "text" },';
                    }

                    transient String[] KPIresponses4KPI5 = responseBody.split('"KPI5_KPI_Title_1":');
                    if (KPIresponses4KPI5.size() > 1) {
                        transient String[] KPINewDescllist4KPI5 = KPIresponses4KPI5[1].split('"type":"text"');
                        KPINewDesc4KPI5 = '"KPI5_KPI_Title_1":' + KPINewDescllist4KPI5[0] + '"type": "text" },';
                    }

                    if (!Test.isRunningTest()) {
                        transient String[] objKPIresponses1KPI5 = NewWrap.split('"KPI5_KPI_Title_4":');
                        if (objKPIresponses1KPI5.size() > 1) {
                            objKPIresponses1KPI5[1] = objKPIresponses1KPI5[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist1KPI5 = objKPIresponses1KPI5[1].split('"type":"text"');
                            objKPINewDesc1KPI5 = '"KPI5_KPI_Title_4":' + objKPINewDescllist1KPI5[0] + '"type": "text" },';
                        }

                        transient String[] objKPIresponses2KPI5 = NewWrap.split('"KPI5_KPI_Title_3":');
                        if (objKPIresponses2KPI5.size() > 1) {
                            objKPIresponses2KPI5[1] = objKPIresponses2KPI5[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist2KPI5 = objKPIresponses2KPI5[1].split('"type":"text"');
                            objKPINewDesc2KPI5 = '"KPI5_KPI_Title_3":' + objKPINewDescllist2KPI5[0] + '"type": "text" },';
                        }

                        transient String[] objKPIresponses3KPI5 = NewWrap.split('"KPI5_KPI_Title_2":');
                        if (objKPIresponses3KPI5.size() > 1) {
                            objKPIresponses3KPI5[1] = objKPIresponses3KPI5[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist3KPI5 = objKPIresponses3KPI5[1].split('"type":"text"');
                            objKPINewDesc3KPI5 = '"KPI5_KPI_Title_2":' + objKPINewDescllist3KPI5[0] + '"type": "text" },';
                        }

                        transient String[] objKPIresponses4KPI5 = NewWrap.split('"KPI5_KPI_Title_1":');
                        if (objKPIresponses4KPI5.size() > 1) {
                            objKPIresponses4KPI5[1] = objKPIresponses4KPI5[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist4KPI5 = objKPIresponses4KPI5[1].split('"type":"text"');
                            objKPINewDesc4KPI5 = '"KPI5_KPI_Title_1":' + objKPINewDescllist4KPI5[0] + '"type": "text" },';
                        }
                        NewWrap = NewWrap.replace(objKPINewDesc1KPI5, KPINewDesc1KPI5);
                        NewWrap = NewWrap.replace(objKPINewDesc2KPI5, KPINewDesc2KPI5);
                        NewWrap = NewWrap.replace(objKPINewDesc3KPI5, KPINewDesc3KPI5);
                        NewWrap = NewWrap.replace(objKPINewDesc4KPI5, KPINewDesc4KPI5);
                    }
                    transient String KPINewDesc1KPI11 = '';
                    transient String KPINewDesc1KPI12 = '';
                    transient String KPINewDesc1KPI13 = '';
                    transient String KPINewDesc1KPI14 = '';
                    transient String KPINewDesc1KPI15 = '';

                    transient String objKPINewDesc4KPI11 = '';
                    transient String objKPINewDesc4KPI12 = '';
                    transient String objKPINewDesc4KPI13 = '';
                    transient String objKPINewDesc4KPI14 = '';
                    transient String objKPINewDesc4KPI15 = '';


                    transient String[] KPIresponses1KPI11 = responseBody.split('"KPI1_Additional_Feature_Title_1":');
                    if (KPIresponses1KPI11.size() > 1) {
                        transient String[] KPINewDescllist1KPI11 = KPIresponses1KPI11[1].split('"type":"text"');
                        KPINewDesc1KPI11 = '"KPI1_Additional_Feature_Title_1":' + KPINewDescllist1KPI11[0] + '"type": "text" },';
                    }

                    transient String[] KPIresponses1KPI12 = responseBody.split('"KPI2_Additional_Feature_Title_1":');
                    if (KPIresponses1KPI12.size() > 1) {
                        transient String[] KPINewDescllist1KPI12 = KPIresponses1KPI12[1].split('"type":"text"');
                        KPINewDesc1KPI12 = '"KPI2_Additional_Feature_Title_1":' + KPINewDescllist1KPI12[0] + '"type": "text" },';
                    }

                    transient String[] KPIresponses1KPI13 = responseBody.split('"KPI3_Additional_Feature_Title_1":');
                    if (KPIresponses1KPI13.size() > 1) {
                        transient String[] KPINewDescllist1KPI13 = KPIresponses1KPI13[1].split('"type":"text"');
                        KPINewDesc1KPI13 = '"KPI3_Additional_Feature_Title_1":' + KPINewDescllist1KPI13[0] + '"type": "text" },';
                    }

                    transient String[] KPIresponses1KPI14 = responseBody.split('"KPI4_Additional_Feature_Title_1":');
                    if (KPIresponses1KPI14.size() > 1) {
                        transient String[] KPINewDescllist1KPI14 = KPIresponses1KPI14[1].split('"type":"text"');
                        KPINewDesc1KPI14 = '"KPI4_Additional_Feature_Title_1":' + KPINewDescllist1KPI14[0] + '"type": "text" },';
                    }

                    transient String[] KPIresponses1KPI15 = responseBody.split('"KPI5_Additional_Feature_Title_1":');
                    if (KPIresponses1KPI15.size() > 1) {
                        transient String[] KPINewDescllist1KPI15 = KPIresponses1KPI15[1].split('"type":"text"');
                        KPINewDesc1KPI15 = '"KPI5_Additional_Feature_Title_1":' + KPINewDescllist1KPI15[0] + '"type": "text" },';
                    }

                    if (!Test.isRunningTest()) {
                        transient String[] objKPIresponses4KPI11 = NewWrap.split('"KPI1_Additional_Feature_Title_1":');
                        if (objKPIresponses4KPI11.size() > 1) {
                            objKPIresponses4KPI11[1] = objKPIresponses4KPI11[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist4KPI11 = objKPIresponses4KPI11[1].split('"type":"text"');
                            objKPINewDesc4KPI11 = '"KPI1_Additional_Feature_Title_1":' + objKPINewDescllist4KPI11[0] + '"type": "text" },';
                        }

                        transient String[] objKPIresponses4KPI12 = NewWrap.split('"KPI2_Additional_Feature_Title_1":');
                        if (objKPIresponses4KPI12.size() > 1) {
                            objKPIresponses4KPI12[1] = objKPIresponses4KPI12[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist4KPI12 = objKPIresponses4KPI12[1].split('"type":"text"');
                            objKPINewDesc4KPI12 = '"KPI2_Additional_Feature_Title_1":' + objKPINewDescllist4KPI12[0] + '"type": "text" },';
                        }

                        transient String[] objKPIresponses4KPI13 = NewWrap.split('"KPI3_Additional_Feature_Title_1":');
                        if (objKPIresponses4KPI13.size() > 1) {
                            objKPIresponses4KPI13[1] = objKPIresponses4KPI13[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist4KPI13 = objKPIresponses4KPI13[1].split('"type":"text"');
                            objKPINewDesc4KPI13 = '"KPI3_Additional_Feature_Title_1":' + objKPINewDescllist4KPI13[0] + '"type": "text" },';
                        }

                        transient String[] objKPIresponses4KPI14 = NewWrap.split('"KPI4_Additional_Feature_Title_1":');
                        if (objKPIresponses4KPI14.size() > 1) {
                            objKPIresponses4KPI14[1] = objKPIresponses4KPI14[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist4KPI14 = objKPIresponses4KPI14[1].split('"type":"text"');
                            objKPINewDesc4KPI14 = '"KPI4_Additional_Feature_Title_1":' + objKPINewDescllist4KPI14[0] + '"type": "text" },';
                        }

                        transient String[] objKPIresponses4KPI15 = NewWrap.split('"KPI5_Additional_Feature_Title_1":');
                        if (objKPIresponses4KPI15.size() > 1) {
                            objKPIresponses4KPI15[1] = objKPIresponses4KPI15[1].replace('"type": "text"', '"type":"text"');
                            transient String[] objKPINewDescllist4KPI15 = objKPIresponses4KPI15[1].split('"type":"text"');
                            objKPINewDesc4KPI15 = '"KPI5_Additional_Feature_Title_1":' + objKPINewDescllist4KPI15[0] + '"type": "text" },';
                        }

                        NewWrap = NewWrap.replace(objKPINewDesc4KPI11, KPINewDesc1KPI11);
                        NewWrap = NewWrap.replace(objKPINewDesc4KPI12, KPINewDesc1KPI12);
                        NewWrap = NewWrap.replace(objKPINewDesc4KPI13, KPINewDesc1KPI13);
                        NewWrap = NewWrap.replace(objKPINewDesc4KPI14, KPINewDesc1KPI14);
                        NewWrap = NewWrap.replace(objKPINewDesc4KPI15, KPINewDesc1KPI15);

                    }
                    System.debug('========== Heap Size9 :: ' + Limits.getHeapSize());
                    transient String KPINewDesc1KPI21 = '';
                    transient String KPINewDesc1KPI22 = '';
                    transient String KPINewDesc1KPI23 = '';
                    transient String KPINewDesc1KPI24 = '';
                    transient String KPINewDesc1KPI25 = '';

                    transient String objKPINewDesc4KPI21 = '';
                    transient String objKPINewDesc4KPI22 = '';
                    transient String objKPINewDesc4KPI23 = '';
                    transient String objKPINewDesc4KPI24 = '';
                    transient String objKPINewDesc4KPI25 = '';


                    transient String[] KPIresponses1KPI21 = responseBody.split('"KPI1_Additional_Feature_Title_2":');
                    if (KPIresponses1KPI21.size() > 1) {
                        transient String[] KPINewDescllist1KPI21 = KPIresponses1KPI21[1].split('"type":"text"');
                        KPINewDesc1KPI21 = '"KPI1_Additional_Feature_Title_2":' + KPINewDescllist1KPI21[0] + '"type": "text" },';
                    }

                    transient String[] KPIresponses1KPI22 = responseBody.split('"KPI2_Additional_Feature_Title_2":');
                    if (KPIresponses1KPI22.size() > 1) {
                        transient String[] KPINewDescllist1KPI22 = KPIresponses1KPI22[1].split('"type":"text"');
                        KPINewDesc1KPI22 = '"KPI2_Additional_Feature_Title_2":' + KPINewDescllist1KPI22[0] + '"type": "text" },';
                    }

                    transient String[] KPIresponses1KPI23 = responseBody.split('"KPI3_Additional_Feature_Title_2":');
                    if (KPIresponses1KPI23.size() > 1) {
                        transient String[] KPINewDescllist1KPI23 = KPIresponses1KPI23[1].split('"type":"text"');
                        KPINewDesc1KPI23 = '"KPI3_Additional_Feature_Title_2":' + KPINewDescllist1KPI23[0] + '"type": "text" },';
                    }

                    transient String[] KPIresponses1KPI24 = responseBody.split('"KPI4_Additional_Feature_Title_2":');
                    if (KPIresponses1KPI24.size() > 1) {
                        transient String[] KPINewDescllist1KPI24 = KPIresponses1KPI24[1].split('"type":"text"');
                        KPINewDesc1KPI24 = '"KPI4_Additional_Feature_Title_2":' + KPINewDescllist1KPI24[0] + '"type": "text" },';
                    }

                    transient String[] KPIresponses1KPI25 = responseBody.split('"KPI5_Additional_Feature_Title_2":');
                    if (KPIresponses1KPI25.size() > 1) {
                        transient String[] KPINewDescllist1KPI25 = KPIresponses1KPI25[1].split('"type":"text"');
                        KPINewDesc1KPI25 = '"KPI5_Additional_Feature_Title_2":' + KPINewDescllist1KPI25[0] + '"type": "text" },';
                    }

                    transient String[] objKPIresponses4KPI21 = NewWrap.split('"KPI1_Additional_Feature_Title_2":');
                    if (objKPIresponses4KPI21.size() > 1) {
                        objKPIresponses4KPI21[1] = objKPIresponses4KPI21[1].replace('"type": "text"', '"type":"text"');
                        transient String[] objKPINewDescllist4KPI21 = objKPIresponses4KPI21[1].split('"type":"text"');
                        objKPINewDesc4KPI21 = '"KPI1_Additional_Feature_Title_2":' + objKPINewDescllist4KPI21[0] + '"type": "text" },';
                    }

                    transient String[] objKPIresponses4KPI22 = NewWrap.split('"KPI2_Additional_Feature_Title_2":');
                    if (objKPIresponses4KPI22.size() > 1) {
                        objKPIresponses4KPI22[1] = objKPIresponses4KPI22[1].replace('"type": "text"', '"type":"text"');
                        transient String[] objKPINewDescllist4KPI22 = objKPIresponses4KPI22[1].split('"type":"text"');
                        objKPINewDesc4KPI22 = '"KPI2_Additional_Feature_Title_2":' + objKPINewDescllist4KPI22[0] + '"type": "text" },';
                    }

                    transient String[] objKPIresponses4KPI23 = NewWrap.split('"KPI3_Additional_Feature_Title_2":');
                    if (objKPIresponses4KPI23.size() > 1) {
                        objKPIresponses4KPI23[1] = objKPIresponses4KPI23[1].replace('"type": "text"', '"type":"text"');
                        transient String[] objKPINewDescllist4KPI23 = objKPIresponses4KPI23[1].split('"type":"text"');
                        objKPINewDesc4KPI23 = '"KPI3_Additional_Feature_Title_2":' + objKPINewDescllist4KPI23[0] + '"type": "text" },';
                    }

                    transient String[] objKPIresponses4KPI24 = NewWrap.split('"KPI4_Additional_Feature_Title_2":');
                    if (objKPIresponses4KPI24.size() > 1) {
                        objKPIresponses4KPI24[1] = objKPIresponses4KPI24[1].replace('"type": "text"', '"type":"text"');
                        transient String[] objKPINewDescllist4KPI24 = objKPIresponses4KPI24[1].split('"type":"text"');
                        objKPINewDesc4KPI24 = '"KPI4_Additional_Feature_Title_2":' + objKPINewDescllist4KPI24[0] + '"type": "text" },';
                    }

                    transient String[] objKPIresponses4KPI25 = NewWrap.split('"KPI5_Additional_Feature_Title_2":');
                    if (objKPIresponses4KPI25.size() > 1) {
                        objKPIresponses4KPI25[1] = objKPIresponses4KPI25[1].replace('"type": "text"', '"type":"text"');
                        transient String[] objKPINewDescllist4KPI25 = objKPIresponses4KPI25[1].split('"type":"text"');
                        objKPINewDesc4KPI25 = '"KPI5_Additional_Feature_Title_2":' + objKPINewDescllist4KPI25[0] + '"type": "text" },';
                    }
                    System.debug('========== Heap Size22 :: ' + Limits.getHeapSize());
                    NewWrap = NewWrap.replace(objKPINewDesc4KPI21, KPINewDesc1KPI21);
                    NewWrap = NewWrap.replace(objKPINewDesc4KPI22, KPINewDesc1KPI22);
                    NewWrap = NewWrap.replace(objKPINewDesc4KPI23, KPINewDesc1KPI23);
                    NewWrap = NewWrap.replace(objKPINewDesc4KPI24, KPINewDesc1KPI24);
                    NewWrap = NewWrap.replace(objKPINewDesc4KPI25, KPINewDesc1KPI25);
                    NewWrap = Newwrap.replace('&quot;', '\\"');
                    NewWrap = NewWrap.replace('"type":"text"', '"type": "text"');
                    System.debug('========== Heap Size23 :: ' + Limits.getHeapSize());
                    if (!Test.isRunningTest()) {
                        Slds.analyticscc__Sales_Insight_String4__c = Newwrap;

                        Sales.analyticscc__Sales_Insight_String4__c = Slds.analyticscc__Sales_Insight_String4__c;
                        Sales.Id = Slds.Id;
                    }
                }
            }
            if (!Test.isRunningTest())
            update Sales;
        }
    }


}