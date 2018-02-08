/**
 * Created by pablo on 3/07/2017.
 */
@isTest
private class PositionC_Test {

    @isTest
    private static void assignRecruiterRegion1()
    {

        User admin = TestDataFactory.buildTestUser(1, 'System Administrator');
        insert admin;

        Position__c position = TestDataFactory.buildTestPostion(1, admin.Id);
        insert position;

        Position__c dbPosition = [SELECT Region__c from Position__c WHERE Id = :position.Id];
        System.assertEquals(dbPosition.Region__c, admin.Region__c);
    }
}