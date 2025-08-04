package com.jfsd.travel.service;

import java.util.List;
import java.util.Optional;

import com.jfsd.travel.model.Booking;
import com.jfsd.travel.model.User;

public interface BookingService {
	Booking saveBooking(Booking booking);
    List<Booking> getBookingsByUser(User user);
    List<Booking> findAll();
    Optional<Booking> findById(Long id); // Should return Optional<Booking>
    void save(Booking booking);
    Booking getBookingById(Long id);
}