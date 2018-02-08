/**
 * Created by pablo on 25/06/2017.
 */

public with sharing class MyContactListController
{
    @AuraEnabled
    public static List<Contact> getContacts()
    {
        return [SELECT Id, Name, Email, Title, Phone FROM Contact];
    }
}