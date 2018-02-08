public with sharing class futureExperiment {

	@future
	public static void test1()
	{
		system.debug('in future call');
	}
	
	public static Boolean futuresent = false;
	
	public static void test2()
	{
		if(System.isFuture() || system.isBatch())
		{
			system.debug('Es el futuro!!');
			return;
		}
		if(futuresent) return;
		futuresent = true;
		test2future();
	}
	
	@future
	public static void test2future()
	{
		system.debug('in future call');
	}

}