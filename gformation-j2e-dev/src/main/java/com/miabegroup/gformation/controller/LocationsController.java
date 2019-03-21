/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.miabegroup.gformation.controller;

import com.miabegroup.gformation.entity.Location;
import com.miabegroup.gformation.services.LocationsService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author integrale
 */
@Controller
public class LocationsController {

    private LocationsService coursesService;

    @Autowired(required = true)
    @Qualifier(value = "locationsService")
    public void setCoursesService(LocationsService cs) {
        this.coursesService = cs;
    }

    @RequestMapping(value = "/location/new", method = RequestMethod.GET)
    public String add(Model model) {
        model.addAttribute("location", new Location());

        return "add_locations_form";
    }

    @RequestMapping(value = "/location/add", method = RequestMethod.POST)
    public String addCourses(@ModelAttribute("location") Location c) {

        if (c.getId() == 0) {
            //new person, add it
            this.coursesService.addLocations(c);
        } else {
            //existing person, call update
            this.coursesService.updateLocations(c);
        }

        return "redirect:/show_locations";

    }

    @RequestMapping(value = "/show_locations", method = {RequestMethod.GET, RequestMethod.POST})
    public String listLocations(Model model, HttpServletRequest request) {
        //model.addAttribute("cour", new Location());

        if (request.getParameter("id") != null) {
            this.coursesService.removeLocations(Integer.valueOf(request.getParameter("id")));
            model.addAttribute("success", 1);
        }
        model.addAttribute("listlocations", this.coursesService.findAll());
        return "show_locations";
    }

    @RequestMapping("/remove/{id}")
    public String removeLocation(@PathVariable("id") int id) {

        this.coursesService.removeLocations(id);
        return "redirect:/show_locations";
    }

    @RequestMapping(value = "/location/supprimer")
    public String someMethod(@RequestParam("id") int id) {
        this.coursesService.removeLocations(id);
        return "redirect:/show_locations";
    }

    @RequestMapping("/edit/{id}")
    public String editLocation(@PathVariable("id") int id, Model model) {
        model.addAttribute("location", this.coursesService.findById(id));
        return "add_locations_form";
    }

}
