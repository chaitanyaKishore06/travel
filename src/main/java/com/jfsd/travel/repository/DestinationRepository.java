package com.jfsd.travel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jfsd.travel.model.Destination;

public interface DestinationRepository extends JpaRepository<Destination, Long> {
}