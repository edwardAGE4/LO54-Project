/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.miabegroup.gformation.controller;

import com.miabegroup.gformation.entity.Client;
import com.miabegroup.gformation.services.ClientService;
import com.miabegroup.gformation.services.CourseService;
import com.miabegroup.gformation.services.CourseSessionService;
import com.miabegroup.gformation.services.LocationsService;
import com.miabegroup.gformation.utils.SimpleEmail;
import java.text.DecimalFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
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
public class UserController {

    private ClientService clientService;
    private static final org.slf4j.Logger logger = LoggerFactory.getLogger(UserController.class);
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

    @Autowired(required = true)
    @Qualifier(value = "clientService")
    public void setClientService(ClientService clientService) {
        this.clientService = clientService;
    }

    @RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
    public String listCoursesClient(Model model, HttpServletRequest request, @ModelAttribute("client") Client c) {
        //model.addAttribute("cour", new Location());
        if (request.getParameter("connect") != null) {
            return "front_session";
        } else {
            if (c.getLastName() != null) {
                //logger.debug("id = "+c.getCourse_Session().getId());
                c.setCourse_Session(this.courseSessionService.findById(Integer.valueOf(request.getParameter("courseid"))));;
                this.clientService.addClient(c);

                String bodymsg = "Bonjour " + c.getFirstName() + " " + c.getLastName() + ", merci pour votre inscription à la session de " + c.getCourse_Session().getCourse().getCode() + ", se déroulant à " + c.getCourse_Session().getLocation().getCity() + ", du " + c.getCourse_Session().getStart_Date() + " au " + c.getCourse_Session().getEnd_Date() + ".";
                SimpleEmail.sendMail(c.getEmail(), bodymsg);
                model.addAttribute("success", 1);
            }
            model.addAttribute("listsessions", this.courseSessionService.findAll());
            model.addAttribute("client", new Client());
            return "show_sessions_client";
        }
    }

    @RequestMapping(value = "conne_xion", method = {RequestMethod.GET, RequestMethod.POST})
    public String user_connexion(Model model, HttpServletRequest request) {

        return "front_session";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            HttpSession session,
            ModelMap modelMap) {
        if (username.equalsIgnoreCase("integraleloho@gmail.com")||username.equalsIgnoreCase("ayanougiovanni@gmail.com") && password.equalsIgnoreCase("admin")) {
            session.setAttribute("username", "admin");
            session.setAttribute("email", username);
            return "redirect:/dashboard";
        } else {
            modelMap.put("success", "Login ou mot de passe incorrect");
            return "front_session";
        }
    }

    @RequestMapping(value = "/dashboard", method = {RequestMethod.GET, RequestMethod.POST})
    public String listLocations(Model model, HttpServletRequest request) {

        model.addAttribute("listsessions", this.courseSessionService.findAll());
        model.addAttribute("listcours", this.courseService.findAll());
        model.addAttribute("listclients", this.clientService.findAll());
        return "dashboard";
    }

    @RequestMapping("sessions/clients/{id}")
    public String getClients(@PathVariable("id") int id, Model model) {
        model.addAttribute("clients", this.clientService.findClientOrderBySessionID(id));
        model.addAttribute("pourcentage", Double.parseDouble(new DecimalFormat("##.##").format(100 * ((double) this.clientService.findClientOrderBySessionID(id).size() / (double) this.courseSessionService.findById(id).getMax_register()))));
        return "client_by_session";
    }

    @RequestMapping(value = "connexion", method = {RequestMethod.GET, RequestMethod.POST})
    public String userConnexion(Model model, HttpServletRequest request) {

        return "login_view";
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("username");
        return "front_session";
    }
}
