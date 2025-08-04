package com.jfsd.travel.service;

import java.util.List;

import com.jfsd.travel.model.Destination;

public interface DestinationService {
    List<Destination> getAllDestinations();
    Destination getDestinationById(Long id);
    void save(Destination destination);
    void delete(Long id);
}
