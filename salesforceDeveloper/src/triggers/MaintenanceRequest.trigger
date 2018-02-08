trigger MaintenanceRequest on Case (before update, after update) {
    
    if(trigger.isUpdate && trigger.isBefore){
        for(Case newCase : trigger.new){
            Case oldCase = trigger.oldMap.get(newCase.Id);
            if(oldCase.Type != newCase.Type && newCase.Type == 'Closed'){
                system.debug('Ejecutando updateWorkOrders...');
                MaintenanceRequestHelper.updateWorkOrders(newCase);  
            }
        }
    }
     

}