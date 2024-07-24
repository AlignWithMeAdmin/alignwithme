package com.example.candidate_manager.repository;

import com.example.candidate_manager.model.Candidate;
import org.springframework.stereotype.Repository;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

@Repository
public interface CandidateRepository extends MongoRepository<Candidate, String>{
    List<Candidate> findByDistrict(String district);
}

