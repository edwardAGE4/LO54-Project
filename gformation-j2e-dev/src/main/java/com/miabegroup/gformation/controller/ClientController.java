/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.miabegroup.gformation.controller;

import com.miabegroup.gformation.entity.Client;
import com.miabegroup.gformation.services.ClientService;
import com.miabegroup.gformation.services.CourseSessionService;
import com.miabegroup.gformation.utils.SimpleEmail;
import javax.inject.Scope;
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
public class ClientController {

    private CourseSessionService courseSessionService;
    private ClientService clientService;

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

    @RequestMapping(value = "/client/new", method = RequestMethod.GET)
    public String add(Model model) {
        model.addAttribute("client", new Client());
        model.addAttribute("sessioncourse", this.courseSessionService.findAll());

        return "add_client_form";
    }

    @RequestMapping(value = "/client/create", method = {RequestMethod.GET, RequestMethod.POST})
    public String saveClient(@ModelAttribute("client") Client c) {

        if (c.getId() != 0) {
            //existing person, call update
            this.clientService.updateClient(c);
        } else {
            //new person, add it
            this.clientService.addClient(c);
            String bodymsg = "Bonjour " + c.getFirstName() + " " + c.getLastName() + " Merci pour votre inscription";
            SimpleEmail.sendMail(c.getEmail(), bodymsg);
        }

        return "redirect:/show_clients";

    }

    @RequestMapping(value = "/show_clients", method = {RequestMethod.GET, RequestMethod.POST})
    public String listClients(Model model, HttpServletRequest request) {
        //model.addAttribute("cour", new Location());

        if (request.getParameter("id") != null) {
            this.clientService.removeClient(Integer.valueOf(request.getParameter("id")));
            model.addAttribute("success", 1);
        }
        model.addAttribute("clients", this.clientService.findAll());
        return "show_clients";
    }

    @RequestMapping("/client/edit/{id}")
    public String editClient(@PathVariable("id") int id, Model model) {
        model.addAttribute("client", this.clientService.findById(id));
        model.addAttribute("sessioncourse", this.courseSessionService.findAll());
        return "add_client_form";
    }
}
