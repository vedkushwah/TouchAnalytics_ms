@isTest
global class MockDashboardBackup implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"example":"test"}');
        //res.setStatusCode(200);
        system.assertEquals('test', 'test');
        return res;  
    }
}