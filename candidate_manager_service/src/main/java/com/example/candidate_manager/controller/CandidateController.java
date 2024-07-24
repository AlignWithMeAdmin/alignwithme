package com.example.candidate_manager.controller;

import com.example.candidate_manager.model.Candidate;
import com.example.candidate_manager.repository.CandidateRepository;
import com.mongodb.DuplicateKeyException;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api_v1/candidates")
//@Api(value= "Candidate Management")
public class CandidateController {
    @Autowired
    private CandidateRepository candidateRepository;

    @Operation(summary = "View list of available candidates")
    //@Tag(name="GET", description = "GET methods of Candidate APIs")
    @GetMapping
    public List<Candidate> getAllCandidates(){
        return candidateRepository.findAll();
    }

    @Operation(summary = "Get candidate by name")
    //@Tag(name="GET", description = "GET methods of Candidate APIs")
    @GetMapping("/{name}")
    @ApiResponses({
            @ApiResponse(responseCode = "200", content = { @Content(mediaType = "application/json",
                    schema = @Schema(implementation = Candidate.class)) }),
            @ApiResponse(responseCode = "404", description = "Candidate not found",
                    content = @Content) })
    public ResponseEntity<Candidate> getCandidateById(@PathVariable String name) {
        return candidateRepository.findById(name)
                .map(candidate -> ResponseEntity.ok().body(candidate))
                .orElse(ResponseEntity.notFound().build());
    }

    @Operation(summary = "Add a new candidate")
    @PostMapping
    /*
    public ResponseEntity<?> createCandidate(@RequestBody Candidate candidate) {
        try {
            Candidate savedCandidate = candidateRepository.save(candidate);
            return ResponseEntity.status(HttpStatus.CREATED).body(savedCandidate);
        } catch (DuplicateKeyException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body("Candidate with this name already exists.");
        }
    }
    */
    public Candidate createCandidate(@RequestBody Candidate candidate){
        return candidateRepository.save(candidate);
    }

    @Operation(summary = "Update an existing candidate")
    @PutMapping("/{name}")
    @ApiResponses({
            @ApiResponse(responseCode = "200", content = { @Content(mediaType = "application/json",
                    schema = @Schema(implementation = Candidate.class)) }),
            @ApiResponse(responseCode = "404", description = "Candidate not found",
                    content = @Content) })
    public ResponseEntity<Candidate> updateCandidate(@PathVariable String name, @RequestBody Candidate candidateDetails){
        return candidateRepository.findById(name)
                .map(candidate -> {
                    candidate.setPoliticalParty(candidateDetails.getPoliticalParty());
                    candidate.setPartySymbol(candidateDetails.getPartySymbol());
                    candidate.setDistrict(candidateDetails.getDistrict());
                    Candidate updatedCandidate = candidateRepository.save(candidate);
                    return ResponseEntity.ok().body(updatedCandidate);
                }).orElse(ResponseEntity.notFound().build());
    }

    @Operation(summary = "Search candidate by district", description = "Search a candidate by district. For future use")
    //@Tag(name="GET", description = "GET methods of Candidate APIs")
    @GetMapping(params = "district")
    public List<Candidate> getCandidatesByDistrict(@RequestParam String district) {
        return candidateRepository.findByDistrict(district);
    }

    @DeleteMapping("/{name}")
    public ResponseEntity<Object> deleteCandidate(@PathVariable String name) {
        return candidateRepository.findById(name)
                .map(candidate -> {
                    candidateRepository.delete(candidate);
                    return ResponseEntity.noContent().build();
                })
                .orElse(ResponseEntity.notFound().build());
    }


}
