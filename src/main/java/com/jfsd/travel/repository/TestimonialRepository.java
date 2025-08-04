package com.jfsd.travel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jfsd.travel.model.Testimonial;

public interface TestimonialRepository extends JpaRepository<Testimonial, Long> {
}