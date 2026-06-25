=begin
6- Usando Ruby on Rails, cite pelo menos uma forma de criar uma rota para um método 
chamado find_user dentro de um controller com o nome UsersController.
=end


#controller com o nome UsersController.
#método chamado find_user
class UsersController < ApplicationController
  def find_user
    # código para buscar um usuário específico
  end
end


# config/routes.rb
Rails.application.routes.draw do
  get "find_user", to: "users#find_user"
end
