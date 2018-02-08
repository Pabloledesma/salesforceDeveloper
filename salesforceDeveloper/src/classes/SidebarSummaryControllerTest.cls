@isTest
private class SidebarSummaryControllerTest {
	static testMethod void SidebarTest()
    {
        Account acc = new Account(Name='My Account');
        insert acc;
        
        Opportunity opp = new Opportunity(
        	AccountId = acc.Id,
            Name = 'My Opportunity',
            StageName = 'Prospecting',
            CloseDate = date.today()
        );
        insert opp;
        
        SidebarSummaryController ctrl = new SidebarSummaryController();
        Test.startTest();
        Map<String, Integer> testStages = ctrl.oppstages;
        Test.stopTest();
        System.assertEquals(testStages.size(), 1);
    }
}