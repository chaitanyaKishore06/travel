package com.jfsd.travel.controller;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jfsd.travel.model.Booking;
import com.jfsd.travel.model.Testimonial;
import com.jfsd.travel.model.User;
import com.jfsd.travel.service.BookingService;
import com.jfsd.travel.service.TestimonialService;
import com.jfsd.travel.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;
    @Autowired
    private BookingService bookingService;
    @Autowired
    private TestimonialService testimonialService;

    @GetMapping("register")
    public String registerForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("register")
    public String registerUser(@ModelAttribute User user) {
        userService.registerUser(user);
        return "redirect:/login";
    }

    @GetMapping("login")
    public String loginForm(@RequestParam(value = "redirect", required = false) String redirect, Model model) {
        model.addAttribute("redirect", redirect);
        return "login";
    }

    @PostMapping("login")
    public String login(@RequestParam String username, @RequestParam String password,
                        @RequestParam(value = "redirect", required = false) String redirect,
                        HttpSession session, Model model) {
        User user = userService.authenticate(username, password);
        if (user != null) {
            session.setAttribute("user", user); // Ensure user is set in session
            if (redirect != null && !redirect.isEmpty()) {
                return "redirect:" + redirect;
            }
            return "redirect:/";
        }
        model.addAttribute("error", "Invalid username or password");
        model.addAttribute("username", username);
        model.addAttribute("redirect", redirect);
        return "login";
    }

    @GetMapping("/profile")
    public String profile(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login?redirect=/profile";
        }
        List<Booking> bookings = bookingService.getBookingsByUser(user);
        model.addAttribute("user", user);
        model.addAttribute("bookings", bookings);
        if (user.getProfilePhoto() != null && user.getProfilePhoto().length > 0) {
            String base64Photo = Base64.getEncoder().encodeToString(user.getProfilePhoto());
            model.addAttribute("base64Photo", base64Photo);
        }
        logger.info("Profile loaded for user {} with photo size: {}", user.getUsername(), user.getProfilePhoto() != null ? user.getProfilePhoto().length : 0);
        return "profile";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
    
    @PostMapping("/profile/upload-photo")
    public String uploadPhoto(@RequestParam("photo") MultipartFile photo, HttpSession session) throws IOException {
        User user = (User) session.getAttribute("user");
        if (user != null && !photo.isEmpty()) {
            user.setProfilePhoto(photo.getBytes());
            userService.saveUser(user);
            logger.info("Photo uploaded for user {} with size: {}", user.getUsername(), user.getProfilePhoto().length);
        }
        return "redirect:/profile";
    }

    @PostMapping("/profile/remove-photo")
    public String removePhoto(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            user.setProfilePhoto(null);
            userService.saveUser(user);
            logger.info("Photo removed for user {}", user.getUsername());
        }
        return "redirect:/profile";
    }
    
    @PostMapping("/submit-testimonial")
    public String submitTestimonial(@RequestParam Long bookingId, @RequestParam String name, @RequestParam String comment,
                                   @RequestParam int rating, @RequestParam String imageUrl, HttpSession session) {
        Booking booking = bookingService.getBookingById(bookingId);
        if (booking != null && booking.isReviewPending()) {
            Testimonial testimonial = new Testimonial();
            testimonial.setName(name);
            testimonial.setComment(comment);
            testimonial.setRating(rating);
            testimonial.setImageUrl(imageUrl);
            testimonial.setBooking(booking);
            testimonialService.save(testimonial);
            booking.setReviewPending(false);
            booking.setTestimonial(testimonial);
            bookingService.saveBooking(booking);
        }
        return "redirect:/profile";
    }
}