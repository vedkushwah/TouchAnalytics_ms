public with sharing class DatasetDimensionFromJson {
	//public cls_createdBy createdBy;
	//public String createdDate;	//2017-01-02T06:53:10.000Z
	public cls_dataset dataset;
	public cls_dates[] dates;
	//public cls_derivedDimensions[] derivedDimensions;
	//public cls_derivedMeasures[] derivedMeasures;
	public cls_dimensions[] dimensions;
	//public String language;	//en_US
	public cls_lastModifiedBy lastModifiedBy;
	public String lastModifiedDate;	//2017-01-02T06:53:10.000Z
	public cls_measures[] measures;
    //public cls_organizations[] organizations;
	//public cls_showDetailsDefaultFields[] showDetailsDefaultFields;    
	public String type;	//main
	public String url;	///services/data/v37.0/wave/datasets/0Fb360000008V4mCAE/versions/0Fc36000000yTHPCA2/xmds/main
	class cls_createdBy {
		public String id;	//00536000002nHMoAAM
		public String name;	//Integration User
		public String profilePhotoUrl;	//https://analyticscloudconsulting-dev-ed--c.na30.content.force.com/profilephoto/005/T
	}
	class cls_dataset {
		public String connector;	//CSV
		public String fullyQualifiedName;	//ComityDBv1_csv
		public String id; 
	}
	public class cls_dates {
		public String alias;	//Close Date
		public boolean compact;
		public String description;	//CloseDate
		public cls_fields fields;
		public Integer firstDayOfWeek;	//-1
		public Integer fiscalMonthOffset;	//0
		public boolean isYearEndFiscalYear;
		public String label;	//Close Date
		public boolean showInExplorer;
	}   
	public class cls_fields {
		public String day;	//CloseDate_Day
		public String epochDay;	//CloseDate_day_epoch
		public String epochSecond;	//CloseDate_sec_epoch
		public String fullField;	//CloseDate
		public String hour;	//CloseDate_Hour
		public String minute;	//CloseDate_Minute
		public String month;	//CloseDate_Month
		public String quarter;	//CloseDate_Quarter
		public String second;	//CloseDate_Second
		public String week;	//CloseDate_Week
		public String year;	//CloseDate_Year
	}
	class cls_derivedDimensions {
	}
	class cls_derivedMeasures {
	}
	public class cls_dimensions {
	//	public cls_customActions[] customActions;
		public boolean customActionsEnabled;
		public String field;	//Field
		public String fullyQualifiedName;	//Field
		public boolean isMultiValue;
		public String label;	//Field
		public boolean linkTemplateEnabled;
	//	public cls_members[] members;
		public String origin;	//Field
		//public cls_recordDisplayFields[] recordDisplayFields;
		//public cls_salesforceActions[] salesforceActions;
	//	public boolean salesforceActionsEnabled;
		public boolean showInExplorer;
	}
/*	class cls_customActions {
	}
	class cls_members {
	}
	class cls_recordDisplayFields {
	}
	class cls_salesforceActions {
	} */
	class cls_lastModifiedBy {
		public String id;	//00536000002nHMoAAM
		public String name;	//Integration User
		public String profilePhotoUrl;	//https://analyticscloudconsulting-dev-ed--c.na30.content.force.com/profilephoto/005/T
	}
	public class cls_measures {
		public String field;	//Date_epoch_day
		public cls_format format;
		public String label;	//Date_epoch_day
		public boolean showInExplorer;
		public String origin;
	}
	class cls_format {
		public boolean negativeParentheses;
	}
	class cls_organizations {
		
	}
	class cls_showDetailsDefaultFields {
	    
	    
	}
	public static DatasetDimensionfromJSON parse(String json){
		return (DatasetDimensionfromJSON) System.JSON.deserialize(json, DatasetDimensionfromJSON.class);
	}

}