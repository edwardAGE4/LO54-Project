/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.miabegroup.gformation.dao;

import com.miabegroup.gformation.entity.Course_Session;
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
public class CourseSessionDaoImplementation implements CourseSessionDao {

    private static final org.slf4j.Logger logger = LoggerFactory.getLogger(CourseSessionDaoImplementation.class);
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addCourseSession(Course_Session c) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(c);
    }

    @Override
    public void updateCourseSession(Course_Session c) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(c);
    }

    @Override
    public List<Course_Session> findAll() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Course_Session> coursesList = session.createQuery("from Course_Session").list();

        return coursesList;
    }

    @Override
    public Course_Session findById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Course_Session c = (Course_Session) session.load(Course_Session.class, id);
        //logger.info("course loaded successfully, courses details={0}", c);
        return c;
    }

    @Override
    public void removeCourseSession(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Course_Session c = (Course_Session) session.load(Course_Session.class, id);
        if (null != c) {
            session.delete(c);
        }
    }
}
