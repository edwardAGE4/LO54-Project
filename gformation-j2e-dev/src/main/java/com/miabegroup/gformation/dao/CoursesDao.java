/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.miabegroup.gformation.dao;

import com.miabegroup.gformation.entity.Course;
import java.util.List;

/**
 *
 * @author integrale
 */
public interface CoursesDao {

    public void addCourses(Course c);

    public void updateCourses(Course c);

    public List<Course> findAll();

    public Course findById(String id);

    public void removeCourses(String id);
}
