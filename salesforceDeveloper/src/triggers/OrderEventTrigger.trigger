trigger OrderEventTrigger on Order_Event__e (after insert) {
	
	List<Task> lstTasks = new List<Task>();
	
	for(Order_Event__e event : Trigger.new){
		if(event.Has_Shipped__c == true){
			Task task = new Task(
				Priority 	= 'Medium',
				Status 		= 'New',
				Subject 	= 'Follow up on shipped order ' + event.Order_Number__c,
				OwnerId 	= '005o0000001eja3'
			);
			
			lstTasks.add(task);
		}
	}
	
	if(!lstTasks.isEmpty())
	insert lstTasks;
    
}