public with sharing class AccountSearchRemoting {

        
    // Remote Action method to search for Accounts  
    // All that changed in this is the addition of the
    // @RemoteAction keyword, changing the method to 
    // be static and accept a parameter of the accountName,
    // as well as return a list of accounts
    // and returning the list of accounts 
    @RemoteAction
    public static List<Account> searchAccounts(String accountName) {  
     
        String searchWord = accountName + '%';  
        return [SELECT AccountNumber,Name,Phone,Industry,Website 
              FROM Account 
              WHERE Name like : searchWord];  
    }  

}