/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.miabegroup.gformation.services;

import com.miabegroup.gformation.dao.CourseSessionDao;
import com.miabegroup.gformation.entity.Course_Session;
import java.util.List;
import javax.transaction.Transactional;

/**
 *
 * @author integrale
 */
public class CourseSessionServiceImplementation implements CourseSessionService {

    private CourseSessionDao courseSessionDao;

    public void setCourseSessionDao(CourseSessionDao courseSessionDao) {
        this.courseSessionDao = courseSessionDao;
    }

    @Override
    @Transactional
    public void addCourseSession(Course_Session c) {
        this.courseSessionDao.addCourseSession(c);
    }

    @Override
    @Transactional
    public void updateCourseSession(Course_Session c) {
        this.courseSessionDao.updateCourseSession(c);
    }

    @Override
    @Transactional
    public List<Course_Session> findAll() {
        return this.courseSessionDao.findAll();
    }

    @Override
    @Transactional
    public Course_Session findById(int id) {
        return this.courseSessionDao.findById(id);
    }

    @Override
    @Transactional
    public void removeCourseSession(int id) {
        this.courseSessionDao.removeCourseSession(id);
    }

}
