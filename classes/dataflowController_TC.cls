@isTest
private class dataflowController_TC {

	private static testMethod void dataflowControllerTest() {
        dataflowController BC = new dataflowController();
        BC.booleanConnections();
        
        SFDCApiUtil.connectResponseClass connectResponse = new SFDCApiUtil.connectResponseClass();
        connectResponse.response = true;
        connectResponse.sessionId = userinfo.getsessionId();
        connectResponse.responseServerUrl = 'www.test.com';
        BC.connectToSFDC();
        BC.verifyAccountDetails();
        BC.verifyContactDetails();
        BC.openTouchHome();
        BC.accountRecId = '123345';
        BC.contactRecId = '123345';
        BC.opportunityRecId = '123345';
        BC.opportunityLineItemRecId = '123345';
        BC.recordTypeId = '123345';
        BC.priceBookId = '123345';
        BC.selectedDashboard = '123345';
        BC.displayConnectButtons = true;
        BC.BuildCost = 123345;
        BC.CouponCode  = '123345';
        BC.CouponCodeId  = '123345';
        BC.CouponValue = 123345;
        BC.TotalCost = 123345;
        BC.CreditsRemaining = 12345;
        
	}

}