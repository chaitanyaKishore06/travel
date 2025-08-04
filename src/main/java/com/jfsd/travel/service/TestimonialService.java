package com.jfsd.travel.service;

import java.util.List;
import java.util.Optional;



import com.jfsd.travel.model.Testimonial;

public interface TestimonialService {
	List<Testimonial> getAllTestimonials();
    Optional<Testimonial> findById(Long id); // Changed to return Optional<Testimonial>
    void save(Testimonial testimonial);
    void delete(Long id);
}
