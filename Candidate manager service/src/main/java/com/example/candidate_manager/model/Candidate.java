package com.example.candidate_manager.model;

import jakarta.validation.constraints.NotNull;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "candidates")
public class Candidate {
    @Id
    @NotNull
    private String name;
    @NotNull
    //@Size(min=1, max=50)
    private String politicalParty;
    @NotNull
    private String partySymbol;
    private String district;

    public String getName(){
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getPoliticalParty(){
        return politicalParty;
    }
    public void setPoliticalParty(String politicalParty) {
        this.politicalParty = politicalParty;
    }
    public String getPartySymbol(){
        return partySymbol;
    }
    public void setPartySymbol(String partySymbol) {
        this.partySymbol = partySymbol;
    }
    public void setDistrict(String district) {
        this.district = district;
    }
    public String getDistrict() {
        return district;
    }

}
