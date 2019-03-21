/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.miabegroup.gformation.services;

import com.miabegroup.gformation.dao.ClientDao;
import com.miabegroup.gformation.entity.Client;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;

/**
 *
 * @author integrale
 */
@Service
public class ClientServiceImplementation implements ClientService {

    private ClientDao clientDao;

    public void setClientDao(ClientDao clientDao) {
        this.clientDao = clientDao;
    }

    @Override
    @Transactional
    public void addClient(Client c) {
        this.clientDao.addClient(c);
    }

    @Override
    @Transactional
    public void updateClient(Client c) {
        this.clientDao.updateClient(c);
    }

    @Override
    @Transactional
    public List<Client> findAll() {
        return this.clientDao.findAll();
    }

    @Override
    @Transactional
    public Client findById(int id) {
        return this.clientDao.findById(id);
    }

    @Override
    @Transactional
    public void removeClient(int id) {
        this.clientDao.removeClient(id);
    }

    @Override
    @Transactional
    public List<Client> findClientOrderBySessionID(int id) {
        return this.clientDao.findClientOrderBySessionID(id);
    }
}
