public with sharing class CustomAccountListController {
	
	public ApexPages.StandardSetController ssc { get; set; }
	public List<SelectOption> sizeOptions { get; private set; }
	public String chosenSize { get; set; }
	
	public CustomAccountListController()
	{
		ssc = new ApexPages.StandardSetController([
			select Id, Name, Rating, NumberOfEmployees from Account limit 500
		]); 
		
		sizeOptions = new List<SelectOption>
		{
			new SelectOption('small', 'Small'),
			new SelectOption('medium', 'Medium'),
			new SelectOption('large', 'Large')
		};
		
		chosenSize = 'large';
		ApplyFilter();
	}
	
	public List<Account> getAccounts()
	{
		return (List<Account>)ssc.GetRecords();
	}
	
	public PageReference ApplyFilter()
	{
		String query = 'select id, name, rating, numberofemployees from account where ';
		
		if( chosenSize == 'small' )
		{
			query += 'numberofemployees <= 100 ';
		}
		else if( chosenSize == 'medium' )
		{
			query += 'numberofemployees > 100 and numberofemployees <= 500 ';
		}
		else if( chosenSize == 'large' )
		{
			query += 'numberofemployees > 500 ';
		}
		
		query += 'limit 500 ';
		
		ssc = new ApexPages.StandardSetController( Database.Query( query ) );
		if(true)
			ApexPages.AddMessage( new ApexPages.Message( ApexPages.Severity.Info, 'Este es el error de prueba' ) );
		return null;
	}
}