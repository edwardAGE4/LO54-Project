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
import org.hibernate.annotations.Proxy;

/**
 *
 * @author integrale
 */
@Proxy(lazy = false)
@Entity
@Table(name = "Course_Session")
public class Course_Session implements Serializable {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Temporal(TemporalType.DATE)
    @Column(name = "start_Date", nullable = false)
    private Date start_Date;
    @Temporal(TemporalType.DATE)
    @Column(name = "end_Date", nullable = false)
    private Date end_Date;

    @Column(name = "max_register", nullable = false)
    private int max_register;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "courseid", nullable = true, referencedColumnName = "code")
    private Course course;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "locationid", nullable = true, referencedColumnName = "id")
    private Location location;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getStart_Date() {
        return start_Date;
    }

    public void setStart_Date(Date start_Date) {
        this.start_Date = start_Date;
    }

    public Date getEnd_Date() {
        return end_Date;
    }

    public void setEnd_Date(Date end_Date) {
        this.end_Date = end_Date;
    }

    public int getMax_register() {
        return max_register;
    }

    public void setMax_register(int max_register) {
        this.max_register = max_register;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public Course_Session() {
    }

}
