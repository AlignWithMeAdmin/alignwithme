package org.alignwithme.masterdata;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api_v1")
public class AgeGroupController {
    @Autowired
	AgeGroupRepository repository;

	@GetMapping("/age_groups")
	public ResponseEntity<List<AgeGroup>> getAllAgeGroups(){
		try{
			List<AgeGroup> result = repository.findAll();
			if (result.isEmpty()){
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			}else{
				return new ResponseEntity<>(result, HttpStatus.OK);
			}
		}catch (Exception e){
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
}
