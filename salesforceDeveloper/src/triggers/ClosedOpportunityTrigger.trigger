trigger ClosedOpportunityTrigger on Opportunity (before insert, before update) {
    
    List<Task> Tasks = new List<Task>();
    for( Opportunity o : trigger.new ){
        if( o.StageName == 'Closed Won' )
        Tasks.add(new Task(Subject = 'Follow Up Test Task', WhatId = trigger.new[0].Id));
    }
    
    insert Tasks;
}