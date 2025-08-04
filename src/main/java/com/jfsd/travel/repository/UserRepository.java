package com.jfsd.travel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jfsd.travel.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}