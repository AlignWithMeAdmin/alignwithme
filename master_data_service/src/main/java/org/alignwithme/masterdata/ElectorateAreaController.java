package org.alignwithme.masterdata;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.alignwithme.masterdata.Province.DistrictsOnly;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api_v1")
public class ElectorateAreaController {

	@Autowired
	ElectorateAreaRepository repository;

	@GetMapping("/provinces")
	public ResponseEntity<List<Province>> getAllProvinces(){
		try{
			List<Province> result = repository.findAll();
			if (result.isEmpty()){
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			}else{
				return new ResponseEntity<>(result, HttpStatus.OK);
			}
		}catch (Exception e){
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	@GetMapping("/districts")
	public ResponseEntity<List<District>> getAllDistricts(){
		try{
			List<District> districts = new ArrayList<District>();
			List<DistrictsOnly> result = repository.findAllDistricts();
			if (result.isEmpty()){
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			}else{
				for (DistrictsOnly district : result) {
					districts.addAll(district.getDistricts());
				}
				return new ResponseEntity<>(districts, HttpStatus.OK);
			}
		}catch (Exception e){
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	@GetMapping("/provinces/{name}/districts")
	public ResponseEntity<List<District>> getDistrictsByProvinceName(@PathVariable("name") String name) {
		Optional<List<DistrictsOnly>> districtsOnly = repository.findDistrictsByProvinceName(name);
		if (districtsOnly.isPresent()){
			List<District> districts = new ArrayList<District>();
			for (DistrictsOnly districtonly : districtsOnly.get()) {
				for (District district: districtonly.getDistricts()){
					districts.add(district);
				}
			}
			return new ResponseEntity<>(districts, HttpStatus.OK);
		}else{
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	@GetMapping("/provinces/{nameP}/districts/{nameD}/polling_divisions")
	public ResponseEntity<List<PollingDivision>> getPollingDivisionByProvinceNameAndDistrictName(@PathVariable("nameP") String nameP, @PathVariable("nameD") String nameD) {
		Optional<List<DistrictsOnly>> districts = repository.getPollingDivisionsbyProvinceNameAndDistrictName(nameP, nameD);
		if (districts.isPresent()){
			List<PollingDivision> pollingDivisions = new ArrayList<PollingDivision>();
			for (DistrictsOnly district : districts.get()) {
				pollingDivisions.addAll(DistrictsToPollingDivisions.Convert(district.getDistricts()));
			}
			return new ResponseEntity<>(pollingDivisions, HttpStatus.OK);
		}else{
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

	}

	@GetMapping("/districts/{name}/polling_divisions")
	public ResponseEntity<List<PollingDivision>> getPollingDivisionByDistrictName(@PathVariable("name") String name) {
		Optional<List<DistrictsOnly>> districts = repository.getPollingDivisionsbyDistrictName(name); //mongodb always returns a province.
		if (districts.isPresent()){
			List<PollingDivision> pollingDivisions = new ArrayList<PollingDivision>(); //to get dstrict, we use the district only interface.
			for (DistrictsOnly district : districts.get()) {
				pollingDivisions.addAll(DistrictsToPollingDivisions.Convert(district.getDistricts())); //to get polling divisions, we use the converter
			}
			return new ResponseEntity<>(pollingDivisions, HttpStatus.OK);
		}else{
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

	}

}