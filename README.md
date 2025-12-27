# 🧑‍💼 Marketplace de Serviços Profissionais (B2B) – API REST

API REST para um **Marketplace B2B de Serviços Profissionais**, onde empresas contratantes podem publicar demandas e prestadores de serviços enviam propostas, firmam contratos, recebem pagamentos e avaliações.

Exemplos de serviços:

* Tecnologia da Informação (TI)
* Manutenção
* Marketing
* Contabilidade
* Design
* Outros serviços profissionais

---

## 🎯 Objetivo do Projeto

Construir uma API REST que permita:

* Cadastro de empresas e prestadores de serviço
* Publicação de demandas de serviço
* Envio e gestão de propostas
* Contratação baseada em propostas
* Execução e acompanhamento do serviço
* Pagamento
* Avaliação do prestador

O projeto tem foco em **boas práticas de backend**, **arquitetura limpa**, **DDD** e **escalabilidade**.

---

## 🧠 Visão Geral da Arquitetura

O projeto é estruturado para aplicar:

* Domain-Driven Design (DDD)
* Clean Architecture
* SOLID
* Separação de responsabilidades

Camadas principais:

* **Domain**: regras de negócio
* **Application**: casos de uso
* **Infrastructure**: banco de dados, HTTP, autenticação
* **Presentation**: controllers e rotas REST

---

## 🧱 Modelo de Dados (Core)

### 1️⃣ User

```text
- id (UUID)
- name
- email
- password_hash
- role (ADMIN | COMPANY | PROVIDER)
- status (ACTIVE | INACTIVE)
- created_at
```

---

### 2️⃣ Company

```text
- id (UUID)
- user_id (FK User)
- name
- document (CNPJ)
- address
- created_at
```

---

### 3️⃣ ServiceProvider

```text
- id (UUID)
- user_id (FK User)
- profession
- bio
- hourly_rate
- rating
- created_at
```

---

### 4️⃣ ServiceCategory

```text
- id (UUID)
- name
- description
```

---

### 5️⃣ ServiceRequest (Demanda)

```text
- id (UUID)
- company_id (FK Company)
- category_id (FK ServiceCategory)
- title
- description
- status (OPEN | IN_PROGRESS | DONE | CANCELED)
- created_at
```

---

### 6️⃣ Proposal

```text
- id (UUID)
- service_request_id (FK ServiceRequest)
- provider_id (FK ServiceProvider)
- price
- estimated_hours
- status (PENDING | ACCEPTED | REJECTED)
- created_at
```

---

### 7️⃣ Contract

```text
- id (UUID)
- service_request_id (FK)
- proposal_id (FK)
- start_date
- end_date
- status (ACTIVE | FINISHED | CANCELED)
```

---

### 8️⃣ Payment

```text
- id (UUID)
- contract_id (FK Contract)
- amount
- status (PENDING | PAID | FAILED)
- paid_at
```

---

### 9️⃣ Review

```text
- id (UUID)
- contract_id (FK Contract)
- rating (1–5)
- comment
- created_at
```

---

## 🔁 Fluxo Principal do Sistema

1. Empresa cria uma **ServiceRequest**
2. Prestadores enviam **Proposals**
3. Empresa aceita uma proposta → cria um **Contract**
4. Serviço é executado
5. Pagamento é realizado
6. Empresa avalia o prestador

---

## 🔌 Endpoints REST (Exemplos)

### 🔐 Autenticação

```http
POST /auth/register
POST /auth/login
```

---

### 📄 Demandas de Serviço

```http
POST   /service-requests
GET    /service-requests
GET    /service-requests/{id}
PATCH  /service-requests/{id}/status
```

---

### 💬 Propostas

```http
POST /proposals
GET  /service-requests/{id}/proposals
```

---

### 🤝 Contratos

```http
POST /contracts
GET  /contracts/{id}
```

---

### 💰 Pagamentos

```http
POST /payments
```

---

### ⭐ Avaliações

```http
POST /reviews
GET  /providers/{id}/reviews
```

---

## 🔐 Autenticação e Autorização

* Autenticação via **JWT**
* Controle de acesso baseado em **roles**:

  * `ADMIN`
  * `COMPANY`
  * `PROVIDER`

---

## 🧪 Testes

* Testes unitários para regras de negócio
* Testes de casos de uso
* Mocks de repositórios
* Testes de integração (opcional)

---

## 🧠 Desafios Técnicos (Evolução do Projeto)

* 🔐 JWT + controle de roles
* 📦 Aplicação de DDD (Entities, UseCases, Repositories)
* 🧪 Testes unitários e de integração
* 🔔 Eventos de domínio (ex: contrato criado, pagamento confirmado)
* 📊 Paginação e filtros
* 🔄 Soft delete
* 📜 Auditoria e histórico de status

---

## 🚀 Stack Sugerida

* **Backend:** NestJS ou .NET 8
* **ORM:** TypeORM / Prisma / EF Core
* **Banco de Dados:** PostgreSQL
* **Autenticação:** JWT
* **Documentação:** Swagger / OpenAPI

---

## 📌 Roadmap Futuro

* [ ] Notificações por eventos
* [ ] Integração com gateway de pagamento
* [ ] Cache com Redis
* [ ] Observabilidade (logs e métricas)
* [ ] CI/CD

---

## 📄 Licença

Este projeto está sob a licença MIT.

---

## 👨‍💻 Autor

Desenvolvido por **Matheus Daniel**
Software Engineer | Backend
Node.js • NestJS 
