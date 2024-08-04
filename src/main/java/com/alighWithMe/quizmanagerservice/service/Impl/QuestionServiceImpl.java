package com.alighWithMe.quizmanagerservice.service.Impl;

import com.alighWithMe.quizmanagerservice.entity.Question;
import com.alighWithMe.quizmanagerservice.repository.QuestionRepository;
import com.alighWithMe.quizmanagerservice.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Pageable;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service

public class QuestionServiceImpl implements QuestionService {
    @Autowired
    QuestionRepository questionRepository;

    @Override
    public void addQuestion(Question question) {
        questionRepository.save(question);
    }

    @Override
    public List<Question> getQuestion() {
        List<Question> questions = new ArrayList<>();
        questionRepository.findAll().forEach(questions :: add);
        return questions;
    }

    @Override
    public List<Question> getPaginatedQuestion(int pageNo, int pageSize) {
        Pageable pageable = (Pageable) PageRequest.of(pageNo, pageSize);
        Page<Question> questions = questionRepository.findAll((org.springframework.data.domain.Pageable) pageable);
        List<Question> listOfQuestions = questions.getContent();
        return listOfQuestions;
    }

    @Override
    public Optional<Question> getQuestionById(String id) {
        return questionRepository.findById(id);
    }

    @Override
    public void updateQuestion(Question question) {
        questionRepository.save(question);
    }

    @Override
    public void deleteQuestion(String id) {
        questionRepository.deleteById(id);
    }
}
