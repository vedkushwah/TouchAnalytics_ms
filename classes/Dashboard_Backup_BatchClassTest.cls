@isTest
private class Dashboard_Backup_BatchClassTest {

  private static testMethod void test() {
     
      Remote_Site_Settings__c TBsettings=new Remote_Site_Settings__c();
      TBsettings.Notification__c=true;
      TBsettings.Time__c='test';
      TBsettings.User_Email__c='mahesh@diligentforcelabs.com';
      TBsettings.Name='Touch Ex';
      TBsettings.Username__c = 'test@test.com';
      TBsettings.Password__c = '123456';
     
      insert TBsettings;
  
      List<String> str = new List<String>(); 
      DashBoards__c db = new DashBoards__c();
      db.Name = 'Test DB';
      db.URL__c = 'https://services/dashboards';
      insert db;
      str.add(db.Id);
      
      Attachment att = new Attachment();
      att.ParentId = db.Id;
      att.Name = 'Test Attachment';
      att.Body = Blob.valueOf('Test DB');
      insert att;
      
       Dashboard_Backup_BatchClass dbb = new  Dashboard_Backup_BatchClass();
       dbb.Dashboard_Backup_BatchClassMain(str, UserInfo.getSessionId());
       
       System.assertEquals('Test DB', db.Name);
  }

}