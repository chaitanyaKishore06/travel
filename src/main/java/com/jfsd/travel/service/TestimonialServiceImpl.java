package com.jfsd.travel.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jfsd.travel.model.Testimonial;
import com.jfsd.travel.repository.TestimonialRepository;

@Service
public class TestimonialServiceImpl implements TestimonialService {
    @Autowired
    private TestimonialRepository testimonialRepository;

    @Override
    public List<Testimonial> getAllTestimonials() {
        List<Testimonial> testimonials = testimonialRepository.findAll();
        System.out.println("Fetched testimonials: " + testimonials);
        return testimonials;
    }

    @Override
    public Optional<Testimonial> findById(Long id) {
        return testimonialRepository.findById(id);
    }

    @Override
    public void save(Testimonial testimonial) {
        testimonialRepository.save(testimonial);
    }

    @Override
    public void delete(Long id) {
        testimonialRepository.deleteById(id);
    }
}