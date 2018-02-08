public class MyWizardController {
	
	public Account account { get; set; }
	public Contact contact { get; set; }
	
	public MyWizardController() {
		account = new Account();
		contact = new Contact();
	}
	
	public PageReference next() {
		return Page.step2;
	}
	
	public PageReference previous() {
		return Page.step1;
	}
	
	public PageReference save() {
		Database.insert(account);
		contact.accountId = account.id;
		ApexPages.StandardController contactController = new ApexPages.StandardController(contact);
		return contactController.save();
	}
}