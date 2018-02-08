public class dataTableController {

	public List<Account> accounts;
	public List<Account> getAccounts()
	{
		if( accounts == null ) accounts = [select name, owner.name from account order by name];
		return accounts;
	}
}