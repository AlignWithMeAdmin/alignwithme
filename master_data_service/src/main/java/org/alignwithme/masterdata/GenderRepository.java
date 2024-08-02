package org.alignwithme.masterdata;

import org.springframework.data.mongodb.repository.MongoRepository;

public interface GenderRepository extends MongoRepository<Gender, String>{
    
}
