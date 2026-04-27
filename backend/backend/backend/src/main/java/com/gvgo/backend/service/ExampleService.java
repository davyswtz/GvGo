package com.gvgo.backend.service;

import java.util.List;

import com.gvgo.backend.dto.ExampleRequest;
import com.gvgo.backend.dto.ExampleResponse;
import com.gvgo.backend.exception.ResourceNotFoundException;
import com.gvgo.backend.model.Example;
import com.gvgo.backend.repository.ExampleRepository;

import org.springframework.stereotype.Service;

@Service
public class ExampleService {

    private final ExampleRepository exampleRepository;

    public ExampleService(ExampleRepository exampleRepository) {
        this.exampleRepository = exampleRepository;
    }

    public List<ExampleResponse> findAll() {
        return exampleRepository.findAll()
                .stream()
                .map(this::toResponse)
                .toList();
    }

    public ExampleResponse findById(Long id) {
        return exampleRepository.findById(id)
                .map(this::toResponse)
                .orElseThrow(() -> new ResourceNotFoundException("Exemplo nao encontrado: " + id));
    }

    public ExampleResponse create(ExampleRequest request) {
        Example example = new Example(null, request.name(), request.description());
        return toResponse(exampleRepository.save(example));
    }

    public ExampleResponse update(Long id, ExampleRequest request) {
        Example example = exampleRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Exemplo nao encontrado: " + id));

        example.setName(request.name());
        example.setDescription(request.description());

        return toResponse(exampleRepository.save(example));
    }

    public void delete(Long id) {
        if (!exampleRepository.existsById(id)) {
            throw new ResourceNotFoundException("Exemplo nao encontrado: " + id);
        }

        exampleRepository.deleteById(id);
    }

    private ExampleResponse toResponse(Example example) {
        return new ExampleResponse(
                example.getId(),
                example.getName(),
                example.getDescription()
        );
    }
}
