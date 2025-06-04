package com.parentpal.backend.controller;

import com.parentpal.backend.model.Child;
import com.parentpal.backend.repository.ChildRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/children")
public class ChildController {

    private final ChildRepository repo;

    public ChildController(ChildRepository repo) {
        this.repo = repo;
    }

    @GetMapping
    public List<Child> getAllChildren() {
        return repo.findAll();
    }

    @PostMapping
    public Child addChild(@RequestBody Child child) {
        return repo.save(child);
    }
}
