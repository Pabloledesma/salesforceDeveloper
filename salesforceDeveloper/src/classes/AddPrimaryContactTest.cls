@isTest
private class AddPrimaryContactTest {
	
	@testSetup
	static void setup(){
		List<Account> nyList = new List<Account>();
		
		for(Integer i = 0; i < 50; i++){
			nyList.add(new Account(Name = 'Test' + i, BillingState = 'NY'));
			nyList.add(new Account(Name = 'Test' + i, BillingState = 'CA'));
		}
		insert nyList;
		
	
	}

    static testMethod void myUnitTest() {
        AddPrimaryContact add = new AddPrimaryContact(new Contact(LastName = 'Test'), 'CA');
        Test.startTest();
        System.enqueueJob(add);
        Test.stopTest();
        
        
        System.assertEquals(100, [select count() from Contact]);
    }
}