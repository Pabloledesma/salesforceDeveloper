public with sharing class CampingListController {

    @AuraEnabled
    public static List<Camping_Item__c> getItems(){
        return [select Id, Name, Packed__c, Price__c, Quantity__c from Camping_Item__c];
    }
    
    @AuraEnabled
    public static Camping_Item__c saveItem(Camping_Item__c newItem){
        upsert newItem;
        return newItem;
    }
    
}