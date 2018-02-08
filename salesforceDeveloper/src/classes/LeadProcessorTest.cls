@isTest
private class LeadProcessorTest {

    @testSetup
    static void setup() {
        List<Lead> lstLeads = new List<Lead>();
        for(Integer i = 0; i < 200; i++){
        	lstLeads.add(new Lead(LastName = 'Test' + i, Company = 'Company Test'));
        }
        insert lstLeads;
    }
    
    static testmethod void test(){
    	Test.startTest();
    	LeadProcessor lp = new LeadProcessor();
    	Id batchId = Database.executeBatch(lp);
    	Test.stopTest();
    	
    	System.assertEquals(200, [select count() from lead where LeadSource = 'Dreamforce']);
    }
}