package com.jfsd.travel.model;

import java.util.List;

import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "destinations")
public class Destination {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String country;
    private String description;
    private String imageUrl;
    private double rating;
    private String bestTimeToVisit;
    @ElementCollection
    private List<String> activities;

    // New fields for additional details
    @ElementCollection
    private List<String> topAttractions; // e.g., ["Ubud", "Tanah Lot Temple"]
    @ElementCollection
    private List<String> localCuisine; // e.g., ["Nasi Goreng", "Babi Guling"]
    private String travelTips; // e.g., "Currency: IDR, Scooter rental: IDR 50,000/day..."
    private String culturalEtiquette; // e.g., "Don't point with feet, remove shoes..."
    private String approximateCosts; // e.g., "Budget meal: IDR 30,000–50,000..."
    private String weatherDetails; // e.g., "Dry season, 27–30°C..."
    private String hiddenGem; // e.g., "Jatiluwih Rice Terraces..."

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    public double getRating() { return rating; }
    public void setRating(double rating) { this.rating = rating; }
    public String getBestTimeToVisit() { return bestTimeToVisit; }
    public void setBestTimeToVisit(String bestTimeToVisit) { this.bestTimeToVisit = bestTimeToVisit; }
    public List<String> getActivities() { return activities; }
    public void setActivities(List<String> activities) { this.activities = activities; }
    public List<String> getTopAttractions() { return topAttractions; }
    public void setTopAttractions(List<String> topAttractions) { this.topAttractions = topAttractions; }
    public List<String> getLocalCuisine() { return localCuisine; }
    public void setLocalCuisine(List<String> localCuisine) { this.localCuisine = localCuisine; }
    public String getTravelTips() { return travelTips; }
    public void setTravelTips(String travelTips) { this.travelTips = travelTips; }
    public String getCulturalEtiquette() { return culturalEtiquette; }
    public void setCulturalEtiquette(String culturalEtiquette) { this.culturalEtiquette = culturalEtiquette; }
    public String getApproximateCosts() { return approximateCosts; }
    public void setApproximateCosts(String approximateCosts) { this.approximateCosts = approximateCosts; }
    public String getWeatherDetails() { return weatherDetails; }
    public void setWeatherDetails(String weatherDetails) { this.weatherDetails = weatherDetails; }
    public String getHiddenGem() { return hiddenGem; }
    public void setHiddenGem(String hiddenGem) { this.hiddenGem = hiddenGem; }
}