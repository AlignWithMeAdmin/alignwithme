package org.alignwithme.questionnaire.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Question {

    private String id;
    private String districtId;
    private String question;
    private List<Answer> answers;
}
