# 📝 Sistema de Inscrição e Sorteio de Eventos

Este projeto é um sistema web desenvolvido em **Ruby on Rails** focado no gerenciamento de inscrições, controle de presença e distribuição de prêmios para usuários participantes de eventos.

---

## 🛠️ Regras de Negócio Implementadas

O banco de dados e as camadas de modelo foram desenhados para atender estritamente às seguintes regras descritas no desafio técnico:

1. **Inscrições Múltiplas:** Um usuário pode se inscrever em diversos eventos, e um evento pode ter múltiplos usuários inscritos.
2. **Controle de Presença:** O sistema diferencia usuários apenas *inscritos* de usuários efetivamente *presentes* no dia do evento.
3. **Limite de Premiação:** Cada evento possui um limite rígido de **até 3 prêmios**.
4. **Restrição do Sorteio:** Os prêmios só podem ser distribuídos entre os usuários que marcaram **presença** no evento.

---

## 📐 Modelagem do Banco de Dados (Domínio)

Para suportar as regras de forma performática e blindar a integridade dos dados, a estrutura foi dividida em 4 entidades principais utilizando o padrão `has_many :through`:

* **`User`**: Armazena as informações dos usuários (`name`, `email`).
* **`Event`**: Armazena os dados do evento (`title`, `date`).
* **`EventParticipation`**: Tabela intermediária (*Rich Join Table*) que une `User` e `Event`. Possui o atributo booleano `present` para gerenciar o momento do check-in.
* **`Prize`**: Armazena os prêmios vinculados ao evento (`title`) e possui uma chave estrangeira opcional `winner_id` apontando para a tabela de usuários (`User`), permitindo o cadastro prévio do prêmio antes do sorteio.

---

## 🛡️ Validações e Integridade (Camada Model)

A inteligência das regras de negócio foi centralizada nos modelos do Active Record, garantindo segurança na consistência dos dados tanto via interface quanto via console ou API:

* **`EventParticipation`**: Possui uma validação de unicidade escopada (`validates :user_id, uniqueness: { scope: :event_id }`) que impede duplicidade de inscrição de um mesmo usuário no mesmo evento.
* **`Prize` (Limite por Evento)**: Uma validação customizada impede que um evento tenha mais de 3 prêmios cadastrados. Esta regra roda especificamente no callback `on: :create` para não travar atualizações futuras (como a inserção do ganhador).
* **`Prize` (Ganhador Elegível)**: Uma validação customizada impede que um prêmio seja salvo caso o `winner_id` informado pertença a um usuário ausente (`present: false`) ou não inscrito naquele evento específico.

---

## 🚀 Como Executar o Projeto

Siga os passos abaixo para rodar e testar a aplicação localmente:

### 1. Clonar o repositório e instalar dependências
```bash
bundle install
```

### 2. Preparar o banco de dados
Execute as migrations para criar a estrutura de tabelas:
```bash
rails db:migrate
```

### 3. Alimentar o banco de dados (Seed)
O projeto conta com um script de seed inteligente que limpa os dados antigos, gera 10 usuários, 3 eventos, distribui participações aleatórias com presenças alternadas e realiza o sorteio automático dos prêmios respeitando todas as regras de negócio.

```bash
rails db:seed
```

### 4. Iniciar o servidor Rails
```bash
rails server
```

### 5. Acessar o Painel do Evento
Abra o seu navegador e acesse a rota passando o ID de um evento gerado pelo seed para visualizar o painel estruturado (com a listagem de prêmios, ganhadores e separação visual de usuários presentes/ausentes):

```text
http://localhost:3000/events/1
```

## 🧪 Validando no Rails Console

Caso queira testar o comportamento das validações de erro diretamente no terminal do Rails (rails console):

```ruby
# Tentando dar um prêmio para um usuário ausente (Vai falhar)
evento = Event.first
usuario_ausente = evento.users.where(event_participations: { present: false }).first
premio = evento.prizes.first

premio.winner = usuario_ausente
premio.save # => retorna false
premio.errors.full_messages # => ["Ganhador deve estar presente no evento para ganhar o prêmio."]
```