global with sharing class DashBoard_Backup_ScheduleClass implements Schedulable {
     private static String sessionId;
     public DashBoard_Backup_ScheduleClass(String sId){
         sessionId = sId; 
     }
     global static void execute(SchedulableContext sc) {
                  
                    Future_Backup_Batch.invokeBatch();
              
                    
    }
     
    public static void start(String listVal) { 
        
      String str = 'Schedule Backup';
      Integer Schdtime = Integer.valueOf(listVal);
           string sch = '';
           sch = '0 0 '+ Schdtime +' ? * *'; 
           //sch = '0 38 00 ? * *';
           System.schedule(str, sch , new DashBoard_Backup_ScheduleClass(userInfo.getUserId()));
           
 
        
        
     } 
     
     public static void abort(){
         List<CronTrigger> ct = [SELECT Id, CronJobDetail.Id, CronJobDetail.Name, CronJobDetail.JobType FROM CronTrigger WHERE CronJobDetail.Name = 'Schedule Backup'];
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