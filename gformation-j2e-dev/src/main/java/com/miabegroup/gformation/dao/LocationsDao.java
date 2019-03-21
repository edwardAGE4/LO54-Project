/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.miabegroup.gformation.dao;

import com.miabegroup.gformation.entity.Location;
import java.util.List;

/**
 *
 * @author integrale
 */
public interface LocationsDao {

    public void addLocations(Location c);

    public void updateLocations(Location c);

    public List<Location> findAll();

    public Location findById(int id);

    public void removeLocations(int id);

}
