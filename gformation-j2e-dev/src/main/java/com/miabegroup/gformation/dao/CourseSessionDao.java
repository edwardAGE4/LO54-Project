/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.miabegroup.gformation.dao;

import com.miabegroup.gformation.entity.Course_Session;
import java.util.List;

/**
 *
 * @author integrale
 */
public interface CourseSessionDao {

    public void addCourseSession(Course_Session c);

    public void updateCourseSession(Course_Session c);

    public List<Course_Session> findAll();

    public Course_Session findById(int id);

    public void removeCourseSession(int id);
}
