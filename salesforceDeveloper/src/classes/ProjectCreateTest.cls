@isTest
private class ProjectCreateTest
{
	@isTest
	static void testControllerExtension()
	{
		Project__c project = new Project__c();
		ApexPages.StandardController sc = new ApexPages.StandardController(project);
		ProjectCreateExtension pce = new ProjectCreateExtension( sc );
		project.name = 'Test Project';
		project.Budget__c = 1000;
		project.Start_Date__c = system.today();
		pce.ToPage2();
		system.assert([select id from project__c].size() == 1);
	}
}