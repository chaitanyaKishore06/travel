package com.jfsd.travel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jfsd.travel.model.Destination;
import com.jfsd.travel.repository.DestinationRepository;

@Service
public class DestinationServiceImpl implements DestinationService {
    @Autowired
    private DestinationRepository destinationRepository;

    @Override
    public List<Destination> getAllDestinations() {
        return destinationRepository.findAll();
    }

    @Override
    public Destination getDestinationById(Long id) {
        return destinationRepository.findById(id).orElse(null);
    }
    @Override
    public void save(Destination destination) {
        destinationRepository.save(destination);
    }
    @Override
    public void delete(Long id) {
        destinationRepository.deleteById(id);
    }
    
}