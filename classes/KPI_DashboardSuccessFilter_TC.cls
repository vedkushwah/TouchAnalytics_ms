@isTest
private class KPI_DashboardSuccessFilter_TC {

    static testMethod void myUnitTest() {
         Sales_Insight__c sales = new Sales_Insight__c();
         sales.name = 'Sales Insight';
         insert sales;
        list<String> values = new List<String>();
        values.add('1234');
        values.add('Success');
        KPI_DashboardSuccessFilter.m_createDashboard('54321',values,sales.Id,'Test',userinfo.getSessionId());
        System.assertEquals('1234',Values[0]);
    }
}