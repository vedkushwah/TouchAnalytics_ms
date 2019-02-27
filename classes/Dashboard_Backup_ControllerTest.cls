@isTest
private class Dashboard_Backup_ControllerTest {

  private static testMethod void test() {
      DashBoard_Backup__c dBackup = new DashBoard_Backup__c();
      dBackUp.Name = 'My BackUp';
      dBackup.Full_Backup__c = true;
      insert dBackUp;
      
      DashBoards__c db = new DashBoards__c();
      db.Name = 'Test DB';
      db.DashBoard_Backup__c = dBackUp.id;
      db.URL__c = '/services/data/v39.0/wave/dashboards/0FK46000000GzV3GAK';
      insert db;
      
      String str = UserInfo.getSessionId();
      
      Dashboard_Backup_Controller dc = new Dashboard_Backup_Controller();
      
      dc.getDashboard(str);
      Future_Backup_Batch.invokeBatch();
      
      SettingsController s = new SettingsController();
      s.getvalues();
      s.listVal = '6';
      s.abort();
      s.chbxvalue = true;
      s.user = 'admin@analyticscc.com.touchbackup';
      s.password = 'wave1234';
      //s.securityToken = '***';
      s.createSetting('7');
      s.getAllDashboards();
      s.redirect();
      s.scheduleBackUp();
      s.scheduleNumberOfBackups();
      s.getDashBoardData();
      s.dashboardCal();
      //s.remoteSiteSettings();
      s.verifyError();
      System.assertEquals('Test DB',db.Name);
      
      Future_Backup_Batch.invokeBatch();
      Future_Backup_Batch.invokeBatchDB();
      
      Insert_Attachment_ScheduleClass.start('7');
  }

}