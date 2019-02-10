# README

Organization Chart API é uma API rest json de organograma de empresas construída
em Rails.

## Pré-requisitos

- Ruby 2.6.0

## Clone o projeto

```
git clone git@github.com:lidimayra/organization-chart-api.git
cd organization-chart-api
```

## Instale as dependências

```
bundle install
```

## Execute as migrações do banco de dados

```
rake db:create && rake db:migrate
```

## Suba o servidor

```
rails s
```

## Endpoints disponíveis

|Path|Verbo|Descrição|
|---|------|----------|
|v1/companies|GET|Retorna a lista de empresas registradas|
|v1/companies/:id|GET|Retorna os dados da empresa|
|v1/companies|POST|Cria uma nova empresa|
|v1/companies/:company_id/employees|GET|Retorna a lista de colaboradores registrados em uma empresa|
|v1/companies/companies_id/employees|POST|Cria um colaborador associado à empresa
|v1/companies/companies_id/employees/:id|DELETE|Deleta o colaborador
|v1/employees/:employer_id/managees|GET|Retorna a lista de colaboradores diretos liderados por um gestor
|v1/employees/:employer_id/second_level_managees|GET|Retorna a lista dos liderados dos liderados de um colaborador (Segundo nível)
|v1/employees/:employer_id/siblings|GET|Retorna a lista dos pares de um colaborador
