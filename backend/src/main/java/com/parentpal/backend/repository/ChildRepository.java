package com.parentpal.backend.repository;

import com.parentpal.backend.model.Child;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ChildRepository extends JpaRepository<Child, Long> {}
