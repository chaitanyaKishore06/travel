package com.jfsd.travel.dto;

import java.util.List;

public class TourPackageForm {
    private Long id;
    private String title;
    private String destination;
    private String duration;
    private double price;
    private String imageUrl;
    private String description;
    private boolean featured;
    private String photos; // Comma-separated string
    private String amenities; // Comma-separated string
    private String offers; // Comma-separated string
    private String keyOfferings; // Comma-separated string
    private String roomOptions; // String in format: roomType|price|taxesAndFees|squareFeet|features|offers|refundable;...
    private String itinerary; // String in format: day|title|description;...
    private String included; // Comma-separated string
    private String excluded; // Comma-separated string

    // Getters and setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getDestination() { return destination; }
    public void setDestination(String destination) { this.destination = destination; }
    public String getDuration() { return duration; }
    public void setDuration(String duration) { this.duration = duration; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public boolean isFeatured() { return featured; }
    public void setFeatured(boolean featured) { this.featured = featured; }
    public String getPhotos() { return photos; }
    public void setPhotos(String photos) { this.photos = photos; }
    public String getAmenities() { return amenities; }
    public void setAmenities(String amenities) { this.amenities = amenities; }
    public String getOffers() { return offers; }
    public void setOffers(String offers) { this.offers = offers; }
    public String getKeyOfferings() { return keyOfferings; }
    public void setKeyOfferings(String keyOfferings) { this.keyOfferings = keyOfferings; }
    public String getRoomOptions() { return roomOptions; }
    public void setRoomOptions(String roomOptions) { this.roomOptions = roomOptions; }
    public String getItinerary() { return itinerary; }
    public void setItinerary(String itinerary) { this.itinerary = itinerary; }
    public String getIncluded() { return included; }
    public void setIncluded(String included) { this.included = included; }
    public String getExcluded() { return excluded; }
    public void setExcluded(String excluded) { this.excluded = excluded; }
}