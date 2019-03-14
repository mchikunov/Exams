package com.example.mongo;

import org.springframework.data.annotation.Id;

import java.util.Objects;

public class Results {


    private String userName;

    private String SName;



    private String questNumber;

    private String result;

    public Results(String userName) {
        this.userName = userName;
    }


    public Results() {

    }

    public Results(String userName, String SName, String questNumber, String result) {
        this.userName = userName;
        this.SName = SName;
        this.questNumber = questNumber;
        this.result = result;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getSName() {
        return SName;
    }

    public void setSName(String SName) {
        this.SName = SName;
    }

    public String getQuestNumber() {
        return questNumber;
    }

    public void setQuestNumber(String questNumber) {
        this.questNumber = questNumber;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Results results = (Results) o;
        return Objects.equals(getUserName(), results.getUserName()) &&
                Objects.equals(getSName(), results.getSName()) &&
                Objects.equals(getQuestNumber(), results.getQuestNumber()) &&
                Objects.equals(getResult(), results.getResult());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getUserName(), getSName(), getQuestNumber(), getResult());
    }
}
