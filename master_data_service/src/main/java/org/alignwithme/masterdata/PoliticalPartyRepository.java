package org.alignwithme.masterdata;

import org.springframework.data.mongodb.repository.MongoRepository;

public interface PoliticalPartyRepository extends MongoRepository<PoliticalParty, String>{
    
}
