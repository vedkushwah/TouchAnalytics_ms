@isTest
private class Wave_CreateDateXMD_TC {

    static testMethod void myUnitTest() {
       String Id = '0Fb36000000H8iHCAS';
       Wave_CreateDateXMD.CreateDateXMD(Id);
       Wave_CreateDateXMD.parse('{"createdBy":{"id":"00536000002nHMjAAM","name":"Joseph Yelle","profilePhotoUrl":"https://analyticscloudconsulting-dev-ed--c.na30.content.force.com/profilephoto/005/T"},"createdDate":"2016-08-25T18:38:54.000Z","currentVersionId":"0Fc360000010Yy6CAE","currentVersionUrl":"/services/data/v39.0/wave/datasets/0Fb36000000H8iHCAS/versions/0Fc360000010Yy6CAE","folder":{"id":"00l36000001F7uQAAS","label":"Comity Dashboard Builder","name":"Comity_Dashboard_Builder","namespace":"analyticscc","url":"/services/data/v39.0/wave/folders/00l36000001F7uQAAS"},"id":"0Fb36000000H8iHCAS","label":"All Opportunities","lastAccessedDate":"2017-03-25T06:07:33.000Z","lastModifiedBy":{"id":"00536000002nHMsAAM","name":"Security User","profilePhotoUrl":"https://analyticscloudconsulting-dev-ed--c.na30.content.force.com/profilephoto/005/T"},"lastModifiedDate":"2017-03-25T04:42:57.000Z","lastQueriedDate":"2017-03-25T04:42:57.000Z","name":"All_Opportunities","namespace":"analyticscc","permissions":{"manage":true,"modify":true,"view":true},"type":"dataset","url":"/services/data/v39.0/wave/datasets/0Fb36000000H8iHCAS","versionsUrl":"/services/data/v39.0/wave/datasets/0Fb36000000H8iHCAS/versions"}');
       System.assertEquals('0Fb36000000H8iHCAS',Id);
    }
}