
package com.jfsd.travel.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.jfsd.travel.model.Booking;
import com.jfsd.travel.model.Room;
import com.jfsd.travel.model.TourPackage;
import com.jfsd.travel.model.User;
import com.jfsd.travel.service.RoomService;
import com.jfsd.travel.service.TourPackageService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PackageController {
    @Autowired
    private TourPackageService tourPackageService;
    @Autowired
    private RoomService roomService;

    @GetMapping("/packages")
    public String packages(
            @RequestParam(value = "search", required = false, defaultValue = "") String search,
            @RequestParam(value = "destination", required = false, defaultValue = "") String destination,
            @RequestParam(value = "duration", required = false, defaultValue = "") String duration,
            @RequestParam(value = "priceMin", required = false, defaultValue = "0") double priceMin,
            @RequestParam(value = "priceMax", required = false, defaultValue = "10000") double priceMax,
            Model model) {
        List<TourPackage> packages = tourPackageService.getAllPackages();
        List<TourPackage> filteredPackages = packages.stream()
                .filter(pkg -> (search.isEmpty() || pkg.getTitle().toLowerCase().contains(search.toLowerCase())))
                .filter(pkg -> (destination.isEmpty() || pkg.getLocation().toLowerCase().contains(destination.toLowerCase())))
                .filter(pkg -> (duration.isEmpty() || pkg.getDuration().toLowerCase().contains(duration.toLowerCase())))
                .filter(pkg -> (pkg.getPrice() >= priceMin && pkg.getPrice() <= priceMax))
                .collect(Collectors.toList());

        List<String> destinations = packages.stream().map(TourPackage::getLocation).distinct().collect(Collectors.toList());
        List<String> durations = packages.stream().map(TourPackage::getDuration).distinct().collect(Collectors.toList());

        model.addAttribute("packages", filteredPackages);
        model.addAttribute("destinations", destinations);
        model.addAttribute("durations", durations);
        model.addAttribute("search", search);
        model.addAttribute("selectedDestination", destination);
        model.addAttribute("selectedDuration", duration);
        model.addAttribute("priceMin", priceMin);
        model.addAttribute("priceMax", priceMax);
        return "packages";
    }

    @GetMapping("/packages/{id}")
    public String viewPackageDetails(@PathVariable Long id, Model model) {
        TourPackage tourPackage = tourPackageService.getPackageById(id);
        if (tourPackage == null) {
            System.out.println("Tour package with ID " + id + " not found.");
            return "redirect:/packages?error=notfound";
        }
        System.out.println("Photos for package ID " + id + ": " + tourPackage.getImageUrl()); // Adjusted to getImageUrl
        // Fetch rooms associated with this tour package
        List<Room> rooms = roomService.getRoomsByTourId(id); // Updated to pass Long directly
        model.addAttribute("tourPackage", tourPackage);
        model.addAttribute("rooms", rooms);
        return "package-details";
    }

    @GetMapping("/packages/{id}/room-selection")
    public String showRoomSelection(@PathVariable Long id, Model model) {
        TourPackage tourPackage = tourPackageService.getPackageById(id);
        if (tourPackage == null) {
            System.out.println("Tour package with ID " + id + " not found.");
            return "redirect:/packages?error=notfound";
        }
        List<Room> rooms = roomService.getRoomsByTourId(id);
        model.addAttribute("tour", tourPackage);
        model.addAttribute("rooms", rooms);
        return "room-selection";
    }

    @GetMapping("/package/book-now/{tourId}")
    public String bookNow(@PathVariable Long tourId, @RequestParam(required = false) Long roomId,
                         @RequestParam(required = false) String checkIn, @RequestParam(required = false) String checkOut,
                         @RequestParam(required = false) Integer adults, @RequestParam(required = false) Integer youth,
                         Model model, HttpSession session) {
        TourPackage tour = tourPackageService.getPackageById(tourId);
        if (tour == null) {
            System.out.println("Tour package with ID " + tourId + " not found.");
            return "redirect:/packages?error=notfound";
        }
        List<Room> allRooms = roomService.getRoomsByTourId(tourId);
        Room selectedRoom = roomId != null ? roomService.getRoomById(roomId).orElse(null) : allRooms.isEmpty() ? null : allRooms.get(0);
        Booking booking = new Booking();
        booking.setTourPackage(tour); // Set the TourPackage object
        if (selectedRoom != null) {
            booking.setRoomId(roomId); // Set the transient roomId
        }
        if (checkIn != null && checkOut != null) {
            booking.setTravelDate(LocalDate.parse(checkIn));
            booking.setReturnDate(LocalDate.parse(checkOut));
            long days = java.time.temporal.ChronoUnit.DAYS.between(booking.getTravelDate(), booking.getReturnDate());
            model.addAttribute("days", days > 0 ? days : 5);
        } else {
            model.addAttribute("days", 5L);
        }
        if (adults != null) booking.setAdults(adults);
        if (youth != null) booking.setChildren(youth);
        User user = (User) session.getAttribute("user");
        if (user != null) {
            booking.setUser(user);
            booking.setFullName(user.getFullName());
            booking.setEmail(user.getEmail());
            booking.setPhone(user.getPhone());
        }
        booking.setBookingDate(LocalDate.now());
        model.addAttribute("tour", tour);
        model.addAttribute("rooms", selectedRoom != null ? List.of(selectedRoom) : allRooms);
        model.addAttribute("booking", booking);
        if (user != null) {
            model.addAttribute("user", user);
        }
        return "book-now";
    }
}