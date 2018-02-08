public class ProgramFlowExperiment {
	
	public static Integer EmailCounter = 0;
	
	private void SendEmail()
	{
		EmailCounter++;
		System.Debug('Queueing Email to send');
	}
	
	private void SendQueuedEmails()
	{
		System.debug('Sending Email queue');
	}
	
	private static Set<ID> AlreadyProcessedList = null;
	
	public void HandleContactUpdateTrigger( List<Contact> newList, Map<Id, Contact> oldmap )
	{
		if( AlreadyProcessedList == null ) AlreadyProcessedList = new Set<ID>();
		
		for( Contact ct: newList )
		{
			if( AlreadyProcessedList.contains( ct.Id ) ) continue;
			if( ct.OwnerId != oldmap.get(ct.Id).OwnerId )
			{
				AlreadyProcessedList.add( ct.Id );
				SendEmail();
			}
		}
		SendQueuedEmails();
	}
}