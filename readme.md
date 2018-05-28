# Projeto Loja Virtual

## Escopo do projeto:

Implementação de uma Loja Virtual de exemplo utilizando PHP/laravel + Mysql + Redis + ElasticSearch + VueJs + Docker <3

O frontend loja foi desenvolvido no formato de SPA (Single page application) utilizando o Vue.Js como framework base.

Os dados do frontend são alimentados por uma API escrita em PHP + Laravel, a qual se encontra em http://localhost/api

Para efeitos de performance, o Redis foi utilizado para cache das queries de select.

O Redis também foi utilizado para ser o armazenamento do carrinho de compras dos clientes.

O Elasticsearch foi utilizado como indexação para uma busca mais eficiente na loja.

Docker para facilitar o desenvolvimento e execução do exemplo. Os arquivos do docker são uma simplificação do Laradock.

## Como executar: 
Testado no Ubuntu 18.04 e docker 18.03

0. sudo sysctl -w vm.max_map_count=262144    (foi necessário para exectar o elasticsearch)
1. git clone https://github.com/luccas641/teste-mini-loja.git projetoLuccas
2. cd projetoLuccas/docker
3. docker-compose build
4. docker-compose up nginx mysql redis elasticsearch workspace
5. docker exec -it docker_workspace_1 composer install
6. aguardar o elasticsearch terminar de carregar.
7. acessar http://localhost/api/index     (essa chamada irá forçar a indexação do elasticsearch)
8. acessar http://localhost               (Precisa ser localhost. Está hardcoded no frontend. É possivel alterar e recompilar o frontend)

O BD inicial deve ser carregado automaticamente pelo docker do Mysql, mas caso tenha algum problema, o SQL se encontra em docker/mysql/docker-entrypoint-initdb.d/createdb.sql

## Containers extras:
O phpmyadmin e o kibana também estão disponíveis no docker-compose caso necessário.

## Frontend
O frontend em VueJs já está compilado no repositorio. Mas caso faça alguma alteração e percise recompilar:

1. docker exec -it docker_workspace_1 bash   
2. npm install
3. npm run dev

### Usuário cadastrado:
email: luccas641@gmail.com

senha: 895623

Alguns produtos e categorias também estão cadastrados. 