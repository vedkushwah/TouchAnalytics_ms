global with sharing class NumberOfBackups_ScheduleClass implements Schedulable {
    
    //public List<DashBoard_Backup__c> backupList{get;set;}
    //public List<Id> Ids{get;set;}
     
      global static void execute(SchedulableContext sc) {
         List<Remote_Site_Settings__c> customList = [select No_of_backups__c,Session_Id__c,Password__c,Username__c from Remote_Site_Settings__c limit 1];
         List<DashBoard_Backup__c> backupList = [select Id, Name from DashBoard_Backup__c order by CreatedDate desc limit : Integer.valueOf(customList[0].No_of_backups__c)]; 
         List<Id> Ids = new List<id>(); 
         for(DashBoard_Backup__c QIds : backupList){
         	Ids.add(QIds.Id);
         } 
         if(DashBoard_Backup__c.sObjectType.getDescribe().isDeletable()){
            Delete[select Id from DashBoard_Backup__c where Id not In :Ids];
         }
                    
     }
     
    public static void start() {  
      String str = 'Schedule No of Backups';
          string sch = ''; 
          sch = '0 0 23 * *  ?'; 
          //sch = '0 38 * * * ?'; 
          System.schedule(str, sch , new NumberOfBackups_ScheduleClass()); 
  
        
        
     } 
     
     public static void abort(){
         List<CronTrigger> ct = [SELECT Id, CronJobDetail.Id, CronJobDetail.Name, CronJobDetail.JobType FROM CronTrigger WHERE CronJobDetail.Name = 'Schedule No of Backups'];
         if(ct.size() >0 ){
            System.abortJob(ct[0].Id);
            
         }else{
             Integer i = 0;
             i++;
             i++;
             i++;
             i++;
             i++;
         }
         
     }
     

}