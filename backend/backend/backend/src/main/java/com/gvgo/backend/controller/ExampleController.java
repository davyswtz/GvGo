package com.gvgo.backend.controller;

import java.util.List;

import com.gvgo.backend.dto.ExampleRequest;
import com.gvgo.backend.dto.ExampleResponse;
import com.gvgo.backend.service.ExampleService;

import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/examples")
public class ExampleController {

    private final ExampleService exampleService;

    public ExampleController(ExampleService exampleService) {
        this.exampleService = exampleService;
    }

    @GetMapping
    public List<ExampleResponse> findAll() {
        return exampleService.findAll();
    }

    @GetMapping("/{id}")
    public ExampleResponse findById(@PathVariable Long id) {
        return exampleService.findById(id);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ExampleResponse create(@Valid @RequestBody ExampleRequest request) {
        return exampleService.create(request);
    }

    @PutMapping("/{id}")
    public ExampleResponse update(@PathVariable Long id, @Valid @RequestBody ExampleRequest request) {
        return exampleService.update(id, request);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Long id) {
        exampleService.delete(id);
    }
}
