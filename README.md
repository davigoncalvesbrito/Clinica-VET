# VET-DEV

VET-DEV é uma aplicação backend desenvolvida para gerenciar dados veterinários, utilizando Ruby on Rails. O sistema fornece uma API robusta documentada com Swagger, facilitando a interação e o desenvolvimento de clientes.

## Funcionalidades

- Gerenciamento de usuários
- Autenticação e geração de tokens
- API documentada com Swagger
- Rotas seguras e validadas

## Pré-requisitos

Certifique-se de ter os seguintes softwares instalados:

- [Ruby](https://www.ruby-lang.org/) (versão 3.0 ou superior)
- [Ruby on Rails](https://rubyonrails.org/) (versão 7 ou superior)
- [PostgreSQL](https://www.postgresql.org/)

## Instalação

1. Clone este repositório:

   ```bash
   git clone https://github.com/seu-usuario/vet-dev.git
   cd vet-dev
   ```

2. Instale as dependências:

   ```bash
   bundle install
   ```

3. Configure o arquivo `.env` com as credenciais do seu banco de dados e outras variáveis de ambiente necessárias. Um exemplo de configuração:

   ```env
   DB_HOST=seu_host
   DB_USER=seu_usuario
   DB_PASS=sua_senha
   DB_NAME=seu_banco
   DB_PORT=5432
   SECRET_KEY_BASE=sua_chave_secreta
   ```

4. Crie e configure o banco de dados:

   ```bash
   rails db:create db:migrate
   ```

## Executando a Aplicação

1. Inicie o servidor:

   ```bash
   rails server
   ```

2. Acesse a documentação da API no Swagger através da rota:

   [http://localhost:3000/swagger-ui/](http://localhost:3000/swagger-ui/)

## Scripts Disponíveis

- `rails server`: Inicia o servidor.
- `rails db:migrate`: Executa as migrações do banco de dados.
- `rails console`: Abre o console interativo do Rails.

## Estrutura de Pastas

```
vet-dev/
├── app/
│   ├── controllers/
│   ├── models/
│   ├── views/
│   ├── helpers/
│   └── jobs/
├── config/
├── db/
├── public/
├── test/
├── Gemfile
├── Rakefile
├── README.md
└── ...
```

## Tecnologias Utilizadas

- Ruby on Rails
- PostgreSQL
- Swagger

## Contribuindo

Contribuições são bem-vindas! Siga os passos abaixo para contribuir:

1. Faça um fork deste repositório.
2. Crie uma branch com a sua feature:

   ```bash
   git checkout -b minha-feature
   ```

3. Commit suas mudanças:

   ```bash
   git commit -m 'Adiciona minha nova feature'
   ```

4. Faça um push para a sua branch:

   ```bash
   git push origin minha-feature
   ```

5. Abra um Pull Request.

## Licença

Este projeto está sob a licença [MIT](LICENSE).
