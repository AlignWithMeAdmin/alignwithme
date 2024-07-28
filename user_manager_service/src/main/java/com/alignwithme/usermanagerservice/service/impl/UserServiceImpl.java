package com.alignwithme.usermanagerservice.service.impl;

import com.alignwithme.usermanagerservice.entity.User;
import com.alignwithme.usermanagerservice.repository.UserRepository;
import com.alignwithme.usermanagerservice.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.*;

import static org.apache.logging.log4j.MarkerManager.exists;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserRepository userRepository;

    @Override
    public User addUser(User user) {

        return userRepository.save(user);
    }

    @Override
    public List<User> getAllUser() {
        List<User> users = new ArrayList<>();
        userRepository.findAll().forEach(users :: add);
        return users;
    }

    @Override
    public List<User> getPagedUser(int pageNo, int pageSize) {
        Pageable pageable = PageRequest.of(pageNo, pageSize);
        Page<User> users = userRepository.findAll(pageable);
        List<User> listOfUsers = users.getContent();
        return listOfUsers;
    }

    @Override
    public Optional<User> getUserById(String id) {
        return userRepository.findById(id);
    }

    @Override
    public Optional<User> getUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public Map<String, String> updateUser(User user) {
        Map<String, String> response = new HashMap<>();
        userRepository.save(user);
        response.put("Updated", "true");
        return response;
    }

    @Override
    public Map<String, String> deleteUser(String id) {
        userRepository.deleteById(id);
        Map<String, String> response = new HashMap<>();
        response.put("id", String.valueOf(id));
        response.put("deleted", "true");

        return response;
    }

    @Override
    public boolean isUserExist(String id) {
        return userRepository.existsById(id);
    }

}
