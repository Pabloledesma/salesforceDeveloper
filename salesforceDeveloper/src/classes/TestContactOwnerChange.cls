@isTest
private class TestContactOwnerChange {

    static testMethod void TestOwnerChage() {
        // Create some test contacts
        List<Contact> newContacts = initTestContacts('c', 5);
        
        user u = initTestUser( 'myname', 'myname' );
        
        System.runAs(u)
        {
        	// These contacts will be created with a fake user as owner
        	insert newcontacts;
        }
        
        Test.StartTest();
        
        for( Contact ct: newcontacts )
        {
       		ct.OwnerId = UserInfo.getUserId();
       		ct.Email = 'somewone@somewone.com'; 
        }
        
        update newcontacts;
        
        Test.stopTest();
        
        system.assertEquals(newcontacts.size(), ProgramFlowExperiment.EmailCounter);
        
    }
    
    public static List<Contact> initTestContacts( String prefix, Integer count )
    {
    	List<Contact> results = new List<Contact>();
    	for( Integer x = 1; x < count; x++ )
    	{
    		results.add( new Contact( LastName = prefix + '_' + string.ValueOf(x), 
    		email = prefix + '_' + string.ValueOf(x) + '@apexfundamentals.com' ) );
    	}
    	return results;
    }
    
    public static User initTestUser( String userName, String theAlias )
    {
    	User u = new User( 
    		Alias = theAlias,
    		Email = userName + '@apexfundamentals.com',
    		FirstName = 'Joe',
    		LastName = userName,
    		TimeZoneSidKey = 'America/Los_Angeles',
    		Username = userName + '@apexfundamentals.com',
    		UserPermissionsMarketingUser = true,
    		LocaleSidKey = 'en_US',
    		EmailEncodingKey = 'UTF-8',
    		LanguageLocaleKey = 'en_US'
    	);
    	u.ProfileId = Userinfo.getProfileId();
    	return u;
    }
}