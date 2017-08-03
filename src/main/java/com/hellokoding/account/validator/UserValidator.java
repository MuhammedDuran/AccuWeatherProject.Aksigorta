package com.hellokoding.account.validator;

import com.hellokoding.account.model.User;
import com.hellokoding.account.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.ValidatorFactory;
import javax.ws.rs.GET;


@Component
public class UserValidator implements Validator {
    @Autowired
    private UserService userService;
  //  String mail = com.hellokoding.account.model.User.email;
    boolean e1, e2, e3;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "first_name", "NotEmpty");
        if (user.getFirst_name().length() < 2 || user.getFirst_name().length() > 15) {
            errors.rejectValue("first_name", "Size.userForm.first_name");
        }
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "last_name", "NotEmpty");
        if (user.getLast_name().length() < 2 || user.getLast_name().length() > 15) {
            errors.rejectValue("last_name", "Size.userForm.last_name");
        }
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");
        
        e1 = user.getEmail().contains("@");
        e2 = user.getEmail().contains(".com");
        
        if(e1 == false || e2 == false) {
        	errors.rejectValue("email", "CharControl.userForm.email");
        }
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty");
        if (user.getUsername().length() < 5 || user.getUsername().length() > 15) {
            errors.rejectValue("username", "Size.userForm.username");
        }
        
        
        if (userService.findByUsername(user.getUsername()) != null) {
            errors.rejectValue("username", "Duplicate.userForm.username");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (user.getPassword().length() < 6 || user.getPassword().length() > 16) {
            errors.rejectValue("password", "Size.userForm.password");
        }

        if (!user.getPasswordConfirm().equals(user.getPassword())) {
            errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
        }
        
        
        
        
    }
    
    
}
