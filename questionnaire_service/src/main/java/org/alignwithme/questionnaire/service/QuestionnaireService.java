package org.alignwithme.questionnaire.service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.alignwithme.questionnaire.entity.Question;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class QuestionnaireService {

    private List<Question> questionnaire;

    public QuestionnaireService() {
        ObjectMapper mapper = new ObjectMapper();
        try {
            questionnaire = mapper.readValue(new File("data/questionnaire.json"), new TypeReference<>(){});
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<Question> getQuestionnaire(String districtId) {

        if (districtId != null && !districtId.isEmpty() && !districtId.isBlank()) {
            return questionnaire.stream()
                    .filter(question -> question.getDistrictId().equals(districtId)).collect(Collectors.toList());
        }

        return questionnaire;
    }
}
