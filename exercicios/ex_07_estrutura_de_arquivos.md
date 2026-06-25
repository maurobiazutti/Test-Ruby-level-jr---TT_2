# 7. Estrutura de arquivos em Ruby on Rails

A estrutura padrão de um projeto Ruby on Rails segue o princípio de **Convention over Configuration** (Convenção sobre Configuração), ou seja, a organização dos arquivos segue padrões definidos pelo framework, reduzindo a necessidade de configurações manuais.

## Localização dos principais componentes

### Models
Os **models** devem ser armazenados na pasta:

```text
app/models
```

Eles são responsáveis pelas regras de negócio e pela interação com o banco de dados.

### Controllers
Os **controllers** devem ser armazenados na pasta:

```text
app/controllers
```

Eles recebem as requisições, executam a lógica necessária e definem qual resposta será enviada ao usuário.

### Views
As **views** devem ser armazenadas na pasta:

```text
app/views
```

Elas são responsáveis pela apresentação dos dados ao usuário.

## Como identificar qual controller gerencia uma view?

Por convenção, cada controller possui uma pasta correspondente dentro de `app/views`.

Por exemplo, o controller:

```ruby
class UsersController < ApplicationController
  def show
  end
end
```

possui suas views na pasta:

```text
app/views/users
```

A action `show` renderiza automaticamente a view:

```text
app/views/users/show.html.erb
```

Portanto, é possível identificar o controller responsável por uma view observando o nome da pasta em `app/views`, que normalmente corresponde ao nome do controller sem o sufixo `Controller`.# 7. Estrutura de arquivos em Ruby on Rails

A estrutura padrão de um projeto Ruby on Rails segue o princípio de **Convention over Configuration** (Convenção sobre Configuração), ou seja, a organização dos arquivos segue padrões definidos pelo framework, reduzindo a necessidade de configurações manuais.

## Localização dos principais componentes

### Models
Os **models** devem ser armazenados na pasta:

```text
app/models
```

Eles são responsáveis pelas regras de negócio e pela interação com o banco de dados.

### Controllers
Os **controllers** devem ser armazenados na pasta:

```text
app/controllers
```

Eles recebem as requisições, executam a lógica necessária e definem qual resposta será enviada ao usuário.

### Views
As **views** devem ser armazenadas na pasta:

```text
app/views
```

Elas são responsáveis pela apresentação dos dados ao usuário.

## Como identificar qual controller gerencia uma view?

Por convenção, cada controller possui uma pasta correspondente dentro de `app/views`.

Por exemplo, o controller:

```ruby
class UsersController < ApplicationController
  def show
  end
end
```

possui suas views na pasta:

```text
app/views/users
```

A action `show` renderiza automaticamente a view:

```text
app/views/users/show.html.erb
```

Portanto, é possível identificar o controller responsável por uma view observando o nome da pasta em `app/views`, que normalmente corresponde ao nome do controller sem o sufixo `Controller`.