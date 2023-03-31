# 2 - Em um sistema web, cada usuário pode se inscrever em diversos eventos, cada
# evento possui até 3 prêmios que são distribuídos entre os usuários presentes.
# O sistema precisa guardar a informação sobre quem participou de cada evento e quem ganhou os prêmios.
# Modele um banco de dados capaz de suportar essas regras.

#Para suportar as regras descritas, podemos modelar o banco de dados com as seguintes tabelas:
#
# Tabela "Usuários":
# id (chave primária)
# nome
# email
# senha
#
# Tabela "Eventos":
# id (chave primária)
# nome
# data
# local
# prêmio1
# prêmio2
# prêmio3
#
# Tabela "Participação":
# id (chave primária)
# id_usuário (chave estrangeira referenciando a tabela "Usuários")
# id_evento (chave estrangeira referenciando a tabela "Eventos")

# Tabela "Ganhadores":
# id (chave primária)
# id_evento (chave estrangeira referenciando a tabela "Eventos")
# id_usuário (chave estrangeira referenciando a tabela "Usuários")
# prêmio (valor entre 1 e 3, indicando qual dos prêmios foi ganho)
#
# Essas tabelas permitem registrar informações sobre os usuários,
# eventos, participações e os ganhadores de cada evento e prêmio.
# Por exemplo, para saber quem participou