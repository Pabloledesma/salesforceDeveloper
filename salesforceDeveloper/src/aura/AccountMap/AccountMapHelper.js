({
    navigateToDetailsView : function(accountId) {
        var event = $A.get("e.force:navigateToSObject");
        console.log(event);
        event.setParams({
            "recordId": accountId
        });
        event.fire();
    }
})