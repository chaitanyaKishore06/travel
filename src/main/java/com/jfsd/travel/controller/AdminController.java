package com.jfsd.travel.controller;

import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jfsd.travel.model.Booking;
import com.jfsd.travel.model.BookingStatus;
import com.jfsd.travel.model.Destination;
import com.jfsd.travel.model.ItineraryItem;
import com.jfsd.travel.model.Room;
import com.jfsd.travel.model.Testimonial;
import com.jfsd.travel.model.TourPackage;
import com.jfsd.travel.model.User;
import com.jfsd.travel.service.BookingService;
import com.jfsd.travel.service.DestinationService;
import com.jfsd.travel.service.RoomService;
import com.jfsd.travel.service.TestimonialService;
import com.jfsd.travel.service.TourPackageService;
import com.jfsd.travel.service.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private DestinationService destinationService;
    @Autowired
    private TourPackageService tourPackageService;
    @Autowired
    private BookingService bookingService;
    @Autowired
    private TestimonialService testimonialService;
    @Autowired
    private UserService userService;
    @Autowired
    private RoomService roomService;

    // Custom editor for handling comma-separated strings (e.g., amenities, offers, highlights)
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(List.class, "amenities", new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                setValue(text != null ? Arrays.asList(text.split(",")) : new ArrayList<>());
            }
        });
        binder.registerCustomEditor(List.class, "offers", new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                setValue(text != null ? Arrays.asList(text.split(",")) : new ArrayList<>());
            }
        });
        binder.registerCustomEditor(List.class, "highlights", new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                setValue(text != null ? Arrays.asList(text.split(",")) : new ArrayList<>());
            }
        });
        binder.registerCustomEditor(List.class, "itinerary", new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                setValue(text != null ? Arrays.asList(text.split(",")) : new ArrayList<>());
            }
        });
    }

    @GetMapping
    public String adminDashboard(Model model) {
        long destinationCount = destinationService.getAllDestinations().size();
        long packageCount = tourPackageService.getAllPackages().size();
        long bookingCount = bookingService.findAll().size();
        long testimonialCount = testimonialService.getAllTestimonials().size();
        long userCount = userService.findAll().size();
        long roomCount = roomService.getAllRooms().size();

        model.addAttribute("destinationCount", destinationCount);
        model.addAttribute("packageCount", packageCount);
        model.addAttribute("bookingCount", bookingCount);
        model.addAttribute("testimonialCount", testimonialCount);
        model.addAttribute("userCount", userCount);
        model.addAttribute("roomCount", roomCount);

        return "admin/dashboard";
    }

    // Destinations Management
    @GetMapping("destinations")
    public String manageDestinations(Model model) {
        model.addAttribute("destinations", destinationService.getAllDestinations());
        return "admin/destinations";
    }

    @GetMapping("destinations/add")
    public String addDestinationForm(Model model) {
        model.addAttribute("destination", new Destination());
        return "admin/add-destination";
    }

    @PostMapping("destinations/add")
    public String addDestination(@Valid @ModelAttribute Destination destination, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "admin/add-destination";
        }
        destinationService.save(destination);
        return "redirect:/admin/destinations";
    }

    @GetMapping("destinations/edit/{id}")
    public String editDestinationForm(@PathVariable Long id, Model model) {
        model.addAttribute("destination", destinationService.getDestinationById(id));
        return "admin/edit-destination";
    }

    @PostMapping("destinations/edit/{id}")
    public String editDestination(@PathVariable Long id, @Valid @ModelAttribute Destination destination, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/edit-destination";
        }
        destination.setId(id);
        destinationService.save(destination);
        return "redirect:/admin/destinations";
    }

    @GetMapping("destinations/delete/{id}")
    public String deleteDestination(@PathVariable Long id) {
        destinationService.delete(id);
        return "redirect:/admin/destinations";
    }

    // Tour Packages Management
    @GetMapping("packages")
    public String managePackages(Model model) {
        model.addAttribute("packages", tourPackageService.getAllPackages());
        return "admin/packages";
    }

    @GetMapping("packages/add")
    public String addPackageForm(Model model) {
        model.addAttribute("package", new TourPackage());
        return "admin/add-package";
    }

    @PostMapping("packages/add")
    public String addPackage(@Valid @ModelAttribute TourPackage tourPackage, BindingResult result,
            @RequestParam("image") MultipartFile file, Model model) throws IOException {
        if (result.hasErrors()) {
            return "admin/add-package";
        }
        if (!file.isEmpty()) {
            try {
                String uploadDir = "src/main/resources/static/images/";
                String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                Path filePath = Paths.get(uploadDir + fileName);
                Files.createDirectories(filePath.getParent());
                Files.write(filePath, file.getBytes());
                tourPackage.setImageUrl("/images/" + fileName);
            } catch (IOException e) {
                model.addAttribute("error", "Failed to upload image: " + e.getMessage());
                return "admin/add-package";
            }
        }
        tourPackageService.save(tourPackage);
        return "redirect:/admin/packages";
    }

    @GetMapping("packages/edit/{id}")
    public String editPackageForm(@PathVariable Long id, Model model) {
        TourPackage tourPackage = tourPackageService.getPackageById(id); // Adjust based on actual return type
        if (tourPackage != null) {
            model.addAttribute("tourPackage", tourPackage);
        } else {
            // Handle case where package is not found
            return "redirect:/admin/packages?error=packageNotFound";
        }
        return "admin/edit-package";
    }

    @PostMapping("packages/edit/{id}")
    public String editPackage(@PathVariable Long id, @Valid @ModelAttribute TourPackage tourPackage, BindingResult result,
            @RequestParam("image") MultipartFile file, Model model) throws IOException {
        if (result.hasErrors()) {
            return "admin/edit-package";
        }
        tourPackage.setId(id);
        if (!file.isEmpty()) {
            try {
                String uploadDir = "src/main/resources/static/images/";
                String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                Path filePath = Paths.get(uploadDir + fileName);
                Files.createDirectories(filePath.getParent());
                Files.write(filePath, file.getBytes());
                tourPackage.setImageUrl("/images/" + fileName);
            } catch (IOException e) {
                model.addAttribute("error", "Failed to upload image: " + e.getMessage());
                return "admin/edit-package";
            }
        }
        tourPackageService.save(tourPackage);
        return "redirect:/admin/packages";
    }

    @GetMapping("packages/delete/{id}")
    public String deletePackage(@PathVariable Long id) {
        tourPackageService.delete(id);
        return "redirect:/admin/packages";
    }

    // Rooms Management
    @GetMapping("rooms")
    public String manageRooms(Model model) {
        model.addAttribute("rooms", roomService.getAllRooms());
        model.addAttribute("packages", tourPackageService.getAllPackages());
        return "admin/rooms";
    }

    @GetMapping("rooms/add")
    public String addRoomForm(Model model) {
        model.addAttribute("room", new Room());
        model.addAttribute("packages", tourPackageService.getAllPackages());
        return "admin/add-room";
    }

    @PostMapping("rooms/add")
    public String addRoom(@Valid @ModelAttribute Room room, BindingResult result,
            @RequestParam("images") MultipartFile[] images, Model model) throws IOException {
        if (result.hasErrors()) {
            model.addAttribute("packages", tourPackageService.getAllPackages());
            return "admin/add-room";
        }
        if (images != null && images.length > 0) {
            MultipartFile file = images[0]; // Use only the first image
            if (!file.isEmpty()) {
                try {
                    String uploadDir = "src/main/resources/static/images/";
                    String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                    Path filePath = Paths.get(uploadDir + fileName);
                    Files.createDirectories(filePath.getParent());
                    Files.write(filePath, file.getBytes());
                    room.setImageUrl("/images/" + fileName);
                } catch (IOException e) {
                    model.addAttribute("error", "Failed to upload image: " + e.getMessage());
                    model.addAttribute("packages", tourPackageService.getAllPackages());
                    return "admin/add-room";
                }
            } else {
                model.addAttribute("error", "At least one image is required.");
                model.addAttribute("packages", tourPackageService.getAllPackages());
                return "admin/add-room";
            }
        }
        roomService.save(room);
        System.out.println("Saved room with ID: " + room.getId());
        return "redirect:/admin/rooms";
    }

    @GetMapping("rooms/edit/{id}")
    public String editRoomForm(@PathVariable Long id, Model model) {
        Optional<Room> roomOpt = roomService.getRoomById(id);
        Room room = roomOpt.orElseThrow(() -> new IllegalArgumentException("Room not found with id: " + id));
        System.out.println("Room found: " + room);
        model.addAttribute("room", room);
        model.addAttribute("packages", tourPackageService.getAllPackages());
        return "admin/edit-room";
    }

    @PostMapping("rooms/update/{id}")
    public String updateRoom(@PathVariable Long id, @Valid @ModelAttribute Room room, BindingResult result,
            @RequestParam("image") MultipartFile file, Model model) throws IOException {
        if (result.hasErrors()) {
            model.addAttribute("packages", tourPackageService.getAllPackages());
            return "admin/edit-room";
        }
        room.setId(id); // Ensure the ID is set for update
        if (!file.isEmpty()) {
            try {
                String uploadDir = "src/main/resources/static/images/";
                String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                Path filePath = Paths.get(uploadDir + fileName);
                Files.createDirectories(filePath.getParent());
                Files.write(filePath, file.getBytes());
                room.setImageUrl("/images/" + fileName);
            } catch (IOException e) {
                model.addAttribute("error", "Failed to upload image: " + e.getMessage());
                model.addAttribute("packages", tourPackageService.getAllPackages());
                return "admin/edit-room";
            }
        }
        roomService.save(room);
        return "redirect:/admin/rooms";
    }

    @PostMapping("rooms/delete/{id}")
    public String deleteRoom(@PathVariable Long id, Model model) {
        System.out.println("Received delete request for room ID: " + id);
        try {
            roomService.delete(id);
            System.out.println("Room with ID " + id + " deleted successfully");
            return "redirect:/admin/rooms";
        } catch (Exception e) {
            System.out.println("Error deleting room ID " + id + ": " + e.getMessage());
            model.addAttribute("error", "Failed to delete room: " + e.getMessage());
            return "redirect:/admin/rooms?error=true";
        }
    }

    // Bookings Management
    @GetMapping("bookings")
    public String manageBookings(Model model) {
        model.addAttribute("bookings", bookingService.findAll());
        return "admin/bookings";
    }

    @GetMapping("bookings/approve/{id}")
    public String approveBooking(@PathVariable Long id) {
        Booking booking = bookingService.findById(id).orElse(null);
        if (booking != null) {
            booking.setStatus(BookingStatus.APPROVED);
            bookingService.save(booking);
        }
        return "redirect:/admin/bookings";
    }

    @GetMapping("bookings/cancel/{id}")
    public String cancelBooking(@PathVariable Long id) {
        Booking booking = bookingService.findById(id).orElse(null);
        if (booking != null) {
            booking.setStatus(BookingStatus.CANCELLED);
            bookingService.save(booking);
        }
        return "redirect:/admin/bookings";
    }

    // Testimonials Management
    @GetMapping("testimonials")
    public String manageTestimonials(Model model) {
        model.addAttribute("testimonials", testimonialService.getAllTestimonials());
        return "admin/testimonials";
    }

    @GetMapping("testimonials/add")
    public String addTestimonialForm(Model model) {
        model.addAttribute("testimonial", new Testimonial());
        return "admin/add-testimonial";
    }

    @PostMapping("testimonials/add")
    public String addTestimonial(@Valid @ModelAttribute Testimonial testimonial, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "admin/add-testimonial";
        }
        try {
            testimonialService.save(testimonial);
            return "redirect:/admin/testimonials";
        } catch (Exception e) {
            model.addAttribute("error", "Failed to add testimonial: " + e.getMessage());
            return "admin/add-testimonial";
        }
    }

    @GetMapping("testimonials/edit/{id}")
    public String editTestimonialForm(@PathVariable Long id, Model model) {
        model.addAttribute("testimonial", testimonialService.findById(id).orElse(null));
        return "admin/edit-testimonial";
    }

    @PostMapping("testimonials/edit/{id}")
    public String editTestimonial(@PathVariable Long id, @Valid @ModelAttribute Testimonial testimonial, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/edit-testimonial";
        }
        testimonial.setId(id);
        testimonialService.save(testimonial);
        return "redirect:/admin/testimonials";
    }

    @GetMapping("testimonials/delete/{id}")
    public String deleteTestimonial(@PathVariable Long id) {
        testimonialService.delete(id);
        return "redirect:/admin/testimonials";
    }

    // Users Management
    @GetMapping("users")
    public String manageUsers(Model model) {
        model.addAttribute("users", userService.findAll());
        return "admin/users";
    }

    @GetMapping("users/enable/{id}")
    public String enableUser(@PathVariable Long id) {
        User user = userService.findById(id).orElse(null);
        if (user != null) {
            user.setEnabled(true);
            userService.save(user);
        }
        return "redirect:/admin/users";
    }

    @GetMapping("users/disable/{id}")
    public String disableUser(@PathVariable Long id) {
        User user = userService.findById(id).orElse(null);
        if (user != null) {
            user.setEnabled(false);
            userService.save(user);
        }
        return "redirect:/admin/users";
    }

    @GetMapping("users/delete/{id}")
    public String deleteUser(@PathVariable Long id) {
        User user = userService.findById(id).orElse(null);
        if (user != null) {
            userService.delete(id);
        }
        return "redirect:/admin/users";
    }

    @GetMapping("login")
    public String adminLoginForm() {
        return "admin/login";
    }

    @PostMapping("login")
    public String adminLogin(@RequestParam String username, @RequestParam String password, HttpSession session) {
        if ("admin".equals(username) && "admin123".equals(password)) {
            session.setAttribute("admin", true);
            return "redirect:/admin";
        }
        return "admin/login?error=true";
    }

    @GetMapping("logout")
    public String adminLogout(HttpSession session) {
        session.invalidate();
        return "redirect:/admin/login";
    }
}