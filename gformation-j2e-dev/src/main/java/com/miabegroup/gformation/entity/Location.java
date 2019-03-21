/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.miabegroup.gformation.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.Proxy;

/**
 *
 * @author integrale
 */
@Proxy(lazy = false)
@Entity
@Table(name = "Location")
public class Location implements Serializable {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "city", nullable = false)
    private String city;

//    private List<Location> location = new ArrayList<>();
//
//    public List<Location> getLocation() {
//        return location;
//    }
//
//    public void setLocation(List<Location> location) {
//        this.location = location;
//    }
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Courses{" + "id=" + id + ", city=" + city + '}';
    }

}
