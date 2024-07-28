package com.alignwithme.usermanagerservice.controller;

import com.alignwithme.usermanagerservice.entity.User;
import com.alignwithme.usermanagerservice.service.impl.UserServiceImpl;
import com.mongodb.DuplicateKeyException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.HttpStatus;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping(value = "/api_v1")
public class UserController {
    @Autowired
    UserServiceImpl userService;

    @RequestMapping(method = RequestMethod.POST, value = "/users")
    public ResponseEntity<?> addUser(@RequestBody User user) {
        try {
            User savedUser = userService.addUser(user);
            return ResponseEntity.status(HttpStatus.CREATED).body(savedUser);
        } catch (DuplicateKeyException e) {
            // Handle duplicate key exception (email or username already exists)
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Duplicate email or username: " + e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
    }

    @RequestMapping(method = RequestMethod.GET, value = "/users")
    public List<User> getAllUsers(){
        return userService.getAllUser();
    }

    @RequestMapping(method = RequestMethod.GET, value = "/user")
    public List<User> getPagedUsers(
            @RequestParam(value = "page", defaultValue = "0", required = false)int page,
            @RequestParam(value = "pageSize", defaultValue = "2", required = false)int pageSize){
        return userService.getPagedUser(page,pageSize);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/user/{id}")
    public Optional<User> getUserById(@PathVariable String id){
        return userService.getUserById(id);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/user/{username}")
    public Optional<User> getUserByUsername(@PathVariable String username){
        return userService.getUserByUsername(username);
    }


    @RequestMapping(method = RequestMethod.PUT, value = "/user/{id}")
    public ResponseEntity<Map<String, String>> updateUser(@PathVariable String id, @RequestBody User user){

        Map<String, String> response = new HashMap<>();
        if (!userService.isUserExist(id)) {
            response.put("Updated", "false");
        } else {
            response = userService.updateUser(user);
        }
        return ResponseEntity.ok(response);
    }

    @RequestMapping(method = RequestMethod.DELETE, value = "/user/{id}")
    public ResponseEntity<Map<String, String>>  deleteUser(@PathVariable String id) {
        Map<String, String> response = new HashMap<>();
        if (!userService.isUserExist(id)) {
            response.put("deleted", "false");
        } else {
           response = userService.deleteUser(id);
        }
        return ResponseEntity.ok(response);
    }
}
