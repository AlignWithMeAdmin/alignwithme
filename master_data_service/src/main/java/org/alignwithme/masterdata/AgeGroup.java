package org.alignwithme.masterdata;


import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class AgeGroup {
    @Id
    private String id;
    
    private String ageGroup;

    public String getId() {
        return id;
    }

    public String getAgeGroups() {
        return ageGroup;
    }
    
    public AgeGroup(String id, String ageGroup){
        this.id = id;
        this.ageGroup = ageGroup;
    }
}
