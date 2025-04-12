package com.bus.bus.controller;

import com.bus.bus.model.bus;
import com.bus.bus.repository.BusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/bus")
public class BusController {

    @Autowired
    private BusRepository busRepository;

    @GetMapping
    public List<bus> obtenerTodosLosBuses() {
        return busRepository.findAll();
    }

    @GetMapping("/{id}")
    public bus obtenerBusPorId(@PathVariable Integer id) {
        return busRepository.findById(id).orElse(null);
    }
}
