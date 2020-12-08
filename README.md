# WEB2020
Repositório para a disciplina de Desenvolvimento Web 1 - UFSCar 2020 ENPE




### Pré Requisitos

Java, Tomcat, Maven, MySQL

#### Instalação do Banco
Antes de fazer deploy e executar o projeto deve-se criar o Banco e suas tabelas. Dentro do diretório do projeto executar no terminal o script create.sql
```
source db/MySQL/create.sql
```
O BANCO UTILIZA SENHA 'PASSWORD', altere a classe GenericDAO se necessário.

### Execução
compilar:
  No diretório do projeto executar no temrinal
```
mvn compile
```
### Deploy
```
mvn tomcat7:deploy
```



