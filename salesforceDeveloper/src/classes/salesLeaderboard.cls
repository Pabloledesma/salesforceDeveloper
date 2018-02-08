public class salesLeaderboard {

	public List<AggregateResult> aggregateOpps { 
		get {
			if( aggregateOpps == null ){
				aggregateOpps = new List<AggregateResult>();
				for( AggregateResult o : [SELECT OwnerId, SUM(Amount) amt, COUNT(Name) cnt 
											FROM Opportunity WHERE CloseDate = THIS_YEAR 
											AND IsWon = true group by ROLLUP(OwnerId) order by sum(Amount) desc] )
				{
					if( o.get('OwnerId') != null && o.get('amt') != null && o.get('cnt') != null )
					{
						aggregateOpps.add(o);
					}
				}
			}
			return aggregateOpps;
		}
		set;  
	}

	public Set<Id> ownerIds {
		get {
			if( ownerIds == null ){
				ownerIds = new Set<Id>();
				for( AggregateResult ar : aggregateOpps ){
					ownerIds.add( String.valueOf(ar.get( 'OwnerId' )) );
				}
			}
			return ownerIds;
		}
		set;
	}

	public Map<Id, User> salesUsers {
		get {
			if( salesUsers == null ){
				salesUsers = new Map<Id, User>();
				for( User u : [SELECT SmallPhotoUrl, Name, Id FROM User WHERE Id IN :ownerIds] ){
					salesUsers.put( u.Id, u );
				}
			}
			return salesUsers;
		}
		set; 
	}

	public List<leaderData> getLeaders() {
		List<leaderData> leaders = new List<leaderData>();
		if( aggregateOpps != null && salesUsers != null ){
			for( AggregateResult ar : aggregateOpps ){
				leaders.add( new leaderData( 
					salesUsers.get( String.valueOf( ar.get( 'OwnerId' ) ) ).Name,
					salesUsers.get( String.valueOf( ar.get( 'OwnerId' ) ) ).SmallPhotoUrl,
					Integer.valueOf(  ar.get( 'cnt' ) ),
					Double.valueOf( ar.get( 'amt' ) )  
				) );
			}
		}
		return leaders;
	}

	public salesLeaderboard() 
	{
		
	}
}