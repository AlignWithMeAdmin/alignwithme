package com.alignwithme.usermanagerservice.entity;

import com.alignwithme.usermanagerservice.enums.UserTypes;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

@Data
@Document
@NoArgsConstructor
@AllArgsConstructor
public class User {

    @Id
    private String id;
    @Indexed(unique = true)
    private String email;
    @Indexed(unique = true)
    private String username;
    private String province;
    private String district;
    private String pollingDivision;
    private String gender;
    private String ageGroup;
    private String levelOfEducation;
    private String occupation;
    private String password;
    private UserTypes userType;

}



