public with sharing class AccountTest {
	
	private final Id accountId;
	transient public final String accountName { get; set; }
	
	public AccountTest(){
		Account account = [
			select id, name from account where id = :ApexPages.currentPage().getParameters().get('id')
		];
		accountId = account.Id;
		accountName = account.Name;
	}
	
	public PageReference save(){
		Account myAccount = [select name from account where id = :accountId];
		myAccount.Name = accountName;
		update myAccount;
		return null;
	}

}