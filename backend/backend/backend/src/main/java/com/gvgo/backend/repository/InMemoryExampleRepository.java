package com.gvgo.backend.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicLong;

import com.gvgo.backend.model.Example;

import org.springframework.stereotype.Repository;

@Repository
public class InMemoryExampleRepository implements ExampleRepository {

    private final Map<Long, Example> examples = new ConcurrentHashMap<>();
    private final AtomicLong sequence = new AtomicLong(0);

    @Override
    public List<Example> findAll() {
        return new ArrayList<>(examples.values());
    }

    @Override
    public Optional<Example> findById(Long id) {
        return Optional.ofNullable(examples.get(id));
    }

    @Override
    public Example save(Example example) {
        if (example.getId() == null) {
            example.setId(sequence.incrementAndGet());
        }

        examples.put(example.getId(), example);
        return example;
    }

    @Override
    public void deleteById(Long id) {
        examples.remove(id);
    }

    @Override
    public boolean existsById(Long id) {
        return examples.containsKey(id);
    }
}
