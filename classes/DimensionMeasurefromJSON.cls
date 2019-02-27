//
//Generated by AdminBooster
//

public class DimensionMeasurefromJSON{
	public String action;	//query
	public String responseId;	//4GAST_hfMXpobfVeRhidfk
	public cls_results results;
	public String query;	//q = load "0Fb36000000H8iHCAS/0Fc360000010Yy6CAE";q = group q by all;q = foreach q generate unique('FiscalQuarter') as 'FiscalQuarter',unique('FiscalYear') as 'FiscalYear',unique('TotalOpportunityQuantity') as 'TotalOpportunityQuantity',unique('ExpectedRevenue') as 'ExpectedRevenue',unique('Amount') as 'Amount',unique('Probability') as 'Probability';q = limit q 2000;
	public Integer responseTime;	//23
	public class cls_results {
		public cls_metadata[] metadata;
		public cls_records[] records;
	}
	public class cls_metadata {
		public cls_columns[] columns;
		public cls_groups[] groups;
	}
	public class cls_columns {
		public String name;	//FiscalQuarter
		public String type;	//numeric
	}
	public class cls_groups {
	}
	public class cls_records {
		public Integer Amount;	//705
		public Integer ExpectedRevenue;	//583
		public Integer FiscalQuarter;	//4
		public Integer FiscalYear;	//2
		public Integer Probability;	//8
		public Integer TotalOpportunityQuantity;	//566
	}
	public static DimensionMeasurefromJSON parse(String json){
		return (DimensionMeasurefromJSON) System.JSON.deserialize(json, DimensionMeasurefromJSON.class);
	}

/*	static testMethod void testParse() {
		String json=		'{"action":"query","responseId":"4GAST_hfMXpobfVeRhidfk","results":{"metadata":[{"columns":[{"name":"FiscalQuarter","type":"numeric"},{"name":"FiscalYear","type":"numeric"},{"name":"TotalOpportunityQuantity","type":"numeric"},{"name":"ExpectedRevenue","type":"numeric"},{"name":"Amount","type":"numeric"},{"name":"Probability","type":"numeric"}],"groups":[]}],"records":[{"Amount":705,"ExpectedRevenue":583,"FiscalQuarter":4,"FiscalYear":2,"Probability":8,"TotalOpportunityQuantity":566}]},"query":"q = load \"0Fb36000000H8iHCAS/0Fc360000010Yy6CAE\";q = group q by all;q = foreach q generate unique('FiscalQuarter') as 'FiscalQuarter',unique('FiscalYear') as 'FiscalYear',unique('TotalOpportunityQuantity') as 'TotalOpportunityQuantity',unique('ExpectedRevenue') as 'ExpectedRevenue',unique('Amount') as 'Amount',unique('Probability') as 'Probability';q = limit q 2000;","responseTime":23}';
		fromJSON obj = parse(json);
		System.assert(obj != null); 
	} */
}