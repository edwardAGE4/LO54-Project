/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.miabegroup.gformation.dao;

import com.miabegroup.gformation.entity.Location;
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
public class LocationsDaoImplementation implements LocationsDao {

    private static final org.slf4j.Logger logger = LoggerFactory.getLogger(LocationsDaoImplementation.class);
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public Location findById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Location c = (Location) session.load(Location.class, id);
        logger.info("course loaded successfully, courses details={0}", c);
        return c;
    }

    @Override
    public List<Location> findAll() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Location> coursesList = session.createQuery("from Location").list();
        for (Location c : coursesList) {
            logger.info("Courses List::{0}", c);
        }
        return coursesList;
    }

    @Override
    public void addLocations(Location c) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(c);
        logger.info("Course saved successfully, Person Details={0}", c);
    }

    @Override
    public void updateLocations(Location c) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(c);
        logger.info("Course updated successfully, Person Details={0}", c);
    }

    @Override
    public void removeLocations(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Location c = (Location) session.load(Location.class, id);
        if (null != c) {
            session.delete(c);
        }
        logger.info("Course deleted successfully, course details={0}", c);
    }

}
