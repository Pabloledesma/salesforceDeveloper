trigger OpportunityId on Opportunity (after insert) {
    
    
    
    //Consultar el id del objeto que se insertó
    //1. Armar una lista de los Id
    List<Id> idOp = new List<Id>();
    
    for(Opportunity o: Trigger.new){
        if(o.Country__c == 'Colombia')
        idOp.add(o.Id);
    }
    
    if( idOp.size() > 0 ){
    
         //2. Consultar el id
       /* Opportunity [] idOp2 = [SELECT Id, Country__c, Opp_Id__c, Name FROM Opportunity WHERE Id IN :idOp];
        
        //Consultar el ultimo consecutivo que se genró y con base en ese incrementarlo
        AggregateResult [] res = [SELECT MAX(Opp_Id__c) mayor FROM Opportunity WHERE Country__c = 'Colombia'];
        
        for(AggregateResult r: res){
            System.debug('El mayor es ' + r.get('mayor'));
        }
        
        */
        //List<Opportunity> opp = new List<Opportunity>();
        
        //for(Opportunity o: idOp2){
       //     Max++;
        //    o.Opp_Id__c = Max;             
        //    opp.add(o);
        //}
        
       // update opp;
    
    }
    
   
    
}