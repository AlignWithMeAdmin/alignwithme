package org.alignwithme.masterdata;

/*
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.alignwithme.masterdata.Province.DistrictsOnly;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
*/
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
public class MasterDataApplication { //implements CommandLineRunner { //add this when testing queries also add other commented code

	/*
	@Autowired
	private ElectorateAreaRepository repository;


	@Autowired
	private AgeGroupRepository ageGroupRepository;

	@Autowired
	private GenderRepository genderRepository;

	@Autowired
	private LevelOfEducationRepository levelOfEducationRepository;

	@Autowired
	private PoliticalPartyRepository politicalPartyRepository;
	*/
	public static void main(String[] args) {
		SpringApplication.run(MasterDataApplication.class, args);
	}
/*
	@Override
	public void run(String... args) throws Exception {

		repository.deleteAll();
		ageGroupRepository.deleteAll();
		genderRepository.deleteAll();
		levelOfEducationRepository.deleteAll();
		politicalPartyRepository.deleteAll();

		// save a couple of polling districts
		ArrayList<District> districts1, districts2;
		districts1 =  new ArrayList<District>();
		districts2 = new ArrayList<District>();
		ArrayList<PollingDivision> polling_divs1, polling_divs2, polling_divs3;
		polling_divs1 = new ArrayList<PollingDivision>();
		polling_divs2 = new ArrayList<PollingDivision>();
		polling_divs3 = new ArrayList<PollingDivision>();
		polling_divs1.add(new PollingDivision("001", "Horowpothana"));
		polling_divs1.add(new PollingDivision("002", "Kekirawa"));
		polling_divs2.add(new PollingDivision("003", "Polonnaruwa"));
		polling_divs3.add(new PollingDivision("004", "Kalkudah"));
		districts1.add(new District("01", "Anuradhapura", polling_divs1));
		districts1.add(new District("02", "Polonnaruwa", polling_divs2));
		districts2.add(new District("03", "Batticoloa", polling_divs3));
		repository.save(new Province("1", "North Central", districts1));
		repository.save(new Province("2", "Eastern", districts2));

		ageGroupRepository.save(new AgeGroup("01", "18-29"));
		ageGroupRepository.save(new AgeGroup("02", "30-49"));
		ageGroupRepository.save(new AgeGroup("03", "50-64"));
		ageGroupRepository.save(new AgeGroup("04", "65+"));

		genderRepository.save(new Gender("01", _Gender.FEMALE));
		genderRepository.save(new Gender("02", _Gender.MALE));
		genderRepository.save(new Gender("03", _Gender.NONBINARY));

		levelOfEducationRepository.save(new LevelOfEducation("01", "Bachelor degree or above"));
		levelOfEducationRepository.save(new LevelOfEducation("02", "Diploma"));
		levelOfEducationRepository.save(new LevelOfEducation("03", "A-Levels"));
		levelOfEducationRepository.save(new LevelOfEducation("04", "O-levels or below"));

		politicalPartyRepository.save(new PoliticalParty("01", "Jathika Jana balawegaya", "./assets/JJB.png"));
		politicalPartyRepository.save(new PoliticalParty("02", "Samagi Jana balawegaya", "./assets/SJB.png"));
		politicalPartyRepository.save(new PoliticalParty("03", "United National Party", "./assets/UNP.jpeg"));
		politicalPartyRepository.save(new PoliticalParty("04", "Sri Lanka Podujana Peramuna", "./assets/SLPP.png"));
		//fetch all districts
		for (DistrictsOnly district : repository.findAllDistricts()) {
			System.out.println(district.getDistricts());
		}
		System.out.println("--------------------------------");

		//fetch all provinces
		for (Province province : repository.findAll()) {
			System.out.println(province);
		}
		System.out.println("--------------------------------");

		//fetch districts by province name
		Optional<List<DistrictsOnly>> districtsOnly = repository.findDistrictsByProvinceName("Eastern");
		List<District> districts = new ArrayList<District>();
		for (DistrictsOnly districtonly : districtsOnly.get()) {
			for (District district: districtonly.getDistricts()){
					districts.add(district);
			}
		}
		System.out.println(districts);
		System.out.println("--------------------------------");

		//fetch polling divisions by province name and district name 
		Optional<List<DistrictsOnly>> districts4 = repository.getPollingDivisionsbyProvinceNameAndDistrictName("North Central", "Polonnaruwa");
		if (districts4.isPresent()){
			List<PollingDivision> pollingDivisions = new ArrayList<PollingDivision>();
			for (DistrictsOnly district : districts4.get()) {
				pollingDivisions.addAll(DistrictsToPollingDivisions.Convert(district.getDistricts()));
			}
			System.out.println(pollingDivisions);
			System.out.println("--------------------------------");
		}else{
			System.out.println("Not Found");
			System.out.println("--------------------------------");
		}

		
		Optional<List<DistrictsOnly>> districts3 = repository.getPollingDivisionsbyDistrictName("Anuradhapura"); //mongodb always returns a province.
		if (districts3.isPresent()){
			List<PollingDivision> pollingDivisions2 = new ArrayList<PollingDivision>(); //to get dstrict, we use the district only interface.
			for (DistrictsOnly district : districts3.get()) {
				pollingDivisions2.addAll(DistrictsToPollingDivisions.Convert(district.getDistricts())); //to get polling divisions, we use the converter
			}
			System.out.println(pollingDivisions2);
			System.out.println("--------------------------------");
		}else{
			System.out.println("Not Found");
			System.out.println("--------------------------------");
		}

	}
*/
}
