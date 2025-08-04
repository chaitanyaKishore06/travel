package com.jfsd.travel.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jfsd.travel.model.User;
import com.jfsd.travel.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;

    @Override
    public User registerUser(User user) {
        return userRepository.save(user);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public User authenticate(String username, String password) {
        User user = userRepository.findByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public Optional<User> findById(Long id) {
        return userRepository.findById(id); // JpaRepository method
    }

    @Override
    public void save(User user) {
        userRepository.save(user); // JpaRepository method
    }
    
    @Override
    public void saveUser(User user) {
        userRepository.save(user);
    }
    
    @Override
    public void delete(Long id) {
        userRepository.deleteById(id);
    }
}