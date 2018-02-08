public class ContactAndLeadSearch {

    public static List<List< SObject>> searchContactsAndLeads(String query)
    {
        List<List< SObject>> searchList = [FIND :query IN ALL FIELDS RETURNING Contact(Name), Lead(Name, Company)];
        System.debug(searchList);
        return searchList;
    }
    
}