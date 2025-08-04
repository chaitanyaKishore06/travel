package com.jfsd.travel.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jfsd.travel.model.Booking;
import com.jfsd.travel.model.User;
import com.jfsd.travel.repository.BookingRepository;

@Service
public class BookingServiceImpl implements BookingService {
    @Autowired
    private BookingRepository bookingRepository;

    @Override
    public Booking saveBooking(Booking booking) {
        return bookingRepository.save(booking);
    }

    @Override
    public List<Booking> getBookingsByUser(User user) {
        return bookingRepository.findByUser(user);
    }
    @Override
    public List<Booking> findAll() {
        return bookingRepository.findAll();
    }
    @Override
    public Optional<Booking> findById(Long id) {
        return bookingRepository.findById(id); // JpaRepository method
    }
    @Override
    public void save(Booking booking) {
        bookingRepository.save(booking);
    }
    @Override
    public Booking getBookingById(Long id) {
        return bookingRepository.findById(id).orElse(null); // ✅ New method implementation
    }
    
}