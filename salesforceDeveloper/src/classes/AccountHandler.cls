public class AccountHandler {

    public static Account InsertNewAccount(String name)
    {
        try {
            Account acc = new Account(Name = name);
            insert acc;
            return acc;
        } catch(DmlException e) {
        	System.debug('A DML Exception has ocurred: ' + e.getMessage());
            return null;
        }
        
    }
    
}