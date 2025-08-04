package com.jfsd.travel.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jfsd.travel.model.Room;
import com.jfsd.travel.model.TourPackage;

public interface RoomRepository extends JpaRepository<Room, Long>{
	List<Room> findByTour(TourPackage tour);

}
