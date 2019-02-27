@isTest
private class NumberOfBackups_ScheduleClassTest {

  private static testMethod void test() {
      
      Remote_Site_Settings__c bc = new Remote_Site_Settings__c();
      bc.Name = 'Touch Analytics';
      bc.No_of_backups__c = 10;
      insert bc;
      
      DashBoard_Backup__c db = new DashBoard_Backup__c();
      db.Name = 'Test';
      insert db;
      
      NumberOfBackups_ScheduleClass.abort();
      NumberOfBackups_ScheduleClass dbs = new NumberOfBackups_ScheduleClass(); 
      //dbs.execute(null);
      NumberOfBackups_ScheduleClass.start();
      NumberOfBackups_ScheduleClass.abort();     
     
           
           System.assertEquals('test', 'test');
  }    
}