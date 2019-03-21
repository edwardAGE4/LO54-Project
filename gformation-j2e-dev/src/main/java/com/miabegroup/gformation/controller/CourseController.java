/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.miabegroup.gformation.controller;

import com.miabegroup.gformation.entity.Course;
import com.miabegroup.gformation.services.CourseService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author integrale
 */
@Controller
public class CourseController {

    private CourseService courseService;

    @Autowired(required = true)
    @Qualifier(value = "courseService")
    public void setCoursesService(CourseService cs) {
        this.courseService = cs;
    }

    @RequestMapping(value = "/course/new", method = RequestMethod.GET)
    public String add(Model model) {
        model.addAttribute("course", new Course());

        return "add_course_form";
    }

    @RequestMapping(value = "/course/add", method = RequestMethod.POST)
    public String addCourses(@ModelAttribute("course") Course c) {

        this.courseService.addCourses(c);

        return "redirect:/show_courses";

    }

    @RequestMapping(value = "/course/modifier", method = RequestMethod.POST)
    public String validEditCourses(@ModelAttribute("course") Course c) {

        // if (c.getCode().equals("") || c.getCode()==null) {
        //new person, add it
        //this.courseService.addCourses(c);
        //} else {
        //existing person, call update
        this.courseService.updateCourses(c);
        // }

        return "redirect:/show_courses";

    }

    @RequestMapping(value = "/show_courses", method = {RequestMethod.GET, RequestMethod.POST})
    public String listCourses(Model model, HttpServletRequest request) {
        //model.addAttribute("cour", new Location());

        if (request.getParameter("code") != null) {
            this.courseService.removeCourses(request.getParameter("code"));
            model.addAttribute("success", 1);
        }
        model.addAttribute("listcourses", this.courseService.findAll());
        return "show_courses";
    }

    @RequestMapping("/course/remove/{id}")
    public String removeCourse(@PathVariable("id") String id) {

        this.courseService.removeCourses(id);
        return "redirect:/show_courses";
    }

    @RequestMapping("/course/edit/{id}")
    public String editCourse(@PathVariable("id") String id, Model model) {
        model.addAttribute("course", this.courseService.findById(id));
        return "edit_course_form";
    }

}
