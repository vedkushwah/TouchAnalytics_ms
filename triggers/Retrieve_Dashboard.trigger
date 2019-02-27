trigger Retrieve_Dashboard on DashBoards__c (after insert) {
    if(trigger.isInsert){
        List<String> dList = new List<String>();
        Map<String, boolean> parentMap = new Map<String, boolean>();
        set<String> idList = new set<String>();
        for(DashBoards__c d: trigger.new){
            idList.add(d.Dashboard_Backup__c);
        }
        List<Dashboard_Backup__c > backupList = [Select id, Full_Backup__c From Dashboard_Backup__c 
                                                    WHERE Id in: idList];
        for(Dashboard_Backup__c d : backupList ){
            parentMap.put(d.id, d.Full_Backup__c );
        }
        for(DashBoards__c d : trigger.new){
            if(d.URL__c != null && parentMap.get(d.Dashboard_Backup__c) != null && 
            parentMap.get(d.Dashboard_Backup__c)){
                dList.add(d.Id);
            }
        }
       System.debug('*********** Pavan DFL '+dList);
        if(dList.size() > 0){
            Complete_Dashboard_Backup_BatchClass dbb = new Complete_Dashboard_Backup_BatchClass(dList, UserInfo.getSessionId());
            Database.executeBatch(dbb, 1);
        }
    }
    
}