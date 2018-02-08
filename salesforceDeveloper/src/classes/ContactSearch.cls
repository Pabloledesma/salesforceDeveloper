public class ContactSearch {

    public static List<Contact> searchForContacts(String lastName, String postalCode)
    {
     	List<Contact> contactList = new List<Contact>();
        contactList = [SELECT ID, Name from Contact WHERE (LastName = :lastName AND MailingPostalCode = :postalCode)];
        return contactList;
    }
    
}