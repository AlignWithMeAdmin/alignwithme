package com.alignwithme.usermanagerservice.dto;

public class UserDto {
    private String email;
    private String username;
    private String province;
    private String district;
    private String pollingDivision;
    private String gender;
    private String ageGroup;
    private String levelOfEducation;
    private String occupation;
    private String password;

    public UserDto(String email, String username, String province, String district, String pollingDivision, String gender, String ageGroup, String levelOfEducation, String password, String occupation) {
        this.email = email;
        this.username = username;
        this.province = province;
        this.district = district;
        this.pollingDivision = pollingDivision;
        this.gender = gender;
        this.ageGroup = ageGroup;
        this.levelOfEducation = levelOfEducation;
        this.password = password;
        this.occupation = occupation;
    }

    public UserDto() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPollingDivision() {
        return pollingDivision;
    }

    public void setPollingDivision(String pollingDivision) {
        this.pollingDivision = pollingDivision;
    }

    public String getAgeGroup() {
        return ageGroup;
    }

    public void setAgeGroup(String ageGroup) {
        this.ageGroup = ageGroup;
    }

    public String getLevelOfEducation() {
        return levelOfEducation;
    }

    public void setLevelOfEducation(String levelOfEducation) {
        this.levelOfEducation = levelOfEducation;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
