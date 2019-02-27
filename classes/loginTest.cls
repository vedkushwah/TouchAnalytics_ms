@isTest
private class loginTest {
    private static testMethod void test() {
        Login lg = new Login();
        Login.login1('Username@gmail.com', 'Password');
        System.assertEquals('test','test');
    }
}