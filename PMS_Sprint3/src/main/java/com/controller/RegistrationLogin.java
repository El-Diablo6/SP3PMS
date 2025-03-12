package com.controller;

import com.dao.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;
import com.model.User;

/**
 * This class handles user registration and login operations.
 */
public class RegistrationLogin {
  
    ArrayList<User> customers = new ArrayList<>();
    
    Scanner sc = new Scanner(System.in);

    DbOperations db = new DbOperations();

    
    private String adminUserId = "admin";
    
    private String adminPassword = "admin";

    /**
     * Registers a new user in the system.
     *
     * @param name    The name of the user.
     * @param email   The email of the user.
     * @param mob     The mobile number of the user.
     * @param address The address of the user.
     * @param userId  The user ID for login.
     * @param pwd     The password for login.
     * @return The registered User object if successful, null otherwise.
     */
    public User registraion(String name, String email, String mob, String address, String userId, String pwd) {

        User user = new User(name, email, mob, address, userId, pwd, "customer");
        System.out.println("i am in controller");

        try {
            User x = db.registration(user);
            return x;

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Logs in an existing user.
     *
     * @param id  The user ID.
     * @param pwd The password.
     * @return The User object if login is successful, null otherwise.
     */
    public User login(String id, String pwd) {
        User u = null;
        try {
            u = db.login(id, pwd);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        if (u == null) {
            System.out.println("Invalid userId or password");
            return null;
        } else {
            return u;
        }
    }
}
