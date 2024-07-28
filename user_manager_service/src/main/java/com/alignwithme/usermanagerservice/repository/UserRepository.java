package com.alignwithme.usermanagerservice.repository;

import com.alignwithme.usermanagerservice.entity.User;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.Optional;

public interface UserRepository extends MongoRepository<User, String> {
    boolean existsById(String id);

    Optional<User> findByUsername(String username);
}