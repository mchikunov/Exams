package com.example.mongo;

import org.springframework.data.annotation.Id;

public class Question {

    @Id
    private String id;

    private String questNumber;

    private String question;

    private String answer1;
    private String answer2;
    private String answer3;
    private String answer4;

    private String rightAnswer;

    public Question(){}

    public Question(String questNumber, String question, String answer1, String answer2, String answer3, String answer4, String rightAnswer) {
        this.questNumber = questNumber;
        this.question = question;
        this.answer1 = answer1;
        this.answer2 = answer2;
        this.answer3 = answer3;
        this.answer4 = answer4;
        this.rightAnswer = rightAnswer;
    }

    public Question(String id, String questNumber, String question, String answer1, String answer2, String answer3, String answer4, String rightAnswer) {
        this.id = id;
        this.questNumber = questNumber;
        this.question = question;
        this.answer1 = answer1;
        this.answer2 = answer2;
        this.answer3 = answer3;
        this.answer4 = answer4;
        this.rightAnswer = rightAnswer;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getQuestNumber() {
        return questNumber;
    }

    public void setQuestNumber(String questNumber) {
        this.questNumber = questNumber;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer1() {
        return answer1;
    }

    public void setAnswer1(String answer1) {
        this.answer1 = answer1;
    }

    public String getAnswer2() {
        return answer2;
    }

    public void setAnswer2(String answer2) {
        this.answer2 = answer2;
    }

    public String getAnswer3() {
        return answer3;
    }

    public void setAnswer3(String answer3) {
        this.answer3 = answer3;
    }

    public String getAnswer4() {
        return answer4;
    }

    public void setAnswer4(String answer4) {
        this.answer4 = answer4;
    }

    public String getRightAnswer() {
        return rightAnswer;
    }

    public void setRightAnswer(String rightAnswer) {
        this.rightAnswer = rightAnswer;
    }
}
