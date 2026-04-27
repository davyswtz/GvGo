# Estrutura MVC do backend

Projeto Spring Boot Maven localizado em `backend/backend/backend`.

Tambem existe um `pom.xml` na raiz do repositorio apenas para o IntelliJ reconhecer o backend como modulo Maven quando o projeto aberto for `C:\Projetos\GvGo`.

## Pacotes principais

- `config`: configuracoes da aplicacao, seguranca e beans globais.
- `controller`: endpoints REST que recebem as requisicoes HTTP.
- `dto`: objetos de entrada e saida da API.
- `exception`: tratamento centralizado de erros da API.
- `model`: classes de dominio da aplicacao.
- `repository`: acesso a dados. Hoje existe um repositorio em memoria para facilitar o inicio.
- `service`: regras de negocio e orquestracao entre controller e repository.

## Endpoints de exemplo

- `GET /api/health`
- `GET /api/examples`
- `GET /api/examples/{id}`
- `POST /api/examples`
- `PUT /api/examples/{id}`
- `DELETE /api/examples/{id}`

## Como rodar

Depois de instalar o JDK 17 e configurar `JAVA_HOME`, execute:

```powershell
cd backend\backend\backend
.\mvnw.cmd spring-boot:run
```

Neste projeto tambem foi deixado um JDK local em `C:\Projetos\GvGo\.jdk`.
Para rodar usando esse JDK local:

```powershell
cd backend\backend\backend
.\run-backend.ps1
```

Para testar:

```powershell
.\mvnw.cmd test
```

Ou usando o JDK local:

```powershell
.\test-backend.ps1
```
