trigger AccountAddressTrigger on Account (before insert, before update) {
    if( (trigger.new[0].BillingPostalCode != null) && trigger.new[0].Match_Billing_Address__c ){
        trigger.new[0].ShippingPostalCode = trigger.new[0].BillingPostalCode;
    }
}