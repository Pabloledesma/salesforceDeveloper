public with sharing class AccountProcessor {
    @future
    public static void countContacts(List<Id>AccountIds){
    	List<Account> lstAccounts = new List<Account>();
    	for(Id accountId: AccountIds){
    		//It is not recomended
    		AggregateResult result = [Select AccountId, Count(Name) numberOfContacts from Contact where AccountId = :accountId group by AccountId ];
    		lstAccounts.add(
    			new Account(Id = accountId, Number_of_Contacts__c = (Integer) result.get('numberOfContacts'))
    		);
    	}
    	
    	update lstAccounts;
    }
}