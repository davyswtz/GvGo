package com.gvgo.backend.service;


import com.gvgo.backend.dto.UsuariosDTO;
import com.gvgo.backend.entity.UsuarioEntity;
import com.gvgo.backend.repository.UsuariosRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

@Service
public class UsuariosServie {

    @Autowired
    private UsuariosRepository repository;

    //metodo de cadastro
    public UsuariosDTO cadastrar(UsuariosDTO dto) {
        UsuarioEntity usuario = new UsuarioEntity();
        usuario.setNome(dto.nome());
        usuario.setEmail(dto.email());
        usuario.setCriadoEm(LocalDateTime.now());

        UsuarioEntity salvo = repository.save(usuario);
        return toDTO(salvo);
    }

    //buscar usuario por id
    public UsuariosDTO buscar(Long id){
        UsuarioEntity usuario = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Usuario nao encontrado"));

        return toDTO(usuario);
    }

    //listar todos os usuarios
    public List<UsuariosDTO> listarTodos() {
        return repository.findAll()
                .stream()
                .map(this::toDTO)
                .collect(Collectors.toList());
    }


//excluir usuario por id
    public void deletar(Long id) {
        if(!repository.existsById(id)) {
            throw new RuntimeException("Usuario nao encontrado");
        }
        repository.deleteById(id);
    }

    //atualizar usuarios
    public UsuariosDTO atualizar(Long id, UsuariosDTO dto) {
        UsuarioEntity usuario = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("usuario nao econtrado"));

        usuario.setNome(dto.nome());
        usuario.setEmail(dto.email());

        UsuarioEntity atualizado = repository.save(usuario);
        return toDTO(atualizado);

    }

    //converter entitiy para dto
    private UsuariosDTO toDTO(UsuarioEntity u) {
        return new UsuariosDTO(u.getId(), u.getNome(), u.getEmail(), u.getCriadoEm());
    }



}

