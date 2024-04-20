package com.manager.entity;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

import jakarta.validation.constraints.NotEmpty;

import jakarta.validation.constraints.Size;

@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int Id;

    @NotEmpty(message = "Name is empty !!")
    @Size(min = 2, max = 20, message = "min 3 character and maximum 20 character must be !!")
    private String name;

    @Column(unique = true)
    @NotEmpty(message = "Your Email is empty !!")
    private String Email;

    @NotEmpty(message = "Your Password is empty !!")
    private String Password;
    private String Phone;
    private String Image;
    private String Role;
    @Column(name = "Mode")
    private String Enable;
    @NotEmpty(message = "Your About is empty !!")
    private String About;



    @OneToMany(mappedBy = "u")
    @Cascade(CascadeType.ALL)
    List<Contacts> ll = new ArrayList<Contacts>();

    public User() {
        super();
    }

    public User(int id, String name, String email, String password, String phone, String image, String role,
                String enable, String about, List<Contacts> ll) {
        super();
        Id = id;
        this.name = name;
        Email = email;
        Password = password;
        Phone = phone;
        Image = image;
        Role = role;
        Enable = enable;
        About = about;
        this.ll = ll;
    }

    public List<Contacts> getLl() {
        return ll;
    }

    public void setLl(List<Contacts> ll) {
        this.ll = ll;
    }

    public void setPhone(String phone) {
        Phone = phone;
    }

    public String getPhone() {
        return Phone;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String image) {
        Image = image;
    }

    public String getRole() {
        return Role;
    }

    public void setRole(String role) {
        Role = role;
    }

    public String getEnable() {
        return Enable;
    }

    public void setEnable(String enable) {
        Enable = enable;
    }

    public String getAbout() {
        return About;
    }

    public void setAbout(String about) {
        About = about;
    }

    @Override
    public String toString() {
        return "User [Id=" + Id + ", Name=" + name + ", Email=" + Email + ", Password=" + Password + ", Phone=" + Phone
                + ", Image=" + Image + ", Role=" + Role + ", Enable=" + Enable + ", About=" + About + ", ll=" + ll
                + "]";
    }


}
