package com.bus.bus.repository;

import com.bus.bus.model.bus;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BusRepository extends JpaRepository<bus, Integer> {}
