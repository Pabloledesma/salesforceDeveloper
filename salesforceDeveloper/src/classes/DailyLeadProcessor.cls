global class DailyLeadProcessor implements Schedulable {

    global void execute(SchedulableContext ctx){
        List<Lead> lstLeads = [select Id, LeadSource from Lead where LeadSource = '' limit 200];
        System.debug(lstLeads.size());
        for(Lead l: lstLeads){
            l.LeadSource = 'Dreamforce';
        }
        
        update lstLeads;
    }
    
}