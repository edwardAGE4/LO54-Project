/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.miabegroup.gformation.dao;

import com.miabegroup.gformation.entity.Client;
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
public class ClientDaoImplementation implements ClientDao {

    private static final org.slf4j.Logger logger = LoggerFactory.getLogger(ClientDaoImplementation.class);
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addClient(Client c) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(c);
    }

    @Override
    public void updateClient(Client c) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(c);
    }

    @Override
    public List<Client> findAll() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Client> clientsList = session.createQuery("from Client").list();

        return clientsList;
    }

    @Override
    public Client findById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Client c = (Client) session.load(Client.class, id);
        //logger.info("course loaded successfully, courses details={0}", c);
        return c;
    }

    @Override
    public void removeClient(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Client c = (Client) session.load(Client.class, id);
        if (null != c) {
            session.delete(c);
        }
    }

    @Override
    public List<Client> findClientOrderBySessionID(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        String hql = " from Client where sessionid="+id;
        List<Client> clientsList = session.createQuery(hql).list();

        return clientsList;
    }

}
