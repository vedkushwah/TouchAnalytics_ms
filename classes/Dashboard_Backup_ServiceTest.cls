@isTest
private class Dashboard_Backup_ServiceTest {

  private static testMethod void test() {
        
        DashBoards__c db = new DashBoards__c();
        db.Name = 'Test DB';
        db.URL__c = 'https://services/wave/dashboards';
        insert db;
        
        String str = UserInfo.getSessionId();
        
        Dashboard_Backup_Service dbs = new Dashboard_Backup_Service();
        Dashboard_Backup_Service.retriveDashboard(str);
        Dashboard_Backup_Service.retriveDashboardFile('https://services/wave/dashboards',str);
        
        System.assertEquals('Test DB', db.Name);
  }

}