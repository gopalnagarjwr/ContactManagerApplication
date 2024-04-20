package com.manager.entity;

import jakarta.validation.constraints.NotEmpty;
import org.springframework.stereotype.Component;

@Component
public class DataClass {
    @NotEmpty(message = "contact email is required !")
    private String to;
    @NotEmpty(message = "user email is required !")
    private String from;
    @NotEmpty(message = "subject is required !")
    private String subject;
    @NotEmpty(message = "Message is required !")
    private String text;

    public DataClass() {
    }

    public DataClass(String to, String from,String subject,String text) {
        this.from = from;
        this.to=to;
        this.subject=subject;
        this.text=text;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    @Override
    public String toString() {
        return "DataClass{" +
                "to='" + to + '\'' +
                ", from='" + from + '\'' +
                ", subject='" + subject + '\'' +
                ", text='" + text + '\'' +
                '}';
    }
}
