/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.miabegroup.gformation.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Pattern;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.hibernate.annotations.Proxy;

/**
 *
 * @author integrale
 */
@Proxy(lazy = false)
@Entity
@Table(name = "Client")
public class Client implements Serializable {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "lastName", nullable = false)
    private String lastName;

    @Column(name = "firstName", nullable = false)
    private String firstName;

    @Column(name = "adrress", nullable = false)
    private String adrress;

    @Column(name = "phone", nullable = false)
    private String phone;

    @Pattern(regexp = ".+@.+\\..+", message = "Email invalide")
    @Column(name = "email", nullable = false)
    private String email;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "datesaved", nullable = true)
    private Date datesaved;
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "sessionid", nullable = false, referencedColumnName = "id")
    private Course_Session course_Session;

    public Date getDatesaved() {
        return datesaved;
    }

    public void setDatesaved(Date datesaved) {
        this.datesaved = datesaved;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getAdrress() {
        return adrress;
    }

    public void setAdrress(String adrress) {
        this.adrress = adrress;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Course_Session getCourse_Session() {
        return course_Session;
    }

    public void setCourse_Session(Course_Session course_Session) {
        this.course_Session = course_Session;
    }

}
