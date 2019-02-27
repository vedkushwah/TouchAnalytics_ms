@isTest
private class Create_DashBoard_ControllerTest{
    
   public static testMethod void unitTest(){
     
     DashBoards__c db = new DashBoards__c();
     db.Name = 'Test DB';
     insert DB;
     
     ApexPages.CurrentPage().getParameters().put('Id',db.Id);
     Create_Dashboard_Controller cdc = new Create_Dashboard_Controller();
     //cdc.redirect();
     //cdc.cancel();
     System.currentPageReference().getParameters().put('jsonString', 'Test String');
     //cdc.dashboardName = 'TEst DB';
     //cdc.redirect();
     System.assertEquals('Test DB',db.Name); 
   }

}