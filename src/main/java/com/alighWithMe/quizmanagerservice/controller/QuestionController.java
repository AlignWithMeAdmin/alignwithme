package com.alighWithMe.quizmanagerservice.controller;

import com.alighWithMe.quizmanagerservice.entity.Question;
import com.alighWithMe.quizmanagerservice.service.Impl.QuestionServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(value ="/api_v1")
public class QuestionController {
    @Autowired
    QuestionServiceImpl questionService;

    @RequestMapping(method = RequestMethod.POST, value = "/questions")
    public void addQuestion(@RequestBody Question question){
        questionService.addQuestion(question);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/questions")
    public List<Question> getAllQuestion(){
        return questionService.getQuestion();
    }

    @RequestMapping(method = RequestMethod.GET, value = "/questionp")
    public List<Question> getPagedQuestion(
            @RequestParam(value = "pageNo", defaultValue = "0", required = false)int pageNo,
            @RequestParam(value = "pageSize", defaultValue = "2", required = false)int pageSize){
        return questionService.getPaginatedQuestion(pageNo,pageSize);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/questions/{id}")
    public Optional<Question> getQuestionById(@PathVariable String id){
        return questionService.getQuestionById(id);
    }

    @RequestMapping(method = RequestMethod.PUT, value = "/questions/{id}")
    public void updateQuestion(@PathVariable String id, @RequestBody Question question){
        questionService.updateQuestion(question);
    }

    @RequestMapping(method = RequestMethod.DELETE, value = "/questions/{id}")
    public void deleteQuestion(@PathVariable String id){
        questionService.deleteQuestion(id);
    }
}
