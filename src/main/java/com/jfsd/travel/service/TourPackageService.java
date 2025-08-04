package com.jfsd.travel.service;

import java.util.List;

import com.jfsd.travel.model.TourPackage;

public interface TourPackageService {
    List<TourPackage> getAllPackages();
    List<TourPackage> getFeaturedPackages();
    TourPackage getPackageById(Long id);
    void save(TourPackage tourPackage);
    void delete(Long id);
	List<TourPackage> getPackagesByLocation(String location);
	
}
