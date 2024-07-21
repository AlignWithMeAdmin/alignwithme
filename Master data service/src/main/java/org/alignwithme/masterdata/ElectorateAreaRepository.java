package org.alignwithme.masterdata;

import java.util.List;
import java.util.Optional;

import org.alignwithme.masterdata.Province.DistrictsOnly;
//import org.alignwithme.masterdata.Province.DistrictsOnly;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;


public interface ElectorateAreaRepository extends MongoRepository<Province, String>{

    /**
     Since we want findall() to return province class objects and save to add province
     class objects, make the type field of MongoRepository into Province.
     **/

    @Query(value="{}",fields="{districts:1}")
     List<DistrictsOnly> findAllDistricts();

    @Query(value="{name : ?0}")
    Optional<List<DistrictsOnly>> findDistrictsByProvinceName(String name);

    @Query(value="{districts:{$elemMatch:{name:?0}}}", fields="{districts:{$elemMatch:{name:?0}}}")
    Optional<List<DistrictsOnly>> getPollingDivisionsbyDistrictName(String name);

    @Query(value="{$and:[{name : ?0}, {districts:{$elemMatch:{name:?1}}}]}", fields="{districts:{$elemMatch:{name:?1}}}")
    Optional<List<DistrictsOnly>> getPollingDivisionsbyProvinceNameAndDistrictName(String nameP, String nameD);

}
