package org.alignwithme.masterdata;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class LevelOfEducation {
    @Id
    private String id;

    public String getId() {
        return id;
    }

    private String levelOfEducation;

    public String getLevelOfEducation() {
        return levelOfEducation;
    }

    public LevelOfEducation(String id, String levelOfEducation) {
        this.id = id;
        this.levelOfEducation = levelOfEducation;
    }
}
