  
#### Tecnologias:

- Ruby 2.6.3
- Rails 5.2.3
- Base de dados em Sqlite3;
- Bootstrap 4
- VueJs
- SqLite


##### Interface

Layout baseado no bootstrap. Com base em projeto aberto: Git - [BlackrockDigital/startbootstrap-sb-admin-2](https://github.com/BlackrockDigital/startbootstrap-sb-admin-2)


#### Especificações Tabelas do sistema

##### Diagrama Base dados (ER)

![ER!](/assets/er.png)

##### Sistema

##### Home

Página principal listagem das listas de presentes. Pode se ter N listas.

![ER!](/assets/tela_home.png)


##### Pesquisa de produtos

Seleção dos produtos para lista. Apresenta opções de filtragem dos produtos por categoria e descrição.

 
Pesquisa por categoria

![ER!](/assets/tela_pesquisa_produtos.png)

Listagem dos produtos

![ER!](/assets/pesquisa_produtos_2.png)

* Ao selecionar o produto automaticamente o mesmo será adicionado a lista;

 
#### Executar o sistema

1 - Instalar dependências

``` bundle install ```

2 - Executar migração da base de dados

``` rails db:migrate``` 

3 - Carregar seeds

``` rails db:seed ``` 

4 - Rodar projeto

```  rails s ``` 

  
#### Pontos de melhorias e evoluções

- Adicionar i18e para traduções;
- Desenvolver testes unitários;
- Ajustar css paginação tela listagem dos produtos;
- Trazer na pesquisa dos produtos a quantidade já selecionada anteriormente;
