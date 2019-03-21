/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.miabegroup.gformation.controller;

import com.miabegroup.gformation.entity.Course_Session;
import com.miabegroup.gformation.services.CourseService;
import com.miabegroup.gformation.services.CourseSessionService;
import com.miabegroup.gformation.services.LocationsService;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author integrale
 */
@Controller
public class CourseSessionController {

    private static final org.slf4j.Logger logger = LoggerFactory.getLogger(CourseSessionController.class);
    private CourseSessionService courseSessionService;
    private CourseService courseService;
    private LocationsService locationservice;

    @Autowired(required = true)
    @Qualifier(value = "locationsService")
    public void setLocationservice(LocationsService locationservice) {
        this.locationservice = locationservice;
    }

    @Autowired(required = true)
    @Qualifier(value = "courseService")
    public void setCourseService(CourseService courseService) {
        this.courseService = courseService;
    }

    @Autowired(required = true)
    @Qualifier(value = "courseSessionService")
    public void setCourseSessionService(CourseSessionService courseSessionService) {
        this.courseSessionService = courseSessionService;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }

    @RequestMapping(value = "/course_session/new", method = {RequestMethod.GET, RequestMethod.POST})
    public String add(Model model) {

        model.addAttribute("coursesession", new Course_Session());
        model.addAttribute("listecourses", this.courseService.findAll());
        model.addAttribute("listelocations", this.locationservice.findAll());

        return "add_course_session_form";

    }

    @RequestMapping(value = "/course_session/create", method = {RequestMethod.GET, RequestMethod.POST})
    public String saveSession(@ModelAttribute("coursesession") Course_Session c) {

        if (c.getId() != 0) {
            //existing person, call update
            this.courseSessionService.updateCourseSession(c);
        } else {
            //new person, add it
            this.courseSessionService.addCourseSession(c);
        }
        logger.info("Date", c.getEnd_Date());
        return "redirect:/show_sessions";

    }

    @RequestMapping(value = "/show_sessions", method = {RequestMethod.GET, RequestMethod.POST})
    public String listCourses(Model model, HttpServletRequest request) {
        //model.addAttribute("cour", new Location());

        if (request.getParameter("id") != null) {
            this.courseSessionService.removeCourseSession(Integer.valueOf(request.getParameter("id")));
            model.addAttribute("success", 1);
        }
        model.addAttribute("listsessions", this.courseSessionService.findAll());
        return "show_sessions";
    }

    @RequestMapping("/course_session/edit/{id}")
    public String editCourse(@PathVariable("id") int id, Model model) {
        model.addAttribute("coursesession", this.courseSessionService.findById(id));
        model.addAttribute("listecourses", this.courseService.findAll());
        model.addAttribute("listelocations", this.locationservice.findAll());
        return "add_course_session_form";
    }

}
