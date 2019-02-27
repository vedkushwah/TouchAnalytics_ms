public with sharing class DatasetFromJson {

	public cls_datasets[] datasets;
	public cls_nextPageUrl nextPageUrl;
	public Integer totalSize;	//10
	public String url;	///services/data/v37.0/wave/datasets?hasCurrentOnly=true
	public class cls_datasets {
		public cls_createdBy createdBy;
		public String createdDate;	//2017-01-02T06:53:09.000Z
		public String currentVersionId;	//0Fc36000000yTHPCA2
		public String currentVersionUrl;	///services/data/v37.0/wave/datasets/0Fb360000008V4mCAE/versions/0Fc36000000yTHPCA2
        public cls_folder folder;
		public String id;	//0Fb360000008V4mCAE
		public String label;	//cdb_Account_22
		public String lastAccessedDate;	//2017-01-03T09:40:19.000Z
		public cls_lastModifiedBy lastModifiedBy;
		public String lastModifiedDate;	//2017-01-02T06:53:11.000Z
		public String name;	//cdb_Account_22
		public String namespace;	//analyticscc
		public cls_permissions permissions;
		public String type;	//dataset
		public String url;	///services/data/v37.0/wave/datasets/0Fb360000008V4mCAE
		public String versionsUrl;	///services/data/v37.0/wave/datasets/0Fb360000008V4mCAE/versions
		public String dataRefreshDate;
	}
	public class cls_createdBy {
		public String id;	//00536000002nLlRAAU
		public String name;	//Guest Uesr
		public String profilePhotoUrl;	//https://analyticscloudconsulting-dev-ed--c.na30.content.force.com/profilephoto/005/T
	}
	public class cls_folder {
		public String id;	//00536000002nLlRAAU
	    public String Name;
	    public String label;
	    
	}
	class cls_lastModifiedBy {
		public String id;	//00536000002nHMoAAM
		public String name;	//Integration User
		public String profilePhotoUrl;	//https://analyticscloudconsulting-dev-ed--c.na30.content.force.com/profilephoto/005/T
	}
	class cls_permissions {
		public boolean manage;
		public boolean modify;
		public boolean view;
	}
	class cls_nextPageUrl {
	}
	public static DatasetFromJson parse(String json){
		return (DatasetFromJson) System.JSON.deserialize(json, DatasetFromJson.class);
	}

	
}