public with sharing class Backup_fromJSON {
	public cls_folders[] folders;
	public Integer totalSize;
	public String url;	
	public class cls_folders {
		public String applicationStatus;	
		public String assetSharingUrl;	
		public boolean canBeSharedExternally;
		public cls_createdBy createdBy;
		public String createdDate;	
		public cls_icon icon;
		public String id;	
		public String label;	
		public String lastAccessedDate;	
		public cls_lastModifiedBy lastModifiedBy;
		public String lastModifiedDate;	
		public String name;	
		public String namespace;	
		public cls_permissions permissions;
		public cls_shares[] shares;
		public cls_templateOptions templateOptions;
		public cls_templateValues templateValues;
		public String type;	
		public String url;	
	}
	public class cls_createdBy {
		public String id;	
		public String name;	
		public String profilePhotoUrl;	
	}
	public class cls_icon {
		public String id;	
		public String name;	
		public String url;	
	}
	public class cls_lastModifiedBy {
		public String id;	
		public String name;
		public String profilePhotoUrl;	
	}
	public class cls_permissions {
		public boolean manage;
		public boolean modify;
		public boolean view;
	}
	public class cls_shares {
	}
	public class cls_templateOptions {
	}
	public class cls_templateValues {
	}
	public static Backup_fromJSON parse(String json){
		return (Backup_fromJSON) System.JSON.deserialize(json, Backup_fromJSON.class);
	}
}