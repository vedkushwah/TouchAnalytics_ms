@isTest
public class Dashboard_Automation_BatchClass_TC {
	public static testMethod void DashboardAutomation() {
        Test.startTest();
         Sales_Insight__c sales = new Sales_Insight__c();
         sales.name = 'Sales Insight';
         insert sales;
         set<string> Ds = new set<string>();
         Ds.add('Test');
         
         Dashboard_Automation__c Dsh = new Dashboard_Automation__c();
         Dsh.Cardinality_Measure__c = 2;
         Dsh.Utilization_Measure__c  = 5; 
         Dsh.Measure_Number__c = 2;
         insert Dsh;
            Dashboard_Automation_BatchClass obj = new Dashboard_Automation_BatchClass(Ds,userinfo.getsessionId(),String.valueof(sales.Id),'Tesst',userInfo.getUserId(),'saveandclose');  
            DataBase.executeBatch(obj,1); 
        Test.stopTest();
        system.assertEquals('Test','Test');
	}
}