@isTest
private class testClass1
{
	@isTest
	static void itShould()
	{
		MyTestClass mt = new MyTestClass();
		Account acc = new Account();
		acc.Name = 'Acme Account';
		insert acc;
	}
}