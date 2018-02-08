public with sharing class ListOpportunitiesController {

    List<Opportunity> opps;

    public List<Opportunity> getOpps()
    {
        opps = [Select Id, Name, Amount, StageName, Type, Probability, CloseDate, ExpectedRevenue from Opportunity];
       
        return opps;
    }
    
}