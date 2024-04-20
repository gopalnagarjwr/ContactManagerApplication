package com.manager.entity;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import org.springframework.stereotype.Service;

import java.util.Properties;

@Service
public class GmailSender {

    public boolean sendMail(String to, String from, String subject, String text, User user) {
        boolean flag = false;
        try {
            String userName = user.getEmail().substring(0, user.getEmail().length() - 10);
            String password = user.getPassword();

            Properties properties = new Properties();
            properties.put("mail.smtp.auth", true);
            properties.put("mail.smtp.starttls.enable", true);
            properties.put("mail.smtp.port", 587);
            properties.put("mail.smtp.host", "smtp.gmail.com");

            System.out.println(userName);
            System.out.println(password);

//            "vvwk algi rmah gsxx"

            Session session = Session.getInstance(properties, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("gopalnagarjwr@gmail.com", "vvwk algi rmah gsxx");
                }
            });

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(text);

            Transport.send(message);
            flag = true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return flag;
    }
}
