package com.example.candidate_manager.config;

import com.example.candidate_manager.model.Candidate;
import com.example.candidate_manager.repository.CandidateRepository;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.index.Index;

import javax.annotation.PostConstruct;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Configuration
public class MongoDBConfig {

    @Autowired
    private CandidateRepository candidateRepository;
    private MongoTemplate mongoTemplate;
    @PostConstruct
    public void init() throws IOException {
        // Load data.json file
        InputStream inputStream = new ClassPathResource("candidate_data.json").getInputStream();
        ObjectMapper mapper = new ObjectMapper();
        List<Candidate> candidates = mapper.readValue(inputStream, new TypeReference<List<Candidate>>(){});

        // Insert data into MongoDB
        candidateRepository.saveAll(candidates);

        /*
        //Name is unique
        mongoTemplate.indexOps(Candidate.class).ensureIndex(
                new Index().on("name", Sort.Direction.ASC).unique()
        );
        */
    }
}
