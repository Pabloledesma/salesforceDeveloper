public class ProjectCreateExtension {

	private ApexPages.StandardController sc;
	public Sprint__c sprint {  get; set; }
	public List<Sprint__c> sprints { get; set; }
	public List<Story__c> stories { get; set; }
	public Story__c story { get; set; }
	public String hello { get; private set; }   //read only string
	public String selectedSprint { get; set; }
	public Project__c project { get; set; }
	 
	public ProjectCreateExtension( ApexPages.StandardController standardController )
	{
		// store a reference to the standard controller
		sc = standardController;
		sprint = new Sprint__c();
		hello = 'Este es el saludo inicial!!';
		//create a new list to store the sprints added by the user
		sprints = new List<Sprint__c>();
		story = new Story__c();
		stories = new List<Story__c>();
		project = new Project__c();
	}
	
	public String getHello()
	{
		return hello;
	}

	public PageReference ToPage1()
	{
		return Page.Project_Creation;
	}
	
	public PageReference ToPage2()
	{
		if( ApexPages.CurrentPage().getURL().ToLowerCase().contains('project_creation') )
		{
			sc.save();
			project = (Project__c)sc.getRecord();
			sprints = [select id, name, start_date__c from sprint__c where project__c = :project.id];
			system.debug('Se encontraron los siguientes sprints para el proyecto ' + project.id + ': ' + sprints);
		}
		return Page.Page2; 
	}
	
	public PageReference ToPage3()
	{
		stories = [select id, theme__c, points__c, sprint__c from story__c where sprint__c = :selectedSprint];
		return Page.Page3;
	}

	public PageReference SaveSprint()
	{
		Project__c project = (Project__c)sc.getRecord();
		sprint.project__c = project.id;
		insert sprint;

		sprints.add(sprint);
		sprint = new Sprint__c();
		return null;
	}

	public PageReference SaveStory()
	{
		story.sprint__c = selectedSprint;
		insert story;

		stories.add(story);
		story = new Story__c();

		return null;
	}
}