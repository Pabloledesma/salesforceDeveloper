public with sharing class RemoteActionCaseNotificationsController {
	
	@RemoteAction 
	public static Case returnCase( String caseId ){
		return [SELECT Id, caseNumber, status, priority, owner.Name, account.Name, contact.Name FROM Case WHERE Id = :caseId];
	}

	public RemoteActionCaseNotificationsController() {
		
	}
}