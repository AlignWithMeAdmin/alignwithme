package com.alighWithMe.quizmanagerservice.service;
import com.alighWithMe.quizmanagerservice.entity.Question;

import java.util.List;
import java.util.Optional;

public interface QuestionService {

    public void addQuestion(Question question);
    public List<Question> getQuestion();
    public List<Question> getPaginatedQuestion(int pageNo, int pageSize);
    public Optional<Question> getQuestionById(String id);
    public void updateQuestion(Question question);
    public void deleteQuestion(String id);
}
