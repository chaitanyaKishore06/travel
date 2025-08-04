package com.jfsd.travel.model;

import jakarta.persistence.Embeddable;
import jakarta.validation.constraints.NotEmpty;
import java.util.Objects;

@Embeddable
public class ItineraryItem {
    private int day;

    @NotEmpty(message = "Itinerary title is required")
    private String title;

    @NotEmpty(message = "Itinerary description is required")
    private String description;

    public int getDay() { return day; }
    public void setDay(int day) { this.day = day; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    @Override
    public String toString() {
        return "ItineraryItem{" +
                "day=" + day +
                ",, title='" + title + '\'' +
                ", description='" + description + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ItineraryItem that = (ItineraryItem) o;
        return day == that.day &&
                Objects.equals(title, that.title) &&
                Objects.equals(description, that.description);
    }

    @Override
    public int hashCode() {
        return Objects.hash(day, title, description);
    }
}