public class AddPrimaryContact implements Queueable {
	
	private Contact contact;
	private String state;
	
	public AddPrimaryContact(Contact c, String state){
		this.contact = c;
		this.state = state;
	}
	
    public void execute(QueueableContext context){
    	List<Account> lstAccounts = [select Id, BillingState from Account where BillingState = :this.state limit 200];
    	List<Contact> lstContacts = new List<Contact>();
    	for(Account acc : lstAccounts){
    		Contact cont = this.contact.clone();
    		cont.accountId = acc.Id;
    		lstContacts.add(cont);
    	}
    	insert lstContacts;
    }
}