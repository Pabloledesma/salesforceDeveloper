public class MaintenanceRequestHelper {
    
    public static void updateWorkOrders(Case caseUpdated){
        
        List<Work_part__c> lstWorkPart = new List<Work_part__c>();
        lstWorkPart = [
            select
            	Id,
            	Maintenance_Request__C,
            	Equipment__r.Maintenance_cycle__c 
            from Work_part__c
            where Maintenance_Request__c = :caseUpdated.Id	
        ];
        system.debug('lstWorkPart: ' + lstWorkPart);
        if( !lstWorkPart.isEmpty() ){
            List<Integer> maintenanceCycle = new List<Integer>();
            for(Work_Part__c wp : lstWorkPart){
                maintenanceCycle.add(Integer.valueOf(wp.Equipment__r.Maintenance_cycle__c));
                
            }
            
            if( !maintenanceCycle.isEmpty() ){
                
                maintenanceCycle.sort();
                Case newCase = new Case(
                	Vehicle__c = caseUpdated.Vehicle__c,
                    Date_due__c = Date.today().addDays(maintenanceCycle[0]),
                    Type = 'Routine Maintenance'
                );
                
                insert newCase;
            }
        }
            
         
        
    }        
    
}