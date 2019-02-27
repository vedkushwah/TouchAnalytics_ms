global with sharing class Insert_Attachment_ScheduleClass implements Schedulable {
   
    global static void execute(SchedulableContext sc){
       
        Future_Backup_Batch.invokeBatchDB();
                   
    } 
    
    public static void start(String listVal) { 
  
 
      Integer Schdtime = Integer.valueOf(listVal);
           string sch = '';
            sch = '0 2 '+ Schdtime +' ? * *';
            //sch = '0 40 00 ? * *';
           System.schedule('Schedule Attachment', sch , new Insert_Attachment_ScheduleClass());
        
     }
     
    public static void abort(){
         List<CronTrigger> ct = [SELECT Id, CronJobDetail.Id, CronJobDetail.Name, CronJobDetail.JobType FROM CronTrigger WHERE CronJobDetail.Name = 'Schedule Attachment'];
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