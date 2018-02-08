/**
 * Created by pablo on 3/07/2017.
 */

trigger PositionC_AssignRecruiterRegion on Position__c (before insert, before update)
{
    for(Position__c position : Trigger.new){
        System.debug('PositionC_AssignRecruiterRegion After: ' + position.Region__c);
        //PositionC_Utilities.assignRegion1(position);
        PositionC_Utilities.assignRegion2(position);
    }
}