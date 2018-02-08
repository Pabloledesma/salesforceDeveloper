public class RandomContactFactory {
	public static List<Contact> generateRandomContacts(Integer numberOfContacts, String lastName)
    {
        List<Contact> contacts = new List<Contact>();
        for(Integer i = 0; i < numberOfContacts; i++){
            contacts.add(new Contact(FirstName = 'Test ' + i, LastName = lastName));
        }
        return contacts;
    }
}