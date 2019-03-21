/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.miabegroup.gformation.services;

import com.miabegroup.gformation.entity.Location;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;
import com.miabegroup.gformation.dao.LocationsDao;

/**
 *
 * @author integrale
 */
@Service
public class LocationsServiceImplematation implements LocationsService {

    private LocationsDao locationsDao;

    public void setLocationsDao(LocationsDao locationsDao) {
        this.locationsDao = locationsDao;
    }

    @Override
    @Transactional
    public void addLocations(Location c) {
        this.locationsDao.addLocations(c);
    }

    @Override
    @Transactional
    public void updateLocations(Location c) {
        this.locationsDao.updateLocations(c);
    }

    @Override
    @Transactional
    public List<Location> findAll() {
        return this.locationsDao.findAll();
    }

    @Override
    @Transactional
    public Location findById(int id) {
        return this.locationsDao.findById(id);
    }

    @Override
    @Transactional
    public void removeLocations(int id) {
        this.locationsDao.removeLocations(id);
    }
}
