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
