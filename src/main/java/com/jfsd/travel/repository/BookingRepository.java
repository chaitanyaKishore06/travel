package com.jfsd.travel.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jfsd.travel.model.Booking;
import com.jfsd.travel.model.User;

public interface BookingRepository extends JpaRepository<Booking, Long> {
    List<Booking> findByUser(User user);
}