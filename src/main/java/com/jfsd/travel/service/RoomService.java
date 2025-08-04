package com.jfsd.travel.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jfsd.travel.model.Room;
import com.jfsd.travel.model.TourPackage;
import com.jfsd.travel.repository.RoomRepository;

@Service
public class RoomService {
    @Autowired
    private RoomRepository roomRepository;
    
    
    @Autowired
    private TourPackageService tourPackageService;

    @Transactional(readOnly = true)
    public List<Room> getAllRooms() {
        return roomRepository.findAll();
    }

    @Transactional(readOnly = true)
    public Optional<Room> getRoomById(Long id) {
        return roomRepository.findById(id);
    }

    @Transactional
    public Room save(Room room) {
        return roomRepository.save(room);
    }

    @Transactional
    public void delete(Long id) {
        roomRepository.deleteById(id);
    }

    @Transactional(readOnly = true)
    public List<Room> getRoomsByTourId(Long tourId) {
        TourPackage tour = tourPackageService.getPackageById(tourId); // Fetch the TourPackage
        return roomRepository.findByTour(tour); // Use the repository method
    }
}