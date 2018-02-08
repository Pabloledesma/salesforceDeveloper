public with sharing class SidebarSummaryController {

    public Map<String, Integer> oppstages { get; set; }
    
    public SidebarSummaryController()
    {
        oppstages = new Map<String, Integer>();
        
        for(AggregateResult ar: [select StageName, count(ID) cnt FROM Opportunity GROUP BY StageName])
        {
            oppStages.put((String) ar.get('StageName'), (Integer) ar.get('cnt'));    
        }
        
    }
}