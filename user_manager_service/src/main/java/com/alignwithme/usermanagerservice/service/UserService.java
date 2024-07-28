package com.alignwithme.usermanagerservice.service;

import com.alignwithme.usermanagerservice.entity.User;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface UserService {

    public User addUser(User user);
    public List<User> getAllUser();
    public List<User> getPagedUser(int pageNo, int pageSize);
    public Optional<User> getUserById(String id);
    public Optional<User> getUserByUsername(String username);
    public Map<String, String> updateUser(User user);
    public Map<String, String> deleteUser(String id);
    public boolean isUserExist(String id);
}
