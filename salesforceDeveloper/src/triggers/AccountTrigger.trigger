trigger AccountTrigger on Account (after insert) {
    
    //Crea una lista de contactos
    List<Contact> contact_list = new List<Contact>();
    Integer contador = Trigger.new.size();
    Integer i = 0;
    
    for(Account c: Trigger.new){
        Contact new_c = new Contact( AccountId = c.id, LastName = 'Last' + i );
        contact_list.add( new_c );
        i++;
    }
    
    insert contact_list;

}