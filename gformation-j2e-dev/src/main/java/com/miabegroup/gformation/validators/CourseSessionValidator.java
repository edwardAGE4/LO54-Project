/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.miabegroup.gformation.validators;

import com.miabegroup.gformation.entity.Course_Session;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author integrale
 */
public class CourseSessionValidator implements Validator {

    @Override
    public boolean supports(Class clazz) {
        return Course_Session.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "end_Date",
                "required.end_Date", "Ce champs est recquis...");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "start_Date",
                "required.start_Date", "Ce champs est recquis...");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "end_Date",
                "required.end_Date", "Ce champs est recquis...");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "max_register",
                "required.max_register", "Ce champs est recquis...");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "course",
                "required.course", "Ce champs est recquis...");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "location",
                "required.location", "Ce champs est recquis...");
    }

}
