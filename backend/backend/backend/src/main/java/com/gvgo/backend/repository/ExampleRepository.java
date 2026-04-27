package com.gvgo.backend.repository;

import java.util.List;
import java.util.Optional;

import com.gvgo.backend.model.Example;

public interface ExampleRepository {

    List<Example> findAll();

    Optional<Example> findById(Long id);

    Example save(Example example);

    void deleteById(Long id);

    boolean existsById(Long id);
}
