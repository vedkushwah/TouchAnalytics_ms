@isTest
private class CreateDashboardServiceTest {

  private static testMethod void test() {
      
      DashBoards__c db = new DashBoards__c();
      db.Name = 'Test DB';
      insert db;
      
      CreateDashboardService cds = new CreateDashboardService();
      CreateDashboardService.createDashboard('Test DB', String.valueOf(db.Id));
      System.assertEquals('Test DB', db.Name);

  }

}