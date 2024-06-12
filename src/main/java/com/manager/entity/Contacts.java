package com.manager.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import org.springframework.http.converter.json.GsonBuilderUtils;

@Entity
public class Contacts {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "Contact_Id")
    private int cid;
    @NotEmpty(message = "name is empty !")
    private String name;
    private String nickName;
    private String work;
    @NotEmpty(message = "email is empty !")
    private String email;


    @Lob
    @Column(columnDefinition = "LONGBLOB")
    private byte [] image;
    
    @NotEmpty(message = "phone number is empty !")
    @Size(min = 10, max=10, message = "digit 10 must required")
    private String phone;
    private String description;

    @ManyToOne
    private User u;
    
    private String base64Image;

    public String getBase64Image() {
		return base64Image;
	}

	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}

	public Contacts() {
        super();
    }

    public Contacts(int cid, String name, String nickName, String work, String email, byte [] image, String phone,
                    String description, User u) {
        super();
        this.cid = cid;
        this.name = name;
        this.nickName = nickName;
        this.work = work;
        this.email = email;
        this.image = image;
        this.phone = phone;
        this.description = description;
        this.u = u;
    }

    public User getU() {
        return u;
    }

    public void setU(User u) {
        this.u = u;
    }

    public int getCid() {
        return this.cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNickName() {
        return this.nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getWork() {
        return this.work;
    }

    public void setWork(String work) {
        this.work = work;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public byte [] getImage() {
        return this.image;
    }

    public void setImage(byte [] image) {
        this.image = image;
    }

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


}
