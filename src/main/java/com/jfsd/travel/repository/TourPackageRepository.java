package com.jfsd.travel.repository;

import com.jfsd.travel.model.TourPackage;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TourPackageRepository extends JpaRepository<TourPackage, Long> {
    List<TourPackage> findByFeaturedTrue();
    List<TourPackage> findByLocationContainingIgnoreCase(String location); // Updated from destination to location
}