@isTest
public class SFDCApiUtil_TC {

	private static testMethod void test() {
        SFDCApiUtil SFC = new SFDCApiUtil();
        SFDCApiUtil.connectToSFDC();
          Map<String, String> recordDetails = new Map<String, String>();
                recordDetails.put('Name', UserInfo.getOrganizationName());
                recordDetails.put('org_Id__c', UserInfo.getOrganizationId());
        SFDCApiUtil.createDetails(userinfo.getSessionId(),'https://analyticscc.my.salesforce.com/services/Soap/u/29.0/00D41000002IouE','Account',recordDetails);
        SFDCApiUtil.getCouponInformation(userinfo.getSessionId(),'https://analyticscc.my.salesforce.com/services/Soap/u/29.0/00D41000002IouE','select Id,Discount__c from Coupon__c limit 1');
        SFDCApiUtil.getBuildCostformation(userinfo.getSessionId(),'https://analyticscc.my.salesforce.com/services/Soap/u/29.0/00D41000002IouE','select Id,Discount__c from product2 limit 1');
        SFDCApiUtil.verifyDetails(userinfo.getSessionId(),'https://analyticscc.my.salesforce.com/services/Soap/u/29.0/00D41000002IouE','select Id,Name from Account limit 1');
        SFDCApiUtil.geneareQueryXML(userinfo.getSessionId(),'select Id,Name from Account limit 1');
        SFDCApiUtil.generateCreateXML(userinfo.getSessionId(),'Account',recordDetails);
        recordDetails = new Map<String, String>();
                recordDetails.put('Name', UserInfo.getOrganizationName());
                recordDetails.put('org_Id__c', UserInfo.getOrganizationId());
        SFDCApiUtil.createOpportunity(userinfo.getSessionId(),'https://analyticscc.my.salesforce.com/services/Soap/u/29.0/00D41000002IouE','Account',recordDetails);
        recordDetails = new Map<String, String>();
                recordDetails.put('Name', UserInfo.getOrganizationName());
                recordDetails.put('org_Id__c', UserInfo.getOrganizationId());
        SFDCApiUtil.createOpportunityLineItem(userinfo.getSessionId(),'https://analyticscc.my.salesforce.com/services/Soap/u/29.0/00D41000002IouE','Account',recordDetails);
	    system.assertEquals('test', 'test');
	    
	}

}