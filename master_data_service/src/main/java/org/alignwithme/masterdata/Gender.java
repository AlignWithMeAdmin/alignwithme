package org.alignwithme.masterdata;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Gender {
    @Id
    private String id;

    private _Gender gender;

    public String getId() {
        return id;
    }

    public _Gender getGender() {
        return gender;
    }
    
    public Gender(String id, _Gender gender){
        this.id = id;
        this.gender = gender;
    }
}
