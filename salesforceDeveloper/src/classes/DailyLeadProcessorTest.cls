@isTest
public class DailyLeadProcessorTest {
	public static String CRON_EXP = '0 0 0 30 5 ? 2017';
    
    static testmethod void testScheduledJob(){
        //Create 200 leads
        List<Lead> lstLeads = new List<Lead>();
        
        for(Integer i = 0; i < 200; i++ ){
            lstLeads.add(new Lead(Company = 'Test'+i, LastName = 'LastName', LeadSource = ''));
        }
        
        insert lstLeads;

        System.assertEquals(200, [select COUNT() from Lead where LeadSource = '']);
        
        Test.startTest();
         String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP,
            new DailyLeadProcessor()); 
        
        Test.stopTest();
        
        
    }
}