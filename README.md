# Secure Ship - Banco de Dados

## Sobre o projeto

O **Secure Ship** é um projeto desenvolvido para realizar o monitoramento das condições ambientais em contêineres utilizados no transporte de componentes eletrônicos.

O principal objetivo é acompanhar continuamente os níveis de **umidade** (e futuramente outros parâmetros ambientais, como temperatura), permitindo identificar situações que possam comprometer a integridade da carga durante o transporte.

Este repositório contém o script SQL responsável pela criação da estrutura inicial do banco de dados da aplicação, incluindo tabelas, relacionamentos e registros de exemplo para testes.

---

# Tecnologias

- MySQL
- SQL

---

# Estrutura do Banco de Dados

O banco de dados criado possui o nome:

```sql
Secure_Ship
```

As principais entidades são:

## Empresa

Armazena as empresas clientes que utilizam o sistema.

Campos principais:

- Nome Fantasia
- CNPJ
- Endereço
- Telefone
- Email

Relacionamentos:

- Uma empresa pode possuir diversos usuários.
- Uma empresa pode possuir diversos locais monitorados.

---

## Usuario

Responsável pelo cadastro dos usuários do sistema.

Cada usuário pertence a uma empresa e pode possuir um administrador responsável através de um relacionamento recursivo.

Campos principais:

- Nome
- Email
- CPF
- Telefone
- Senha
- Empresa
- Administrador

Relacionamentos:

- N:1 com Empresa
- Relacionamento recursivo com Usuario

---

## Localização

Representa os locais monitorados dentro da empresa.

Exemplos:

- Sala 01
- Contêiner A
- Armazém 02
- Câmara Fria

Relacionamentos:

- Pertence a uma Empresa
- Possui diversos sensores
- Possui diversas leituras

---

## Sensores

Armazena os sensores físicos instalados em cada local.

Cada sensor possui:

- Nome
- Tipo
- Local onde está instalado

Exemplos de tipos:

- Umidade
- Temperatura
- Luminosidade

---

## Leitura

Tabela responsável por armazenar os dados coletados pelos sensores.

Atualmente possui os campos:

- Temperatura
- Umidade
- Data/Hora da coleta

Cada leitura pertence a um local monitorado.

---

# Modelo de Relacionamento

```text
Empresa
   │
   ├──────────────┐
   │              │
Usuario      Localização
                 │
                 │
             Sensores
                 │
                 │
             Leitura
```

---

# Funcionalidades do Script

O script realiza automaticamente:

- Criação do banco de dados
- Criação das tabelas
- Definição das chaves primárias
- Definição das chaves estrangeiras
- Criação dos relacionamentos
- Inserção de dados iniciais para testes

---

# Como executar

1. Abra o MySQL Workbench ou outro cliente SQL compatível.
2. Execute o arquivo SQL presente neste repositório.
3. O banco `Secure_Ship` será criado automaticamente.
4. As tabelas e relacionamentos serão criados.
5. Alguns registros de exemplo serão inseridos automaticamente.

---

# Estrutura das Tabelas

| Tabela | Descrição |
|---------|-----------|
| Empresa | Cadastro das empresas clientes |
| Usuario | Usuários pertencentes às empresas |
| Localização | Locais monitorados |
| Sensores | Sensores instalados em cada local |
| Leitura | Histórico das medições coletadas |

---

# Dados de Teste

O script já insere dados de exemplo para facilitar os testes da aplicação, incluindo:

- Empresas
- Usuários

Esses registros podem ser alterados ou removidos conforme a necessidade do ambiente.

---

# Melhorias Futuras

Algumas funcionalidades já foram previstas no modelo, mas encontram-se comentadas no script para futuras implementações.

Entre elas:

- Tabela de parametrização de limites dos sensores
- Associação de limites às leituras
- Associação de limites aos locais monitorados
- Criptografia das senhas dos usuários
- Novos tipos de sensores
- Histórico de alertas
- Registro de eventos críticos
- Auditoria de alterações

---

# Objetivo do Banco

O modelo foi desenvolvido para fornecer uma base sólida para sistemas de monitoramento ambiental em contêineres de transporte, permitindo:

- Cadastro de empresas clientes;
- Gerenciamento de usuários;
- Organização dos locais monitorados;
- Cadastro dos sensores instalados;
- Armazenamento histórico das leituras de umidade e temperatura;
- Evolução futura para geração automática de alertas e análises ambientais.

---

# Licença

Este projeto foi desenvolvido para fins acadêmicos e pode ser adaptado conforme as necessidades da aplicação.