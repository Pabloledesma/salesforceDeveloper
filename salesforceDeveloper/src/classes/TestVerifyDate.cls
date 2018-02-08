@isTest
private class TestVerifyDate {
	@isTest
    static void date2_is_within_the_next_30_days_of_date1(){
        Date date1 = Date.newInstance(2017, 04, 01);
        Date date2 = Date.today();
        
        System.assertEquals(date2, VerifyDate.CheckDates(date1, date2)); 
    }
    
    @isTest
    static void date2_is_not_within_the_next_30_days_of_date1(){
        Date date2 = Date.newInstance(2017, 04, 01);
        Date date1 = Date.today();
        
        System.assertEquals(Date.newInstance(2017, 04, 30), VerifyDate.CheckDates(date1, date2)); 
    }
}