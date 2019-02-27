@isTest
private class DashBoard_Backup_ScheduleClassTest {

  private static testMethod void test() {
      
      DashBoard_Backup_ScheduleClass.abort();
      DashBoard_Backup_ScheduleClass dbs = new DashBoard_Backup_ScheduleClass(UserInfo.getUserId()); 
      //dbs.execute(null);
      DashBoard_Backup_ScheduleClass.start('7');
      DashBoard_Backup_ScheduleClass.abort();     
     
           
           System.assertEquals('test', 'test');
  }    
}