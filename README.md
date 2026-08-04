# Sistema de Cadastro

Aplicação web em Ruby on Rails para cadastro e gerenciamento de pessoas (nome, telefone, e-mail e CPF), com operações completas de CRUD (criar, listar, visualizar, editar e excluir).

## Tecnologias

- **Ruby** 3.4.8
- **Rails** 8.1
- **PostgreSQL** como banco de dados
- **Propshaft** (asset pipeline) + **Importmap**
- **Turbo** e **Stimulus** (Hotwire)
- **Solid Cache**, **Solid Queue** e **Solid Cable** (infraestrutura baseada em banco de dados, sem Redis)
- **Bootstrap Icons** na interface
- **Kamal** + **Docker** para deploy
- **RSpec**, **Minitest**, **Capybara** e **Selenium WebDriver** para testes

## Funcionalidades

- Cadastro de pessoas com os campos: nome, telefone, e-mail e CPF
- Validações de presença e unicidade (telefone, e-mail e CPF)
- Formatação automática de CPF no formulário
- Respostas em HTML e JSON (`resources :pessoas`)
- Internacionalização com `pt-BR` como idioma padrão
- Script de importação de pessoas a partir de um arquivo JSON (`importar.rb`)

## Pré-requisitos

- Ruby 3.4.8 (recomenda-se usar [rbenv](https://github.com/rbenv/rbenv) ou [asdf](https://asdf-vm.com/))
- PostgreSQL em execução localmente
- Bundler

## Instalação

1. Clone o repositório e instale as dependências:

   ```bash
   bundle install
   ```

2. Configure o acesso ao banco de dados em `config/database.yml` (usuário, senha, host e porta do PostgreSQL).

3. Crie e prepare o banco de dados:

   ```bash
   bin/rails db:create db:migrate
   ```

4. (Opcional) Popule o banco com os dados de exemplo:

   ```bash
   bin/rails db:seed
   ```

## Executando a aplicação

```bash
bin/rails server
```

A aplicação estará disponível em [http://localhost:3000/pessoas](http://localhost:3000/pessoas).

## Importando dados a partir de JSON

O arquivo `pessoas.json` contém um conjunto de registros que pode ser importado via console do Rails:

```bash
bin/rails runner importar.rb
```

## Testes

O projeto usa tanto Minitest (padrão do Rails) quanto RSpec/Capybara para testes de sistema:

```bash
bin/rails test        # testes com Minitest
bundle exec rspec     # testes com RSpec
```

## Qualidade e segurança

```bash
bin/rubocop            # padronização de código (Rubocop Omakase)
bin/brakeman            # análise estática de segurança
bundle exec bundler-audit  # auditoria de vulnerabilidades em gems
```

## Deploy

O deploy é feito via [Kamal](https://kamal-deploy.org), utilizando uma imagem Docker gerada a partir do `Dockerfile` na raiz do projeto. As configurações de deploy ficam em `.kamal/` e as variáveis sensíveis (como `RAILS_MASTER_KEY`) devem ser fornecidas via `config/master.key` ou variáveis de ambiente, nunca commitadas diretamente no repositório.

```bash
bin/kamal deploy
```
