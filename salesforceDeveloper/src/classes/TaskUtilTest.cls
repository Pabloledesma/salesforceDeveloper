@isTest
private class TaskUtilTest {
    @isTest static void testTaskPriorityFromNy() {
        String pri = TaskUtil.getTaskPriority('NY');
        System.assertEquals('Normal', pri);
    }
    
    @isTest static void testTaskPriorityFromCa(){
        String pri = TaskUtil.getTaskPriority('CA');
        System.assertEquals('High', pri);
    }
    
    @isTest static void itReturnsNulWithBlanckString(){
        String pri = TaskUtil.getTaskPriority('');
        System.assertEquals(null, pri);
    }
}