/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.miabegroup.gformation.services;

import com.miabegroup.gformation.entity.Client;
import java.util.List;

/**
 *
 * @author integrale
 */
public interface ClientService {

    public void addClient(Client c);

    public void updateClient(Client c);

    public List<Client> findAll();

    public Client findById(int id);

    public List<Client> findClientOrderBySessionID(int id);

    public void removeClient(int id);
}
