package org.alignwithme.masterdata;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class ElectorateArea{

    @Id
    protected String id;

    protected final String name;

    public ElectorateArea(String name, String id){
        this.name = name;
        this.id = id;
    }

    public String getId(){
        return id;
    }

    public String getName(){
        return name;
    }

    @Override
    public String toString() {
      return String.format(
          "ElectorateArea[id=%s, name='%s']", name);
    }    
}
