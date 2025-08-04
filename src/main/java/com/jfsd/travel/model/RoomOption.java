package com.jfsd.travel.model;

import jakarta.persistence.Embeddable;

@Embeddable
public class RoomOption {
    private String roomType;
    private double price;
    private double taxesAndFees;
    private int squareFeet;
    private String features;
    private String offers;
    private boolean refundable;
    private String photoUrl;

    // Getters and Setters
    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }
    
    public String getPhotoUrl() {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTaxesAndFees() {
        return taxesAndFees;
    }

    public void setTaxesAndFees(double taxesAndFees) {
        this.taxesAndFees = taxesAndFees;
    }

    public int getSquareFeet() {
        return squareFeet;
    }

    public void setSquareFeet(int squareFeet) {
        this.squareFeet = squareFeet;
    }

    public String getFeatures() {
        return features;
    }

    public void setFeatures(String features) {
        this.features = features;
    }

    public String getOffers() {
        return offers;
    }

    public void setOffers(String offers) {
        this.offers = offers;
    }

    public boolean isRefundable() {
        return refundable;
    }

    public void setRefundable(boolean refundable) {
        this.refundable = refundable;
    }
}