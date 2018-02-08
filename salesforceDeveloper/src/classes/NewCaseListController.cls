public class NewCaseListController {

    public List<Case> getNewCases()
    {
        List<Case> result = Database.query('SELECT Id, CaseNumber from Case WHERE Status = \'New\'');
        return result;
    }

}