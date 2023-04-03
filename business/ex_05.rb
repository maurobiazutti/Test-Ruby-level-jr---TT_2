#controller com o nome UsersController.
#método chamado find_user
class UsersController < ApplicationController
  def find_user
    # código para buscar um usuário específico
  end
end


#Rota
Rails.application.routes.draw do
  resources :users do
    get 'find_user', on: :collection
  end
end
