package com.jfsd.travel.model;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "tour_packages")
public class TourPackage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    private String location;
    private String destination;
    private String duration;
    private double price;
    private Double originalPrice;
    private double rating;
    private int reviews;
    private String imageUrl;
    private String highlights;
    private Integer discount;

    @OneToMany(mappedBy = "tour", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
    private List<Room> roomOptions;

    @ElementCollection
    private List<String> itinerary;

    @ElementCollection
    private List<String> photos;

    private boolean featured; // Added featured field

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }
    public String getDuration() { return duration; }
    public void setDuration(String duration) { this.duration = duration; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    public Double getOriginalPrice() { return originalPrice; }
    public void setOriginalPrice(Double originalPrice) { this.originalPrice = originalPrice; }
    public double getRating() { return rating; }
    public void setRating(double rating) { this.rating = rating; }
    public int getReviews() { return reviews; }
    public void setReviews(int reviews) { this.reviews = reviews; }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    public String getHighlights() { return highlights; }
    public void setHighlights(String highlights) { this.highlights = highlights; }
    public Integer getDiscount() { return discount; }
    public void setDiscount(Integer discount) { this.discount = discount; }
    public List<Room> getRoomOptions() { return roomOptions; }
    public void setRoomOptions(List<Room> roomOptions) { this.roomOptions = roomOptions; }
    public List<String> getItinerary() { return itinerary; }
    public void setItinerary(List<String> itinerary) { this.itinerary = itinerary; }
    public List<String> getPhotos() { return photos; }
    public void setPhotos(List<String> photos) { this.photos = photos; }
    public boolean isFeatured() { return featured; } // Getter for boolean
    public void setFeatured(boolean featured) { this.featured = featured; } // Setter
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
}