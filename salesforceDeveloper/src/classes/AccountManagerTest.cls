@isTest
public class AccountManagerTest {
	@isTest
    static void testGetContactsFromAccount(){
        Account ac = new Account(Name = 'Test');
        insert ac;
        Contact c = new Contact(LastName = 'Lastest', AccountId = ac.Id);
        insert c;
        
        RestRequest request = new RestRequest();
        request.requestURI = 'https://na17.salesforce.com/services/apexrest/Accounts/'+ac.Id+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        Account result = AccountManager.getAccount();
        System.assertEquals(
        	ac.Id,
            result.Id,
            'Los resultados no son los esperados'
        );
        
    }
}