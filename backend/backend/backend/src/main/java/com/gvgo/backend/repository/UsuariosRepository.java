package com.gvgo.backend.repository;


import com.gvgo.backend.entity.UsuarioEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UsuariosRepository extends JpaRepository<UsuarioEntity, Long> {
    boolean existsByEmail(String email);
}
