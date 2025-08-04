package com.jfsd.travel.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jfsd.travel.model.TourPackage;
import com.jfsd.travel.repository.TourPackageRepository;

import jakarta.persistence.EntityNotFoundException;

@Service
public class TourPackageServiceImpl implements TourPackageService {
    @Autowired
    private TourPackageRepository tourPackageRepository;

    @Override
    @Transactional(readOnly = true)
    public List<TourPackage> getAllPackages() {
        List<TourPackage> packages = tourPackageRepository.findAll();
        packages.forEach(pkg -> initializeCollections(pkg));
        return packages;
    }

    @Override
    @Transactional(readOnly = true)
    public List<TourPackage> getFeaturedPackages() {
        List<TourPackage> featuredPackages = tourPackageRepository.findByFeaturedTrue();
        featuredPackages.forEach(this::initializeCollections);
        return featuredPackages;
    }

//    @Override
//    @Transactional(readOnly = true)
//    public TourPackage getPackageById(Long id) {
//        Optional<TourPackage> optionalPackage = tourPackageRepository.findById(id);
//        if (optionalPackage.isEmpty()) {
//            throw new EntityNotFoundException("Tour package with ID " + id + " not found");
//        }
//        TourPackage pkg = optionalPackage.get();
//        initializeCollections(pkg);
//        return pkg;
//    }
    
    
    
    @Override
    public TourPackage getPackageById(Long id) {
        return tourPackageRepository.findById(id).orElse(null);
    }

    @Override
    @Transactional(readOnly = true)
    public List<TourPackage> getPackagesByLocation(String location) { // Renamed for clarity
        List<TourPackage> packages = tourPackageRepository.findByLocationContainingIgnoreCase(location);
        packages.forEach(this::initializeCollections);
        return packages;
    }

    @Override
    @Transactional
    public void save(TourPackage tourPackage) {
        if (tourPackage == null) {
            throw new IllegalArgumentException("Tour package cannot be null");
        }
        tourPackageRepository.save(tourPackage);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        if (!tourPackageRepository.existsById(id)) {
            throw new EntityNotFoundException("Tour package with ID " + id + " not found");
        }
        tourPackageRepository.deleteById(id);
    }

    private void initializeCollections(TourPackage pkg) {
        if (pkg != null) {
            pkg.getItinerary().size();
            pkg.getRoomOptions().size();
            if (pkg.getPhotos() != null) pkg.getPhotos().size();
        }
    }
}