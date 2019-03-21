/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.miabegroup.gformation.dao;

import com.miabegroup.gformation.entity.Course;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

/**
 *
 * @author integrale
 */
@Repository
public class CourseDaoImplementation implements CoursesDao {

    private static final org.slf4j.Logger logger = LoggerFactory.getLogger(CourseDaoImplementation.class);
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addCourses(Course c) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(c);
    }

    @Override
    public void updateCourses(Course c) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(c);
    }

    @Override
    public List<Course> findAll() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Course> coursesList = session.createQuery("from Course").list();

        return coursesList;
    }

    @Override
    public Course findById(String id) {
        Session session = this.sessionFactory.getCurrentSession();
        Course c = (Course) session.load(Course.class, id);
        //logger.info("course loaded successfully, courses details={0}", c);
        return c;
    }

    @Override
    public void removeCourses(String id) {
        Session session = this.sessionFactory.getCurrentSession();
        Course c = (Course) session.load(Course.class, id);
        if (null != c) {
            session.delete(c);
        }
    }
}
