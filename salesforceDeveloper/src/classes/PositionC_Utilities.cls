/**
 * Created by pablo on 3/07/2017.
 */

public with sharing class PositionC_Utilities
{
    public static void assignRegion1(Position__c position)
    {
        //Get the recruiters region from the database
        User recruiter = [SELECT Region__c FROM User WHERE Id = :position.OwnerId AND Region__c = null];
        position.Region__c = recruiter.Region__c;
        System.debug('Region asignada: ' + recruiter.Region__c);

    }

    public static void assignRegion2(Position__c position)
    {
        try {
            User recruiter = [SELECT Region__c FROM User WHERE Id = :position.OwnerId AND Region__c = null];
            position.Region__c = recruiter.Region__c;
        } catch (QueryException e) {
            System.debug('Query exception');
            position.Region__c = 'Queue Owned';
        }
    }
}