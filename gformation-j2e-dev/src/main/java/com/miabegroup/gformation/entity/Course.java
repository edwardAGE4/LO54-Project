/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.miabegroup.gformation.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.Proxy;

/**
 *
 * @author integrale
 */
@Proxy(lazy = false)
@Entity
@Table(name = "Course")
public class Course implements Serializable {

    @Id
    @Column(name = "code", unique = true, nullable = false)
    private String code;
    @Column(name = "title", nullable = false)
    private String title;

//    private List<Course> course = new ArrayList<>();
//
//    public List<Course> getCourse() {
//        return course;
//    }
//
//    public void setCourse(List<Course> course) {
//        this.course = course;
//    }
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String toString() {
        return "Course{" + "code=" + code + ", title=" + title + '}';
    }

}
