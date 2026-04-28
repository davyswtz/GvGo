package com.gvgo.backend.dto;



import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

import java.time.LocalDateTime;
import java.util.Date;

public record UsuariosDTO(
        Long id,

        @NotBlank(message = "nome e obrigatorio")
        @Size(max = 100, message = "nome deve conter no max 100 letras")
        String nome,

        @NotBlank(message = "email e obrigatorio")
        @Email(message = "email invalido")
        @Size(max = 150)
        String email,

        LocalDateTime criadoEM
) {
}
