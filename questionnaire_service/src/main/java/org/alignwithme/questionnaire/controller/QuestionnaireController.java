package org.alignwithme.questionnaire.controller;

import org.alignwithme.questionnaire.entity.Question;
import org.alignwithme.questionnaire.service.QuestionnaireService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/questionnaire")
public class QuestionnaireController {

    private final QuestionnaireService questionnaireService;

    @Autowired
    public QuestionnaireController(QuestionnaireService questionnaireService) {
        this.questionnaireService = questionnaireService;
    }

    @GetMapping()
    public ResponseEntity<List<Question>> getQuestionnaire(@RequestParam(required = false) String districtId) {
        return new ResponseEntity(questionnaireService.getQuestionnaire(districtId), HttpStatus.OK);
    }

    @PostMapping("/submit-answer")
    public ResponseEntity submitAnswer() {
        return null;
    }
}
