package com.jfsd.travel.service;

import java.util.List;
import java.util.Optional;

import com.jfsd.travel.model.User;

public interface UserService {
	User registerUser(User user);
    User findByUsername(String username);
    User authenticate(String username, String password);
    List<User> findAll();
    Optional<User> findById(Long id); // Add this to return Optional<User>
    void save(User user);
    void saveUser(User user);
    void delete(Long id);
}
