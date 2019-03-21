/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.miabegroup.gformation.services;

import com.miabegroup.gformation.dao.CoursesDao;
import com.miabegroup.gformation.entity.Course;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;

/**
 *
 * @author integrale
 */
@Service
public class CourseServiceImplementation implements CourseService {

    private CoursesDao coursesDao;

    public void setCoursesDao(CoursesDao coursesDao) {
        this.coursesDao = coursesDao;
    }

    @Override
    @Transactional
    public void addCourses(Course c) {
        this.coursesDao.addCourses(c);
    }

    @Override
    @Transactional
    public void updateCourses(Course c) {
        this.coursesDao.updateCourses(c);
    }

    @Override
    @Transactional
    public List<Course> findAll() {
        return this.coursesDao.findAll();
    }

    @Override
    @Transactional
    public Course findById(String id) {
        return this.coursesDao.findById(id);
    }

    @Override
    @Transactional
    public void removeCourses(String id) {
        this.coursesDao.removeCourses(id);
    }

}
