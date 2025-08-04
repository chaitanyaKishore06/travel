package com.jfsd.travel.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jfsd.travel.model.Booking;
import com.jfsd.travel.model.Destination;
import com.jfsd.travel.model.Room;
import com.jfsd.travel.model.Testimonial;
import com.jfsd.travel.model.TourPackage;
import com.jfsd.travel.model.User;
import com.jfsd.travel.service.BookingService;
import com.jfsd.travel.service.DestinationService;
import com.jfsd.travel.service.RoomService;
import com.jfsd.travel.service.TestimonialService;
import com.jfsd.travel.service.TourPackageService;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
    @Autowired
    private DestinationService destinationService;
    @Autowired
    private TourPackageService tourPackageService;
    @Autowired
    private TestimonialService testimonialService;
    @Autowired
    private BookingService bookingService;
    
    @Autowired
    private RoomService roomService;

    @GetMapping("/")
    public String home(Model model) {
        List<Destination> destinations = destinationService.getAllDestinations();
        List<TourPackage> featuredPackages = tourPackageService.getFeaturedPackages();
        List<Testimonial> testimonials = testimonialService.getAllTestimonials();

        model.addAttribute("destinations", destinations);
        model.addAttribute("featuredPackages", featuredPackages);
        model.addAttribute("testimonials", testimonials);
        return "home";
    }
    
    
//    Destination from her --------------> 
    
    @GetMapping("/destinations")
    public String destinations(
            @RequestParam(value = "search", required = false, defaultValue = "") String search,
            @RequestParam(value = "country", required = false, defaultValue = "") String country,
            Model model) {
        List<Destination> destinations = destinationService.getAllDestinations();
        List<Destination> filteredDestinations = destinations.stream()
                .filter(dest -> (search.isEmpty() || dest.getName().toLowerCase().contains(search.toLowerCase()) || dest.getCountry().toLowerCase().contains(search.toLowerCase())))
                .filter(dest -> (country.isEmpty() || dest.getCountry().equals(country)))
                .collect(Collectors.toList());

        List<String> countries = destinations.stream().map(Destination::getCountry).distinct().collect(Collectors.toList());

        model.addAttribute("destinations", filteredDestinations);
        model.addAttribute("countries", countries);
        model.addAttribute("search", search);
        model.addAttribute("selectedCountry", country);
        return "destinations";
    }
    
    @GetMapping("/destinations/{id}")
    public String viewDestinationExplore(@PathVariable Long id, Model model) {
        Destination destination = destinationService.getDestinationById(id);
        if (destination == null) {
            return "redirect:/destinations?error=notfound";
        }
        model.addAttribute("destination", destination);
        return "destination-explore"; // Updated to render the new JSP page
    }

    
    
//    Booking from her ------------------>
    
    @GetMapping("/booking")
    public String bookingForm(Model model, HttpSession session) {
        List<TourPackage> packages = tourPackageService.getAllPackages();
        model.addAttribute("packages", packages);
        model.addAttribute("booking", new Booking());
        return "booking";
    }

    
    
    
//    about is her -------------------------------->
    
    @GetMapping("/about")
    public String about() {
        return "about";
    }
    
    
    
    
    @GetMapping("/package/room-selection/{tourId}")
    public String roomSelection(@PathVariable Long tourId, Model model) {
        TourPackage tour = tourPackageService.getPackageById(tourId);
        List<Room> rooms = roomService.getRoomsByTourId(tourId);
        model.addAttribute("tour", tour);
        model.addAttribute("rooms", rooms);
        return "room-selection";
    }


//    @PostMapping("/package/book-now")
//    public String submitBooking(@ModelAttribute Booking booking, HttpSession session, Model model) {
//        User user = (User) session.getAttribute("user");
//        if (user == null) {
//            return "redirect:/login?redirect=/package/book-now";
//        }
//
//        booking.setUser(user);
//        booking.setBookingDate(LocalDate.now());
//        bookingService.saveBooking(booking);
//        return "redirect:/profile";
//    }
    
    
    @PostMapping("/package/book-now")
    public String processBooking(@ModelAttribute Booking booking, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login?redirect=/package/book-now";
        }
        booking.setUser(user);
        booking.setBookingDate(LocalDate.now());
        if (booking.getTravelDate() == null || booking.getReturnDate() == null || 
            booking.getAdults() < 0 || booking.getChildren() < 0) {
            model.addAttribute("error", "Invalid booking details.");
            return "book-now";
        }
        bookingService.saveBooking(booking);
        model.addAttribute("bookingId", booking.getId()); // Pass booking ID for popup
        return "book-now"; // Return to book-now with popup script
    }

    @GetMapping("/package/room-details/{roomId}")
    public String roomDetails(@PathVariable Long roomId, Model model) {
        Room room = roomService.getRoomById(roomId).orElseThrow(() -> new IllegalArgumentException("Room not found"));
        model.addAttribute("room", room);
        return "room-details";
    }
    
    
    
}