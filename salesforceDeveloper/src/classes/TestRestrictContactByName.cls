@isTest
private class TestRestrictContactByName {

    @isTest static void contactWhitInvalidName(){
        Contact c = new Contact(FirstName = 'Test', LastName = 'invalidname');
        
        Test.startTest();
        Database.SaveResult result = Database.insert(c, false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assertEquals( 
			'The Last Name "'+c.LastName+'" is not allowed for DML',
            result.getErrors()[0].getMessage()
        );
    }
    
}