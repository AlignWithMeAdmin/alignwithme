package org.alignwithme.masterdata;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class PoliticalParty {
    @Id
    private String id;
    
    private String name;
    private String symbolPath; //stores image path for party sysmbol
    public String getId() {
        return id;
    }
    public String getName() {
        return name;
    }
    public String getSymbolPath() {
        return symbolPath;
    }
    public PoliticalParty(String id, String name, String symbolPath) {
        this.id = id;
        this.name = name;
        this.symbolPath = symbolPath;
    }

    
}
