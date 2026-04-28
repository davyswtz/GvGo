package com.gvgo.backend.controller;

import java.util.List;
import java.util.Map;

import com.gvgo.backend.dto.UsuariosDTO;
import com.gvgo.backend.service.UsuariosServie;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import static org.springframework.data.jpa.domain.AbstractPersistable_.id;

@RestController
@RequestMapping("/api/usuarios")
public class LoginController {

    @Autowired
    private UsuariosServie service;

    @GetMapping("/{id}")
    public ResponseEntity<UsuariosDTO> buscar(@PathVariable Long id) {
        return ResponseEntity.ok(service.buscar(id));
    }

    @PostMapping("/cadastro")
    public ResponseEntity<UsuariosDTO> cadastrar(@RequestBody @Valid UsuariosDTO dto) {
        UsuariosDTO criado = service.cadastrar(dto);
        return ResponseEntity.status(HttpStatus.CREATED).body(criado);
    };

    @GetMapping
    public ResponseEntity<List<UsuariosDTO>> listarTodos() {
        return ResponseEntity.ok(service.listarTodos());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletar(@PathVariable Long id) {
        service.deletar(id);
        return ResponseEntity.noContent().build();
    }

    @PutMapping("/{id}")
    public ResponseEntity<UsuariosDTO> atualizar(
            @PathVariable java.lang.Long id,
            @RequestBody @Valid UsuariosDTO dto) {
        return ResponseEntity.ok(service.atualizar(id, dto));
    }

}
